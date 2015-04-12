;;; An indentation engine for Ada mode, using the wisi generalized LALR parser
;;
;; [1] ISO/IEC 8652:2012(E); Ada 2012 reference manual
;;
;; Copyright (C) 2012 - 2015  Free Software Foundation, Inc.
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
;;;;

(require 'ada-fix-error)
(require 'ada-grammar-wy)
(require 'ada-indent-user-options)
(require 'cl-lib)
(require 'wisi)

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
    return-with-params
    return-without-params
    statement-end
    statement-other
    statement-start
    ))

;;;; indentation

(defun ada-wisi-current-indentation ()
  "Return indentation appropriate for point on current line:
if not in paren, beginning of line
if in paren, pos following paren."
  (if (not (ada-in-paren-p))
      (current-indentation)

    (or
     (save-excursion
       (let ((line (line-number-at-pos)))
	 (ada-goto-open-paren 1)
	 (when (= line (line-number-at-pos))
	   (current-column))))
     (save-excursion
       (back-to-indentation)
       (current-column)))
    ))

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
	       ;; L1 : Integer := (case J is
	       ;;                     when 42 => -1,
	       ;;
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

(defun ada-wisi-indent-list-break (cache prev-token)
  "Return indentation for a token contained by CACHE, which must be a list-break.
point must be on CACHE. PREV-TOKEN is the token before the one being indented."
  (let ((break-point (point))
	(containing (wisi-goto-containing cache)))
    (cl-ecase (wisi-cache-token containing)
      (LEFT_PAREN
       (if (equal break-point (cadr prev-token))
	   ;; we are indenting the first token after the list-break; not hanging.
	   ;;
	   ;; test/parent.adb
	   ;; Append_To (Formals,
	   ;;            Make_Parameter_Specification (Loc,
	   ;; indenting 'Make_...'
	   ;;
	   ;; test/ada_mode-generic_instantiation.ads
	   ;; function Function_1 is new Instance.Generic_Function
	   ;;   (Param_Type  => Integer,
	   ;;    Result_Type => Boolean,
	   ;;    Threshold   => 2);
	   ;; indenting 'Result_Type'
	   (+ (current-column) 1)
	 ;; else hanging
	 ;;
	 ;; test/ada_mode-parens.adb
	 ;; A :=
	 ;;   (1 |
	 ;;      2 => (1, 1, 1),
	 ;;    3 |
	 ;;      4 => (2, 2, 2));
	 ;; indenting '4 =>'
	 (+ (current-column) 1 ada-indent-broken)))

      (IS
       ;; test/ada_mode-conditional_expressions.adb
       ;; L1 : Integer := (case J is
       ;;                     when 42 => -1,
       ;;                     -- comment aligned with 'when'
       ;; indenting '-- comment'
       (wisi-indent-paren (+ 1 ada-indent-when)))

      (WITH
       (cl-ecase (wisi-cache-nonterm containing)
	 (aggregate
	  ;; test/ada_mode-nominal-child.ads
	  ;; (Default_Parent with
	  ;;  Child_Element_1 => 10,
	  ;;  Child_Element_2 => 12.0,
	  ;; indenting 'Child_Element_2'
	  (wisi-indent-paren 1))

	 (aspect_specification_opt
	  ;; test/aspects.ads:
	  ;; type Vector is tagged private
	  ;; with
	  ;;   Constant_Indexing => Constant_Reference,
	  ;;   Variable_Indexing => Reference,
	  ;; indenting 'Variable_Indexing'
	  (+ (current-indentation) ada-indent-broken))
	 ))
      )
    ))

(defun ada-wisi-before-cache ()
  "Point is at indentation, before a cached token. Return new indentation for point."
  (let ((pos-0 (point))
	(cache (wisi-get-cache (point)))
	(prev-token (save-excursion (wisi-backward-token)))
	)
    (when cache
      (cl-ecase (wisi-cache-class cache)
	(block-start
	 (cl-case (wisi-cache-token cache)
	   (IS ;; subprogram body
	    (ada-wisi-indent-containing 0 cache t))

	   (RECORD
	    ;; test/ada_mode-nominal.ads; ada-indent-record-rel-type = 3
	    ;; type Private_Type_2 is abstract tagged limited
	    ;;    record
	    ;; indenting 'record'
	    ;;
	    ;; type Limited_Derived_Type_1d is
	    ;;    abstract limited new Private_Type_1 with
	    ;;    record
	    ;; indenting 'record'
	    ;;
	    ;; for Record_Type_1 use
	    ;;   record
	    ;;   indenting 'record'
	    (let ((containing (wisi-goto-containing cache)))
	      (while (not (memq (wisi-cache-token containing) '(FOR TYPE)))
		(setq containing (wisi-goto-containing containing)))
	      (+ (current-column) ada-indent-record-rel-type)))

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

	(keyword
	 ;; defer to after-cache)
	 nil)

	(name
	 (cond
	  ((let ((temp (save-excursion (wisi-goto-containing cache))))
	     (and temp
		  (memq (wisi-cache-nonterm temp) '(subprogram_body subprogram_declaration))))
	   ;; test/ada_mode-nominal.ads
	   ;; not
	   ;; overriding
	   ;; procedure
	   ;;   Procedure_1c (Item  : in out Parent_Type_1);
	   ;; indenting 'Procedure_1c'
	   ;;
	   ;; not overriding function
	   ;;   Function_2e (Param : in Parent_Type_1) return Float;
	   ;; indenting 'Function_2e'
	   (ada-wisi-indent-containing ada-indent-broken cache t))

	  (t
	   ;; defer to ada-wisi-after-cache, for consistency
	   nil)
	  ))

	(name-paren
	 ;; defer to ada-wisi-after-cache, for consistency
	 nil)

	(open-paren
	 (let* ((containing (wisi-goto-containing cache))
		(containing-pos (point)))
	   (cl-case (wisi-cache-token containing)
	     (COMMA
	      ;; test/ada_mode-parens.adb
	      ;; A : Matrix_Type :=
	      ;;   ((1, 2, 3),
	      ;;    (4, 5, 6),
	      ;; indenting (4; containing is '),' ; 0
	      ;;
	      ;; test/ada_mode-parens.adb
	      ;; Local_14 : Local_14_Type :=
	      ;;   ("123",
	      ;;    "456" &
	      ;;    ("789"));
	      ;; indenting ("4"; contaning is '3",' ; ada-indent-broken

	      (ada-wisi-indent-containing
	       (if (= (nth 1 prev-token) containing-pos) 0 ada-indent-broken)
	       containing))

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
		 (ada-wisi-indent-containing ada-indent-broken containing t))
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
		(WITH
		 ;; test/aspects.ads
		 ;;    function Wuff return Boolean with Pre =>
		 ;;      (for all x in U =>
		 ;; indenting '(for';  containing is '=>', 'with', 'function'
		 (ada-wisi-indent-cache (1- ada-indent) containing))
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

	     (WHEN
	      ;; test/ada_mode-nominal.adb
	      ;;
	      ;; when Local_1 = 0 and not
	      ;;   (Local_2 = 1)
	      ;; indenting (Local_2
	      ;;
	      ;; entry E3
	      ;;   (X : Integer) when Local_1 = 0 and not
	      ;;     (Local_2 = 1)
	      (+ (ada-wisi-current-indentation) ada-indent-broken))

	     ((IDENTIFIER selected_component name)
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
	      ;;
	      ;; test/ada_mode-parens.adb
	      ;; Local_11 : Local_11_Type := Local_11_Type'
	      ;;   (A => Integer
	      ;;      (1.0),
	      ;;    B => Integer
	      ;;      (2.0));
	      ;;
	      ;; test/ada_mode-parens.adb
	      ;; Local_12 : Local_11_Type
	      ;;   := Local_11_Type'(A => Integer
	      ;;     (1.0),
	      ;; indenting (1.0)
	      (+ (ada-wisi-current-indentation) ada-indent-broken))

	     (t
	      (cond
		((memq (wisi-cache-class containing) '(block-start statement-start))
		 ;; test/ada_mode-nominal.adb
		 ;; entry E2
		 ;;   (X : Integer)
		 ;; indenting (X
		 (ada-wisi-indent-cache ada-indent-broken containing))

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

	(return-with-params;; parameter list
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

	(return-without-params;; no parameter list
	 (wisi-goto-containing cache nil) ;; matching 'function'
	 (+ (current-column) ada-indent-broken))

	(statement-end
	 (ada-wisi-indent-containing ada-indent-broken cache t))

	(statement-other
	 (save-excursion
	   (let ((containing (wisi-goto-containing cache nil)))
	     (while (not (wisi-cache-nonterm containing))
	       (setq containing (wisi-goto-containing containing)))

	     (cond
	      ;; cases to defer to after-cache
	      ((and
		(eq (wisi-cache-nonterm cache) 'qualified_expression)
		;; test/ada_mode-parens.adb Local_13 Integer'
		(not (eq (wisi-cache-token containing) 'COLON_EQUAL)))
	       ;; _not_ test/indent.ads CSCL_Type'
	       nil)

	      ;; handled here
	      (t
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
		  (cl-ecase (wisi-cache-nonterm containing)
		    (aggregate
		     ;; test/ada_mode-nominal-child.adb
		     ;; return (Parent_Type_1
		     ;;         with 1, 0.0, False);
		     ;; indenting 'with'; containing is '('
		     (+ (current-column) 1))

		    (component_declaration
		     ;; test/ada_mode-nominal.ads Record_Type_3 ':'
		     (+ (current-column) ada-indent-broken))

		    (entry_body
		     ;; test/ada_mode-nominal.adb
		     ;; entry E2
		     ;;   (X : Integer)
		     ;;   when Local_1 = 0 and not
		     ;; indenting 'when'; containing is 'entry'
		     (+ (current-column) ada-indent-broken))

		    (formal_package_declaration
		     ;; test/ada_mode-generic_package.ads
		     ;; with package A_Package_7 is
		     ;;   new Ada.Text_IO.Integer_IO (Num => Formal_Signed_Integer_Type);
		     ;; indenting 'new'; containing is 'with'
		     (+ (current-column) ada-indent-broken))

		    ((full_type_declaration
		      single_protected_declaration
		      single_task_declaration
		      subtype_declaration
		      task_type_declaration)

		     (while (not (memq (wisi-cache-token containing) '(PROTECTED SUBTYPE TASK TYPE)))
		       (setq containing (wisi-goto-containing containing)))

		     (cond
		      ((eq (wisi-cache-token cache) 'WITH)
		       (let ((type-col (current-column))
			     (null_private (save-excursion (wisi-goto-end-1 cache)
							   (eq 'WITH (wisi-cache-token (wisi-backward-cache))))))
			 (cond
			  ((eq 'aspect_specification_opt (wisi-cache-nonterm cache))
			   ;; test/aspects.ads
			   ;; subtype Integer_String is String
			   ;;   with Dynamic_Predicate => Integer'Value (Integer_String) in Integer
			   ;; indenting 'with'
			   ;;
			   ;; test/ada_mode.ads
			   ;; protected Separate_Protected_Body
			   ;; with
			   ;;   Priority => 5
			   ;; indenting 'with'
			   ;;
			   ;; test/ada_nominal.ads
			   ;; task type Task_Type_1 (Name : access String)
			   ;; with
			   ;;    Storage_Size => 512 + 256
			   ;; indenting 'with'
			   type-col)

			  (null_private
			   ;; 'with null record;' or 'with private;'
			   ;; test/ada_mode-nominal.ads
			   ;; type Limited_Derived_Type_3 is abstract limited new Private_Type_1
			   ;;   with null record;
			   ;; indenting 'with'; containing is 'is'
			   (+ type-col ada-indent-broken))

			  (t
			   ;; test/ada_mode-nominal.ads
			   ;; type Unconstrained_Array_Type_3 is array (Integer range <>, Standard.Character range <>)
			   ;;   of Object_Access_Type_1;
			   ;; indenting 'of'; containing is 'is'
			   ;;
			   ;; type Object_Access_Type_7
			   ;;   is access all Integer;
			   ;; indenting 'is'; containing is 'type'
			   (+ type-col ada-indent-record-rel-type)))))

		      (t
		       ;; test/ada_mode-nominal.ads
		       ;; type Limited_Derived_Type_2a is abstract limited new Private_Type_1
		       ;;   with record
		       ;; indenting 'with record'
		       ;;
		       ;; test/access_in_record.ads
		       ;; type A
		       ;;    is new Ada.Streams.Root_Stream_Type with record
		       ;;
		       ;; test/adacore_9717_001.ads A_Long_Name
		       ;; subtype A_Long_Name
		       ;;   is Ada.Text_Io.Count;
		       ;; indenting 'is'
		       (+ (current-column) ada-indent-broken))
		      ))

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

		    (private_extension_declaration
		     ;; test/ada_mode-nominal.ads
		     ;; type Limited_Derived_Type_3 is abstract limited
		     ;;   new Private_Type_1 with private;
		     (+ (current-indentation) ada-indent-broken))

		    (private_type_declaration
		     ;; test/aspects.ads
		     ;; type Vector is tagged private
		     ;; with
		     ;; indenting 'with'
		     (current-indentation))

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
		       (IS
			;; test/ada_mode-nominal.ads
			;; procedure Procedure_1d
			;;   (Item   : in out Parent_Type_1;
			;;    Item_1 : in     Character;
			;;    Item_2 : out    Character)
			;;   is null;
			;; indenting 'is'
			(+ (current-column) ada-indent-broken))

		       (OVERRIDING
			;; indenting 'overriding' following 'not'
			(current-column))

		       ((PROCEDURE FUNCTION)
			;; indenting 'procedure' or 'function following 'overriding'
			(current-column))

		       (WITH
			;; indenting aspect specification on subprogram declaration
			;; test/aspects.ads
			;; procedure Foo (X : Integer;
			;;                Y : out Integer)
			;; with Pre => X > 10 and
			;; indenting 'with'
			(current-column))
		       ))

		    ))))
	      )))) ;; end statement-other

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
		  (ada-wisi-indent-list-break cache prev-token))

		 (statement-other
		  ;; defer to ada-wisi-after-cache
		  nil)
		 ))))
	     ))
	))
    ))

(defun ada-wisi-after-cache ()
  "Point is at indentation, not before a cached token. Find previous
cached token, return new indentation for point."
  (save-excursion
    (let ((start (point))
	  (prev-token (save-excursion (wisi-backward-token)))
	  (cache (wisi-backward-cache)))

      (cond
       ((not cache) ;; bob
	0)

       (t
	(while (memq (wisi-cache-class cache) '(keyword name name-paren type))
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
	      ;;
	      ;; test/ada_mode-conditional_expressions.adb
	      ;; K3 : Integer := (if
	      ;;                    J > 42
	      ;;                  then
	      ;;                    -1
	      ;;                  else
	      ;;                    +1);
	      ;; indenting -1, +1
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
	   ;;
	   ;; test/ada_mode-slices.adb
	   ;; Put_Line(Day'Image(D1) & " - " & Day'Image(D2) & " = " &
	   ;;            Integer'Image(N));
	   ;; indenting 'Integer'
	   (when (memq (wisi-cache-nonterm cache)
		       '(actual_parameter_part attribute_designator))
	     (setq cache (wisi-goto-containing cache)))
	   (ada-wisi-indent-containing ada-indent-broken cache nil))

	  (list-break
	   (ada-wisi-indent-list-break cache prev-token))

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
	   ;; test/ada_mode-parens.adb
	   ;; return Float (
	   ;;               Integer'Value
	   ;; indenting 'Integer'
	   (let ((paren-column (current-column))
		 (start-is-comment (save-excursion (goto-char start) (looking-at comment-start-skip))))
	     (wisi-forward-token); point is now after paren
	     (if start-is-comment
		 (skip-syntax-forward " >"); point is now on comment
	       (forward-comment (point-max)); point is now on first token
	       )
	     (if (= (point) start)
		 ;; case 2) or 3)
		 (1+ paren-column)
	       ;; 1)
	       (+ paren-column 1 ada-indent-broken))))

	  ((return-with-params return-without-params)
	   ;; test/ada_mode-nominal.adb
	   ;; function Function_Access_1
	   ;;   (A_Param : in Float)
	   ;;   return
	   ;;     Standard.Float
	   ;; indenting 'Standard.Float'
	   ;;
	   ;; test/ada_mode-expression_functions.ads
	   ;; function Square (A : in Float) return Float
	   ;;   is (A * A);
	   ;; indenting 'is'
	   ;;
	   ;; test/ada_mode-nominal.ads
	   ;; function Function_2g
	   ;;   (Param : in Private_Type_1)
	   ;;   return Float
	   ;;   is abstract;
	   ;; indenting 'is'
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
	      ;;    -- 'abort' indented with ada-indent-broken, since this is part
	      ;;    Titi;
	      (ada-wisi-indent-containing ada-indent cache))

	     ;; test/subdir/ada_mode-separate_task_body.adb
	     ((COLON COLON_EQUAL)
	      ;; Local_3 : constant Float :=
	      ;;   Local_2;
	      ;;
	      ;; test/ada_mode-nominal.ads
	      ;; type Record_Type_3 (Discriminant_1 : access Integer) is tagged record
	      ;;    Component_1 : Integer; -- end 2
	      ;;    Component_2 :
	      ;;      Integer;
	      ;; indenting 'Integer'; containing is ';'
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
	      (let ((cache-col (current-column))
		    (cache-pos (point))
		    (line-end-pos (line-end-position))
		    (containing (wisi-goto-containing cache nil)))
		(while (eq (wisi-cache-nonterm containing) 'association_list)
		  (setq containing (wisi-goto-containing containing nil)))

		(cl-ecase (wisi-cache-nonterm containing)
		  ((actual_parameter_part aggregate)
		   ;; ada_mode-generic_package.ads
		   ;; with package A_Package_2 is new Ada.Text_IO.Integer_IO (Num =>
		   ;;                                                           Formal_Signed_Integer_Type);
		   ;;  indenting 'Formal_Signed_...', point on '(Num'
		   ;;
		   ;; test/ada_mode-parens.adb
		   ;; (1      =>
		   ;;    1,
		   ;;  2      =>
		   ;;    1 + 2 * 3,
		   ;; indenting '1,' or '1 +'; point on '(1'
		   ;;
		   ;; test/ada_mode-parens.adb
		   ;; Local_13 : Local_11_Type
		   ;;   := (Integer'(1),
		   ;;       Integer'(2));
		   ;; indenting 'Integer'; point on '(Integer'
		   (+ (current-column) 1 ada-indent-broken))

		  (aspect_specification_opt
		   ;; test/aspects.ads
		   ;; with Pre => X > 10 and
		   ;;             X < 50 and
		   ;;             F (X),
		   ;;   Post =>
		   ;;     Y >= X and
		   ;; indenting 'X < 50' or 'Y >= X'; cache is '=>', point is on '=>'
		   ;; or indenting 'Post =>'; cache is ',', point is on 'with'
		   (cl-ecase (wisi-cache-token cache)
		     (COMMA
		      (+ (current-indentation) ada-indent-broken))

		     (EQUAL_GREATER
		      (if (= (+ 2 cache-pos) line-end-pos)
			  ;;   Post =>
			  ;;     Y >= X and
			  (progn
			    (goto-char cache-pos)
			    (+ (current-indentation) ada-indent-broken))
			;; with Pre => X > 10 and
			;;             X < 50 and
			(+ 3 cache-col)))
		     ))

		  (association_list
		   (cl-ecase (save-excursion (wisi-cache-token (wisi-goto-containing cache nil)))
		     (COMMA
		      (ada-wisi-indent-containing (* 2 ada-indent-broken) cache))
		     ))

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


		  (select_alternative
		   ;; test/ada_mode-nominal.adb
		   ;; or when Started
		   ;;      =>
		   ;;       accept Finish;
		   ;; indenting 'accept'; point is on 'when'
		   (+ (current-column) ada-indent))

		  (variant
		   ;; test/generic_param.adb
		   ;; case Item_Type is
		   ;;    when Fix | Airport =>
		   ;;       null;
		   ;; indenting 'null'
		   (+ (current-column) ada-indent))

		  )))

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

		(null_procedure_declaration
		 ;; ada_mode-nominal.ads
		 ;; procedure Procedure_3b is
		 ;;   null;
		 ;; indenting null
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

	     (NEW
	      ;; ada_mode-nominal.ads
	      ;; type Limited_Derived_Type_2 is abstract limited new Private_Type_1 with
	      ;;   private;
	      ;;
	      ;; test/ada_mode-generic_instantiation.ads
	      ;;   procedure Procedure_6 is new
	      ;;     Instance.Generic_Procedure (Integer, Function_1);
	      ;; indenting 'Instance'; containing is 'new'
	      (ada-wisi-indent-containing ada-indent-broken cache))

	     (OF
	      ;; ada_mode-nominal.ads
	      ;; Anon_Array_2 : array (1 .. 10) of
	      ;;   Integer;
	      (ada-wisi-indent-containing ada-indent-broken cache))

	     (WHEN
	      ;; test/ada_mode-parens.adb
	      ;; exit when A.all
	      ;;   or else B.all
	      (ada-wisi-indent-containing ada-indent-broken cache))

	     (WITH
	      (cl-ecase (wisi-cache-nonterm cache)
		(aggregate
		 ;; test/ada_mode-nominal-child.ads
		 ;;   (Default_Parent with
		 ;;    10, 12.0, True);
		 ;; indenting '10'; containing is '('
		 (ada-wisi-indent-containing 0 cache nil))

		(aspect_specification_opt
		 ;; test/aspects.ads
		 ;; type Vector is tagged private
		 ;; with
		 ;;   Constant_Indexing => Constant_Reference,
		 ;; indenting 'Constant_Indexing'; point is on 'with'
		 (+ (current-indentation) ada-indent-broken))
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
	      ;;
	      ;; test/ada_mode-conditional_expressions.adb
	      ;; K3 : Integer := (if
	      ;;                    J > 42
	      ;;                  then
	      ;;                    -1
	      ;;                  else
	      ;;                    +1);
	      ;; indenting J
	      (ada-wisi-indent-cache ada-indent-broken cache))
	     ))
	  )))
      )))

(defun ada-wisi-comment ()
  "Compute indentation of a comment. For `wisi-indent-calculate-functions'."
  ;; We know we are at the first token on a line. We check for comment
  ;; syntax, not comment-start, to accomodate gnatprep, skeleton
  ;; placeholders, etc.
  (when (and (not (= (point) (point-max))) ;; no char after EOB!
	     (= 11 (syntax-class (syntax-after (point)))))

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
	  (pragma (wisi-goto-end-1 cache))
	  (use_clause (wisi-goto-end-1 cache))
	  (with_clause
	   (when (not begin)
	     (setq begin (point-at-bol)))
	   (wisi-goto-end-1 cache))
	  (t
	   ;; start of compilation unit
	   (setq end (point-at-bol))
	   (unless begin
	     (setq begin end)))
	  ))
      (cons begin end)
    )))

(defun ada-wisi-on-context-clause ()
  "For `ada-on-context-clause'."
  (let (cache)
    (save-excursion
      ;; Don't require parse of large file just for ada-find-other-file
      (and (< (point-max) wisi-size-threshold)
	   (setq cache (wisi-goto-statement-start))
	   (memq (wisi-cache-nonterm cache) '(use_clause with_clause))
	   ))))

(defun ada-wisi-goto-subunit-name ()
  "For `ada-goto-subunit-name'."
  (wisi-validate-cache (point-max))
  (if (not (> wisi-cache-max (point)))
      (progn
	(message "parse failed; can't goto subunit name")
	nil)

    (let ((end nil)
	  cache
	  (name-pos nil))
      (save-excursion
	;; move to top declaration
	(goto-char (point-min))
	(setq cache (or (wisi-get-cache (point))
			(wisi-forward-cache)))
	(while (not end)
	  (cl-case (wisi-cache-nonterm cache)
	    ((pragma use_clause with_clause)
	     (wisi-goto-end-1 cache)
	     (setq cache (wisi-forward-cache)))
	    (t
	     ;; start of compilation unit
	     (setq end t))
	    ))
	(when (eq (wisi-cache-nonterm cache) 'subunit)
	  (wisi-forward-find-class 'name (point-max)) ;; parent name
	  (wisi-forward-token)
	  (wisi-forward-find-class 'name (point-max)) ;; subunit name
	  (setq name-pos (point)))
	)
      (when name-pos
	(goto-char name-pos))
      )))

(defun ada-wisi-goto-declaration-start ()
  "For `ada-goto-declaration-start', which see.
Also return cache at start."
  (wisi-validate-cache (point))
  (unless (> wisi-cache-max (point))
    (error "parse failed; can't goto declarative-region-start"))

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

(defun ada-wisi-goto-declaration-end ()
  "For `ada-goto-declaration-end', which see."
  ;; first goto-declaration-start, so we get the right end, not just
  ;; the current statement end.
  (wisi-goto-end-1 (ada-wisi-goto-declaration-start)))

(defun ada-wisi-goto-declarative-region-start ()
  "For `ada-goto-declarative-region-start', which see."
  (wisi-validate-cache (point))
  (unless (> wisi-cache-max (point))
    (error "parse failed; can't goto declarative-region-start"))

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
	    (wisi-forward-token)
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
  (when (< wisi-cache-max end)
    (error "parse failed; can't scan paramlist"))

  (goto-char begin)
  (let (token
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
      (let ((token-text (wisi-forward-token)))
	(setq token (nth 0 token-text))
	(setq text  (wisi-token-text token-text)))
      (cond
       ((equal token 'COMMA) nil);; multiple identifiers

       ((equal token 'COLON)
	;; identifiers done. find type-begin; there may be no mode
	(skip-syntax-forward " ")
	(setq type-begin (point))
	(save-excursion
	  (while (member (car (wisi-forward-token)) '(ALIASED IN OUT NOT NULL ACCESS CONSTANT PROTECTED))
	    (skip-syntax-forward " ")
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
	(setq type-end (save-excursion (backward-char 2) (skip-syntax-backward " ") (point)))
	(skip-syntax-forward " ")
	(setq default-begin (point))
	(wisi-forward-find-token 'SEMICOLON end t))

       ((member token '(SEMICOLON RIGHT_PAREN))
	(when (not type-end)
	  (setq type-end (save-excursion (backward-char 1) (skip-syntax-backward " ") (point))))

	(setq type (buffer-substring-no-properties type-begin type-end))

	(when default-begin
	  (setq default (buffer-substring-no-properties default-begin (1- (point)))))

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
	      default-begin nil))

       (t
	(when (not type-begin)
          (cl-pushnew text identifiers :test #'equal)))
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
	  (cache (condition-case nil (ada-wisi-goto-declaration-start) (error nil))))
      (if (null cache)
	  ;; bob or failed parse
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
	    generic_subprogram_declaration ;; after 'generic'
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
  (define-key ada-mode-map "\M-i" 'wisi-goto-statement-end)
  (define-key ada-mode-map "\M-j" 'wisi-show-cache)
  (define-key ada-mode-map "\M-k" 'wisi-show-token)
  )

(defun ada-wisi-number-p (token-text)
  "Return t if TOKEN-TEXT plus text after point matches the
syntax for a real literal; otherwise nil. point is after
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

  ;; Handle escaped quotes in strings
  (setq wisi-string-quote-escape-doubled t)

  (set (make-local-variable 'comment-indent-function) 'wisi-comment-indent)
  )

(add-hook 'ada-mode-hook 'ada-wisi-setup)

(setq ada-fix-context-clause 'ada-wisi-context-clause)
(setq ada-goto-declaration-end 'ada-wisi-goto-declaration-end)
(setq ada-goto-declaration-start 'ada-wisi-goto-declaration-start)
(setq ada-goto-declarative-region-start 'ada-wisi-goto-declarative-region-start)
(setq ada-goto-end 'wisi-goto-statement-end)
(setq ada-goto-subunit-name 'ada-wisi-goto-subunit-name)
(setq ada-in-paramlist-p 'ada-wisi-in-paramlist-p)
(setq ada-indent-statement 'wisi-indent-statement)
(setq ada-make-subprogram-body 'ada-wisi-make-subprogram-body)
(setq ada-next-statement-keyword 'wisi-forward-statement-keyword)
(setq ada-on-context-clause 'ada-wisi-on-context-clause)
(setq ada-prev-statement-keyword 'wisi-backward-statement-keyword)
(setq ada-reset-parser 'wisi-invalidate-cache)
(setq ada-scan-paramlist 'ada-wisi-scan-paramlist)
(setq ada-show-parse-error 'wisi-show-parse-error)
(setq ada-which-function 'ada-wisi-which-function)

(provide 'ada-wisi)
(provide 'ada-indent-engine)

;; end of file
