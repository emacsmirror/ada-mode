;;; ada-wisi.el --- Indentation engine for Ada mode, using the wisi generalized LALR parser  -*- lexical-binding:t -*-
;;
;; [1] ISO/IEC 8652:2012(E); Ada 2012 reference manual
;;
;; Copyright (C) 2012 - 2019  Free Software Foundation, Inc.
;;
;; Author: Stephen Leake <stephen_leake@member.fsf.org>
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
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;

(require 'ada-fix-error)
(require 'ada-indent-user-options)
(require 'ada-process)
(require 'cl-lib)
(require 'wisi)
(require 'wisi-process-parse)

(defconst ada-wisi-language-protocol-version "2"
  "Defines language-specific parser parameters.
Must match wisi-ada.ads Language_Protocol_Version.")

;; Refactor actions; must match wisi-ada.adb Refactor
(defconst ada-refactor-method-object-to-object-method 1)
(defconst ada-refactor-object-method-to-method-object 2)

(defconst ada-refactor-element-object-to-object-index 3)
(defconst ada-refactor-object-index-to-element-object 4)

(defconst ada-refactor-format-paramlist 5)

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
	 ;; (if J > 42
	 ;; -- comment indent matching GNAT style check
	 ;; -- second line of comment
	 prev-indent)

	))
     )))

(defun ada-wisi-comment ()
  "Modify indentation of a comment:
For `wisi-indent-calculate-functions'.
- align to previous comment after code.
- respect `ada-indent-comment-gnat'."
  ;; We know we are at the first token on a line. We check for comment
  ;; syntax, not comment-start, to accomodate gnatprep, skeleton
  ;; placeholders, etc.
  ;;
  ;; The normal indentation algorithm has already indented the
  ;; comment.
  (when (and (not (eobp))
	     (= 11 (syntax-class (syntax-after (point)))))

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

(defun ada-wisi-post-parse-fail ()
  "For `wisi-post-parse-fail-hook'."
  ;; Parse indent succeeded, so we assume parse navigate will as well
  (wisi-validate-cache (point-min) (line-end-position) nil 'navigate)
  (save-excursion
    (let ((start-cache (wisi-goto-start (or (wisi-get-cache (point)) (wisi-backward-cache)))))
      (when start-cache
	;; nil when in a comment at point-min
	(indent-region (point) (wisi-cache-end start-cache)))
      ))
  (back-to-indentation))

;;;; ada-mode functions (alphabetical)

(defun ada-wisi-declarative-region-start-p (cache)
  "Return t if cache is a keyword starting a declarative region."
  (memq (wisi-cache-token cache) '(DECLARE IS PRIVATE))
  ;; IS has a cache only if start of declarative region
  )

(defun ada-wisi-context-clause ()
  "For `ada-fix-context-clause'."
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
	  (use_clause (wisi-goto-end-1 cache))
	  (with_clause
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
    )))

(defun ada-wisi-fix-error (_msg source-buffer _source-window)
  "For ’ada-fix-error-hook’. Calls ’wisi-repair-error’ if appropriate."
  (when (equal compilation-last-buffer wisi-error-buffer)
    (set-buffer source-buffer)
    (wisi-repair-error)
    t))

(defun ada-wisi-on-context-clause ()
  "For `ada-on-context-clause'."
  (let (cache)
    (save-excursion
      ;; Don't require parse of large file just for ada-find-other-file
      (and (< (point-max) wisi-size-threshold)
	   (setq cache (wisi-goto-statement-start))
	   (memq (wisi-cache-nonterm cache) '(use_clause with_clause))
	   ))))

(defun ada-wisi-in-case-expression ()
  "For `ada-in-case-expression'."
  (save-excursion
    ;; Used by ada-align; we know we are in a paren.
    (ada-goto-open-paren 1)
    (while (forward-comment 1))
    (looking-at "case")))

(defun ada-wisi-goto-subunit-name ()
  "For `ada-goto-subunit-name'."
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
    ))

(defun ada-wisi-goto-declaration-start (&optional include-type)
  "For `ada-goto-declaration-start', which see.
Also return cache at start."
  (wisi-validate-cache (point-min) (point-max) t 'navigate)
  (ada-wisi-goto-declaration-start-1 include-type))

(defun ada-wisi-goto-declaration-start-1 (include-type)
  "Subroutine of `ada-wisi-goto-declaration-start'."
  (let ((start (point))
	(cache (wisi-get-cache (point)))
	(done nil))
    (unless cache
      (setq cache (wisi-backward-cache)))
    ;; cache is null at bob
    (while (not done)
      (if cache
	  (progn
	    (setq done
		  (cl-case (wisi-cache-nonterm cache)
		    ((entry_body entry_declaration)
		     (eq (wisi-cache-token cache) 'ENTRY))

		    (full_type_declaration
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
		      subprogram_body
		      subprogram_declaration
		      subprogram_renaming_declaration
		      null_procedure_declaration)
		     (memq (wisi-cache-token cache) '(NOT OVERRIDING FUNCTION PROCEDURE)))

		    ((single_task_declaration task_body task_type_declaration)
		     (eq (wisi-cache-token cache) 'TASK))

		    ))
	    (unless (< start (wisi-cache-end cache))
	      ;; found declaration does not include start; find containing one.
	      (setq done nil))
	    (unless done
	      (setq cache (wisi-goto-containing cache nil))))
	(setq done t))
	)
    cache))

(defun ada-wisi-goto-declaration-end ()
  "For `ada-goto-declaration-end', which see."
  ;; first goto-declaration-start, so we get the right end, not just
  ;; the current statement end.
  (wisi-goto-end-1 (ada-wisi-goto-declaration-start)))

(defun ada-wisi-goto-declarative-region-start ()
  "For `ada-goto-declarative-region-start', which see."
  (wisi-validate-cache (point-min) (point-max) t 'navigate)

  (let ((done nil)
	start-pos
	(in-package-spec nil)
	(cache (or (wisi-get-cache (point))
		   (wisi-backward-cache))))

    ;; We use backward-cache, not forward-cache, to handle the case
    ;; where point is in the whitespace or comment before a block; we
    ;; want the containing block, not the next block.

    (when cache ;; nil at bob
      ;; If this is called with point in a comment after 'is', then the
      ;; declarative region starts after the comment; don't hang in a
      ;; package spec.
      (setq start-pos (point))
      (while (not done)
	(if (and (or (not in-package-spec)
		     (< (point) start-pos))
		 (ada-wisi-declarative-region-start-p cache))
	    (progn
	      (forward-word);; past 'is'
	      (setq done t))
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
		(setq in-package-spec t)
		(setq cache (wisi-next-statement-cache cache)) ;; 'package'
		(setq cache (wisi-next-statement-cache cache))) ;; 'is'

	       (package_declaration
		(setq in-package-spec t)
		(setq cache (wisi-next-statement-cache cache))) ;; 'is'

	       ((entry_body package_body package_declaration protected_body subprogram_body task_body)
		(while (not (eq 'IS (wisi-cache-token cache)))
		  (setq cache (wisi-next-statement-cache cache))))

	       ((protected_type_declaration single_protected_declaration single_task_declaration task_type_declaration)
		(while (not (eq 'IS (wisi-cache-token cache)))
		  (setq cache (wisi-next-statement-cache cache)))
		(when (looking-at "\<new\>")
		  (while (not (eq 'WITH (wisi-cache-token cache)))
		    (setq cache (wisi-next-statement-cache cache)))))

	       (t
		(setq cache (wisi-goto-containing cache t)))
	       ))

	    (t
	     (setq cache (wisi-goto-containing cache t)))
	    )))

      ;; point is at start of first code statement after
      ;; declaration-start keyword and comment; move back to end of
      ;; keyword.
      (while (forward-comment -1))
      )))

(defun ada-wisi-in-paramlist-p (&optional parse-result)
  "For `ada-in-paramlist-p'."
  (wisi-validate-cache (point-min) (point-max) nil 'navigate)
  ;; (info "(elisp)Parser State" "*syntax-ppss*")
  (let ((parse-result (or parse-result (syntax-ppss)))
	 cache)
    (and (> (nth 0 parse-result) 0)
	 ;; cache is nil if the parse failed
	 (setq cache (wisi-get-cache (nth 1 parse-result)))
	 (eq 'formal_part (wisi-cache-nonterm cache)))
    ))

(defun ada-wisi-refactor (action)
  (wisi-validate-cache (line-end-position -7) (line-end-position 7) t 'navigate)
  (save-excursion
    (skip-syntax-backward "w_.\"")
    (let* ((edit-begin (point))
	   (cache (wisi-goto-statement-start))
	   (parse-begin (point))
	   (parse-end (wisi-cache-end cache)))
      (if parse-end
	  (setq parse-end (+ parse-end (wisi-cache-last (wisi-get-cache (wisi-cache-end cache)))))
	;; else there is a syntax error; missing end of statement
	(setq parse-end (point-max)))
      (wisi-refactor wisi--parser action parse-begin parse-end edit-begin)
      )))

(defun ada-wisi-refactor-1 ()
  "Refactor Method (Object) => Object.Method.
Point must be in Method."
  (interactive)
  (ada-wisi-refactor ada-refactor-method-object-to-object-method))

(defun ada-wisi-refactor-2 ()
  "Refactor Object.Method => Method (Object).
Point must be in Object.Method."
  (interactive)
  (ada-wisi-refactor ada-refactor-object-method-to-method-object))

(defun ada-wisi-refactor-3 ()
  "Refactor Element (Object, Index) => Object (Index).
Point must be in Element"
  (interactive)
  (ada-wisi-refactor ada-refactor-element-object-to-object-index))

(defun ada-wisi-refactor-4 ()
  "Refactor Object (Index) => Element (Object, Index).
Point must be in Object"
  (interactive)
  (ada-wisi-refactor ada-refactor-object-index-to-element-object))

(defun ada-wisi-make-subprogram-body ()
  "For `ada-make-subprogram-body'."
  ;; point is at start of subprogram specification;
  ;; ada-wisi-expand-region will find the terminal semicolon.
  (wisi-validate-cache (point-min) (point-max) t 'navigate)

  (let* ((begin (point))
	 (end (wisi-cache-end (wisi-get-cache (point))))
	 (name (wisi-next-name)))
    (goto-char end)
    (newline)
    (insert " is begin\n\nend ");; legal syntax; parse does not fail
    (insert name)
    (forward-char 1)

    ;; newline after body to separate from next body
    (newline-and-indent)
    (indent-region begin (point))
    (forward-line -2)
    (back-to-indentation)
    ))

(defun ada-wisi-which-function-1 (keyword add-body)
  "Used in `ada-wisi-which-function'."
  (let* ((result (wisi-next-name)))

    ;; See comment in ada-mode.el ada-which-function on why we don't
    ;; overwrite ff-function-name.
    (when (not ff-function-name)
      (setq ff-function-name
	    (concat
	     keyword
	     (when add-body "\\s-+body")
	     "\\s-+"
	     result
	     ada-symbol-end)))
    result))

(defun ada-wisi-which-function (include-type)
  "For `ada-which-function'."
  ;; Fail gracefully and silently, since this could be called from
  ;; which-function-mode.
  (let ((parse-begin (max (point-min) (- (point) (/ ada-which-func-parse-size 2))))
	(parse-end   (min (point-max) (+ (point) (/ ada-which-func-parse-size 2)))))
    (save-excursion
      (condition-case nil
	  ;; Throwing an error here disables which-function-mode, so don't do it.
	  (progn
	    (wisi-validate-cache parse-begin parse-end nil 'navigate)
	    (when (wisi-cache-covers-region parse-begin parse-end 'navigate)
	      (let ((result nil)
		    (cache (ada-wisi-goto-declaration-start-1 include-type)))
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
		     (setq result (ada-wisi-which-function-1 "entry" nil)))

		    (full_type_declaration
		     (setq result (ada-wisi-which-function-1 "type" nil)))

		    (package_body
		     (setq result (ada-wisi-which-function-1 "package" nil)))

		    ((package_declaration
		      package_specification) ;; after 'generic'
		     (setq result (ada-wisi-which-function-1 "package" t)))

		    (protected_body
		     (setq result (ada-wisi-which-function-1 "protected" nil)))

		    ((protected_type_declaration single_protected_declaration)
		     (setq result (ada-wisi-which-function-1 "protected" t)))

		    ((abstract_subprogram_declaration
		      expression_function_declaration
		      subprogram_declaration
		      subprogram_renaming_declaration
		      generic_subprogram_declaration ;; after 'generic'
		      null_procedure_declaration)
		     (setq result (ada-wisi-which-function-1
				   (progn (search-forward-regexp "function\\|procedure")(match-string 0))
				   nil))) ;; no 'body' keyword in subprogram bodies

		    (subprogram_body
		     (setq result (ada-wisi-which-function-1
				   (progn (search-forward-regexp "function\\|procedure")(match-string 0))
				   nil)))

		    ((single_task_declaration task_type_declaration)
		     (setq result (ada-wisi-which-function-1 "task" t)))


		    (task_body
		     (setq result (ada-wisi-which-function-1 "task" nil)))
		    ))
		result)))
	(error "")))
    ))

(cl-defstruct (ada-wisi-parser (:include wisi-process--parser))
  ;; no new slots
  )

(cl-defmethod wisi-parse-format-language-options ((_parser ada-wisi-parser))
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
	  (if ada-indent-hanging-rel-exp 1 0)
	  (if ada-end-name-optional 1 0)
	  ))

(defconst ada-wisi-named-begin-regexp
  "\\bfunction\\b\\|\\bpackage\\b\\|\\bprocedure\\b\\|\\btask\\b"
  )

(defconst ada-wisi-partial-begin-regexp
  (concat "\\bbegin\\b\\|\\bdeclare\\b\\|"
	  ada-wisi-named-begin-regexp
	  "\\|\\bend;\\|\\bend " ada-name-regexp ";"))

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
  ;; Inserting new line after 'Foo;'; if we include 'begin', there
  ;; is no error (begin starts a statement), and the indent is
  ;; computed incorrectly.
  ;;
  ;; This is handled by the set of keywords in
  ;; ada-wisi-partial-begin-regexp.
  (cond
   ((wisi-search-backward-skip
     ada-wisi-partial-begin-regexp
     (lambda () (or (ada-in-string-or-comment-p)
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
	  (unless (or (ada-in-string-or-comment-p)
		      (ada-in-paren-p))
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
      (skip-syntax-forward "ws")
      (skip-syntax-forward " ")
      (when (looking-at "body\\|type")
	(goto-char (match-end 0))
	(skip-syntax-forward " "))
      (setq end-regexp
	    (concat "end +"
		    (buffer-substring-no-properties
		     (point)
		     (progn
		       (skip-syntax-forward "ws._")
		       (point)))
		    ";"))
      (if (search-forward-regexp end-regexp nil t)
	  (progn
	    (while (and (ada-in-string-or-comment-p)
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
   ((or (wisi-list-memq (wisi--parse-error-repair-inserted repair) '(BEGIN IF LOOP))
	(wisi-list-memq (wisi--parse-error-repair-deleted repair) '(END)))
    ;; Error token terminates the block containing the start token
    (- indent ada-indent))

   ((equal '(CASE IS) (wisi--parse-error-repair-inserted repair))
        (- indent (+ ada-indent ada-indent-when)))

   ((equal '(END CASE SEMICOLON) (wisi--parse-error-repair-inserted repair))
        (+ indent (+ ada-indent ada-indent-when)))

   (t indent)
   ))

(defvar ada-parser nil) ;; declared, set in ada-mode.el for parser detection

(defun ada-wisi-setup ()
  "Set up a buffer for parsing Ada files with wisi."
  (add-hook 'ada-fix-error-hook #'ada-wisi-fix-error)

  (wisi-setup
   :indent-calculate '(ada-wisi-comment)
   :post-indent-fail 'ada-wisi-post-parse-fail
   :parser
   (wisi-process-parse-get
    (make-ada-wisi-parser
     :label "Ada"
     :language-protocol-version ada-wisi-language-protocol-version
     :exec-file ada-process-parse-exec
     :exec-opts ada-process-parse-exec-opts
     :face-table ada-process-face-table
     :token-table ada-process-token-table
     :repair-image ada-process-repair-image)))

  (set (make-local-variable 'comment-indent-function) 'wisi-comment-indent)

  (add-hook 'hack-local-variables-hook 'ada-wisi-post-local-vars nil t)
  )

(defun ada-wisi-post-local-vars ()
  "See wisi-setup."
  (setq hack-local-variables-hook (delq 'ada-wisi-post-local-vars hack-local-variables-hook))

  (setq wisi-indent-comment-col-0 ada-indent-comment-col-0)
  )

(add-hook 'ada-mode-hook 'ada-wisi-setup)

(setq ada-fix-context-clause 'ada-wisi-context-clause)
(setq ada-goto-declaration-end 'ada-wisi-goto-declaration-end)
(setq ada-goto-declaration-start 'ada-wisi-goto-declaration-start)
(setq ada-goto-declarative-region-start 'ada-wisi-goto-declarative-region-start)
(setq ada-goto-end 'wisi-goto-statement-end)
(setq ada-goto-subunit-name 'ada-wisi-goto-subunit-name)
(setq ada-in-case-expression 'ada-wisi-in-case-expression)
(setq ada-in-paramlist-p 'ada-wisi-in-paramlist-p)
(setq ada-indent-statement 'wisi-indent-statement)
(setq ada-make-subprogram-body 'ada-wisi-make-subprogram-body)
(setq ada-on-context-clause 'ada-wisi-on-context-clause)
(setq ada-reset-parser 'wisi-reset-parser)
(setq ada-show-parse-error 'wisi-show-parse-error)
(setq ada-which-function 'ada-wisi-which-function)

(provide 'ada-wisi)
;; end of file
