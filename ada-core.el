;;; ada-core.el --- core facilities for ada-mode -*- lexical-binding:t -*-

;; Copyright (C) 1994, 1995, 1997 - 2017, 2019 - 2023  Free Software Foundation, Inc.
;;
;; Author: Stephen Leake <stephen_leake@member.fsf.org>
;; Maintainer: Stephen Leake <stephen_leake@member.fsf.org>
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

(require 'compile)
(require 'find-file)
(require 'gnat-compiler)
(require 'uniquify-files)
(require 'wisi)
(require 'wisi-prj)

;;;; misc

(defgroup ada nil
  "Major mode for editing Ada source code in Emacs."
  :group 'languages)

(defcustom ada-fix-sort-context-clause t
  "*If non-nil, sort context clause when inserting `with'"
  :type 'boolean)

(defcustom ada-process-parse-exec "ada_mode_wisi_lr1_parse"
  "Name of executable to use for external process Ada parser.
There are two standard choices; ada_mode_wisi_lalr_parse and
ada_mode_wisi_lr1_parse. The LR1 version (the default) is
slower to load on first use, but gives better error recovery."
  :type 'string)

(defcustom ada-process-parse-exec-opts nil
  "List of process start options for `ada-process-parse-exec'."
  :type 'string)

;; We don't autoload ada-*-backend, because that would mean computing
;; the default value before the user has a chance to set variables
;; that affect it.
(defcustom ada-diagnostics-backend
  (cond
   ((locate-file ada-process-parse-exec exec-path '("" ".exe")) 'wisi)
   ((gnat-find-als nil t) 'eglot)
   (t 'none))
  "Diagnostics (syntax errors) backend to use for Ada."
  :type 'symbol
  :options '(none eglot wisi other))

(defcustom ada-face-backend
  (cond
   ((locate-file ada-process-parse-exec exec-path '("" ".exe")) 'wisi)
   ((gnat-find-als nil t) 'eglot)
   (t 'none))
  "Face backend to use for Ada."
  ;; Could be extended to tree-sitter, lsp-mode ...; use `other' for that.
  :type 'symbol
  :options '(none eglot wisi other))

(defcustom ada-indent-backend
  (cond
   ((locate-file ada-process-parse-exec exec-path '("" ".exe")) 'wisi)
   ((gnat-find-als nil t) 'eglot)
   (t 'none))
  "Indent backend to use for Ada."
  :type 'symbol
  :options '(none eglot wisi other))

(defcustom ada-statement-backend
  (cond
   ((locate-file ada-process-parse-exec exec-path '("" ".exe")) 'wisi)
   (t 'none))
  "Statement motion backend to use for Ada."
  :type 'symbol
  ;; LSP does not support this; need full access to the syntax tree.
  :options '(none wisi other))

(defcustom ada-eglot-gpr-file nil
  "Specify a gpr file to use, when not using a wisi project.
If the file requires setting GPR_PROJECT_PATH, use a wisi project
or set it globally."
  :type 'string
  :safe (lambda (val) (or (null val) (stringp val)))
  :group 'ada-mode)

(defconst ada-operator-re
  "\\+\\|-\\|/\\|\\*\\*\\|\\*\\|=\\|&\\|\\_<\\(abs\\|mod\\|rem\\|and\\|not\\|or\\|xor\\)\\_>\\|<=\\|<\\|>=\\|>"
  "Regexp matching Ada operator_symbol.")

(defconst ada-name-regexp
  "\\(\\(?:\\sw\\|[_.]\\)+\\)")

(defvar ada-compiler 'gnat
  "Default Ada compiler; can be overridden in project files.
Values defined by compiler packages.")

(defvar ada-syntax-propertize-hook nil
  "Hook run from `ada-syntax-propertize'.
Called by `syntax-propertize'.")

(defun ada-validate-enclosing-declaration (error-on-fail parse-action)
  "Call `wisi-validate-cache' on at least the declaration enclosing point."
  ;; Not in wisi because it's not clear other languages have useful
  ;; declarations, or they use other terms for them.
  (cond
   (wisi-incremental-parse-enable
    (let (query-result
	  (pos (point)))
      (while (not (and query-result
		       ;; package specs have no declarative_item
		       (memq (wisi-tree-node-id query-result) '(declarative_item wisitoken_accept))))
	(setq query-result (wisi-parse-tree-query wisi-parser-shared 'containing-statement pos))
	(setq pos (car (wisi-tree-node-char-region query-result))))

      (wisi-validate-cache (car (wisi-tree-node-char-region query-result))
			   (cdr (wisi-tree-node-char-region query-result))
			   error-on-fail
			   parse-action)))

   (t
    (wisi-validate-cache (point-min) (point-max) error-on-fail parse-action))))

(defun ada-goto-declarative-region-start ()
  "Goto start of declarative region containing point.
If in a statement, goto declarative region of the containing
declaration.  If already in a declaration at or before a
declarative region start, goto containing region start."
  (interactive)
  (unless wisi-parser-shared
    (user-error "ada-goto-declarative-region-start requires a syntax-tree"))

  (ada-validate-enclosing-declaration t 'navigate)
  (push-mark)

  (let ((done nil)
	(start-pos (point))
	(cache (or (wisi-get-cache (point))
		   (wisi-backward-cache))))

    ;; We use backward-cache, not forward-cache, to handle the case
    ;; where point is in the whitespace or comment before a block; we
    ;; want the containing block, not the next block.
    ;;
    ;; The typical use case for calling this function is to add a
    ;; use_clause for an identifier/operator at start-pos.

    (while (not done)
      (if (not cache) ;; nil at bob
	  (setq done t)

	(if (memq (wisi-cache-token cache) '(DECLARE IS PRIVATE))
	    ;; IS has a cache only if start of declarative region
	    (progn
	      (forward-word);; past 'is' or 'declare'.
	      (if (< (point) start-pos)
		  ;; found it.
		  (setq done t)

		;; else goto containing declarative-region-start
		;;
		;; test/ada_mode-nominal.adb function F2
		;;
		;; start-point is in a subprogram_declarator,
		;; formal_part, aspect_clause, etc; code that contains a
		;; declarative part. We want the next level up.
		(if (wisi-cache-containing cache)
		    (cl-ecase (wisi-cache-token cache)
		      (DECLARE
		       (setq cache (wisi-goto-containing cache)))

		      ((IS PRIVATE)
		       (setq cache (wisi-goto-containing cache)) ;; start of current declaration
		       (setq cache (wisi-goto-containing cache)))
		      )

		  ;; else there is no next level up; stop here
		  ;; (probably in a context_clause).
		  (setq done t))))

	  ;; else keep searching.
	  (cl-case (wisi-cache-class cache)
	    (motion
	     (setq cache (wisi-goto-containing cache)));; statement-start

	    (statement-end
	     (setq cache (wisi-goto-containing cache)) ;; statement-start
	     (cl-case (wisi-cache-nonterm cache)
	       ((generic_package_declaration
		 package_declaration
		 entry_body package_body package_declaration protected_body subprogram_body task_body
		 protected_type_declaration single_protected_declaration single_task_declaration task_type_declaration)
		;; This is a block scope before the starting point; we want the containing scope
		(setq cache (wisi-goto-containing cache)))

	       (t
		nil)
	       ))

	    (statement-start
	     (cl-case (wisi-cache-nonterm cache)
	       (generic_package_declaration
		(setq cache (wisi-next-statement-cache cache)) ;; 'package'
		(setq cache (wisi-next-statement-cache cache)) ;; 'is'

		(when (< start-pos (point))
		  (wisi-goto-start cache)
		  (setq cache (wisi-backward-cache))))

	       (package_declaration
		(setq cache (wisi-next-statement-cache cache)) ;; 'is'

		(when (< start-pos (point))
		  (wisi-goto-start cache)
		  (setq cache (wisi-backward-cache))))

	       ((entry_body package_body protected_body subprogram_body task_body)
		(while (not (eq 'IS (wisi-cache-token cache)))
		  (setq cache (wisi-next-statement-cache cache)))

		(when (< start-pos (point))
		  (wisi-goto-start cache)
                  (ada-validate-enclosing-declaration t 'navigate)
		  (setq cache (wisi-backward-cache))))

	       ((protected_type_declaration single_protected_declaration single_task_declaration task_type_declaration)
		(while (not (eq 'IS (wisi-cache-token cache)))
		  (setq cache (wisi-next-statement-cache cache)))
		(when (looking-at "\\<new\\>")
		  (while (not (eq 'WITH (wisi-cache-token cache)))
		    (setq cache (wisi-next-statement-cache cache))))

		(when (< start-pos (point))
		  (wisi-goto-start cache)
		  (setq cache (wisi-backward-cache))))

	       (t
		(setq cache (wisi-goto-containing cache t)))
	       ))

	    (t
	     (setq cache (wisi-goto-containing cache t)))
	    )))
      )))

(defun ada-file-name-from-ada-name (ada-name)
  "Return the filename in which ADA-NAME is found."
  ;; We don't just use gnat-compiler-* directly, because we might add
  ;; support for some other compiler. This should probably be a wisi
  ;; generic function.
  (gnat-file-name-from-ada-name (wisi-prj-compiler (project-current)) ada-name))

(defun ada-make-package-body (body-file-name)
  (let ((prj (ada-prj-require-prj)))
    (gnat-make-package-body prj (expand-file-name body-file-name))))

;;;; refactor

;; Refactor actions; must match wisi-ada.adb Refactor_Label
(defconst ada-refactor-method-object-to-object-method 0)
(defconst ada-refactor-object-method-to-method-object 1)

(defconst ada-refactor-element-object-to-object-index 2)
(defconst ada-refactor-object-index-to-element-object 3)

(defconst ada-refactor-format-paramlist 4)

(defun ada-refactor (action)
  "Perform refactor action ACTION at point."
  ;; No overlap between wisi and als refactoring (as of Aug 2022 als 22)
  (when wisi-parser-shared
    (unless wisi-incremental-parse-enable
      (wisi-validate-cache (line-end-position -7) (line-end-position 7) t 'navigate))
    (wisi-refactor wisi-parser-shared action (point))))

(defun ada-refactor-1 ()
  "Refactor Method (Object) => Object.Method.
Point must be in Method."
  (interactive)
  (ada-refactor ada-refactor-method-object-to-object-method))

(defun ada-refactor-2 ()
  "Refactor Object.Method => Method (Object).
Point must be in Object.Method."
  (interactive)
  (ada-refactor ada-refactor-object-method-to-method-object))

(defun ada-refactor-3 ()
  "Refactor Element (Object, Index) => Object (Index).
Point must be in Element"
  (interactive)
  (ada-refactor ada-refactor-element-object-to-object-index))

(defun ada-refactor-4 ()
  "Refactor Object (Index) => Element (Object, Index).
Point must be in Object"
  (interactive)
  (ada-refactor ada-refactor-object-index-to-element-object))

;; refactor-5 in ada-format-paramlist below

(defun ada-in-case-expression (parse-result)
  "Return non-nil if point is in a case expression."
  (when (wisi-in-paren-p parse-result)
    (save-excursion
      (wisi-goto-open-paren 1 parse-result)
      (while (forward-comment 1))
      (looking-at "case"))))

(defun ada-align ()
  "If region is active, apply `align'. If not, attempt to align
current construct."
  (interactive)
  (if (use-region-p)
      (progn
        (align (region-beginning) (region-end))
        (deactivate-mark))

    ;; else see if we are in a construct we know how to align
    (let ((parse-result (syntax-ppss)))
      (cond
       ((ada-in-paramlist-p parse-result)
        (ada-format-paramlist))

       ((ada-in-case-expression parse-result)
	;; align '=>'
	(let* ((begin (nth 1 parse-result))
	       (end   (scan-lists begin 1 0)))
	  (align begin end 'entire)))

       (t
	(align-current))
       ))))

(defun ada-in-paramlist-p (parse-result)
  "Return t if point is inside the parameter-list of a subprogram declaration.
PARSE-RESULT must be the result of `syntax-ppss'."
  ;; (info "(elisp)Parser State" "*syntax-ppss*")
  (when (> (nth 0 parse-result) 0)
    ;; In parens.
    (when wisi-parser-shared
      ;; LSP does not support this detailed query
      (cond
       (wisi-incremental-parse-enable
	(let ((node (wisi-parse-tree-query wisi-parser-shared 'node (nth 1 parse-result))))
	  (eq 'formal_part
	      (wisi-tree-node-id
	       (wisi-parse-tree-query wisi-parser-shared 'parent (wisi-tree-node-address node) 1)))))

       (t ;; not incremental parse

	;; Request parse of region containing parens; that
	;; will be expanded to include the subprogram declaration, if
	;; any,
	(let* ((forward-sexp-function nil) ;; forward-sexp just does parens
	       (start (nth 1 parse-result))
	       (end (save-excursion (goto-char (nth 1 parse-result)) (forward-sexp) (point))))
	  (wisi-validate-cache start end nil 'navigate)
	  (let ((cache (wisi-get-cache start)))
	    ;; cache is nil if the parse failed
	    (when cache
	      (eq 'formal_part (wisi-cache-nonterm cache)))
	    )))
       ))))

  (defun ada-format-paramlist ()
    "Reformat the parameter list point is in."
    (interactive)
    (when wisi-parser-shared
      (condition-case-unless-debug nil
	  ;; IMPROVEME: this aborts if missing close paren, but incremental parse can handle that
	  (wisi-goto-open-paren)
	(error
	 (user-error "Not in parameter list")))
      (when (not (looking-back "^[ \t]*" (line-beginning-position)))
	;;  Left paren after code; ensure nominal spacing. See
	;;  test/ada_mode-parens.adb If_Statement.
	(delete-horizontal-space)
	(insert " "))
      (funcall indent-line-function); so reformatted list is indented properly
      (when (not wisi-incremental-parse-enable)
	;; Force parse of current statement after indent
	(let* ((paren (point))
	       (cache (wisi-goto-statement-start))
	       (parse-begin (point))
	       (parse-end (wisi-cache-end cache)))
	  (if parse-end
	      (setq parse-end (+ parse-end (wisi-cache-last (wisi-get-cache (wisi-cache-end cache)))))
	    ;; else there is a syntax error; missing end of statement
	    (setq parse-end (point-max)))
	  (wisi-invalidate-cache 'navigate parse-begin)
	  (wisi-validate-cache parse-begin parse-end t 'navigate)
	  (goto-char paren)))
      (ada-refactor ada-refactor-format-paramlist)))

;;;; fix compiler errors
(defun ada-context-clause-region ()
    "Return the region containing the context clause for the current buffer,
excluding leading pragmas."
    ;; FIXME: rename this - no 'fix'
    (when wisi-parser-shared
      (wisi-validate-cache (point-min) (point-max) t 'navigate)
      (save-excursion
	(goto-char (point-min))
	(let ((begin nil)
	      (end nil)
	      cache)

	  (while (not end)
	    (setq cache (wisi-forward-cache))
	    (cl-case (wisi-cache-nonterm cache)
	      (pragma_g (wisi-goto-end-1 cache))
	      (use_package_clause (wisi-goto-end-1 cache))
	      ((limited_with_clause | nonlimited_with_clause)
	       (when (not begin)
		 (setq begin (line-beginning-position)))
	       (wisi-goto-end-1 cache))
	      (t
	       ;; start of compilation unit
	       (setq end (line-beginning-position))
	       (unless begin
		 (setq begin end)))
	      ))
	  (cons begin end)
	  ))))

(defun ada-fix-sort-context-pred (a b)
  "Predicate for `sort-subr'; sorts \"limited with\", \"private with\" last.
Returns non-nil if a should precede b in buffer."
  ;; a, b are buffer ranges in the current buffer
  (cl-flet
      ((starts-with
	(pat reg)
	(string= pat (buffer-substring-no-properties (car reg)
						     (min (point-max)
							  (+(car reg) (length pat)))))))
    (cond
     ((and
       (starts-with "limited with" a)
       (starts-with "private with" b))
      t)

     ((and
       (starts-with "limited with" a)
       (not (starts-with "limited with" b)))
      nil)

     ((and
       (not (starts-with "limited with" a))
       (starts-with "limited with" b))
      t)

     ((and
       (starts-with "private with" a)
       (not (starts-with "private with" b)))
      nil)

     ((and
       (not (starts-with "private with" a))
       (starts-with "private with" b))
      t)

     (t
      (> 0 (compare-buffer-substrings
	    nil (car a) (cdr a)
	    nil (car b) (cdr b))) )
     )))

(defun ada-fix-sort-context-clause (beg end)
  "Sort context clauses in range BEG END."
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (sort-subr nil 'forward-line 'end-of-line nil nil 'ada-fix-sort-context-pred)
      )))

(defun ada-fix-add-with-clause (package-name)
  "Add a with_clause for PACKAGE_NAME.
If ada-fix-sort-context-clause, sort the context clauses using
sort-lines."
  ;; IMPROVEME: https://github.com/AdaCore/ada_language_server/issues/1039
  (unless wisi-parser-shared
    (user-error "ada-fix-add-With-clause not supported by this parser; add use clause manually"))
  (let ((context-clause (ada-context-clause-region)))
    (when (not context-clause)
      (error "no compilation unit found"))

    (goto-char (cdr context-clause))
    (insert "with ")
    (gnat-insert-unit-name package-name)
    (insert ";\n")

    (when (and (< (car context-clause) (cdr context-clause))
	       ada-fix-sort-context-clause)
      (ada-fix-sort-context-clause (car context-clause) (point)))
    ))

(defun ada-fix-add-use-type (type)
  "Insert `use all type' clause for TYPE."
  (unless wisi-parser-shared
    (user-error "ada-fix-add-use-type not supported by this parser; add use clause manually"))
  (ada-goto-declarative-region-start); leaves point after 'is'
  (newline-and-indent)
  (insert "use all type ")
  (let ((begin (point))
	end)
    (insert type ";")
    (setq end (point))
    (goto-char begin)
    (while (< (point) end)
      (wisi-case-adjust-at-point)
      (forward-char 1))
    ))

(defun ada-fix-add-use (package)
  "Insert `use' clause for PACKAGE."
  (unless wisi-parser-shared
    (user-error "ada-fix-add-use not supported by this parser; add use clause manually"))
  (ada-goto-declarative-region-start); leaves point after 'is'
  (newline-and-indent)
  (insert "use " package ";"))

;;;; xref

(defconst ada-xref-known-backends '(gpr_query gnat eglot other)
  "Supported xref backends.")

(defcustom ada-xref-backend
  (if (locate-file "gpr_query" exec-path '("" ".exe")) 'gpr_query 'gnat)
  "Ada cross reference backend; can be overridden in project files."
  :type 'symbol
  :options ada-xref-known-backends
  :group 'ada)

(defalias 'ada-xref-tool 'ada-xref-backend)
(make-obsolete 'ada-xref-tool 'ada-xref-backend "ada-mode version 8.0")

(defun ada-make-subprogram-body ()
  "Convert subprogram specification after point into a subprogram body stub."
  (interactive)
  (when (eq ada-statement-backend 'none)
    (user-error "ada-make-subprogram-body requires ada-statement-backend"))
  (wisi-goto-statement-start)
  ;; point is at start of subprogram specification;

  (let* ((begin (point))
	 (end (wisi-cache-end (wisi-get-cache (point))))
	 (name (wisi-next-name)))
    (goto-char end)
    (insert "\nis begin\nnull;\nend ")
    (insert name)
    (forward-char 1)

    ;; newline after body to separate from next body
    (newline)
    (indent-region begin (point))
    (forward-line -2)
    (back-to-indentation)
    ))

(defun ada-ff-create-body ()
  ;; ff-find-other-file calls this with point in an empty buffer for
  ;; the body file; ada-make-package-body expects to be in the
  ;; spec. So go back to the spec, and delete the body buffer so it
  ;; does not get written to disk.
  (let ((body-buffer (current-buffer))
	(body-file-name (buffer-file-name)))

    (set-buffer-modified-p nil);; may have a skeleton; allow silent delete

    (ff-find-the-other-file);; back to spec

    (kill-buffer body-buffer)

    (ada-make-package-body body-file-name)

    ;; back to the new body file, read in from the disk.
    (ff-find-the-other-file)
    (revert-buffer t t))
  )

;;;; project files

(cl-defstruct
    (ada-prj
     (:include wisi-prj)
     (:copier nil)
     (:constructor nil)
     (:constructor make-ada-prj
		   (&key
		    name
		    compile-env
		    (compiler-label ada-compiler)
		    (xref-label ada-xref-backend)
		    source-path
		    plist
		    &aux
		    (compiler (wisi-prj-make-compiler compiler-label))
		    (xref (wisi-prj-make-xref xref-label))
		    (compile-env (ada-prj-check-env compile-env))
		    )))
  compiler-label
  xref-label
  ;; save labels for wisi-prj-default

  plist    ;; user-declared project variables; also obj_dir, mostly as an example.
  )

;;;###autoload
(cl-defun create-ada-prj
    (&key
     name
     compile-env
     (compiler-label ada-compiler)
     (xref-label ada-xref-backend)
     source-path
     plist)
  ;; We declare and autoload this because we can't autoload
  ;; make-ada-prj in emacs < 27. We can't use '(defalias
  ;; 'create-ada-prj 'make-ada-prj); then make-ada-prj is not defined
  ;; by autoload.
  (make-ada-prj
   :name name
   :compile-env compile-env
   :compiler-label compiler-label
   :xref-label xref-label
   :source-path source-path
   :plist plist))

(defun ada-prj-check-env (env)
  "Check that ENV has the proper structure; list of \"NAME=VALUE\".
Return ENV."
  ;; Previous versions used ("NAME" . "VALUE"), which screws up.
  (let ((err-msg "env is not list of \"NAME=VALUE\"."))
    (unless (listp env)
      (error err-msg))
    (dolist (item env)
      (unless (stringp item)
	(error err-msg))))
  env)

(defvar ada-prj-default-list nil
  ;; This is used by ada-build.el; we keep it to allow other similar
  ;; uses.
  "List of functions to add default project variables. Called
with one argument; the project. `default-directory' is set to the
directory containing the project file. Function should update the
project.")

;;;###autoload
(defun ada-prj-default (&optional name src-dir)
  "Return the default `ada-prj' object.
If SRC-DIR is non-nil, use it as the default for project.source-path."
  (let ((project
	 (make-ada-prj
	  :name (or name "_default_")
	  :compiler-label  ada-compiler
	  :xref-label      ada-xref-backend
	  :source-path	  (cond
			   ((null src-dir) nil)
			   ((listp src-dir) src-dir)
			   (t (list src-dir)))
	  )))

    (cl-dolist (func ada-prj-default-list)
      (funcall func project))

    project))

(cl-defmethod wisi-prj-default ((prj ada-prj))
  (let ((project
	 (make-ada-prj
	  :name           (wisi-prj-name prj)
	  :compile-env    (wisi-prj-compile-env prj)
	  :compiler-label (ada-prj-compiler-label prj)
	  :xref-label     (ada-prj-xref-label prj)
	  )))

    (cl-dolist (func ada-prj-default-list)
      (funcall func project))

    project))

(defun ada-prj-require-prj ()
  "Return current `ada-prj' object.
Throw an error if current project is not an ada-prj."
  (let ((prj (project-current)))
    (if (ada-prj-p prj)
	prj
      (error "current project is not an ada project."))))

(cl-defmethod wisi-prj-parse-one :after (project name value)
  (cond
   ;; variable name alphabetical order
   ((string= name "ada_compiler")
    (let ((comp (intern value)))
      (setf (ada-prj-compiler project) (wisi-prj-make-compiler comp))))

   ((string= name "obj_dir")
    (let ((obj-dir (plist-get (ada-prj-plist project) 'obj_dir)))
      (cl-pushnew (file-name-as-directory (expand-file-name value))
		  obj-dir :test #'equal)
      (setf (ada-prj-plist project) (plist-put (ada-prj-plist project) 'obj_dir obj-dir))
      ))

   ((string= name "xref_backend")
    ;; This is defined here, rather than in wisi, because the list of
    ;; xref tools is likely to be language-specific (but not always;
    ;; for example Gnu global supports many languages).
    (let ((xref-label (intern value)))
      (cond
       ((memq xref-label ada-xref-known-backends)
	(setf (ada-prj-xref-label project) xref-label)
	(setf (ada-prj-xref project) (wisi-prj-make-xref xref-label)))

       (t
	(user-error "'%s' is not a recognized xref backend (must be one of %s)"
		    xref-label ada-xref-known-backends))
      )))
   ))

(defun ada-prj-parse-undefined (project name value)
  "For `wisi-prj-parse-undefined-function'."
  ;; Otherwise undefined names are set as a project file variable.
  ;; eg "comp_opt"
  ;;
  ;; This is defined here, rather than in wisi, because we only
  ;; maintain it for compatibility with previous ada-mode versions.
  ;;
  ;; We assume any repeated names are lists
  (let ((prev (plist-get (ada-prj-plist project) (intern name))))
    (if prev
	(setf (ada-prj-plist project)
	      (plist-put (ada-prj-plist project)
			 (intern name)
			 (append (if (listp prev) prev (list prev))
				 (list value))))

      (setf (ada-prj-plist project)
	    (plist-put
	     (ada-prj-plist project)
	     (intern name)
	     value)))
    ))

;; This is autoloaded because it is often used in Makefiles, and thus
;; will be the first ada-mode function executed.
;;;###autoload
(defun ada-select-prj-file (prj-file)
  ;; not ada-prj-select-file for backward compatibility
  "Select PRJ-FILE as the current project file, parsing it if necessary.
Deselects the current project first."
  (wisi-prj-select-cache prj-file (ada-prj-default "")))
(make-obsolete 'ada-select-prj-file 'wisi-prj-select-cache "ada-mode 7.0")

(cl-defmethod wisi-prj-identifier-at-point ((_project ada-prj))
  ;; Handle adjacent operator/identifier like:
  ;; test/ada_mode-slices.adb
  ;;   D1, D2 : Day := +Sun;
  ;;
  ;; For operators, return quoted operator

  (cond
   ((wisi-in-comment-p)
    nil)

   ((wisi-in-string-p)
    ;; In an operator, or a string literal
    (let (start)
      (skip-chars-backward "-+*/&<>=andxorme") ;; Ada operator string content (see ada-operator-re).
      (setq start (point))
      (cond
       ((and (= (char-before) ?\")
	     (progn
	       (forward-char -1)
	       (looking-at (concat "\"\\(" ada-operator-re "\\)\""))))
	(list start (match-end 1) (concat "\"" (match-string-no-properties 1) "\"")))

     (t
      nil)
     )))

   ((looking-at (concat "\"\\(" ada-operator-re "\\)\""))
    (list (match-beginning 0) (match-end 0) (match-string-no-properties 0)))

   ((looking-at ada-operator-re)
    (list (match-beginning 0) (match-end 0) (concat "\"" (match-string-no-properties 0) "\"")))

   ((or (memq (syntax-class (syntax-after (1- (point)))) '(2 3))
	(memq (syntax-class (syntax-after (point))) '(2 3)))
    ;; word or symbol syntax.
    (let (start)
      (skip-syntax-backward "w_")
      (setq start (point))
      (skip-syntax-forward "w_")
      (list start (point) (buffer-substring-no-properties start (point)))))

   (t
    nil)
   ))

;;;; initialization
(push (cons "adp" #'wisi-prj-parse-file-1) wisi-prj-parser-alist)

(add-to-list 'wisi-prj-file-extensions "adp")

(provide 'ada-core)
;; ada-core.el ends here
