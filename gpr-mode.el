;; gpr-mode --- Major mode for editing GNAT project files  -*- lexical-binding:t -*-

;; Copyright (C) 2004, 2007, 2008, 2012-2015, 2017 - 2020  Free Software Foundation, Inc.

;; Author: Stephen Leake <stephen_leake@member.fsf.org>
;; Maintainer: Stephen Leake <stephen_leake@member.fsf.org>

;; This file is part of GNU Emacs.

;; gpr-mode is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; gpr-mode is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.
;;
;;; Commentary:
;;
;;; History:
;;
;; The first gpr-mode was written by Rolf Ebert
;; <rolf.ebert_nosp...@gmx.net> in 2004.
;;
;; Stephen Leake <stephen_leake@member.fsf.org> rewrote it in 2013 to
;; use the wisi indentation engine.
;;
;;;;; Code:

(require 'cl-lib)
(require 'gnat-core)
(require 'gpr-indent-user-options)
(require 'gpr-process)
(require 'gpr-skel)
(require 'wisi-process-parse)
(require 'wisi-prj)

(defgroup gpr nil
  "Major mode for editing gpr (Gnat Project File) source code in Emacs."
  :group 'languages)

(defvar gpr-mode-map
  (let ((map (make-sparse-keymap)))
    ;; C-c <letter> are reserved for users

    ;; global-map has C-x ` 'next-error
    (define-key map [return]   'wisi-indent-newline-indent)
    ;; comment-dwim is in global map on M-;
    (define-key map "\C-c\C-e" 'wisi-skel-expand)
    (define-key map "\C-c\C-f" 'wisi-show-parse-error)
    (define-key map "\C-c\C-i" 'wisi-indent-statement)
    (define-key map "\C-c\C-o" 'ff-find-other-file)
    (define-key map "\C-c\C-P" 'gpr-set-as-project)
    (define-key map "\C-c\C-w" 'wisi-case-adjust-at-point)
    (define-key map "\C-c\C-y" 'wisi-case-create-exception)
    (define-key map "\C-c\C-\M-y" 'wisi-case-create-partial-exception)
    (define-key map "\M-n" 'wisi-skel-next-placeholder)
    (define-key map "\M-p" 'wisi-skel-prev-placeholder)

    (wisi-case-activate-keys map)

    map
  )  "Local keymap used for GPR mode.")

(defvar gpr-mode-menu (make-sparse-keymap "gpr"))
(easy-menu-define gpr-mode-menu gpr-mode-map "Menu keymap for gpr mode"
  '("gpr"
    ("Help"
     ["gpr Mode"              (info "gpr-mode") t]
     ["GNAT Reference Manual" (info "gnat_rm") t]
     ["GNAT User Guide"       (info "gnat_ugn") t]
     ["Key bindings"          describe-bindings t]
     )

    ["Customize"     (customize-group 'gpr)]
    ["------"        nil nil]
    ["Show current project"        wisi-prj-show                    t]
    ["Show project search path"    wisi-prj-show-prj-path           t]
    ["Next compilation error"      next-error                       t]
    ["Show last parse error"       wisi-show-parse-error            t]
    ["Other file"                  ff-find-other-file               t]
    ("Edit"
     ["Indent Line or selection"      indent-for-tab-command         t]
     ["Indent current statement"      wisi-indent-statement          t]
     ["Indent Lines in File"          (indent-region (point-min) (point-max))  t]
     ["Expand skeleton"               wisi-skel-expand               t]
     ["Next skeleton placeholder"     wisi-skel-next-placeholder     t]
     ["Previous skeleton placeholder" wisi-skel-prev-placeholder     t]
     ["Comment/uncomment selection"   comment-dwim                   t]
     ["Fill Comment Paragraph"        fill-paragraph                 t]
     )
    ))

(defconst gpr-keywords
  '(
    "abstract"
    "aggregate"
    "at"
    "case"
    "configuration"
    "end"
    "extends"
    "external"
    "external_as_list"
    "for"
    "is"
    "library"
    "limited"
    "null"
    "others"
    "package"
    ;; "project" may also be a non-keyword attribute prefix; see test/gpr/gds.gpr
    "renames"
    "standard"
    "type"
    "use"
    "when"
    "with"
    )
  "List of gpr mode keywords for font-lock and auto-casing.")

(defvar gpr-font-lock-keywords
  ;; Grammar actions set `font-lock-face' property for all
  ;; non-keyword tokens that need it.
  (list
   (list (concat "\\<" (regexp-opt gpr-keywords t) "\\>") '(0 font-lock-keyword-face)))
  "Expressions to highlight in gpr mode.")

(defun gpr-ff-special-with ()
  (let ((project-path (match-string 1)))
    ;; project-path may be any of "foo", "foo.gpr", "../foo.gpr"
    ;;
    ;; The result of ff-special-constructs is used by
    ;; ff-find-the-other-file with ff-search-directories and nil
    ;; suffix list, so it must contain the relative path and the
    ;; suffix
    (if (file-name-extension project-path)
	project-path
      (concat project-path ".gpr"))
    ))

(defun gpr-set-ff-special-constructs ()
  "Add gpr-specific pairs to `ff-special-constructs'."
  (set (make-local-variable 'ff-special-constructs) nil)
  (mapc (lambda (pair) (add-to-list 'ff-special-constructs pair))
	;; Each car is a regexp; if it matches at point, the cdr is
	;; invoked.  Each cdr should return the absolute file name to
	;; go to.
	(list
	 ;; A "with" clause; allow "foo_bar.gpr" and "../foo"
	 (cons "^with[ \t]+\"\\(\\(?:\\(?:\\sw\\|\\s.\\)\\|\\s_\\)+\\)\";"
	       'gpr-ff-special-with)
	 )))

(defun gpr-which-function ()
  "Return the name of the package or project point is in or just after, or nil."
  (wisi-validate-cache (point-min) (point) nil 'navigate)
  ;; No message on parse fail, since this could be called from which-function-mode
  (when (wisi-cache-covers-pos 'navigate (point))
    (let ((cache (wisi-backward-cache))
	  done
	  project-pos
	  package-pos
	  decl-pos)
      (while (and cache (not done))
	;; find attribute_declaration and package containing point (if any)
	(cond
	 ((not (eq (wisi-cache-class cache) 'statement-start))
	  nil)

	 ((eq (wisi-cache-nonterm cache) 'attribute_declaration)
	  (setq decl-pos (point)))

	 ((eq (wisi-cache-nonterm cache) 'package_spec)
	  (setq package-pos (point))
	  (setq done t))

	 ((eq (wisi-cache-nonterm cache) 'simple_project_declaration)
	  (setq project-pos (point))
	  (setq done t))
	 )

	(setq cache (wisi-goto-containing cache)))

      (cond
       (package-pos
	(goto-char package-pos)
	(setq done t))

       (decl-pos
	(goto-char decl-pos)
	(setq done t))

       (project-pos
	(goto-char project-pos)
	(setq done t))

       (t ;; before project
	(setq done nil))
       )

      (when done
	(wisi-next-name))

      )))

(defun gpr-add-log-current-function ()
  "For `add-log-current-defun-function'. Returns enclosing package or project name."
  ;; add-log-current-defun is typically called with point at the start
  ;; of an ediff change section, which is before the start of the
  ;; declaration of a new item. So go to the end of the current line
  ;; first
  (save-excursion
    (end-of-line 1)
    (gpr-which-function)))

(defvar gpr-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; (info "(elisp)Syntax Class Table" "*info syntax class table*")
    ;; make-syntax-table sets all alphanumeric to w, etc; so we only
    ;; have to add gpr-specific things.

    ;; string brackets. `%' is the obsolete alternative string
    ;; bracket (arm J.2); if we make it syntax class ", it throws
    ;; font-lock and indentation off the track, so we use syntax class
    ;; $.
    (modify-syntax-entry ?%  "$" table)
    (modify-syntax-entry ?\" "\"" table)

    ;; punctuation; operators etc
    (modify-syntax-entry ?-  ". 124" table); operator, double hyphen as comment
    (modify-syntax-entry ?&  "." table)
    (modify-syntax-entry ?. "." table)
    (modify-syntax-entry ?:  "." table)
    (modify-syntax-entry ?=  "." table)
    (modify-syntax-entry ?>  "." table)
    (modify-syntax-entry ?\; "." table)
    (modify-syntax-entry ?\\ "." table); default is escape; not correct for gpr strings
    (modify-syntax-entry ?\|  "." table)

    ;; and \f and \n end a comment
    (modify-syntax-entry ?\f  ">" table)
    (modify-syntax-entry ?\n  ">" table)

    (modify-syntax-entry ?_ "_" table); symbol constituents, not word.

    (modify-syntax-entry ?\( "()" table)
    (modify-syntax-entry ?\) ")(" table)

    ;; skeleton placeholder delimiters; see gpr-skel.el. We use generic
    ;; comment delimiter class, not comment starter/comment ender, so
    ;; these can be distinguished from line end.
    (modify-syntax-entry ?{ "!" table)
    (modify-syntax-entry ?} "!" table)

    table
    )
  "Syntax table to be used for editing gpr source code.")

;;;; wisi integration

(defcustom gpr-auto-case t
  "When non-nil, automatically change case of preceding word while
typing.  Casing of gpr keywords is done according to `gpr-case-keyword',
identifiers according to `gpr-case-identifier'."
  :group 'gpr
  :type  '(choice (const nil)
		  (const t))
  :safe  (lambda (val) (memq val '(nil t))))
(make-variable-buffer-local 'gpr-auto-case)

(defcustom gpr-case-keyword 'lower-case
  "Indicate how to adjust case for language keywords.
Value is one of lower-case, upper-case."
  :group 'gpr
  :type '(choice (const lower-case)
		 (const upper-case))
  :safe #'symbolp)
(make-variable-buffer-local 'gpr-case-keyword)

(defcustom gpr-case-strict t
  "If non-nil, force Mixed_Case for identifiers.
Otherwise, allow UPPERCASE for identifiers."
  :group 'gpr
  :type 'boolean
  :safe  #'booleanp)
(make-variable-buffer-local 'gpr-case-strict)

(defcustom gpr-case-identifier 'mixed-case
  "Indicates how to adjust the case of gpr keywords."
  :group 'gpr
  :type '(choice (const mixed-case)
		 (const lower-case)
		 (const upper-case))
  ;; see comment on :safe at gpr-case-keyword
  :safe (lambda (val) (memq val '(mixed-case lower-case upper-case))))
(make-variable-buffer-local 'gpr-case-identifier)

(defun gpr-case-adjust-p (_typed-char)
  "For `wisi-case-adjust-p-function'."
  ;; casing of 'project' in "Project'Project_Dir" vs "project GDS is"
  (save-excursion
    (let ((end (1+ (point)))
	  (start (progn (skip-syntax-backward "w")(point))))
      (cond
       ((string= "project" (downcase (buffer-substring-no-properties start end)))
	(cond
	 ((null (char-after end)) ;; at eob
	  nil)
	 ((= (char-after end) ?') ;; attribute Project'
	  t)
	 ((= (char-after end) ? ) ;; keyword project GDS
	  (wisi-case-keyword start end)
	  nil)
	 ))

       (t t) ;; not "project"
       ))))

(cl-defstruct (gpr-wisi-parser (:include wisi-process--parser))
  ;; no new slots
  )

(cl-defstruct (gpr-prj (:include wisi-prj))
  ;; no new slots
  )

(defun gpr-prj-default (&optional name)
  (make-gpr-prj :name (or name "_default_") :compiler (make-gnat-compiler)))

(cl-defmethod wisi-prj-default ((prj gpr-prj))
  (gpr-prj-default (wisi-prj-name prj)))

(cl-defmethod wisi-parse-format-language-options ((_parser gpr-wisi-parser))
  (format "%d %d %d"
	  gpr-indent
	  gpr-indent-broken
	  gpr-indent-when
	  ))

(defconst gpr-wisi-language-protocol-version "1"
  "Defines language-specific parser parameters.
Must match wisi-gpr.ads Language_Protocol_Version.")

(defcustom gpr-process-parse-exec "gpr_mode_wisi_parse"
  "Name of executable to use for external process gpr parser,"
  :type 'string
  :group 'gpr)

(defun gpr-set-as-project ()
  "Set current buffer (a gpr file) as current project file."
  (interactive)
  (wisi-prj-dtrt-parse-file (buffer-file-name) (gpr-prj-default (buffer-file-name)) (buffer-file-name)))

;;;;
;;;###autoload
(defun gpr-mode ()
  "The major mode for editing GNAT project files."

  (interactive)
  (kill-all-local-variables)
  (setq major-mode 'gpr-mode)
  (setq mode-name "GNAT Project")
  (use-local-map gpr-mode-map)
  (set-syntax-table gpr-mode-syntax-table)
  (set 'case-fold-search t); gpr is case insensitive; the syntax parsing requires this setting
  (set (make-local-variable 'comment-start) "--")
  (set (make-local-variable 'comment-end) "")
  (set (make-local-variable 'comment-start-skip) "---*[ \t]*")
  (set (make-local-variable 'comment-multi-line) nil)

  (set (make-local-variable 'require-final-newline) t)

  (set (make-local-variable 'font-lock-defaults)
       '(gpr-font-lock-keywords
	 nil t
	 ((?\_ . "w"))))

  (gpr-set-ff-special-constructs)
  (setq ff-search-directories 'compilation-search-path);; includes project search path

  (set (make-local-variable 'add-log-current-defun-function)
       'gpr-add-log-current-function)

  (wisi-setup
   :indent-calculate nil
   :post-indent-fail nil
   :parser
   (wisi-process-parse-get
    (make-gpr-wisi-parser
     :label "gpr"
     :language-protocol-version gpr-wisi-language-protocol-version
     :exec-file gpr-process-parse-exec
     :face-table gpr-process-face-table
     :token-table gpr-process-token-table
     :repair-image gpr-process-repair-image
     )))

  (run-mode-hooks 'gpr-mode-hook)

  (setq wisi-auto-case gpr-auto-case)
  (setq wisi-case-identifier gpr-case-identifier)
  (setq wisi-case-strict gpr-case-strict)
  (setq wisi-language-keywords gpr-keywords)
  (setq wisi-case-keyword gpr-case-keyword)
  (setq wisi-case-adjust-p-function #'gpr-case-adjust-p)
  )

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.gpr\\'" . gpr-mode))  ; GNAT project files

(put 'gpr-mode 'custom-mode-group 'gpr)

(defvar gpr-parser 'process
  "Indicate parser and lexer to use for gpr buffers:

process : wisi elisp lexer, external process parser specified
  by ‘gpr-process-parse-exec ’.
")

(provide 'gpr-mode)
;;; gpr-mode.el ends here
