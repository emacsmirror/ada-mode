;; gpr-mode --- Major mode for editing GNAT project files  -*- lexical-binding:t -*-

;; Copyright (C) 2004, 2007, 2008, 2012-2015, 2017, 2018, 2019  Free Software Foundation, Inc.

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

;; we reuse several ada-mode functions
(require 'ada-mode)
(require 'cl-lib)

(defgroup gpr nil
  "Major mode for editing gpr (Gnat Project File) source code in Emacs."
  :group 'languages)

(defcustom gpr-process-parse-exec "gpr_mode_wisi_parse.exe"
  "Name of executable to use for external process gpr parser,"
  :type 'string
  :group 'gpr)

(defvar gpr-mode-map
  (let ((map (make-sparse-keymap)))
    ;; C-c <letter> are reserved for users

    ;; global-map has C-x ` 'next-error
    (define-key map [return]   'ada-indent-newline-indent)
    (define-key map "\C-c`"    'ada-show-secondary-error)
    ;; comment-dwim is in global map on M-;
    (define-key map "\C-c\C-c" 'ada-build-make)
    (define-key map "\C-c\C-e" 'gpr-expand)
    (define-key map "\C-c\C-f" 'gpr-show-parse-error)
    (define-key map "\C-c\C-i" 'gpr-indent-statement)
    (define-key map "\C-c\C-o" 	 'ff-find-other-file)
    (define-key map "\C-c\C-P" 'gpr-set-as-project)
    (define-key map "\C-c\C-t" 'ada-case-read-all-exceptions)
    (define-key map "\C-c\C-w" 'ada-case-adjust-at-point)
    (define-key map "\C-c\C-y" 'ada-case-create-exception)
    (define-key map "\C-c\C-\M-y" 'ada-case-create-partial-exception)
    (define-key map "\M-n" 'skeleton-next-placeholder)
    (define-key map "\M-p" 'skeleton-prev-placeholder)
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

    ["Customize"     (customize-group 'ada)];; we reuse the Ada indentation options
    ["------"        nil nil]
    ["Build current project"       ada-build-make                   t]
    ["Find and select project ..." ada-build-prompt-select-prj-file t]
    ["Select project ..."          ada-prj-select                   t]
    ["Parse and select current file" gpr-set-as-project             t]
    ["Show current project"        ada-prj-show                     t]
    ["Show project search path"    ada-prj-show-prj-path            t]
    ["Next compilation error"      next-error                       t]
    ["Show secondary error"        ada-show-secondary-error         t]
    ["Show last parse error"       gpr-show-parse-error             t]
    ["Other file"                  ff-find-other-file               t]
    ("Edit"
     ["Indent Line or selection"      indent-for-tab-command         t]
     ["Indent current statement"      gpr-indent-statement           t]
     ["Indent Lines in File"          (indent-region (point-min) (point-max))  t]
     ["Expand skeleton"               gpr-expand                     t]
     ["Next skeleton placeholder"     skeleton-next-placeholder      t]
     ["Previous skeleton placeholder" skeleton-prev-placeholder      t]
     ["Comment/uncomment selection"   comment-dwim                   t]
     ["Fill Comment Paragraph"        fill-paragraph                 t]

     ["Fill Comment Paragraph Justify" ada-fill-comment-paragraph-justify t]
     ["Fill Comment Paragraph Postfix" ada-fill-comment-paragraph-postfix t]
     )
    ))

(defvar gpr-show-parse-error nil
  ;; Supplied by indentation engine parser
  "Function to show last error reported by indentation parser."
  )

(defun gpr-show-parse-error ()
  (interactive)
  (when gpr-show-parse-error
    (funcall gpr-show-parse-error)))

(defvar gpr-expand nil
  ;; skeleton function
  "Function to call to expand tokens (ie insert skeletons).")

(defun gpr-expand ()
  "Expand previous word into a statement skeleton."
  (interactive)
  (when gpr-expand
    (funcall gpr-expand)))

(defvar gpr-indent-statement nil
  ;; indentation function
  "Function to indent the statement/declaration point is in or after.
Function is called with no arguments.")

(defun gpr-indent-statement ()
  "Indent current statement."
  (interactive)
  (when gpr-indent-statement
    (funcall gpr-indent-statement)))

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
    "project"
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
  (ada-require-project-file)
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

(defvar gpr-which-function nil
  ;; supplied by the indentation engine
  "Function called with no parameters; it should return the name
of the package or project point is in or just after, or nil.")

(defun gpr-which-function ()
  "See `gpr-which-function' variable."
  (when gpr-which-function
    (funcall gpr-which-function)))

(defun gpr-add-log-current-function ()
  "For `add-log-current-defun-function'. Returns enclosing package or project name."
  ;; add-log-current-defun is typically called with point at the start
  ;; of an ediff change section, which is before the start of the
  ;; declaration of a new item. So go to the end of the current line
  ;; first
  (save-excursion
    (end-of-line 1)
    (gpr-which-function)))

(declare-function gpr-query-kill-all-sessions "gpr-query.el" nil)
(defun gpr-set-as-project (&optional file)
  "Set FILE (default current buffer file) as Emacs project file."
  (interactive)
  (save-some-buffers t)
  ;; Kill sessions to catch changed env vars
  (cl-ecase ada-xref-tool
    (gnat nil)
    (gpr_query (gpr-query-kill-all-sessions))
    )
  (ada-parse-prj-file (or file (buffer-file-name)))
  (ada-select-prj-file (or file (buffer-file-name))))

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
    (modify-syntax-entry ?&  "." table)
    (modify-syntax-entry ?. "." table)
    (modify-syntax-entry ?:  "." table)
    (modify-syntax-entry ?=  "." table)
    (modify-syntax-entry ?>  "." table)
    (modify-syntax-entry ?\; "." table)
    (modify-syntax-entry ?\\ "." table); default is escape; not correct for Ada strings
    (modify-syntax-entry ?\|  "." table)

    ;; and \f and \n end a comment
    (modify-syntax-entry ?\f  ">" table)
    (modify-syntax-entry ?\n  ">" table)

    (modify-syntax-entry ?_ "_" table); symbol constituents, not word.

    (modify-syntax-entry ?\( "()" table)
    (modify-syntax-entry ?\) ")(" table)

    ;; skeleton placeholder delimiters; see ada-skel.el. We use generic
    ;; comment delimiter class, not comment starter/comment ender, so
    ;; these can be distinguished from line end.
    (modify-syntax-entry ?{ "!" table)
    (modify-syntax-entry ?} "!" table)

    table
    )
  "Syntax table to be used for editing gpr source code.")

(defun gpr-syntax-propertize (start end)
  "Assign `syntax-table' properties in accessible part of buffer."
  ;; (info "(elisp)Syntax Properties")
  ;;
  ;; called from `syntax-propertize', inside save-excursion with-silent-modifications
  ;; syntax-propertize-extend-region-functions is set to
  ;; syntax-propertize-wholelines by default.
  (let ((inhibit-read-only t)
	(inhibit-point-motion-hooks t))
    (goto-char start)
    (save-match-data
      (while (re-search-forward "--" end t); comment start
	(put-text-property
	 (match-beginning 0) (match-end 0) 'syntax-table '(11 . nil)))
  )))

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
  (set (make-local-variable 'syntax-propertize-function) 'gpr-syntax-propertize)
  (when (boundp 'syntax-begin-function)
    ;; obsolete in emacs-25.1
    (set (make-local-variable 'syntax-begin-function) nil))
  (set 'case-fold-search t); gpr is case insensitive; the syntax parsing requires this setting
  (set (make-local-variable 'comment-start) "--")
  (set (make-local-variable 'comment-end) "")
  (set (make-local-variable 'comment-start-skip) "---*[ \t]*")
  (set (make-local-variable 'comment-multi-line) nil)

  (set (make-local-variable 'require-final-newline) t)

  (ada-case-activate-keys gpr-mode-map)
  (set (make-local-variable 'ada-keywords) gpr-keywords)

  (set (make-local-variable 'font-lock-defaults)
       '(gpr-font-lock-keywords
	 nil t
	 ((?\_ . "w"))))

  (gpr-set-ff-special-constructs)
  (setq ff-search-directories 'compilation-search-path);; includes project search path

  (set (make-local-variable 'add-log-current-defun-function)
       'gpr-add-log-current-function)

  (run-mode-hooks 'gpr-mode-hook)

  )

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.gpr\\'" . gpr-mode))  ; GNAT project files

(put 'gpr-mode 'custom-mode-group 'gpr)

(defvar gpr-parser nil
  "Indicate parser and lexer to use for gpr buffers:

elisp : wisi parser and lexer implemented in elisp.

process : wisi elisp lexer, external process parser specified
  by ‘gpr-process-parse-exec ’.
")

(provide 'gpr-mode)

(require 'gpr-wisi)

(cl-case gpr-parser
  (elisp nil)
  (process nil)
  (t
   (if (locate-file gpr-process-parse-exec exec-path '("" ".exe"))
       (setq gpr-parser 'process)
     (setq gpr-parser 'elisp)))
  )

(unless (featurep 'gpr-skeletons)
  (require 'gpr-skel))

;;; end of file
