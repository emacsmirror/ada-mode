;;; An indentation engine for Ada mode, using the wisi generalized LALR parser
;;
;; [1] ISO/IEC 8652:2012(E); Ada 2012 reference manual
;;
;; Copyright (C) 2012, 2013  Free Software Foundation, Inc.
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
;;; History:
;;
;; implementation started Jan 2013
;;
;;; code style
;;
;; not using lexical-binding or cl-lib because we support Emacs 23
;;
;;;;

(require 'ada-fix-error)
(require 'ada-grammar-wy)
(require 'ada-indent-user-options)
(require 'wisi)

(eval-when-compile (require 'cl-macs))

(defconst ada-wisi-class-list
  '(
    block-end
    block-middle ;; not start of statement
    block-start ;; start of block is start of statement
    close-paren
    list-break
    name
    name-paren ;; anything that looks like a procedure call, since the grammar can't distinguish most of them
    open-paren
    return
    return-1
    return-2
    statement-end
    statement-other
    statement-start
    type
    ))

;;;; indentation

(defun ada-wisi-indent-cache (offset cache)
  "Return indentation of OFFSET plus indentation of line containing point. Point must be at CACHE."
  (let ((indent (current-indentation)))
    (cond
     ;; special cases
     ;;
     ((eq 'LEFT_PAREN (wisi-cache-token cache))
      ;; test/ada_mode-long_paren.adb
      ;; (RT                            => RT,
      ;;  Monitor                       => True,
      ;;  RX_Enable                     =>
      ;;    (RX_Torque_Subaddress |
      ;;   indenting '(RX_'
      ;;
      ;; test/ada_mode-parens.adb
      ;; return Float (
      ;;               Integer'Value
      ;;                 (Local_6));
      ;;   indenting '(local_6)'; 'offset' = ada-indent - 1
      (+ (current-column) 1 offset))

     ((save-excursion
	(let ((containing (wisi-goto-containing-paren cache)))
	  (and containing
	       ;; test/ada_mode-conditional_expressions.adb
	       ;; K2 : Integer := (if J > 42
	       ;;                  then -1
	       ;;   indenting 'then'; offset = 0
	       ;;
	       ;; need get-start, not just get-containing, because of:
	       ;; L1 : Integer := (case J is
	       ;;                     when 42 => -1,
	       ;;
	       ;; _not_ (ada-in-paren-p), because of:
	       ;; test/indent.ads
	       ;; C_S_Controls : constant
	       ;;   CSCL_Type :=
	       ;;     CSCL_Type'
	       ;;       (
	       ;;        1 =>  --  Used to be aligned on "CSCL_Type'"
	       ;;              --  aligned with previous comment.
	       ;;          IO_CPU_Control_State_S_Pkg.CPU2_Fault_Status_Type'
	       ;;            (Unused2  => 10,  -- Used to be aligned on "1 =>"
	       ;;  indenting '(Unused2'
	       (+ (current-column) offset)))))

     ;; all other structures
     (t
      ;; current cache may be preceded by something on same
      ;; line. Handle common cases nicely.
      (while (and cache
		  (or
		   (not (= (current-column) indent))
		   (eq 'EQUAL_GREATER (wisi-cache-token cache))))
	(when (and
	       (eq 'WHEN (wisi-cache-token cache))
	       (not (eq 'exit_statement (wisi-cache-nonterm cache))))
	  (setq offset (+ offset ada-indent-when)))
	(setq cache (wisi-goto-containing cache))
	(setq indent (current-indentation)))

      (cond
       ((null cache)
	;; test/ada_mode-opentoken.ads
	;; private package GDS.Commands.Add_Statement is
	;;    type Instance is new Nonterminal.Instance with null record;
	offset)

       ((eq 'label_opt (wisi-cache-token cache))
	(+ indent (- ada-indent-label) offset))

       (t
	;; test/ada_mode-generic_instantiation.ads
	;; function Function_1 is new Instance.Generic_Function
	;;   (Param_Type  => Integer,
	;;
	;; test/ada_mode-nested_packages.adb
	;; function Create (Model   : in Integer;
	;;                  Context : in String) return String is
	;;    ...
	;;    Cache : array (1 .. 10) of Boolean := (True, False, others => False);
	(+ indent offset))
       ))
     )))

(defun ada-wisi-indent-containing (offset cache &optional before)
  "Return indentation of OFFSET plus indentation of token containing CACHE.
BEFORE should be t when called from ada-wisi-before-cache, nil otherwise."
  (save-excursion
    (cond
     ((markerp (wisi-cache-containing cache))
      (ada-wisi-indent-cache offset (wisi-goto-containing cache)))

     (t
      (cond
       ((ada-in-paren-p)
	(ada-goto-open-paren 1)
	(+ (current-column) offset))

       (t
	;; at outermost containing statement. If called from
	;; ada-wisi-before-cache, we want to ignore OFFSET (indenting
	;; 'package' in a package spec). If called from
	;; ada-wisi-after-cache, we want to include offset (indenting
	;; first declaration in the package).
	(if before 0 offset))
       ))
      )))

(defun ada-wisi-before-cache ()
  "Point is at indentation, before a cached token. Return new indentation for point."
  (let ((pos-0 (point))
	(cache (wisi-get-cache (point))))
    (when cache
      (cl-ecase (wisi-cache-class cache)
	(block-start
	 (cl-case (wisi-cache-token cache)
	   (IS ;; subprogram body
	    (ada-wisi-indent-containing 0 cache t))

	   (RECORD
	    (ada-wisi-indent-containing ada-indent-record-rel-type cache t))

	   (t ;; other
	    (ada-wisi-indent-containing ada-indent cache t))))

	(block-end
	 (cl-case (wisi-cache-nonterm cache)
	   (record_definition
	    (save-excursion
	      (wisi-goto-containing cache);; now on 'record'
	      (current-indentation)))

	   (t
	    (ada-wisi-indent-containing 0 cache t))
	   ))

	(block-middle
	 (cl-case (wisi-cache-token cache)
	   (WHEN
	    (ada-wisi-indent-containing ada-indent-when cache t))

	   (t
	    (ada-wisi-indent-containing 0 cache t))
	   ))

	(close-paren (wisi-indent-paren 0))

	(name
	 (ada-wisi-indent-containing ada-indent-broken cache t))

	(name-paren
	 (let ((containing (wisi-goto-containing cache)))
	   (cl-case (wisi-cache-class containing)
 	     (open-paren
	      ;; test/ada_mode-slices.adb
	      ;; Put_Line(Day'Image(D1) & " - " & Day'Image(D2) & " = " &
	      ;;            Integer'Image(N));
	      ;;
	      ;; test/ada_mode-parens.adb
	      ;; return Float (
	      ;;               Integer'Value
	      ;; indenting 'Integer'
	      ;;
	      ;; We distinguish the two cases by going to the first token,
	      ;; and comparing point to pos-0.
	      (let ((paren-column (current-column)))
		(wisi-forward-token t); "("
		(forward-comment (point-max))
		(if (= (point) pos-0)
		    ;; 2)
		    (1+ paren-column)
		  ;; 1)
		  (+ paren-column 1 ada-indent-broken))))

	     (list-break
	      ;; test/parent.adb
	      ;; Append_To (Formals,
	      ;;            Make_Parameter_Specification (Loc,
	      (wisi-indent-paren 1))

	     (t
	      ;; test/ada_mode-generic_instantiation.ads
	      ;;   procedure Procedure_6 is new
	      ;;     Instance.Generic_Procedure (Integer, Function_1);
	      ;; indenting 'Instance'; containing is 'new'
	      (ada-wisi-indent-cache ada-indent-broken containing))
	     )))

	(open-paren
	 (let ((containing (wisi-goto-containing cache)))
	   (cl-case (wisi-cache-token containing)
	     (COMMA
	      ;; test/ada_mode-parens.adb
	      ;; A : Matrix_Type :=
	      ;;   ((1, 2, 3),
	      ;;    (4, 5, 6),
	      ;; indenting (4
	      (ada-wisi-indent-containing 0 containing))

	     (EQUAL_GREATER
	      (setq containing (wisi-goto-containing containing))
	      (cl-ecase (wisi-cache-token containing)
		(COMMA
		 ;; test/ada_mode-long_paren.adb
		 ;; (RT                            => RT,
		 ;;  Monitor                       => True,
		 ;;  RX_Enable                     =>
		 ;;    (RX_Torque_Subaddress |
		 ;; indenting (RX_Torque
		 (ada-wisi-indent-containing (1- ada-indent) containing t))
		(LEFT_PAREN
		 ;; test/ada_mode-parens.adb
		 ;; (1 =>
		 ;;    (1 => 12,
		 ;; indenting '(1 => 12'; containing is '=>'
		 (ada-wisi-indent-cache (1- ada-indent) containing))
		(WHEN
		 ;; test/ada_mode-conditional_expressions.adb
		 ;;  when 1 =>
		 ;;    (if J > 42
		 ;; indenting '(if'; containing is '=>'
		 (+ (current-column) -1 ada-indent))
		))

	     ((FUNCTION PROCEDURE)
	      ;; test/ada_mode-nominal.adb
	      ;; function Function_Access_11
	      ;;   (A_Param : in Float)
	      ;;   --  EMACSCMD:(test-face "function" font-lock-keyword-face)
	      ;;   return access function
	      ;;     (A_Param : in Float)
	      ;;     return
	      ;;     Standard.Float -- Ada mode 4.01, GPS do this differently
	      ;; indenting second '(A_Param)
	      (+ (current-indentation) -1 ada-indent))

	     (LEFT_PAREN
	      ;; test/ada_mode-parens.adb
	      ;; or else ((B.all
	      ;;             and then C)
	      ;;            or else
	      ;;            (D
	      ;; indenting (D
	      (+ (current-column) 1 ada-indent-broken))

	     (name
	      ;; test/indent.ads
	      ;; CSCL_Type'
	      ;;   (
	      ;; identing (
	      ;;
	      ;; test/ada_mode-parens.adb
	      ;; Check
	      ;;   ("foo bar",
	      ;;    A
	      ;;      (1),
	      ;;    A(2));
	      ;; indenting (1)
	      (+ (current-indentation) ada-indent-broken))

	     (t
	      (cond
		((memq (wisi-cache-class containing) '(block-start statement-start))
		 ;; test/ada_mode-nominal.adb
		 ;; entry E2
		 ;;   (X : Integer)
		 ;; indenting (X
		 (ada-wisi-indent-cache ada-indent-broken containing))

		((and
		  (eq (wisi-cache-nonterm containing) 'entry_body)
		  (eq (wisi-cache-token containing) 'WHEN))
		 ;; test/ada_mode-nominal.adb
		 ;; when Local_1 = 0 and not
		 ;;   (Local_2 = 1)
		 ;; indenting (Local_2
		 (+ (current-column) ada-indent-broken))

		(t
		 ;; Open paren in an expression.
		 ;;
		 ;; test/ada_mode-conditional_expressions.adb
		 ;; L0 : Integer :=
		 ;;   (case J is when 42 => -1, when Integer'First .. 41 => 0, when others => 1);
		 ;; indenting (case
		 (ada-wisi-indent-containing ada-indent-broken containing t))
		))
	     )))

	(return-1;; parameter list
	 (let ((return-pos (point)))
	   (wisi-goto-containing cache nil) ;; matching 'function'
	   (cond
	    ((<= ada-indent-return 0)
	     ;; indent relative to "("
	     (wisi-forward-find-class 'open-paren return-pos)
	     (+ (current-column) (- ada-indent-return)))

	    (t
	     (+ (current-column) ada-indent-return))
	    )))

	(return-2;; no parameter list
	 (wisi-goto-containing cache nil) ;; matching 'function'
	 (+ (current-column) ada-indent-broken))

	(statement-end
	 (ada-wisi-indent-containing ada-indent-broken cache t))

	(statement-other
	 (let ((containing (wisi-goto-containing cache nil)))
	   (cl-case (wisi-cache-token cache)
	     (EQUAL_GREATER
	      (+ (current-column) ada-indent-broken))

	     (ELSIF
	      ;; test/g-comlin.adb
	      ;;   elsif Current_Argument < CL.Argument_Count then
	      (ada-wisi-indent-cache 0 containing))

	     (RENAMES
	      (cl-ecase (wisi-cache-nonterm containing)
		((generic_renaming_declaration subprogram_renaming_declaration)
		 (wisi-forward-find-token '(FUNCTION PROCEDURE) pos-0)
		 (let ((pos-subprogram (point))
		       (has-params
			;; this is wrong for one return access
			;; function case: overriding function Foo
			;; return access Bar (...) renames ...;
			(wisi-forward-find-token 'LEFT_PAREN pos-0 t)))
		   (if has-params
		       (if (<= ada-indent-renames 0)
			   ;; indent relative to paren
			   (+ (current-column) (- ada-indent-renames))
			 ;; else relative to line containing keyword
			 (goto-char pos-subprogram)
			 (+ (current-indentation) ada-indent-renames))

		     ;; no params
		     (goto-char pos-subprogram)
		     (+ (current-indentation) ada-indent-broken))
		   ))

		(object_renaming_declaration
		 (+ (current-indentation) ada-indent-broken))
		))

	     (t
	      (while (not (wisi-cache-nonterm containing))
		(setq containing (wisi-goto-containing containing)))

	      (cl-ecase (wisi-cache-nonterm containing)
		(aggregate
		 ;; indenting 'with'
		 (+ (current-column) 1))

		(association_opt
		 ;; test/indent.ads
		 ;; 1 =>  --  Used to be aligned on "CSCL_Type'"
		 ;;       --  aligned with previous comment.
		 ;;   IO_CPU_Control_State_S_Pkg.CPU2_Fault_Status_Type'
		 (ada-wisi-indent-cache ada-indent-broken containing))

		(asynchronous_select
		 ;; indenting 'abort'
		 (+ (current-column) ada-indent-broken))

		(component_declaration
		 ;; test/ada_mode-nominal.ads record_type_3
		 (+ (current-column) ada-indent-broken))

		(entry_body
		 ;; indenting 'when'
		 (+ (current-column) ada-indent-broken))

		(formal_package_declaration
		 ;; test/ada_mode-generic_package.ads
		 ;; with package A_Package_7 is
		 ;;   new Ada.Text_IO.Integer_IO (Num => Formal_Signed_Integer_Type);
		 ;; indenting 'new'
		 (+ (current-column) ada-indent-broken))

		(full_type_declaration
		 ;; test/ada_mode-nominal.ads
		 ;; type Unconstrained_Array_Type_3 is array (Integer range <>, Standard.Character range <>)
		 ;;   of Object_Access_Type_1;
		 ;; indenting 'of'
		 ;;
		 ;; type Object_Access_Type_7
		 ;;   is access all Integer;
		 ;; indenting 'is'
		 (while (not (eq 'TYPE (wisi-cache-token containing)))
		   (setq containing (wisi-goto-containing containing)))
		 (+ (current-column) ada-indent-broken))

		(generic_instantiation
		 ;; test/ada_mode-generic_instantiation.ads
		 ;; procedure Procedure_7 is
		 ;;   new Instance.Generic_Procedure (Integer, Function_1);
		 ;; indenting 'new'
		 (+ (current-column) ada-indent-broken))

		(generic_renaming_declaration
		 ;; indenting keyword following 'generic'
		 (current-column))

		(object_declaration
		 (cl-ecase (wisi-cache-token containing)
		   (COLON
		    ;; test/ada_mode-nominal.ads
		    ;; Anon_Array_3 : array (1 .. 10)
		    ;;   of Integer;
		    ;; indenting 'of'
		    (+ (current-indentation) ada-indent-broken))

		   (COLON_EQUAL
		    ;; test/indent.ads
		    ;; C_S_Controls : constant
		    ;;   CSCL_Type :=
		    ;;     CSCL_Type'
		    ;; indenting 'CSCL_Type'
		    (+ (current-indentation) ada-indent-broken))

		   (identifier_list
		    ;; test/ada_mode-nominal.adb
		    ;; Local_2 : constant Float
		    ;;   := Local_1;
		    (+ (current-indentation) ada-indent-broken))
		   ))

		(qualified_expression
		 ;; test/ada_mode-nominal-child.ads
		 ;; Child_Obj_5 : constant Child_Type_1 :=
		 ;;   (Parent_Type_1'
		 ;;     (Parent_Element_1 => 1,
		 (ada-wisi-indent-cache ada-indent-broken containing))

		(statement
		 (cl-case (wisi-cache-token containing)
		   (label_opt
		    (- (current-column) ada-indent-label))

		   (t
		    ;; test/ada_mode-nominal.adb
		    ;; select
		    ;;    delay 1.0;
		    ;; then
		    ;;    -- ...
		    ;;   abort
		    (ada-wisi-indent-cache ada-indent-broken cache))
		   ))

		((subprogram_body subprogram_declaration subprogram_specification null_procedure_declaration)
		 (cl-ecase (wisi-cache-token cache)
		   (OVERRIDING
		    ;; indenting 'overriding' following 'not'
		    (current-column))

		   ((PROCEDURE FUNCTION)
		    ;; indenting 'procedure' or 'function following 'overriding'
		    (current-column))
		   ))

		(subtype_declaration
		 ;; test/adacore_9717_001.ads A_Long_Name
		 (+ (current-column) ada-indent-broken))

		))))) ;; end statement-other

	(statement-start
	 (cond
	  ((eq 'label_opt (wisi-cache-token cache))
	   (ada-wisi-indent-containing (+ ada-indent-label ada-indent) cache t))

	  (t
	   (let ((containing-cache (wisi-get-containing-cache cache)))
	     (if (not containing-cache)
		 ;; at bob
		 0
	       ;; not at bob
	       (cl-case (wisi-cache-class containing-cache)
		 ((block-start block-middle)
		  (wisi-goto-containing cache)
		  (cl-case (wisi-cache-nonterm containing-cache)
		    (record_definition
		     (+ (current-indentation) ada-indent))

		    (t
		     (ada-wisi-indent-cache ada-indent containing-cache))
		    ))

		 (list-break
		  ;; test/ada_mode-generic_instantiation.ads
		  ;; function Function_1 is new Instance.Generic_Function
		  ;;   (Param_Type  => Integer,
		  ;;    Result_Type => Boolean,
		  ;;    Threshold   => 2);
		  ;;   indenting 'Result_Type'
		  (wisi-indent-paren 1))

		 (statement-other
		  (cl-case (wisi-cache-token containing-cache)
		    (LEFT_PAREN
		     ;; test/ada_mode-parens.adb
		     ;; return Float (
		     ;;               Integer'Value
		     ;;   indenting 'Integer'
		     (wisi-indent-paren 1))

		    (EQUAL_GREATER
		     ;; test/ada_mode-nested_packages.adb
		     ;; exception
		     ;;    when Io.Name_Error =>
		     ;;       null;
		     (ada-wisi-indent-containing ada-indent containing-cache t))

		    (t
		     ;; test/ada_mode-generic_instantiation.ads
		     ;; procedure Procedure_6 is new
		     ;;   Instance.Generic_Procedure (Integer, Function_1);
		     ;;   indenting 'Instance'
		     (ada-wisi-indent-containing ada-indent-broken cache t))
		    ))
		 ))))
	     ))

	(type
	 (ada-wisi-indent-containing ada-indent-broken cache t))
	))
    ))

(defun ada-wisi-after-cache ()
  "Point is at indentation, not before a cached token. Find previous
cached token, return new indentation for point."
  (let ((start (point))
	(prev-token (save-excursion (wisi-backward-token)))
	(cache (wisi-backward-cache)))

    (cond
     ((not cache) ;; bob
	0)

     (t
      (while (memq (wisi-cache-class cache) '(name name-paren type))
	;; not useful for indenting
	(setq cache (wisi-backward-cache)))

      (cl-ecase (wisi-cache-class cache)
	(block-end
	 ;; indenting block/subprogram name after 'end'
	 (wisi-indent-current ada-indent-broken))

	(block-middle
	 (cl-case (wisi-cache-token cache)
	   (IS
	    (cl-case (wisi-cache-nonterm cache)
	      (case_statement
	       ;; between 'case .. is' and first 'when'; most likely a comment
	       (ada-wisi-indent-containing 0 cache t))

	      (t
	       (+ (ada-wisi-indent-containing ada-indent cache t)))
	      ))

	   ((THEN ELSE)
	    (let ((indent
		   (cl-ecase (wisi-cache-nonterm (wisi-get-containing-cache cache))
		     ((statement if_statement elsif_statement_item) ada-indent)
		     ((if_expression elsif_expression_item) ada-indent-broken))))
	      (ada-wisi-indent-containing indent cache t)))

	   (WHEN
	    ;; between 'when' and '=>'
	    (+ (current-column) ada-indent-broken))

	   (t
	    ;; block-middle keyword may not be on separate line:
	    ;;       function Create (Model   : in Integer;
	    ;;                        Context : in String) return String is
	    (ada-wisi-indent-containing ada-indent cache nil))
	   ))

	(block-start
	 (cl-case (wisi-cache-nonterm cache)
	   (exception_handler
	    ;; between 'when' and '=>'
	    (+ (current-column) ada-indent-broken))

	   (if_expression
	    (ada-wisi-indent-containing ada-indent-broken cache nil))

	   (select_alternative
	    (ada-wisi-indent-containing (+ ada-indent-when ada-indent-broken) cache nil))

	   (t ;; other; normal block statement
	    (ada-wisi-indent-cache ada-indent cache))
	   ))

	(close-paren
	 ;; actual_parameter_part: test/ada_mode-nominal.adb
	 ;; return 1.0 +
	 ;;   Foo (Bar) + -- multi-line expression that happens to have a cache at a line start
	 ;;   12;
	 ;; indenting '12'; don't indent relative to containing function name
	 ;;
	 ;; attribute_designator: test/ada_mode-nominal.adb
	 ;; raise Constraint_Error with Count'Image (Line (File)) &
	 ;;    "foo";
	 ;; indenting '"foo"'; relative to raise
	 (when (memq (wisi-cache-nonterm cache)
		     '(actual_parameter_part attribute_designator))
	   (setq cache (wisi-goto-containing cache)))
	 (ada-wisi-indent-containing ada-indent-broken cache nil))

	(list-break
	 (save-excursion
	   (let ((break-point (point))
		 (containing (wisi-goto-containing cache)))
	     (cl-ecase (wisi-cache-token containing)
	       (LEFT_PAREN
		(let*
		    ((list-element-token (wisi-cache-token (save-excursion (wisi-forward-cache))))
		     (indent
		      (cl-case list-element-token
			(WHEN ada-indent-when)
			(t 0))))
		  (if (equal break-point (cl-caddr prev-token))
		      ;; we are indenting the first token after the list-break; not hanging.
		      (+ (current-column) 1 indent)
		    ;; else hanging
		    (+ (current-column) 1 ada-indent-broken indent))))

	       (IS
		;; ada_mode-conditional_expressions.adb
		;; L1 : Integer := (case J is
		;;                     when 42 => -1,
		;;                     -- comment aligned with 'when'
		;; indenting '-- comment'
		(wisi-indent-paren (+ 1 ada-indent-when)))

	       (WITH
		(cl-ecase (wisi-cache-nonterm containing)
		  (aggregate
		   ;; ada_mode-nominal-child.ads
		   ;; (Default_Parent with
		   ;;  Child_Element_1 => 10,
		   ;;  Child_Element_2 => 12.0,
		   (wisi-indent-paren 1))
		  ))
	       ))))

	(open-paren
	 ;; 1) A parenthesized expression, or the first item in an aggregate:
	 ;;
	 ;;    (foo +
	 ;;       bar)
	 ;;    (foo =>
	 ;;       bar)
	 ;;
	 ;;     we are indenting 'bar'
	 ;;
	 ;; 2) A parenthesized expression, or the first item in an
	 ;;    aggregate, and there is whitespace between
	 ;;    ( and the first token:
	 ;;
	 ;; test/ada_mode-parens.adb
	 ;; Local_9 : String := (
	 ;;                      "123"
	 ;;
	 ;; 3) A parenthesized expression, or the first item in an
	 ;;    aggregate, and there is a comment between
	 ;;    ( and the first token:
	 ;;
	 ;; test/ada_mode-nominal.adb
	 ;; A :=
	 ;;   (
	 ;;    -- a comment between paren and first association
	 ;;    1 =>
	 ;;
	 (let ((paren-column (current-column))
	       (start-is-comment (save-excursion (goto-char start) (looking-at comment-start-skip))))
	   (wisi-forward-token t); point is now after paren
	   (if start-is-comment
	       (skip-syntax-forward " >"); point is now on comment
	     (forward-comment (point-max)); point is now on first token
	     )
	   (if (= (point) start)
	       ;; case 2) or 3)
	       (1+ paren-column)
	     ;; 1)
	     (+ paren-column 1 ada-indent-broken))))

	((return-1 return-2)
	 ;; hanging. Intent relative to line containing matching 'function'
	 (ada-prev-statement-keyword)
	 (back-to-indentation)
 	 (+ (current-column) ada-indent-broken))

	(statement-end
	 (ada-wisi-indent-containing 0 cache nil))

	(statement-other
	 (cl-ecase (wisi-cache-token cache)
	   (ABORT
	    ;; select
	    ;;    Please_Abort;
	    ;; then
	    ;;   abort
	    ;;    -- 'abort' indented with ada-broken-indent, since this is part
	    ;;    Titi;
	    (ada-wisi-indent-containing ada-indent cache))

	    ;; test/subdir/ada_mode-separate_task_body.adb
	   ((COLON COLON_EQUAL)
	    ;; Local_3 : constant Float :=
	    ;;   Local_2;
	    (ada-wisi-indent-cache ada-indent-broken cache))

	   (COMMA
	    (cl-ecase (wisi-cache-nonterm cache)
	      (name_list
	       (cl-ecase (wisi-cache-nonterm (wisi-get-containing-cache cache))
		 (use_clause
		  ;; test/with_use1.adb
		  (ada-wisi-indent-containing ada-indent-use cache))

		 (with_clause
		  ;; test/ada_mode-nominal.ads
		  ;; limited private with Ada.Strings.Bounded,
		  ;;   --EMACSCMD:(test-face "Ada.Containers" 'default)
		  ;;   Ada.Containers;
		  ;;
		  ;; test/with_use1.adb
		  (ada-wisi-indent-containing ada-indent-with cache))
		 ))
	      ))

	   (ELSIF
	    ;; test/g-comlin.adb
	    ;; elsif Index_Switches + Max_Length <= Switches'Last
	    ;;   and then Switches (Index_Switches + Max_Length) = '?'
	    (ada-wisi-indent-cache ada-indent-broken cache))

	   (EQUAL_GREATER
	    (cl-ecase (wisi-cache-nonterm (wisi-goto-containing cache nil))
	      (actual_parameter_part
	       ;; ada_mode-generic_package.ads
	       ;; with package A_Package_2 is new Ada.Text_IO.Integer_IO (Num =>
	       ;;                                                           Formal_Signed_Integer_Type);
	       ;;  indenting 'Formal_Signed_...', point on '(Num'
	       (+ (current-column) 1 ada-indent-broken))

	      (association_list
	       ;; test/ada_mode-parens.adb
	       ;; (1      => 1,
	       ;;  2      =>
	       ;;    1 + 2 * 3,
	       ;; point is on ','
	       (wisi-indent-paren (1+ ada-indent-broken)))

	      ((case_expression_alternative case_statement_alternative exception_handler)
	       ;; containing is 'when'
	       (+ (current-column) ada-indent))

	      (generic_renaming_declaration
	       ;; not indenting keyword following 'generic'
	       (+ (current-column) ada-indent-broken))

	      (primary
	       ;; test/ada_mode-quantified_expressions.adb
	       ;; if (for some J in 1 .. 10 =>
	       ;;       J/2 = 0)
	       (ada-wisi-indent-containing ada-indent-broken cache))

	      ))

	   (IS
	    (setq cache (wisi-goto-containing cache))
	    (cl-ecase (wisi-cache-nonterm cache)
	      (full_type_declaration
	       ;; ada_mode/nominal.ads
	       ;; type Limited_Derived_Type_1a is abstract limited new
	       ;;    Private_Type_1 with record
	       ;;       Component_1 : Integer;
	       ;; indenting 'Private_Type_1'; look for 'record'
	       (let ((type-column (current-column)))
		 (goto-char start)
		 (if (wisi-forward-find-token 'RECORD (line-end-position) t)
		     ;; 'record' on line being indented
		     (+ type-column ada-indent-record-rel-type)
		   ;; 'record' on later line
		   (+ type-column ada-indent-broken))))

	      ((formal_type_declaration
		;; test/ada_mode-generic_package.ads
		;; type Synchronized_Formal_Derived_Type is abstract synchronized new Formal_Private_Type and Interface_Type
		;;   with private;

		subtype_declaration)
		;; test/ada_mode-nominal.ads
		;;    subtype Subtype_2 is Signed_Integer_Type range 10 ..
		;;      20;

	       (+ (current-column) ada-indent-broken))
	      ))

	   (LEFT_PAREN
	    ;; test/indent.ads
	    ;; C_S_Controls : constant
	    ;;   CSCL_Type :=
	    ;;     CSCL_Type'
	    ;;       (
	    ;;        1 =>
	    (+ (current-column) 1))

	   (OF
	    ;; ada_mode-nominal.ads
	    ;; Anon_Array_2 : array (1 .. 10) of
	    ;;   Integer;
	    (ada-wisi-indent-containing ada-indent-broken cache))

	   (NEW
	    ;; ada_mode-nominal.ads
	    ;; type Limited_Derived_Type_2 is abstract limited new Private_Type_1 with
	    ;;   private;
	    (ada-wisi-indent-containing ada-indent-broken cache))

	   (WHEN
	    ;; test/ada_mode-parens.adb
	    ;; exit when A.all
	    ;;   or else B.all
	    (ada-wisi-indent-containing ada-indent-broken cache))

	   (WITH
	    ;; extension aggregate: test/ada_mode-nominal-child.ads
	    ;;      (Default_Parent with
	    ;;       10, 12.0, True);
	    ;;   indenting '10'; containing is '('
	    ;;
	    ;; raise_statement: test/ada_mode-nominal.adb
	    ;; raise Constraint_Error with
            ;;    "help!";
	    (cl-case (wisi-cache-nonterm cache)
	      (aggregate
	       (ada-wisi-indent-containing 0 cache nil))
	      (raise_statement
	       (ada-wisi-indent-containing ada-indent-broken cache nil))
	      ))

	   ;; otherwise just hanging
	   ((ACCEPT FUNCTION PROCEDURE RENAMES)
	    (back-to-indentation)
	    (+ (current-column) ada-indent-broken))

	  ))

	(statement-start
	 (cl-case (wisi-cache-token cache)
	   (WITH ;; with_clause
	    (+ (current-column) ada-indent-with))

	   (label_opt
	    ;; comment after label
	    (+ (current-column) (- ada-indent-label)))

	   (t
	    ;; procedure Procedure_8
	    ;;   is new Instance.Generic_Procedure (Integer, Function_1);
	    ;; indenting 'is'; hanging
	    ;;	    (+ (current-column) ada-indent-broken))
	    (ada-wisi-indent-cache ada-indent-broken cache))
	   ))
	)))
    ))

(defun ada-wisi-comment ()
  "Compute indentation of a comment. For `wisi-indent-functions'."
  ;; We know we are at the first token on a line. We check for comment
  ;; syntax, not comment-start, to accomodate gnatprep, skeleton
  ;; placeholders, etc.
  (when (= 11 (syntax-class (syntax-after (point))))

    ;; We are at a comment; indent to previous code or comment.
    (cond
     ((and ada-indent-comment-col-0
	   (= 0 (current-column)))
      0)

     ((or
       (save-excursion (forward-line -1) (looking-at "\\s *$"))
       (save-excursion (forward-comment -1)(not (looking-at comment-start))))
      ;; comment is after a blank line or code; indent as if code
      ;;
      ;; ada-wisi-before-cache will find the keyword _after_ the
      ;; comment, which could be a block-middle or block-end, and that
      ;; would align the comment with the block-middle, which is wrong. So
      ;; we only call ada-wisi-after-cache.

      ;; FIXME: need option to match gnat style check; change indentation to match (ie mod 3)
      (ada-wisi-after-cache))

      (t
       ;; comment is after a comment
       (forward-comment -1)
       (current-column))
      )))

(defun ada-wisi-post-parse-fail ()
  "For `wisi-post-parse-fail-hook'."
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
  (cl-case (wisi-cache-token cache)
   (DECLARE t)
   (IS
    (memq (wisi-cache-class cache) '(block-start block-middle)))
   (t nil)
   ))

(defun ada-wisi-context-clause ()
  "For `ada-fix-context-clause'."
  (wisi-validate-cache (point-max))
  (save-excursion
    (goto-char (point-min))
    (let ((begin nil)
	  (end nil)
	  cache)

      (while (not end)
	(setq cache (wisi-forward-cache))
	(cl-case (wisi-cache-nonterm cache)
	  (pragma nil)
	  (use_clause nil)
	  (with_clause
	   (when (not begin)
	     (setq begin (point-at-bol))))
	  (t
	   ;; start of compilation unit
	   (setq end (point-at-bol))
	   (unless begin
	     (setq begin end)))
	  ))
      (cons begin end)
    )))

(defun ada-wisi-goto-declaration-start ()
  "For `ada-goto-declaration-start', which see.
Also return cache at start."
  (wisi-validate-cache (point))
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
		    ((generic_package_declaration generic_subprogram_declaration)
		     (eq (wisi-cache-token cache) 'GENERIC))

		    ((package_body package_declaration)
		     (eq (wisi-cache-token cache) 'PACKAGE))

		    ((protected_body protected_type_declaration single_protected_declaration)
		     (eq (wisi-cache-token cache) 'PROTECTED))

		    ((subprogram_body subprogram_declaration null_procedure_declaration)
		     (memq (wisi-cache-token cache) '(NOT OVERRIDING FUNCTION PROCEDURE)))

		    (task_type_declaration
		     (eq (wisi-cache-token cache) 'TASK))

		    ))
	    (unless done
	      (setq cache (wisi-goto-containing cache nil))))
	(setq done t))
	)
    cache))

(defun ada-wisi-goto-declarative-region-start ()
  "For `ada-goto-declarative-region-start', which see."
  (wisi-validate-cache (point))
  (let ((done nil)
	(first t)
	(cache
	 (or
	  (wisi-get-cache (point))
	  ;; we use forward-cache here, to handle the case where point is after a subprogram declaration:
	  ;; declare
	  ;;     ...
	  ;;     function ... is ... end;
	  ;;     <point>
	  ;;     function ... is ... end;
	  (wisi-forward-cache))))
    (while (not done)
      (if (ada-wisi-declarative-region-start-p cache)
	  (progn
	    (wisi-forward-token t)
	    (setq done t))
	(cl-case (wisi-cache-class cache)
	  ((block-middle block-end)
	   (setq cache (wisi-prev-statement-cache cache)))

	  (statement-start
	   ;; 1) test/ada_mode-nominal.adb
	   ;;    protected body Protected_1 is -- target 2
	   ;;        <point>
	   ;;    want target 2
	   ;;
	   ;; 2) test/ada_mode-nominal.adb
	   ;;    function Function_Access_1
	   ;;      (A_Param <point> : in Float)
	   ;;      return
	   ;;        Standard.Float
	   ;;    is -- target 1
	   ;;    want target 1
	   ;;
	   ;; 3) test/ada_mode-nominal-child.adb
	   ;;    overriding <point> function Function_2c (Param : in Child_Type_1)
	   ;;                                    return Float
	   ;;    is -- target Function_2c
	   ;;    want target

	   (if first
	       ;; case 1
	       (setq cache (wisi-goto-containing cache t))
	     ;; case 2, 3
	     (cl-case (wisi-cache-nonterm cache)
	       (subprogram_body
		(while (not (eq 'IS (wisi-cache-token cache)))
		  (setq cache (wisi-next-statement-cache cache))))
	       (t
		(setq cache (wisi-goto-containing cache t)))
	       )))
	  (t
	   (setq cache (wisi-goto-containing cache t)))
	  ))
      (when first (setq first nil)))
    ))

(defun ada-wisi-in-paramlist-p ()
  "For `ada-in-paramlist-p'."
  (wisi-validate-cache (point))
  ;; (info "(elisp)Parser State" "*syntax-ppss*")
  (let* ((parse-result (syntax-ppss))
	 cache)
    (and (> (nth 0 parse-result) 0)
	 ;; cache is nil if the parse failed
	 (setq cache (wisi-get-cache (nth 1 parse-result)))
	 (eq 'formal_part (wisi-cache-nonterm cache)))
    ))

(defun ada-wisi-make-subprogram-body ()
  "For `ada-make-subprogram-body'."
  (wisi-validate-cache (point))
  (when wisi-parse-failed
    (error "syntax parse failed; cannot create body"))

  (let* ((begin (point))
	 (end (save-excursion (wisi-forward-find-class 'statement-end (point-max)) (point)))
	 (cache (wisi-forward-find-class 'name end))
	 (name (buffer-substring-no-properties
		(point)
		(+ (point) (wisi-cache-last cache)))))
    (goto-char end)
    (newline)
    (insert " is begin\nnull;\nend ");; legal syntax; parse does not fail
    (insert name)
    (forward-char 1)

    ;; newline after body to separate from next body
    (newline-and-indent)
    (indent-region begin (point))
    (forward-line -2)
    (back-to-indentation); before 'null;'
    ))

(defun ada-wisi-scan-paramlist (begin end)
  "For `ada-scan-paramlist'."
  (wisi-validate-cache end)
  (goto-char begin)
  (let (token
	text
	identifiers
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
      (let ((token-text (wisi-forward-token)))
	(setq token (nth 0 token-text))
	(setq text  (nth 1 token-text)))
      (cond
       ((equal token 'COMMA) nil);; multiple identifiers

       ((equal token 'COLON)
	;; identifiers done. find type-begin; there may be no mode
	(skip-syntax-forward " ")
	(setq type-begin (point))
	(save-excursion
	  (while (member (car (wisi-forward-token)) '(IN OUT NOT NULL ACCESS CONSTANT PROTECTED))
	    (skip-syntax-forward " ")
	    (setq type-begin (point)))))

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
	(setq type-end (save-excursion (backward-char 2) (skip-syntax-backward " ") (point)))
	(skip-syntax-forward " ")
	(setq default-begin (point))
	(wisi-forward-find-token 'SEMICOLON end t))

       ((member token '(SEMICOLON RIGHT_PAREN))
	(if (equal token 'RIGHT_PAREN)
	    ;; all done
	    (progn
	      (setq done t)
	      (when (not type-end) (setq type-end (1- (point))))
	      (when default-begin (setq default (buffer-substring-no-properties default-begin (1- (point)))))
	      )
	  ;; else semicolon - one param done
	  (when (not type-end) (setq type-end (1- (point))))
	  (when default-begin (setq default (buffer-substring-no-properties default-begin (1- (point)))))
	  )

	(setq type (buffer-substring-no-properties type-begin type-end))
	(setq param (list (reverse identifiers)
			  in-p out-p not-null-p access-p constant-p protected-p
			  type default))
	(if paramlist
	    (add-to-list 'paramlist param)
	  (setq paramlist (list param)))
	(setq identifiers nil
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
	      default-begin nil))

       (t
	(when (not type-begin)
	  (if identifiers
	      (add-to-list 'identifiers text)
	    (setq identifiers (list text)))))
       ))
    paramlist))

(defun ada-wisi-which-function-1 (keyword add-body)
  "used in `ada-wisi-which-function'."
  (let (region
	result
	(cache (wisi-forward-find-class 'name (point-max))))

    (setq result (wisi-cache-text cache))

    (when (not ff-function-name)
      (setq ff-function-name
	    (concat
	     keyword
	     (when add-body "\\s-+body")
	     "\\s-+"
	     result
	     ada-symbol-end)))
    result))

(defun ada-wisi-which-function ()
  "For `ada-which-function'."
  (wisi-validate-cache (point))
  (save-excursion
    (let ((result nil)
	  (cache (ada-wisi-goto-declaration-start)))
      (if (null cache)
	  ;; bob
	  (setq result "")

	(cl-case (wisi-cache-nonterm cache)
	  ((generic_package_declaration generic_subprogram_declaration)
	   ;; name is after next statement keyword
	   (wisi-next-statement-cache cache)
	   (setq cache (wisi-get-cache (point))))
	  )

	;; add or delete 'body' as needed
	(cl-ecase (wisi-cache-nonterm cache)
	  (package_body
	   (setq result (ada-wisi-which-function-1 "package" nil)))

	  ((package_declaration
	    generic_package_declaration) ;; after 'generic'
	   (setq result (ada-wisi-which-function-1 "package" t)))

	  (protected_body
	   (setq result (ada-wisi-which-function-1 "protected" nil)))

	  ((protected_type_declaration single_protected_declaration)
	   (setq result (ada-wisi-which-function-1 "protected" t)))

	  ((subprogram_declaration
	    subprogram_specification ;; after 'generic'
	    null_procedure_declaration)
	   (setq result (ada-wisi-which-function-1
			 (wisi-cache-text (wisi-forward-find-token '(FUNCTION PROCEDURE) (point-max)))
			 nil))) ;; no 'body' keyword in subprogram bodies

	  (subprogram_body
	   (setq result (ada-wisi-which-function-1
			 (wisi-cache-text (wisi-forward-find-token '(FUNCTION PROCEDURE) (point-max)))
			 nil)))

	  (task_type_declaration
	   (setq result (ada-wisi-which-function-1 "task" t)))

	  ))
      result)))

;;;; debugging
(defun ada-wisi-debug-keys ()
  "Add debug key definitions to `ada-mode-map'."
  (interactive)
  (define-key ada-mode-map "\M-e" 'wisi-show-parse-error)
  (define-key ada-mode-map "\M-h" 'wisi-show-containing-or-previous-cache)
  (define-key ada-mode-map "\M-i" 'wisi-goto-end)
  (define-key ada-mode-map "\M-j" 'wisi-show-cache)
  (define-key ada-mode-map "\M-k" 'wisi-show-token)
  )

(defun ada-wisi-setup ()
  "Set up a buffer for parsing Ada files with wisi."
  (wisi-setup '(ada-wisi-comment
		ada-wisi-before-cache
		ada-wisi-after-cache)
	      'ada-wisi-post-parse-fail
	      ada-wisi-class-list
	      ada-grammar-wy--keyword-table
	      ada-grammar-wy--token-table
	      ada-grammar-wy--parse-table)
  (setq wisi-string-quote-escape-doubled t)

  (set (make-local-variable 'comment-indent-function) 'wisi-comment-indent)

  (add-hook 'hack-local-variables-hook 'ada-wisi-post-local-vars nil t)
  )

(defun ada-wisi-post-local-vars ()
  ;; run after file local variables are read because font-lock-add-keywords
  ;; evaluates font-lock-defaults, which depends on ada-language-version.
  (font-lock-add-keywords 'ada-mode
   ;; use keyword cache to distinguish between 'function ... return <type>;' and 'return ...;'
   (list
    (list
     (concat
      "\\<\\("
      "return[ \t]+access[ \t]+constant\\|"
      "return[ \t]+access\\|"
      "return"
      "\\)\\>[ \t]*"
      ada-name-regexp "?")
     '(1 font-lock-keyword-face)
     '(2 (if (eq (when (not (ada-in-string-or-comment-p))
		   (wisi-validate-cache (match-end 2))
		   (and (wisi-get-cache (match-beginning 2))
			(wisi-cache-class (wisi-get-cache (match-beginning 2)))))
		 'type)
	     font-lock-type-face
	   'default)
	 nil t)
     )))

  (when global-font-lock-mode
    ;; ensure the modified keywords are applied
    (font-lock-refresh-defaults))
  )

(add-hook 'ada-mode-hook 'ada-wisi-setup)

(setq ada-fix-context-clause 'ada-wisi-context-clause)
(setq ada-goto-declaration-start 'ada-wisi-goto-declaration-start)
(setq ada-goto-declarative-region-start 'ada-wisi-goto-declarative-region-start)
(setq ada-goto-end 'wisi-goto-end)
(setq ada-in-paramlist-p 'ada-wisi-in-paramlist-p)
(setq ada-indent-statement 'wisi-indent-statement)
(setq ada-make-subprogram-body 'ada-wisi-make-subprogram-body)
(setq ada-next-statement-keyword 'wisi-forward-statement-keyword)
(setq ada-prev-statement-keyword 'wisi-backward-statement-keyword)
(setq ada-reset-parser 'wisi-invalidate-cache)
(setq ada-scan-paramlist 'ada-wisi-scan-paramlist)
(setq ada-show-parse-error 'wisi-show-parse-error)
(setq ada-which-function 'ada-wisi-which-function)

(provide 'ada-wisi)
(provide 'ada-indent-engine)

;; end of file
