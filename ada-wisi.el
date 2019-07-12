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

(require 'ada-lalr-elisp)
(require 'ada-fix-error)
(require 'ada-indent-user-options)
(require 'cl-lib)
(require 'wisi)
(require 'wisi-elisp-lexer)
(require 'wisi-process-parse)

(defconst ada-wisi-language-protocol-version "1"
  "Defines language-specific parser parameters.
Must match wisi-ada.ads Language_Protocol_Version.")

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
    (eq (wisi-tok-token (wisi-forward-token)) 'CASE)))

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
  (let ((cache (wisi-get-cache (point)))
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
	      (wisi-forward-token)
	      (setq done t))
	  (cl-case (wisi-cache-class cache)
	    (motion
	     (goto-char (wisi-cache-prev cache))
	     (setq cache (wisi-get-cache (point))))

	    (statement-end
	     (goto-char (wisi-cache-containing cache));; statement-start
	     (goto-char (wisi-cache-containing (wisi-get-cache (point))));; containing scope
	     (setq cache (wisi-get-cache (point))))

	    (statement-start
	     (cl-case (wisi-cache-nonterm cache)
	       (package_declaration
		(setq in-package-spec t)
		(wisi-goto-end-1 cache)
		(setq cache (wisi-get-cache (point)))
		(while (not (memq (wisi-cache-token cache) '(IS PRIVATE)))
		  (setq cache (wisi-prev-statement-cache cache))))

	       ((entry_body package_body package_declaration protected_body subprogram_body task_body)
		(while (not (eq 'IS (wisi-cache-token cache)))
		  (setq cache (wisi-next-statement-cache cache))))

	       ((protected_type_declaration single_protected_declaration single_task_declaration task_type_declaration)
		(while (not (eq 'IS (wisi-cache-token cache)))
		  (setq cache (wisi-next-statement-cache cache)))
		(when (save-excursion (eq 'NEW (wisi-tok-token (wisi-forward-token))))
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

(defun ada-wisi-scan-paramlist (begin end)
  "For `ada-scan-paramlist'."
  ;; IMPROVEME: define mini grammar that does this
  ;;
  ;; BEGIN is at (, end at ). We need to parse the entire
  ;; subprogram_specification, so start back two tokens.
  (goto-char begin)
  (wisi-backward-token)
  (wisi-backward-token)
  (wisi-validate-cache (point) end t 'navigate)

  (goto-char begin)

  (let (tok
	token
	text
	identifiers
	(aliased-p nil)
	(in-p nil)
	(out-p nil)
	(not-null-p nil)
	(access-p nil)
	(constant-p nil)
	(protected-p nil)
	(type nil)
	type-begin
	type-end
	(default nil)
	(default-begin nil)
	param
	paramlist
	(done nil))
    (while (not done)
      (forward-comment 1)
      (setq tok (wisi-forward-token))
      (setq token (wisi-tok-token tok))
      (setq text  (wisi-token-text tok))
      (cond
       ((equal token 'COMMA) nil);; multiple identifiers

       ((equal token 'COLON)
	;; identifiers done. find type-begin; there may be no mode
	(setq type-begin (point))
	(save-excursion
	  (while (member (wisi-tok-token (wisi-forward-token)) '(ALIASED IN OUT NOT NULL ACCESS CONSTANT PROTECTED))
	    (setq type-begin (point)))))

       ((equal token 'ALIASED) (setq aliased-p t))
       ((equal token 'IN) (setq in-p t))
       ((equal token 'OUT) (setq out-p t))
       ((and (not type-end)
	     (member token '(NOT NULL)))
	;; "not", "null" could be part of the default expression
	(setq not-null-p t))
       ((equal token 'ACCESS) (setq access-p t))
       ((equal token 'CONSTANT) (setq constant-p t))
       ((equal token 'PROTECTED) (setq protected-p t))

       ((equal token 'COLON_EQUAL)
	(setq type-end (save-excursion (goto-char (car (wisi-tok-region tok))) (skip-syntax-backward " ") (point)))
	(setq default-begin (point))
	(if (wisi-forward-find-token 'SEMICOLON end t)
	    (wisi-backward-token)
	;; else at end of param-list; point is before closing paren.
	  ))

       ((equal token 'LEFT_PAREN)
	;; anonymous access procedure type, aggregate initial value
	(goto-char (scan-sexps (1- (point)) 1)))

       ((member token '(SEMICOLON RIGHT_PAREN))
	(if (not type-begin)
	    ;; Right paren immediately following semicolon; allowed by
	    ;; our Ada grammar.
	    (setq done t)

	  (when (not type-end)
	    (setq type-end (save-excursion (goto-char (car (wisi-tok-region tok))) (skip-syntax-backward " ") (point))))

	  (setq type (buffer-substring-no-properties type-begin type-end))

	  (when default-begin
	    (setq default (buffer-substring-no-properties default-begin (car (wisi-tok-region tok)))))

	  (when (equal token 'RIGHT_PAREN)
	    (setq done t))

	  (setq param (list (reverse identifiers)
			    aliased-p in-p out-p not-null-p access-p constant-p protected-p
			    type default))
          (cl-pushnew param paramlist :test #'equal)
	  (setq identifiers nil
		aliased-p nil
		in-p nil
		out-p nil
		not-null-p nil
		access-p nil
		constant-p nil
		protected-p nil
		type nil
		type-begin nil
		type-end nil
		default nil
		default-begin nil)))

       (t
	(when (not type-begin)
          (push text identifiers)))
       ))
    paramlist))

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
    (wisi-validate-cache parse-begin parse-end nil 'navigate)
    (when (wisi-cache-covers-region parse-begin parse-end 'navigate)
      (save-excursion
	(condition-case-unless-debug nil
	    (let ((result nil)
		  (cache (ada-wisi-goto-declaration-start-1 include-type)))
	      (if (null cache)
		  ;; bob or failed parse
		  (setq result "")

		(when (memq (wisi-cache-nonterm cache)
			    '(generic_package_declaration generic_subprogram_declaration))
		  ;; name is after next statement keyword
		  (wisi-next-statement-cache cache)
		  (setq cache (wisi-get-cache (point))))

		;; add or delete 'body' as needed
		(cl-ecase (wisi-cache-nonterm cache)
		  ((entry_body entry_declaration)
		   (setq result (ada-wisi-which-function-1 "entry" nil)))

		  (full_type_declaration
		   (setq result (ada-wisi-which-function-1 "type" nil)))

		  (package_body
		   (setq result (ada-wisi-which-function-1 "package" nil)))

		  ((package_declaration
		    generic_package_declaration) ;; after 'generic'
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
				 (wisi-token-text (wisi-forward-find-token '(FUNCTION PROCEDURE) (point-max)))
				 nil))) ;; no 'body' keyword in subprogram bodies

		  (subprogram_body
		   (setq result (ada-wisi-which-function-1
				 (wisi-token-text (wisi-forward-find-token '(FUNCTION PROCEDURE) (point-max)))
				 nil)))

		  ((single_task_declaration task_type_declaration)
		   (setq result (ada-wisi-which-function-1 "task" t)))


		  (task_body
		   (setq result (ada-wisi-which-function-1 "task" nil)))
		  ))
	      result)
	  (error "")))
      )))

(defun ada-wisi-number-p (token-text)
  "Return t if TOKEN-TEXT plus text after point matches the
syntax for a numeric literal; otherwise nil. point is after
TOKEN-TEXT; move point to just past token."
  ;; test in test/wisi/ada-number-literal.input
  ;;
  ;; starts with a simple integer
  (let ((end (point)))
    ;; this first test must be very fast; it is executed for every token
    (when (and (memq (aref token-text 0) '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9))
	       (string-match "^[0-9_]+$" token-text))
      (cond
       ((= (char-after) ?#)
	;; based number
	(forward-char 1)
	(if (not (looking-at "[0-9a-fA-F_]+"))
	    (progn (goto-char end) nil)

	  (goto-char (match-end 0))
	  (cond
	   ((= (char-after) ?#)
	    ;; based integer
	    (forward-char 1)
	    t)

	   ((= (char-after) ?.)
	    ;; based real?
	    (forward-char 1)
	    (if (not (looking-at "[0-9a-fA-F]+"))
		(progn (goto-char end) nil)

	      (goto-char (match-end 0))

	      (if (not (= (char-after) ?#))
		  (progn (goto-char end) nil)

		(forward-char 1)
		(setq end (point))

		(if (not (memq (char-after) '(?e ?E)))
		    ;; based real, no exponent
		    t

		  ;; exponent?
		  (forward-char 1)
		  (if (not (looking-at "[+-]?[0-9]+"))
		      (progn (goto-char end) t)

		    (goto-char (match-end 0))
		    t
		)))))

	   (t
	    ;; missing trailing #
	    (goto-char end) nil)
	   )))

       ((= (char-after) ?.)
	;; decimal real number?
	(forward-char 1)
	(if (not (looking-at "[0-9_]+"))
	    ;; decimal integer
	    (progn (goto-char end) t)

	  (setq end (goto-char (match-end 0)))

	  (if (not (memq (char-after) '(?e ?E)))
	      ;; decimal real, no exponent
	      t

	    ;; exponent?
	    (forward-char 1)
	    (if (not (looking-at "[+-]?[0-9]+"))
		(progn (goto-char end) t)

	      (goto-char (match-end 0))
	      t
	      ))))

       (t
	;; just an integer
	t)
       ))
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
     (lambda ()
       (or (ada-in-string-or-comment-p)
	   (eq 'ACCESS (wisi-tok-token (save-excursion (wisi-backward-token)))))))

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
			(search-forward-regexp end-regexp)))
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
(defvar ada-process-token-table nil) ;; ada-process.el
(defvar ada-process-face-table nil) ;; ada-process.el

(defvar wisi-elisp-parse-indent-hanging-function nil); wisi-elisp-parse.el

(declare-function wisi-make-elisp-parser "wisi-elisp-parse") ;; autoloaded
(declare-function ada-wisi-elisp-parse--indent-hanging "ada-wisi-elisp-parse")

(defun ada-wisi-setup ()
  "Set up a buffer for parsing Ada files with wisi."
  (let ((parser
	 (cond
	  ((or (null ada-parser)
	       (eq 'elisp ada-parser))

	   (require 'ada-wisi-elisp-parse)

	   (setq wisi-elisp-parse-indent-hanging-function #'ada-wisi-elisp-parse--indent-hanging)

	   (wisi-make-elisp-parser
	    ada-lalr-elisp-parse-table
	    #'wisi-forward-token)
	   )

	  ((eq 'process ada-parser)
	   (require 'ada-process)
	   (wisi-process-parse-get
	    (make-ada-wisi-parser
	     :label "Ada"
	     :language-protocol-version ada-wisi-language-protocol-version
	     :exec-file ada-process-parse-exec
	     :exec-opts ada-process-parse-exec-opts
	     :face-table ada-process-face-table
	     :token-table ada-process-token-table)))
	  ))

	(lexer
	 ;; The process parser has its own lexer, but we still need
	 ;; the elisp lexer for ada-wisi-scan-paramlist,
	 ;; ada-wisi-which-function, etc.
	 (wisi-make-elisp-lexer
	  :token-table-raw ada-lalr-elisp-token-table-raw
	  :keyword-table-raw ada-lalr-elisp-keyword-table-raw
	  :string-quote-escape-doubled t
	  :string-quote-escape nil))
	)

    (add-hook 'ada-fix-error-hook #'ada-wisi-fix-error)

    (wisi-setup
     :indent-calculate '(ada-wisi-comment)
     :post-indent-fail 'ada-wisi-post-parse-fail
     :parser parser
     :lexer lexer)
    )

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
(setq ada-scan-paramlist 'ada-wisi-scan-paramlist)
(setq ada-show-parse-error 'wisi-show-parse-error)
(setq ada-which-function 'ada-wisi-which-function)

(provide 'ada-wisi)
;; end of file
