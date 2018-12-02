;;; ada-wisi-elisp-parse.el --- Ada functions for grammar actions called from the elisp parser  -*- lexical-binding:t -*-
;;
;; Copyright (C) 2012 - 2018  Free Software Foundation, Inc.
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

(require 'ada-indent-user-options)
(require 'wisi-elisp-parse)

(defun ada-indent-aggregate ()
  ;; Not ada-wisi-elisp-parse--indent-aggregate to match existing grammar files
  "Return indent for an aggregate (0 or -1)."
  ;; In our grammar, 'aggregate' can be an Ada aggregate, or a
  ;; parenthesized expression.
  ;;
  ;; We always want an 'aggregate' to be indented by
  ;; ada-indent-broken. However, in some places in the grammar,
  ;; 'aggregate' is indented by ada-indent. The following checks for
  ;; those places, and returns a correction value.
  ;;
  ;; `ada-indent-aggregate' is used in only one place in the grammar,
  ;; in 'primary'.
  (let ((prev-token (wisi-tok-token (wisi-parse-stack-peek wisi--parser 1))))
    (cl-case prev-token
      (ELSE ;; in if_expression or boolean shortcut "or else"
       (cl-case (wisi-tok-token (wisi-parse-stack-peek wisi--parser 2))
	 (OR
	  ;; boolean shortcut
	  ;;
	  ;; test/ada_mode-parens.adb
	  ;; or else ((B.all
	  ;;             and then C)
	  ;;            or else
	  ;;            (D
	  0)

	 (t ;; if_expression
	  (- ada-indent-broken ada-indent))
	 ))

      (EQUAL_GREATER
       ;; in association_opt or case_expression_alternative
       (cl-case (wisi-tok-token (wisi-parse-stack-peek wisi--parser 3))
	 (WHEN
	  ;; case_expression_alternative
	  ;;
	  ;; test/ada_mode-conditional_expressions.adb
	  ;; when 1  =>
	  ;;
	  ;;    (if J > 42
	  (- ada-indent-broken ada-indent))

	 (t
	  ;; association_opt
	  ;;
	  ;; test/ada_mode-long_paren.adb
	  ;; RX_Enable                     =>
	  ;;   (RX_Torque_Subaddress |
	  0)
	 ))

      (THEN
       (cl-case (wisi-tok-token (wisi-parse-stack-peek wisi--parser 2))
	 (AND
	  ;; boolean shortcut
	  ;;
	  ;; test/ada_mode-parens.adb
	  ;;             and then
	  ;;             (C)
	  0)

	 (t
	  ;; in elsif_expression_item or if_expression
	  (- ada-indent-broken ada-indent))))

      (t
       0))
    ))

(defun ada-wisi-elisp-parse--indent-hanging (tok delta1 delta2 option no-accumulate)
  "For `wisi-elisp-parse-indent-hanging-function'. Determine indent style from context."
  ;; ada-mode 5.2 used a special case for aspect specification
  ;; expressions; we implement that here. Otherwise, implement
  ;; ada-indent-hanging-rel-exp. Match logic in wisi-ada.adb
  ;; Indent_Hanging_1
  (let ((paren-nest (nth 0 (syntax-ppss (car (wisi-tok-region tok)))))
	(result2
	 (lambda (delta1 delta2 paren-nest)
	   (list 'hanging
		 (wisi-tok-line tok) ;; first line of token
		 paren-nest
		 (wisi-elisp-parse--indent-compute-delta delta1 tok)
		 delta2
		 no-accumulate)))
	(result1
	 (lambda (delta1 paren-nest)
	   (list 'hanging
		 (wisi-tok-line tok) ;; first line of token
		 paren-nest
		 delta1
		 delta1
		 no-accumulate)))
	)
  (cond
   ((and (memq (wisi-tok-token tok) '(EQUAL_GREATER expression_opt))
	 (let ((prev-1 (wisi-parse-stack-peek wisi--parser 1))
	       (prev-3 (wisi-parse-stack-peek wisi--parser 3)))
	   (or
	    ;; test/aspects.ads
	    ;; with Pre => X > 10 and
	    ;;             X < 50 and
	    ;;             F (X),
	    (and prev-1
		 (eq 'WITH (wisi-tok-token prev-1))
		 (or (null prev-3)
		     ;; FIXME: doc test case
		     (not (eq 'LEFT_PAREN (wisi-tok-token prev-3))))) ;; not in extension aggregate

	    ;; test/aspects.ads
	    ;;   Post =>
	    ;;     Y >= X and
	    ;;     Some_Very_Verbose_Predicate (X, Y);
	    (and prev-3
		 (eq 'WITH (wisi-tok-token prev-3))))))
    ;; in aspect_specification_opt, indenting expression or comment after =>
    (if (not wisi-indent-comment)
	(funcall result2
		 delta1
		 (wisi-elisp-parse--anchored-2
		  (wisi-tok-line tok) ;; anchor-line
		  (cdr (wisi-tok-region tok))
		  (wisi-elisp-parse--indent-offset tok 0)
		  no-accumulate)
		 paren-nest)
      ;; else
      (funcall result1 (wisi-elisp-parse--indent-compute-delta delta1 tok) paren-nest)
      ))

   (ada-indent-hanging-rel-exp
    (let ((new-delta2
	   (wisi-elisp-parse--anchored-2
	    (wisi-tok-line tok) ;; anchor-line
	    (cdr (wisi-tok-region tok))
	    (wisi-elisp-parse--indent-offset tok ada-indent-broken)
	    nil)))
      (if (or (not option)
	      (and (wisi-tok-first tok)
		   (= (wisi-tok-line tok) (wisi-tok-first tok))))
	  (funcall result2 delta1 new-delta2 paren-nest)
	(funcall result1 new-delta2 paren-nest)

	)))

   (wisi-indent-comment
    (let ((first-tok-first-on-line
	   (and (numberp (wisi-tok-first tok))
		(= (wisi-tok-line tok) (wisi-tok-first tok))))
	  ;; first token in tok is first on line
	  (last-indent-line (line-number-at-pos (cdr (wisi-tok-region tok))))
	  )
      (if option
	  (if first-tok-first-on-line
	      (if (and (wisi-tok-first tok)
		       (= (wisi-tok-first tok) last-indent-line))
		  (funcall result1 delta1 paren-nest)
		(funcall result1 delta2 paren-nest))
	    (if (not (wisi-tok-first tok))
		;; test/ada_mode-parens.adb
		;;    Ada.Text_IO.Put_Line
		;;      (Item => Hello & There
		;;       --  Comment before trailing paren, token.First = False
		(funcall result1 0 paren-nest)
	      (funcall result1 delta1 paren-nest)))

	;; not option
	(if first-tok-first-on-line
	    (if (and (numberp (wisi-tok-first tok))
		     (= (wisi-tok-first tok) last-indent-line))
		(funcall result1 delta1 paren-nest)
	      (funcall result1 delta2 paren-nest))
	  (if (not (wisi-tok-first tok))
	      (funcall result1 delta1 paren-nest)
	    (funcall result1 delta2 paren-nest)))
	)))

   ((or (not option)
	(and (wisi-tok-first tok)
	     (= (wisi-tok-line tok) (wisi-tok-first tok))))
    (funcall result2 delta1 delta2 paren-nest))

   (t
    (funcall result1 delta1 paren-nest))
   )))

(defun ada-wisi-elisp-parse--indent-record-1 (anchor-tok record-tok offset)
  "Return delta to implement `ada-indent-record-rel-type'.
ANCHOR-TOK, RECORD-TOK are ’wisi-tok’ objects."
  (let ((indenting-tok (aref wisi-tokens wisi-token-index)))
    (cond
     ((and (not wisi-indent-comment)
	   (eq 'RECORD (wisi-tok-token indenting-tok)))
      ;; Indenting 'record'
      (wisi-elisp-parse--anchored-2
       (wisi-tok-line anchor-tok)
       (cdr (wisi-tok-region record-tok))
       ada-indent-record-rel-type
       nil))

   (t ;; Indenting comment, component or 'end'

    ;; Ensure 'record' line is anchored
    (let ((indent (aref wisi-elisp-parse--indent (1- (wisi-tok-line record-tok))))
	  delta)
      (unless (and (listp indent)
		   (eq 'anchor (car indent)))
	(setq
	 delta
	 (wisi-elisp-parse--anchored-2
	  (wisi-tok-line anchor-tok) (cdr (wisi-tok-region record-tok)) ada-indent-record-rel-type nil))

	(unless (= (wisi-tok-line anchor-tok) (wisi-tok-line record-tok))
	  (wisi-elisp-parse--indent-token-1 (wisi-tok-line record-tok) (cdr (wisi-tok-region record-tok)) delta))))

    ;; anchor comment lines
    (wisi-elisp-parse--anchored-1
     anchor-tok
     (if (= (wisi-tok-line anchor-tok) (wisi-tok-line record-tok))
	 offset
       (+ offset ada-indent-record-rel-type))
     nil))
   )))

(defun ada-indent-record (anchor-token record-token offset)
  ;; Not ada-wisi-elisp-parse--indent-record to match existing grammar files
  "Return delta to implement `ada-indent-record-rel-type'.

ANCHOR-TOKEN is the token to anchor line containing 'record' to; a token number in `wisi-tokens'

RECORD-TOKEN is the token number of 'record'.

For use in grammar action."
  (let ((record-tok (aref wisi-tokens (1- record-token)))
	(anchor-tok (aref wisi-tokens (1- anchor-token))))
    (ada-wisi-elisp-parse--indent-record-1 anchor-tok record-tok offset)))

(defun ada-indent-record* (anchor-token record-token offset)
  ;; Not ada-wisi-elisp-parse--indent-record to match existing grammar files
  "Return delta to implement `ada-indent-record-rel-type'.

ANCHOR-TOKEN is the token to anchor line containing 'record' to;
it is the token id to find in the parser stack.

RECORD-TOKEN is the token number of 'record'.

For use in grammar action."
  (let ((record-tok (aref wisi-tokens (1- record-token)))
	(anchor-tok (wisi-parse-find-token wisi--parser anchor-token)))
    (ada-wisi-elisp-parse--indent-record-1 anchor-tok record-tok offset)))

(defun ada-indent-renames (token-number)
  ;; Not ada-wisi-elisp-parse--indent-renames to match existing grammar files
  "Implement `ada-indent-renames' option in a subprogram renaming grammar action.
TOKEN-NUMBER is the subprogram_specification token."
  ;; wisi-token-index is the renames token.
  (let* ((subp-tok (aref wisi-tokens (1- token-number)))
	 (subp-line (wisi-tok-line subp-tok))
	 (renames-tok (aref wisi-tokens wisi-token-index))
	 (paren-pos
	  (progn (goto-char (car (wisi-tok-region subp-tok)))
		 (search-forward "(" (cdr (wisi-tok-region subp-tok)) t)))
	 (paren-line subp-line)
	 delta)

    (cond
     (paren-pos
      (cond
       ((>= 0 ada-indent-renames)
	(setq delta (+ (abs ada-indent-renames) -1 (- (current-column) (current-indentation))))

	(while (< (aref (wisi-elisp-lexer-line-begin wisi--lexer) paren-line) paren-pos)
	  (setq paren-line (1+ paren-line)))

	(wisi-elisp-parse--anchored-2 paren-line (cdr (wisi-tok-region renames-tok)) delta nil))

       (t
	(wisi-elisp-parse--anchored-2 subp-line (cdr (wisi-tok-region renames-tok)) ada-indent-renames nil))
       ))

     (t
      ;; FIXME: renames.line should be renames.region.last?
      (wisi-elisp-parse--anchored-2 subp-line (wisi-tok-line renames-tok) ada-indent-broken nil))
     )))

(defun ada-indent-return (token-number offset)
  ;; Not ada-wisi-elisp-parse--indent-return to match existing grammar files
  "Implement `ada-indent-return' option in a grammar action.
TOKEN-NUMBER is the formal_part token."
  ;; wisi-token-index must be the return token, or a nonterminal
  ;; starting with the return token.
  ;;
  ;; The grammar handles checking for no params; we know token-number
  ;; is non-nil.
  (let ((return-tok (aref wisi-tokens wisi-token-index)))
    (if (= (wisi-tok-line return-tok) (wisi-tok-first return-tok))
	;; return is first on a line; needs indenting
	(cond
	 ((>= 0 ada-indent-return)
	  ;; relative to paren
	  (wisi-anchored token-number (+ offset (abs ada-indent-return))))

	 (t
	  ;; relative to 'function'
	  (wisi-elisp-parse--anchored-1 (wisi-parse-find-token wisi--parser 'FUNCTION) (+ offset ada-indent-return)))
	 )

      ;; 'return' not first on line
      0)))

(provide 'ada-wisi-elisp-parse)
;; end of file
