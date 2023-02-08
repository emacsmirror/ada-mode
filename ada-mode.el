;;; ada-mode.el --- major-mode for editing Ada sources  -*- lexical-binding:t -*-
;;
;; Copyright (C) 1994, 1995, 1997 - 2023  Free Software Foundation, Inc.
;;
;; Author: Stephen Leake <stephen_leake@stephe-leake.org>
;; Maintainer: Stephen Leake <stephen_leake@stephe-leake.org>
;; Keywords: languages
;;  ada
;; Version: 8.0.5
;; package-requires: ((uniquify-files "1.0.4") (wisi "4.2.2") (gnat-compiler "1.0.2") (emacs "25.3"))
;; url: https://www.nongnu.org/ada-mode/
;;
;; This file is part of GNU Emacs.
;;
;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.
;;
;;; Usage:
;;
;; Emacs should enter Ada mode automatically when you load an Ada
;; file, based on the file extension.  The default extensions for Ada
;; files are .ads, .adb; use ada-add-extensions to add other
;; extensions.
;;
;; By default, ada-mode is configured to take full advantage of the
;; GNAT compiler.  If you are using another compiler, you
;; should load that compiler's ada-* file first.
;;
;; See the user guide (info "ada-mode"), built from ada-mode.texi.

;;; Design:
;;
;; In order to support multiple compilers, and different compilers for
;; different projects, we use cl-defgeneric function calls for all
;; operations that depend on the compiler.  The user variable
;; `ada-compiler' selects which compiler to use; it can be overridden
;; by the "ada_compiler" setting in project files.
;;
;; We also support a cross reference backend (also called xref
;; backend) that is different from the compiler. For example, you can
;; use a local GNAT compiler to generate and access cross-reference
;; information, while using a cross-compiler for compiling the final
;; executable. The user variable `ada-xref-backend' selects the xref
;; backend; it can be overridden by the "xref_backend" setting in
;; project files.
;;
;; The indentation engine and skeleton backends are from the wisi
;; package.
;;
;;; History:
;;
;; The first Ada mode for GNU Emacs was written by V. Broman in
;; 1985. He based his work on the already existing Modula-2 mode.
;; This was distributed as ada.el in versions of Emacs prior to 19.29.
;;
;; Lynn Slater wrote an extensive Ada mode in 1989. It consisted of
;; several files with support for dired commands and other nice
;; things.
;;
;; The probably very first Ada mode (called electric-ada.el) was
;; written by Steven D. Litvintchouk and Steven M. Rosen for the
;; Gosling Emacs. L. Slater based his development on ada.el and
;; electric-ada.el.
;;
;; A complete rewrite by Rolf Ebert <ebert@inf.enst.fr> and Markus
;; Heritsch <Markus.Heritsch@studbox.uni-stuttgart.de> was done at
;; some point.  Some ideas from the Ada mode mailing list have been
;; added.  Some of the functionality of L. Slater's mode has not (yet)
;; been recoded in this new mode.
;;
;; A complete rewrite for Emacs-20 / GNAT-3.11 was done by Emmanuel
;; Briot <briot@gnat.com> at Ada Core Technologies.
;;
;; A complete rewrite, to restructure the code more orthogonally, and
;; to use wisi for the indentation engine, was done in 2012 - 2013 by
;; Stephen Leake <stephen_leake@stephe-leake.org>.
;;
;; Another major refactoring, to use cl-defgeneric dispatching, was
;; done in 2019 by Stephen Leake.

;;; Credits:
;;
;;   Many thanks to John McCabe <john@assen.demon.co.uk> for sending so
;;     many patches included in this package.
;;   Christian Egli <Christian.Egli@hcsd.hac.com>:
;;     ada-imenu-generic-expression
;;   Many thanks also to the following persons that have contributed
;;   to the ada-mode
;;     Philippe Waroquiers (PW) <philippe@cfmu.eurocontrol.be> in particular,
;;     woodruff@stc.llnl.gov (John Woodruff)
;;     jj@ddci.dk (Jesper Joergensen)
;;     gse@ocsystems.com (Scott Evans)
;;     comar@gnat.com (Cyrille Comar)
;;     robin-reply@reagans.org
;;    and others for their valuable hints.

(require 'ada-core)
(require 'ada-indent-user-options)
(require 'ada_annex_p-process)
(require 'ada-skel)
(require 'align)
(require 'cl-lib)
(require 'compile)
(require 'find-file)
(require 'wisi)

(defun ada-mode-version ()
  "Return Ada mode version."
  (interactive)
  (let ((version-string "8.0.5"))
    (if (called-interactively-p 'interactive)
	(message version-string)
      version-string)))

;;;;; User variables

(defcustom ada-fill-comment-prefix "-- "
  "Comment fill prefix."
  :group 'ada
  :type 'string)
(make-variable-buffer-local 'ada-fill-comment-prefix)

(defcustom ada-fill-comment-postfix " --"
  "Comment fill postfix."
  :group 'ada
  :type 'string)
(make-variable-buffer-local 'ada-fill-comment-postfix)

(defcustom ada-fill-comment-adaptive nil
  "If non-nil, comments are filled to the same width (not including indentation),
rather than to the same column."
  :group 'ada
  :type 'boolean
  :safe #'booleanp)

(defcustom ada-which-func-parse-size 30000
  "Minimum size of region around point parsed for `which-function-mode'."
  :group 'ada
  :type 'integer
  :safe #'integerp)

(defcustom ada-xref-full-path nil
  "If t, cross-references show the full path to source files; if
nil, only the file name."
  :group 'ada
  :type 'boolean
  :safe #'booleanp)

;;;; keymaps and menus

(defvar ada-mode-map
  (let ((map (make-sparse-keymap)))
    ;; C-c <letter> are reserved for users

    ;; global-map has C-x ` 'next-error
    (define-key map [return] 	 'wisi-case-adjust-interactive)
    (define-key map "\C-c`" 	 'gnat-show-secondary-error)
    (define-key map "\C-c;"      (lambda () (error "use M-; instead"))) ; comment-dwim
    (define-key map "\C-c\M-`" 	 'wisi-fix-compiler-error)
    (define-key map "\C-c\C-a" 	 'ada-align)
    (define-key map "\C-c\C-b" 	 'ada-make-subprogram-body)
    (define-key map "\C-c\C-c"   'ada-build-make)
    (define-key map "\C-c\C-e" 	 'wisi-skel-expand)
    (define-key map "\C-c\C-f" 	 'wisi-show-parse-error)
    (define-key map "\C-\M-i"    'completion-at-point)
    (define-key map "\C-c\C-m"   'ada-build-set-make)
    (define-key map "\C-c\M-n" 	 'wisi-skel-next-placeholder)
    (define-key map "\C-c\C-o" 	 'ada-find-other-file)
    (define-key map "\C-c\M-p" 	 'wisi-skel-prev-placeholder)
    (define-key map "\C-c\C-q" 	 'wisi-refresh-prj-cache)
    (define-key map "\C-c\C-r" 	 'wisi-show-references)
    (define-key map "\C-c\M-r" 	 'ada-build-run)
    (define-key map "\C-c\C-s"   'pop-global-mark)
    (define-key map "\C-c\C-t" 	 'ada-find-file)
    (define-key map "\C-c\C-v"   'ada-build-check)
    (define-key map "\C-c\C-w" 	 'wisi-case-adjust-at-point)
    (define-key map "\C-c\C-y" 	 'wisi-case-create-exception)
    (define-key map "\C-c\C-\M-y" 'wisi-case-create-partial-exception)
    (define-key map [C-down-mouse-3] 'ada-popup-menu)

    (define-key map "\C-cr1" 'ada-refactor-1)
    (define-key map "\C-cr2" 'ada-refactor-2)
    (define-key map "\C-cr3" 'ada-refactor-3)
    (define-key map "\C-cr4" 'ada-refactor-4)
    (wisi-case-activate-keys map)

    map)
  "Local keymap used for Ada mode.")

(defvar ada-mode-menu (make-sparse-keymap "Ada"))
(easy-menu-define ada-mode-menu ada-mode-map "Menu keymap for Ada mode"
  '("Ada"
    ("Help"
     ["Ada Mode"             (info "ada-mode") t]
     ["Ada Reference Manual" (info "arm2012") t]
     ["Key bindings"         describe-bindings t]
     )
    ["Customize"                  (customize-group 'ada)    t]
    ("Project files"
     ["Find and select project ..."   ada-build-prompt-select-prj-file t]
     ["Show project"                  wisi-prj-show 		       t]
     ["Show project file search path" wisi-prj-show-prj-path 	       t]
     ["Show source file search path"  wisi-prj-show-src-path 	       t]
     ["Clear current project"         wisi-prj-clear-current 	       t]
    )
    ("Build"
     ["Next compilation error/xref"  next-error 	      t]
     ["Show secondary error"         gnat-show-secondary-error t]
     ["Fix compilation error"        wisi-fix-compiler-error  t]
     ["Show last parse error"        wisi-show-parse-error    t]
     ["Check syntax"                 ada-build-check 	      t]
     ["Show main"                    ada-build-show-main      t]
     ["Build"                        ada-build-make 	      t]
     ["Set main and Build"           ada-build-set-make       t]
     ["Run"                          ada-build-run 	      t]
     )
    ("Navigate"
     ["Other file"                    ada-find-other-file        t]
     ["Find file in project"          project-find-file          t]
     ["Show all references (classwide)" xref-find-references     t]
     ["Show all direct references"      wisi-show-references     t]
     ["Goto prev position current buffer" pop-to-mark-command 	 t]
     ["Goto prev position other buffer"   pop-global-mark 	 t]
     ["Next placeholder"              wisi-skel-next-placeholder t]
     ["Previous placeholder"          wisi-skel-prev-placeholder t]
     )
    ("Edit"
     ["Complete name at point"      completion-at-point     t]
     ["Expand skeleton"             wisi-skel-expand        t]
     ["Indent line or selection"    indent-for-tab-command  t]
     ["Indent current statement"    wisi-indent-statement   wisi-parser-shared]
     ["Indent containing statement" wisi-indent-containing-statement        wisi-parser-shared]
     ["Indent file"            (indent-region (point-min) (point-max)) 	    t]
     ["Align"                       ada-align 				    t]
     ["Comment/uncomment selection" comment-dwim 			    t]
     ["Fill comment paragraph"         ada-fill-comment-paragraph 	    t]
     ["Fill comment paragraph justify" (ada-fill-comment-paragraph 'full)   t]
     ["Fill comment paragraph postfix" (ada-fill-comment-paragraph 'full t) t]
     ["Make body for subprogram"    ada-make-subprogram-body                wisi-parser-shared]
     )
    ("Refactor"
     ["Method (Object) => Object.Method"   ada-refactor-1 wisi-parser-shared]
     ["Object.Method   => Method (Object)" ada-refactor-2 wisi-parser-shared]
     ["Element (Object, Index) => Object (Index)" ada-refactor-3 wisi-parser-shared]
     ["Object (Index) => Element (Object, Index)" ada-refactor-4 wisi-parser-shared]
     )
    ("Casing"
     ["Create full exception"       wisi-case-create-exception t]
     ["Create partial exception"    wisi-case-create-partial-exception t]
     ["Adjust case at point"        wisi-case-adjust-at-point  t]
     ["Adjust case region"          wisi-case-adjust-region    t]
     ["Adjust case buffer"          wisi-case-adjust-buffer    t]
     ["Show casing files list"      wisi-case-show-files       t]
     )
    ("Misc"
     ["Show last parse error"         wisi-show-parse-error       wisi-parser-shared]
     ["Refresh cross reference cache" wisi-refresh-prj-cache      (wisi-prj-p (project-current))]
     ["Restart parser"                wisi-kill-parser            wisi-parser-shared]
     )))

(defvar ada--statement-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-c<" 	 'ada-goto-declaration-start)
    (define-key map "\C-c>" 	 'ada-goto-declaration-end)
    (define-key map "\C-c\C-i" 	 'wisi-indent-statement)
    (define-key map [3 backtab] 'wisi-indent-containing-statement);; C-c backtab, translated from C-c S-tab
    (define-key map "\C-c\C-n" 	 'forward-sexp)
    (define-key map "\C-c\C-p" 	 'backward-sexp)

    map)
  "Local keymap used for Ada statement motion minor mode.")

(defvar ada--statement-minor-mode-menu (make-sparse-keymap "Ada statement motion"))
(easy-menu-define ada--statement-minor-mode-menu ada--statement-minor-mode-map
  "Menu keymap for Ada statement motion minor mode"
  '("Ada statement motion"
    ["Goto next statement keyword"   forward-sexp 			     wisi-parser-shared]
    ["Goto prev statement keyword"   backward-sexp 			     wisi-parser-shared]
    ["Goto subprogram/package start" ada-goto-declaration-start 	     wisi-parser-shared]
    ["Goto subprogram/package end"   ada-goto-declaration-end 		     wisi-parser-shared]
    ["Goto declarative region start" ada-goto-declarative-region-start      wisi-parser-shared]
    ["Goto containing statement start" wisi-goto-containing-statement-start wisi-parser-shared]
    ))

(defvar ada--gpr-query-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-c\C-d" 	 'wisi-goto-spec/body) ;; uses xref backend
    (define-key map "\C-c\M-d" 	 'wisi-show-declaration-parents)
    (define-key map "\C-c\C-l" 	 'wisi-show-local-references)
    (define-key map "\C-c\C-x"   'wisi-show-overriding)
    (define-key map "\C-c\M-x"   'wisi-show-overridden)
    map)
  "Local keymap used for gpr query minor mode.")

(defvar ada--gpr-query-minor-mode-menu (make-sparse-keymap "gpr-query"))
(easy-menu-define gpr-query-menu ada--gpr-query-minor-mode-map "Menu keymap for gpr-query minor mode"
  '("gpr-query"
    ["Goto declaration/body"    wisi-goto-spec/body           t]
    ["Show parent declarations" wisi-show-declaration-parents t]
    ["Show local references"    wisi-show-local-references    t]
    ["Show overriding"          wisi-show-overriding          t]
    ["Show overridden"          wisi-show-overridden          t]
    ))

(easy-menu-define ada-context-menu nil
  "Context menu keymap for Ada mode"
  '("Ada"
    ["Goto declaration/body"         wisi-goto-spec-body         wisi-parser-shared]
    ["Goto next statement keyword"   forward-sexp   wisi-parser-shared]
    ["Goto prev statement keyword"   backward-sexp   wisi-parser-shared]
    ["Goto declarative region start" ada-goto-declarative-region-start   wisi-parser-shared]
    ["Goto containing statement start" wisi-goto-containing-statement-start wisi-parser-shared]
    ["Goto subprogram/package start" ada-goto-declaration-start    wisi-parser-shared]
    ["Goto subprogram/package end"   ada-goto-declaration-end      wisi-parser-shared]
    ["Show parent declarations"      wisi-show-declaration-parents (eq ada-xref-backend 'gpr_query)]
    ["Show references"               wisi-show-references          (eq ada-xref-backend 'gpr_query)]
    ["Show overriding"               wisi-show-overriding          (eq ada-xref-backend 'gpr_query)]
    ["Show overridden"               wisi-show-overridden          (eq ada-xref-backend 'gpr_query)]

    ["-"                nil nil]

    ["Align"			      ada-align                  t]
    ["Comment/uncomment selection"    comment-dwim               t]
    ["Fill comment paragraph"	      ada-fill-comment-paragraph           (wisi-in-comment-p)]
    ["Fill comment paragraph justify" (ada-fill-comment-paragraph 'full)   (wisi-in-comment-p)]
    ["Fill comment paragraph postfix" (ada-fill-comment-paragraph 'full t) (wisi-in-comment-p)]
    ["Adjust case at point"	      wisi-case-adjust-at-point             (not (use-region-p))]
    ["Adjust case region"	      wisi-case-adjust-region               (use-region-p)]
    ["Create full case exception"     wisi-case-create-exception         t]
    ["Create partial case exception"  wisi-case-create-partial-exception t]
    ["Indent current statement"	      wisi-indent-statement             wisi-parser-shared]
    ["Expand skeleton"		      wisi-skel-expand                  t]
    ["Make body for subprogram"	      ada-make-subprogram-body          wisi-parser-shared]
    ))

(defun ada-popup-menu ()
  "Pops up `ada-context-menu'.
When a function from the menu is called, point is where the mouse
button was clicked."
  (interactive)
  (mouse-set-point last-input-event)
  (popup-menu ada-context-menu)
  )

(easy-menu-define ada-refactor-menu nil
  "Context menu keymap for Ada mode refactor commands."
  '("Ada refactor"
    ["Method (Object) => Object.Method"   ada-refactor-1 t]
    ["Object.Method   => Method (Object)" ada-refactor-2 t]
    ["Element (Object, Index) => Object (Index)" ada-refactor-3 t]
    ["Object (Index) => Element (Object, Index)" ada-refactor-4 t]
    ))

(defun ada-refactor-menu-popup ()
  "Pops up `ada-refactor-menu'."
  (interactive)
  (mouse-set-point last-input-event)
  (popup-menu ada-refactor-menu))

;;;; abbrev, align

(defvar ada-mode-abbrev-table nil
  "Local abbrev table for Ada mode.")

(defvar ada-align-rules
  '((ada-declaration-assign
     (regexp  . "[^:]\\(\\s-*\\)\\(:\\)[^:]")
     (valid   . (lambda () (ada-align-valid)))
     (repeat . t)
     (modes   . '(ada-mode)))
    (ada-associate
     (regexp  . "[^=]\\(\\s-*\\)\\(=>\\)")
     (valid   . (lambda () (ada-align-valid)))
     (modes   . '(ada-mode)))
    (ada-comment
     (regexp  . "\\(\\s-*\\)--")
     (valid   . (lambda () (ada-align-valid)))
     (modes   . '(ada-mode)))
    (ada-use
     (regexp  . "\\(\\s-*\\)\\<\\(use\\s-\\)")
     (valid   . (lambda () (ada-align-valid)))
     (modes   . '(ada-mode)))
    (ada-at
     (regexp . "\\(\\s-+\\)\\(at\\)\\_>")
     (valid   . (lambda () (ada-align-valid)))
     (modes . '(ada-mode))))
  "Rules to use to align different lines.")

(defun ada-align-valid ()
  "See use in `ada-align-rules'."
  (save-excursion
    ;; we don't put "when (match-beginning n)" here; missing a match
    ;; is a bug in the regexp.
    (goto-char (or (match-beginning 2) (match-beginning 1)))
    (not (wisi-in-string-or-comment-p))))

(defconst ada-align-region-separate
  (eval-when-compile
    (concat
     "^\\s-*\\($\\|\\("
     "begin\\|"
     "declare\\|"
     "else\\|"
     "end\\|"
     "exception\\|"
     "for\\|"
     "function\\|"
     "generic\\|"
     "if\\|"
     "is\\|"
     "procedure\\|"
     "private\\|"
     "record\\|"
     "return\\|"
     "type\\|"
     "when"
     "\\)\\_>\\)"))
  "See the variable `align-region-separate' for more information.")

;;;; syntax properties

(defvar ada-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; (info "(elisp)Syntax Class Table" "*info syntax class table*")
    ;; (info "(elisp) Syntax Flags") for comment start/end
    ;; make-syntax-table sets all alphanumeric to w, etc; so we only
    ;; have to add ada-specific things.

    ;; string brackets. `%' is the obsolete alternative string
    ;; bracket (arm J.2); if we make it syntax class ", it throws
    ;; font-lock and indentation off the track, so we use syntax class
    ;; $.
    (modify-syntax-entry ?%  "$" table)
    (modify-syntax-entry ?\" "\"" table)

    ;; punctuation; operators etc
    (modify-syntax-entry ?#  "." table); based number
    (modify-syntax-entry ?&  "." table)
    (modify-syntax-entry ?*  "." table)
    (modify-syntax-entry ?+  "." table)
    (modify-syntax-entry ?-  ". 12" table); double hyphen as comment start
    (modify-syntax-entry ?.  "." table)
    (modify-syntax-entry ?/  "." table)
    (modify-syntax-entry ?:  "." table)
    (modify-syntax-entry ?<  "." table)
    (modify-syntax-entry ?=  "." table)
    (modify-syntax-entry ?>  "." table)
    (modify-syntax-entry ?@  "." table)
    (modify-syntax-entry ?\' "." table); attribute; see ada-syntax-propertize for character literal
    (modify-syntax-entry ?\; "." table)
    (modify-syntax-entry ?\\ "." table); default is escape; not correct for Ada strings
    (modify-syntax-entry ?\| "." table)

    ;; \f and \n end a comment.
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
  "Syntax table to be used for editing Ada source code.")

(defun ada-syntax-propertize (start end)
  "For `syntax-propertize-function'.
Assign `syntax-table' properties in region START .. END.
In particular, character constants are set to have string syntax.
Runs `ada-syntax-propertize-hook'."
  ;; (info "(elisp)Syntax Properties")
  ;;
  ;; called from `syntax-propertize', inside save-excursion with-silent-modifications
  (goto-char start)
  (while (re-search-forward
	  (concat
	   "[^[:alnum:])]\\('\\)[^'\n]\\('\\)"; 1, 2: character literal, not attribute
	   "\\|[^[:alnum:])]\\('''\\)"; 3: character literal '''
	   )
	  end t)
    ;; syntax-propertize-extend-region-functions is set to
    ;; syntax-propertize-wholelines by default. We assume no
    ;; coding standard will permit a character literal at the
    ;; start of a line (not preceded by whitespace).
    (cond
     ((match-beginning 1)
      (put-text-property
       (match-beginning 1) (match-end 1) 'syntax-table '(7 . ?'))
      (put-text-property
       (match-beginning 2) (match-end 2) 'syntax-table '(7 . ?')))
     ((match-beginning 3)
      (put-text-property
       (match-beginning 3) (1+ (match-beginning 3)) 'syntax-table '(7 . ?'))
      (put-text-property
       (1- (match-end 3)) (match-end 3) 'syntax-table '(7 . ?')))
     ))
  (run-hook-with-args 'ada-syntax-propertize-hook start end))

;;;; navigation within and between files

(defvar ada-body-suffixes '(".adb")
  "List of possible suffixes for Ada body files.
The extensions should include a `.' if needed.")

(defvar ada-spec-suffixes '(".ads")
  "List of possible suffixes for Ada spec files.
The extensions should include a `.' if needed.")

(defvar ada-other-file-alist
  '(("\\.ads$" (".adb"))
    ("\\.adb$" (".ads")))
  "Alist used by `find-file' to find the name of the other package.
See `ff-other-file-alist'.")

(defconst ada-declaration-nonterms
  '(
    abstract_subprogram_declaration
    attribute_definition_clause
    entry_body
    entry_declaration
    expression_function_declaration
    exception_declaration
    full_type_declaration
    generic_instantiation
    generic_package_declaration
    generic_subprogram_declaration
    null_procedure_declaration
    number_declaration
    object_declaration
    object_renaming_declaration
    package_body
    package_declaration
    pragma_g
    private_extension_declaration
    private_type_declaration
    protected_body
    protected_type_declaration
    renaming_declaration
    single_protected_declaration
    single_task_declaration
    subprogram_body
    subprogram_body_stub
    subprogram_declaration
    subprogram_renaming_declaration
    subtype_declaration
    task_body
    task_type_declaration
    use_clause
    use_type_clause
    )
  "wisi-cache nonterminal symbols that are Ada declarations.")

(defconst ada-parent-name-regexp
  "\\([[:alnum:]_\\.]+\\)\\.[[:alnum:]_]+"
  "Regexp for extracting the parent name from fully-qualified name.")

(defun ada-ff-special-extract-parent ()
  (setq ff-function-name (match-string 1))
  (file-name-nondirectory
   (or
    (ff-get-file-name
     compilation-search-path
     (ada-file-name-from-ada-name ff-function-name)
     ada-spec-suffixes)
    (error "parent '%s' not found; set project file?" ff-function-name))))

(defun ada-ff-special-with ()
  (let ((package-name (match-string 1)))
    (setq ff-function-name (concat "^\\(function\\|procedure\\|package\\)\\s-+" package-name "\\([^_]\\|$\\)"))
    (file-name-nondirectory
     (or
      (ff-get-file-name
       compilation-search-path
       (ada-file-name-from-ada-name package-name)
       (append ada-spec-suffixes ada-body-suffixes))
      (error "package '%s' not found; set project file?" package-name)))
    ))

(defun ada-set-ff-special-constructs ()
  "Add Ada-specific pairs to `ff-special-constructs'."
  (set (make-local-variable 'ff-special-constructs) nil)
  (mapc (lambda (pair) (add-to-list 'ff-special-constructs pair))
	;; Each car is a regexp; if it matches at point, the cdr is invoked.
	;; Each cdr should set ff-function-name to a string or regexp
	;; for ada-set-point-accordingly, and return the file name
	;; (sans directory, must include suffix) to go to.
	(list
	 ;; Top level child package declaration (not body), or child
	 ;; subprogram declaration or body; go to the parent package.
	 (cons (concat "^\\(?:private[ \t]+\\)?\\(?:package\\|procedure\\|function\\)[ \t]+"
		       ada-parent-name-regexp "\\(?:;\\|[ \t]+\\|$\\)")
	       'ada-ff-special-extract-parent)

	 ;; A "with" clause. Note that it may refer to a procedure body, as well as a spec
	 (cons (concat "^\\(?:limited[ \t]+\\)?\\(?:private[ \t]+\\)?with[ \t]+" ada-name-regexp)
	       'ada-ff-special-with)
	 )))

(defun ada-which-function-1 (keyword add-body)
  "Used in `ada-which-function'."
  (let* ((result (wisi-next-name)))

    ;; See comment in ada-which-function on why we don't
    ;; overwrite ff-function-name.
    (when (not ff-function-name)
      (setq ff-function-name
	    (concat
	     keyword
	     (when add-body "\\s-+body")
	     "\\s-+"
	     result
	     "\\_>")))
    result))

(defun ada-which-function (&optional include-type)
  "Return name of subprogram/task/package containing point.
Also sets `ff-function-name' for `ff-pre-load-hook'."
  (interactive)
  ;; which-function-mode does not provide which-function to call
  ;; interactively!

  ;; Fail gracefully and silently, since this could be called from
  ;; which-function-mode.
  (cl-ecase ada-face-backend
    (wisi
     (cond
      (wisi-incremental-parse-enable
       (ada-validate-enclosing-declaration nil 'navigate))

      (t
       (wisi-validate-cache (max (point-min) (- (point) (/ ada-which-func-parse-size 2)))
			    (min (point-max) (+ (point) (/ ada-which-func-parse-size 2)))
			    nil
			    'navigate)
       ))

     (save-excursion
       (condition-case nil
	   (let ((result nil)
		 (cache (ada-goto-declaration-start-1 include-type)))
	     (if (null cache)
		 ;; bob or failed parse
		 (setq result "")

	       (when (memq (wisi-cache-nonterm cache)
			   '(generic_package_declaration generic_subprogram_declaration))
		 ;; name is after next statement keyword
		 (setq cache (wisi-next-statement-cache cache)))

	       ;; add or delete 'body' as needed
	       (cl-ecase (wisi-cache-nonterm cache)
		 ((entry_body entry_declaration)
		  (setq result (ada-which-function-1 "entry" nil)))

		 ((full_type_declaration private_type_declaration)
		  (setq result (ada-which-function-1 "type" nil)))

		 (package_body
		  (setq result (ada-which-function-1 "package" nil)))

		 ((package_declaration
		   package_specification) ;; after 'generic'
		  (setq result (ada-which-function-1 "package" t)))

		 (protected_body
		  (setq result (ada-which-function-1 "protected" nil)))

		 ((protected_type_declaration single_protected_declaration)
		  (setq result (ada-which-function-1 "protected" t)))

		 ((abstract_subprogram_declaration
		   expression_function_declaration
		   subprogram_declaration
		   subprogram_renaming_declaration
		   generic_subprogram_declaration ;; after 'generic'
		   null_procedure_declaration)
		  (setq result (ada-which-function-1
				(progn (search-forward-regexp "function\\|procedure")(match-string 0))
				nil))) ;; no 'body' keyword in subprogram bodies

		 ((subprogram_body subunit)
		  (setq result (ada-which-function-1
				(progn (search-forward-regexp "function\\|procedure")(match-string 0))
				nil)))

		 ((single_task_declaration task_type_declaration)
		  (setq result (ada-which-function-1 "task" t)))


		 (task_body
		  (setq result (ada-which-function-1 "task" nil)))
		 ))
	     (when (called-interactively-p 'interactive)
	       (message result))
	     result)
	 (error ""))))

    (eglot
     (if (eglot--server-capable :DocumentSymbol)
	(progn
	  ;; eglot/LSP maybe supports "which function" via DocumentSymbol, which
	  ;; ada_language_server version 22 does not support.
	  (display-warning 'ada "ada-mode which-function via eglot not yet implemented.")
	  "")
       "")
     )

    (none "")
    ))

(defun ada-add-log-current-function ()
  "For `add-log-current-defun-function'."
  ;; add-log-current-defun is typically called with point at the start
  ;; of an ediff change section, which is before the start of the
  ;; declaration of a new item. So go to the start of the current line
  ;; first
  (save-excursion
    (back-to-indentation)
    (ada-which-function t)))

(defun ada-on-context-clause ()
  "Return non-nil if point is on a context clause."
  (interactive)
  (and wisi-parser-shared
       (save-excursion
	 (let ((start-cache (wisi-goto-statement-start)))
	   (when start-cache
	     (memq (wisi-cache-nonterm (wisi-goto-statement-start)) '(use_clause with_clause))))
	 )))

(defun ada-goto-subunit-name ()
  "Return non-nil if the current buffer contains a subunit.
Also move point to the subunit name. If no subunit, leave point
alone, return nil."
  (interactive)
  (when wisi-parser-shared
    (wisi-validate-cache (point-min) (point-max) t 'navigate)

    (let (cache
	  (name-pos nil))
      (save-excursion
	;; move to top declaration
	(goto-char (point-min))
	(setq cache (or (wisi-get-cache (point))
			(wisi-forward-cache)))

	(when (eq (wisi-cache-nonterm cache) 'subunit)
	  (setq name-pos (car (wisi-next-name-region))))
	)
      (when name-pos
	(goto-char name-pos))
      )))

(defun ada-set-point-accordingly ()
  "Move to the string specified in `ff-function-name', which may be a regexp,
previously set by a file navigation command."
  (when ff-function-name
    (let ((done nil)
	  (found nil))
      (goto-char (point-min))
      ;; We are looking for an Ada declaration, so don't stop for strings or comments
      ;;
      ;; This will still be confused by multiple references; we need
      ;; to use compiler cross reference info for more precision.
      (while (not done)
	(if (search-forward-regexp ff-function-name nil t)
	    (setq found (match-beginning 0))
	  ;; not in remainder of buffer
	  (setq done t))
	(if (wisi-in-string-or-comment-p)
	    (setq found nil)
	  (setq done t)))
      (when found
	(goto-char found)
	(back-to-indentation))
      (setq ff-function-name nil))))

(defun ada-find-other-file ()
  "Move to the corresponding declaration in another file.

- If region is active, assume it contains a package name;
  position point on that package declaration.

- If point is in the start line of a non-nested child package or
  subprogram declaration, position point on the corresponding
  parent package specification.

- If point is in a context clause line, position point on the
  first package declaration that is mentioned.

- If point is in a separate body, position point on the
  corresponding specification.

- If point is in a subprogram body or specification, position point
  on the corresponding specification or body."

  ;; ff-get-file, ff-find-other file first process
  ;; ff-special-constructs, then run the following hooks:
  ;;
  ;; ff-pre-load-hook      set to ada-which-function
  ;; ff-file-created-hook  set to ada-ff-create-body
  ;; ff-post-load-hook     set to ada-set-point-accordingly,
  ;;                       or to a compiler-specific function that
  ;;                       uses compiler-generated cross reference
  ;;                       information

  (interactive)
  (wisi-check-current-project (buffer-file-name) #'ada-prj-default)

  ;; clear ff-function-name, so either ff-special-constructs or
  ;; ada-which-function will set it.
  (setq ff-function-name nil)

  (cond
   (mark-active
    (setq ff-function-name (buffer-substring-no-properties (point) (mark)))
    (ff-get-file
     compilation-search-path
     (ada-file-name-from-ada-name ff-function-name)
     ada-spec-suffixes
     nil);; other-window
    (deactivate-mark))

   ((and (not (ada-on-context-clause))
	 (ada-goto-subunit-name))
    (call-interactively 'wisi-goto-spec/body))

   (t
    (ff-find-other-file)))
  )

;;;; Misc

;; This is autoloaded because it may be used in ~/.emacs
;;;###autoload
(defun ada-add-extensions (spec body)
  "Define SPEC and BODY as being valid extensions for Ada files.
SPEC and BODY are two regular expressions that must match against
the file name."
  (let* ((reg (concat (regexp-quote body) "$"))
	 (tmp (assoc reg ada-other-file-alist)))
    (if tmp
	(setcdr tmp (list (cons spec (cadr tmp))))
      (add-to-list 'ada-other-file-alist (list reg (list spec)))))

  (let* ((reg (concat (regexp-quote spec) "$"))
	 (tmp (assoc reg ada-other-file-alist)))
    (if tmp
	(setcdr tmp (list (cons body (cadr tmp))))
      (add-to-list 'ada-other-file-alist (list reg (list body)))))

  (add-to-list 'auto-mode-alist
	       (cons (concat (regexp-quote spec) "\\'") 'ada-mode))
  (add-to-list 'auto-mode-alist
	       (cons (concat (regexp-quote body) "\\'") 'ada-mode))

  (add-to-list 'ada-spec-suffixes spec)
  (add-to-list 'ada-body-suffixes body)

  (when (fboundp 'speedbar-add-supported-extension)
    (speedbar-add-supported-extension spec)
    (speedbar-add-supported-extension body))
  )

(defun ada-goto-declaration-start-1 (include-type)
  "Subroutine of `ada-goto-declaration-start'."
  (let ((start (point))
	(cache (or (wisi-get-cache (point)) (wisi-backward-cache)))
	(done nil))
    ;; cache is null at bob
    (while (not done)
      (if cache
	  (progn
	    (setq done
		  (cl-case (wisi-cache-nonterm cache)
		    ((entry_body entry_declaration)
		     (eq (wisi-cache-token cache) 'ENTRY))

		    ((full_type_declaration private_type_declaration)
		     (when include-type
		       (eq (wisi-cache-token cache) 'TYPE)))

		    ((generic_package_declaration generic_subprogram_declaration)
		     (eq (wisi-cache-token cache) 'GENERIC))

		    ((package_body package_declaration)
		     (eq (wisi-cache-token cache) 'PACKAGE))

		    ((protected_body protected_type_declaration single_protected_declaration)
		     (eq (wisi-cache-token cache) 'PROTECTED))

		    ((abstract_subprogram_declaration
		      expression_function_declaration
		      null_procedure_declaration
		      subprogram_body
		      subprogram_declaration
		      subprogram_renaming_declaration
		      subunit)
		     (memq (wisi-cache-token cache) '(NOT OVERRIDING FUNCTION PROCEDURE)))

		    ((single_task_declaration task_body task_type_declaration)
		     (eq (wisi-cache-token cache) 'TASK))

		    ))
	    (unless (<= start (wisi-cache-end cache))
	      ;; found declaration does not include start; find containing one.
	      (setq done nil))
	    (unless done
	      (setq cache (wisi-goto-containing cache nil))))
	(setq done t))
	)
    cache))

(defun ada-goto-declaration-start (&optional include-type)
  "Move point to start of the generic, package, protected,
subprogram, or task declaration point is currently in or just
after.  For `beginning-of-defun-function'."
  (interactive)
  (unless wisi-parser-shared
    (user-error "goto-declaration-* not supported by this parser; add use clause manually"))
  (push-mark)
  (ada-validate-enclosing-declaration t 'navigate)
  (ada-goto-declaration-start-1 include-type))

(defun ada-goto-declaration-end ()
  "Move point to end of current declaration.
For `end-of-defun-function'."
  (interactive)
  ;; First goto-declaration-start, so we get the right end, not just
  ;; the current statement end.
  (wisi-goto-end-1 (ada-goto-declaration-start)))

;;;; fill-comment

(defun ada-fill-comment-paragraph (&optional justify postfix)
  "Fill the current comment paragraph.
If JUSTIFY is non-nil, each line is justified as well.
If POSTFIX and JUSTIFY are non-nil, `ada-fill-comment-postfix' is appended
to each line filled and justified.
The ident for the paragraph is taken from the first line."
  (interactive "P")
  (if (not (or (wisi-in-comment-p)
               (looking-at "[ \t]*--")))
      (error "Not inside comment"))

  ;; fill-region-as-paragraph leaves comment text exposed (without
  ;; comment prefix) when inserting a newline; don't trigger a parse
  ;; because of that (in particular, jit-lock requires a parse; other
  ;; hooks may as well).
  (let* ((wisi-inhibit-parse t)
	 indent from to
	 (opos (point-marker))
	 ;; we bind `fill-prefix' here rather than in ada-mode because
	 ;; setting it in ada-mode causes indent-region to use it for
	 ;; all indentation.
	 (fill-prefix ada-fill-comment-prefix)
	 (fill-column (if ada-fill-comment-adaptive
			  (save-excursion
			    (back-to-indentation)
			    (+ (current-column) fill-column))
			(current-fill-column))))

    ;;  Find end of comment paragraph
    (back-to-indentation)
    (while (and (not (eobp)) (looking-at ".*--[ \t]*[^ \t\n]"))
      (forward-line 1)

      ;;  If we were at the last line in the buffer, create a dummy empty
      ;;  line at the end of the buffer.
      (if (eobp)
	  (insert "\n")
	(back-to-indentation)))
    (beginning-of-line)
    (setq to (point-marker))
    (goto-char opos)

    ;;  Find beginning of paragraph
    (back-to-indentation)
    (while (and (not (bobp)) (looking-at ".*--[ \t]*[^ \t\n]"))
      (forward-line -1)
      (back-to-indentation))

    (unless (bobp)
      (forward-line 1))
    (beginning-of-line)
    (setq from (point-marker))

    ;;  Calculate the indentation we will need for the paragraph
    (back-to-indentation)
    (setq indent (current-column))
    ;;  unindent the first line of the paragraph
    (delete-region from (point))

    ;;  Remove the old postfixes
    (goto-char from)
    (while (re-search-forward (concat "\\(" ada-fill-comment-postfix "\\)" "\n") to t)
      (delete-region (match-beginning 1) (match-end 1)))

    (goto-char (1- to))
    (setq to (point-marker))

    ;;  Indent and justify the paragraph
    (set-left-margin from to indent)
    (if postfix
	(setq fill-column (- fill-column (length ada-fill-comment-postfix))))

    (fill-region-as-paragraph from to justify)

    ;;  Add the postfixes if required
    (if postfix
	(save-restriction
	  (goto-char from)
	  (narrow-to-region from to)
	  (while (not (eobp))
	    (end-of-line)
	    (insert-char ?  (- fill-column (current-column)))
	    (insert ada-fill-comment-postfix)
	    (forward-line))
	  ))

    (goto-char opos)))

;;;; support for font-lock.el

(defconst ada-keywords
  '(;; Ada 83:
    "abort" "abs" "accept" "access" "all" "and" "array" "at" "begin"
    "body" "case" "constant" "declare" "delay" "delta" "digits" "do"
    "else" "elsif" "end" "entry" "exception" "exit" "for" "function"
    "generic" "goto" "if" "in" "is" "limited" "loop" "mod" "new"
    "not" "null" "of" "or" "others" "out" "package" "pragma" "private"
    "procedure" "raise" "range" "record" "rem" "renames" "return"
    "reverse" "select" "separate" "subtype" "task" "terminate" "then"
    "type" "use" "when" "while" "with" "xor"
    ;; Ada 95:
    "abstract" "aliased" "protected" "requeue" "tagged" "until"
    ;; Ada 2001
    "interface" "overriding" "synchronized"
    ;; Ada 2012:
    "some"
    ;; Ada 2022:
    "parallel")
  "List of Ada keywords.")

(defun ada-font-lock-keywords ()
  "Return Ada mode value for `font-lock-keywords'."
   ;; Grammar actions set `font-lock-face' property for all
   ;; non-keyword tokens that need it.
  (list
   (list (concat "\\_<" (regexp-opt ada-keywords t) "\\_>") '(0 font-lock-keyword-face))
   ))

;;;; auto-case

(defcustom ada-auto-case t
  "When non-nil, automatically change case of preceding word while
typing.  Casing of Ada keywords is done according to `ada-case-keyword',
identifiers according to `ada-case-identifier'."
  :group 'ada
  :type  '(choice (const nil)
		  (const t))
  :safe  (lambda (val) (memq val '(nil t))))
(make-variable-buffer-local 'ada-auto-case)

(defcustom ada-case-keyword 'lower-case
  "Indicate how to adjust case for language keywords.
Value is one of lower-case, upper-case."
  :group 'ada
  :type '(choice (const lower-case)
		 (const upper-case))
  :safe #'symbolp)
(make-variable-buffer-local 'ada-case-keyword)

(defcustom ada-case-strict t
  "If non-nil, force Mixed_Case for identifiers.
Otherwise, allow UPPERCASE for identifiers."
  :group 'ada
  :type 'boolean
  :safe  #'booleanp)
(make-variable-buffer-local 'ada-case-strict)

(defcustom ada-case-identifier 'mixed-case
  "Indicates how to adjust the case of Ada keywords."
  :group 'ada
  :type '(choice (const mixed-case)
		 (const lower-case)
		 (const upper-case))
  :safe (lambda (val) (memq val '(mixed-case lower-case upper-case))))
(make-variable-buffer-local 'ada-case-identifier)

(defun ada-in-based-numeric-literal-p ()
  "Return t if point is after a prefix of a based numeric literal."
  (looking-back "\\([0-9]+#[0-9a-fA-F_]+\\)" (line-beginning-position)))

(defun ada-case-adjust-p (typed-char)
  "For `wisi-case-adjust-p-function'."
  (and
   ;; hex digits
   (not (ada-in-based-numeric-literal-p))

   ;; character literal
   (not (and (eq typed-char ?')
	     (eq (char-before (point)) ?')))
  ))

;;;; wisi integration

(defconst ada-wisi-language-protocol-version "4"
  "Defines language-specific parser parameters.
Must match wisi-ada.ads Language_Protocol_Version.")

(cl-defstruct (ada-wisi-parser (:include wisi-process--parser))
  ;; no new slots
  )

(cl-defmethod wisi-parse-format-language-options ((_parser ada-wisi-parser))
  ;; Must match code in wisi-ada.adb Initialize
  (format "%d %d %d %d %d %d %d %d %d %d %d %d %d"
	  ada-indent
	  ada-indent-broken
	  (if ada-indent-comment-col-0 1 0)
	  (if ada-indent-comment-gnat 1 0)
	  ada-indent-label
	  ada-indent-record-rel-type
	  ada-indent-renames
	  ada-indent-return
	  ada-indent-use
	  ada-indent-when
	  ada-indent-with
	  ada-indent-subprogram-is
	  (if ada-end-name-optional 1 0)
	  ))

(defconst ada-wisi-named-begin-regexp
  "\\(?:\\_<overriding\\_> +\\)?\\(?:\\_<function\\_>\\|\\_<package\\_>\\|\\_<procedure\\_>\\|\\_<task\\_>\\)"
  )

(defconst ada-wisi-partial-begin-regexp
  ;; We have to include 'begin' here; consider:
  ;;
  ;;
   ;;    end Copy_Node;
   ;; begin
   ;;    Destination.Leading_Non_Grammar;
   ;;
   ;; indenting 'Destination'. If we don't include 'begin', then
   ;; 'Destination' is indented ada-indent relative to 'end
   ;; Copy_Node', and there is no error to allow us to correct it.
   ;;
   ;; We'd like to include 'return' for extended return statement, but
   ;; that gets confused with 'return' in a function declaration or
   ;; non-extended return.

  (concat "\\_<begin\\_>\\|\\_<declare\\_>\\|"
	  ada-wisi-named-begin-regexp
	  "\\|\\_<end;\\|\\_<end " ada-name-regexp ";"))

(defconst ada-wisi-partial-end-regexp
  (concat ada-wisi-partial-begin-regexp
	  "\\|;"))

(defun ada-wisi-find-begin ()
  "Starting at current point, search backward for a parse start point."

  ;; There is a trade-off in deciding where to start parsing for indent. If we have:
  ;;
  ;; procedure ...
  ;; is
  ;;
  ;; and are inserting a new line after 'is', we need to include
  ;; 'is' in the parse to see the indent. On the other hand, if we
  ;; have:
  ;;
  ;;    ...
  ;;    end;
  ;; begin
  ;;    Foo;
  ;;
  ;; Inserting new line after 'Foo;'; if we include 'begin' but not
  ;; 'end;', there is no error (begin starts a statement), and the
  ;; indent is computed incorrectly, because it is assumed that the
  ;; line containing 'end;' is indented correctly.
  ;;
  ;; This is handled by the set of keywords in
  ;; ada-wisi-partial-begin-regexp.

  (cond
   ((wisi-search-backward-skip
     ada-wisi-partial-begin-regexp
     (lambda () (or (wisi-in-string-or-comment-p)
		    (looking-back "access " (line-beginning-position)))))
     ;; "access" rejects subprobram access parameters; test/ada_mode-recover_partial_20.adb

    (let ((found (match-string 0))
	  cache)
      (cond
       ((and (>= (length found) 3)
	     (string-equal "end" (substring found 0 3)))
	(match-end 0))

       (t
	(setq cache (wisi-get-cache (point)))
	(when cache
	  ;; This distinguishes 'begin' as a statement start from
	  ;; 'begin' following 'declare', 'procedure' etc.  We don't
	  ;; force a parse to get this; the user may choose to do so.
	  (wisi-goto-start cache))
	(point))
       )))

   (t
    (point-min))
   ))

(defun ada-wisi-find-end ()
  "Starting at current point, search forward for a reasonable parse end point."
  (forward-comment (point-max)) ;; get past any current comments
  (forward-line 1) ;; contain at least some code (see ada_mode-partial_parse.adb 'blank line before "end"')

  (let ((start (point))
	match
	(end-cand nil))

    (while (not end-cand)
      (if (search-forward-regexp ada-wisi-partial-end-regexp nil 1) ;; moves to eob if not found
	  (unless (or (wisi-in-string-or-comment-p)
		      (wisi-in-paren-p))
	    (setq match t)
	    (setq end-cand (point)))

	;; No reasonable end point found (maybe a missing right
	;; paren); return line after start for minimal parse, compute
	;; indent for line containing start.
	(setq match nil)
	(goto-char start)
	(setq end-cand (line-end-position 2)))
      )

    (when (and match
	       (not (string-equal ";" (match-string 0))))
      (setq end-cand (match-beginning 0)))

    end-cand))

(defun ada-wisi-find-matching-end ()
  "Starting at current point, search forward for a matching end.
Point must have been set by `ada-wisi-find-begin'."
  (let (end-regexp)
    ;; Point is at bol
    (back-to-indentation)
    (when (looking-at ada-wisi-named-begin-regexp)
      (goto-char (match-end 0))
      (skip-syntax-forward " ")
      (when (looking-at "body\\|type")
	(goto-char (match-end 0))
	(skip-syntax-forward " "))
      (setq end-regexp
	    (concat "end +"
		    (buffer-substring-no-properties
		     (point)
		     (progn
		       (skip-syntax-forward "w-._")
		       (point)))
		    ";"))
      (if (search-forward-regexp end-regexp nil t)
	  (progn
	    (while (and (wisi-in-string-or-comment-p)
			(search-forward-regexp end-regexp nil t)))
	    (point))

	;; matching end not found
	nil)
      )))

(cl-defmethod wisi-parse-expand-region ((_parser ada-wisi-parser) begin end)
  (let (begin-cand end-cand result)
    (save-excursion
      (goto-char begin)

      (setq begin-cand (ada-wisi-find-begin))
      (if (= begin-cand (point-min)) ;; No code between BEGIN and bob
	  (progn
	    (goto-char end)
	    (setq result (cons begin-cand (ada-wisi-find-end))))

	(setq end-cand (ada-wisi-find-matching-end))
	(if (and end-cand
		 (>= end-cand end))
	    (setq result (cons begin-cand end-cand))
	  (goto-char end)
	  (setq result (cons begin-cand (ada-wisi-find-end))))

	))
    result))

(cl-defmethod wisi-parse-adjust-indent ((_parser ada-wisi-parser) indent repair)
  (cond
   ((wisi-list-memq (wisi--parse-error-repair-inserted repair) '(BEGIN IF LOOP))
    ;; case 1:
    ;;        ...
    ;;     end;
    ;;  else
    ;;  declare
    ;;
    ;; Indenting 'declare'; parse begin after 'end;', recover inserted
    ;; 'if then' before 'else', so result is ada-indent relative to
    ;; 'end;', but we want 0 relative to end
    (- indent ada-indent))

   ((wisi-list-memq (wisi--parse-error-repair-deleted repair) '(END))
    ;; test/ada_mode-partial_parse.adb
    ;;
    ;;       B;
    ;;
    ;;    end
    ;;
    (cond
     ((= (point) (wisi--parse-error-repair-pos repair))
	;; Indenting the 'end' that was deleted.
      (- indent ada-indent))

     ((< (point) (wisi--parse-error-repair-pos repair))
      ;; indenting something else after "B;"
      (- indent (* 2 ada-indent)))

     (t ;; indenting something after 'end'; test/ada_mode-recover-partial_10.adb
      (- indent ada-indent))))

   ((equal '(CASE IDENTIFIER IS) (wisi--parse-error-repair-inserted repair))
    ;; test/ada_mode-partial_parse.adb
    ;;    end loop;
    ;;    ...
    ;; when Face =>
    ;;
    ;; indenting 'when', or the new blank line after 'when'. CASE
    ;; IDENTIFIER IS was inserted by error recover, immediately before
    ;; 'when'.
    (if (looking-at "when")
	(- indent ada-indent-when)
      (- indent (+ ada-indent ada-indent-when))))

   ((equal '(END CASE SEMICOLON) (wisi--parse-error-repair-inserted repair))
        (+ indent (+ ada-indent ada-indent-when)))

   (t indent)
   ))

(defun ada-wisi-comment-gnat (indent after)
  "Modify INDENT to match gnat rules. Return new indent.
INDENT must be indent computed by the normal indentation
algorithm.  AFTER indicates what is on the previous line; one of:

code:         blank line, or code with no trailing comment
code-comment: code with trailing comment
comment:      comment"
  (let (prev-indent next-indent)
    ;; the gnat comment indent style check; comments must
    ;; be aligned to one of:
    ;;
    ;; - multiple of ada-indent
    ;; - next non-blank line
    ;; - previous non-blank line
    ;;
    ;; Note that we must indent the prev and next lines, in case
    ;; they are not currently correct.
    (cond
     ((and (not (eq after 'comment))
	   (= 0 (% indent ada-indent)))
      ;; this will handle comments at bob and eob, so we don't
      ;; need to worry about those positions in the next checks.
      indent)

     ((and (setq prev-indent
		 (if (eq after 'comment)
		     (progn (forward-comment -1) (current-column))
		   (save-excursion (forward-line -1)(current-indentation))))
	   (= indent prev-indent))
      indent)

     ((and (setq next-indent
		 ;; we use forward-comment here, instead of
		 ;; forward-line, because consecutive comment
		 ;; lines are indented to the current one, which
		 ;; we don't know yet.
		 (save-excursion (forward-comment (point-max))(current-indentation)))
	   (= indent next-indent))
      indent)

     (t
      (cl-ecase after
	(code-comment
	 ;; After comment that follows code on the same line
	 ;; test/ada_mode-conditional_expressions.adb
	 ;;
	 ;; then 44     -- comment matching GNAT
	 ;;             -- second line
	 ;;
	 ;; else 45)); -- comment _not_ matching GNAT style check
	 ;;             -- comment matching GNAT
	 ;;
	 (+ indent (- ada-indent (% indent ada-indent))))

	((code comment)
	 ;; After code with no trailing comment, or after comment
	 ;; test/ada_mode-conditional_expressions.adb
	 ;; K2 : Integer := (if J > 42
	 ;;                  -- comment indent matching GNAT style check
	 ;;                  then
	 ;;
	 (max prev-indent next-indent))

	))
     )))

(defun ada-wisi-comment ()
  "Modify indentation of a comment:
For `wisi-indent-calculate-functions'.
- align to previous comment after code.
- respect `ada-indent-comment-gnat'."
  ;; We know we are at the first token on a line.
  ;;
  ;; The normal indentation algorithm has already indented the
  ;; comment.
  (when (and (not (eobp))
	     (string= comment-start (buffer-substring-no-properties (point) (min (point-max) (+ 2 (point))))))

    ;; We are looking at a comment; check for preceding comments, code
    (let (after
	  (indent (current-column)))
      (if (save-excursion (forward-line -1) (looking-at "\\s *$"))
	  ;; after blank line
	  (setq after 'code)

	(save-excursion
	  (forward-comment -1)
	  (if (or (not ada-indent-after-trailing-comment) ;; ignore comment on previous line
		  (looking-at "\\s *$"))                  ;; no comment on previous line
	      (setq after 'code)

	    (setq indent (current-column))
	    (if (not (= indent (progn (back-to-indentation) (current-column))))
		;; previous line has comment following code
		(setq after 'code-comment)
	      ;; previous line has plain comment
	      (setq indent (current-column))
	      (setq after 'comment)
	      )))
	)

      (cl-ecase after
	(code
	 (if ada-indent-comment-gnat
	     (ada-wisi-comment-gnat indent 'code)
	   indent))

	(comment
	 indent)

	(code-comment
	 (if ada-indent-comment-gnat
	     (ada-wisi-comment-gnat indent 'code-comment)

	   ;; After comment that follows code on the same line
	   ;; test/ada_mode-nominal.adb
	   ;;
	   ;; begin -- 2
	   ;;       --EMACSCMD:(progn (ada-goto-declarative-region-start)(looking-at "Bad_Thing"))
	   (save-excursion (forward-comment -1)(current-column)))
	 ))
      )))

(defun ada-wisi-post-indent-fail ()
  "For `wisi-post-indent-fail-hook'."
  (wisi-indent-statement)
  (back-to-indentation))

(defun ada-find-file ()
  "Find a file in the current project.
Prompts with completion, defaults to filename at point."
  (interactive)
  ;; In emacs 27, we can set project-read-file-name-function to
  ;; tell 'project-find-file to use the uniquify-files alist
  ;; completion table. In emacs 26, we must do that ourselves.
  (require 'project)
  (if (boundp 'project-read-file-name-function)
      (let ((project-read-file-name-function #'uniq-file-read))
        (project-find-file))

    (let* ((def (thing-at-point 'filename))
	   (project (project-current))
	   (all-files (project-files project nil))
	   (alist (uniq-file-uniquify all-files))
	   (table (apply-partially #'uniq-file-completion-table alist))
           (file (project--completing-read-strict
                  "Find file" table nil nil def)))
      (if (string= file "")
          (user-error "You didn't specify the file")
	(find-file (cdr (assoc file alist)))))
    ))

;;;; compatibility with previous ada-mode versions

;;;###autoload
(defun ada-fix-compiler-error ()
  (interactive)
  (wisi-fix-compiler-error))
(make-obsolete 'ada-fix-compiler-error 'wisi-fix-compiler-error "ada-mode 7.0.0")

(defun ada-select-prj-file-1 (prj-file)
;; avoid byte compiler warning about obsolete ada-select-prj-file
  (wisi-prj-select-cache
   prj-file
   (ada-prj-default
    (file-name-sans-extension (file-name-nondirectory prj-file))
    (file-name-directory prj-file)))

  ;; We set project-find-functions, xref-backend-functions here for
  ;; compatibility with ada-mode 6.x.
  (unless (wisi-prj-find-function-set-p)
    (add-hook 'project-find-functions #'wisi-prj-current-cached)
    (add-hook 'xref-backend-functions #'wisi-prj-xref-backend)))

;;;###autoload
(defun ada-parse-prj-file (prj-file)
  (ada-select-prj-file-1 prj-file))
(make-obsolete 'ada-parse-prj-file 'wisi-prj-select-cache "ada-mode 7.0.0")

;;;###autoload
(defun ada-select-prj-file (prj-file)
  (ada-select-prj-file-1 prj-file))
(make-obsolete 'ada-select-prj-file #'wisi-prj-select-cache "ada-mode 7.0.0")

;;;###autoload
(defalias 'ada-project-current #'wisi-prj-current-cached)
(make-obsolete 'ada-project-current #'wisi-prj-current-cached "ada-mode 7.0.0")

;;;; ada-mode

(defvar which-func-functions) ;; which-func.el
(defvar which-func-non-auto-modes) ;; ""

(defvar ada-other-backend-setup-function nil
  "When non-nil, called with no args from ada-mode if any of
`ada-face-backend',
`ada-indent-backend', `ada-xref-backend' are set to other.
See `ada-eglot-setup' in ada-eglot.el for a similar function.")

;;;###autoload
(cl-defun ada-parse-require-process (&key wait)
  "Start the Ada parser in an external process, if not already started.
Unless WAIT, does not wait for parser to respond. Returns the parser object."
  (interactive)
  (let ((parser (wisi-process-parse-get
		 (make-ada-wisi-parser
		  :label "Ada"
		  :language-protocol-version ada-wisi-language-protocol-version
		  :exec-file ada-process-parse-exec
		  :exec-opts ada-process-parse-exec-opts
		  :face-table ada_annex_p-process-face-table
		  :token-table ada_annex_p-process-token-table
		  :repair-image ada_annex_p-process-repair-image))))
    (wisi-parse-require-process parser :nowait (not wait))
    parser))

(define-minor-mode ada--statement-minor-mode
  "Minor mode enabling statement motion using the wisi parser."
  :lighter nil :interactive nil)

(define-minor-mode ada--gpr-query-minor-mode
  "Minor mode for enabling navigating sources gpr_query."
  :lighter nil :interactive nil)

;;;###autoload
(define-derived-mode ada-mode prog-mode "Ada"
  "The major mode for editing Ada code."
  :group 'ada

  (set (make-local-variable 'syntax-propertize-function) 'ada-syntax-propertize)

  (set (make-local-variable 'parse-sexp-ignore-comments) t)
  (set (make-local-variable 'parse-sexp-lookup-properties) t)
  (set 'case-fold-search t); Ada is case insensitive
  (set 'completion-ignore-case t)
  (set (make-local-variable 'comment-start) "--")
  (set (make-local-variable 'comment-end) "")
  (set (make-local-variable 'comment-start-skip) "---*[ \t]*")
  (set (make-local-variable 'comment-multi-line) nil)

  ;; we _don't_ set `fill-prefix' here because that causes
  ;; indent-region to use it for all indentation. See
  ;; ada-fill-comment-paragraph.

  (setq font-lock-defaults
	'(ada-font-lock-keywords ;; keywords
	  nil ;; keywords-only; font-lock does keywords, comment, string faces via regexp. parser does identifiers.
	  t ;; case-fold
	  )); treat underscore as a word component

  (set (make-local-variable 'ff-other-file-alist)
       'ada-other-file-alist)
  (setq ff-post-load-hook    #'ada-set-point-accordingly
	ff-file-created-hook #'ada-ff-create-body)
  (add-hook 'ff-pre-load-hook #'push-mark)
  (add-hook 'ff-pre-load-hook #'ada-which-function)
  (setq ff-search-directories 'compilation-search-path)
  (when (null (car compilation-search-path))
    ;; find-file doesn't handle nil in search path
    (setq compilation-search-path (list (if buffer-file-name
                                            (file-name-directory (buffer-file-name))
                                          "."))))
  (ada-set-ff-special-constructs)

  (set (make-local-variable 'add-log-current-defun-function)
       #'ada-add-log-current-function)

  ;; We set this even if which-func.el is not loaded, because if it is
  ;; loaded later, it will use the add-log which-function, which
  ;; forces a navigate parse.
  (add-hook 'which-func-functions #'ada-which-function nil t)
  (when (boundp 'which-func-non-auto-modes)
    (add-to-list 'which-func-non-auto-modes 'ada-mode))

  ;;  Support for align
  (add-to-list 'align-dq-string-modes 'ada-mode)
  (add-to-list 'align-open-comment-modes 'ada-mode)
  (set (make-local-variable 'align-region-separate) ada-align-region-separate)
  (set (make-local-variable 'align-indent-before-aligning) t)

  ;; Exclude comments alone on line from alignment.
  (add-to-list 'align-exclude-rules-list
	       '(ada-solo-comment
		 (regexp  . "^\\(\\s-*\\)--")
		 (modes   . '(ada-mode))))
  (add-to-list 'align-exclude-rules-list
	       '(ada-solo-use
		 (regexp  . "^\\(\\s-*\\)\\_<use\\_>")
		 (modes   . '(ada-mode))))

  (setq align-mode-rules-list ada-align-rules)

  (setq wisi-prj-parse-undefined-function #'ada-prj-parse-undefined)
  (setq wisi-xref-full-path ada-xref-full-path)

  ;; Startup cases:
  ;;
  ;; 1) Newbie or small project; no wisi project, no gpr
  ;; file. ada-*-background set by default from presence of als,
  ;; ada_mode_wisi_parse, gpr_query.  Start eglot in ada-mode,
  ;; ada-mode-hook, or ada-mode-post-local-vars.
  ;;
  ;; 2) ada-*-background set in dir-local vars or by default, wisi
  ;; project with or without gpr file declared via wisi-select-* in
  ;; dir-local vars. Start eglot in wisi-select-prj.
  ;;
  ;; 3) ada-*-background, wisi project declared in Makefile or
  ;; elsewhere before Ada files opened; start eglot in
  ;; wisi-select-prj.
  ;;
  ;; In order to accommodate 1 and 2, we call ada-eglot-setup and wisi-setup in
  ;; ada-mode-post-local-vars.
  (add-hook 'hack-local-variables-hook #'ada-mode-post-local-vars nil t)
  )

(defun ada-mode-post-local-vars ()
  ;; These are run after ada-mode-hook and file/dir local variables
  ;; because users or *.ad? files might set the relevant
  ;; variable inside the hook or local variables.

  ;; This means to fully set ada-mode interactively, user must
  ;; do M-x ada-mode M-; (hack-local-variables)

  (remove-hook 'hack-local-variables-hook #'ada-mode-post-local-vars)

  ;;; Handle variables that can easily be file-specific.

  ;; fill-region-as-paragraph in ada-fill-comment-paragraph does not
  ;; call syntax-propertize, so set comment syntax on
  ;; ada-fill-comment-prefix. In post-local because user may want to
  ;; set it per-file.
  (put-text-property 0 2 'syntax-table '(11 . nil) ada-fill-comment-prefix)

  (setq wisi-indent-comment-col-0 ada-indent-comment-col-0)

  (setq wisi-auto-case ada-auto-case)
  (setq wisi-case-identifier ada-case-identifier)
  (setq wisi-case-strict ada-case-strict)
  (setq wisi-language-keywords ada-keywords)
  (setq wisi-case-keyword ada-case-keyword)
  (setq wisi-case-adjust-p-function #'ada-case-adjust-p)

  ;;; See comment in ada-mode on startup cases for rationale on doing
  ;;; ada-eglot-setup here.

  (setq-local wisi-disable-parser nil)

  (when (or (eq ada-diagnostics-backend 'eglot)
	    (eq ada-face-backend        'eglot)
	    (eq ada-indent-backend      'eglot)
	    ;; ada-statement-backend cannot be 'eglot
	    (eq ada-xref-backend        'eglot))
    (require 'ada-eglot)
    (when (fboundp 'ada-eglot-setup)
      (ada-eglot-setup)))

  (when (or (eq ada-diagnostics-backend 'other)
	    (eq ada-face-backend        'other)
	    (eq ada-indent-backend      'other)
	    (eq ada-statement-backend   'other)
	    (eq ada-xref-backend        'other))
    (when ada-other-backend-setup-function
      (funcall ada-other-backend-setup-function)))

  ;; We want at least one warning for missing ada-process-parse-exec,
  ;; to give users a reminder to build/install it. But avoid that
  ;; warning for users using eglot; ada-eglot-setup sets
  ;; wisi-disable-parser if the wisi parser is not needed.
  ;;
  (unless wisi-disable-parser
    (unless (executable-find ada-process-parse-exec)
	(display-warning
	 'ada
	 (format "Ada parser exec '%s' not found; install it, or set ada-*-backend to eglot."
		 ada-process-parse-exec))
	(setq-local wisi-disable-parser t)))

  (when (eq ada-statement-backend 'wisi)
    (ada--statement-minor-mode))

  (when (eq ada-xref-backend 'gpr_query)
    (ada--gpr-query-minor-mode))

  ;; wisi-setup tolerates parser nil.
  (wisi-setup
   :indent-calculate '(ada-wisi-comment)
   :post-indent-fail 'ada-wisi-post-indent-fail
   :parser (unless wisi-disable-parser (ada-parse-require-process)))

  (when wisi-parser-shared
    (setq-local beginning-of-defun-function #'ada-goto-declaration-start)
    (setq-local end-of-defun-function #'ada-goto-declaration-end))

  )

(put 'ada-mode 'custom-mode-group 'ada)

;;;;; Global initializations

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.ad[abs]\\'" . ada-mode))

(when (featurep 'imenu)
  (require 'ada-imenu))

(provide 'ada-mode)
;;; ada-mode.el ends here
