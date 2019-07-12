;;; ada-lalr-elisp.el --- Generated parser support file  -*- lexical-binding:t -*-
;;  command line: wisitoken-bnf-generate.exe  --generate LALR elisp elisp ada.wy

;;  Copyright (C) 2013 - 2019 Free Software Foundation, Inc.

;;  This program is free software; you can redistribute it and/or
;;  modify it under the terms of the GNU General Public License as
;;  published by the Free Software Foundation; either version 3, or (at
;;  your option) any later version.
;;
;;  This software is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;  General Public License for more details.
;;
;;  You should have received a copy of the GNU General Public License
;;  along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

(require 'wisi)
(require 'wisi-compile)
(require 'wisi-elisp-parse)

(defconst ada-lalr-elisp-keyword-table-raw
  '(
   ("abs" . ABS)
   ("accept" . ACCEPT)
   ("abort" . ABORT)
   ("abstract" . ABSTRACT)
   ("access" . ACCESS)
   ("aliased" . ALIASED)
   ("all" . ALL)
   ("and" . AND)
   ("array" . ARRAY)
   ("at" . AT)
   ("begin" . BEGIN)
   ("body" . BODY)
   ("case" . CASE)
   ("constant" . CONSTANT)
   ("declare" . DECLARE)
   ("delay" . DELAY)
   ("delta" . DELTA)
   ("digits" . DIGITS)
   ("do" . DO)
   ("else" . ELSE)
   ("elsif" . ELSIF)
   ("end" . END)
   ("entry" . ENTRY)
   ("exception" . EXCEPTION)
   ("exit" . EXIT)
   ("for" . FOR)
   ("function" . FUNCTION)
   ("generic" . GENERIC)
   ("goto" . GOTO)
   ("if" . IF)
   ("in" . IN)
   ("interface" . INTERFACE)
   ("is" . IS)
   ("limited" . LIMITED)
   ("loop" . LOOP)
   ("mod" . MOD)
   ("new" . NEW)
   ("not" . NOT)
   ("null" . NULL)
   ("of" . OF)
   ("or" . OR)
   ("others" . OTHERS)
   ("out" . OUT)
   ("overriding" . OVERRIDING)
   ("package" . PACKAGE)
   ("pragma" . PRAGMA)
   ("private" . PRIVATE)
   ("procedure" . PROCEDURE)
   ("protected" . PROTECTED)
   ("raise" . RAISE)
   ("range" . RANGE)
   ("record" . RECORD)
   ("rem" . REM)
   ("renames" . RENAMES)
   ("requeue" . REQUEUE)
   ("return" . RETURN)
   ("reverse" . REVERSE)
   ("separate" . SEPARATE)
   ("select" . SELECT)
   ("some" . SOME)
   ("subtype" . SUBTYPE)
   ("synchronized" . SYNCHRONIZED)
   ("tagged" . TAGGED)
   ("task" . TASK)
   ("terminate" . TERMINATE)
   ("then" . THEN)
   ("type" . TYPE)
   ("until" . UNTIL)
   ("use" . USE)
   ("when" . WHEN)
   ("while" . WHILE)
   ("with" . WITH)
   ("xor" . XOR)
   ))

(defconst ada-lalr-elisp-token-table-raw
  '(
   ("left-paren"
    (LEFT_PAREN . "(")
    )
   ("right-paren"
    (RIGHT_PAREN . ")")
    )
   ("punctuation"
    (AMPERSAND . "&")
    (BAR . "|")
    (BOX . "<>")
    (COLON . ":")
    (COLON_EQUAL . ":=")
    (COMMA . ",")
    (DOT . ".")
    (DOT_DOT . "..")
    (EQUAL . "=")
    (EQUAL_GREATER . "=>")
    (GREATER . ">")
    (GREATER_EQUAL . ">=")
    (GREATER_GREATER . ">>")
    (LESS . "<")
    (LESS_EQUAL . "<=")
    (LESS_LESS . "<<")
    (MINUS . "-")
    (PLUS . "+")
    (SEMICOLON . ";")
    (SLASH . "/")
    (SLASH_EQUAL . "/=")
    (STAR . "*")
    (STAR_STAR . "**")
    (TICK_1 . "'")
    )
   ("number"
    (NUMERIC_LITERAL ada-wisi-number-p)
    )
   ("symbol"
    (IDENTIFIER . "")
    )
   ("string-double"
    (STRING_LITERAL . "")
    )
   ("string-single"
    (CHARACTER_LITERAL . "")
    )
   ))

(defconst ada-lalr-elisp-parse-table
   (wisi-compile-grammar
   '(((abstract_limited_synchronized_opt
       ((ABSTRACT LIMITED ))
       ((ABSTRACT SYNCHRONIZED ))
       ((ABSTRACT ))
       ((LIMITED ))
       ((SYNCHRONIZED ))
       (()))
      (abstract_limited_opt
       ((ABSTRACT LIMITED ))
       ((LIMITED ))
       ((ABSTRACT ))
       (()))
      (abstract_tagged_limited_opt
       ((ABSTRACT TAGGED LIMITED ))
       ((ABSTRACT TAGGED ))
       ((TAGGED LIMITED ))
       ((TAGGED ))
       ((LIMITED ))
       (()))
      (abstract_subprogram_declaration
       ((overriding_indicator_opt subprogram_specification IS ABSTRACT aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 statement-override 6 statement-end])
      (wisi-indent-action [nil nil ada-indent-broken ada-indent-broken nil nil]))))
      (accept_statement
       ((ACCEPT IDENTIFIER actual_parameter_part_opt parameter_profile_opt DO handled_sequence_of_statements END identifier_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 5 motion 9 statement-end])
      (wisi-containing-action 1 4) ;; for goto-declaration-start
      (wisi-containing-action 1 6) ;; ""
      (wisi-motion-action [1 5 [6 EXCEPTION WHEN] 9])
      (wisi-face-apply-action [2 nil font-lock-function-name-face 8 nil font-lock-function-name-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken [nil ada-indent] [ada-indent ada-indent] nil nil nil])))
       ((ACCEPT IDENTIFIER actual_parameter_part_opt parameter_profile_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 5 statement-end])
      (wisi-containing-action 1 4) ;; for goto-declaration-start
      (wisi-face-apply-action [2 nil font-lock-function-name-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken nil]))))
      (access_definition
       ((null_exclusion_opt ACCESS protected_opt PROCEDURE parameter_profile_opt )
        (wisi-indent-action [nil nil nil nil (wisi-anchored% 4 ada-indent-broken)]))
       ((null_exclusion_opt ACCESS protected_opt FUNCTION parameter_and_result_profile )
        (wisi-indent-action [nil nil nil nil (wisi-anchored%- 4 ada-indent-broken)]))
       ((null_exclusion_opt ACCESS general_access_modifier_opt name )
        (wisi-face-apply-action [4 font-lock-function-name-face font-lock-type-face])))
      (actual_parameter_part
       ((LEFT_PAREN association_list RIGHT_PAREN )
        (wisi-indent-action [nil [(wisi-anchored 1 1) (wisi-anchored 1 1)] (wisi-anchored 1 0)]))
       ((LEFT_PAREN conditional_quantified_expression RIGHT_PAREN )
        (wisi-indent-action [nil [(wisi-anchored 1 1) (wisi-anchored 1 1)] (wisi-anchored 1 0)])))
      (actual_parameter_part_opt
       ((actual_parameter_part ))
       (()))
      (aggregate
       ((LEFT_PAREN expression_opt WITH NULL RECORD RIGHT_PAREN )
        (wisi-indent-action [nil (wisi-anchored 1 1) (wisi-anchored 1 1) nil nil (wisi-anchored 1 0)]))
       ((LEFT_PAREN expression_opt WITH association_list RIGHT_PAREN )
        (wisi-indent-action [nil (wisi-anchored 1 1) (wisi-anchored 1 1) [(wisi-anchored 1 1) (wisi-anchored 1 1)]
                         (wisi-anchored 1 0)]))
       ((LEFT_PAREN NULL RECORD RIGHT_PAREN ))
       ((LEFT_PAREN conditional_quantified_expression RIGHT_PAREN )
        (wisi-indent-action [nil [(wisi-anchored 1 1) (wisi-anchored 1 1)] (wisi-anchored 1 0)]))
       ((LEFT_PAREN association_list RIGHT_PAREN )
        (wisi-indent-action [nil [(wisi-anchored 1 1) (wisi-anchored 1 1)] (wisi-anchored 1 0)])))
      (aliased_opt
       ((ALIASED ))
       (()))
      (and_interface_list_opt
       ((AND interface_list ))
       (()))
      (array_type_definition
       ((ARRAY LEFT_PAREN index_subtype_definition_list RIGHT_PAREN OF component_definition )
        (wisi-indent-action [nil nil (wisi-anchored 2 1) (wisi-anchored 2 0) nil nil]))
       ((ARRAY LEFT_PAREN discrete_subtype_definition_list RIGHT_PAREN OF component_definition )
        (wisi-indent-action [nil nil (wisi-anchored 2 1) (wisi-anchored 2 0) nil nil])))
      (aspect_clause
       ((FOR attribute_reference USE expression_opt SEMICOLON )
        (wisi-statement-action [1 statement-start 5 statement-end]))
       ((enumeration_representation_clause ))
       ((record_representation_clause ))
       ((at_clause )))
      (aspect_specification_opt
       ((WITH association_list )
        (wisi-indent-action [nil ada-indent-broken]))
       (()))
      (assignment_statement
       ((name COLON_EQUAL expression_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 4 statement-end])
      (wisi-containing-action 1 3)
      (wisi-indent-action [nil
                           ada-indent-broken
                           (wisi-hanging
                            (wisi-anchored% 2 ada-indent-broken)
                            (wisi-anchored% 3 ada-indent-broken))
                           nil]))))
      (association_opt
       ((CHARACTER_LITERAL EQUAL_GREATER expression_opt )
        (wisi-indent-action [nil ada-indent-broken
                         [(wisi-anchored% 2 ada-indent-broken) (wisi-anchored% 2 ada-indent-broken)]]))
       ((CHARACTER_LITERAL EQUAL_GREATER BOX ))
       ((discrete_choice_list EQUAL_GREATER expression_opt )
        (wisi-indent-action [(wisi-hanging nil ada-indent-broken)
                           ada-indent-broken
                           [(wisi-hanging%- (wisi-anchored% 2 ada-indent-broken)
                                            (wisi-anchored% 2 (* 2 ada-indent-broken)))
                            (wisi-hanging%- (wisi-anchored% 2 ada-indent-broken)
                                            (wisi-anchored% 2 (* 2 ada-indent-broken)))]]))
       ((discrete_choice_list EQUAL_GREATER BOX )
        (wisi-indent-action [(wisi-hanging nil ada-indent-broken) ada-indent-broken nil]))
       ((expression )
        (wisi-indent-action [[(wisi-hanging nil ada-indent-broken) (wisi-hanging nil ada-indent-broken)]]))
       (()))
      (association_list
       ((association_list COMMA association_opt ))
       ((association_opt )))
      (asynchronous_select
       ((SELECT triggering_alternative THEN ABORT sequence_of_statements_opt END SELECT SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 motion 8 statement-end])
      (wisi-containing-action 1 2)
      (wisi-containing-action 1 5)
      (wisi-indent-action [nil [ada-indent ada-indent] [nil ada-indent-broken] ada-indent-broken
                           [ada-indent ada-indent] nil nil nil]))))
      (at_clause
       ((FOR direct_name USE AT expression_opt SEMICOLON )
        (wisi-statement-action [1 statement-start 6 statement-end])))
      (attribute_reference
       ((name tick attribute_designator )))
      (attribute_designator
       ((name ))
       ((ACCESS ))
       ((DELTA ))
       ((DIGITS ))
       ((MOD )))
      (binary_adding_operator
       ((PLUS ))
       ((MINUS ))
       ((AMPERSAND )))
      (block_label
       ((IDENTIFIER COLON )
        (wisi-indent-action [ada-indent-label nil])))
      (block_label_opt
       ((block_label ))
       (()))
      (block_statement
       ((block_label_opt DECLARE declarative_part_opt BEGIN handled_sequence_of_statements END identifier_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 misc 4 motion 8 statement-end])
      (wisi-containing-action 2 3)
      (wisi-containing-action 2 5)
      (wisi-motion-action [2 4 [5 EXCEPTION WHEN] 8])
      (wisi-indent-action [nil nil [ada-indent ada-indent] nil [ada-indent ada-indent] nil nil nil])))
       ((block_label_opt BEGIN handled_sequence_of_statements END identifier_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 misc 6 statement-end])
      (wisi-containing-action 2 3)
      (wisi-motion-action [2 [3 EXCEPTION WHEN] 6])
      (wisi-indent-action [nil nil [ada-indent ada-indent] nil nil nil]))))
      (body_g
       ((proper_body ))
       ((body_stub )))
      (body_stub
       ((subprogram_body_stub ))
       ((package_body_stub ))
       ((task_body_stub ))
       ((protected_body_stub )))
      (case_expression
       ((CASE expression_opt IS case_expression_alternative_list )
        (wisi-indent-action [nil ada-indent-broken nil ada-indent-when])))
      (case_expression_alternative
       ((WHEN discrete_choice_list EQUAL_GREATER expression_opt )
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken
                           (wisi-hanging (wisi-anchored% 1 ada-indent)
                                         (wisi-anchored% 1 (+ ada-indent ada-indent-broken)))])))
      (case_expression_alternative_list
       ((case_expression_alternative_list COMMA case_expression_alternative )
        (wisi-indent-action [nil [nil ada-indent-when] nil]))
       ((case_expression_alternative )))
      (case_statement
       ((CASE expression_opt IS case_statement_alternative_list END CASE SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 motion 7 statement-end])
      (wisi-containing-action 1 4)
      (wisi-motion-action [1 [4 WHEN] 7])
      (wisi-indent-action [nil ada-indent-broken nil [ada-indent-when ada-indent-when] nil nil nil]))))
      (case_statement_alternative
       ((WHEN discrete_choice_list EQUAL_GREATER sequence_of_statements_opt )
        (progn
      (wisi-statement-action [1 motion])
      ;; ada-indent-when added in case_statement
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken [ada-indent ada-indent]]))))
      (case_statement_alternative_list
       ((case_statement_alternative_list case_statement_alternative ))
       ((case_statement_alternative )))
      (compilation_unit
       ((with_clause ))
       ((subunit ))
       ((PRIVATE declaration )
        (wisi-indent-action [0 0]))
       ((declaration ))
       ((statement )))
      (compilation_unit_list
       ((compilation_unit_list compilation_unit )
        (wisi-indent-action [0 [0 0]]))
       ((compilation_unit )
        (wisi-indent-action [[0 0]])))
      (component_clause
       ((IDENTIFIER AT simple_expression RANGE simple_expression DOT_DOT simple_expression SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 8 statement-end])
      (wisi-indent-action [nil nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken nil]))))
      (component_clause_list
       ((component_clause_list component_clause ))
       ((component_clause )))
      (component_declaration
       ((identifier_list COLON component_definition COLON_EQUAL expression_opt aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 7 statement-end])
      (wisi-containing-action 1 3) ;; for goto-declaration-start
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken
                               (wisi-anchored% 4 ada-indent-broken)
                               ada-indent-broken nil])))
       ((identifier_list COLON component_definition aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 5 statement-end])
      (wisi-containing-action 1 3) ;; for goto-declaration-start
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken nil]))))
      (component_definition
       ((ALIASED subtype_indication ))
       ((subtype_indication ))
       ((ALIASED access_definition ))
       ((access_definition )))
      (component_item
       ((component_declaration ))
       ((aspect_clause )))
      (component_list
       ((component_list component_item ))
       ((component_list variant_part ))
       ((component_item ))
       ((variant_part ))
       ((NULL SEMICOLON )
        (wisi-statement-action [1 statement-start 2 statement-end])))
      (component_list_opt
       ((component_list ))
       (()))
      (compound_statement
       ((if_statement ))
       ((case_statement ))
       ((loop_statement ))
       ((block_statement ))
       ((extended_return_statement ))
       ((accept_statement ))
       ((select_statement )))
      (conditional_entry_call
       ((SELECT entry_call_alternative ELSE sequence_of_statements_opt END SELECT SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 motion 7 statement-end])
      (wisi-containing-action 1 2)
      (wisi-containing-action 1 4)
      (wisi-indent-action [nil [ada-indent ada-indent] nil [ada-indent ada-indent] nil nil nil]))))
      (conditional_quantified_expression
       ((if_expression ))
       ((case_expression ))
       ((quantified_expression )))
      (constant_opt
       ((CONSTANT ))
       (()))
      (constraint
       ((RANGE range_g ))
       ((index_constraint )))
      (constraint_opt
       ((constraint ))
       (()))
      (declaration
       ((abstract_subprogram_declaration ))
       ((aspect_clause ))
       ((body_g ))
       ((entry_declaration ))
       ((exception_declaration ))
       ((expression_function_declaration ))
       ((generic_declaration ))
       ((generic_instantiation ))
       ((null_procedure_declaration ))
       ((identifier_list COLON CONSTANT COLON_EQUAL expression_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 6 statement-end])
      (wisi-containing-action 1 5)
      (wisi-indent-action [(wisi-hanging nil ada-indent-broken) ada-indent-broken ada-indent-broken ada-indent-broken
                           (wisi-anchored% 4 ada-indent-broken) nil])))
       ((object_declaration ))
       ((package_declaration ))
       ((renaming_declaration ))
       ((subprogram_declaration ))
       ((subtype_declaration ))
       ((type_declaration ))
       ((use_clause )))
      (declarations
       ((declarations declaration ))
       ((declarations pragma_g ))
       ((declaration ))
       ((pragma_g )))
      (declarative_part_opt
       ((declarations ))
       (()))
      (delay_alternative
       ((delay_statement sequence_of_statements_opt )))
      (delay_statement
       ((DELAY UNTIL expression_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 4 statement-end])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken nil])))
       ((DELAY expression_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 statement-end])
      (wisi-indent-action [nil ada-indent-broken nil]))))
      (derived_type_definition
       ((abstract_limited_opt NEW name and_interface_list_opt WITH record_definition )
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-type-face]))
       ((abstract_limited_opt NEW name constraint_opt )
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-type-face])))
      (direct_name
       ((IDENTIFIER ))
       ((STRING_LITERAL )))
      (direct_name_opt
       ((direct_name ))
       (()))
      (discrete_choice
       ((expression ))
       ((NOT NULL name ))
       ((range_g ))
       ((OTHERS )))
      (discrete_choice_list
       ((discrete_choice_list BAR discrete_choice ))
       ((discrete_choice ))
       (()))
      (discrete_subtype_definition
       ((subtype_indication ))
       ((range_g )))
      (discrete_subtype_definition_list
       ((discrete_subtype_definition_list COMMA discrete_subtype_definition ))
       ((discrete_subtype_definition )))
      (discriminant_part_opt
       ((LEFT_PAREN BOX RIGHT_PAREN ))
       ((LEFT_PAREN discriminant_specification_list RIGHT_PAREN )
        (wisi-indent-action [nil (wisi-anchored 1 1) (wisi-anchored 1 0)]))
       (()))
      (discriminant_specification_opt
       ((identifier_list COLON null_exclusion_opt_name_type COLON_EQUAL expression_opt ))
       ((identifier_list COLON access_definition COLON_EQUAL expression_opt ))
       ((identifier_list COLON null_exclusion_opt_name_type ))
       ((identifier_list COLON access_definition ))
       (()))
      (discriminant_specification_list
       ((discriminant_specification_list SEMICOLON discriminant_specification_opt ))
       ((discriminant_specification_opt )))
      (elsif_expression_item
       ((ELSIF expression_opt THEN expression_opt )
        (progn
      (wisi-statement-action [1 motion 3 motion])
      (wisi-indent-action [nil [ada-indent-broken ada-indent-broken] nil ada-indent]))))
      (elsif_expression_list
       ((elsif_expression_list elsif_expression_item ))
       ((elsif_expression_item )))
      (elsif_statement_item
       ((ELSIF expression_opt THEN sequence_of_statements_opt )
        (progn
      (wisi-statement-action [1 motion 3 motion])
      (wisi-indent-action [nil [ada-indent-broken ada-indent-broken] nil [ada-indent ada-indent]]))))
      (elsif_statement_list
       ((elsif_statement_list elsif_statement_item ))
       ((elsif_statement_item )))
      (entry_body
       ((ENTRY IDENTIFIER entry_body_formal_part WHEN expression_opt IS declarative_part_opt BEGIN handled_sequence_of_statements END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 4 motion 6 motion 8 motion 12 statement-end])
        (wisi-name-action 2)
        (wisi-containing-action 1 3) ;; for goto-declaration-start
        (wisi-containing-action 1 7)
        (wisi-containing-action 1 9)
        (wisi-motion-action [1 4 6 8 12])
        (wisi-face-apply-action [2 nil font-lock-function-name-face 11 nil font-lock-function-name-face])

        ;; test/ada_mode-nominal.adb
        ;; entry E2
        ;;   (X : Integer)
        ;;   when Local_1 = 0 and not
        ;;     (Local_2 = 1)
        ;;
        ;; entry E3
        ;;   (X : Integer) when Local_1 = 0 and not
        ;;     (Local_2 = 1)
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken
                                 (wisi-anchored% 4 ada-indent-broken)
                                 nil [ada-indent ada-indent] nil [ada-indent ada-indent] nil nil nil]))))
      (entry_body_formal_part
       ((LEFT_PAREN FOR IDENTIFIER IN discrete_subtype_definition RIGHT_PAREN parameter_profile_opt )
        (wisi-indent-action [nil (wisi-anchored 1 1) (wisi-anchored 1 1) (wisi-anchored 1 1) (wisi-anchored 1 1)
                           (wisi-anchored 1 0) ada-indent-broken]))
       ((parameter_profile_opt )))
      (entry_call_alternative
       ((procedure_call_statement sequence_of_statements_opt ))
       ((name sequence_of_statements_opt )))
      (entry_declaration
       ((overriding_indicator_opt ENTRY IDENTIFIER LEFT_PAREN discrete_subtype_definition RIGHT_PAREN parameter_profile_opt aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 2 motion 8 statement-end])
        (wisi-name-action 3)
        (wisi-containing-action 2 7) ;; for goto-declaration-start
        (wisi-face-apply-action [3 nil font-lock-function-name-face])
        (wisi-indent-action [nil nil ada-indent-broken ada-indent-broken (wisi-anchored 4 1) (wisi-anchored 4 0)
                               ada-indent-broken nil nil])))
       ((overriding_indicator_opt ENTRY IDENTIFIER parameter_profile_opt aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 2 motion 6 statement-end])
        (wisi-name-action 3)
        (wisi-containing-action 2 4) ;; for goto-declaration-start
        (wisi-face-apply-action [3 nil font-lock-function-name-face])
        (wisi-indent-action [nil nil ada-indent-broken ada-indent-broken ada-indent-broken nil]))))
      (enumeration_literal
       ((IDENTIFIER ))
       ((CHARACTER_LITERAL )))
      (enumeration_literal_list
       ((enumeration_literal_list COMMA enumeration_literal ))
       ((enumeration_literal )))
      (enumeration_representation_clause
       ((FOR name USE aggregate SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 5 statement-end])
      (wisi-face-apply-action [2 font-lock-function-name-face font-lock-type-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken nil]))))
      (enumeration_type_definition
       ((LEFT_PAREN enumeration_literal_list RIGHT_PAREN )
        (wisi-indent-action [nil (wisi-anchored 1 1) (wisi-anchored 1 0)])))
      (exception_choice
       ((name ))
       ((OTHERS )))
      (exception_choice_list
       ((exception_choice_list BAR exception_choice ))
       ((exception_choice )))
      (exception_declaration
       ((identifier_list COLON EXCEPTION SEMICOLON )
        (wisi-statement-action [1 statement-start 4 statement-end])))
      (exception_handler
       ((WHEN IDENTIFIER COLON exception_choice_list EQUAL_GREATER sequence_of_statements_opt )
        (progn
      (wisi-statement-action [1 motion])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                             [ada-indent ada-indent]])))
       ((WHEN exception_choice_list EQUAL_GREATER sequence_of_statements_opt )
        (progn
      (wisi-statement-action [1 motion])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken [ada-indent ada-indent]]))))
      (exception_handler_list
       ((exception_handler_list exception_handler ))
       ((exception_handler ))
       ((pragma_g )))
      (exception_handler_list_opt
       ((exception_handler_list ))
       (()))
      (exit_statement
       ((EXIT identifier_opt WHEN expression_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 5 statement-end])
      (wisi-indent-action [nil nil nil ada-indent-broken nil])))
       ((EXIT identifier_opt SEMICOLON )
        (wisi-statement-action [1 statement-start 3 statement-end])))
      (expression
       ((relation ))
       ((relation_and_list ))
       ((relation_and_then_list ))
       ((relation_or_list ))
       ((relation_or_else_list ))
       ((relation_xor_list )))
      (expression_opt
       ((expression ))
       (()))
      (expression_function_declaration
       ((overriding_indicator_opt function_specification IS paren_expression aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 statement-override 6 statement-end])
      (wisi-indent-action [nil nil ada-indent-broken ada-indent-broken nil nil]))))
      (extended_return_object_declaration
       ((IDENTIFIER COLON aliased_opt constant_opt return_subtype_indication COLON_EQUAL expression_opt )
        (wisi-indent-action [nil nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                           (wisi-anchored% 6 ada-indent-broken)]))
       ((IDENTIFIER COLON aliased_opt constant_opt return_subtype_indication )
        (wisi-indent-action [nil nil ada-indent-broken ada-indent-broken ada-indent-broken])))
      (extended_return_object_declaration_opt
       ((extended_return_object_declaration ))
       (()))
      (extended_return_statement
       ((RETURN extended_return_object_declaration_opt DO handled_sequence_of_statements END RETURN SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 motion 7 statement-end])
      (wisi-containing-action 1 4)
      (wisi-motion-action [1 3 7])
      (wisi-indent-action [[nil ada-indent] ada-indent-broken nil [ada-indent ada-indent] nil nil nil])))
       ((RETURN extended_return_object_declaration SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 statement-end]))))
      (factor
       ((primary STAR_STAR primary ))
       ((primary ))
       ((ABS primary ))
       ((NOT primary )))
      (formal_object_declaration
       ((identifier_list COLON mode_opt null_exclusion_opt name COLON_EQUAL expression_opt aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 9 statement-end])
      (wisi-face-apply-action [5 font-lock-function-name-face font-lock-type-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                             (wisi-anchored% 6 ada-indent-broken) ada-indent-broken nil])))
       ((identifier_list COLON mode_opt access_definition COLON_EQUAL expression_opt aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 8 statement-end])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                             (wisi-anchored% 5 ada-indent-broken) ada-indent-broken nil])))
       ((identifier_list COLON mode_opt null_exclusion_opt name aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 7 statement-end])
      (wisi-face-apply-action [5 font-lock-function-name-face font-lock-type-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                               ada-indent-broken nil])))
       ((identifier_list COLON mode_opt access_definition aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 6 statement-end])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken nil]))))
      (formal_part
       ((LEFT_PAREN parameter_specification_list RIGHT_PAREN )
        (progn
      (wisi-statement-action [1 misc]) ;; for ada-wisi-in-paramlist-p
      (wisi-indent-action [nil (wisi-anchored 1 1) (wisi-anchored 1 0)]))))
      (formal_subprogram_declaration
       ((WITH subprogram_specification IS ABSTRACT subprogram_default aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 7 statement-end])
      (wisi-indent-action [nil nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken nil])))
       ((WITH subprogram_specification IS subprogram_default aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 6 statement-end])
      (wisi-indent-action [nil nil ada-indent-broken ada-indent-broken ada-indent-broken nil])))
       ((WITH subprogram_specification IS ABSTRACT aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 6 statement-end])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken nil])))
       ((WITH subprogram_specification aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 4 statement-end])
      (wisi-indent-action [nil nil ada-indent-broken nil]))))
      (formal_type_declaration
       ((TYPE IDENTIFIER discriminant_part_opt IS formal_type_definition aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 7 statement-end])
      (wisi-containing-action 1 5) ;; for goto-declaration-start
      (wisi-face-apply-action [2 nil font-lock-type-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken
                             ada-indent-broken ada-indent-broken nil])))
       ((TYPE IDENTIFIER discriminant_part_opt IS TAGGED aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 7 statement-end])
      (wisi-face-apply-action [2 nil font-lock-type-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                               ada-indent-broken nil])))
       ((TYPE IDENTIFIER discriminant_part_opt aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 5 statement-end])
      (wisi-face-apply-action [2 nil font-lock-type-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken nil]))))
      (formal_type_definition
       ((abstract_tagged_limited_opt PRIVATE ))
       ((formal_derived_type_definition ))
       ((LEFT_PAREN BOX RIGHT_PAREN ))
       ((RANGE BOX ))
       ((MOD BOX ))
       ((DIGITS BOX ))
       ((DELTA BOX DIGITS BOX ))
       ((DELTA BOX ))
       ((array_type_definition ))
       ((access_definition ))
       ((interface_type_definition )))
      (formal_derived_type_definition
       ((abstract_limited_synchronized_opt NEW name and_interface_list_opt WITH PRIVATE )
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-type-face]))
       ((abstract_limited_synchronized_opt NEW name and_interface_list_opt )
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-type-face])))
      (formal_package_declaration
       ((WITH PACKAGE name IS NEW name formal_package_actual_part aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 9 statement-end])
      (wisi-face-apply-action [3 font-lock-function-name-face font-lock-function-name-face
                                 6 font-lock-function-name-face font-lock-function-name-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken nil]))))
      (formal_package_actual_part
       ((LEFT_PAREN BOX RIGHT_PAREN ))
       (()))
      (full_type_declaration
       ((TYPE IDENTIFIER discriminant_part_opt IS type_definition aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 7 statement-end])
        (wisi-name-action 2)
        (wisi-containing-action 1 5) ;; for goto-declaration-start
        (wisi-face-apply-action [2 nil font-lock-type-face])

        ;; FIXME: indentation of comment after 'is' (and 'with' in
        ;; derived_type_definition) should be ada-indent-record-rel-type
        ;; if type_definition is a record. Worse if
        ;; ada-indent-comment-gnat is t. Need 'anchor to next line'.
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken nil nil])))
       ((task_type_declaration ))
       ((protected_type_declaration )))
      (function_specification
       ((FUNCTION name parameter_and_result_profile )
        (progn
        (wisi-statement-action [1 statement-start])
        (wisi-name-action 2)
        (wisi-containing-action 1 3) ;; for goto-declaration-start
        (wisi-face-apply-action [2 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken]))))
      (general_access_modifier_opt
       ((ALL ))
       ((CONSTANT ))
       (()))
      (generic_declaration
       ((generic_subprogram_declaration ))
       ((generic_package_declaration )))
      (generic_formal_part
       ((GENERIC generic_formal_parameter_declarations )
        (progn
      (wisi-statement-action [1 statement-start])
      (wisi-indent-action [nil ada-indent])))
       ((GENERIC )
        (wisi-statement-action [1 statement-start])))
      (generic_formal_parameter_declarations
       ((generic_formal_parameter_declarations generic_formal_parameter_declaration ))
       ((generic_formal_parameter_declaration )))
      (generic_formal_parameter_declaration
       ((formal_object_declaration ))
       ((formal_type_declaration ))
       ((formal_subprogram_declaration ))
       ((formal_package_declaration ))
       ((pragma_g ))
       ((use_clause )))
      (generic_instantiation
       ((PACKAGE name IS NEW name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 7 statement-end])
        (wisi-name-action 2)
        (wisi-face-apply-action [2 font-lock-function-name-face font-lock-function-name-face
                                   5 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil ada-indent-broken nil ada-indent-broken ada-indent-broken ada-indent-broken nil])))
       ((overriding_indicator_opt PROCEDURE name IS NEW name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 2 motion 8 statement-end])
        (wisi-name-action 3)
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-function-name-face
                                   6 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken nil])))
       ((overriding_indicator_opt FUNCTION name IS NEW name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 2 motion 8 statement-end])
        (wisi-name-action 3)
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-function-name-face
                                   6 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil nil ada-indent-broken nil ada-indent-broken ada-indent-broken ada-indent-broken
                                 nil]))))
      (generic_package_declaration
       ((generic_formal_part package_specification SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 motion 3 statement-end])
      (wisi-motion-action [1 2 3])
      (wisi-indent-action [[nil ada-indent] nil nil]))))
      (generic_renaming_declaration
       ((GENERIC PACKAGE name RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 7 statement-end])
        (wisi-name-action 3)
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-function-name-face
                                   5 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken nil])))
       ((GENERIC PROCEDURE name RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 7 statement-end])
        (wisi-name-action 3)
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-function-name-face
                                   5 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil nil ada-indent-broken (ada-indent-renames 3) ada-indent-broken ada-indent-broken
                                 nil])))
       ((GENERIC FUNCTION name RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 7 statement-end])
        (wisi-name-action 3)
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-function-name-face
                                   5 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil nil ada-indent-broken (ada-indent-renames 3) ada-indent-broken ada-indent-broken
                                 nil]))))
      (generic_subprogram_declaration
       ((generic_formal_part subprogram_specification aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 motion 4 statement-end])
      (wisi-motion-action [1 2 4]))))
      (goto_label
       ((LESS_LESS IDENTIFIER GREATER_GREATER )
        (progn
      (wisi-face-apply-action [2 nil font-lock-constant-face])
      (wisi-indent-action [ada-indent-label nil nil]))))
      (handled_sequence_of_statements
       ((sequence_of_statements_opt EXCEPTION exception_handler_list_opt )
        (progn
      (wisi-statement-action [2 motion])
      (wisi-indent-action [[nil nil]
                           (- ada-indent)
                           [(- ada-indent-when ada-indent) (- ada-indent-when ada-indent)]])))
       ((sequence_of_statements_opt )))
      (identifier_list
       ((identifier_list COMMA IDENTIFIER )
        (progn
        (wisi-name-action 3)
        (wisi-indent-action [nil nil ada-indent-broken])))
       ((IDENTIFIER )
        (wisi-name-action 1)))
      (identifier_opt
       ((IDENTIFIER ))
       (()))
      (if_expression
       ((IF expression_opt THEN expression_opt elsif_expression_list ELSE expression_opt )
        (progn
      (wisi-statement-action [1 statement-start 3 motion 6 motion])
      (wisi-containing-action 1 2)
      (wisi-motion-action [1 3 [5 ELSIF THEN] 6])
      (wisi-indent-action [nil [ada-indent-broken ada-indent-broken] nil ada-indent nil nil ada-indent])))
       ((IF expression_opt THEN expression_opt ELSE expression_opt )
        (progn
      (wisi-statement-action [1 statement-start 3 motion 5 motion])
      (wisi-containing-action 1 2)
      (wisi-motion-action [1 3 5])
      (wisi-indent-action [nil [ada-indent-broken ada-indent-broken] nil ada-indent nil ada-indent])))
       ((IF expression_opt THEN expression_opt elsif_expression_list )
        (progn
      (wisi-statement-action [1 statement-start 3 motion])
      (wisi-containing-action 1 2)
      (wisi-motion-action [1 3 [5 ELSIF THEN]])
      (wisi-indent-action [nil [ada-indent-broken ada-indent-broken] nil ada-indent nil])))
       ((IF expression_opt THEN expression_opt )
        (progn
      (wisi-statement-action [1 statement-start 3 motion])
      (wisi-containing-action 1 2)
      (wisi-motion-action [1 3])
      (wisi-indent-action [nil [ada-indent-broken ada-indent-broken] nil ada-indent]))))
      (if_statement
       ((IF expression_opt THEN sequence_of_statements_opt elsif_statement_list ELSE sequence_of_statements_opt END IF SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 motion 6 motion 10 statement-end])
      (wisi-containing-action 1 2)
      (wisi-containing-action 1 4)
      (wisi-containing-action 1 5)
      (wisi-containing-action 1 7)
      (wisi-motion-action [1 3 [5 ELSIF THEN] 6 10])
      (wisi-indent-action [nil [(wisi-hanging% ada-indent-broken (* 2 ada-indent-broken))
                              ada-indent-broken]
                             nil
                             [ada-indent ada-indent] nil nil
                             [ada-indent ada-indent] nil nil nil])))
       ((IF expression_opt THEN sequence_of_statements_opt ELSE sequence_of_statements_opt END IF SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 motion 5 motion 9 statement-end])
      (wisi-containing-action 1 2)
      (wisi-containing-action 1 4)
      (wisi-containing-action 1 6)
      (wisi-motion-action [1 3 5 9])
      (wisi-indent-action [nil [(wisi-hanging% ada-indent-broken (* 2 ada-indent-broken))
                              ada-indent-broken]
                             nil
                             [ada-indent ada-indent] nil
                             [ada-indent ada-indent] nil nil nil])))
       ((IF expression_opt THEN sequence_of_statements_opt elsif_statement_list END IF SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 motion 8 statement-end])
      (wisi-containing-action 1 2)
      (wisi-containing-action 1 4)
      (wisi-containing-action 1 5)
      (wisi-motion-action [1 3 [5 ELSIF THEN] 8])
      (wisi-indent-action [nil [(wisi-hanging% ada-indent-broken (* 2 ada-indent-broken))
                              ada-indent-broken]
                             nil
                             [ada-indent ada-indent] nil nil nil nil])))
       ((IF expression_opt THEN sequence_of_statements_opt END IF SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 motion 7 statement-end])
      (wisi-containing-action 1 2)
      (wisi-containing-action 1 4)
      (wisi-motion-action [1 3 7])
      (wisi-indent-action [nil [(wisi-hanging% ada-indent-broken (* 2 ada-indent-broken))
                              ada-indent-broken]
                             nil
                             [ada-indent ada-indent] nil nil nil]))))
      (incomplete_type_declaration
       ((TYPE IDENTIFIER discriminant_part_opt IS TAGGED SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 6 statement-end])
        (wisi-name-action 2)
        (wisi-face-apply-action [2 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken nil])))
       ((TYPE IDENTIFIER discriminant_part_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 3 statement-end])
        (wisi-name-action 2)
        (wisi-face-apply-action [2 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken nil]))))
      (index_constraint
       ((LEFT_PAREN discrete_subtype_definition_list RIGHT_PAREN )
        (wisi-indent-action [nil (wisi-anchored 1 1) (wisi-anchored 1 0)])))
      (index_subtype_definition
       ((name RANGE BOX )))
      (index_subtype_definition_list
       ((index_subtype_definition_list COMMA index_subtype_definition ))
       ((index_subtype_definition )))
      (interface_list
       ((interface_list AND name )
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-type-face]))
       ((name )
        (wisi-face-apply-action [1 font-lock-function-name-face font-lock-type-face])))
      (interface_type_definition
       ((LIMITED INTERFACE AND interface_list ))
       ((TASK INTERFACE AND interface_list ))
       ((PROTECTED INTERFACE AND interface_list ))
       ((SYNCHRONIZED INTERFACE AND interface_list ))
       ((LIMITED INTERFACE ))
       ((TASK INTERFACE ))
       ((PROTECTED INTERFACE ))
       ((SYNCHRONIZED INTERFACE ))
       ((INTERFACE )))
      (iteration_scheme
       ((WHILE expression_opt )
        (wisi-indent-action [nil [ada-indent-broken ada-indent-broken]]))
       ((FOR iterator_specification_opt )
        (wisi-indent-action [nil [ada-indent-broken ada-indent-broken]])))
      (iterator_specification
       ((IDENTIFIER COLON subtype_indication OF REVERSE name ))
       ((IDENTIFIER COLON subtype_indication OF name ))
       ((IDENTIFIER IN REVERSE discrete_subtype_definition )
        (wisi-face-remove-action [4]))
       ((IDENTIFIER OF REVERSE name ))
       ((IDENTIFIER OF name ))
       ((IDENTIFIER IN discrete_subtype_definition )
        (wisi-face-remove-action [3])))
      (iterator_specification_opt
       ((iterator_specification ))
       (()))
      (loop_statement
       ((block_label_opt iteration_scheme LOOP sequence_of_statements_opt END LOOP identifier_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 misc 3 motion 8 statement-end])
      (wisi-containing-action 2 4)
      (wisi-motion-action [2 3 8])
      (wisi-indent-action [nil nil nil [ada-indent ada-indent] nil nil nil nil])))
       ((block_label_opt LOOP sequence_of_statements_opt END LOOP identifier_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 misc 7 statement-end])
      (wisi-containing-action 2 3)
      (wisi-indent-action [nil nil [ada-indent ada-indent] nil nil nil nil]))))
      (membership_choice_list
       ((membership_choice_list BAR membership_choice ))
       ((membership_choice )))
      (membership_choice
       ((simple_expression ))
       ((range_g )))
      (mod_clause_opt
       ((AT MOD expression_opt SEMICOLON ))
       (()))
      (mode_opt
       ((IN ))
       ((IN OUT ))
       ((OUT ))
       (()))
      (multiplying_operator
       ((STAR ))
       ((SLASH ))
       ((MOD ))
       ((REM )))
      (name_list
       ((name_list COMMA name ))
       ((name )))
      (name
       ((name LEFT_PAREN range_list RIGHT_PAREN )
        (wisi-indent-action [nil
                         (wisi-anchored% 1 ada-indent-broken)
                         (wisi-hanging (wisi-anchored 2 1)
                                       (wisi-anchored 2 (+ 1 ada-indent-broken)))
                         (wisi-anchored 2 0)]))
       ((name actual_parameter_part )
        (progn
      (wisi-statement-action [1 misc])
      (wisi-containing-action 1 2)
      (wisi-indent-action [nil (if ada-indent-hanging-rel-exp
                                 (wisi-anchored 1 ada-indent-broken)
                               (wisi-anchored% 1 ada-indent-broken))])))
       ((selected_component ))
       ((attribute_reference ))
       ((qualified_expression ))
       ((IDENTIFIER )
        (wisi-face-mark-action [1 suffix]))
       ((CHARACTER_LITERAL ))
       ((STRING_LITERAL )))
      (name_opt
       ((name ))
       (()))
      (null_exclusion_opt
       ((NOT NULL ))
       (()))
      (null_exclusion_opt_name_type
       ((IDENTIFIER )
        (wisi-face-apply-action [1 nil font-lock-type-face]))
       ((selected_component )
        (wisi-face-apply-action [1 font-lock-function-name-face font-lock-type-face]))
       ((NOT NULL IDENTIFIER )
        (wisi-face-apply-action [3 nil font-lock-type-face]))
       ((NOT NULL selected_component )
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-type-face])))
      (null_procedure_declaration
       ((overriding_indicator_opt procedure_specification IS NULL aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 statement-override 6 statement-end])
      (wisi-indent-action [nil nil ada-indent-broken ada-indent-broken ada-indent-broken nil]))))
      (object_declaration
       ((identifier_list COLON aliased_opt constant_opt subtype_indication COLON_EQUAL expression_opt aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 9 statement-end])
      (wisi-containing-action 1 7)
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                             (wisi-anchored%- 6 ada-indent-broken) ada-indent-broken nil])))
       ((identifier_list COLON aliased_opt constant_opt access_definition COLON_EQUAL expression_opt aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 9 statement-end])
      (wisi-containing-action 1 5) ;; for goto-declaration-start
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                             (wisi-anchored% 6 ada-indent-broken) ada-indent-broken nil])))
       ((identifier_list COLON aliased_opt constant_opt array_type_definition COLON_EQUAL expression_opt aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 9 statement-end])
      (wisi-containing-action 1 5) ;; for goto-declaration-start
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                             (wisi-anchored% 6 ada-indent-broken) ada-indent-broken nil])))
       ((identifier_list COLON aliased_opt constant_opt subtype_indication aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 7 statement-end])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                               ada-indent-broken nil])))
       ((identifier_list COLON aliased_opt constant_opt access_definition aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 7 statement-end])
      (wisi-containing-action 1 5) ;; for goto-declaration-start
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                               ada-indent-broken nil])))
       ((identifier_list COLON aliased_opt constant_opt array_type_definition aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 7 statement-end])
      (wisi-containing-action 1 5) ;; for goto-declaration-start
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                               ada-indent-broken nil])))
       ((single_task_declaration ))
       ((single_protected_declaration )))
      (object_renaming_declaration
       ((IDENTIFIER COLON null_exclusion_opt name RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 8 statement-end])
        (wisi-name-action 1)
        (wisi-face-apply-action [4 font-lock-function-name-face font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                                 ada-indent-broken ada-indent-broken nil])))
       ((IDENTIFIER COLON access_definition RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 7 statement-end])
        (wisi-name-action 1)
        (wisi-containing-action 1 3) ;; for goto-declaration-start
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                                 ada-indent-broken nil])))
       ((IDENTIFIER COLON EXCEPTION RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 7 statement-end])
        (wisi-name-action 1)
        (wisi-face-apply-action [5 font-lock-function-name-face nil])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                                 ada-indent-broken nil]))))
      (overriding_indicator_opt
       ((NOT OVERRIDING )
        (wisi-statement-action [1 statement-start 2 statement-override]))
       ((OVERRIDING )
        (wisi-statement-action [1 statement-start]))
       (()))
      (package_body
       ((PACKAGE BODY name aspect_specification_opt IS declarative_part_opt BEGIN handled_sequence_of_statements END name_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 5 motion 7 motion 11 statement-end])
        (wisi-name-action 3)
        (wisi-containing-action 1 6)
        (wisi-containing-action 1 8)
        (wisi-motion-action [1 5 7 [8 EXCEPTION WHEN] 11])
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-function-name-face
                                   10 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken nil nil [ada-indent ada-indent]
                             nil [ada-indent ada-indent] nil ada-indent-broken nil])))
       ((PACKAGE BODY name aspect_specification_opt IS declarative_part_opt END name_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 5 motion 9 statement-end])
        (wisi-name-action 3)
        (wisi-containing-action 1 6)
        (wisi-motion-action [1 5 9])
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-function-name-face
                                   8 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken nil [ada-indent ada-indent] nil
                                 nil nil]))))
      (package_body_stub
       ((PACKAGE BODY name IS SEPARATE aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 7 statement-end])
        (wisi-name-action 3)
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken nil ada-indent-broken ada-indent-broken nil]))))
      (package_declaration
       ((package_specification SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 statement-end])
      (wisi-motion-action [[1 PRIVATE] 2]))))
      (package_renaming_declaration
       ((PACKAGE name RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 6 statement-end])
        (wisi-name-action 2)
        (wisi-face-apply-action [2 font-lock-function-name-face font-lock-function-name-face
                                   4 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken nil]))))
      (package_specification
       ((PACKAGE name aspect_specification_opt IS declarative_part_opt PRIVATE declarative_part_opt END name_opt )
        (progn
        (wisi-statement-action [1 statement-start 4 motion 6 motion])
        (wisi-name-action 2)
        (wisi-containing-action 1 4)
        (wisi-containing-action 4 5) ;; for goto-declarative-region-start
        (wisi-containing-action 1 7)
        (wisi-motion-action [1 4 6])
        (wisi-face-apply-action [2 font-lock-function-name-face font-lock-function-name-face
                                   9 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken nil [ada-indent ada-indent] nil
                             [ada-indent ada-indent] nil nil])))
       ((PACKAGE name aspect_specification_opt IS declarative_part_opt END name_opt )
        (progn
      (wisi-statement-action [1 statement-start 4 motion])
      (wisi-name-action 2)
      (wisi-containing-action 1 4)
      (wisi-containing-action 4 5) ;; for goto-declarative-region-start
      (wisi-motion-action [1 4])
      (wisi-face-apply-action [2 font-lock-function-name-face font-lock-function-name-face
                                 7 font-lock-function-name-face font-lock-function-name-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken nil [ada-indent ada-indent] nil nil]))))
      (parameter_and_result_profile
       ((formal_part result_profile )
        (wisi-indent-action [nil (ada-indent-return 1 0)]))
       ((result_profile )))
      (parameter_profile_opt
       ((formal_part ))
       (()))
      (parameter_specification
       ((identifier_list COLON aliased_opt mode_opt null_exclusion_opt name COLON_EQUAL expression_opt )
        (progn
      (wisi-face-apply-action [6 font-lock-function-name-face font-lock-type-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                             ada-indent-broken ada-indent-broken (wisi-anchored% 7 ada-indent-broken)])))
       ((identifier_list COLON aliased_opt mode_opt null_exclusion_opt name )
        (progn
      (wisi-face-apply-action [6 font-lock-function-name-face font-lock-type-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                             ada-indent-broken])))
       ((identifier_list COLON aliased_opt access_definition COLON_EQUAL expression_opt )
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                           (wisi-anchored% 5 ada-indent-broken)]))
       ((identifier_list COLON aliased_opt access_definition )
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken]))
       (()))
      (parameter_specification_list
       ((parameter_specification_list SEMICOLON parameter_specification )
        (wisi-statement-action [2 motion]))
       ((parameter_specification )))
      (paren_expression
       ((LEFT_PAREN expression_opt RIGHT_PAREN )
        (wisi-indent-action [nil
                         (wisi-hanging (wisi-anchored 1 1)
                                       (wisi-anchored 1 (+ 1 ada-indent-broken)))
                         (wisi-anchored 1 0)]))
       ((LEFT_PAREN association_list RIGHT_PAREN )
        (wisi-indent-action [nil (wisi-anchored 1 1) (wisi-anchored 1 0)]))
       ((LEFT_PAREN conditional_quantified_expression RIGHT_PAREN )
        (wisi-indent-action [nil (wisi-anchored 1 1) (wisi-anchored 1 0)])))
      (pragma_g
       ((PRAGMA IDENTIFIER LEFT_PAREN association_list RIGHT_PAREN SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 6 statement-end])
      (wisi-face-apply-action [2 nil font-lock-function-name-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken (wisi-anchored 3 1) (wisi-anchored 3 0) nil])))
       ((PRAGMA IDENTIFIER LEFT_PAREN conditional_quantified_expression RIGHT_PAREN SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 6 statement-end])
      (wisi-face-apply-action [2 nil font-lock-function-name-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken (wisi-anchored 3 1) (wisi-anchored 3 0) nil])))
       ((PRAGMA IDENTIFIER SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 statement-end])
      (wisi-face-apply-action [2 nil font-lock-function-name-face])
      (wisi-indent-action [nil ada-indent-broken nil]))))
      (primary
       ((NUMERIC_LITERAL )
        (wisi-face-apply-action [1 nil font-lock-constant-face]))
       ((NULL ))
       ((aggregate )
        (wisi-indent-action [(ada-indent-aggregate)]))
       ((name ))
       ((NEW name )
        (wisi-face-apply-action [2 font-lock-function-name-face font-lock-type-face])))
      (private_extension_declaration
       ((TYPE IDENTIFIER discriminant_part_opt IS abstract_limited_synchronized_opt NEW subtype_indication and_interface_list_opt WITH PRIVATE aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 12 statement-end])
        (wisi-name-action 2)
        (wisi-face-apply-action [2 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken
                               ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken nil nil]))))
      (private_type_declaration
       ((TYPE IDENTIFIER discriminant_part_opt IS abstract_tagged_limited_opt PRIVATE aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 8 statement-end])
        (wisi-name-action 2)
        (wisi-face-apply-action [2 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken nil ada-indent-broken ada-indent-broken nil
                                 nil]))))
      (procedure_call_statement
       ((name SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 statement-end])
      (wisi-indent-action [(wisi-hanging nil ada-indent-broken) nil]))))
      (procedure_specification
       ((PROCEDURE name parameter_profile_opt )
        (progn
        (wisi-statement-action [1 statement-start])
        (wisi-name-action 2)
        (wisi-containing-action 1 3) ;; for goto-declaration-start
        (wisi-face-apply-action [2 font-lock-function-name-face font-lock-function-name-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken]))))
      (proper_body
       ((subprogram_body ))
       ((package_body ))
       ((task_body ))
       ((protected_body )))
      (protected_body
       ((PROTECTED BODY IDENTIFIER aspect_specification_opt IS protected_operation_item_list_opt END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 5 motion 9 statement-end])
        (wisi-name-action 3)
        (wisi-containing-action 1 6)
        (wisi-motion-action [1 5 9])
        (wisi-face-apply-action [3 nil font-lock-type-face 8 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken nil nil ada-indent nil nil nil]))))
      (protected_body_stub
       ((PROTECTED BODY IDENTIFIER IS SEPARATE aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 7 statement-end])
        (wisi-name-action 3)
        (wisi-face-apply-action [3 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken ada-indent-broken nil]))))
      (protected_definition
       ((declarative_part_opt PRIVATE declarative_part_opt END identifier_opt )
        (progn
      (wisi-statement-action [2 motion])
      (wisi-face-apply-action [5 nil font-lock-type-face])
      (wisi-indent-action [[ada-indent ada-indent] nil [ada-indent ada-indent] nil nil])))
       ((declarative_part_opt END identifier_opt )
        (progn
      (wisi-face-apply-action [3 nil font-lock-type-face])
      (wisi-indent-action [[ada-indent ada-indent] nil nil]))))
      (protected_operation_item
       ((subprogram_declaration ))
       ((subprogram_body ))
       ((entry_body ))
       ((expression_function_declaration ))
       ((null_procedure_declaration ))
       ((aspect_clause )))
      (protected_operation_item_list
       ((protected_operation_item_list protected_operation_item ))
       ((protected_operation_item )))
      (protected_operation_item_list_opt
       ((protected_operation_item_list ))
       (()))
      (protected_opt
       ((PROTECTED ))
       (()))
      (protected_type_declaration
       ((PROTECTED TYPE IDENTIFIER discriminant_part_opt aspect_specification_opt IS NEW interface_list WITH protected_definition SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 6 motion 9 motion 11 statement-end])
        (wisi-name-action 3)
        (wisi-containing-action 1 10)
        (wisi-motion-action [1 6 [10 PRIVATE] 11])
        (wisi-face-apply-action [3 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken nil nil
                               ada-indent-broken ada-indent-broken ada-indent-broken nil nil])))
       ((PROTECTED TYPE IDENTIFIER discriminant_part_opt aspect_specification_opt IS protected_definition SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 6 motion 8 statement-end])
        (wisi-name-action 3)
        (wisi-containing-action 1 7)
        (wisi-motion-action [1 6 [7 PRIVATE] 8])
        (wisi-face-apply-action [3 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken nil [nil ada-indent] nil nil]))))
      (qualified_expression
       ((name tick aggregate )
        (progn
      (wisi-face-apply-action [1 font-lock-function-name-face font-lock-type-face])
      (wisi-indent-action [nil nil (if ada-indent-hanging-rel-exp
                                   (wisi-anchored 1 ada-indent-broken)
                                 (wisi-anchored% 1 ada-indent-broken))]))))
      (quantified_expression
       ((FOR quantifier iterator_specification EQUAL_GREATER expression_opt )
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken (wisi-anchored% 4 ada-indent-broken)])))
      (quantifier
       ((ALL ))
       ((SOME )))
      (raise_expression
       ((RAISE name WITH expression_opt )
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken (wisi-anchored% 3 ada-indent-broken)]))
       ((RAISE name )))
      (raise_statement
       ((RAISE name WITH expression_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 4 motion 5 statement-end])
      (wisi-containing-action 1 4)
      ;; test/ada_mode-nominal.adb
      ;; raise Constraint_Error with
      ;;   "help " &
      ;;   "me!";
      ;;
      ;; raise Constraint_Error
      ;;   with Integer'Image (1) &
      ;;   "help!";
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken (wisi-anchored% 3 ada-indent-broken) nil])))
       ((RAISE name SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 statement-end])
      (wisi-indent-action [nil ada-indent-broken nil])))
       ((RAISE SEMICOLON )
        (wisi-statement-action [1 statement-start 2 statement-end])))
      (range_g
       ((name tick RANGE LEFT_PAREN expression_opt RIGHT_PAREN )
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken (wisi-anchored 4 1) (wisi-anchored 4 0)]))
       ((name tick RANGE ))
       ((simple_expression DOT_DOT simple_expression )))
      (range_list
       ((range_list COMMA range_g ))
       ((range_g )))
      (real_range_specification_opt
       ((RANGE simple_expression DOT_DOT simple_expression ))
       (()))
      (record_definition
       ((RECORD component_list_opt END RECORD )
        (wisi-indent-action [[(ada-indent-record* 'TYPE 1 0) (ada-indent-record* 'TYPE 1 ada-indent)]
                         [(ada-indent-record* 'TYPE 1 ada-indent) (ada-indent-record* 'TYPE 1 ada-indent)]
                         (ada-indent-record* 'TYPE 1 0)
                         nil]))
       ((NULL RECORD )))
      (record_representation_clause
       ((FOR name USE RECORD mod_clause_opt component_clause_list END RECORD SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 5 statement-end])
      (wisi-face-apply-action [2 font-lock-function-name-face font-lock-type-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken
                             (ada-indent-record 1 4 0)
                             (ada-indent-record 1 4 ada-indent)
                             (ada-indent-record 1 4 ada-indent)
                             (ada-indent-record 1 4 0)
                             nil nil]))))
      (relation_and_list
       ((relation_and_list AND relation ))
       ((relation AND relation )))
      (relation_and_then_list
       ((relation_and_then_list AND THEN relation ))
       ((relation AND THEN relation )))
      (relation_or_list
       ((relation_or_list OR relation ))
       ((relation OR relation )))
      (relation_or_else_list
       ((relation_or_else_list OR ELSE relation ))
       ((relation OR ELSE relation )))
      (relation_xor_list
       ((relation_xor_list XOR relation ))
       ((relation XOR relation )))
      (relation
       ((simple_expression NOT IN membership_choice_list ))
       ((simple_expression IN membership_choice_list ))
       ((simple_expression relational_operator simple_expression ))
       ((simple_expression ))
       ((raise_expression )))
      (relational_operator
       ((EQUAL ))
       ((SLASH_EQUAL ))
       ((LESS ))
       ((LESS_EQUAL ))
       ((GREATER ))
       ((GREATER_EQUAL )))
      (renaming_declaration
       ((object_renaming_declaration ))
       ((package_renaming_declaration ))
       ((subprogram_renaming_declaration ))
       ((generic_renaming_declaration )))
      (requeue_statement
       ((REQUEUE name WITH ABORT SEMICOLON )
        (wisi-statement-action [1 statement-start 5 statement-end]))
       ((REQUEUE name SEMICOLON )
        (wisi-statement-action [1 statement-start 3 statement-end])))
      (result_profile
       ((RETURN null_exclusion_opt name_opt )
        (progn
      (wisi-face-apply-action [3 font-lock-function-name-face font-lock-type-face])
      (wisi-indent-action* 1
                           [nil
                            (wisi-anchored* 1 ada-indent-broken)
                            (wisi-anchored* 1 ada-indent-broken)])))
       ((RETURN access_definition )
        (wisi-indent-action* 1 [nil (wisi-anchored*- 1 ada-indent-broken)])))
      (return_subtype_indication
       ((subtype_indication ))
       ((access_definition )))
      (selected_component
       ((name DOT IDENTIFIER )
        (wisi-face-mark-action [1 prefix 3 suffix]))
       ((name DOT CHARACTER_LITERAL )
        (wisi-face-mark-action [1 prefix]))
       ((name DOT STRING_LITERAL )
        (wisi-face-mark-action [1 prefix]))
       ((name DOT ALL )
        (wisi-face-mark-action [1 prefix])))
      (selective_accept
       ((SELECT select_alternative_list_opt ELSE sequence_of_statements_opt END SELECT SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 motion 7 statement-end])
      (wisi-containing-action 1 2)
      (wisi-containing-action 1 4)
      (wisi-motion-action [1 [2 OR WHEN] 3 7])
      (wisi-indent-action [[nil ada-indent] [nil ada-indent] nil [ada-indent ada-indent] nil nil nil])))
       ((SELECT select_alternative_list_opt END SELECT SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 5 statement-end])
      (wisi-motion-action [1 [2 OR WHEN] 5])
      (wisi-indent-action [[nil ada-indent] [nil ada-indent] nil nil nil]))))
      (select_alternative
       ((WHEN expression_opt EQUAL_GREATER accept_statement sequence_of_statements_opt )
        (progn
      (wisi-statement-action [1 motion])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent ada-indent])))
       ((WHEN expression_opt EQUAL_GREATER TERMINATE SEMICOLON )
        (progn
      (wisi-statement-action [1 motion 4 statement-start 5 statement-end])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent nil])))
       ((WHEN expression_opt EQUAL_GREATER delay_alternative )
        (progn
      (wisi-statement-action [1 motion])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent])))
       ((accept_statement sequence_of_statements_opt ))
       ((TERMINATE SEMICOLON )
        (wisi-statement-action [1 statement-start 2 statement-end]))
       ((delay_alternative )))
      (select_alternative_list
       ((select_alternative_list OR select_alternative )
        (progn
      (wisi-statement-action [2 motion])
      (wisi-indent-action [nil nil ada-indent])))
       ((select_alternative )
        (wisi-indent-action [ada-indent])))
      (select_alternative_list_opt
       ((select_alternative_list ))
       (()))
      (select_statement
       ((selective_accept ))
       ((timed_entry_call ))
       ((conditional_entry_call ))
       ((asynchronous_select )))
      (sequence_of_statements
       ((sequence_of_statements statement ))
       ((statement )))
      (sequence_of_statements_opt
       ((sequence_of_statements ))
       (()))
      (simple_expression
       ((unary_adding_operator term_list ))
       ((term_list )))
      (simple_return_statement
       ((RETURN expression_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 statement-end])
      (wisi-containing-action 1 2)
      (wisi-indent-action [nil ada-indent-broken nil]))))
      (simple_statement
       ((NULL SEMICOLON )
        (wisi-statement-action [1 statement-start 2 statement-end]))
       ((assignment_statement ))
       ((exit_statement ))
       ((GOTO IDENTIFIER SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 statement-end])
      (wisi-face-apply-action [2 nil font-lock-constant-face])))
       ((procedure_call_statement ))
       ((simple_return_statement ))
       ((requeue_statement ))
       ((delay_statement ))
       ((ABORT name SEMICOLON )
        (wisi-statement-action [1 statement-start 3 statement-end]))
       ((raise_statement ))
       ((pragma_g )))
      (single_protected_declaration
       ((PROTECTED IDENTIFIER aspect_specification_opt IS NEW interface_list WITH protected_definition SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 4 motion 7 motion 9 statement-end])
        (wisi-name-action 2)
        (wisi-containing-action 1 8)
        (wisi-motion-action [1 4 7 [8 PRIVATE] 9])
        (wisi-face-apply-action [2 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken nil nil ada-indent-broken ada-indent-broken ada-indent-broken nil
                                 nil])))
       ((PROTECTED IDENTIFIER aspect_specification_opt IS protected_definition SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 4 motion 6 statement-end])
        (wisi-name-action 2)
        (wisi-containing-action 1 5)
        (wisi-motion-action [1 4 [5 PRIVATE] 6])
        (wisi-face-apply-action [2 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken nil [nil ada-indent] nil nil]))))
      (single_task_declaration
       ((TASK IDENTIFIER aspect_specification_opt IS NEW interface_list WITH task_definition END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 4 motion 7 motion 11 statement-end])
        (wisi-name-action 2)
        (wisi-containing-action 1 8)
        (wisi-motion-action [1 4 [8 PRIVATE] 11])
        (wisi-face-apply-action [2 nil font-lock-type-face 9 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken nil nil ada-indent-broken ada-indent-broken ada-indent-broken nil
                                 nil nil nil])))
       ((TASK IDENTIFIER aspect_specification_opt IS task_definition END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 4 motion 8 statement-end])
        (wisi-name-action 2)
        (wisi-containing-action 1 5)
        (wisi-motion-action [1 4 [5 PRIVATE] 8])
        (wisi-face-apply-action [2 nil font-lock-type-face 6 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken nil [nil ada-indent] nil nil nil nil])))
       ((TASK IDENTIFIER aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 4 statement-end])
        (wisi-name-action 2)
        (wisi-face-apply-action [2 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken nil nil]))))
      (statement
       ((goto_label ))
       ((simple_statement ))
       ((compound_statement )))
      (subprogram_body
       ((overriding_indicator_opt subprogram_specification aspect_specification_opt IS declarative_part_opt BEGIN handled_sequence_of_statements END name_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 statement-override 4 motion 6 motion 10 statement-end])
      (wisi-containing-action 2 4)
      (wisi-containing-action 4 5) ;; for goto_declarative_region_start
      (wisi-containing-action 2 7)
      (wisi-motion-action [1 [2 FUNCTION PROCEDURE] 4 6 10])
      (wisi-face-apply-action [9 font-lock-function-name-face font-lock-function-name-face])
      (wisi-indent-action [nil [nil ada-indent] nil nil [ada-indent ada-indent]
                             nil [ada-indent ada-indent] nil ada-indent-broken nil]))))
      (subprogram_body_stub
       ((overriding_indicator_opt subprogram_specification IS SEPARATE aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 statement-override 6 statement-end])
      (wisi-indent-action [nil nil nil ada-indent-broken ada-indent-broken nil]))))
      (subprogram_declaration
       ((overriding_indicator_opt subprogram_specification aspect_specification_opt SEMICOLON )
        (wisi-statement-action [1 statement-start 2 statement-override 4 statement-end])))
      (subprogram_default
       ((name )
        (wisi-face-apply-action [1 font-lock-function-name-face font-lock-function-name-face]))
       ((BOX ))
       ((NULL )))
      (subprogram_renaming_declaration
       ((overriding_indicator_opt subprogram_specification RENAMES name aspect_specification_opt SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 2 statement-override 6 statement-end])
      (wisi-face-apply-action [4 font-lock-function-name-face font-lock-function-name-face])
      (wisi-indent-action [nil nil (ada-indent-renames 2) ada-indent-broken ada-indent-broken nil]))))
      (subprogram_specification
       ((procedure_specification ))
       ((function_specification )))
      (subtype_declaration
       ((SUBTYPE IDENTIFIER IS subtype_indication aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 6 statement-end])
        (wisi-name-action 2)
        (wisi-face-apply-action [2 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken nil nil]))))
      (subtype_indication
       ((NOT NULL name constraint )
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-type-face]))
       ((NOT NULL name )
        (wisi-face-apply-action [3 font-lock-function-name-face font-lock-type-face]))
       ((name constraint )
        (wisi-face-apply-action [1 font-lock-function-name-face font-lock-type-face]))
       ((name )
        (wisi-face-apply-action [1 font-lock-function-name-face font-lock-type-face])))
      (subunit
       ((SEPARATE LEFT_PAREN name RIGHT_PAREN proper_body )
        (progn
      (wisi-statement-action [1 statement-start 5 motion])
      (wisi-indent-action [nil ada-indent-broken (wisi-anchored 2 1) (wisi-anchored 2 0) nil]))))
      (task_body
       ((TASK BODY IDENTIFIER aspect_specification_opt IS declarative_part_opt BEGIN handled_sequence_of_statements END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 5 motion 7 motion 11 statement-end])
        (wisi-name-action 3)
        (wisi-containing-action 1 6)
        (wisi-containing-action 1 8)
        (wisi-motion-action [1 5 7 11])
        (wisi-face-apply-action [3 nil font-lock-type-face 10 nil font-lock-type-face])
        (wisi-indent-action [nil nil ada-indent-broken nil nil [ada-indent ada-indent]
                               nil [ada-indent ada-indent] nil nil nil]))))
      (task_body_stub
       ((TASK BODY IDENTIFIER IS SEPARATE aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 7 statement-end])
        (wisi-name-action 3)
        (wisi-face-apply-action [3 nil font-lock-type-face])
        (wisi-indent-action [nil nil ada-indent-broken nil ada-indent-broken ada-indent-broken nil]))))
      (task_definition
       ((declarative_part_opt PRIVATE declarative_part_opt )
        (progn
      (wisi-statement-action [2 motion])
      (wisi-containing-action 2 3)
      (wisi-indent-action [[ada-indent ada-indent] nil [ada-indent ada-indent]])))
       ((declarative_part_opt )
        (wisi-indent-action [[ada-indent ada-indent]])))
      (task_type_declaration
       ((TASK TYPE IDENTIFIER discriminant_part_opt aspect_specification_opt IS NEW interface_list WITH task_definition END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 6 motion 9 motion 13 statement-end])
        (wisi-name-action 3)
        (wisi-containing-action 1 10)
        (wisi-motion-action [1 6 9 [10 PRIVATE] 13])
        (wisi-face-apply-action [3 nil font-lock-type-face 12 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken nil nil
                               ada-indent-broken ada-indent-broken ada-indent-broken nil nil nil nil])))
       ((TASK TYPE IDENTIFIER discriminant_part_opt aspect_specification_opt IS task_definition END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 6 motion 10 statement-end])
        (wisi-name-action 3)
        (wisi-containing-action 1 7)
        (wisi-face-apply-action [3 nil font-lock-type-face 9 nil font-lock-type-face])
        (wisi-motion-action [1 6 [7 PRIVATE] 10])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken nil [nil ada-indent] nil nil nil
                                 nil])))
       ((TASK TYPE IDENTIFIER discriminant_part_opt aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 6 statement-end])
        (wisi-name-action 3)
        (wisi-face-apply-action [3 nil font-lock-type-face])
        (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-broken nil nil]))))
      (term
       ((term multiplying_operator factor ))
       ((factor )))
      (term_list
       ((term_list binary_adding_operator term ))
       ((term )))
      (tick
       ((TICK_1 )))
      (timed_entry_call
       ((SELECT entry_call_alternative OR delay_alternative END SELECT SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 motion 6 statement-end])
      (wisi-containing-action 1 2)
      (wisi-containing-action 1 4)
      (wisi-indent-action [nil [ada-indent ada-indent] nil [ada-indent ada-indent] nil nil nil]))))
      (triggering_alternative
       ((procedure_call_statement sequence_of_statements_opt ))
       ((name sequence_of_statements_opt ))
       ((delay_statement sequence_of_statements_opt )))
      (type_declaration
       ((full_type_declaration ))
       ((incomplete_type_declaration ))
       ((private_type_declaration ))
       ((private_extension_declaration )))
      (type_definition
       ((enumeration_type_definition ))
       ((RANGE simple_expression DOT_DOT simple_expression ))
       ((MOD expression_opt ))
       ((DIGITS expression_opt real_range_specification_opt ))
       ((DELTA expression_opt DIGITS expression_opt real_range_specification_opt ))
       ((DELTA expression_opt real_range_specification_opt ))
       ((array_type_definition ))
       ((abstract_tagged_limited_opt record_definition ))
       ((access_definition ))
       ((derived_type_definition ))
       ((interface_type_definition )))
      (variant_part
       ((CASE direct_name_opt IS variant_list END CASE SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 7 statement-end])
      (wisi-containing-action 1 4) ;; for goto-declaration-start
      (wisi-indent-action [nil ada-indent-broken nil ada-indent-when nil nil nil]))))
      (variant_list
       ((variant_list variant ))
       ((variant )))
      (variant
       ((WHEN discrete_choice_list EQUAL_GREATER component_list_opt )
        (progn
      (wisi-statement-action [1 motion])
      ;; ada-indent-when applied in variant_part
      (wisi-indent-action [nil (wisi-hanging nil ada-indent-broken) ada-indent [ada-indent ada-indent]]))))
      (unary_adding_operator
       ((PLUS ))
       ((MINUS )))
      (use_clause
       ((USE ALL TYPE name_list SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 5 statement-end])
      (wisi-face-apply-list-action [4 font-lock-function-name-face font-lock-type-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-use nil])))
       ((USE TYPE name_list SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 4 statement-end])
      (wisi-face-apply-list-action [3 font-lock-function-name-face font-lock-type-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-use nil])))
       ((USE name_list SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 statement-end])
      (wisi-face-apply-list-action [2 font-lock-function-name-face font-lock-function-name-face])
      (wisi-indent-action [nil ada-indent-use nil]))))
      (with_clause
       ((LIMITED PRIVATE WITH name_list SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 5 statement-end])
      (wisi-face-apply-list-action [4 font-lock-function-name-face font-lock-function-name-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-broken ada-indent-with nil])))
       ((LIMITED WITH name_list SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 4 statement-end])
      (wisi-face-apply-list-action [3 font-lock-function-name-face font-lock-function-name-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-with nil])))
       ((PRIVATE WITH name_list SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 4 statement-end])
      (wisi-face-apply-list-action [3 font-lock-function-name-face font-lock-function-name-face])
      (wisi-indent-action [nil ada-indent-broken ada-indent-with nil])))
       ((WITH name_list SEMICOLON )
        (progn
      (wisi-statement-action [1 statement-start 3 statement-end])
      (wisi-face-apply-list-action [2 font-lock-function-name-face font-lock-function-name-face])
      (wisi-indent-action [nil ada-indent-with nil])))))
     [((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (ENTRY . (overriding_indicator_opt . 2)) (EXIT .  5) (FOR . ( 6 (block_label_opt . 1))) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (GOTO .  9) (IF .  10) (LIMITED .  11) (LOOP . (block_label_opt . 1)) (NOT .  12) (NULL .  13) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PRIVATE .  17) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SEPARATE .  23) (SELECT .  24) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (WHILE . (block_label_opt . 1)) (WITH .  30) (LESS_LESS .  31) (IDENTIFIER .  32) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  118))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (IS . (expression_opt . 1)) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (UNTIL .  147) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (WHEN . (identifier_opt . 1)) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (IDENTIFIER .  151) (STRING_LITERAL .  152) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (FUNCTION . ( 159 (generic_formal_part . 1))) (PACKAGE . ( 160 (generic_formal_part . 1))) (PRAGMA .  16) (PROCEDURE . ( 161 (generic_formal_part . 1))) (TYPE .  162) (USE .  28) (WITH .  163) (IDENTIFIER .  164))
      ((default . error) (IDENTIFIER .  174))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (THEN . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (PRIVATE .  176) (WITH .  177))
      ((default . error) (OVERRIDING .  178))
      ((default . error) (SEMICOLON .  179))
      ((default . error) (ENTRY . (overriding_indicator_opt . 1)) (FUNCTION . (overriding_indicator_opt . 1)) (PROCEDURE . (overriding_indicator_opt . 1)))
      ((default . error) (BODY .  180) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  182))
      ((default . error) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (WITH .  184) (IDENTIFIER .  185))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (BODY .  188) (TYPE .  189) (IDENTIFIER .  190))
      ((default . error) (SEMICOLON .  191) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (DO . (extended_return_object_declaration_opt . 1)) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  194) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (LEFT_PAREN .  198))
      ((default . error) (ACCEPT .  1) (DELAY .  4) (ELSE . (select_alternative_list_opt . 1)) (END . (select_alternative_list_opt . 1)) (TERMINATE .  199) (WHEN .  200) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  211))
      ((default . error) (BODY .  212) (TYPE .  213) (IDENTIFIER .  214))
      ((default . error) (IDENTIFIER .  215))
      ((default . error) (ALL .  216) (TYPE .  217) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (LOOP . (expression_opt . 1)) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  222))
      ((default . error) (LEFT_PAREN . (name . 5)) (COLON . ( 223 (identifier_list . 1))) (COLON_EQUAL . (name . 5)) (COMMA . (identifier_list . 1)) (DOT . (name . 5)) (SEMICOLON . (name . 5)) (TICK_1 . (name . 5)))
      ((default . error) (ACCEPT . (name . 7)) (ABORT . (name . 7)) (AND . (name . 7)) (BEGIN . (name . 7)) (CASE . (name . 7)) (DECLARE . (name . 7)) (DELAY . (name . 7)) (DIGITS . (name . 7)) (DO . (name . 7)) (ELSE . (name . 7)) (ELSIF . (name . 7)) (EXIT . (name . 7)) (FOR . (name . 7)) (GOTO . (name . 7)) (IF . (name . 7)) (IN . (name . 7)) (IS . (name . 7)) (LOOP . (name . 7)) (MOD . (name . 7)) (NOT . (name . 7)) (NULL . (name . 7)) (OF . (name . 7)) (OR . (name . 7)) (PRAGMA . (name . 7)) (RAISE . (name . 7)) (RANGE . (name . 7)) (REM . (name . 7)) (RENAMES . (name . 7)) (REQUEUE . (name . 7)) (RETURN . (name . 7)) (SELECT . (name . 7)) (THEN . (name . 7)) (USE . (name . 7)) (WHILE . (name . 7)) (WITH . (name . 7)) (XOR . (name . 7)) (LEFT_PAREN . (name . 7)) (RIGHT_PAREN . (name . 7)) (AMPERSAND . (name . 7)) (BAR . (name . 7)) (COLON_EQUAL . (name . 7)) (COMMA . (name . 7)) (DOT . (name . 7)) (DOT_DOT . (name . 7)) (EQUAL . (name . 7)) (EQUAL_GREATER . (name . 7)) (GREATER . (name . 7)) (GREATER_EQUAL . (name . 7)) (LESS . (name . 7)) (LESS_EQUAL . (name . 7)) (LESS_LESS . (name . 7)) (MINUS . (name . 7)) (PLUS . (name . 7)) (SEMICOLON . (name . 7)) (SLASH . (name . 7)) (SLASH_EQUAL . (name . 7)) (STAR . (name . 7)) (STAR_STAR . (name . 7)) (TICK_1 . (name . 7)) (IDENTIFIER . (name . 7)) (STRING_LITERAL . (name . 7)) (CHARACTER_LITERAL . (name . 7)))
      ((default . error) (ACCEPT . (name . 6)) (ABORT . (name . 6)) (AND . (name . 6)) (BEGIN . (name . 6)) (CASE . (name . 6)) (DECLARE . (name . 6)) (DELAY . (name . 6)) (DIGITS . (name . 6)) (DO . (name . 6)) (ELSE . (name . 6)) (ELSIF . (name . 6)) (EXIT . (name . 6)) (FOR . (name . 6)) (GOTO . (name . 6)) (IF . (name . 6)) (IN . (name . 6)) (IS . (name . 6)) (LOOP . (name . 6)) (MOD . (name . 6)) (NOT . (name . 6)) (NULL . (name . 6)) (OF . (name . 6)) (OR . (name . 6)) (PRAGMA . (name . 6)) (RAISE . (name . 6)) (RANGE . (name . 6)) (REM . (name . 6)) (RENAMES . (name . 6)) (REQUEUE . (name . 6)) (RETURN . (name . 6)) (SELECT . (name . 6)) (THEN . (name . 6)) (USE . (name . 6)) (WHILE . (name . 6)) (WITH . (name . 6)) (XOR . (name . 6)) (LEFT_PAREN . (name . 6)) (RIGHT_PAREN . (name . 6)) (AMPERSAND . (name . 6)) (BAR . (name . 6)) (COLON_EQUAL . (name . 6)) (COMMA . (name . 6)) (DOT . (name . 6)) (DOT_DOT . (name . 6)) (EQUAL . (name . 6)) (EQUAL_GREATER . (name . 6)) (GREATER . (name . 6)) (GREATER_EQUAL . (name . 6)) (LESS . (name . 6)) (LESS_EQUAL . (name . 6)) (LESS_LESS . (name . 6)) (MINUS . (name . 6)) (PLUS . (name . 6)) (SEMICOLON . (name . 6)) (SLASH . (name . 6)) (SLASH_EQUAL . (name . 6)) (STAR . (name . 6)) (STAR_STAR . (name . 6)) (TICK_1 . (name . 6)) (IDENTIFIER . (name . 6)) (STRING_LITERAL . (name . 6)) (CHARACTER_LITERAL . (name . 6)))
      ((default . error) (ACCEPT . (declaration . 0)) (ABORT . (declaration . 0)) (BEGIN . (declaration . 0)) (CASE . (declaration . 0)) (DECLARE . (declaration . 0)) (DELAY . (declaration . 0)) (END . (declaration . 0)) (ENTRY . (declaration . 0)) (EXIT . (declaration . 0)) (FOR . (declaration . 0)) (FUNCTION . (declaration . 0)) (GENERIC . (declaration . 0)) (GOTO . (declaration . 0)) (IF . (declaration . 0)) (LIMITED . (declaration . 0)) (LOOP . (declaration . 0)) (NOT . (declaration . 0)) (NULL . (declaration . 0)) (OVERRIDING . (declaration . 0)) (PACKAGE . (declaration . 0)) (PRAGMA . (declaration . 0)) (PRIVATE . (declaration . 0)) (PROCEDURE . (declaration . 0)) (PROTECTED . (declaration . 0)) (RAISE . (declaration . 0)) (REQUEUE . (declaration . 0)) (RETURN . (declaration . 0)) (SEPARATE . (declaration . 0)) (SELECT . (declaration . 0)) (SUBTYPE . (declaration . 0)) (TASK . (declaration . 0)) (TYPE . (declaration . 0)) (USE . (declaration . 0)) (WHILE . (declaration . 0)) (WITH . (declaration . 0)) (LESS_LESS . (declaration . 0)) (IDENTIFIER . (declaration . 0)) (STRING_LITERAL . (declaration . 0)) (CHARACTER_LITERAL . (declaration . 0)) (Wisi_EOI . (declaration . 0)))
      ((default . error) (ACCEPT . (compound_statement . 5)) (ABORT . (compound_statement . 5)) (BEGIN . (compound_statement . 5)) (CASE . (compound_statement . 5)) (DECLARE . (compound_statement . 5)) (DELAY . (compound_statement . 5)) (ELSE . (compound_statement . 5)) (ELSIF . (compound_statement . 5)) (END . (compound_statement . 5)) (ENTRY . (compound_statement . 5)) (EXCEPTION . (compound_statement . 5)) (EXIT . (compound_statement . 5)) (FOR . (compound_statement . 5)) (FUNCTION . (compound_statement . 5)) (GENERIC . (compound_statement . 5)) (GOTO . (compound_statement . 5)) (IF . (compound_statement . 5)) (LIMITED . (compound_statement . 5)) (LOOP . (compound_statement . 5)) (NOT . (compound_statement . 5)) (NULL . (compound_statement . 5)) (OR . (compound_statement . 5)) (OVERRIDING . (compound_statement . 5)) (PACKAGE . (compound_statement . 5)) (PRAGMA . (compound_statement . 5)) (PRIVATE . (compound_statement . 5)) (PROCEDURE . (compound_statement . 5)) (PROTECTED . (compound_statement . 5)) (RAISE . (compound_statement . 5)) (REQUEUE . (compound_statement . 5)) (RETURN . (compound_statement . 5)) (SEPARATE . (compound_statement . 5)) (SELECT . (compound_statement . 5)) (SUBTYPE . (compound_statement . 5)) (TASK . (compound_statement . 5)) (THEN . (compound_statement . 5)) (TYPE . (compound_statement . 5)) (USE . (compound_statement . 5)) (WHEN . (compound_statement . 5)) (WHILE . (compound_statement . 5)) (WITH . (compound_statement . 5)) (LESS_LESS . (compound_statement . 5)) (IDENTIFIER . (compound_statement . 5)) (STRING_LITERAL . (compound_statement . 5)) (CHARACTER_LITERAL . (compound_statement . 5)) (Wisi_EOI . (compound_statement . 5)))
      ((default . error) (ACCEPT . (declaration . 1)) (ABORT . (declaration . 1)) (BEGIN . (declaration . 1)) (CASE . (declaration . 1)) (DECLARE . (declaration . 1)) (DELAY . (declaration . 1)) (END . (declaration . 1)) (ENTRY . (declaration . 1)) (EXIT . (declaration . 1)) (FOR . (declaration . 1)) (FUNCTION . (declaration . 1)) (GENERIC . (declaration . 1)) (GOTO . (declaration . 1)) (IF . (declaration . 1)) (LIMITED . (declaration . 1)) (LOOP . (declaration . 1)) (NOT . (declaration . 1)) (NULL . (declaration . 1)) (OVERRIDING . (declaration . 1)) (PACKAGE . (declaration . 1)) (PRAGMA . (declaration . 1)) (PRIVATE . (declaration . 1)) (PROCEDURE . (declaration . 1)) (PROTECTED . (declaration . 1)) (RAISE . (declaration . 1)) (REQUEUE . (declaration . 1)) (RETURN . (declaration . 1)) (SEPARATE . (declaration . 1)) (SELECT . (declaration . 1)) (SUBTYPE . (declaration . 1)) (TASK . (declaration . 1)) (TYPE . (declaration . 1)) (USE . (declaration . 1)) (WHILE . (declaration . 1)) (WITH . (declaration . 1)) (LESS_LESS . (declaration . 1)) (IDENTIFIER . (declaration . 1)) (STRING_LITERAL . (declaration . 1)) (CHARACTER_LITERAL . (declaration . 1)) (Wisi_EOI . (declaration . 1)))
      ((default . error) (ACCEPT . (simple_statement . 1)) (ABORT . (simple_statement . 1)) (BEGIN . (simple_statement . 1)) (CASE . (simple_statement . 1)) (DECLARE . (simple_statement . 1)) (DELAY . (simple_statement . 1)) (ELSE . (simple_statement . 1)) (ELSIF . (simple_statement . 1)) (END . (simple_statement . 1)) (ENTRY . (simple_statement . 1)) (EXCEPTION . (simple_statement . 1)) (EXIT . (simple_statement . 1)) (FOR . (simple_statement . 1)) (FUNCTION . (simple_statement . 1)) (GENERIC . (simple_statement . 1)) (GOTO . (simple_statement . 1)) (IF . (simple_statement . 1)) (LIMITED . (simple_statement . 1)) (LOOP . (simple_statement . 1)) (NOT . (simple_statement . 1)) (NULL . (simple_statement . 1)) (OR . (simple_statement . 1)) (OVERRIDING . (simple_statement . 1)) (PACKAGE . (simple_statement . 1)) (PRAGMA . (simple_statement . 1)) (PRIVATE . (simple_statement . 1)) (PROCEDURE . (simple_statement . 1)) (PROTECTED . (simple_statement . 1)) (RAISE . (simple_statement . 1)) (REQUEUE . (simple_statement . 1)) (RETURN . (simple_statement . 1)) (SEPARATE . (simple_statement . 1)) (SELECT . (simple_statement . 1)) (SUBTYPE . (simple_statement . 1)) (TASK . (simple_statement . 1)) (THEN . (simple_statement . 1)) (TYPE . (simple_statement . 1)) (USE . (simple_statement . 1)) (WHEN . (simple_statement . 1)) (WHILE . (simple_statement . 1)) (WITH . (simple_statement . 1)) (LESS_LESS . (simple_statement . 1)) (IDENTIFIER . (simple_statement . 1)) (STRING_LITERAL . (simple_statement . 1)) (CHARACTER_LITERAL . (simple_statement . 1)) (Wisi_EOI . (simple_statement . 1)))
      ((default . error) (ACCEPT . (select_statement . 3)) (ABORT . (select_statement . 3)) (BEGIN . (select_statement . 3)) (CASE . (select_statement . 3)) (DECLARE . (select_statement . 3)) (DELAY . (select_statement . 3)) (ELSE . (select_statement . 3)) (ELSIF . (select_statement . 3)) (END . (select_statement . 3)) (ENTRY . (select_statement . 3)) (EXCEPTION . (select_statement . 3)) (EXIT . (select_statement . 3)) (FOR . (select_statement . 3)) (FUNCTION . (select_statement . 3)) (GENERIC . (select_statement . 3)) (GOTO . (select_statement . 3)) (IF . (select_statement . 3)) (LIMITED . (select_statement . 3)) (LOOP . (select_statement . 3)) (NOT . (select_statement . 3)) (NULL . (select_statement . 3)) (OR . (select_statement . 3)) (OVERRIDING . (select_statement . 3)) (PACKAGE . (select_statement . 3)) (PRAGMA . (select_statement . 3)) (PRIVATE . (select_statement . 3)) (PROCEDURE . (select_statement . 3)) (PROTECTED . (select_statement . 3)) (RAISE . (select_statement . 3)) (REQUEUE . (select_statement . 3)) (RETURN . (select_statement . 3)) (SEPARATE . (select_statement . 3)) (SELECT . (select_statement . 3)) (SUBTYPE . (select_statement . 3)) (TASK . (select_statement . 3)) (THEN . (select_statement . 3)) (TYPE . (select_statement . 3)) (USE . (select_statement . 3)) (WHEN . (select_statement . 3)) (WHILE . (select_statement . 3)) (WITH . (select_statement . 3)) (LESS_LESS . (select_statement . 3)) (IDENTIFIER . (select_statement . 3)) (STRING_LITERAL . (select_statement . 3)) (CHARACTER_LITERAL . (select_statement . 3)) (Wisi_EOI . (select_statement . 3)))
      ((default . error) (ACCEPT . (aspect_clause . 3)) (ABORT . (aspect_clause . 3)) (BEGIN . (aspect_clause . 3)) (CASE . (aspect_clause . 3)) (DECLARE . (aspect_clause . 3)) (DELAY . (aspect_clause . 3)) (END . (aspect_clause . 3)) (ENTRY . (aspect_clause . 3)) (EXIT . (aspect_clause . 3)) (FOR . (aspect_clause . 3)) (FUNCTION . (aspect_clause . 3)) (GENERIC . (aspect_clause . 3)) (GOTO . (aspect_clause . 3)) (IF . (aspect_clause . 3)) (LIMITED . (aspect_clause . 3)) (LOOP . (aspect_clause . 3)) (NOT . (aspect_clause . 3)) (NULL . (aspect_clause . 3)) (OVERRIDING . (aspect_clause . 3)) (PACKAGE . (aspect_clause . 3)) (PRAGMA . (aspect_clause . 3)) (PRIVATE . (aspect_clause . 3)) (PROCEDURE . (aspect_clause . 3)) (PROTECTED . (aspect_clause . 3)) (RAISE . (aspect_clause . 3)) (REQUEUE . (aspect_clause . 3)) (RETURN . (aspect_clause . 3)) (SEPARATE . (aspect_clause . 3)) (SELECT . (aspect_clause . 3)) (SUBTYPE . (aspect_clause . 3)) (TASK . (aspect_clause . 3)) (TYPE . (aspect_clause . 3)) (USE . (aspect_clause . 3)) (WHEN . (aspect_clause . 3)) (WHILE . (aspect_clause . 3)) (WITH . (aspect_clause . 3)) (LESS_LESS . (aspect_clause . 3)) (IDENTIFIER . (aspect_clause . 3)) (STRING_LITERAL . (aspect_clause . 3)) (CHARACTER_LITERAL . (aspect_clause . 3)) (Wisi_EOI . (aspect_clause . 3)))
      ((default . error) (ACCEPT . (name . 3)) (ABORT . (name . 3)) (AND . (name . 3)) (BEGIN . (name . 3)) (CASE . (name . 3)) (DECLARE . (name . 3)) (DELAY . (name . 3)) (DIGITS . (name . 3)) (DO . (name . 3)) (ELSE . (name . 3)) (ELSIF . (name . 3)) (EXIT . (name . 3)) (FOR . (name . 3)) (GOTO . (name . 3)) (IF . (name . 3)) (IN . (name . 3)) (IS . (name . 3)) (LOOP . (name . 3)) (MOD . (name . 3)) (NOT . (name . 3)) (NULL . (name . 3)) (OF . (name . 3)) (OR . (name . 3)) (PRAGMA . (name . 3)) (RAISE . (name . 3)) (RANGE . (name . 3)) (REM . (name . 3)) (RENAMES . (name . 3)) (REQUEUE . (name . 3)) (RETURN . (name . 3)) (SELECT . (name . 3)) (THEN . (name . 3)) (USE . (name . 3)) (WHILE . (name . 3)) (WITH . (name . 3)) (XOR . (name . 3)) (LEFT_PAREN . (name . 3)) (RIGHT_PAREN . (name . 3)) (AMPERSAND . (name . 3)) (BAR . (name . 3)) (COLON_EQUAL . (name . 3)) (COMMA . (name . 3)) (DOT . (name . 3)) (DOT_DOT . (name . 3)) (EQUAL . (name . 3)) (EQUAL_GREATER . (name . 3)) (GREATER . (name . 3)) (GREATER_EQUAL . (name . 3)) (LESS . (name . 3)) (LESS_EQUAL . (name . 3)) (LESS_LESS . (name . 3)) (MINUS . (name . 3)) (PLUS . (name . 3)) (SEMICOLON . (name . 3)) (SLASH . (name . 3)) (SLASH_EQUAL . (name . 3)) (STAR . (name . 3)) (STAR_STAR . (name . 3)) (TICK_1 . (name . 3)) (IDENTIFIER . (name . 3)) (STRING_LITERAL . (name . 3)) (CHARACTER_LITERAL . (name . 3)))
      ((default . error) (BEGIN . (block_label_opt . 0)) (DECLARE . (block_label_opt . 0)) (FOR . (block_label_opt . 0)) (LOOP . (block_label_opt . 0)) (WHILE . (block_label_opt . 0)))
      ((default . error) (BEGIN .  224) (DECLARE .  225) (FOR .  226) (LOOP .  227) (WHILE .  29))
      ((default . error) (ACCEPT . (compound_statement . 3)) (ABORT . (compound_statement . 3)) (BEGIN . (compound_statement . 3)) (CASE . (compound_statement . 3)) (DECLARE . (compound_statement . 3)) (DELAY . (compound_statement . 3)) (ELSE . (compound_statement . 3)) (ELSIF . (compound_statement . 3)) (END . (compound_statement . 3)) (ENTRY . (compound_statement . 3)) (EXCEPTION . (compound_statement . 3)) (EXIT . (compound_statement . 3)) (FOR . (compound_statement . 3)) (FUNCTION . (compound_statement . 3)) (GENERIC . (compound_statement . 3)) (GOTO . (compound_statement . 3)) (IF . (compound_statement . 3)) (LIMITED . (compound_statement . 3)) (LOOP . (compound_statement . 3)) (NOT . (compound_statement . 3)) (NULL . (compound_statement . 3)) (OR . (compound_statement . 3)) (OVERRIDING . (compound_statement . 3)) (PACKAGE . (compound_statement . 3)) (PRAGMA . (compound_statement . 3)) (PRIVATE . (compound_statement . 3)) (PROCEDURE . (compound_statement . 3)) (PROTECTED . (compound_statement . 3)) (RAISE . (compound_statement . 3)) (REQUEUE . (compound_statement . 3)) (RETURN . (compound_statement . 3)) (SEPARATE . (compound_statement . 3)) (SELECT . (compound_statement . 3)) (SUBTYPE . (compound_statement . 3)) (TASK . (compound_statement . 3)) (THEN . (compound_statement . 3)) (TYPE . (compound_statement . 3)) (USE . (compound_statement . 3)) (WHEN . (compound_statement . 3)) (WHILE . (compound_statement . 3)) (WITH . (compound_statement . 3)) (LESS_LESS . (compound_statement . 3)) (IDENTIFIER . (compound_statement . 3)) (STRING_LITERAL . (compound_statement . 3)) (CHARACTER_LITERAL . (compound_statement . 3)) (Wisi_EOI . (compound_statement . 3)))
      ((default . error) (ACCEPT . (declaration . 2)) (ABORT . (declaration . 2)) (BEGIN . (declaration . 2)) (CASE . (declaration . 2)) (DECLARE . (declaration . 2)) (DELAY . (declaration . 2)) (END . (declaration . 2)) (ENTRY . (declaration . 2)) (EXIT . (declaration . 2)) (FOR . (declaration . 2)) (FUNCTION . (declaration . 2)) (GENERIC . (declaration . 2)) (GOTO . (declaration . 2)) (IF . (declaration . 2)) (LIMITED . (declaration . 2)) (LOOP . (declaration . 2)) (NOT . (declaration . 2)) (NULL . (declaration . 2)) (OVERRIDING . (declaration . 2)) (PACKAGE . (declaration . 2)) (PRAGMA . (declaration . 2)) (PRIVATE . (declaration . 2)) (PROCEDURE . (declaration . 2)) (PROTECTED . (declaration . 2)) (RAISE . (declaration . 2)) (REQUEUE . (declaration . 2)) (RETURN . (declaration . 2)) (SEPARATE . (declaration . 2)) (SELECT . (declaration . 2)) (SUBTYPE . (declaration . 2)) (TASK . (declaration . 2)) (TYPE . (declaration . 2)) (USE . (declaration . 2)) (WHILE . (declaration . 2)) (WITH . (declaration . 2)) (LESS_LESS . (declaration . 2)) (IDENTIFIER . (declaration . 2)) (STRING_LITERAL . (declaration . 2)) (CHARACTER_LITERAL . (declaration . 2)) (Wisi_EOI . (declaration . 2)))
      ((default . error) (ACCEPT . (body_g . 1)) (ABORT . (body_g . 1)) (BEGIN . (body_g . 1)) (CASE . (body_g . 1)) (DECLARE . (body_g . 1)) (DELAY . (body_g . 1)) (END . (body_g . 1)) (ENTRY . (body_g . 1)) (EXIT . (body_g . 1)) (FOR . (body_g . 1)) (FUNCTION . (body_g . 1)) (GENERIC . (body_g . 1)) (GOTO . (body_g . 1)) (IF . (body_g . 1)) (LIMITED . (body_g . 1)) (LOOP . (body_g . 1)) (NOT . (body_g . 1)) (NULL . (body_g . 1)) (OVERRIDING . (body_g . 1)) (PACKAGE . (body_g . 1)) (PRAGMA . (body_g . 1)) (PRIVATE . (body_g . 1)) (PROCEDURE . (body_g . 1)) (PROTECTED . (body_g . 1)) (RAISE . (body_g . 1)) (REQUEUE . (body_g . 1)) (RETURN . (body_g . 1)) (SEPARATE . (body_g . 1)) (SELECT . (body_g . 1)) (SUBTYPE . (body_g . 1)) (TASK . (body_g . 1)) (TYPE . (body_g . 1)) (USE . (body_g . 1)) (WHILE . (body_g . 1)) (WITH . (body_g . 1)) (LESS_LESS . (body_g . 1)) (IDENTIFIER . (body_g . 1)) (STRING_LITERAL . (body_g . 1)) (CHARACTER_LITERAL . (body_g . 1)) (Wisi_EOI . (body_g . 1)))
      ((default . error) (ACCEPT . (compound_statement . 1)) (ABORT . (compound_statement . 1)) (BEGIN . (compound_statement . 1)) (CASE . (compound_statement . 1)) (DECLARE . (compound_statement . 1)) (DELAY . (compound_statement . 1)) (ELSE . (compound_statement . 1)) (ELSIF . (compound_statement . 1)) (END . (compound_statement . 1)) (ENTRY . (compound_statement . 1)) (EXCEPTION . (compound_statement . 1)) (EXIT . (compound_statement . 1)) (FOR . (compound_statement . 1)) (FUNCTION . (compound_statement . 1)) (GENERIC . (compound_statement . 1)) (GOTO . (compound_statement . 1)) (IF . (compound_statement . 1)) (LIMITED . (compound_statement . 1)) (LOOP . (compound_statement . 1)) (NOT . (compound_statement . 1)) (NULL . (compound_statement . 1)) (OR . (compound_statement . 1)) (OVERRIDING . (compound_statement . 1)) (PACKAGE . (compound_statement . 1)) (PRAGMA . (compound_statement . 1)) (PRIVATE . (compound_statement . 1)) (PROCEDURE . (compound_statement . 1)) (PROTECTED . (compound_statement . 1)) (RAISE . (compound_statement . 1)) (REQUEUE . (compound_statement . 1)) (RETURN . (compound_statement . 1)) (SEPARATE . (compound_statement . 1)) (SELECT . (compound_statement . 1)) (SUBTYPE . (compound_statement . 1)) (TASK . (compound_statement . 1)) (THEN . (compound_statement . 1)) (TYPE . (compound_statement . 1)) (USE . (compound_statement . 1)) (WHEN . (compound_statement . 1)) (WHILE . (compound_statement . 1)) (WITH . (compound_statement . 1)) (LESS_LESS . (compound_statement . 1)) (IDENTIFIER . (compound_statement . 1)) (STRING_LITERAL . (compound_statement . 1)) (CHARACTER_LITERAL . (compound_statement . 1)) (Wisi_EOI . (compound_statement . 1)))
      ((default . error) (ACCEPT . (compilation_unit_list . 1)) (ABORT . (compilation_unit_list . 1)) (BEGIN . (compilation_unit_list . 1)) (CASE . (compilation_unit_list . 1)) (DECLARE . (compilation_unit_list . 1)) (DELAY . (compilation_unit_list . 1)) (ENTRY . (compilation_unit_list . 1)) (EXIT . (compilation_unit_list . 1)) (FOR . (compilation_unit_list . 1)) (FUNCTION . (compilation_unit_list . 1)) (GENERIC . (compilation_unit_list . 1)) (GOTO . (compilation_unit_list . 1)) (IF . (compilation_unit_list . 1)) (LIMITED . (compilation_unit_list . 1)) (LOOP . (compilation_unit_list . 1)) (NOT . (compilation_unit_list . 1)) (NULL . (compilation_unit_list . 1)) (OVERRIDING . (compilation_unit_list . 1)) (PACKAGE . (compilation_unit_list . 1)) (PRAGMA . (compilation_unit_list . 1)) (PRIVATE . (compilation_unit_list . 1)) (PROCEDURE . (compilation_unit_list . 1)) (PROTECTED . (compilation_unit_list . 1)) (RAISE . (compilation_unit_list . 1)) (REQUEUE . (compilation_unit_list . 1)) (RETURN . (compilation_unit_list . 1)) (SEPARATE . (compilation_unit_list . 1)) (SELECT . (compilation_unit_list . 1)) (SUBTYPE . (compilation_unit_list . 1)) (TASK . (compilation_unit_list . 1)) (TYPE . (compilation_unit_list . 1)) (USE . (compilation_unit_list . 1)) (WHILE . (compilation_unit_list . 1)) (WITH . (compilation_unit_list . 1)) (LESS_LESS . (compilation_unit_list . 1)) (IDENTIFIER . (compilation_unit_list . 1)) (STRING_LITERAL . (compilation_unit_list . 1)) (CHARACTER_LITERAL . (compilation_unit_list . 1)) (Wisi_EOI . (compilation_unit_list . 1)))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (ENTRY . (overriding_indicator_opt . 2)) (EXIT .  5) (FOR . ( 6 (block_label_opt . 1))) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (GOTO .  9) (IF .  10) (LIMITED .  11) (LOOP . (block_label_opt . 1)) (NOT .  12) (NULL .  13) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PRIVATE .  17) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SEPARATE .  23) (SELECT .  24) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (WHILE . (block_label_opt . 1)) (WITH .  30) (LESS_LESS .  31) (IDENTIFIER .  32) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34) (Wisi_EOI . accept))
      ((default . error) (ACCEPT . (statement . 2)) (ABORT . (statement . 2)) (BEGIN . (statement . 2)) (CASE . (statement . 2)) (DECLARE . (statement . 2)) (DELAY . (statement . 2)) (ELSE . (statement . 2)) (ELSIF . (statement . 2)) (END . (statement . 2)) (ENTRY . (statement . 2)) (EXCEPTION . (statement . 2)) (EXIT . (statement . 2)) (FOR . (statement . 2)) (FUNCTION . (statement . 2)) (GENERIC . (statement . 2)) (GOTO . (statement . 2)) (IF . (statement . 2)) (LIMITED . (statement . 2)) (LOOP . (statement . 2)) (NOT . (statement . 2)) (NULL . (statement . 2)) (OR . (statement . 2)) (OVERRIDING . (statement . 2)) (PACKAGE . (statement . 2)) (PRAGMA . (statement . 2)) (PRIVATE . (statement . 2)) (PROCEDURE . (statement . 2)) (PROTECTED . (statement . 2)) (RAISE . (statement . 2)) (REQUEUE . (statement . 2)) (RETURN . (statement . 2)) (SEPARATE . (statement . 2)) (SELECT . (statement . 2)) (SUBTYPE . (statement . 2)) (TASK . (statement . 2)) (THEN . (statement . 2)) (TYPE . (statement . 2)) (USE . (statement . 2)) (WHEN . (statement . 2)) (WHILE . (statement . 2)) (WITH . (statement . 2)) (LESS_LESS . (statement . 2)) (IDENTIFIER . (statement . 2)) (STRING_LITERAL . (statement . 2)) (CHARACTER_LITERAL . (statement . 2)) (Wisi_EOI . (statement . 2)))
      ((default . error) (ACCEPT . (select_statement . 2)) (ABORT . (select_statement . 2)) (BEGIN . (select_statement . 2)) (CASE . (select_statement . 2)) (DECLARE . (select_statement . 2)) (DELAY . (select_statement . 2)) (ELSE . (select_statement . 2)) (ELSIF . (select_statement . 2)) (END . (select_statement . 2)) (ENTRY . (select_statement . 2)) (EXCEPTION . (select_statement . 2)) (EXIT . (select_statement . 2)) (FOR . (select_statement . 2)) (FUNCTION . (select_statement . 2)) (GENERIC . (select_statement . 2)) (GOTO . (select_statement . 2)) (IF . (select_statement . 2)) (LIMITED . (select_statement . 2)) (LOOP . (select_statement . 2)) (NOT . (select_statement . 2)) (NULL . (select_statement . 2)) (OR . (select_statement . 2)) (OVERRIDING . (select_statement . 2)) (PACKAGE . (select_statement . 2)) (PRAGMA . (select_statement . 2)) (PRIVATE . (select_statement . 2)) (PROCEDURE . (select_statement . 2)) (PROTECTED . (select_statement . 2)) (RAISE . (select_statement . 2)) (REQUEUE . (select_statement . 2)) (RETURN . (select_statement . 2)) (SEPARATE . (select_statement . 2)) (SELECT . (select_statement . 2)) (SUBTYPE . (select_statement . 2)) (TASK . (select_statement . 2)) (THEN . (select_statement . 2)) (TYPE . (select_statement . 2)) (USE . (select_statement . 2)) (WHEN . (select_statement . 2)) (WHILE . (select_statement . 2)) (WITH . (select_statement . 2)) (LESS_LESS . (select_statement . 2)) (IDENTIFIER . (select_statement . 2)) (STRING_LITERAL . (select_statement . 2)) (CHARACTER_LITERAL . (select_statement . 2)) (Wisi_EOI . (select_statement . 2)))
      ((default . error) (ACCEPT . (compilation_unit . 3)) (ABORT . (compilation_unit . 3)) (BEGIN . (compilation_unit . 3)) (CASE . (compilation_unit . 3)) (DECLARE . (compilation_unit . 3)) (DELAY . (compilation_unit . 3)) (ENTRY . (compilation_unit . 3)) (EXIT . (compilation_unit . 3)) (FOR . (compilation_unit . 3)) (FUNCTION . (compilation_unit . 3)) (GENERIC . (compilation_unit . 3)) (GOTO . (compilation_unit . 3)) (IF . (compilation_unit . 3)) (LIMITED . (compilation_unit . 3)) (LOOP . (compilation_unit . 3)) (NOT . (compilation_unit . 3)) (NULL . (compilation_unit . 3)) (OVERRIDING . (compilation_unit . 3)) (PACKAGE . (compilation_unit . 3)) (PRAGMA . (compilation_unit . 3)) (PRIVATE . (compilation_unit . 3)) (PROCEDURE . (compilation_unit . 3)) (PROTECTED . (compilation_unit . 3)) (RAISE . (compilation_unit . 3)) (REQUEUE . (compilation_unit . 3)) (RETURN . (compilation_unit . 3)) (SEPARATE . (compilation_unit . 3)) (SELECT . (compilation_unit . 3)) (SUBTYPE . (compilation_unit . 3)) (TASK . (compilation_unit . 3)) (TYPE . (compilation_unit . 3)) (USE . (compilation_unit . 3)) (WHILE . (compilation_unit . 3)) (WITH . (compilation_unit . 3)) (LESS_LESS . (compilation_unit . 3)) (IDENTIFIER . (compilation_unit . 3)) (STRING_LITERAL . (compilation_unit . 3)) (CHARACTER_LITERAL . (compilation_unit . 3)) (Wisi_EOI . (compilation_unit . 3)))
      ((default . error) (ACCEPT . (simple_statement . 7)) (ABORT . (simple_statement . 7)) (BEGIN . (simple_statement . 7)) (CASE . (simple_statement . 7)) (DECLARE . (simple_statement . 7)) (DELAY . (simple_statement . 7)) (ELSE . (simple_statement . 7)) (ELSIF . (simple_statement . 7)) (END . (simple_statement . 7)) (ENTRY . (simple_statement . 7)) (EXCEPTION . (simple_statement . 7)) (EXIT . (simple_statement . 7)) (FOR . (simple_statement . 7)) (FUNCTION . (simple_statement . 7)) (GENERIC . (simple_statement . 7)) (GOTO . (simple_statement . 7)) (IF . (simple_statement . 7)) (LIMITED . (simple_statement . 7)) (LOOP . (simple_statement . 7)) (NOT . (simple_statement . 7)) (NULL . (simple_statement . 7)) (OR . (simple_statement . 7)) (OVERRIDING . (simple_statement . 7)) (PACKAGE . (simple_statement . 7)) (PRAGMA . (simple_statement . 7)) (PRIVATE . (simple_statement . 7)) (PROCEDURE . (simple_statement . 7)) (PROTECTED . (simple_statement . 7)) (RAISE . (simple_statement . 7)) (REQUEUE . (simple_statement . 7)) (RETURN . (simple_statement . 7)) (SEPARATE . (simple_statement . 7)) (SELECT . (simple_statement . 7)) (SUBTYPE . (simple_statement . 7)) (TASK . (simple_statement . 7)) (THEN . (simple_statement . 7)) (TYPE . (simple_statement . 7)) (USE . (simple_statement . 7)) (WHEN . (simple_statement . 7)) (WHILE . (simple_statement . 7)) (WITH . (simple_statement . 7)) (LESS_LESS . (simple_statement . 7)) (IDENTIFIER . (simple_statement . 7)) (STRING_LITERAL . (simple_statement . 7)) (CHARACTER_LITERAL . (simple_statement . 7)) (Wisi_EOI . (simple_statement . 7)))
      ((default . error) (ACCEPT . (declaration . 3)) (ABORT . (declaration . 3)) (BEGIN . (declaration . 3)) (CASE . (declaration . 3)) (DECLARE . (declaration . 3)) (DELAY . (declaration . 3)) (END . (declaration . 3)) (ENTRY . (declaration . 3)) (EXIT . (declaration . 3)) (FOR . (declaration . 3)) (FUNCTION . (declaration . 3)) (GENERIC . (declaration . 3)) (GOTO . (declaration . 3)) (IF . (declaration . 3)) (LIMITED . (declaration . 3)) (LOOP . (declaration . 3)) (NOT . (declaration . 3)) (NULL . (declaration . 3)) (OVERRIDING . (declaration . 3)) (PACKAGE . (declaration . 3)) (PRAGMA . (declaration . 3)) (PRIVATE . (declaration . 3)) (PROCEDURE . (declaration . 3)) (PROTECTED . (declaration . 3)) (RAISE . (declaration . 3)) (REQUEUE . (declaration . 3)) (RETURN . (declaration . 3)) (SEPARATE . (declaration . 3)) (SELECT . (declaration . 3)) (SUBTYPE . (declaration . 3)) (TASK . (declaration . 3)) (TYPE . (declaration . 3)) (USE . (declaration . 3)) (WHILE . (declaration . 3)) (WITH . (declaration . 3)) (LESS_LESS . (declaration . 3)) (IDENTIFIER . (declaration . 3)) (STRING_LITERAL . (declaration . 3)) (CHARACTER_LITERAL . (declaration . 3)) (Wisi_EOI . (declaration . 3)))
      ((default . error) (ACCEPT . (aspect_clause . 1)) (ABORT . (aspect_clause . 1)) (BEGIN . (aspect_clause . 1)) (CASE . (aspect_clause . 1)) (DECLARE . (aspect_clause . 1)) (DELAY . (aspect_clause . 1)) (END . (aspect_clause . 1)) (ENTRY . (aspect_clause . 1)) (EXIT . (aspect_clause . 1)) (FOR . (aspect_clause . 1)) (FUNCTION . (aspect_clause . 1)) (GENERIC . (aspect_clause . 1)) (GOTO . (aspect_clause . 1)) (IF . (aspect_clause . 1)) (LIMITED . (aspect_clause . 1)) (LOOP . (aspect_clause . 1)) (NOT . (aspect_clause . 1)) (NULL . (aspect_clause . 1)) (OVERRIDING . (aspect_clause . 1)) (PACKAGE . (aspect_clause . 1)) (PRAGMA . (aspect_clause . 1)) (PRIVATE . (aspect_clause . 1)) (PROCEDURE . (aspect_clause . 1)) (PROTECTED . (aspect_clause . 1)) (RAISE . (aspect_clause . 1)) (REQUEUE . (aspect_clause . 1)) (RETURN . (aspect_clause . 1)) (SEPARATE . (aspect_clause . 1)) (SELECT . (aspect_clause . 1)) (SUBTYPE . (aspect_clause . 1)) (TASK . (aspect_clause . 1)) (TYPE . (aspect_clause . 1)) (USE . (aspect_clause . 1)) (WHEN . (aspect_clause . 1)) (WHILE . (aspect_clause . 1)) (WITH . (aspect_clause . 1)) (LESS_LESS . (aspect_clause . 1)) (IDENTIFIER . (aspect_clause . 1)) (STRING_LITERAL . (aspect_clause . 1)) (CHARACTER_LITERAL . (aspect_clause . 1)) (Wisi_EOI . (aspect_clause . 1)))
      ((default . error) (ACCEPT . (declaration . 4)) (ABORT . (declaration . 4)) (BEGIN . (declaration . 4)) (CASE . (declaration . 4)) (DECLARE . (declaration . 4)) (DELAY . (declaration . 4)) (END . (declaration . 4)) (ENTRY . (declaration . 4)) (EXIT . (declaration . 4)) (FOR . (declaration . 4)) (FUNCTION . (declaration . 4)) (GENERIC . (declaration . 4)) (GOTO . (declaration . 4)) (IF . (declaration . 4)) (LIMITED . (declaration . 4)) (LOOP . (declaration . 4)) (NOT . (declaration . 4)) (NULL . (declaration . 4)) (OVERRIDING . (declaration . 4)) (PACKAGE . (declaration . 4)) (PRAGMA . (declaration . 4)) (PRIVATE . (declaration . 4)) (PROCEDURE . (declaration . 4)) (PROTECTED . (declaration . 4)) (RAISE . (declaration . 4)) (REQUEUE . (declaration . 4)) (RETURN . (declaration . 4)) (SEPARATE . (declaration . 4)) (SELECT . (declaration . 4)) (SUBTYPE . (declaration . 4)) (TASK . (declaration . 4)) (TYPE . (declaration . 4)) (USE . (declaration . 4)) (WHILE . (declaration . 4)) (WITH . (declaration . 4)) (LESS_LESS . (declaration . 4)) (IDENTIFIER . (declaration . 4)) (STRING_LITERAL . (declaration . 4)) (CHARACTER_LITERAL . (declaration . 4)) (Wisi_EOI . (declaration . 4)))
      ((default . error) (ACCEPT . (simple_statement . 2)) (ABORT . (simple_statement . 2)) (BEGIN . (simple_statement . 2)) (CASE . (simple_statement . 2)) (DECLARE . (simple_statement . 2)) (DELAY . (simple_statement . 2)) (ELSE . (simple_statement . 2)) (ELSIF . (simple_statement . 2)) (END . (simple_statement . 2)) (ENTRY . (simple_statement . 2)) (EXCEPTION . (simple_statement . 2)) (EXIT . (simple_statement . 2)) (FOR . (simple_statement . 2)) (FUNCTION . (simple_statement . 2)) (GENERIC . (simple_statement . 2)) (GOTO . (simple_statement . 2)) (IF . (simple_statement . 2)) (LIMITED . (simple_statement . 2)) (LOOP . (simple_statement . 2)) (NOT . (simple_statement . 2)) (NULL . (simple_statement . 2)) (OR . (simple_statement . 2)) (OVERRIDING . (simple_statement . 2)) (PACKAGE . (simple_statement . 2)) (PRAGMA . (simple_statement . 2)) (PRIVATE . (simple_statement . 2)) (PROCEDURE . (simple_statement . 2)) (PROTECTED . (simple_statement . 2)) (RAISE . (simple_statement . 2)) (REQUEUE . (simple_statement . 2)) (RETURN . (simple_statement . 2)) (SEPARATE . (simple_statement . 2)) (SELECT . (simple_statement . 2)) (SUBTYPE . (simple_statement . 2)) (TASK . (simple_statement . 2)) (THEN . (simple_statement . 2)) (TYPE . (simple_statement . 2)) (USE . (simple_statement . 2)) (WHEN . (simple_statement . 2)) (WHILE . (simple_statement . 2)) (WITH . (simple_statement . 2)) (LESS_LESS . (simple_statement . 2)) (IDENTIFIER . (simple_statement . 2)) (STRING_LITERAL . (simple_statement . 2)) (CHARACTER_LITERAL . (simple_statement . 2)) (Wisi_EOI . (simple_statement . 2)))
      ((default . error) (ACCEPT . (declaration . 5)) (ABORT . (declaration . 5)) (BEGIN . (declaration . 5)) (CASE . (declaration . 5)) (DECLARE . (declaration . 5)) (DELAY . (declaration . 5)) (END . (declaration . 5)) (ENTRY . (declaration . 5)) (EXIT . (declaration . 5)) (FOR . (declaration . 5)) (FUNCTION . (declaration . 5)) (GENERIC . (declaration . 5)) (GOTO . (declaration . 5)) (IF . (declaration . 5)) (LIMITED . (declaration . 5)) (LOOP . (declaration . 5)) (NOT . (declaration . 5)) (NULL . (declaration . 5)) (OVERRIDING . (declaration . 5)) (PACKAGE . (declaration . 5)) (PRAGMA . (declaration . 5)) (PRIVATE . (declaration . 5)) (PROCEDURE . (declaration . 5)) (PROTECTED . (declaration . 5)) (RAISE . (declaration . 5)) (REQUEUE . (declaration . 5)) (RETURN . (declaration . 5)) (SEPARATE . (declaration . 5)) (SELECT . (declaration . 5)) (SUBTYPE . (declaration . 5)) (TASK . (declaration . 5)) (TYPE . (declaration . 5)) (USE . (declaration . 5)) (WHILE . (declaration . 5)) (WITH . (declaration . 5)) (LESS_LESS . (declaration . 5)) (IDENTIFIER . (declaration . 5)) (STRING_LITERAL . (declaration . 5)) (CHARACTER_LITERAL . (declaration . 5)) (Wisi_EOI . (declaration . 5)))
      ((default . error) (ACCEPT . (compound_statement . 4)) (ABORT . (compound_statement . 4)) (BEGIN . (compound_statement . 4)) (CASE . (compound_statement . 4)) (DECLARE . (compound_statement . 4)) (DELAY . (compound_statement . 4)) (ELSE . (compound_statement . 4)) (ELSIF . (compound_statement . 4)) (END . (compound_statement . 4)) (ENTRY . (compound_statement . 4)) (EXCEPTION . (compound_statement . 4)) (EXIT . (compound_statement . 4)) (FOR . (compound_statement . 4)) (FUNCTION . (compound_statement . 4)) (GENERIC . (compound_statement . 4)) (GOTO . (compound_statement . 4)) (IF . (compound_statement . 4)) (LIMITED . (compound_statement . 4)) (LOOP . (compound_statement . 4)) (NOT . (compound_statement . 4)) (NULL . (compound_statement . 4)) (OR . (compound_statement . 4)) (OVERRIDING . (compound_statement . 4)) (PACKAGE . (compound_statement . 4)) (PRAGMA . (compound_statement . 4)) (PRIVATE . (compound_statement . 4)) (PROCEDURE . (compound_statement . 4)) (PROTECTED . (compound_statement . 4)) (RAISE . (compound_statement . 4)) (REQUEUE . (compound_statement . 4)) (RETURN . (compound_statement . 4)) (SEPARATE . (compound_statement . 4)) (SELECT . (compound_statement . 4)) (SUBTYPE . (compound_statement . 4)) (TASK . (compound_statement . 4)) (THEN . (compound_statement . 4)) (TYPE . (compound_statement . 4)) (USE . (compound_statement . 4)) (WHEN . (compound_statement . 4)) (WHILE . (compound_statement . 4)) (WITH . (compound_statement . 4)) (LESS_LESS . (compound_statement . 4)) (IDENTIFIER . (compound_statement . 4)) (STRING_LITERAL . (compound_statement . 4)) (CHARACTER_LITERAL . (compound_statement . 4)) (Wisi_EOI . (compound_statement . 4)))
      ((default . error) (ACCEPT . (type_declaration . 0)) (ABORT . (type_declaration . 0)) (BEGIN . (type_declaration . 0)) (CASE . (type_declaration . 0)) (DECLARE . (type_declaration . 0)) (DELAY . (type_declaration . 0)) (END . (type_declaration . 0)) (ENTRY . (type_declaration . 0)) (EXIT . (type_declaration . 0)) (FOR . (type_declaration . 0)) (FUNCTION . (type_declaration . 0)) (GENERIC . (type_declaration . 0)) (GOTO . (type_declaration . 0)) (IF . (type_declaration . 0)) (LIMITED . (type_declaration . 0)) (LOOP . (type_declaration . 0)) (NOT . (type_declaration . 0)) (NULL . (type_declaration . 0)) (OVERRIDING . (type_declaration . 0)) (PACKAGE . (type_declaration . 0)) (PRAGMA . (type_declaration . 0)) (PRIVATE . (type_declaration . 0)) (PROCEDURE . (type_declaration . 0)) (PROTECTED . (type_declaration . 0)) (RAISE . (type_declaration . 0)) (REQUEUE . (type_declaration . 0)) (RETURN . (type_declaration . 0)) (SEPARATE . (type_declaration . 0)) (SELECT . (type_declaration . 0)) (SUBTYPE . (type_declaration . 0)) (TASK . (type_declaration . 0)) (TYPE . (type_declaration . 0)) (USE . (type_declaration . 0)) (WHILE . (type_declaration . 0)) (WITH . (type_declaration . 0)) (LESS_LESS . (type_declaration . 0)) (IDENTIFIER . (type_declaration . 0)) (STRING_LITERAL . (type_declaration . 0)) (CHARACTER_LITERAL . (type_declaration . 0)) (Wisi_EOI . (type_declaration . 0)))
      ((default . error) (IS . (subprogram_specification . 1)) (WITH . (subprogram_specification . 1)) (SEMICOLON . (subprogram_specification . 1)))
      ((default . error) (ACCEPT . (declaration . 6)) (ABORT . (declaration . 6)) (BEGIN . (declaration . 6)) (CASE . (declaration . 6)) (DECLARE . (declaration . 6)) (DELAY . (declaration . 6)) (END . (declaration . 6)) (ENTRY . (declaration . 6)) (EXIT . (declaration . 6)) (FOR . (declaration . 6)) (FUNCTION . (declaration . 6)) (GENERIC . (declaration . 6)) (GOTO . (declaration . 6)) (IF . (declaration . 6)) (LIMITED . (declaration . 6)) (LOOP . (declaration . 6)) (NOT . (declaration . 6)) (NULL . (declaration . 6)) (OVERRIDING . (declaration . 6)) (PACKAGE . (declaration . 6)) (PRAGMA . (declaration . 6)) (PRIVATE . (declaration . 6)) (PROCEDURE . (declaration . 6)) (PROTECTED . (declaration . 6)) (RAISE . (declaration . 6)) (REQUEUE . (declaration . 6)) (RETURN . (declaration . 6)) (SEPARATE . (declaration . 6)) (SELECT . (declaration . 6)) (SUBTYPE . (declaration . 6)) (TASK . (declaration . 6)) (TYPE . (declaration . 6)) (USE . (declaration . 6)) (WHILE . (declaration . 6)) (WITH . (declaration . 6)) (LESS_LESS . (declaration . 6)) (IDENTIFIER . (declaration . 6)) (STRING_LITERAL . (declaration . 6)) (CHARACTER_LITERAL . (declaration . 6)) (Wisi_EOI . (declaration . 6)))
      ((default . error) (FUNCTION .  7) (PACKAGE .  230) (PROCEDURE .  18))
      ((default . error) (ACCEPT . (declaration . 7)) (ABORT . (declaration . 7)) (BEGIN . (declaration . 7)) (CASE . (declaration . 7)) (DECLARE . (declaration . 7)) (DELAY . (declaration . 7)) (END . (declaration . 7)) (ENTRY . (declaration . 7)) (EXIT . (declaration . 7)) (FOR . (declaration . 7)) (FUNCTION . (declaration . 7)) (GENERIC . (declaration . 7)) (GOTO . (declaration . 7)) (IF . (declaration . 7)) (LIMITED . (declaration . 7)) (LOOP . (declaration . 7)) (NOT . (declaration . 7)) (NULL . (declaration . 7)) (OVERRIDING . (declaration . 7)) (PACKAGE . (declaration . 7)) (PRAGMA . (declaration . 7)) (PRIVATE . (declaration . 7)) (PROCEDURE . (declaration . 7)) (PROTECTED . (declaration . 7)) (RAISE . (declaration . 7)) (REQUEUE . (declaration . 7)) (RETURN . (declaration . 7)) (SEPARATE . (declaration . 7)) (SELECT . (declaration . 7)) (SUBTYPE . (declaration . 7)) (TASK . (declaration . 7)) (TYPE . (declaration . 7)) (USE . (declaration . 7)) (WHILE . (declaration . 7)) (WITH . (declaration . 7)) (LESS_LESS . (declaration . 7)) (IDENTIFIER . (declaration . 7)) (STRING_LITERAL . (declaration . 7)) (CHARACTER_LITERAL . (declaration . 7)) (Wisi_EOI . (declaration . 7)))
      ((default . error) (ACCEPT . (generic_declaration . 1)) (ABORT . (generic_declaration . 1)) (BEGIN . (generic_declaration . 1)) (CASE . (generic_declaration . 1)) (DECLARE . (generic_declaration . 1)) (DELAY . (generic_declaration . 1)) (END . (generic_declaration . 1)) (ENTRY . (generic_declaration . 1)) (EXIT . (generic_declaration . 1)) (FOR . (generic_declaration . 1)) (FUNCTION . (generic_declaration . 1)) (GENERIC . (generic_declaration . 1)) (GOTO . (generic_declaration . 1)) (IF . (generic_declaration . 1)) (LIMITED . (generic_declaration . 1)) (LOOP . (generic_declaration . 1)) (NOT . (generic_declaration . 1)) (NULL . (generic_declaration . 1)) (OVERRIDING . (generic_declaration . 1)) (PACKAGE . (generic_declaration . 1)) (PRAGMA . (generic_declaration . 1)) (PRIVATE . (generic_declaration . 1)) (PROCEDURE . (generic_declaration . 1)) (PROTECTED . (generic_declaration . 1)) (RAISE . (generic_declaration . 1)) (REQUEUE . (generic_declaration . 1)) (RETURN . (generic_declaration . 1)) (SEPARATE . (generic_declaration . 1)) (SELECT . (generic_declaration . 1)) (SUBTYPE . (generic_declaration . 1)) (TASK . (generic_declaration . 1)) (TYPE . (generic_declaration . 1)) (USE . (generic_declaration . 1)) (WHILE . (generic_declaration . 1)) (WITH . (generic_declaration . 1)) (LESS_LESS . (generic_declaration . 1)) (IDENTIFIER . (generic_declaration . 1)) (STRING_LITERAL . (generic_declaration . 1)) (CHARACTER_LITERAL . (generic_declaration . 1)) (Wisi_EOI . (generic_declaration . 1)))
      ((default . error) (ACCEPT . (renaming_declaration . 3)) (ABORT . (renaming_declaration . 3)) (BEGIN . (renaming_declaration . 3)) (CASE . (renaming_declaration . 3)) (DECLARE . (renaming_declaration . 3)) (DELAY . (renaming_declaration . 3)) (END . (renaming_declaration . 3)) (ENTRY . (renaming_declaration . 3)) (EXIT . (renaming_declaration . 3)) (FOR . (renaming_declaration . 3)) (FUNCTION . (renaming_declaration . 3)) (GENERIC . (renaming_declaration . 3)) (GOTO . (renaming_declaration . 3)) (IF . (renaming_declaration . 3)) (LIMITED . (renaming_declaration . 3)) (LOOP . (renaming_declaration . 3)) (NOT . (renaming_declaration . 3)) (NULL . (renaming_declaration . 3)) (OVERRIDING . (renaming_declaration . 3)) (PACKAGE . (renaming_declaration . 3)) (PRAGMA . (renaming_declaration . 3)) (PRIVATE . (renaming_declaration . 3)) (PROCEDURE . (renaming_declaration . 3)) (PROTECTED . (renaming_declaration . 3)) (RAISE . (renaming_declaration . 3)) (REQUEUE . (renaming_declaration . 3)) (RETURN . (renaming_declaration . 3)) (SEPARATE . (renaming_declaration . 3)) (SELECT . (renaming_declaration . 3)) (SUBTYPE . (renaming_declaration . 3)) (TASK . (renaming_declaration . 3)) (TYPE . (renaming_declaration . 3)) (USE . (renaming_declaration . 3)) (WHILE . (renaming_declaration . 3)) (WITH . (renaming_declaration . 3)) (LESS_LESS . (renaming_declaration . 3)) (IDENTIFIER . (renaming_declaration . 3)) (STRING_LITERAL . (renaming_declaration . 3)) (CHARACTER_LITERAL . (renaming_declaration . 3)) (Wisi_EOI . (renaming_declaration . 3)))
      ((default . error) (ACCEPT . (generic_declaration . 0)) (ABORT . (generic_declaration . 0)) (BEGIN . (generic_declaration . 0)) (CASE . (generic_declaration . 0)) (DECLARE . (generic_declaration . 0)) (DELAY . (generic_declaration . 0)) (END . (generic_declaration . 0)) (ENTRY . (generic_declaration . 0)) (EXIT . (generic_declaration . 0)) (FOR . (generic_declaration . 0)) (FUNCTION . (generic_declaration . 0)) (GENERIC . (generic_declaration . 0)) (GOTO . (generic_declaration . 0)) (IF . (generic_declaration . 0)) (LIMITED . (generic_declaration . 0)) (LOOP . (generic_declaration . 0)) (NOT . (generic_declaration . 0)) (NULL . (generic_declaration . 0)) (OVERRIDING . (generic_declaration . 0)) (PACKAGE . (generic_declaration . 0)) (PRAGMA . (generic_declaration . 0)) (PRIVATE . (generic_declaration . 0)) (PROCEDURE . (generic_declaration . 0)) (PROTECTED . (generic_declaration . 0)) (RAISE . (generic_declaration . 0)) (REQUEUE . (generic_declaration . 0)) (RETURN . (generic_declaration . 0)) (SEPARATE . (generic_declaration . 0)) (SELECT . (generic_declaration . 0)) (SUBTYPE . (generic_declaration . 0)) (TASK . (generic_declaration . 0)) (TYPE . (generic_declaration . 0)) (USE . (generic_declaration . 0)) (WHILE . (generic_declaration . 0)) (WITH . (generic_declaration . 0)) (LESS_LESS . (generic_declaration . 0)) (IDENTIFIER . (generic_declaration . 0)) (STRING_LITERAL . (generic_declaration . 0)) (CHARACTER_LITERAL . (generic_declaration . 0)) (Wisi_EOI . (generic_declaration . 0)))
      ((default . error) (ACCEPT . (statement . 0)) (ABORT . (statement . 0)) (BEGIN . (statement . 0)) (CASE . (statement . 0)) (DECLARE . (statement . 0)) (DELAY . (statement . 0)) (ELSE . (statement . 0)) (ELSIF . (statement . 0)) (END . (statement . 0)) (ENTRY . (statement . 0)) (EXCEPTION . (statement . 0)) (EXIT . (statement . 0)) (FOR . (statement . 0)) (FUNCTION . (statement . 0)) (GENERIC . (statement . 0)) (GOTO . (statement . 0)) (IF . (statement . 0)) (LIMITED . (statement . 0)) (LOOP . (statement . 0)) (NOT . (statement . 0)) (NULL . (statement . 0)) (OR . (statement . 0)) (OVERRIDING . (statement . 0)) (PACKAGE . (statement . 0)) (PRAGMA . (statement . 0)) (PRIVATE . (statement . 0)) (PROCEDURE . (statement . 0)) (PROTECTED . (statement . 0)) (RAISE . (statement . 0)) (REQUEUE . (statement . 0)) (RETURN . (statement . 0)) (SEPARATE . (statement . 0)) (SELECT . (statement . 0)) (SUBTYPE . (statement . 0)) (TASK . (statement . 0)) (THEN . (statement . 0)) (TYPE . (statement . 0)) (USE . (statement . 0)) (WHEN . (statement . 0)) (WHILE . (statement . 0)) (WITH . (statement . 0)) (LESS_LESS . (statement . 0)) (IDENTIFIER . (statement . 0)) (STRING_LITERAL . (statement . 0)) (CHARACTER_LITERAL . (statement . 0)) (Wisi_EOI . (statement . 0)))
      ((default . error) (COLON .  233) (COMMA .  234))
      ((default . error) (ACCEPT . (compound_statement . 0)) (ABORT . (compound_statement . 0)) (BEGIN . (compound_statement . 0)) (CASE . (compound_statement . 0)) (DECLARE . (compound_statement . 0)) (DELAY . (compound_statement . 0)) (ELSE . (compound_statement . 0)) (ELSIF . (compound_statement . 0)) (END . (compound_statement . 0)) (ENTRY . (compound_statement . 0)) (EXCEPTION . (compound_statement . 0)) (EXIT . (compound_statement . 0)) (FOR . (compound_statement . 0)) (FUNCTION . (compound_statement . 0)) (GENERIC . (compound_statement . 0)) (GOTO . (compound_statement . 0)) (IF . (compound_statement . 0)) (LIMITED . (compound_statement . 0)) (LOOP . (compound_statement . 0)) (NOT . (compound_statement . 0)) (NULL . (compound_statement . 0)) (OR . (compound_statement . 0)) (OVERRIDING . (compound_statement . 0)) (PACKAGE . (compound_statement . 0)) (PRAGMA . (compound_statement . 0)) (PRIVATE . (compound_statement . 0)) (PROCEDURE . (compound_statement . 0)) (PROTECTED . (compound_statement . 0)) (RAISE . (compound_statement . 0)) (REQUEUE . (compound_statement . 0)) (RETURN . (compound_statement . 0)) (SEPARATE . (compound_statement . 0)) (SELECT . (compound_statement . 0)) (SUBTYPE . (compound_statement . 0)) (TASK . (compound_statement . 0)) (THEN . (compound_statement . 0)) (TYPE . (compound_statement . 0)) (USE . (compound_statement . 0)) (WHEN . (compound_statement . 0)) (WHILE . (compound_statement . 0)) (WITH . (compound_statement . 0)) (LESS_LESS . (compound_statement . 0)) (IDENTIFIER . (compound_statement . 0)) (STRING_LITERAL . (compound_statement . 0)) (CHARACTER_LITERAL . (compound_statement . 0)) (Wisi_EOI . (compound_statement . 0)))
      ((default . error) (ACCEPT . (type_declaration . 1)) (ABORT . (type_declaration . 1)) (BEGIN . (type_declaration . 1)) (CASE . (type_declaration . 1)) (DECLARE . (type_declaration . 1)) (DELAY . (type_declaration . 1)) (END . (type_declaration . 1)) (ENTRY . (type_declaration . 1)) (EXIT . (type_declaration . 1)) (FOR . (type_declaration . 1)) (FUNCTION . (type_declaration . 1)) (GENERIC . (type_declaration . 1)) (GOTO . (type_declaration . 1)) (IF . (type_declaration . 1)) (LIMITED . (type_declaration . 1)) (LOOP . (type_declaration . 1)) (NOT . (type_declaration . 1)) (NULL . (type_declaration . 1)) (OVERRIDING . (type_declaration . 1)) (PACKAGE . (type_declaration . 1)) (PRAGMA . (type_declaration . 1)) (PRIVATE . (type_declaration . 1)) (PROCEDURE . (type_declaration . 1)) (PROTECTED . (type_declaration . 1)) (RAISE . (type_declaration . 1)) (REQUEUE . (type_declaration . 1)) (RETURN . (type_declaration . 1)) (SEPARATE . (type_declaration . 1)) (SELECT . (type_declaration . 1)) (SUBTYPE . (type_declaration . 1)) (TASK . (type_declaration . 1)) (TYPE . (type_declaration . 1)) (USE . (type_declaration . 1)) (WHILE . (type_declaration . 1)) (WITH . (type_declaration . 1)) (LESS_LESS . (type_declaration . 1)) (IDENTIFIER . (type_declaration . 1)) (STRING_LITERAL . (type_declaration . 1)) (CHARACTER_LITERAL . (type_declaration . 1)) (Wisi_EOI . (type_declaration . 1)))
      ((default . error) (ACCEPT . (compound_statement . 2)) (ABORT . (compound_statement . 2)) (BEGIN . (compound_statement . 2)) (CASE . (compound_statement . 2)) (DECLARE . (compound_statement . 2)) (DELAY . (compound_statement . 2)) (ELSE . (compound_statement . 2)) (ELSIF . (compound_statement . 2)) (END . (compound_statement . 2)) (ENTRY . (compound_statement . 2)) (EXCEPTION . (compound_statement . 2)) (EXIT . (compound_statement . 2)) (FOR . (compound_statement . 2)) (FUNCTION . (compound_statement . 2)) (GENERIC . (compound_statement . 2)) (GOTO . (compound_statement . 2)) (IF . (compound_statement . 2)) (LIMITED . (compound_statement . 2)) (LOOP . (compound_statement . 2)) (NOT . (compound_statement . 2)) (NULL . (compound_statement . 2)) (OR . (compound_statement . 2)) (OVERRIDING . (compound_statement . 2)) (PACKAGE . (compound_statement . 2)) (PRAGMA . (compound_statement . 2)) (PRIVATE . (compound_statement . 2)) (PROCEDURE . (compound_statement . 2)) (PROTECTED . (compound_statement . 2)) (RAISE . (compound_statement . 2)) (REQUEUE . (compound_statement . 2)) (RETURN . (compound_statement . 2)) (SEPARATE . (compound_statement . 2)) (SELECT . (compound_statement . 2)) (SUBTYPE . (compound_statement . 2)) (TASK . (compound_statement . 2)) (THEN . (compound_statement . 2)) (TYPE . (compound_statement . 2)) (USE . (compound_statement . 2)) (WHEN . (compound_statement . 2)) (WHILE . (compound_statement . 2)) (WITH . (compound_statement . 2)) (LESS_LESS . (compound_statement . 2)) (IDENTIFIER . (compound_statement . 2)) (STRING_LITERAL . (compound_statement . 2)) (CHARACTER_LITERAL . (compound_statement . 2)) (Wisi_EOI . (compound_statement . 2)))
      ((default . error) (LEFT_PAREN .  235) (COLON_EQUAL .  236) (DOT .  237) (SEMICOLON .  238) (TICK_1 .  239))
      ((default . error) (ACCEPT . (declaration . 8)) (ABORT . (declaration . 8)) (BEGIN . (declaration . 8)) (CASE . (declaration . 8)) (DECLARE . (declaration . 8)) (DELAY . (declaration . 8)) (END . (declaration . 8)) (ENTRY . (declaration . 8)) (EXIT . (declaration . 8)) (FOR . (declaration . 8)) (FUNCTION . (declaration . 8)) (GENERIC . (declaration . 8)) (GOTO . (declaration . 8)) (IF . (declaration . 8)) (LIMITED . (declaration . 8)) (LOOP . (declaration . 8)) (NOT . (declaration . 8)) (NULL . (declaration . 8)) (OVERRIDING . (declaration . 8)) (PACKAGE . (declaration . 8)) (PRAGMA . (declaration . 8)) (PRIVATE . (declaration . 8)) (PROCEDURE . (declaration . 8)) (PROTECTED . (declaration . 8)) (RAISE . (declaration . 8)) (REQUEUE . (declaration . 8)) (RETURN . (declaration . 8)) (SEPARATE . (declaration . 8)) (SELECT . (declaration . 8)) (SUBTYPE . (declaration . 8)) (TASK . (declaration . 8)) (TYPE . (declaration . 8)) (USE . (declaration . 8)) (WHILE . (declaration . 8)) (WITH . (declaration . 8)) (LESS_LESS . (declaration . 8)) (IDENTIFIER . (declaration . 8)) (STRING_LITERAL . (declaration . 8)) (CHARACTER_LITERAL . (declaration . 8)) (Wisi_EOI . (declaration . 8)))
      ((default . error) (ACCEPT . (declaration . 10)) (ABORT . (declaration . 10)) (BEGIN . (declaration . 10)) (CASE . (declaration . 10)) (DECLARE . (declaration . 10)) (DELAY . (declaration . 10)) (END . (declaration . 10)) (ENTRY . (declaration . 10)) (EXIT . (declaration . 10)) (FOR . (declaration . 10)) (FUNCTION . (declaration . 10)) (GENERIC . (declaration . 10)) (GOTO . (declaration . 10)) (IF . (declaration . 10)) (LIMITED . (declaration . 10)) (LOOP . (declaration . 10)) (NOT . (declaration . 10)) (NULL . (declaration . 10)) (OVERRIDING . (declaration . 10)) (PACKAGE . (declaration . 10)) (PRAGMA . (declaration . 10)) (PRIVATE . (declaration . 10)) (PROCEDURE . (declaration . 10)) (PROTECTED . (declaration . 10)) (RAISE . (declaration . 10)) (REQUEUE . (declaration . 10)) (RETURN . (declaration . 10)) (SEPARATE . (declaration . 10)) (SELECT . (declaration . 10)) (SUBTYPE . (declaration . 10)) (TASK . (declaration . 10)) (TYPE . (declaration . 10)) (USE . (declaration . 10)) (WHILE . (declaration . 10)) (WITH . (declaration . 10)) (LESS_LESS . (declaration . 10)) (IDENTIFIER . (declaration . 10)) (STRING_LITERAL . (declaration . 10)) (CHARACTER_LITERAL . (declaration . 10)) (Wisi_EOI . (declaration . 10)))
      ((default . error) (ACCEPT . (renaming_declaration . 0)) (ABORT . (renaming_declaration . 0)) (BEGIN . (renaming_declaration . 0)) (CASE . (renaming_declaration . 0)) (DECLARE . (renaming_declaration . 0)) (DELAY . (renaming_declaration . 0)) (END . (renaming_declaration . 0)) (ENTRY . (renaming_declaration . 0)) (EXIT . (renaming_declaration . 0)) (FOR . (renaming_declaration . 0)) (FUNCTION . (renaming_declaration . 0)) (GENERIC . (renaming_declaration . 0)) (GOTO . (renaming_declaration . 0)) (IF . (renaming_declaration . 0)) (LIMITED . (renaming_declaration . 0)) (LOOP . (renaming_declaration . 0)) (NOT . (renaming_declaration . 0)) (NULL . (renaming_declaration . 0)) (OVERRIDING . (renaming_declaration . 0)) (PACKAGE . (renaming_declaration . 0)) (PRAGMA . (renaming_declaration . 0)) (PRIVATE . (renaming_declaration . 0)) (PROCEDURE . (renaming_declaration . 0)) (PROTECTED . (renaming_declaration . 0)) (RAISE . (renaming_declaration . 0)) (REQUEUE . (renaming_declaration . 0)) (RETURN . (renaming_declaration . 0)) (SEPARATE . (renaming_declaration . 0)) (SELECT . (renaming_declaration . 0)) (SUBTYPE . (renaming_declaration . 0)) (TASK . (renaming_declaration . 0)) (TYPE . (renaming_declaration . 0)) (USE . (renaming_declaration . 0)) (WHILE . (renaming_declaration . 0)) (WITH . (renaming_declaration . 0)) (LESS_LESS . (renaming_declaration . 0)) (IDENTIFIER . (renaming_declaration . 0)) (STRING_LITERAL . (renaming_declaration . 0)) (CHARACTER_LITERAL . (renaming_declaration . 0)) (Wisi_EOI . (renaming_declaration . 0)))
      ((default . error) (ENTRY .  242) (FUNCTION .  243) (PROCEDURE .  244))
      ((default . error) (ACCEPT . (proper_body . 1)) (ABORT . (proper_body . 1)) (BEGIN . (proper_body . 1)) (CASE . (proper_body . 1)) (DECLARE . (proper_body . 1)) (DELAY . (proper_body . 1)) (END . (proper_body . 1)) (ENTRY . (proper_body . 1)) (EXIT . (proper_body . 1)) (FOR . (proper_body . 1)) (FUNCTION . (proper_body . 1)) (GENERIC . (proper_body . 1)) (GOTO . (proper_body . 1)) (IF . (proper_body . 1)) (LIMITED . (proper_body . 1)) (LOOP . (proper_body . 1)) (NOT . (proper_body . 1)) (NULL . (proper_body . 1)) (OVERRIDING . (proper_body . 1)) (PACKAGE . (proper_body . 1)) (PRAGMA . (proper_body . 1)) (PRIVATE . (proper_body . 1)) (PROCEDURE . (proper_body . 1)) (PROTECTED . (proper_body . 1)) (RAISE . (proper_body . 1)) (REQUEUE . (proper_body . 1)) (RETURN . (proper_body . 1)) (SEPARATE . (proper_body . 1)) (SELECT . (proper_body . 1)) (SUBTYPE . (proper_body . 1)) (TASK . (proper_body . 1)) (TYPE . (proper_body . 1)) (USE . (proper_body . 1)) (WHILE . (proper_body . 1)) (WITH . (proper_body . 1)) (LESS_LESS . (proper_body . 1)) (IDENTIFIER . (proper_body . 1)) (STRING_LITERAL . (proper_body . 1)) (CHARACTER_LITERAL . (proper_body . 1)) (Wisi_EOI . (proper_body . 1)))
      ((default . error) (ACCEPT . (body_stub . 1)) (ABORT . (body_stub . 1)) (BEGIN . (body_stub . 1)) (CASE . (body_stub . 1)) (DECLARE . (body_stub . 1)) (DELAY . (body_stub . 1)) (END . (body_stub . 1)) (ENTRY . (body_stub . 1)) (EXIT . (body_stub . 1)) (FOR . (body_stub . 1)) (FUNCTION . (body_stub . 1)) (GENERIC . (body_stub . 1)) (GOTO . (body_stub . 1)) (IF . (body_stub . 1)) (LIMITED . (body_stub . 1)) (LOOP . (body_stub . 1)) (NOT . (body_stub . 1)) (NULL . (body_stub . 1)) (OVERRIDING . (body_stub . 1)) (PACKAGE . (body_stub . 1)) (PRAGMA . (body_stub . 1)) (PRIVATE . (body_stub . 1)) (PROCEDURE . (body_stub . 1)) (PROTECTED . (body_stub . 1)) (RAISE . (body_stub . 1)) (REQUEUE . (body_stub . 1)) (RETURN . (body_stub . 1)) (SEPARATE . (body_stub . 1)) (SELECT . (body_stub . 1)) (SUBTYPE . (body_stub . 1)) (TASK . (body_stub . 1)) (TYPE . (body_stub . 1)) (USE . (body_stub . 1)) (WHILE . (body_stub . 1)) (WITH . (body_stub . 1)) (LESS_LESS . (body_stub . 1)) (IDENTIFIER . (body_stub . 1)) (STRING_LITERAL . (body_stub . 1)) (CHARACTER_LITERAL . (body_stub . 1)) (Wisi_EOI . (body_stub . 1)))
      ((default . error) (ACCEPT . (declaration . 11)) (ABORT . (declaration . 11)) (BEGIN . (declaration . 11)) (CASE . (declaration . 11)) (DECLARE . (declaration . 11)) (DELAY . (declaration . 11)) (END . (declaration . 11)) (ENTRY . (declaration . 11)) (EXIT . (declaration . 11)) (FOR . (declaration . 11)) (FUNCTION . (declaration . 11)) (GENERIC . (declaration . 11)) (GOTO . (declaration . 11)) (IF . (declaration . 11)) (LIMITED . (declaration . 11)) (LOOP . (declaration . 11)) (NOT . (declaration . 11)) (NULL . (declaration . 11)) (OVERRIDING . (declaration . 11)) (PACKAGE . (declaration . 11)) (PRAGMA . (declaration . 11)) (PRIVATE . (declaration . 11)) (PROCEDURE . (declaration . 11)) (PROTECTED . (declaration . 11)) (RAISE . (declaration . 11)) (REQUEUE . (declaration . 11)) (RETURN . (declaration . 11)) (SEPARATE . (declaration . 11)) (SELECT . (declaration . 11)) (SUBTYPE . (declaration . 11)) (TASK . (declaration . 11)) (TYPE . (declaration . 11)) (USE . (declaration . 11)) (WHILE . (declaration . 11)) (WITH . (declaration . 11)) (LESS_LESS . (declaration . 11)) (IDENTIFIER . (declaration . 11)) (STRING_LITERAL . (declaration . 11)) (CHARACTER_LITERAL . (declaration . 11)) (Wisi_EOI . (declaration . 11)))
      ((default . error) (ACCEPT . (renaming_declaration . 1)) (ABORT . (renaming_declaration . 1)) (BEGIN . (renaming_declaration . 1)) (CASE . (renaming_declaration . 1)) (DECLARE . (renaming_declaration . 1)) (DELAY . (renaming_declaration . 1)) (END . (renaming_declaration . 1)) (ENTRY . (renaming_declaration . 1)) (EXIT . (renaming_declaration . 1)) (FOR . (renaming_declaration . 1)) (FUNCTION . (renaming_declaration . 1)) (GENERIC . (renaming_declaration . 1)) (GOTO . (renaming_declaration . 1)) (IF . (renaming_declaration . 1)) (LIMITED . (renaming_declaration . 1)) (LOOP . (renaming_declaration . 1)) (NOT . (renaming_declaration . 1)) (NULL . (renaming_declaration . 1)) (OVERRIDING . (renaming_declaration . 1)) (PACKAGE . (renaming_declaration . 1)) (PRAGMA . (renaming_declaration . 1)) (PRIVATE . (renaming_declaration . 1)) (PROCEDURE . (renaming_declaration . 1)) (PROTECTED . (renaming_declaration . 1)) (RAISE . (renaming_declaration . 1)) (REQUEUE . (renaming_declaration . 1)) (RETURN . (renaming_declaration . 1)) (SEPARATE . (renaming_declaration . 1)) (SELECT . (renaming_declaration . 1)) (SUBTYPE . (renaming_declaration . 1)) (TASK . (renaming_declaration . 1)) (TYPE . (renaming_declaration . 1)) (USE . (renaming_declaration . 1)) (WHILE . (renaming_declaration . 1)) (WITH . (renaming_declaration . 1)) (LESS_LESS . (renaming_declaration . 1)) (IDENTIFIER . (renaming_declaration . 1)) (STRING_LITERAL . (renaming_declaration . 1)) (CHARACTER_LITERAL . (renaming_declaration . 1)) (Wisi_EOI . (renaming_declaration . 1)))
      ((default . error) (SEMICOLON .  248))
      ((default . error) (ACCEPT . (simple_statement . 10)) (ABORT . (simple_statement . 10)) (BEGIN . (simple_statement . 10)) (CASE . (simple_statement . 10)) (DECLARE . (simple_statement . 10)) (DELAY . (simple_statement . 10)) (ELSE . (simple_statement . 10)) (ELSIF . (simple_statement . 10)) (END . (simple_statement . 10)) (ENTRY . (simple_statement . 10)) (EXCEPTION . (simple_statement . 10)) (EXIT . (simple_statement . 10)) (FOR . (simple_statement . 10)) (FUNCTION . (simple_statement . 10)) (GENERIC . (simple_statement . 10)) (GOTO . (simple_statement . 10)) (IF . (simple_statement . 10)) (LIMITED . (simple_statement . 10)) (LOOP . (simple_statement . 10)) (NOT . (simple_statement . 10)) (NULL . (simple_statement . 10)) (OR . (simple_statement . 10)) (OVERRIDING . (simple_statement . 10)) (PACKAGE . (simple_statement . 10)) (PRAGMA . (simple_statement . 10)) (PRIVATE . (simple_statement . 10)) (PROCEDURE . (simple_statement . 10)) (PROTECTED . (simple_statement . 10)) (RAISE . (simple_statement . 10)) (REQUEUE . (simple_statement . 10)) (RETURN . (simple_statement . 10)) (SEPARATE . (simple_statement . 10)) (SELECT . (simple_statement . 10)) (SUBTYPE . (simple_statement . 10)) (TASK . (simple_statement . 10)) (THEN . (simple_statement . 10)) (TYPE . (simple_statement . 10)) (USE . (simple_statement . 10)) (WHEN . (simple_statement . 10)) (WHILE . (simple_statement . 10)) (WITH . (simple_statement . 10)) (LESS_LESS . (simple_statement . 10)) (IDENTIFIER . (simple_statement . 10)) (STRING_LITERAL . (simple_statement . 10)) (CHARACTER_LITERAL . (simple_statement . 10)) (Wisi_EOI . (simple_statement . 10)))
      ((default . error) (ACCEPT . (type_declaration . 3)) (ABORT . (type_declaration . 3)) (BEGIN . (type_declaration . 3)) (CASE . (type_declaration . 3)) (DECLARE . (type_declaration . 3)) (DELAY . (type_declaration . 3)) (END . (type_declaration . 3)) (ENTRY . (type_declaration . 3)) (EXIT . (type_declaration . 3)) (FOR . (type_declaration . 3)) (FUNCTION . (type_declaration . 3)) (GENERIC . (type_declaration . 3)) (GOTO . (type_declaration . 3)) (IF . (type_declaration . 3)) (LIMITED . (type_declaration . 3)) (LOOP . (type_declaration . 3)) (NOT . (type_declaration . 3)) (NULL . (type_declaration . 3)) (OVERRIDING . (type_declaration . 3)) (PACKAGE . (type_declaration . 3)) (PRAGMA . (type_declaration . 3)) (PRIVATE . (type_declaration . 3)) (PROCEDURE . (type_declaration . 3)) (PROTECTED . (type_declaration . 3)) (RAISE . (type_declaration . 3)) (REQUEUE . (type_declaration . 3)) (RETURN . (type_declaration . 3)) (SEPARATE . (type_declaration . 3)) (SELECT . (type_declaration . 3)) (SUBTYPE . (type_declaration . 3)) (TASK . (type_declaration . 3)) (TYPE . (type_declaration . 3)) (USE . (type_declaration . 3)) (WHILE . (type_declaration . 3)) (WITH . (type_declaration . 3)) (LESS_LESS . (type_declaration . 3)) (IDENTIFIER . (type_declaration . 3)) (STRING_LITERAL . (type_declaration . 3)) (CHARACTER_LITERAL . (type_declaration . 3)) (Wisi_EOI . (type_declaration . 3)))
      ((default . error) (ACCEPT . (type_declaration . 2)) (ABORT . (type_declaration . 2)) (BEGIN . (type_declaration . 2)) (CASE . (type_declaration . 2)) (DECLARE . (type_declaration . 2)) (DELAY . (type_declaration . 2)) (END . (type_declaration . 2)) (ENTRY . (type_declaration . 2)) (EXIT . (type_declaration . 2)) (FOR . (type_declaration . 2)) (FUNCTION . (type_declaration . 2)) (GENERIC . (type_declaration . 2)) (GOTO . (type_declaration . 2)) (IF . (type_declaration . 2)) (LIMITED . (type_declaration . 2)) (LOOP . (type_declaration . 2)) (NOT . (type_declaration . 2)) (NULL . (type_declaration . 2)) (OVERRIDING . (type_declaration . 2)) (PACKAGE . (type_declaration . 2)) (PRAGMA . (type_declaration . 2)) (PRIVATE . (type_declaration . 2)) (PROCEDURE . (type_declaration . 2)) (PROTECTED . (type_declaration . 2)) (RAISE . (type_declaration . 2)) (REQUEUE . (type_declaration . 2)) (RETURN . (type_declaration . 2)) (SEPARATE . (type_declaration . 2)) (SELECT . (type_declaration . 2)) (SUBTYPE . (type_declaration . 2)) (TASK . (type_declaration . 2)) (TYPE . (type_declaration . 2)) (USE . (type_declaration . 2)) (WHILE . (type_declaration . 2)) (WITH . (type_declaration . 2)) (LESS_LESS . (type_declaration . 2)) (IDENTIFIER . (type_declaration . 2)) (STRING_LITERAL . (type_declaration . 2)) (CHARACTER_LITERAL . (type_declaration . 2)) (Wisi_EOI . (type_declaration . 2)))
      ((default . error) (ACCEPT . (simple_statement . 4)) (ABORT . (simple_statement . 4)) (BEGIN . (simple_statement . 4)) (CASE . (simple_statement . 4)) (DECLARE . (simple_statement . 4)) (DELAY . (simple_statement . 4)) (ELSE . (simple_statement . 4)) (ELSIF . (simple_statement . 4)) (END . (simple_statement . 4)) (ENTRY . (simple_statement . 4)) (EXCEPTION . (simple_statement . 4)) (EXIT . (simple_statement . 4)) (FOR . (simple_statement . 4)) (FUNCTION . (simple_statement . 4)) (GENERIC . (simple_statement . 4)) (GOTO . (simple_statement . 4)) (IF . (simple_statement . 4)) (LIMITED . (simple_statement . 4)) (LOOP . (simple_statement . 4)) (NOT . (simple_statement . 4)) (NULL . (simple_statement . 4)) (OR . (simple_statement . 4)) (OVERRIDING . (simple_statement . 4)) (PACKAGE . (simple_statement . 4)) (PRAGMA . (simple_statement . 4)) (PRIVATE . (simple_statement . 4)) (PROCEDURE . (simple_statement . 4)) (PROTECTED . (simple_statement . 4)) (RAISE . (simple_statement . 4)) (REQUEUE . (simple_statement . 4)) (RETURN . (simple_statement . 4)) (SEPARATE . (simple_statement . 4)) (SELECT . (simple_statement . 4)) (SUBTYPE . (simple_statement . 4)) (TASK . (simple_statement . 4)) (THEN . (simple_statement . 4)) (TYPE . (simple_statement . 4)) (USE . (simple_statement . 4)) (WHEN . (simple_statement . 4)) (WHILE . (simple_statement . 4)) (WITH . (simple_statement . 4)) (LESS_LESS . (simple_statement . 4)) (IDENTIFIER . (simple_statement . 4)) (STRING_LITERAL . (simple_statement . 4)) (CHARACTER_LITERAL . (simple_statement . 4)) (Wisi_EOI . (simple_statement . 4)))
      ((default . error) (IS . (subprogram_specification . 0)) (WITH . (subprogram_specification . 0)) (SEMICOLON . (subprogram_specification . 0)))
      ((default . error) (ACCEPT . (body_g . 0)) (ABORT . (body_g . 0)) (BEGIN . (body_g . 0)) (CASE . (body_g . 0)) (DECLARE . (body_g . 0)) (DELAY . (body_g . 0)) (END . (body_g . 0)) (ENTRY . (body_g . 0)) (EXIT . (body_g . 0)) (FOR . (body_g . 0)) (FUNCTION . (body_g . 0)) (GENERIC . (body_g . 0)) (GOTO . (body_g . 0)) (IF . (body_g . 0)) (LIMITED . (body_g . 0)) (LOOP . (body_g . 0)) (NOT . (body_g . 0)) (NULL . (body_g . 0)) (OVERRIDING . (body_g . 0)) (PACKAGE . (body_g . 0)) (PRAGMA . (body_g . 0)) (PRIVATE . (body_g . 0)) (PROCEDURE . (body_g . 0)) (PROTECTED . (body_g . 0)) (RAISE . (body_g . 0)) (REQUEUE . (body_g . 0)) (RETURN . (body_g . 0)) (SEPARATE . (body_g . 0)) (SELECT . (body_g . 0)) (SUBTYPE . (body_g . 0)) (TASK . (body_g . 0)) (TYPE . (body_g . 0)) (USE . (body_g . 0)) (WHILE . (body_g . 0)) (WITH . (body_g . 0)) (LESS_LESS . (body_g . 0)) (IDENTIFIER . (body_g . 0)) (STRING_LITERAL . (body_g . 0)) (CHARACTER_LITERAL . (body_g . 0)) (Wisi_EOI . (body_g . 0)))
      ((default . error) (ACCEPT . (proper_body . 3)) (ABORT . (proper_body . 3)) (BEGIN . (proper_body . 3)) (CASE . (proper_body . 3)) (DECLARE . (proper_body . 3)) (DELAY . (proper_body . 3)) (END . (proper_body . 3)) (ENTRY . (proper_body . 3)) (EXIT . (proper_body . 3)) (FOR . (proper_body . 3)) (FUNCTION . (proper_body . 3)) (GENERIC . (proper_body . 3)) (GOTO . (proper_body . 3)) (IF . (proper_body . 3)) (LIMITED . (proper_body . 3)) (LOOP . (proper_body . 3)) (NOT . (proper_body . 3)) (NULL . (proper_body . 3)) (OVERRIDING . (proper_body . 3)) (PACKAGE . (proper_body . 3)) (PRAGMA . (proper_body . 3)) (PRIVATE . (proper_body . 3)) (PROCEDURE . (proper_body . 3)) (PROTECTED . (proper_body . 3)) (RAISE . (proper_body . 3)) (REQUEUE . (proper_body . 3)) (RETURN . (proper_body . 3)) (SEPARATE . (proper_body . 3)) (SELECT . (proper_body . 3)) (SUBTYPE . (proper_body . 3)) (TASK . (proper_body . 3)) (TYPE . (proper_body . 3)) (USE . (proper_body . 3)) (WHILE . (proper_body . 3)) (WITH . (proper_body . 3)) (LESS_LESS . (proper_body . 3)) (IDENTIFIER . (proper_body . 3)) (STRING_LITERAL . (proper_body . 3)) (CHARACTER_LITERAL . (proper_body . 3)) (Wisi_EOI . (proper_body . 3)))
      ((default . error) (ACCEPT . (body_stub . 3)) (ABORT . (body_stub . 3)) (BEGIN . (body_stub . 3)) (CASE . (body_stub . 3)) (DECLARE . (body_stub . 3)) (DELAY . (body_stub . 3)) (END . (body_stub . 3)) (ENTRY . (body_stub . 3)) (EXIT . (body_stub . 3)) (FOR . (body_stub . 3)) (FUNCTION . (body_stub . 3)) (GENERIC . (body_stub . 3)) (GOTO . (body_stub . 3)) (IF . (body_stub . 3)) (LIMITED . (body_stub . 3)) (LOOP . (body_stub . 3)) (NOT . (body_stub . 3)) (NULL . (body_stub . 3)) (OVERRIDING . (body_stub . 3)) (PACKAGE . (body_stub . 3)) (PRAGMA . (body_stub . 3)) (PRIVATE . (body_stub . 3)) (PROCEDURE . (body_stub . 3)) (PROTECTED . (body_stub . 3)) (RAISE . (body_stub . 3)) (REQUEUE . (body_stub . 3)) (RETURN . (body_stub . 3)) (SEPARATE . (body_stub . 3)) (SELECT . (body_stub . 3)) (SUBTYPE . (body_stub . 3)) (TASK . (body_stub . 3)) (TYPE . (body_stub . 3)) (USE . (body_stub . 3)) (WHILE . (body_stub . 3)) (WITH . (body_stub . 3)) (LESS_LESS . (body_stub . 3)) (IDENTIFIER . (body_stub . 3)) (STRING_LITERAL . (body_stub . 3)) (CHARACTER_LITERAL . (body_stub . 3)) (Wisi_EOI . (body_stub . 3)))
      ((default . error) (ACCEPT . (full_type_declaration . 2)) (ABORT . (full_type_declaration . 2)) (BEGIN . (full_type_declaration . 2)) (CASE . (full_type_declaration . 2)) (DECLARE . (full_type_declaration . 2)) (DELAY . (full_type_declaration . 2)) (END . (full_type_declaration . 2)) (ENTRY . (full_type_declaration . 2)) (EXIT . (full_type_declaration . 2)) (FOR . (full_type_declaration . 2)) (FUNCTION . (full_type_declaration . 2)) (GENERIC . (full_type_declaration . 2)) (GOTO . (full_type_declaration . 2)) (IF . (full_type_declaration . 2)) (LIMITED . (full_type_declaration . 2)) (LOOP . (full_type_declaration . 2)) (NOT . (full_type_declaration . 2)) (NULL . (full_type_declaration . 2)) (OVERRIDING . (full_type_declaration . 2)) (PACKAGE . (full_type_declaration . 2)) (PRAGMA . (full_type_declaration . 2)) (PRIVATE . (full_type_declaration . 2)) (PROCEDURE . (full_type_declaration . 2)) (PROTECTED . (full_type_declaration . 2)) (RAISE . (full_type_declaration . 2)) (REQUEUE . (full_type_declaration . 2)) (RETURN . (full_type_declaration . 2)) (SEPARATE . (full_type_declaration . 2)) (SELECT . (full_type_declaration . 2)) (SUBTYPE . (full_type_declaration . 2)) (TASK . (full_type_declaration . 2)) (TYPE . (full_type_declaration . 2)) (USE . (full_type_declaration . 2)) (WHILE . (full_type_declaration . 2)) (WITH . (full_type_declaration . 2)) (LESS_LESS . (full_type_declaration . 2)) (IDENTIFIER . (full_type_declaration . 2)) (STRING_LITERAL . (full_type_declaration . 2)) (CHARACTER_LITERAL . (full_type_declaration . 2)) (Wisi_EOI . (full_type_declaration . 2)))
      ((default . error) (ACCEPT . (name . 4)) (ABORT . (name . 4)) (AND . (name . 4)) (BEGIN . (name . 4)) (CASE . (name . 4)) (DECLARE . (name . 4)) (DELAY . (name . 4)) (DIGITS . (name . 4)) (DO . (name . 4)) (ELSE . (name . 4)) (ELSIF . (name . 4)) (EXIT . (name . 4)) (FOR . (name . 4)) (GOTO . (name . 4)) (IF . (name . 4)) (IN . (name . 4)) (IS . (name . 4)) (LOOP . (name . 4)) (MOD . (name . 4)) (NOT . (name . 4)) (NULL . (name . 4)) (OF . (name . 4)) (OR . (name . 4)) (PRAGMA . (name . 4)) (RAISE . (name . 4)) (RANGE . (name . 4)) (REM . (name . 4)) (RENAMES . (name . 4)) (REQUEUE . (name . 4)) (RETURN . (name . 4)) (SELECT . (name . 4)) (THEN . (name . 4)) (USE . (name . 4)) (WHILE . (name . 4)) (WITH . (name . 4)) (XOR . (name . 4)) (LEFT_PAREN . (name . 4)) (RIGHT_PAREN . (name . 4)) (AMPERSAND . (name . 4)) (BAR . (name . 4)) (COLON_EQUAL . (name . 4)) (COMMA . (name . 4)) (DOT . (name . 4)) (DOT_DOT . (name . 4)) (EQUAL . (name . 4)) (EQUAL_GREATER . (name . 4)) (GREATER . (name . 4)) (GREATER_EQUAL . (name . 4)) (LESS . (name . 4)) (LESS_EQUAL . (name . 4)) (LESS_LESS . (name . 4)) (MINUS . (name . 4)) (PLUS . (name . 4)) (SEMICOLON . (name . 4)) (SLASH . (name . 4)) (SLASH_EQUAL . (name . 4)) (STAR . (name . 4)) (STAR_STAR . (name . 4)) (TICK_1 . (name . 4)) (IDENTIFIER . (name . 4)) (STRING_LITERAL . (name . 4)) (CHARACTER_LITERAL . (name . 4)))
      ((default . error) (ACCEPT . (simple_statement . 9)) (ABORT . (simple_statement . 9)) (BEGIN . (simple_statement . 9)) (CASE . (simple_statement . 9)) (DECLARE . (simple_statement . 9)) (DELAY . (simple_statement . 9)) (ELSE . (simple_statement . 9)) (ELSIF . (simple_statement . 9)) (END . (simple_statement . 9)) (ENTRY . (simple_statement . 9)) (EXCEPTION . (simple_statement . 9)) (EXIT . (simple_statement . 9)) (FOR . (simple_statement . 9)) (FUNCTION . (simple_statement . 9)) (GENERIC . (simple_statement . 9)) (GOTO . (simple_statement . 9)) (IF . (simple_statement . 9)) (LIMITED . (simple_statement . 9)) (LOOP . (simple_statement . 9)) (NOT . (simple_statement . 9)) (NULL . (simple_statement . 9)) (OR . (simple_statement . 9)) (OVERRIDING . (simple_statement . 9)) (PACKAGE . (simple_statement . 9)) (PRAGMA . (simple_statement . 9)) (PRIVATE . (simple_statement . 9)) (PROCEDURE . (simple_statement . 9)) (PROTECTED . (simple_statement . 9)) (RAISE . (simple_statement . 9)) (REQUEUE . (simple_statement . 9)) (RETURN . (simple_statement . 9)) (SEPARATE . (simple_statement . 9)) (SELECT . (simple_statement . 9)) (SUBTYPE . (simple_statement . 9)) (TASK . (simple_statement . 9)) (THEN . (simple_statement . 9)) (TYPE . (simple_statement . 9)) (USE . (simple_statement . 9)) (WHEN . (simple_statement . 9)) (WHILE . (simple_statement . 9)) (WITH . (simple_statement . 9)) (LESS_LESS . (simple_statement . 9)) (IDENTIFIER . (simple_statement . 9)) (STRING_LITERAL . (simple_statement . 9)) (CHARACTER_LITERAL . (simple_statement . 9)) (Wisi_EOI . (simple_statement . 9)))
      ((default . error) (ACCEPT . (aspect_clause . 2)) (ABORT . (aspect_clause . 2)) (BEGIN . (aspect_clause . 2)) (CASE . (aspect_clause . 2)) (DECLARE . (aspect_clause . 2)) (DELAY . (aspect_clause . 2)) (END . (aspect_clause . 2)) (ENTRY . (aspect_clause . 2)) (EXIT . (aspect_clause . 2)) (FOR . (aspect_clause . 2)) (FUNCTION . (aspect_clause . 2)) (GENERIC . (aspect_clause . 2)) (GOTO . (aspect_clause . 2)) (IF . (aspect_clause . 2)) (LIMITED . (aspect_clause . 2)) (LOOP . (aspect_clause . 2)) (NOT . (aspect_clause . 2)) (NULL . (aspect_clause . 2)) (OVERRIDING . (aspect_clause . 2)) (PACKAGE . (aspect_clause . 2)) (PRAGMA . (aspect_clause . 2)) (PRIVATE . (aspect_clause . 2)) (PROCEDURE . (aspect_clause . 2)) (PROTECTED . (aspect_clause . 2)) (RAISE . (aspect_clause . 2)) (REQUEUE . (aspect_clause . 2)) (RETURN . (aspect_clause . 2)) (SEPARATE . (aspect_clause . 2)) (SELECT . (aspect_clause . 2)) (SUBTYPE . (aspect_clause . 2)) (TASK . (aspect_clause . 2)) (TYPE . (aspect_clause . 2)) (USE . (aspect_clause . 2)) (WHEN . (aspect_clause . 2)) (WHILE . (aspect_clause . 2)) (WITH . (aspect_clause . 2)) (LESS_LESS . (aspect_clause . 2)) (IDENTIFIER . (aspect_clause . 2)) (STRING_LITERAL . (aspect_clause . 2)) (CHARACTER_LITERAL . (aspect_clause . 2)) (Wisi_EOI . (aspect_clause . 2)))
      ((default . error) (ACCEPT . (declaration . 12)) (ABORT . (declaration . 12)) (BEGIN . (declaration . 12)) (CASE . (declaration . 12)) (DECLARE . (declaration . 12)) (DELAY . (declaration . 12)) (END . (declaration . 12)) (ENTRY . (declaration . 12)) (EXIT . (declaration . 12)) (FOR . (declaration . 12)) (FUNCTION . (declaration . 12)) (GENERIC . (declaration . 12)) (GOTO . (declaration . 12)) (IF . (declaration . 12)) (LIMITED . (declaration . 12)) (LOOP . (declaration . 12)) (NOT . (declaration . 12)) (NULL . (declaration . 12)) (OVERRIDING . (declaration . 12)) (PACKAGE . (declaration . 12)) (PRAGMA . (declaration . 12)) (PRIVATE . (declaration . 12)) (PROCEDURE . (declaration . 12)) (PROTECTED . (declaration . 12)) (RAISE . (declaration . 12)) (REQUEUE . (declaration . 12)) (RETURN . (declaration . 12)) (SEPARATE . (declaration . 12)) (SELECT . (declaration . 12)) (SUBTYPE . (declaration . 12)) (TASK . (declaration . 12)) (TYPE . (declaration . 12)) (USE . (declaration . 12)) (WHILE . (declaration . 12)) (WITH . (declaration . 12)) (LESS_LESS . (declaration . 12)) (IDENTIFIER . (declaration . 12)) (STRING_LITERAL . (declaration . 12)) (CHARACTER_LITERAL . (declaration . 12)) (Wisi_EOI . (declaration . 12)))
      ((default . error) (ACCEPT . (simple_statement . 6)) (ABORT . (simple_statement . 6)) (BEGIN . (simple_statement . 6)) (CASE . (simple_statement . 6)) (DECLARE . (simple_statement . 6)) (DELAY . (simple_statement . 6)) (ELSE . (simple_statement . 6)) (ELSIF . (simple_statement . 6)) (END . (simple_statement . 6)) (ENTRY . (simple_statement . 6)) (EXCEPTION . (simple_statement . 6)) (EXIT . (simple_statement . 6)) (FOR . (simple_statement . 6)) (FUNCTION . (simple_statement . 6)) (GENERIC . (simple_statement . 6)) (GOTO . (simple_statement . 6)) (IF . (simple_statement . 6)) (LIMITED . (simple_statement . 6)) (LOOP . (simple_statement . 6)) (NOT . (simple_statement . 6)) (NULL . (simple_statement . 6)) (OR . (simple_statement . 6)) (OVERRIDING . (simple_statement . 6)) (PACKAGE . (simple_statement . 6)) (PRAGMA . (simple_statement . 6)) (PRIVATE . (simple_statement . 6)) (PROCEDURE . (simple_statement . 6)) (PROTECTED . (simple_statement . 6)) (RAISE . (simple_statement . 6)) (REQUEUE . (simple_statement . 6)) (RETURN . (simple_statement . 6)) (SEPARATE . (simple_statement . 6)) (SELECT . (simple_statement . 6)) (SUBTYPE . (simple_statement . 6)) (TASK . (simple_statement . 6)) (THEN . (simple_statement . 6)) (TYPE . (simple_statement . 6)) (USE . (simple_statement . 6)) (WHEN . (simple_statement . 6)) (WHILE . (simple_statement . 6)) (WITH . (simple_statement . 6)) (LESS_LESS . (simple_statement . 6)) (IDENTIFIER . (simple_statement . 6)) (STRING_LITERAL . (simple_statement . 6)) (CHARACTER_LITERAL . (simple_statement . 6)) (Wisi_EOI . (simple_statement . 6)))
      ((default . error) (ACCEPT . (name . 2)) (ABORT . (name . 2)) (AND . (name . 2)) (BEGIN . (name . 2)) (CASE . (name . 2)) (DECLARE . (name . 2)) (DELAY . (name . 2)) (DIGITS . (name . 2)) (DO . (name . 2)) (ELSE . (name . 2)) (ELSIF . (name . 2)) (EXIT . (name . 2)) (FOR . (name . 2)) (GOTO . (name . 2)) (IF . (name . 2)) (IN . (name . 2)) (IS . (name . 2)) (LOOP . (name . 2)) (MOD . (name . 2)) (NOT . (name . 2)) (NULL . (name . 2)) (OF . (name . 2)) (OR . (name . 2)) (PRAGMA . (name . 2)) (RAISE . (name . 2)) (RANGE . (name . 2)) (REM . (name . 2)) (RENAMES . (name . 2)) (REQUEUE . (name . 2)) (RETURN . (name . 2)) (SELECT . (name . 2)) (THEN . (name . 2)) (USE . (name . 2)) (WHILE . (name . 2)) (WITH . (name . 2)) (XOR . (name . 2)) (LEFT_PAREN . (name . 2)) (RIGHT_PAREN . (name . 2)) (AMPERSAND . (name . 2)) (BAR . (name . 2)) (COLON_EQUAL . (name . 2)) (COMMA . (name . 2)) (DOT . (name . 2)) (DOT_DOT . (name . 2)) (EQUAL . (name . 2)) (EQUAL_GREATER . (name . 2)) (GREATER . (name . 2)) (GREATER_EQUAL . (name . 2)) (LESS . (name . 2)) (LESS_EQUAL . (name . 2)) (LESS_LESS . (name . 2)) (MINUS . (name . 2)) (PLUS . (name . 2)) (SEMICOLON . (name . 2)) (SLASH . (name . 2)) (SLASH_EQUAL . (name . 2)) (STAR . (name . 2)) (STAR_STAR . (name . 2)) (TICK_1 . (name . 2)) (IDENTIFIER . (name . 2)) (STRING_LITERAL . (name . 2)) (CHARACTER_LITERAL . (name . 2)))
      ((default . error) (ACCEPT . (select_statement . 0)) (ABORT . (select_statement . 0)) (BEGIN . (select_statement . 0)) (CASE . (select_statement . 0)) (DECLARE . (select_statement . 0)) (DELAY . (select_statement . 0)) (ELSE . (select_statement . 0)) (ELSIF . (select_statement . 0)) (END . (select_statement . 0)) (ENTRY . (select_statement . 0)) (EXCEPTION . (select_statement . 0)) (EXIT . (select_statement . 0)) (FOR . (select_statement . 0)) (FUNCTION . (select_statement . 0)) (GENERIC . (select_statement . 0)) (GOTO . (select_statement . 0)) (IF . (select_statement . 0)) (LIMITED . (select_statement . 0)) (LOOP . (select_statement . 0)) (NOT . (select_statement . 0)) (NULL . (select_statement . 0)) (OR . (select_statement . 0)) (OVERRIDING . (select_statement . 0)) (PACKAGE . (select_statement . 0)) (PRAGMA . (select_statement . 0)) (PRIVATE . (select_statement . 0)) (PROCEDURE . (select_statement . 0)) (PROTECTED . (select_statement . 0)) (RAISE . (select_statement . 0)) (REQUEUE . (select_statement . 0)) (RETURN . (select_statement . 0)) (SEPARATE . (select_statement . 0)) (SELECT . (select_statement . 0)) (SUBTYPE . (select_statement . 0)) (TASK . (select_statement . 0)) (THEN . (select_statement . 0)) (TYPE . (select_statement . 0)) (USE . (select_statement . 0)) (WHEN . (select_statement . 0)) (WHILE . (select_statement . 0)) (WITH . (select_statement . 0)) (LESS_LESS . (select_statement . 0)) (IDENTIFIER . (select_statement . 0)) (STRING_LITERAL . (select_statement . 0)) (CHARACTER_LITERAL . (select_statement . 0)) (Wisi_EOI . (select_statement . 0)))
      ((default . error) (ACCEPT . (compound_statement . 6)) (ABORT . (compound_statement . 6)) (BEGIN . (compound_statement . 6)) (CASE . (compound_statement . 6)) (DECLARE . (compound_statement . 6)) (DELAY . (compound_statement . 6)) (ELSE . (compound_statement . 6)) (ELSIF . (compound_statement . 6)) (END . (compound_statement . 6)) (ENTRY . (compound_statement . 6)) (EXCEPTION . (compound_statement . 6)) (EXIT . (compound_statement . 6)) (FOR . (compound_statement . 6)) (FUNCTION . (compound_statement . 6)) (GENERIC . (compound_statement . 6)) (GOTO . (compound_statement . 6)) (IF . (compound_statement . 6)) (LIMITED . (compound_statement . 6)) (LOOP . (compound_statement . 6)) (NOT . (compound_statement . 6)) (NULL . (compound_statement . 6)) (OR . (compound_statement . 6)) (OVERRIDING . (compound_statement . 6)) (PACKAGE . (compound_statement . 6)) (PRAGMA . (compound_statement . 6)) (PRIVATE . (compound_statement . 6)) (PROCEDURE . (compound_statement . 6)) (PROTECTED . (compound_statement . 6)) (RAISE . (compound_statement . 6)) (REQUEUE . (compound_statement . 6)) (RETURN . (compound_statement . 6)) (SEPARATE . (compound_statement . 6)) (SELECT . (compound_statement . 6)) (SUBTYPE . (compound_statement . 6)) (TASK . (compound_statement . 6)) (THEN . (compound_statement . 6)) (TYPE . (compound_statement . 6)) (USE . (compound_statement . 6)) (WHEN . (compound_statement . 6)) (WHILE . (compound_statement . 6)) (WITH . (compound_statement . 6)) (LESS_LESS . (compound_statement . 6)) (IDENTIFIER . (compound_statement . 6)) (STRING_LITERAL . (compound_statement . 6)) (CHARACTER_LITERAL . (compound_statement . 6)) (Wisi_EOI . (compound_statement . 6)))
      ((default . error) (ACCEPT . (simple_statement . 5)) (ABORT . (simple_statement . 5)) (BEGIN . (simple_statement . 5)) (CASE . (simple_statement . 5)) (DECLARE . (simple_statement . 5)) (DELAY . (simple_statement . 5)) (ELSE . (simple_statement . 5)) (ELSIF . (simple_statement . 5)) (END . (simple_statement . 5)) (ENTRY . (simple_statement . 5)) (EXCEPTION . (simple_statement . 5)) (EXIT . (simple_statement . 5)) (FOR . (simple_statement . 5)) (FUNCTION . (simple_statement . 5)) (GENERIC . (simple_statement . 5)) (GOTO . (simple_statement . 5)) (IF . (simple_statement . 5)) (LIMITED . (simple_statement . 5)) (LOOP . (simple_statement . 5)) (NOT . (simple_statement . 5)) (NULL . (simple_statement . 5)) (OR . (simple_statement . 5)) (OVERRIDING . (simple_statement . 5)) (PACKAGE . (simple_statement . 5)) (PRAGMA . (simple_statement . 5)) (PRIVATE . (simple_statement . 5)) (PROCEDURE . (simple_statement . 5)) (PROTECTED . (simple_statement . 5)) (RAISE . (simple_statement . 5)) (REQUEUE . (simple_statement . 5)) (RETURN . (simple_statement . 5)) (SEPARATE . (simple_statement . 5)) (SELECT . (simple_statement . 5)) (SUBTYPE . (simple_statement . 5)) (TASK . (simple_statement . 5)) (THEN . (simple_statement . 5)) (TYPE . (simple_statement . 5)) (USE . (simple_statement . 5)) (WHEN . (simple_statement . 5)) (WHILE . (simple_statement . 5)) (WITH . (simple_statement . 5)) (LESS_LESS . (simple_statement . 5)) (IDENTIFIER . (simple_statement . 5)) (STRING_LITERAL . (simple_statement . 5)) (CHARACTER_LITERAL . (simple_statement . 5)) (Wisi_EOI . (simple_statement . 5)))
      ((default . error) (ACCEPT . (statement . 1)) (ABORT . (statement . 1)) (BEGIN . (statement . 1)) (CASE . (statement . 1)) (DECLARE . (statement . 1)) (DELAY . (statement . 1)) (ELSE . (statement . 1)) (ELSIF . (statement . 1)) (END . (statement . 1)) (ENTRY . (statement . 1)) (EXCEPTION . (statement . 1)) (EXIT . (statement . 1)) (FOR . (statement . 1)) (FUNCTION . (statement . 1)) (GENERIC . (statement . 1)) (GOTO . (statement . 1)) (IF . (statement . 1)) (LIMITED . (statement . 1)) (LOOP . (statement . 1)) (NOT . (statement . 1)) (NULL . (statement . 1)) (OR . (statement . 1)) (OVERRIDING . (statement . 1)) (PACKAGE . (statement . 1)) (PRAGMA . (statement . 1)) (PRIVATE . (statement . 1)) (PROCEDURE . (statement . 1)) (PROTECTED . (statement . 1)) (RAISE . (statement . 1)) (REQUEUE . (statement . 1)) (RETURN . (statement . 1)) (SEPARATE . (statement . 1)) (SELECT . (statement . 1)) (SUBTYPE . (statement . 1)) (TASK . (statement . 1)) (THEN . (statement . 1)) (TYPE . (statement . 1)) (USE . (statement . 1)) (WHEN . (statement . 1)) (WHILE . (statement . 1)) (WITH . (statement . 1)) (LESS_LESS . (statement . 1)) (IDENTIFIER . (statement . 1)) (STRING_LITERAL . (statement . 1)) (CHARACTER_LITERAL . (statement . 1)) (Wisi_EOI . (statement . 1)))
      ((default . error) (ACCEPT . (object_declaration . 7)) (ABORT . (object_declaration . 7)) (BEGIN . (object_declaration . 7)) (CASE . (object_declaration . 7)) (DECLARE . (object_declaration . 7)) (DELAY . (object_declaration . 7)) (END . (object_declaration . 7)) (ENTRY . (object_declaration . 7)) (EXIT . (object_declaration . 7)) (FOR . (object_declaration . 7)) (FUNCTION . (object_declaration . 7)) (GENERIC . (object_declaration . 7)) (GOTO . (object_declaration . 7)) (IF . (object_declaration . 7)) (LIMITED . (object_declaration . 7)) (LOOP . (object_declaration . 7)) (NOT . (object_declaration . 7)) (NULL . (object_declaration . 7)) (OVERRIDING . (object_declaration . 7)) (PACKAGE . (object_declaration . 7)) (PRAGMA . (object_declaration . 7)) (PRIVATE . (object_declaration . 7)) (PROCEDURE . (object_declaration . 7)) (PROTECTED . (object_declaration . 7)) (RAISE . (object_declaration . 7)) (REQUEUE . (object_declaration . 7)) (RETURN . (object_declaration . 7)) (SEPARATE . (object_declaration . 7)) (SELECT . (object_declaration . 7)) (SUBTYPE . (object_declaration . 7)) (TASK . (object_declaration . 7)) (TYPE . (object_declaration . 7)) (USE . (object_declaration . 7)) (WHILE . (object_declaration . 7)) (WITH . (object_declaration . 7)) (LESS_LESS . (object_declaration . 7)) (IDENTIFIER . (object_declaration . 7)) (STRING_LITERAL . (object_declaration . 7)) (CHARACTER_LITERAL . (object_declaration . 7)) (Wisi_EOI . (object_declaration . 7)))
      ((default . error) (ACCEPT . (object_declaration . 6)) (ABORT . (object_declaration . 6)) (BEGIN . (object_declaration . 6)) (CASE . (object_declaration . 6)) (DECLARE . (object_declaration . 6)) (DELAY . (object_declaration . 6)) (END . (object_declaration . 6)) (ENTRY . (object_declaration . 6)) (EXIT . (object_declaration . 6)) (FOR . (object_declaration . 6)) (FUNCTION . (object_declaration . 6)) (GENERIC . (object_declaration . 6)) (GOTO . (object_declaration . 6)) (IF . (object_declaration . 6)) (LIMITED . (object_declaration . 6)) (LOOP . (object_declaration . 6)) (NOT . (object_declaration . 6)) (NULL . (object_declaration . 6)) (OVERRIDING . (object_declaration . 6)) (PACKAGE . (object_declaration . 6)) (PRAGMA . (object_declaration . 6)) (PRIVATE . (object_declaration . 6)) (PROCEDURE . (object_declaration . 6)) (PROTECTED . (object_declaration . 6)) (RAISE . (object_declaration . 6)) (REQUEUE . (object_declaration . 6)) (RETURN . (object_declaration . 6)) (SEPARATE . (object_declaration . 6)) (SELECT . (object_declaration . 6)) (SUBTYPE . (object_declaration . 6)) (TASK . (object_declaration . 6)) (TYPE . (object_declaration . 6)) (USE . (object_declaration . 6)) (WHILE . (object_declaration . 6)) (WITH . (object_declaration . 6)) (LESS_LESS . (object_declaration . 6)) (IDENTIFIER . (object_declaration . 6)) (STRING_LITERAL . (object_declaration . 6)) (CHARACTER_LITERAL . (object_declaration . 6)) (Wisi_EOI . (object_declaration . 6)))
      ((default . error) (ACCEPT . (compilation_unit . 4)) (ABORT . (compilation_unit . 4)) (BEGIN . (compilation_unit . 4)) (CASE . (compilation_unit . 4)) (DECLARE . (compilation_unit . 4)) (DELAY . (compilation_unit . 4)) (ENTRY . (compilation_unit . 4)) (EXIT . (compilation_unit . 4)) (FOR . (compilation_unit . 4)) (FUNCTION . (compilation_unit . 4)) (GENERIC . (compilation_unit . 4)) (GOTO . (compilation_unit . 4)) (IF . (compilation_unit . 4)) (LIMITED . (compilation_unit . 4)) (LOOP . (compilation_unit . 4)) (NOT . (compilation_unit . 4)) (NULL . (compilation_unit . 4)) (OVERRIDING . (compilation_unit . 4)) (PACKAGE . (compilation_unit . 4)) (PRAGMA . (compilation_unit . 4)) (PRIVATE . (compilation_unit . 4)) (PROCEDURE . (compilation_unit . 4)) (PROTECTED . (compilation_unit . 4)) (RAISE . (compilation_unit . 4)) (REQUEUE . (compilation_unit . 4)) (RETURN . (compilation_unit . 4)) (SEPARATE . (compilation_unit . 4)) (SELECT . (compilation_unit . 4)) (SUBTYPE . (compilation_unit . 4)) (TASK . (compilation_unit . 4)) (TYPE . (compilation_unit . 4)) (USE . (compilation_unit . 4)) (WHILE . (compilation_unit . 4)) (WITH . (compilation_unit . 4)) (LESS_LESS . (compilation_unit . 4)) (IDENTIFIER . (compilation_unit . 4)) (STRING_LITERAL . (compilation_unit . 4)) (CHARACTER_LITERAL . (compilation_unit . 4)) (Wisi_EOI . (compilation_unit . 4)))
      ((default . error) (ACCEPT . (proper_body . 0)) (ABORT . (proper_body . 0)) (BEGIN . (proper_body . 0)) (CASE . (proper_body . 0)) (DECLARE . (proper_body . 0)) (DELAY . (proper_body . 0)) (END . (proper_body . 0)) (ENTRY . (proper_body . 0)) (EXIT . (proper_body . 0)) (FOR . (proper_body . 0)) (FUNCTION . (proper_body . 0)) (GENERIC . (proper_body . 0)) (GOTO . (proper_body . 0)) (IF . (proper_body . 0)) (LIMITED . (proper_body . 0)) (LOOP . (proper_body . 0)) (NOT . (proper_body . 0)) (NULL . (proper_body . 0)) (OVERRIDING . (proper_body . 0)) (PACKAGE . (proper_body . 0)) (PRAGMA . (proper_body . 0)) (PRIVATE . (proper_body . 0)) (PROCEDURE . (proper_body . 0)) (PROTECTED . (proper_body . 0)) (RAISE . (proper_body . 0)) (REQUEUE . (proper_body . 0)) (RETURN . (proper_body . 0)) (SEPARATE . (proper_body . 0)) (SELECT . (proper_body . 0)) (SUBTYPE . (proper_body . 0)) (TASK . (proper_body . 0)) (TYPE . (proper_body . 0)) (USE . (proper_body . 0)) (WHILE . (proper_body . 0)) (WITH . (proper_body . 0)) (LESS_LESS . (proper_body . 0)) (IDENTIFIER . (proper_body . 0)) (STRING_LITERAL . (proper_body . 0)) (CHARACTER_LITERAL . (proper_body . 0)) (Wisi_EOI . (proper_body . 0)))
      ((default . error) (ACCEPT . (body_stub . 0)) (ABORT . (body_stub . 0)) (BEGIN . (body_stub . 0)) (CASE . (body_stub . 0)) (DECLARE . (body_stub . 0)) (DELAY . (body_stub . 0)) (END . (body_stub . 0)) (ENTRY . (body_stub . 0)) (EXIT . (body_stub . 0)) (FOR . (body_stub . 0)) (FUNCTION . (body_stub . 0)) (GENERIC . (body_stub . 0)) (GOTO . (body_stub . 0)) (IF . (body_stub . 0)) (LIMITED . (body_stub . 0)) (LOOP . (body_stub . 0)) (NOT . (body_stub . 0)) (NULL . (body_stub . 0)) (OVERRIDING . (body_stub . 0)) (PACKAGE . (body_stub . 0)) (PRAGMA . (body_stub . 0)) (PRIVATE . (body_stub . 0)) (PROCEDURE . (body_stub . 0)) (PROTECTED . (body_stub . 0)) (RAISE . (body_stub . 0)) (REQUEUE . (body_stub . 0)) (RETURN . (body_stub . 0)) (SEPARATE . (body_stub . 0)) (SELECT . (body_stub . 0)) (SUBTYPE . (body_stub . 0)) (TASK . (body_stub . 0)) (TYPE . (body_stub . 0)) (USE . (body_stub . 0)) (WHILE . (body_stub . 0)) (WITH . (body_stub . 0)) (LESS_LESS . (body_stub . 0)) (IDENTIFIER . (body_stub . 0)) (STRING_LITERAL . (body_stub . 0)) (CHARACTER_LITERAL . (body_stub . 0)) (Wisi_EOI . (body_stub . 0)))
      ((default . error) (ACCEPT . (declaration . 13)) (ABORT . (declaration . 13)) (BEGIN . (declaration . 13)) (CASE . (declaration . 13)) (DECLARE . (declaration . 13)) (DELAY . (declaration . 13)) (END . (declaration . 13)) (ENTRY . (declaration . 13)) (EXIT . (declaration . 13)) (FOR . (declaration . 13)) (FUNCTION . (declaration . 13)) (GENERIC . (declaration . 13)) (GOTO . (declaration . 13)) (IF . (declaration . 13)) (LIMITED . (declaration . 13)) (LOOP . (declaration . 13)) (NOT . (declaration . 13)) (NULL . (declaration . 13)) (OVERRIDING . (declaration . 13)) (PACKAGE . (declaration . 13)) (PRAGMA . (declaration . 13)) (PRIVATE . (declaration . 13)) (PROCEDURE . (declaration . 13)) (PROTECTED . (declaration . 13)) (RAISE . (declaration . 13)) (REQUEUE . (declaration . 13)) (RETURN . (declaration . 13)) (SEPARATE . (declaration . 13)) (SELECT . (declaration . 13)) (SUBTYPE . (declaration . 13)) (TASK . (declaration . 13)) (TYPE . (declaration . 13)) (USE . (declaration . 13)) (WHILE . (declaration . 13)) (WITH . (declaration . 13)) (LESS_LESS . (declaration . 13)) (IDENTIFIER . (declaration . 13)) (STRING_LITERAL . (declaration . 13)) (CHARACTER_LITERAL . (declaration . 13)) (Wisi_EOI . (declaration . 13)))
      ((default . error) (ACCEPT . (renaming_declaration . 2)) (ABORT . (renaming_declaration . 2)) (BEGIN . (renaming_declaration . 2)) (CASE . (renaming_declaration . 2)) (DECLARE . (renaming_declaration . 2)) (DELAY . (renaming_declaration . 2)) (END . (renaming_declaration . 2)) (ENTRY . (renaming_declaration . 2)) (EXIT . (renaming_declaration . 2)) (FOR . (renaming_declaration . 2)) (FUNCTION . (renaming_declaration . 2)) (GENERIC . (renaming_declaration . 2)) (GOTO . (renaming_declaration . 2)) (IF . (renaming_declaration . 2)) (LIMITED . (renaming_declaration . 2)) (LOOP . (renaming_declaration . 2)) (NOT . (renaming_declaration . 2)) (NULL . (renaming_declaration . 2)) (OVERRIDING . (renaming_declaration . 2)) (PACKAGE . (renaming_declaration . 2)) (PRAGMA . (renaming_declaration . 2)) (PRIVATE . (renaming_declaration . 2)) (PROCEDURE . (renaming_declaration . 2)) (PROTECTED . (renaming_declaration . 2)) (RAISE . (renaming_declaration . 2)) (REQUEUE . (renaming_declaration . 2)) (RETURN . (renaming_declaration . 2)) (SEPARATE . (renaming_declaration . 2)) (SELECT . (renaming_declaration . 2)) (SUBTYPE . (renaming_declaration . 2)) (TASK . (renaming_declaration . 2)) (TYPE . (renaming_declaration . 2)) (USE . (renaming_declaration . 2)) (WHILE . (renaming_declaration . 2)) (WITH . (renaming_declaration . 2)) (LESS_LESS . (renaming_declaration . 2)) (IDENTIFIER . (renaming_declaration . 2)) (STRING_LITERAL . (renaming_declaration . 2)) (CHARACTER_LITERAL . (renaming_declaration . 2)) (Wisi_EOI . (renaming_declaration . 2)))
      ((default . error) (ACCEPT . (declaration . 14)) (ABORT . (declaration . 14)) (BEGIN . (declaration . 14)) (CASE . (declaration . 14)) (DECLARE . (declaration . 14)) (DELAY . (declaration . 14)) (END . (declaration . 14)) (ENTRY . (declaration . 14)) (EXIT . (declaration . 14)) (FOR . (declaration . 14)) (FUNCTION . (declaration . 14)) (GENERIC . (declaration . 14)) (GOTO . (declaration . 14)) (IF . (declaration . 14)) (LIMITED . (declaration . 14)) (LOOP . (declaration . 14)) (NOT . (declaration . 14)) (NULL . (declaration . 14)) (OVERRIDING . (declaration . 14)) (PACKAGE . (declaration . 14)) (PRAGMA . (declaration . 14)) (PRIVATE . (declaration . 14)) (PROCEDURE . (declaration . 14)) (PROTECTED . (declaration . 14)) (RAISE . (declaration . 14)) (REQUEUE . (declaration . 14)) (RETURN . (declaration . 14)) (SEPARATE . (declaration . 14)) (SELECT . (declaration . 14)) (SUBTYPE . (declaration . 14)) (TASK . (declaration . 14)) (TYPE . (declaration . 14)) (USE . (declaration . 14)) (WHILE . (declaration . 14)) (WITH . (declaration . 14)) (LESS_LESS . (declaration . 14)) (IDENTIFIER . (declaration . 14)) (STRING_LITERAL . (declaration . 14)) (CHARACTER_LITERAL . (declaration . 14)) (Wisi_EOI . (declaration . 14)))
      ((default . error) (ACCEPT . (compilation_unit . 1)) (ABORT . (compilation_unit . 1)) (BEGIN . (compilation_unit . 1)) (CASE . (compilation_unit . 1)) (DECLARE . (compilation_unit . 1)) (DELAY . (compilation_unit . 1)) (ENTRY . (compilation_unit . 1)) (EXIT . (compilation_unit . 1)) (FOR . (compilation_unit . 1)) (FUNCTION . (compilation_unit . 1)) (GENERIC . (compilation_unit . 1)) (GOTO . (compilation_unit . 1)) (IF . (compilation_unit . 1)) (LIMITED . (compilation_unit . 1)) (LOOP . (compilation_unit . 1)) (NOT . (compilation_unit . 1)) (NULL . (compilation_unit . 1)) (OVERRIDING . (compilation_unit . 1)) (PACKAGE . (compilation_unit . 1)) (PRAGMA . (compilation_unit . 1)) (PRIVATE . (compilation_unit . 1)) (PROCEDURE . (compilation_unit . 1)) (PROTECTED . (compilation_unit . 1)) (RAISE . (compilation_unit . 1)) (REQUEUE . (compilation_unit . 1)) (RETURN . (compilation_unit . 1)) (SEPARATE . (compilation_unit . 1)) (SELECT . (compilation_unit . 1)) (SUBTYPE . (compilation_unit . 1)) (TASK . (compilation_unit . 1)) (TYPE . (compilation_unit . 1)) (USE . (compilation_unit . 1)) (WHILE . (compilation_unit . 1)) (WITH . (compilation_unit . 1)) (LESS_LESS . (compilation_unit . 1)) (IDENTIFIER . (compilation_unit . 1)) (STRING_LITERAL . (compilation_unit . 1)) (CHARACTER_LITERAL . (compilation_unit . 1)) (Wisi_EOI . (compilation_unit . 1)))
      ((default . error) (ACCEPT . (proper_body . 2)) (ABORT . (proper_body . 2)) (BEGIN . (proper_body . 2)) (CASE . (proper_body . 2)) (DECLARE . (proper_body . 2)) (DELAY . (proper_body . 2)) (END . (proper_body . 2)) (ENTRY . (proper_body . 2)) (EXIT . (proper_body . 2)) (FOR . (proper_body . 2)) (FUNCTION . (proper_body . 2)) (GENERIC . (proper_body . 2)) (GOTO . (proper_body . 2)) (IF . (proper_body . 2)) (LIMITED . (proper_body . 2)) (LOOP . (proper_body . 2)) (NOT . (proper_body . 2)) (NULL . (proper_body . 2)) (OVERRIDING . (proper_body . 2)) (PACKAGE . (proper_body . 2)) (PRAGMA . (proper_body . 2)) (PRIVATE . (proper_body . 2)) (PROCEDURE . (proper_body . 2)) (PROTECTED . (proper_body . 2)) (RAISE . (proper_body . 2)) (REQUEUE . (proper_body . 2)) (RETURN . (proper_body . 2)) (SEPARATE . (proper_body . 2)) (SELECT . (proper_body . 2)) (SUBTYPE . (proper_body . 2)) (TASK . (proper_body . 2)) (TYPE . (proper_body . 2)) (USE . (proper_body . 2)) (WHILE . (proper_body . 2)) (WITH . (proper_body . 2)) (LESS_LESS . (proper_body . 2)) (IDENTIFIER . (proper_body . 2)) (STRING_LITERAL . (proper_body . 2)) (CHARACTER_LITERAL . (proper_body . 2)) (Wisi_EOI . (proper_body . 2)))
      ((default . error) (ACCEPT . (body_stub . 2)) (ABORT . (body_stub . 2)) (BEGIN . (body_stub . 2)) (CASE . (body_stub . 2)) (DECLARE . (body_stub . 2)) (DELAY . (body_stub . 2)) (END . (body_stub . 2)) (ENTRY . (body_stub . 2)) (EXIT . (body_stub . 2)) (FOR . (body_stub . 2)) (FUNCTION . (body_stub . 2)) (GENERIC . (body_stub . 2)) (GOTO . (body_stub . 2)) (IF . (body_stub . 2)) (LIMITED . (body_stub . 2)) (LOOP . (body_stub . 2)) (NOT . (body_stub . 2)) (NULL . (body_stub . 2)) (OVERRIDING . (body_stub . 2)) (PACKAGE . (body_stub . 2)) (PRAGMA . (body_stub . 2)) (PRIVATE . (body_stub . 2)) (PROCEDURE . (body_stub . 2)) (PROTECTED . (body_stub . 2)) (RAISE . (body_stub . 2)) (REQUEUE . (body_stub . 2)) (RETURN . (body_stub . 2)) (SEPARATE . (body_stub . 2)) (SELECT . (body_stub . 2)) (SUBTYPE . (body_stub . 2)) (TASK . (body_stub . 2)) (TYPE . (body_stub . 2)) (USE . (body_stub . 2)) (WHILE . (body_stub . 2)) (WITH . (body_stub . 2)) (LESS_LESS . (body_stub . 2)) (IDENTIFIER . (body_stub . 2)) (STRING_LITERAL . (body_stub . 2)) (CHARACTER_LITERAL . (body_stub . 2)) (Wisi_EOI . (body_stub . 2)))
      ((default . error) (ACCEPT . (full_type_declaration . 1)) (ABORT . (full_type_declaration . 1)) (BEGIN . (full_type_declaration . 1)) (CASE . (full_type_declaration . 1)) (DECLARE . (full_type_declaration . 1)) (DELAY . (full_type_declaration . 1)) (END . (full_type_declaration . 1)) (ENTRY . (full_type_declaration . 1)) (EXIT . (full_type_declaration . 1)) (FOR . (full_type_declaration . 1)) (FUNCTION . (full_type_declaration . 1)) (GENERIC . (full_type_declaration . 1)) (GOTO . (full_type_declaration . 1)) (IF . (full_type_declaration . 1)) (LIMITED . (full_type_declaration . 1)) (LOOP . (full_type_declaration . 1)) (NOT . (full_type_declaration . 1)) (NULL . (full_type_declaration . 1)) (OVERRIDING . (full_type_declaration . 1)) (PACKAGE . (full_type_declaration . 1)) (PRAGMA . (full_type_declaration . 1)) (PRIVATE . (full_type_declaration . 1)) (PROCEDURE . (full_type_declaration . 1)) (PROTECTED . (full_type_declaration . 1)) (RAISE . (full_type_declaration . 1)) (REQUEUE . (full_type_declaration . 1)) (RETURN . (full_type_declaration . 1)) (SEPARATE . (full_type_declaration . 1)) (SELECT . (full_type_declaration . 1)) (SUBTYPE . (full_type_declaration . 1)) (TASK . (full_type_declaration . 1)) (TYPE . (full_type_declaration . 1)) (USE . (full_type_declaration . 1)) (WHILE . (full_type_declaration . 1)) (WITH . (full_type_declaration . 1)) (LESS_LESS . (full_type_declaration . 1)) (IDENTIFIER . (full_type_declaration . 1)) (STRING_LITERAL . (full_type_declaration . 1)) (CHARACTER_LITERAL . (full_type_declaration . 1)) (Wisi_EOI . (full_type_declaration . 1)))
      ((default . error) (ACCEPT . (select_statement . 1)) (ABORT . (select_statement . 1)) (BEGIN . (select_statement . 1)) (CASE . (select_statement . 1)) (DECLARE . (select_statement . 1)) (DELAY . (select_statement . 1)) (ELSE . (select_statement . 1)) (ELSIF . (select_statement . 1)) (END . (select_statement . 1)) (ENTRY . (select_statement . 1)) (EXCEPTION . (select_statement . 1)) (EXIT . (select_statement . 1)) (FOR . (select_statement . 1)) (FUNCTION . (select_statement . 1)) (GENERIC . (select_statement . 1)) (GOTO . (select_statement . 1)) (IF . (select_statement . 1)) (LIMITED . (select_statement . 1)) (LOOP . (select_statement . 1)) (NOT . (select_statement . 1)) (NULL . (select_statement . 1)) (OR . (select_statement . 1)) (OVERRIDING . (select_statement . 1)) (PACKAGE . (select_statement . 1)) (PRAGMA . (select_statement . 1)) (PRIVATE . (select_statement . 1)) (PROCEDURE . (select_statement . 1)) (PROTECTED . (select_statement . 1)) (RAISE . (select_statement . 1)) (REQUEUE . (select_statement . 1)) (RETURN . (select_statement . 1)) (SEPARATE . (select_statement . 1)) (SELECT . (select_statement . 1)) (SUBTYPE . (select_statement . 1)) (TASK . (select_statement . 1)) (THEN . (select_statement . 1)) (TYPE . (select_statement . 1)) (USE . (select_statement . 1)) (WHEN . (select_statement . 1)) (WHILE . (select_statement . 1)) (WITH . (select_statement . 1)) (LESS_LESS . (select_statement . 1)) (IDENTIFIER . (select_statement . 1)) (STRING_LITERAL . (select_statement . 1)) (CHARACTER_LITERAL . (select_statement . 1)) (Wisi_EOI . (select_statement . 1)))
      ((default . error) (ACCEPT . (declaration . 15)) (ABORT . (declaration . 15)) (BEGIN . (declaration . 15)) (CASE . (declaration . 15)) (DECLARE . (declaration . 15)) (DELAY . (declaration . 15)) (END . (declaration . 15)) (ENTRY . (declaration . 15)) (EXIT . (declaration . 15)) (FOR . (declaration . 15)) (FUNCTION . (declaration . 15)) (GENERIC . (declaration . 15)) (GOTO . (declaration . 15)) (IF . (declaration . 15)) (LIMITED . (declaration . 15)) (LOOP . (declaration . 15)) (NOT . (declaration . 15)) (NULL . (declaration . 15)) (OVERRIDING . (declaration . 15)) (PACKAGE . (declaration . 15)) (PRAGMA . (declaration . 15)) (PRIVATE . (declaration . 15)) (PROCEDURE . (declaration . 15)) (PROTECTED . (declaration . 15)) (RAISE . (declaration . 15)) (REQUEUE . (declaration . 15)) (RETURN . (declaration . 15)) (SEPARATE . (declaration . 15)) (SELECT . (declaration . 15)) (SUBTYPE . (declaration . 15)) (TASK . (declaration . 15)) (TYPE . (declaration . 15)) (USE . (declaration . 15)) (WHILE . (declaration . 15)) (WITH . (declaration . 15)) (LESS_LESS . (declaration . 15)) (IDENTIFIER . (declaration . 15)) (STRING_LITERAL . (declaration . 15)) (CHARACTER_LITERAL . (declaration . 15)) (Wisi_EOI . (declaration . 15)))
      ((default . error) (ACCEPT . (declaration . 16)) (ABORT . (declaration . 16)) (BEGIN . (declaration . 16)) (CASE . (declaration . 16)) (DECLARE . (declaration . 16)) (DELAY . (declaration . 16)) (END . (declaration . 16)) (ENTRY . (declaration . 16)) (EXIT . (declaration . 16)) (FOR . (declaration . 16)) (FUNCTION . (declaration . 16)) (GENERIC . (declaration . 16)) (GOTO . (declaration . 16)) (IF . (declaration . 16)) (LIMITED . (declaration . 16)) (LOOP . (declaration . 16)) (NOT . (declaration . 16)) (NULL . (declaration . 16)) (OVERRIDING . (declaration . 16)) (PACKAGE . (declaration . 16)) (PRAGMA . (declaration . 16)) (PRIVATE . (declaration . 16)) (PROCEDURE . (declaration . 16)) (PROTECTED . (declaration . 16)) (RAISE . (declaration . 16)) (REQUEUE . (declaration . 16)) (RETURN . (declaration . 16)) (SEPARATE . (declaration . 16)) (SELECT . (declaration . 16)) (SUBTYPE . (declaration . 16)) (TASK . (declaration . 16)) (TYPE . (declaration . 16)) (USE . (declaration . 16)) (WHILE . (declaration . 16)) (WITH . (declaration . 16)) (LESS_LESS . (declaration . 16)) (IDENTIFIER . (declaration . 16)) (STRING_LITERAL . (declaration . 16)) (CHARACTER_LITERAL . (declaration . 16)) (Wisi_EOI . (declaration . 16)))
      ((default . error) (ACCEPT . (compilation_unit . 0)) (ABORT . (compilation_unit . 0)) (BEGIN . (compilation_unit . 0)) (CASE . (compilation_unit . 0)) (DECLARE . (compilation_unit . 0)) (DELAY . (compilation_unit . 0)) (ENTRY . (compilation_unit . 0)) (EXIT . (compilation_unit . 0)) (FOR . (compilation_unit . 0)) (FUNCTION . (compilation_unit . 0)) (GENERIC . (compilation_unit . 0)) (GOTO . (compilation_unit . 0)) (IF . (compilation_unit . 0)) (LIMITED . (compilation_unit . 0)) (LOOP . (compilation_unit . 0)) (NOT . (compilation_unit . 0)) (NULL . (compilation_unit . 0)) (OVERRIDING . (compilation_unit . 0)) (PACKAGE . (compilation_unit . 0)) (PRAGMA . (compilation_unit . 0)) (PRIVATE . (compilation_unit . 0)) (PROCEDURE . (compilation_unit . 0)) (PROTECTED . (compilation_unit . 0)) (RAISE . (compilation_unit . 0)) (REQUEUE . (compilation_unit . 0)) (RETURN . (compilation_unit . 0)) (SEPARATE . (compilation_unit . 0)) (SELECT . (compilation_unit . 0)) (SUBTYPE . (compilation_unit . 0)) (TASK . (compilation_unit . 0)) (TYPE . (compilation_unit . 0)) (USE . (compilation_unit . 0)) (WHILE . (compilation_unit . 0)) (WITH . (compilation_unit . 0)) (LESS_LESS . (compilation_unit . 0)) (IDENTIFIER . (compilation_unit . 0)) (STRING_LITERAL . (compilation_unit . 0)) (CHARACTER_LITERAL . (compilation_unit . 0)) (Wisi_EOI . (compilation_unit . 0)))
      ((default . error) (DO . (actual_parameter_part_opt . 1)) (LEFT_PAREN . ( 249 (actual_parameter_part_opt . 1))) (SEMICOLON . (actual_parameter_part_opt . 1)))
      ((default . error) (ACCEPT . (name . 5)) (ABORT . (name . 5)) (AND . (name . 5)) (BEGIN . (name . 5)) (CASE . (name . 5)) (DECLARE . (name . 5)) (DELAY . (name . 5)) (DIGITS . (name . 5)) (DO . (name . 5)) (ELSE . (name . 5)) (ELSIF . (name . 5)) (EXIT . (name . 5)) (FOR . (name . 5)) (GOTO . (name . 5)) (IF . (name . 5)) (IN . (name . 5)) (IS . (name . 5)) (LOOP . (name . 5)) (MOD . (name . 5)) (NOT . (name . 5)) (NULL . (name . 5)) (OF . (name . 5)) (OR . (name . 5)) (PRAGMA . (name . 5)) (RAISE . (name . 5)) (RANGE . (name . 5)) (REM . (name . 5)) (RENAMES . (name . 5)) (REQUEUE . (name . 5)) (RETURN . (name . 5)) (SELECT . (name . 5)) (THEN . (name . 5)) (USE . (name . 5)) (WHILE . (name . 5)) (WITH . (name . 5)) (XOR . (name . 5)) (LEFT_PAREN . (name . 5)) (RIGHT_PAREN . (name . 5)) (AMPERSAND . (name . 5)) (BAR . (name . 5)) (COLON_EQUAL . (name . 5)) (COMMA . (name . 5)) (DOT . (name . 5)) (DOT_DOT . (name . 5)) (EQUAL . (name . 5)) (EQUAL_GREATER . (name . 5)) (GREATER . (name . 5)) (GREATER_EQUAL . (name . 5)) (LESS . (name . 5)) (LESS_EQUAL . (name . 5)) (LESS_LESS . (name . 5)) (MINUS . (name . 5)) (PLUS . (name . 5)) (SEMICOLON . (name . 5)) (SLASH . (name . 5)) (SLASH_EQUAL . (name . 5)) (STAR . (name . 5)) (STAR_STAR . (name . 5)) (TICK_1 . (name . 5)) (IDENTIFIER . (name . 5)) (STRING_LITERAL . (name . 5)) (CHARACTER_LITERAL . (name . 5)))
      ((default . error) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON .  252) (TICK_1 .  239))
      ((default . error) (NEW .  122) (NULL .  124) (LEFT_PAREN .  126) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (NEW .  122) (NULL .  124) (LEFT_PAREN .  126) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AND . (primary . 1)) (DIGITS . (primary . 1)) (DO . (primary . 1)) (ELSE . (primary . 1)) (ELSIF . (primary . 1)) (IN . (primary . 1)) (IS . (primary . 1)) (LOOP . (primary . 1)) (MOD . (primary . 1)) (NOT . (primary . 1)) (OF . (primary . 1)) (OR . (primary . 1)) (RANGE . (primary . 1)) (REM . (primary . 1)) (THEN . (primary . 1)) (WITH . (primary . 1)) (XOR . (primary . 1)) (RIGHT_PAREN . (primary . 1)) (AMPERSAND . (primary . 1)) (BAR . (primary . 1)) (COLON_EQUAL . (primary . 1)) (COMMA . (primary . 1)) (DOT_DOT . (primary . 1)) (EQUAL . (primary . 1)) (EQUAL_GREATER . (primary . 1)) (GREATER . (primary . 1)) (GREATER_EQUAL . (primary . 1)) (LESS . (primary . 1)) (LESS_EQUAL . (primary . 1)) (MINUS . (primary . 1)) (PLUS . (primary . 1)) (SEMICOLON . (primary . 1)) (SLASH . (primary . 1)) (SLASH_EQUAL . (primary . 1)) (STAR . (primary . 1)) (STAR_STAR . (primary . 1)))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (CASE .  257) (FOR .  258) (IF .  259) (NEW .  122) (NOT .  260) (NULL .  261) (OTHERS .  262) (RAISE .  125) (WITH . (expression_opt . 1)) (LEFT_PAREN .  126) (RIGHT_PAREN . (association_opt . 5)) (BAR . (discrete_choice_list . 2)) (COMMA . (association_opt . 5)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  263))
      ((default . error) (ABS . (unary_adding_operator . 1)) (NEW . (unary_adding_operator . 1)) (NOT . (unary_adding_operator . 1)) (NULL . (unary_adding_operator . 1)) (LEFT_PAREN . (unary_adding_operator . 1)) (NUMERIC_LITERAL . (unary_adding_operator . 1)) (IDENTIFIER . (unary_adding_operator . 1)) (STRING_LITERAL . (unary_adding_operator . 1)) (CHARACTER_LITERAL . (unary_adding_operator . 1)))
      ((default . error) (ABS . (unary_adding_operator . 0)) (NEW . (unary_adding_operator . 0)) (NOT . (unary_adding_operator . 0)) (NULL . (unary_adding_operator . 0)) (LEFT_PAREN . (unary_adding_operator . 0)) (NUMERIC_LITERAL . (unary_adding_operator . 0)) (IDENTIFIER . (unary_adding_operator . 0)) (STRING_LITERAL . (unary_adding_operator . 0)) (CHARACTER_LITERAL . (unary_adding_operator . 0)))
      ((default . error) (AND . (primary . 0)) (DIGITS . (primary . 0)) (DO . (primary . 0)) (ELSE . (primary . 0)) (ELSIF . (primary . 0)) (IN . (primary . 0)) (IS . (primary . 0)) (LOOP . (primary . 0)) (MOD . (primary . 0)) (NOT . (primary . 0)) (OF . (primary . 0)) (OR . (primary . 0)) (RANGE . (primary . 0)) (REM . (primary . 0)) (THEN . (primary . 0)) (WITH . (primary . 0)) (XOR . (primary . 0)) (RIGHT_PAREN . (primary . 0)) (AMPERSAND . (primary . 0)) (BAR . (primary . 0)) (COLON_EQUAL . (primary . 0)) (COMMA . (primary . 0)) (DOT_DOT . (primary . 0)) (EQUAL . (primary . 0)) (EQUAL_GREATER . (primary . 0)) (GREATER . (primary . 0)) (GREATER_EQUAL . (primary . 0)) (LESS . (primary . 0)) (LESS_EQUAL . (primary . 0)) (MINUS . (primary . 0)) (PLUS . (primary . 0)) (SEMICOLON . (primary . 0)) (SLASH . (primary . 0)) (SLASH_EQUAL . (primary . 0)) (STAR . (primary . 0)) (STAR_STAR . (primary . 0)))
      ((default . error) (AND . (primary . 2)) (DIGITS . (primary . 2)) (DO . (primary . 2)) (ELSE . (primary . 2)) (ELSIF . (primary . 2)) (IN . (primary . 2)) (IS . (primary . 2)) (LOOP . (primary . 2)) (MOD . (primary . 2)) (NOT . (primary . 2)) (OF . (primary . 2)) (OR . (primary . 2)) (RANGE . (primary . 2)) (REM . (primary . 2)) (THEN . (primary . 2)) (WITH . (primary . 2)) (XOR . (primary . 2)) (RIGHT_PAREN . (primary . 2)) (AMPERSAND . (primary . 2)) (BAR . (primary . 2)) (COLON_EQUAL . (primary . 2)) (COMMA . (primary . 2)) (DOT_DOT . (primary . 2)) (EQUAL . (primary . 2)) (EQUAL_GREATER . (primary . 2)) (GREATER . (primary . 2)) (GREATER_EQUAL . (primary . 2)) (LESS . (primary . 2)) (LESS_EQUAL . (primary . 2)) (MINUS . (primary . 2)) (PLUS . (primary . 2)) (SEMICOLON . (primary . 2)) (SLASH . (primary . 2)) (SLASH_EQUAL . (primary . 2)) (STAR . (primary . 2)) (STAR_STAR . (primary . 2)))
      ((default . error) (AND . (expression_opt . 0)) (DIGITS . (expression_opt . 0)) (DO . (expression_opt . 0)) (ELSE . (expression_opt . 0)) (ELSIF . (expression_opt . 0)) (IS . (expression_opt . 0)) (LOOP . (expression_opt . 0)) (OR . (expression_opt . 0)) (RANGE . (expression_opt . 0)) (THEN . (expression_opt . 0)) (WITH . (expression_opt . 0)) (XOR . (expression_opt . 0)) (RIGHT_PAREN . (expression_opt . 0)) (BAR . (expression_opt . 0)) (COMMA . (expression_opt . 0)) (EQUAL_GREATER . (expression_opt . 0)) (SEMICOLON . (expression_opt . 0)))
      ((default . error) (IS .  277))
      ((default . error) (AND . (term . 1)) (DIGITS . (term . 1)) (DO . (term . 1)) (ELSE . (term . 1)) (ELSIF . (term . 1)) (IN . (term . 1)) (IS . (term . 1)) (LOOP . (term . 1)) (MOD . (term . 1)) (NOT . (term . 1)) (OF . (term . 1)) (OR . (term . 1)) (RANGE . (term . 1)) (REM . (term . 1)) (THEN . (term . 1)) (WITH . (term . 1)) (XOR . (term . 1)) (RIGHT_PAREN . (term . 1)) (AMPERSAND . (term . 1)) (BAR . (term . 1)) (COLON_EQUAL . (term . 1)) (COMMA . (term . 1)) (DOT_DOT . (term . 1)) (EQUAL . (term . 1)) (EQUAL_GREATER . (term . 1)) (GREATER . (term . 1)) (GREATER_EQUAL . (term . 1)) (LESS . (term . 1)) (LESS_EQUAL . (term . 1)) (MINUS . (term . 1)) (PLUS . (term . 1)) (SEMICOLON . (term . 1)) (SLASH . (term . 1)) (SLASH_EQUAL . (term . 1)) (STAR . (term . 1)))
      ((default . error) (AND . (primary . 3)) (DIGITS . (primary . 3)) (DO . (primary . 3)) (ELSE . (primary . 3)) (ELSIF . (primary . 3)) (IN . (primary . 3)) (IS . (primary . 3)) (LOOP . (primary . 3)) (MOD . (primary . 3)) (NOT . (primary . 3)) (OF . (primary . 3)) (OR . (primary . 3)) (RANGE . (primary . 3)) (REM . (primary . 3)) (THEN . (primary . 3)) (WITH . (primary . 3)) (XOR . (primary . 3)) (LEFT_PAREN .  235) (RIGHT_PAREN . (primary . 3)) (AMPERSAND . (primary . 3)) (BAR . (primary . 3)) (COLON_EQUAL . (primary . 3)) (COMMA . (primary . 3)) (DOT .  237) (DOT_DOT . (primary . 3)) (EQUAL . (primary . 3)) (EQUAL_GREATER . (primary . 3)) (GREATER . (primary . 3)) (GREATER_EQUAL . (primary . 3)) (LESS . (primary . 3)) (LESS_EQUAL . (primary . 3)) (MINUS . (primary . 3)) (PLUS . (primary . 3)) (SEMICOLON . (primary . 3)) (SLASH . (primary . 3)) (SLASH_EQUAL . (primary . 3)) (STAR . (primary . 3)) (STAR_STAR . (primary . 3)) (TICK_1 .  239))
      ((default . error) (AND . (factor . 1)) (DIGITS . (factor . 1)) (DO . (factor . 1)) (ELSE . (factor . 1)) (ELSIF . (factor . 1)) (IN . (factor . 1)) (IS . (factor . 1)) (LOOP . (factor . 1)) (MOD . (factor . 1)) (NOT . (factor . 1)) (OF . (factor . 1)) (OR . (factor . 1)) (RANGE . (factor . 1)) (REM . (factor . 1)) (THEN . (factor . 1)) (WITH . (factor . 1)) (XOR . (factor . 1)) (RIGHT_PAREN . (factor . 1)) (AMPERSAND . (factor . 1)) (BAR . (factor . 1)) (COLON_EQUAL . (factor . 1)) (COMMA . (factor . 1)) (DOT_DOT . (factor . 1)) (EQUAL . (factor . 1)) (EQUAL_GREATER . (factor . 1)) (GREATER . (factor . 1)) (GREATER_EQUAL . (factor . 1)) (LESS . (factor . 1)) (LESS_EQUAL . (factor . 1)) (MINUS . (factor . 1)) (PLUS . (factor . 1)) (SEMICOLON . (factor . 1)) (SLASH . (factor . 1)) (SLASH_EQUAL . (factor . 1)) (STAR . (factor . 1)) (STAR_STAR .  278))
      ((default . error) (AND . (relation . 4)) (DIGITS . (relation . 4)) (DO . (relation . 4)) (ELSE . (relation . 4)) (ELSIF . (relation . 4)) (IS . (relation . 4)) (LOOP . (relation . 4)) (OR . (relation . 4)) (RANGE . (relation . 4)) (THEN . (relation . 4)) (WITH . (relation . 4)) (XOR . (relation . 4)) (RIGHT_PAREN . (relation . 4)) (BAR . (relation . 4)) (COMMA . (relation . 4)) (EQUAL_GREATER . (relation . 4)) (SEMICOLON . (relation . 4)))
      ((default . error) (AND . ( 279 (expression . 1))) (DIGITS . (expression . 1)) (DO . (expression . 1)) (ELSE . (expression . 1)) (ELSIF . (expression . 1)) (IS . (expression . 1)) (LOOP . (expression . 1)) (OR . (expression . 1)) (RANGE . (expression . 1)) (THEN . (expression . 1)) (WITH . (expression . 1)) (XOR . (expression . 1)) (RIGHT_PAREN . (expression . 1)) (BAR . (expression . 1)) (COMMA . (expression . 1)) (EQUAL_GREATER . (expression . 1)) (SEMICOLON . (expression . 1)))
      ((default . error) (AND . ( 280 (expression . 2))) (DIGITS . (expression . 2)) (DO . (expression . 2)) (ELSE . (expression . 2)) (ELSIF . (expression . 2)) (IS . (expression . 2)) (LOOP . (expression . 2)) (OR . (expression . 2)) (RANGE . (expression . 2)) (THEN . (expression . 2)) (WITH . (expression . 2)) (XOR . (expression . 2)) (RIGHT_PAREN . (expression . 2)) (BAR . (expression . 2)) (COMMA . (expression . 2)) (EQUAL_GREATER . (expression . 2)) (SEMICOLON . (expression . 2)))
      ((default . error) (AND . (expression . 3)) (DIGITS . (expression . 3)) (DO . (expression . 3)) (ELSE . (expression . 3)) (ELSIF . (expression . 3)) (IS . (expression . 3)) (LOOP . (expression . 3)) (OR . ( 281 (expression . 3))) (RANGE . (expression . 3)) (THEN . (expression . 3)) (WITH . (expression . 3)) (XOR . (expression . 3)) (RIGHT_PAREN . (expression . 3)) (BAR . (expression . 3)) (COMMA . (expression . 3)) (EQUAL_GREATER . (expression . 3)) (SEMICOLON . (expression . 3)))
      ((default . error) (AND . (expression . 4)) (DIGITS . (expression . 4)) (DO . (expression . 4)) (ELSE . (expression . 4)) (ELSIF . (expression . 4)) (IS . (expression . 4)) (LOOP . (expression . 4)) (OR . ( 282 (expression . 4))) (RANGE . (expression . 4)) (THEN . (expression . 4)) (WITH . (expression . 4)) (XOR . (expression . 4)) (RIGHT_PAREN . (expression . 4)) (BAR . (expression . 4)) (COMMA . (expression . 4)) (EQUAL_GREATER . (expression . 4)) (SEMICOLON . (expression . 4)))
      ((default . error) (AND . (expression . 5)) (DIGITS . (expression . 5)) (DO . (expression . 5)) (ELSE . (expression . 5)) (ELSIF . (expression . 5)) (IS . (expression . 5)) (LOOP . (expression . 5)) (OR . (expression . 5)) (RANGE . (expression . 5)) (THEN . (expression . 5)) (WITH . (expression . 5)) (XOR . ( 283 (expression . 5))) (RIGHT_PAREN . (expression . 5)) (BAR . (expression . 5)) (COMMA . (expression . 5)) (EQUAL_GREATER . (expression . 5)) (SEMICOLON . (expression . 5)))
      ((default . error) (AND . ( 284 (expression . 0))) (DIGITS . (expression . 0)) (DO . (expression . 0)) (ELSE . (expression . 0)) (ELSIF . (expression . 0)) (IS . (expression . 0)) (LOOP . (expression . 0)) (OR . ( 285 (expression . 0))) (RANGE . (expression . 0)) (THEN . (expression . 0)) (WITH . (expression . 0)) (XOR . ( 286 (expression . 0))) (RIGHT_PAREN . (expression . 0)) (BAR . (expression . 0)) (COMMA . (expression . 0)) (EQUAL_GREATER . (expression . 0)) (SEMICOLON . (expression . 0)))
      ((default . error) (AND . (relation . 3)) (DIGITS . (relation . 3)) (DO . (relation . 3)) (ELSE . (relation . 3)) (ELSIF . (relation . 3)) (IN .  287) (IS . (relation . 3)) (LOOP . (relation . 3)) (NOT .  288) (OR . (relation . 3)) (RANGE . (relation . 3)) (THEN . (relation . 3)) (WITH . (relation . 3)) (XOR . (relation . 3)) (RIGHT_PAREN . (relation . 3)) (BAR . (relation . 3)) (COMMA . (relation . 3)) (EQUAL .  289) (EQUAL_GREATER . (relation . 3)) (GREATER .  290) (GREATER_EQUAL .  291) (LESS .  292) (LESS_EQUAL .  293) (SEMICOLON . (relation . 3)) (SLASH_EQUAL .  294))
      ((default . error) (AND . (term_list . 1)) (DIGITS . (term_list . 1)) (DO . (term_list . 1)) (ELSE . (term_list . 1)) (ELSIF . (term_list . 1)) (IN . (term_list . 1)) (IS . (term_list . 1)) (LOOP . (term_list . 1)) (MOD .  296) (NOT . (term_list . 1)) (OF . (term_list . 1)) (OR . (term_list . 1)) (RANGE . (term_list . 1)) (REM .  297) (THEN . (term_list . 1)) (WITH . (term_list . 1)) (XOR . (term_list . 1)) (RIGHT_PAREN . (term_list . 1)) (AMPERSAND . (term_list . 1)) (BAR . (term_list . 1)) (COLON_EQUAL . (term_list . 1)) (COMMA . (term_list . 1)) (DOT_DOT . (term_list . 1)) (EQUAL . (term_list . 1)) (EQUAL_GREATER . (term_list . 1)) (GREATER . (term_list . 1)) (GREATER_EQUAL . (term_list . 1)) (LESS . (term_list . 1)) (LESS_EQUAL . (term_list . 1)) (MINUS . (term_list . 1)) (PLUS . (term_list . 1)) (SEMICOLON . (term_list . 1)) (SLASH .  298) (SLASH_EQUAL . (term_list . 1)) (STAR .  299))
      ((default . error) (AND . (simple_expression . 1)) (DIGITS . (simple_expression . 1)) (DO . (simple_expression . 1)) (ELSE . (simple_expression . 1)) (ELSIF . (simple_expression . 1)) (IN . (simple_expression . 1)) (IS . (simple_expression . 1)) (LOOP . (simple_expression . 1)) (NOT . (simple_expression . 1)) (OF . (simple_expression . 1)) (OR . (simple_expression . 1)) (RANGE . (simple_expression . 1)) (THEN . (simple_expression . 1)) (WITH . (simple_expression . 1)) (XOR . (simple_expression . 1)) (RIGHT_PAREN . (simple_expression . 1)) (AMPERSAND .  301) (BAR . (simple_expression . 1)) (COLON_EQUAL . (simple_expression . 1)) (COMMA . (simple_expression . 1)) (DOT_DOT . (simple_expression . 1)) (EQUAL . (simple_expression . 1)) (EQUAL_GREATER . (simple_expression . 1)) (GREATER . (simple_expression . 1)) (GREATER_EQUAL . (simple_expression . 1)) (LESS . (simple_expression . 1)) (LESS_EQUAL . (simple_expression . 1)) (MINUS .  302) (PLUS .  303) (SEMICOLON . (simple_expression . 1)) (SLASH_EQUAL . (simple_expression . 1)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  307))
      ((default . error) (WHEN . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)))
      ((default . error) (WHEN .  308) (SEMICOLON .  309))
      ((default . error) (IN .  310) (OF .  311) (USE . ((direct_name . 0) (name . 5))) (LEFT_PAREN . (name . 5)) (COLON .  312) (DOT . (name . 5)) (TICK_1 . (name . 5)))
      ((default . error) (USE . ((direct_name . 1) (name . 7))) (LEFT_PAREN . (name . 7)) (DOT . (name . 7)) (TICK_1 . (name . 7)))
      ((default . error) (USE . ( 313 (name . 3))) (LEFT_PAREN . (name . 3)) (DOT . (name . 3)) (TICK_1 . (name . 3)))
      ((default . error) (USE .  314))
      ((default . error) (LOOP . (iterator_specification_opt . 0)))
      ((default . error) (LOOP . (iteration_scheme . 1)))
      ((default . error) (USE .  315) (LEFT_PAREN .  235) (DOT .  237) (TICK_1 .  239))
      ((default . error) (RETURN .  316) (LEFT_PAREN .  317) (DOT .  237) (TICK_1 .  239))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  324))
      ((default . error) (FUNCTION .  7) (PACKAGE .  325) (PROCEDURE .  18))
      ((default . error) (COLON . (identifier_list . 1)) (COMMA . (identifier_list . 1)))
      ((default . error) (FUNCTION . (generic_formal_parameter_declaration . 0)) (PACKAGE . (generic_formal_parameter_declaration . 0)) (PRAGMA . (generic_formal_parameter_declaration . 0)) (PROCEDURE . (generic_formal_parameter_declaration . 0)) (TYPE . (generic_formal_parameter_declaration . 0)) (USE . (generic_formal_parameter_declaration . 0)) (WITH . (generic_formal_parameter_declaration . 0)) (IDENTIFIER . (generic_formal_parameter_declaration . 0)))
      ((default . error) (FUNCTION . (generic_formal_parameter_declaration . 2)) (PACKAGE . (generic_formal_parameter_declaration . 2)) (PRAGMA . (generic_formal_parameter_declaration . 2)) (PROCEDURE . (generic_formal_parameter_declaration . 2)) (TYPE . (generic_formal_parameter_declaration . 2)) (USE . (generic_formal_parameter_declaration . 2)) (WITH . (generic_formal_parameter_declaration . 2)) (IDENTIFIER . (generic_formal_parameter_declaration . 2)))
      ((default . error) (FUNCTION . (generic_formal_parameter_declaration . 1)) (PACKAGE . (generic_formal_parameter_declaration . 1)) (PRAGMA . (generic_formal_parameter_declaration . 1)) (PROCEDURE . (generic_formal_parameter_declaration . 1)) (TYPE . (generic_formal_parameter_declaration . 1)) (USE . (generic_formal_parameter_declaration . 1)) (WITH . (generic_formal_parameter_declaration . 1)) (IDENTIFIER . (generic_formal_parameter_declaration . 1)))
      ((default . error) (FUNCTION . (generic_formal_parameter_declaration . 3)) (PACKAGE . (generic_formal_parameter_declaration . 3)) (PRAGMA . (generic_formal_parameter_declaration . 3)) (PROCEDURE . (generic_formal_parameter_declaration . 3)) (TYPE . (generic_formal_parameter_declaration . 3)) (USE . (generic_formal_parameter_declaration . 3)) (WITH . (generic_formal_parameter_declaration . 3)) (IDENTIFIER . (generic_formal_parameter_declaration . 3)))
      ((default . error) (FUNCTION . (generic_formal_part . 0)) (PACKAGE . (generic_formal_part . 0)) (PRAGMA .  16) (PROCEDURE . (generic_formal_part . 0)) (TYPE .  162) (USE .  28) (WITH .  163) (IDENTIFIER .  164))
      ((default . error) (FUNCTION . (generic_formal_parameter_declarations . 1)) (PACKAGE . (generic_formal_parameter_declarations . 1)) (PRAGMA . (generic_formal_parameter_declarations . 1)) (PROCEDURE . (generic_formal_parameter_declarations . 1)) (TYPE . (generic_formal_parameter_declarations . 1)) (USE . (generic_formal_parameter_declarations . 1)) (WITH . (generic_formal_parameter_declarations . 1)) (IDENTIFIER . (generic_formal_parameter_declarations . 1)))
      ((default . error) (COLON .  328) (COMMA .  234))
      ((default . error) (FUNCTION . (generic_formal_parameter_declaration . 4)) (PACKAGE . (generic_formal_parameter_declaration . 4)) (PRAGMA . (generic_formal_parameter_declaration . 4)) (PROCEDURE . (generic_formal_parameter_declaration . 4)) (TYPE . (generic_formal_parameter_declaration . 4)) (USE . (generic_formal_parameter_declaration . 4)) (WITH . (generic_formal_parameter_declaration . 4)) (IDENTIFIER . (generic_formal_parameter_declaration . 4)))
      ((default . error) (FUNCTION . (generic_formal_parameter_declaration . 5)) (PACKAGE . (generic_formal_parameter_declaration . 5)) (PRAGMA . (generic_formal_parameter_declaration . 5)) (PROCEDURE . (generic_formal_parameter_declaration . 5)) (TYPE . (generic_formal_parameter_declaration . 5)) (USE . (generic_formal_parameter_declaration . 5)) (WITH . (generic_formal_parameter_declaration . 5)) (IDENTIFIER . (generic_formal_parameter_declaration . 5)))
      ((default . error) (SEMICOLON .  329))
      ((default . error) (THEN .  330))
      ((default . error) (WITH .  331))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ENTRY . (overriding_indicator_opt . 0)) (FUNCTION . (overriding_indicator_opt . 0)) (PROCEDURE . (overriding_indicator_opt . 0)))
      ((default . error) (ACCEPT . (simple_statement . 0)) (ABORT . (simple_statement . 0)) (BEGIN . (simple_statement . 0)) (CASE . (simple_statement . 0)) (DECLARE . (simple_statement . 0)) (DELAY . (simple_statement . 0)) (ELSE . (simple_statement . 0)) (ELSIF . (simple_statement . 0)) (END . (simple_statement . 0)) (ENTRY . (simple_statement . 0)) (EXCEPTION . (simple_statement . 0)) (EXIT . (simple_statement . 0)) (FOR . (simple_statement . 0)) (FUNCTION . (simple_statement . 0)) (GENERIC . (simple_statement . 0)) (GOTO . (simple_statement . 0)) (IF . (simple_statement . 0)) (LIMITED . (simple_statement . 0)) (LOOP . (simple_statement . 0)) (NOT . (simple_statement . 0)) (NULL . (simple_statement . 0)) (OR . (simple_statement . 0)) (OVERRIDING . (simple_statement . 0)) (PACKAGE . (simple_statement . 0)) (PRAGMA . (simple_statement . 0)) (PRIVATE . (simple_statement . 0)) (PROCEDURE . (simple_statement . 0)) (PROTECTED . (simple_statement . 0)) (RAISE . (simple_statement . 0)) (REQUEUE . (simple_statement . 0)) (RETURN . (simple_statement . 0)) (SEPARATE . (simple_statement . 0)) (SELECT . (simple_statement . 0)) (SUBTYPE . (simple_statement . 0)) (TASK . (simple_statement . 0)) (THEN . (simple_statement . 0)) (TYPE . (simple_statement . 0)) (USE . (simple_statement . 0)) (WHEN . (simple_statement . 0)) (WHILE . (simple_statement . 0)) (WITH . (simple_statement . 0)) (LESS_LESS . (simple_statement . 0)) (IDENTIFIER . (simple_statement . 0)) (STRING_LITERAL . (simple_statement . 0)) (CHARACTER_LITERAL . (simple_statement . 0)) (Wisi_EOI . (simple_statement . 0)))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IS . ( 334 (aspect_specification_opt . 1))) (RENAMES .  335) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (TICK_1 .  239))
      ((default . error) (LEFT_PAREN .  338) (SEMICOLON .  339))
      ((default . error) (IDENTIFIER .  340) (STRING_LITERAL .  152) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (COLON . ( 342 (identifier_list . 1))) (COMMA . (identifier_list . 1)))
      ((default . error) (ACCEPT . (compilation_unit . 2)) (ABORT . (compilation_unit . 2)) (BEGIN . (compilation_unit . 2)) (CASE . (compilation_unit . 2)) (DECLARE . (compilation_unit . 2)) (DELAY . (compilation_unit . 2)) (ENTRY . (compilation_unit . 2)) (EXIT . (compilation_unit . 2)) (FOR . (compilation_unit . 2)) (FUNCTION . (compilation_unit . 2)) (GENERIC . (compilation_unit . 2)) (GOTO . (compilation_unit . 2)) (IF . (compilation_unit . 2)) (LIMITED . (compilation_unit . 2)) (LOOP . (compilation_unit . 2)) (NOT . (compilation_unit . 2)) (NULL . (compilation_unit . 2)) (OVERRIDING . (compilation_unit . 2)) (PACKAGE . (compilation_unit . 2)) (PRAGMA . (compilation_unit . 2)) (PRIVATE . (compilation_unit . 2)) (PROCEDURE . (compilation_unit . 2)) (PROTECTED . (compilation_unit . 2)) (RAISE . (compilation_unit . 2)) (REQUEUE . (compilation_unit . 2)) (RETURN . (compilation_unit . 2)) (SEPARATE . (compilation_unit . 2)) (SELECT . (compilation_unit . 2)) (SUBTYPE . (compilation_unit . 2)) (TASK . (compilation_unit . 2)) (TYPE . (compilation_unit . 2)) (USE . (compilation_unit . 2)) (WHILE . (compilation_unit . 2)) (WITH . (compilation_unit . 2)) (LESS_LESS . (compilation_unit . 2)) (IDENTIFIER . (compilation_unit . 2)) (STRING_LITERAL . (compilation_unit . 2)) (CHARACTER_LITERAL . (compilation_unit . 2)) (Wisi_EOI . (compilation_unit . 2)))
      ((default . error) (IS . (parameter_profile_opt . 1)) (WITH . (parameter_profile_opt . 1)) (LEFT_PAREN .  317) (DOT .  237) (SEMICOLON . (parameter_profile_opt . 1)) (TICK_1 .  239))
      ((default . error) (IDENTIFIER .  345))
      ((default . error) (IDENTIFIER .  346))
      ((default . error) (IS . (aspect_specification_opt . 1)) (WITH .  336))
      ((default . error) (ACCEPT . (raise_statement . 2)) (ABORT . (raise_statement . 2)) (BEGIN . (raise_statement . 2)) (CASE . (raise_statement . 2)) (DECLARE . (raise_statement . 2)) (DELAY . (raise_statement . 2)) (ELSE . (raise_statement . 2)) (ELSIF . (raise_statement . 2)) (END . (raise_statement . 2)) (ENTRY . (raise_statement . 2)) (EXCEPTION . (raise_statement . 2)) (EXIT . (raise_statement . 2)) (FOR . (raise_statement . 2)) (FUNCTION . (raise_statement . 2)) (GENERIC . (raise_statement . 2)) (GOTO . (raise_statement . 2)) (IF . (raise_statement . 2)) (LIMITED . (raise_statement . 2)) (LOOP . (raise_statement . 2)) (NOT . (raise_statement . 2)) (NULL . (raise_statement . 2)) (OR . (raise_statement . 2)) (OVERRIDING . (raise_statement . 2)) (PACKAGE . (raise_statement . 2)) (PRAGMA . (raise_statement . 2)) (PRIVATE . (raise_statement . 2)) (PROCEDURE . (raise_statement . 2)) (PROTECTED . (raise_statement . 2)) (RAISE . (raise_statement . 2)) (REQUEUE . (raise_statement . 2)) (RETURN . (raise_statement . 2)) (SEPARATE . (raise_statement . 2)) (SELECT . (raise_statement . 2)) (SUBTYPE . (raise_statement . 2)) (TASK . (raise_statement . 2)) (THEN . (raise_statement . 2)) (TYPE . (raise_statement . 2)) (USE . (raise_statement . 2)) (WHEN . (raise_statement . 2)) (WHILE . (raise_statement . 2)) (WITH . (raise_statement . 2)) (LESS_LESS . (raise_statement . 2)) (IDENTIFIER . (raise_statement . 2)) (STRING_LITERAL . (raise_statement . 2)) (CHARACTER_LITERAL . (raise_statement . 2)) (Wisi_EOI . (raise_statement . 2)))
      ((default . error) (WITH .  348) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON .  349) (TICK_1 .  239))
      ((default . error) (WITH .  350) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON .  351) (TICK_1 .  239))
      ((default . error) (AND . (name . 5)) (IN . (name . 5)) (MOD . (name . 5)) (NOT . (name . 5)) (OR . (name . 5)) (REM . (name . 5)) (XOR . (name . 5)) (LEFT_PAREN . (name . 5)) (AMPERSAND . (name . 5)) (COLON .  352) (DOT . (name . 5)) (EQUAL . (name . 5)) (GREATER . (name . 5)) (GREATER_EQUAL . (name . 5)) (LESS . (name . 5)) (LESS_EQUAL . (name . 5)) (MINUS . (name . 5)) (PLUS . (name . 5)) (SEMICOLON . (name . 5)) (SLASH . (name . 5)) (SLASH_EQUAL . (name . 5)) (STAR . (name . 5)) (STAR_STAR . (name . 5)) (TICK_1 . (name . 5)))
      ((default . error) (SEMICOLON .  353))
      ((default . error) (DO . (extended_return_object_declaration_opt . 0)) (SEMICOLON .  354))
      ((default . error) (DO .  355))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  357))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (EQUAL_GREATER . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (ELSE . (sequence_of_statements_opt . 1)) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (OR . (sequence_of_statements_opt . 1)) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ELSE . (select_alternative . 5)) (END . (select_alternative . 5)) (OR . (select_alternative . 5)))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (ELSE . (sequence_of_statements_opt . 1)) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (OR . (sequence_of_statements_opt . 1)) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (THEN . (sequence_of_statements_opt . 1)) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ELSE .  364) (OR .  365))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (ELSE . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (OR . (sequence_of_statements_opt . 1)) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (THEN . (sequence_of_statements_opt . 1)) (WHILE . (block_label_opt . 1)) (LEFT_PAREN .  235) (DOT .  237) (LESS_LESS .  31) (SEMICOLON .  238) (TICK_1 .  239) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (ELSE . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (OR . (sequence_of_statements_opt . 1)) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (THEN . (sequence_of_statements_opt . 1)) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ELSE . (select_alternative_list . 1)) (END . (select_alternative_list . 1)) (OR . (select_alternative_list . 1)))
      ((default . error) (ELSE . (select_alternative_list_opt . 0)) (END . (select_alternative_list_opt . 0)) (OR .  368))
      ((default . error) (ELSE .  369) (END .  370))
      ((default . error) (THEN .  371))
      ((default . error) (IS .  372))
      ((default . error) (IDENTIFIER .  373))
      ((default . error) (IDENTIFIER .  374))
      ((default . error) (IS . (aspect_specification_opt . 1)) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (IS . (discriminant_part_opt . 2)) (LEFT_PAREN .  376) (SEMICOLON . (discriminant_part_opt . 2)))
      ((default . error) (TYPE .  378))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (COMMA .  380) (SEMICOLON .  381))
      ((default . error) (LEFT_PAREN .  235) (COMMA . (name_list . 1)) (DOT .  237) (SEMICOLON . (name_list . 1)) (TICK_1 .  239))
      ((default . error) (LOOP . (iteration_scheme . 0)))
      ((default . error) (COMMA .  380) (SEMICOLON .  382))
      ((default . error) (GREATER_GREATER .  383))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (BEGIN . (block_label . 0)) (DECLARE . (block_label . 0)) (EXCEPTION .  384) (FOR . (block_label . 0)) (LOOP . (block_label . 0)) (NOT .  385) (WHILE . (block_label . 0)) (IDENTIFIER . (null_exclusion_opt . 1)) (STRING_LITERAL . (null_exclusion_opt . 1)) (CHARACTER_LITERAL . (null_exclusion_opt . 1)))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXCEPTION . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (BEGIN . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (LOOP . (iterator_specification_opt . 1)) (IDENTIFIER .  394))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (LOOP .  396))
      ((default . error) (ACCEPT . (compilation_unit_list . 0)) (ABORT . (compilation_unit_list . 0)) (BEGIN . (compilation_unit_list . 0)) (CASE . (compilation_unit_list . 0)) (DECLARE . (compilation_unit_list . 0)) (DELAY . (compilation_unit_list . 0)) (ENTRY . (compilation_unit_list . 0)) (EXIT . (compilation_unit_list . 0)) (FOR . (compilation_unit_list . 0)) (FUNCTION . (compilation_unit_list . 0)) (GENERIC . (compilation_unit_list . 0)) (GOTO . (compilation_unit_list . 0)) (IF . (compilation_unit_list . 0)) (LIMITED . (compilation_unit_list . 0)) (LOOP . (compilation_unit_list . 0)) (NOT . (compilation_unit_list . 0)) (NULL . (compilation_unit_list . 0)) (OVERRIDING . (compilation_unit_list . 0)) (PACKAGE . (compilation_unit_list . 0)) (PRAGMA . (compilation_unit_list . 0)) (PRIVATE . (compilation_unit_list . 0)) (PROCEDURE . (compilation_unit_list . 0)) (PROTECTED . (compilation_unit_list . 0)) (RAISE . (compilation_unit_list . 0)) (REQUEUE . (compilation_unit_list . 0)) (RETURN . (compilation_unit_list . 0)) (SEPARATE . (compilation_unit_list . 0)) (SELECT . (compilation_unit_list . 0)) (SUBTYPE . (compilation_unit_list . 0)) (TASK . (compilation_unit_list . 0)) (TYPE . (compilation_unit_list . 0)) (USE . (compilation_unit_list . 0)) (WHILE . (compilation_unit_list . 0)) (WITH . (compilation_unit_list . 0)) (LESS_LESS . (compilation_unit_list . 0)) (IDENTIFIER . (compilation_unit_list . 0)) (STRING_LITERAL . (compilation_unit_list . 0)) (CHARACTER_LITERAL . (compilation_unit_list . 0)) (Wisi_EOI . (compilation_unit_list . 0)))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  398))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (ACCESS . (aliased_opt . 1)) (ALIASED .  400) (ARRAY . (aliased_opt . 1)) (CONSTANT . ( 401 (aliased_opt . 1))) (EXCEPTION .  402) (NOT . (aliased_opt . 1)) (WITH . (aliased_opt . 1)) (COLON_EQUAL . (aliased_opt . 1)) (SEMICOLON . (aliased_opt . 1)) (IDENTIFIER . (aliased_opt . 1)) (STRING_LITERAL . (aliased_opt . 1)) (CHARACTER_LITERAL . (aliased_opt . 1)))
      ((default . error) (IDENTIFIER .  404))
      ((default . error) (ABS .  121) (CASE .  257) (FOR .  258) (IF .  259) (NEW .  122) (NOT .  260) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (association_opt . 5)) (BAR . (discrete_choice_list . 2)) (COMMA . (association_opt . 5)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  263))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ALL .  411) (IDENTIFIER .  412) (STRING_LITERAL .  413) (CHARACTER_LITERAL .  414))
      ((default . error) (ACCEPT . (procedure_call_statement . 0)) (ABORT . (procedure_call_statement . 0)) (BEGIN . (procedure_call_statement . 0)) (CASE . (procedure_call_statement . 0)) (DECLARE . (procedure_call_statement . 0)) (DELAY . (procedure_call_statement . 0)) (ELSE . (procedure_call_statement . 0)) (ELSIF . (procedure_call_statement . 0)) (END . (procedure_call_statement . 0)) (ENTRY . (procedure_call_statement . 0)) (EXCEPTION . (procedure_call_statement . 0)) (EXIT . (procedure_call_statement . 0)) (FOR . (procedure_call_statement . 0)) (FUNCTION . (procedure_call_statement . 0)) (GENERIC . (procedure_call_statement . 0)) (GOTO . (procedure_call_statement . 0)) (IF . (procedure_call_statement . 0)) (LIMITED . (procedure_call_statement . 0)) (LOOP . (procedure_call_statement . 0)) (NOT . (procedure_call_statement . 0)) (NULL . (procedure_call_statement . 0)) (OR . (procedure_call_statement . 0)) (OVERRIDING . (procedure_call_statement . 0)) (PACKAGE . (procedure_call_statement . 0)) (PRAGMA . (procedure_call_statement . 0)) (PRIVATE . (procedure_call_statement . 0)) (PROCEDURE . (procedure_call_statement . 0)) (PROTECTED . (procedure_call_statement . 0)) (RAISE . (procedure_call_statement . 0)) (REQUEUE . (procedure_call_statement . 0)) (RETURN . (procedure_call_statement . 0)) (SEPARATE . (procedure_call_statement . 0)) (SELECT . (procedure_call_statement . 0)) (SUBTYPE . (procedure_call_statement . 0)) (TASK . (procedure_call_statement . 0)) (THEN . (procedure_call_statement . 0)) (TYPE . (procedure_call_statement . 0)) (USE . (procedure_call_statement . 0)) (WHEN . (procedure_call_statement . 0)) (WHILE . (procedure_call_statement . 0)) (WITH . (procedure_call_statement . 0)) (LESS_LESS . (procedure_call_statement . 0)) (IDENTIFIER . (procedure_call_statement . 0)) (STRING_LITERAL . (procedure_call_statement . 0)) (CHARACTER_LITERAL . (procedure_call_statement . 0)) (Wisi_EOI . (procedure_call_statement . 0)))
      ((default . error) (ACCESS . (tick . 0)) (DELTA . (tick . 0)) (DIGITS . (tick . 0)) (MOD . (tick . 0)) (RANGE . (tick . 0)) (LEFT_PAREN . (tick . 0)) (IDENTIFIER . (tick . 0)) (STRING_LITERAL . (tick . 0)) (CHARACTER_LITERAL . (tick . 0)))
      ((default . error) (ACCEPT . (name . 1)) (ABORT . (name . 1)) (AND . (name . 1)) (BEGIN . (name . 1)) (CASE . (name . 1)) (DECLARE . (name . 1)) (DELAY . (name . 1)) (DIGITS . (name . 1)) (DO . (name . 1)) (ELSE . (name . 1)) (ELSIF . (name . 1)) (EXIT . (name . 1)) (FOR . (name . 1)) (GOTO . (name . 1)) (IF . (name . 1)) (IN . (name . 1)) (IS . (name . 1)) (LOOP . (name . 1)) (MOD . (name . 1)) (NOT . (name . 1)) (NULL . (name . 1)) (OF . (name . 1)) (OR . (name . 1)) (PRAGMA . (name . 1)) (RAISE . (name . 1)) (RANGE . (name . 1)) (REM . (name . 1)) (RENAMES . (name . 1)) (REQUEUE . (name . 1)) (RETURN . (name . 1)) (SELECT . (name . 1)) (THEN . (name . 1)) (USE . (name . 1)) (WHILE . (name . 1)) (WITH . (name . 1)) (XOR . (name . 1)) (LEFT_PAREN . (name . 1)) (RIGHT_PAREN . (name . 1)) (AMPERSAND . (name . 1)) (BAR . (name . 1)) (COLON_EQUAL . (name . 1)) (COMMA . (name . 1)) (DOT . (name . 1)) (DOT_DOT . (name . 1)) (EQUAL . (name . 1)) (EQUAL_GREATER . (name . 1)) (GREATER . (name . 1)) (GREATER_EQUAL . (name . 1)) (LESS . (name . 1)) (LESS_EQUAL . (name . 1)) (LESS_LESS . (name . 1)) (MINUS . (name . 1)) (PLUS . (name . 1)) (SEMICOLON . (name . 1)) (SLASH . (name . 1)) (SLASH_EQUAL . (name . 1)) (STAR . (name . 1)) (STAR_STAR . (name . 1)) (TICK_1 . (name . 1)) (IDENTIFIER . (name . 1)) (STRING_LITERAL . (name . 1)) (CHARACTER_LITERAL . (name . 1)))
      ((default . error) (ACCESS .  415) (DELTA .  416) (DIGITS .  417) (MOD .  418) (LEFT_PAREN .  126) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  422))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IS . ( 425 (subprogram_specification . 1))) (RENAMES . (subprogram_specification . 1)) (WITH . (subprogram_specification . 1)) (SEMICOLON . (subprogram_specification . 1)))
      ((default . error) (IS . ( 426 (subprogram_specification . 0))) (RENAMES . (subprogram_specification . 0)) (WITH . (subprogram_specification . 0)) (SEMICOLON . (subprogram_specification . 0)))
      ((default . error) (IS . ( 427 (aspect_specification_opt . 1))) (RENAMES .  428) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (ACCEPT . (package_declaration . 0)) (ABORT . (package_declaration . 0)) (BEGIN . (package_declaration . 0)) (CASE . (package_declaration . 0)) (DECLARE . (package_declaration . 0)) (DELAY . (package_declaration . 0)) (END . (package_declaration . 0)) (ENTRY . (package_declaration . 0)) (EXIT . (package_declaration . 0)) (FOR . (package_declaration . 0)) (FUNCTION . (package_declaration . 0)) (GENERIC . (package_declaration . 0)) (GOTO . (package_declaration . 0)) (IF . (package_declaration . 0)) (LIMITED . (package_declaration . 0)) (LOOP . (package_declaration . 0)) (NOT . (package_declaration . 0)) (NULL . (package_declaration . 0)) (OVERRIDING . (package_declaration . 0)) (PACKAGE . (package_declaration . 0)) (PRAGMA . (package_declaration . 0)) (PRIVATE . (package_declaration . 0)) (PROCEDURE . (package_declaration . 0)) (PROTECTED . (package_declaration . 0)) (RAISE . (package_declaration . 0)) (REQUEUE . (package_declaration . 0)) (RETURN . (package_declaration . 0)) (SEPARATE . (package_declaration . 0)) (SELECT . (package_declaration . 0)) (SUBTYPE . (package_declaration . 0)) (TASK . (package_declaration . 0)) (TYPE . (package_declaration . 0)) (USE . (package_declaration . 0)) (WHILE . (package_declaration . 0)) (WITH . (package_declaration . 0)) (LESS_LESS . (package_declaration . 0)) (IDENTIFIER . (package_declaration . 0)) (STRING_LITERAL . (package_declaration . 0)) (CHARACTER_LITERAL . (package_declaration . 0)) (Wisi_EOI . (package_declaration . 0)))
      ((default . error) (ABS .  121) (CASE .  257) (FOR .  258) (IF .  259) (NEW .  122) (NOT .  260) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (association_opt . 5)) (BAR . (discrete_choice_list . 2)) (COMMA . (association_opt . 5)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  263))
      ((default . error) (DO . (actual_parameter_part_opt . 0)) (LEFT_PAREN . (actual_parameter_part_opt . 0)) (SEMICOLON . (actual_parameter_part_opt . 0)))
      ((default . error) (DO . (parameter_profile_opt . 1)) (LEFT_PAREN .  430) (SEMICOLON . (parameter_profile_opt . 1)))
      ((default . error) (ACCEPT . (simple_statement . 8)) (ABORT . (simple_statement . 8)) (BEGIN . (simple_statement . 8)) (CASE . (simple_statement . 8)) (DECLARE . (simple_statement . 8)) (DELAY . (simple_statement . 8)) (ELSE . (simple_statement . 8)) (ELSIF . (simple_statement . 8)) (END . (simple_statement . 8)) (ENTRY . (simple_statement . 8)) (EXCEPTION . (simple_statement . 8)) (EXIT . (simple_statement . 8)) (FOR . (simple_statement . 8)) (FUNCTION . (simple_statement . 8)) (GENERIC . (simple_statement . 8)) (GOTO . (simple_statement . 8)) (IF . (simple_statement . 8)) (LIMITED . (simple_statement . 8)) (LOOP . (simple_statement . 8)) (NOT . (simple_statement . 8)) (NULL . (simple_statement . 8)) (OR . (simple_statement . 8)) (OVERRIDING . (simple_statement . 8)) (PACKAGE . (simple_statement . 8)) (PRAGMA . (simple_statement . 8)) (PRIVATE . (simple_statement . 8)) (PROCEDURE . (simple_statement . 8)) (PROTECTED . (simple_statement . 8)) (RAISE . (simple_statement . 8)) (REQUEUE . (simple_statement . 8)) (RETURN . (simple_statement . 8)) (SEPARATE . (simple_statement . 8)) (SELECT . (simple_statement . 8)) (SUBTYPE . (simple_statement . 8)) (TASK . (simple_statement . 8)) (THEN . (simple_statement . 8)) (TYPE . (simple_statement . 8)) (USE . (simple_statement . 8)) (WHEN . (simple_statement . 8)) (WHILE . (simple_statement . 8)) (WITH . (simple_statement . 8)) (LESS_LESS . (simple_statement . 8)) (IDENTIFIER . (simple_statement . 8)) (STRING_LITERAL . (simple_statement . 8)) (CHARACTER_LITERAL . (simple_statement . 8)) (Wisi_EOI . (simple_statement . 8)))
      ((default . error) (AND . (factor . 2)) (DIGITS . (factor . 2)) (DO . (factor . 2)) (ELSE . (factor . 2)) (ELSIF . (factor . 2)) (IN . (factor . 2)) (IS . (factor . 2)) (LOOP . (factor . 2)) (MOD . (factor . 2)) (NOT . (factor . 2)) (OF . (factor . 2)) (OR . (factor . 2)) (RANGE . (factor . 2)) (REM . (factor . 2)) (THEN . (factor . 2)) (WITH . (factor . 2)) (XOR . (factor . 2)) (RIGHT_PAREN . (factor . 2)) (AMPERSAND . (factor . 2)) (BAR . (factor . 2)) (COLON_EQUAL . (factor . 2)) (COMMA . (factor . 2)) (DOT_DOT . (factor . 2)) (EQUAL . (factor . 2)) (EQUAL_GREATER . (factor . 2)) (GREATER . (factor . 2)) (GREATER_EQUAL . (factor . 2)) (LESS . (factor . 2)) (LESS_EQUAL . (factor . 2)) (MINUS . (factor . 2)) (PLUS . (factor . 2)) (SEMICOLON . (factor . 2)) (SLASH . (factor . 2)) (SLASH_EQUAL . (factor . 2)) (STAR . (factor . 2)))
      ((default . error) (AND . (primary . 4)) (DIGITS . (primary . 4)) (DO . (primary . 4)) (ELSE . (primary . 4)) (ELSIF . (primary . 4)) (IN . (primary . 4)) (IS . (primary . 4)) (LOOP . (primary . 4)) (MOD . (primary . 4)) (NOT . (primary . 4)) (OF . (primary . 4)) (OR . (primary . 4)) (RANGE . (primary . 4)) (REM . (primary . 4)) (THEN . (primary . 4)) (WITH . (primary . 4)) (XOR . (primary . 4)) (LEFT_PAREN .  235) (RIGHT_PAREN . (primary . 4)) (AMPERSAND . (primary . 4)) (BAR . (primary . 4)) (COLON_EQUAL . (primary . 4)) (COMMA . (primary . 4)) (DOT .  237) (DOT_DOT . (primary . 4)) (EQUAL . (primary . 4)) (EQUAL_GREATER . (primary . 4)) (GREATER . (primary . 4)) (GREATER_EQUAL . (primary . 4)) (LESS . (primary . 4)) (LESS_EQUAL . (primary . 4)) (MINUS . (primary . 4)) (PLUS . (primary . 4)) (SEMICOLON . (primary . 4)) (SLASH . (primary . 4)) (SLASH_EQUAL . (primary . 4)) (STAR . (primary . 4)) (STAR_STAR . (primary . 4)) (TICK_1 .  239))
      ((default . error) (AND . (factor . 3)) (DIGITS . (factor . 3)) (DO . (factor . 3)) (ELSE . (factor . 3)) (ELSIF . (factor . 3)) (IN . (factor . 3)) (IS . (factor . 3)) (LOOP . (factor . 3)) (MOD . (factor . 3)) (NOT . (factor . 3)) (OF . (factor . 3)) (OR . (factor . 3)) (RANGE . (factor . 3)) (REM . (factor . 3)) (THEN . (factor . 3)) (WITH . (factor . 3)) (XOR . (factor . 3)) (RIGHT_PAREN . (factor . 3)) (AMPERSAND . (factor . 3)) (BAR . (factor . 3)) (COLON_EQUAL . (factor . 3)) (COMMA . (factor . 3)) (DOT_DOT . (factor . 3)) (EQUAL . (factor . 3)) (EQUAL_GREATER . (factor . 3)) (GREATER . (factor . 3)) (GREATER_EQUAL . (factor . 3)) (LESS . (factor . 3)) (LESS_EQUAL . (factor . 3)) (MINUS . (factor . 3)) (PLUS . (factor . 3)) (SEMICOLON . (factor . 3)) (SLASH . (factor . 3)) (SLASH_EQUAL . (factor . 3)) (STAR . (factor . 3)))
      ((default . error) (AND . (raise_expression . 1)) (DIGITS . (raise_expression . 1)) (DO . (raise_expression . 1)) (ELSE . (raise_expression . 1)) (ELSIF . (raise_expression . 1)) (IS . (raise_expression . 1)) (LOOP . (raise_expression . 1)) (OR . (raise_expression . 1)) (RANGE . (raise_expression . 1)) (THEN . (raise_expression . 1)) (WITH . ( 432 (raise_expression . 1))) (XOR . (raise_expression . 1)) (LEFT_PAREN .  235) (RIGHT_PAREN . (raise_expression . 1)) (BAR . (raise_expression . 1)) (COMMA . (raise_expression . 1)) (DOT .  237) (EQUAL_GREATER . (raise_expression . 1)) (SEMICOLON . (raise_expression . 1)) (TICK_1 .  239))
      ((default . error) (ABS .  121) (IS . (expression_opt . 1)) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ALL .  434) (SOME .  435))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (THEN . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (NEW .  122) (NULL .  438) (LEFT_PAREN .  126) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AND . (primary . 1)) (IN . (primary . 1)) (MOD . (primary . 1)) (NOT . (primary . 1)) (OR . (primary . 1)) (RECORD .  439) (REM . (primary . 1)) (WITH . (primary . 1)) (XOR . (primary . 1)) (RIGHT_PAREN . (primary . 1)) (AMPERSAND . (primary . 1)) (BAR . (primary . 1)) (COMMA . (primary . 1)) (DOT_DOT . (primary . 1)) (EQUAL . (primary . 1)) (EQUAL_GREATER . (primary . 1)) (GREATER . (primary . 1)) (GREATER_EQUAL . (primary . 1)) (LESS . (primary . 1)) (LESS_EQUAL . (primary . 1)) (MINUS . (primary . 1)) (PLUS . (primary . 1)) (SLASH . (primary . 1)) (SLASH_EQUAL . (primary . 1)) (STAR . (primary . 1)) (STAR_STAR . (primary . 1)))
      ((default . error) (BAR . (discrete_choice . 3)) (EQUAL_GREATER . (discrete_choice . 3)))
      ((default . error) (AND . (name . 6)) (IN . (name . 6)) (IS . (name . 6)) (MOD . (name . 6)) (NOT . (name . 6)) (OR . (name . 6)) (RANGE . (name . 6)) (REM . (name . 6)) (WITH . (name . 6)) (XOR . (name . 6)) (LEFT_PAREN . (name . 6)) (RIGHT_PAREN . (name . 6)) (AMPERSAND . (name . 6)) (BAR . (name . 6)) (COMMA . (name . 6)) (DOT . (name . 6)) (DOT_DOT . (name . 6)) (EQUAL . (name . 6)) (EQUAL_GREATER . ( 440 (name . 6))) (GREATER . (name . 6)) (GREATER_EQUAL . (name . 6)) (LESS . (name . 6)) (LESS_EQUAL . (name . 6)) (MINUS . (name . 6)) (PLUS . (name . 6)) (SEMICOLON . (name . 6)) (SLASH . (name . 6)) (SLASH_EQUAL . (name . 6)) (STAR . (name . 6)) (STAR_STAR . (name . 6)) (TICK_1 . (name . 6)))
      ((default . error) (IS . (association_list . 1)) (RIGHT_PAREN . (association_list . 1)) (COMMA . (association_list . 1)) (SEMICOLON . (association_list . 1)))
      ((default . error) (RIGHT_PAREN .  441) (COMMA .  442))
      ((default . error) (RIGHT_PAREN . (conditional_quantified_expression . 1)))
      ((default . error) (RIGHT_PAREN .  443))
      ((default . error) (BAR . (discrete_choice_list . 1)) (EQUAL_GREATER . (discrete_choice_list . 1)))
      ((default . error) (BAR .  444) (EQUAL_GREATER .  445))
      ((default . error) (WITH . (expression_opt . 0)) (RIGHT_PAREN . ((association_opt . 4) (expression_opt . 0))) (BAR . (discrete_choice . 0)) (COMMA . (association_opt . 4)) (EQUAL_GREATER . (discrete_choice . 0)))
      ((default . error) (WITH .  446))
      ((default . error) (RIGHT_PAREN . (conditional_quantified_expression . 0)))
      ((default . error) (AND . (primary . 3)) (DIGITS . (primary . 3)) (DO . (primary . 3)) (ELSE . (primary . 3)) (ELSIF . (primary . 3)) (IN . (primary . 3)) (IS . (primary . 3)) (LOOP . (primary . 3)) (MOD . (primary . 3)) (NOT . (primary . 3)) (OR . (primary . 3)) (RANGE . (primary . 3)) (REM . (primary . 3)) (THEN . (primary . 3)) (WITH . (primary . 3)) (XOR . (primary . 3)) (LEFT_PAREN .  235) (RIGHT_PAREN . (primary . 3)) (AMPERSAND . (primary . 3)) (BAR . (primary . 3)) (COMMA . (primary . 3)) (DOT .  237) (DOT_DOT . (primary . 3)) (EQUAL . (primary . 3)) (EQUAL_GREATER . (primary . 3)) (GREATER . (primary . 3)) (GREATER_EQUAL . (primary . 3)) (LESS . (primary . 3)) (LESS_EQUAL . (primary . 3)) (MINUS . (primary . 3)) (PLUS . (primary . 3)) (SEMICOLON . (primary . 3)) (SLASH . (primary . 3)) (SLASH_EQUAL . (primary . 3)) (STAR . (primary . 3)) (STAR_STAR . (primary . 3)) (TICK_1 .  239))
      ((default . error) (RIGHT_PAREN . (conditional_quantified_expression . 2)))
      ((default . error) (BAR . (discrete_choice . 2)) (EQUAL_GREATER . (discrete_choice . 2)))
      ((default . error) (AND . (relation . 3)) (IN .  287) (IS . (relation . 3)) (NOT .  288) (OR . (relation . 3)) (WITH . (relation . 3)) (XOR . (relation . 3)) (RIGHT_PAREN . (relation . 3)) (BAR . (relation . 3)) (COMMA . (relation . 3)) (DOT_DOT .  448) (EQUAL .  289) (EQUAL_GREATER . (relation . 3)) (GREATER .  290) (GREATER_EQUAL .  291) (LESS .  292) (LESS_EQUAL .  293) (SEMICOLON . (relation . 3)) (SLASH_EQUAL .  294))
      ((default . error) (WHEN .  449))
      ((default . error) (NEW .  122) (NULL .  124) (LEFT_PAREN .  126) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (THEN .  454))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ELSE .  456))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (THEN .  458) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (ELSE .  460) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IN .  467))
      ((default . error) (ABS . (relational_operator . 0)) (NEW . (relational_operator . 0)) (NOT . (relational_operator . 0)) (NULL . (relational_operator . 0)) (LEFT_PAREN . (relational_operator . 0)) (MINUS . (relational_operator . 0)) (PLUS . (relational_operator . 0)) (NUMERIC_LITERAL . (relational_operator . 0)) (IDENTIFIER . (relational_operator . 0)) (STRING_LITERAL . (relational_operator . 0)) (CHARACTER_LITERAL . (relational_operator . 0)))
      ((default . error) (ABS . (relational_operator . 4)) (NEW . (relational_operator . 4)) (NOT . (relational_operator . 4)) (NULL . (relational_operator . 4)) (LEFT_PAREN . (relational_operator . 4)) (MINUS . (relational_operator . 4)) (PLUS . (relational_operator . 4)) (NUMERIC_LITERAL . (relational_operator . 4)) (IDENTIFIER . (relational_operator . 4)) (STRING_LITERAL . (relational_operator . 4)) (CHARACTER_LITERAL . (relational_operator . 4)))
      ((default . error) (ABS . (relational_operator . 5)) (NEW . (relational_operator . 5)) (NOT . (relational_operator . 5)) (NULL . (relational_operator . 5)) (LEFT_PAREN . (relational_operator . 5)) (MINUS . (relational_operator . 5)) (PLUS . (relational_operator . 5)) (NUMERIC_LITERAL . (relational_operator . 5)) (IDENTIFIER . (relational_operator . 5)) (STRING_LITERAL . (relational_operator . 5)) (CHARACTER_LITERAL . (relational_operator . 5)))
      ((default . error) (ABS . (relational_operator . 2)) (NEW . (relational_operator . 2)) (NOT . (relational_operator . 2)) (NULL . (relational_operator . 2)) (LEFT_PAREN . (relational_operator . 2)) (MINUS . (relational_operator . 2)) (PLUS . (relational_operator . 2)) (NUMERIC_LITERAL . (relational_operator . 2)) (IDENTIFIER . (relational_operator . 2)) (STRING_LITERAL . (relational_operator . 2)) (CHARACTER_LITERAL . (relational_operator . 2)))
      ((default . error) (ABS . (relational_operator . 3)) (NEW . (relational_operator . 3)) (NOT . (relational_operator . 3)) (NULL . (relational_operator . 3)) (LEFT_PAREN . (relational_operator . 3)) (MINUS . (relational_operator . 3)) (PLUS . (relational_operator . 3)) (NUMERIC_LITERAL . (relational_operator . 3)) (IDENTIFIER . (relational_operator . 3)) (STRING_LITERAL . (relational_operator . 3)) (CHARACTER_LITERAL . (relational_operator . 3)))
      ((default . error) (ABS . (relational_operator . 1)) (NEW . (relational_operator . 1)) (NOT . (relational_operator . 1)) (NULL . (relational_operator . 1)) (LEFT_PAREN . (relational_operator . 1)) (MINUS . (relational_operator . 1)) (PLUS . (relational_operator . 1)) (NUMERIC_LITERAL . (relational_operator . 1)) (IDENTIFIER . (relational_operator . 1)) (STRING_LITERAL . (relational_operator . 1)) (CHARACTER_LITERAL . (relational_operator . 1)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS . (multiplying_operator . 2)) (NEW . (multiplying_operator . 2)) (NOT . (multiplying_operator . 2)) (NULL . (multiplying_operator . 2)) (LEFT_PAREN . (multiplying_operator . 2)) (NUMERIC_LITERAL . (multiplying_operator . 2)) (IDENTIFIER . (multiplying_operator . 2)) (STRING_LITERAL . (multiplying_operator . 2)) (CHARACTER_LITERAL . (multiplying_operator . 2)))
      ((default . error) (ABS . (multiplying_operator . 3)) (NEW . (multiplying_operator . 3)) (NOT . (multiplying_operator . 3)) (NULL . (multiplying_operator . 3)) (LEFT_PAREN . (multiplying_operator . 3)) (NUMERIC_LITERAL . (multiplying_operator . 3)) (IDENTIFIER . (multiplying_operator . 3)) (STRING_LITERAL . (multiplying_operator . 3)) (CHARACTER_LITERAL . (multiplying_operator . 3)))
      ((default . error) (ABS . (multiplying_operator . 1)) (NEW . (multiplying_operator . 1)) (NOT . (multiplying_operator . 1)) (NULL . (multiplying_operator . 1)) (LEFT_PAREN . (multiplying_operator . 1)) (NUMERIC_LITERAL . (multiplying_operator . 1)) (IDENTIFIER . (multiplying_operator . 1)) (STRING_LITERAL . (multiplying_operator . 1)) (CHARACTER_LITERAL . (multiplying_operator . 1)))
      ((default . error) (ABS . (multiplying_operator . 0)) (NEW . (multiplying_operator . 0)) (NOT . (multiplying_operator . 0)) (NULL . (multiplying_operator . 0)) (LEFT_PAREN . (multiplying_operator . 0)) (NUMERIC_LITERAL . (multiplying_operator . 0)) (IDENTIFIER . (multiplying_operator . 0)) (STRING_LITERAL . (multiplying_operator . 0)) (CHARACTER_LITERAL . (multiplying_operator . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS . (binary_adding_operator . 2)) (NEW . (binary_adding_operator . 2)) (NOT . (binary_adding_operator . 2)) (NULL . (binary_adding_operator . 2)) (LEFT_PAREN . (binary_adding_operator . 2)) (NUMERIC_LITERAL . (binary_adding_operator . 2)) (IDENTIFIER . (binary_adding_operator . 2)) (STRING_LITERAL . (binary_adding_operator . 2)) (CHARACTER_LITERAL . (binary_adding_operator . 2)))
      ((default . error) (ABS . (binary_adding_operator . 1)) (NEW . (binary_adding_operator . 1)) (NOT . (binary_adding_operator . 1)) (NULL . (binary_adding_operator . 1)) (LEFT_PAREN . (binary_adding_operator . 1)) (NUMERIC_LITERAL . (binary_adding_operator . 1)) (IDENTIFIER . (binary_adding_operator . 1)) (STRING_LITERAL . (binary_adding_operator . 1)) (CHARACTER_LITERAL . (binary_adding_operator . 1)))
      ((default . error) (ABS . (binary_adding_operator . 0)) (NEW . (binary_adding_operator . 0)) (NOT . (binary_adding_operator . 0)) (NULL . (binary_adding_operator . 0)) (LEFT_PAREN . (binary_adding_operator . 0)) (NUMERIC_LITERAL . (binary_adding_operator . 0)) (IDENTIFIER . (binary_adding_operator . 0)) (STRING_LITERAL . (binary_adding_operator . 0)) (CHARACTER_LITERAL . (binary_adding_operator . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AND . (simple_expression . 0)) (DIGITS . (simple_expression . 0)) (DO . (simple_expression . 0)) (ELSE . (simple_expression . 0)) (ELSIF . (simple_expression . 0)) (IN . (simple_expression . 0)) (IS . (simple_expression . 0)) (LOOP . (simple_expression . 0)) (NOT . (simple_expression . 0)) (OF . (simple_expression . 0)) (OR . (simple_expression . 0)) (RANGE . (simple_expression . 0)) (THEN . (simple_expression . 0)) (WITH . (simple_expression . 0)) (XOR . (simple_expression . 0)) (RIGHT_PAREN . (simple_expression . 0)) (AMPERSAND .  301) (BAR . (simple_expression . 0)) (COLON_EQUAL . (simple_expression . 0)) (COMMA . (simple_expression . 0)) (DOT_DOT . (simple_expression . 0)) (EQUAL . (simple_expression . 0)) (EQUAL_GREATER . (simple_expression . 0)) (GREATER . (simple_expression . 0)) (GREATER_EQUAL . (simple_expression . 0)) (LESS . (simple_expression . 0)) (LESS_EQUAL . (simple_expression . 0)) (MINUS .  302) (PLUS .  303) (SEMICOLON . (simple_expression . 0)) (SLASH_EQUAL . (simple_expression . 0)))
      ((default . error) (SEMICOLON .  471))
      ((default . error) (ACCEPT . (delay_statement . 1)) (ABORT . (delay_statement . 1)) (BEGIN . (delay_statement . 1)) (CASE . (delay_statement . 1)) (DECLARE . (delay_statement . 1)) (DELAY . (delay_statement . 1)) (ELSE . (delay_statement . 1)) (ELSIF . (delay_statement . 1)) (END . (delay_statement . 1)) (ENTRY . (delay_statement . 1)) (EXCEPTION . (delay_statement . 1)) (EXIT . (delay_statement . 1)) (FOR . (delay_statement . 1)) (FUNCTION . (delay_statement . 1)) (GENERIC . (delay_statement . 1)) (GOTO . (delay_statement . 1)) (IF . (delay_statement . 1)) (LIMITED . (delay_statement . 1)) (LOOP . (delay_statement . 1)) (NOT . (delay_statement . 1)) (NULL . (delay_statement . 1)) (OR . (delay_statement . 1)) (OVERRIDING . (delay_statement . 1)) (PACKAGE . (delay_statement . 1)) (PRAGMA . (delay_statement . 1)) (PRIVATE . (delay_statement . 1)) (PROCEDURE . (delay_statement . 1)) (PROTECTED . (delay_statement . 1)) (RAISE . (delay_statement . 1)) (REQUEUE . (delay_statement . 1)) (RETURN . (delay_statement . 1)) (SEPARATE . (delay_statement . 1)) (SELECT . (delay_statement . 1)) (SUBTYPE . (delay_statement . 1)) (TASK . (delay_statement . 1)) (THEN . (delay_statement . 1)) (TYPE . (delay_statement . 1)) (USE . (delay_statement . 1)) (WHEN . (delay_statement . 1)) (WHILE . (delay_statement . 1)) (WITH . (delay_statement . 1)) (LESS_LESS . (delay_statement . 1)) (IDENTIFIER . (delay_statement . 1)) (STRING_LITERAL . (delay_statement . 1)) (CHARACTER_LITERAL . (delay_statement . 1)) (Wisi_EOI . (delay_statement . 1)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (exit_statement . 1)) (ABORT . (exit_statement . 1)) (BEGIN . (exit_statement . 1)) (CASE . (exit_statement . 1)) (DECLARE . (exit_statement . 1)) (DELAY . (exit_statement . 1)) (ELSE . (exit_statement . 1)) (ELSIF . (exit_statement . 1)) (END . (exit_statement . 1)) (ENTRY . (exit_statement . 1)) (EXCEPTION . (exit_statement . 1)) (EXIT . (exit_statement . 1)) (FOR . (exit_statement . 1)) (FUNCTION . (exit_statement . 1)) (GENERIC . (exit_statement . 1)) (GOTO . (exit_statement . 1)) (IF . (exit_statement . 1)) (LIMITED . (exit_statement . 1)) (LOOP . (exit_statement . 1)) (NOT . (exit_statement . 1)) (NULL . (exit_statement . 1)) (OR . (exit_statement . 1)) (OVERRIDING . (exit_statement . 1)) (PACKAGE . (exit_statement . 1)) (PRAGMA . (exit_statement . 1)) (PRIVATE . (exit_statement . 1)) (PROCEDURE . (exit_statement . 1)) (PROTECTED . (exit_statement . 1)) (RAISE . (exit_statement . 1)) (REQUEUE . (exit_statement . 1)) (RETURN . (exit_statement . 1)) (SEPARATE . (exit_statement . 1)) (SELECT . (exit_statement . 1)) (SUBTYPE . (exit_statement . 1)) (TASK . (exit_statement . 1)) (THEN . (exit_statement . 1)) (TYPE . (exit_statement . 1)) (USE . (exit_statement . 1)) (WHEN . (exit_statement . 1)) (WHILE . (exit_statement . 1)) (WITH . (exit_statement . 1)) (LESS_LESS . (exit_statement . 1)) (IDENTIFIER . (exit_statement . 1)) (STRING_LITERAL . (exit_statement . 1)) (CHARACTER_LITERAL . (exit_statement . 1)) (Wisi_EOI . (exit_statement . 1)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  473) (NULL .  124) (REVERSE .  474) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (REVERSE .  480) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (NOT .  482) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AT .  486))
      ((default . error) (RECORD .  487) (LEFT_PAREN .  126))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (DO . (null_exclusion_opt . 1)) (IS . (null_exclusion_opt . 1)) (NOT .  385) (RENAMES . (null_exclusion_opt . 1)) (WITH . (null_exclusion_opt . 1)) (RIGHT_PAREN . (null_exclusion_opt . 1)) (COLON_EQUAL . (null_exclusion_opt . 1)) (SEMICOLON . (null_exclusion_opt . 1)) (IDENTIFIER . (null_exclusion_opt . 1)) (STRING_LITERAL . (null_exclusion_opt . 1)) (CHARACTER_LITERAL . (null_exclusion_opt . 1)))
      ((default . error) (ABS .  121) (CASE .  257) (FOR .  258) (IF .  259) (NEW .  122) (NOT .  260) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . ((association_opt . 5) (parameter_specification . 4))) (BAR . (discrete_choice_list . 2)) (COMMA . (association_opt . 5)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (SEMICOLON . (parameter_specification . 4)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  491) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  263))
      ((default . error) (RETURN .  316))
      ((default . error) (IS . (function_specification . 0)) (RENAMES . (function_specification . 0)) (WITH . (function_specification . 0)) (SEMICOLON . (function_specification . 0)))
      ((default . error) (DO . (parameter_and_result_profile . 1)) (IS . (parameter_and_result_profile . 1)) (RENAMES . (parameter_and_result_profile . 1)) (WITH . (parameter_and_result_profile . 1)) (RIGHT_PAREN . (parameter_and_result_profile . 1)) (COLON_EQUAL . (parameter_and_result_profile . 1)) (SEMICOLON . (parameter_and_result_profile . 1)))
      ((default . error) (RENAMES .  496) (LEFT_PAREN .  235) (DOT .  237) (TICK_1 .  239))
      ((default . error) (RENAMES .  497) (LEFT_PAREN .  235) (DOT .  237) (TICK_1 .  239))
      ((default . error) (RENAMES .  498) (LEFT_PAREN .  235) (DOT .  237) (TICK_1 .  239))
      ((default . error) (IS . (discriminant_part_opt . 2)) (WITH . (discriminant_part_opt . 2)) (LEFT_PAREN .  376) (SEMICOLON . (discriminant_part_opt . 2)))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IS .  501) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (FUNCTION . (generic_formal_parameter_declarations . 0)) (PACKAGE . (generic_formal_parameter_declarations . 0)) (PRAGMA . (generic_formal_parameter_declarations . 0)) (PROCEDURE . (generic_formal_parameter_declarations . 0)) (TYPE . (generic_formal_parameter_declarations . 0)) (USE . (generic_formal_parameter_declarations . 0)) (WITH . (generic_formal_parameter_declarations . 0)) (IDENTIFIER . (generic_formal_parameter_declarations . 0)))
      ((default . error) (ACCESS . (mode_opt . 3)) (IN .  503) (NOT . (mode_opt . 3)) (OUT .  504) (WITH . (mode_opt . 3)) (COLON_EQUAL . (mode_opt . 3)) (SEMICOLON . (mode_opt . 3)) (IDENTIFIER . (mode_opt . 3)) (STRING_LITERAL . (mode_opt . 3)) (CHARACTER_LITERAL . (mode_opt . 3)))
      ((default . error) (ACCEPT . (simple_statement . 3)) (ABORT . (simple_statement . 3)) (BEGIN . (simple_statement . 3)) (CASE . (simple_statement . 3)) (DECLARE . (simple_statement . 3)) (DELAY . (simple_statement . 3)) (ELSE . (simple_statement . 3)) (ELSIF . (simple_statement . 3)) (END . (simple_statement . 3)) (ENTRY . (simple_statement . 3)) (EXCEPTION . (simple_statement . 3)) (EXIT . (simple_statement . 3)) (FOR . (simple_statement . 3)) (FUNCTION . (simple_statement . 3)) (GENERIC . (simple_statement . 3)) (GOTO . (simple_statement . 3)) (IF . (simple_statement . 3)) (LIMITED . (simple_statement . 3)) (LOOP . (simple_statement . 3)) (NOT . (simple_statement . 3)) (NULL . (simple_statement . 3)) (OR . (simple_statement . 3)) (OVERRIDING . (simple_statement . 3)) (PACKAGE . (simple_statement . 3)) (PRAGMA . (simple_statement . 3)) (PRIVATE . (simple_statement . 3)) (PROCEDURE . (simple_statement . 3)) (PROTECTED . (simple_statement . 3)) (RAISE . (simple_statement . 3)) (REQUEUE . (simple_statement . 3)) (RETURN . (simple_statement . 3)) (SEPARATE . (simple_statement . 3)) (SELECT . (simple_statement . 3)) (SUBTYPE . (simple_statement . 3)) (TASK . (simple_statement . 3)) (THEN . (simple_statement . 3)) (TYPE . (simple_statement . 3)) (USE . (simple_statement . 3)) (WHEN . (simple_statement . 3)) (WHILE . (simple_statement . 3)) (WITH . (simple_statement . 3)) (LESS_LESS . (simple_statement . 3)) (IDENTIFIER . (simple_statement . 3)) (STRING_LITERAL . (simple_statement . 3)) (CHARACTER_LITERAL . (simple_statement . 3)) (Wisi_EOI . (simple_statement . 3)))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (ELSE . (sequence_of_statements_opt . 1)) (ELSIF . (sequence_of_statements_opt . 1)) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (COMMA .  380) (SEMICOLON .  508))
      ((default . error) (IS . ( 509 (aspect_specification_opt . 1))) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (TICK_1 .  239))
      ((default . error) (NEW .  511))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (IS . (association_opt . 5)) (NEW .  122) (NOT .  260) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (BAR . (discrete_choice_list . 2)) (COMMA . (association_opt . 5)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (SEMICOLON . (association_opt . 5)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  263))
      ((default . error) (IS .  514))
      ((default . error) (ABS .  121) (CASE .  257) (FOR .  258) (IF .  259) (NEW .  122) (NOT .  260) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (association_opt . 5)) (BAR . (discrete_choice_list . 2)) (COMMA . (association_opt . 5)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  263))
      ((default . error) (ACCEPT . (pragma_g . 2)) (ABORT . (pragma_g . 2)) (BEGIN . (pragma_g . 2)) (CASE . (pragma_g . 2)) (DECLARE . (pragma_g . 2)) (DELAY . (pragma_g . 2)) (ELSE . (pragma_g . 2)) (ELSIF . (pragma_g . 2)) (END . (pragma_g . 2)) (ENTRY . (pragma_g . 2)) (EXCEPTION . (pragma_g . 2)) (EXIT . (pragma_g . 2)) (FOR . (pragma_g . 2)) (FUNCTION . (pragma_g . 2)) (GENERIC . (pragma_g . 2)) (GOTO . (pragma_g . 2)) (IF . (pragma_g . 2)) (LIMITED . (pragma_g . 2)) (LOOP . (pragma_g . 2)) (NOT . (pragma_g . 2)) (NULL . (pragma_g . 2)) (OR . (pragma_g . 2)) (OVERRIDING . (pragma_g . 2)) (PACKAGE . (pragma_g . 2)) (PRAGMA . (pragma_g . 2)) (PRIVATE . (pragma_g . 2)) (PROCEDURE . (pragma_g . 2)) (PROTECTED . (pragma_g . 2)) (RAISE . (pragma_g . 2)) (REQUEUE . (pragma_g . 2)) (RETURN . (pragma_g . 2)) (SEPARATE . (pragma_g . 2)) (SELECT . (pragma_g . 2)) (SUBTYPE . (pragma_g . 2)) (TASK . (pragma_g . 2)) (THEN . (pragma_g . 2)) (TYPE . (pragma_g . 2)) (USE . (pragma_g . 2)) (WHEN . (pragma_g . 2)) (WHILE . (pragma_g . 2)) (WITH . (pragma_g . 2)) (LESS_LESS . (pragma_g . 2)) (IDENTIFIER . (pragma_g . 2)) (STRING_LITERAL . (pragma_g . 2)) (CHARACTER_LITERAL . (pragma_g . 2)) (Wisi_EOI . (pragma_g . 2)))
      ((default . error) (USE . ((direct_name . 0) (name . 5))) (LEFT_PAREN . (name . 5)) (DOT . (name . 5)) (TICK_1 . (name . 5)))
      ((default . error) (COMMA .  380) (SEMICOLON .  517))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (EXCEPTION .  384) (NOT .  385) (IDENTIFIER . (null_exclusion_opt . 1)) (STRING_LITERAL . (null_exclusion_opt . 1)) (CHARACTER_LITERAL . (null_exclusion_opt . 1)))
      ((default . error) (DO . (parameter_profile_opt . 0)) (IS . (parameter_profile_opt . 0)) (RENAMES . (parameter_profile_opt . 0)) (WHEN . (parameter_profile_opt . 0)) (WITH . (parameter_profile_opt . 0)) (RIGHT_PAREN . (parameter_profile_opt . 0)) (COLON_EQUAL . (parameter_profile_opt . 0)) (SEMICOLON . (parameter_profile_opt . 0)))
      ((default . error) (IS . (procedure_specification . 0)) (RENAMES . (procedure_specification . 0)) (WITH . (procedure_specification . 0)) (SEMICOLON . (procedure_specification . 0)))
      ((default . error) (IS . ( 518 (aspect_specification_opt . 1))) (WITH .  336))
      ((default . error) (IS . (discriminant_part_opt . 2)) (WITH . (discriminant_part_opt . 2)) (LEFT_PAREN .  376))
      ((default . error) (IS .  521))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (raise_statement . 1)) (ABORT . (raise_statement . 1)) (BEGIN . (raise_statement . 1)) (CASE . (raise_statement . 1)) (DECLARE . (raise_statement . 1)) (DELAY . (raise_statement . 1)) (ELSE . (raise_statement . 1)) (ELSIF . (raise_statement . 1)) (END . (raise_statement . 1)) (ENTRY . (raise_statement . 1)) (EXCEPTION . (raise_statement . 1)) (EXIT . (raise_statement . 1)) (FOR . (raise_statement . 1)) (FUNCTION . (raise_statement . 1)) (GENERIC . (raise_statement . 1)) (GOTO . (raise_statement . 1)) (IF . (raise_statement . 1)) (LIMITED . (raise_statement . 1)) (LOOP . (raise_statement . 1)) (NOT . (raise_statement . 1)) (NULL . (raise_statement . 1)) (OR . (raise_statement . 1)) (OVERRIDING . (raise_statement . 1)) (PACKAGE . (raise_statement . 1)) (PRAGMA . (raise_statement . 1)) (PRIVATE . (raise_statement . 1)) (PROCEDURE . (raise_statement . 1)) (PROTECTED . (raise_statement . 1)) (RAISE . (raise_statement . 1)) (REQUEUE . (raise_statement . 1)) (RETURN . (raise_statement . 1)) (SEPARATE . (raise_statement . 1)) (SELECT . (raise_statement . 1)) (SUBTYPE . (raise_statement . 1)) (TASK . (raise_statement . 1)) (THEN . (raise_statement . 1)) (TYPE . (raise_statement . 1)) (USE . (raise_statement . 1)) (WHEN . (raise_statement . 1)) (WHILE . (raise_statement . 1)) (WITH . (raise_statement . 1)) (LESS_LESS . (raise_statement . 1)) (IDENTIFIER . (raise_statement . 1)) (STRING_LITERAL . (raise_statement . 1)) (CHARACTER_LITERAL . (raise_statement . 1)) (Wisi_EOI . (raise_statement . 1)))
      ((default . error) (ABORT .  523))
      ((default . error) (ACCEPT . (requeue_statement . 1)) (ABORT . (requeue_statement . 1)) (BEGIN . (requeue_statement . 1)) (CASE . (requeue_statement . 1)) (DECLARE . (requeue_statement . 1)) (DELAY . (requeue_statement . 1)) (ELSE . (requeue_statement . 1)) (ELSIF . (requeue_statement . 1)) (END . (requeue_statement . 1)) (ENTRY . (requeue_statement . 1)) (EXCEPTION . (requeue_statement . 1)) (EXIT . (requeue_statement . 1)) (FOR . (requeue_statement . 1)) (FUNCTION . (requeue_statement . 1)) (GENERIC . (requeue_statement . 1)) (GOTO . (requeue_statement . 1)) (IF . (requeue_statement . 1)) (LIMITED . (requeue_statement . 1)) (LOOP . (requeue_statement . 1)) (NOT . (requeue_statement . 1)) (NULL . (requeue_statement . 1)) (OR . (requeue_statement . 1)) (OVERRIDING . (requeue_statement . 1)) (PACKAGE . (requeue_statement . 1)) (PRAGMA . (requeue_statement . 1)) (PRIVATE . (requeue_statement . 1)) (PROCEDURE . (requeue_statement . 1)) (PROTECTED . (requeue_statement . 1)) (RAISE . (requeue_statement . 1)) (REQUEUE . (requeue_statement . 1)) (RETURN . (requeue_statement . 1)) (SEPARATE . (requeue_statement . 1)) (SELECT . (requeue_statement . 1)) (SUBTYPE . (requeue_statement . 1)) (TASK . (requeue_statement . 1)) (THEN . (requeue_statement . 1)) (TYPE . (requeue_statement . 1)) (USE . (requeue_statement . 1)) (WHEN . (requeue_statement . 1)) (WHILE . (requeue_statement . 1)) (WITH . (requeue_statement . 1)) (LESS_LESS . (requeue_statement . 1)) (IDENTIFIER . (requeue_statement . 1)) (STRING_LITERAL . (requeue_statement . 1)) (CHARACTER_LITERAL . (requeue_statement . 1)) (Wisi_EOI . (requeue_statement . 1)))
      ((default . error) (ACCESS . (aliased_opt . 1)) (ALIASED .  400) (CONSTANT . (aliased_opt . 1)) (DO . (aliased_opt . 1)) (NOT . (aliased_opt . 1)) (COLON_EQUAL . (aliased_opt . 1)) (SEMICOLON . (aliased_opt . 1)) (IDENTIFIER . (aliased_opt . 1)) (STRING_LITERAL . (aliased_opt . 1)) (CHARACTER_LITERAL . (aliased_opt . 1)))
      ((default . error) (ACCEPT . (simple_return_statement . 0)) (ABORT . (simple_return_statement . 0)) (BEGIN . (simple_return_statement . 0)) (CASE . (simple_return_statement . 0)) (DECLARE . (simple_return_statement . 0)) (DELAY . (simple_return_statement . 0)) (ELSE . (simple_return_statement . 0)) (ELSIF . (simple_return_statement . 0)) (END . (simple_return_statement . 0)) (ENTRY . (simple_return_statement . 0)) (EXCEPTION . (simple_return_statement . 0)) (EXIT . (simple_return_statement . 0)) (FOR . (simple_return_statement . 0)) (FUNCTION . (simple_return_statement . 0)) (GENERIC . (simple_return_statement . 0)) (GOTO . (simple_return_statement . 0)) (IF . (simple_return_statement . 0)) (LIMITED . (simple_return_statement . 0)) (LOOP . (simple_return_statement . 0)) (NOT . (simple_return_statement . 0)) (NULL . (simple_return_statement . 0)) (OR . (simple_return_statement . 0)) (OVERRIDING . (simple_return_statement . 0)) (PACKAGE . (simple_return_statement . 0)) (PRAGMA . (simple_return_statement . 0)) (PRIVATE . (simple_return_statement . 0)) (PROCEDURE . (simple_return_statement . 0)) (PROTECTED . (simple_return_statement . 0)) (RAISE . (simple_return_statement . 0)) (REQUEUE . (simple_return_statement . 0)) (RETURN . (simple_return_statement . 0)) (SEPARATE . (simple_return_statement . 0)) (SELECT . (simple_return_statement . 0)) (SUBTYPE . (simple_return_statement . 0)) (TASK . (simple_return_statement . 0)) (THEN . (simple_return_statement . 0)) (TYPE . (simple_return_statement . 0)) (USE . (simple_return_statement . 0)) (WHEN . (simple_return_statement . 0)) (WHILE . (simple_return_statement . 0)) (WITH . (simple_return_statement . 0)) (LESS_LESS . (simple_return_statement . 0)) (IDENTIFIER . (simple_return_statement . 0)) (STRING_LITERAL . (simple_return_statement . 0)) (CHARACTER_LITERAL . (simple_return_statement . 0)) (Wisi_EOI . (simple_return_statement . 0)))
      ((default . error) (ACCEPT . (extended_return_statement . 1)) (ABORT . (extended_return_statement . 1)) (BEGIN . (extended_return_statement . 1)) (CASE . (extended_return_statement . 1)) (DECLARE . (extended_return_statement . 1)) (DELAY . (extended_return_statement . 1)) (ELSE . (extended_return_statement . 1)) (ELSIF . (extended_return_statement . 1)) (END . (extended_return_statement . 1)) (ENTRY . (extended_return_statement . 1)) (EXCEPTION . (extended_return_statement . 1)) (EXIT . (extended_return_statement . 1)) (FOR . (extended_return_statement . 1)) (FUNCTION . (extended_return_statement . 1)) (GENERIC . (extended_return_statement . 1)) (GOTO . (extended_return_statement . 1)) (IF . (extended_return_statement . 1)) (LIMITED . (extended_return_statement . 1)) (LOOP . (extended_return_statement . 1)) (NOT . (extended_return_statement . 1)) (NULL . (extended_return_statement . 1)) (OR . (extended_return_statement . 1)) (OVERRIDING . (extended_return_statement . 1)) (PACKAGE . (extended_return_statement . 1)) (PRAGMA . (extended_return_statement . 1)) (PRIVATE . (extended_return_statement . 1)) (PROCEDURE . (extended_return_statement . 1)) (PROTECTED . (extended_return_statement . 1)) (RAISE . (extended_return_statement . 1)) (REQUEUE . (extended_return_statement . 1)) (RETURN . (extended_return_statement . 1)) (SEPARATE . (extended_return_statement . 1)) (SELECT . (extended_return_statement . 1)) (SUBTYPE . (extended_return_statement . 1)) (TASK . (extended_return_statement . 1)) (THEN . (extended_return_statement . 1)) (TYPE . (extended_return_statement . 1)) (USE . (extended_return_statement . 1)) (WHEN . (extended_return_statement . 1)) (WHILE . (extended_return_statement . 1)) (WITH . (extended_return_statement . 1)) (LESS_LESS . (extended_return_statement . 1)) (IDENTIFIER . (extended_return_statement . 1)) (STRING_LITERAL . (extended_return_statement . 1)) (CHARACTER_LITERAL . (extended_return_statement . 1)) (Wisi_EOI . (extended_return_statement . 1)))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXCEPTION . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (LEFT_PAREN .  235) (RIGHT_PAREN .  526) (DOT .  237) (TICK_1 .  239))
      ((default . error) (ELSE . (select_alternative . 4)) (END . (select_alternative . 4)) (OR . (select_alternative . 4)))
      ((default . error) (EQUAL_GREATER .  527))
      ((default . error) (LEFT_PAREN . (name . 5)) (COLON .  528) (COLON_EQUAL . (name . 5)) (DOT . (name . 5)) (SEMICOLON . (name . 5)) (TICK_1 . (name . 5)))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (ELSE . (sequence_of_statements_opt . 0)) (ELSIF . (sequence_of_statements_opt . 0)) (END . (sequence_of_statements_opt . 0)) (EXCEPTION . (sequence_of_statements_opt . 0)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (OR . (sequence_of_statements_opt . 0)) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (THEN . (sequence_of_statements_opt . 0)) (WHEN . (sequence_of_statements_opt . 0)) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ELSE . (select_alternative . 3)) (END . (select_alternative . 3)) (OR . (select_alternative . 3)))
      ((default . error) (ACCEPT . (sequence_of_statements . 1)) (ABORT . (sequence_of_statements . 1)) (BEGIN . (sequence_of_statements . 1)) (CASE . (sequence_of_statements . 1)) (DECLARE . (sequence_of_statements . 1)) (DELAY . (sequence_of_statements . 1)) (ELSE . (sequence_of_statements . 1)) (ELSIF . (sequence_of_statements . 1)) (END . (sequence_of_statements . 1)) (EXCEPTION . (sequence_of_statements . 1)) (EXIT . (sequence_of_statements . 1)) (FOR . (sequence_of_statements . 1)) (GOTO . (sequence_of_statements . 1)) (IF . (sequence_of_statements . 1)) (LOOP . (sequence_of_statements . 1)) (NULL . (sequence_of_statements . 1)) (OR . (sequence_of_statements . 1)) (PRAGMA . (sequence_of_statements . 1)) (RAISE . (sequence_of_statements . 1)) (REQUEUE . (sequence_of_statements . 1)) (RETURN . (sequence_of_statements . 1)) (SELECT . (sequence_of_statements . 1)) (THEN . (sequence_of_statements . 1)) (WHEN . (sequence_of_statements . 1)) (WHILE . (sequence_of_statements . 1)) (LESS_LESS . (sequence_of_statements . 1)) (IDENTIFIER . (sequence_of_statements . 1)) (STRING_LITERAL . (sequence_of_statements . 1)) (CHARACTER_LITERAL . (sequence_of_statements . 1)))
      ((default . error) (ELSE . (delay_alternative . 0)) (END . (delay_alternative . 0)) (OR . (delay_alternative . 0)) (THEN . (triggering_alternative . 2)))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (DELAY .  4))
      ((default . error) (ELSE . (entry_call_alternative . 1)) (OR . (entry_call_alternative . 1)) (THEN . (triggering_alternative . 1)))
      ((default . error) (ELSE . (entry_call_alternative . 0)) (OR . (entry_call_alternative . 0)) (THEN . (triggering_alternative . 0)))
      ((default . error) (ACCEPT .  1) (DELAY .  4) (TERMINATE .  199) (WHEN .  200))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SELECT .  535))
      ((default . error) (ABORT .  536))
      ((default . error) (NOT .  482) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IS . ( 538 (aspect_specification_opt . 1))) (WITH .  336))
      ((default . error) (IS . (discriminant_part_opt . 2)) (WITH . (discriminant_part_opt . 2)) (LEFT_PAREN .  376) (SEMICOLON . (discriminant_part_opt . 2)))
      ((default . error) (IS .  541) (SEMICOLON .  542))
      ((default . error) (RIGHT_PAREN . (discriminant_specification_opt . 4)) (BOX .  543) (SEMICOLON . (discriminant_specification_opt . 4)) (IDENTIFIER .  164))
      ((default . error) (IS .  547) (SEMICOLON .  548))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (COMMA .  380) (SEMICOLON .  550))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (use_clause . 2)) (ABORT . (use_clause . 2)) (BEGIN . (use_clause . 2)) (CASE . (use_clause . 2)) (DECLARE . (use_clause . 2)) (DELAY . (use_clause . 2)) (END . (use_clause . 2)) (ENTRY . (use_clause . 2)) (EXIT . (use_clause . 2)) (FOR . (use_clause . 2)) (FUNCTION . (use_clause . 2)) (GENERIC . (use_clause . 2)) (GOTO . (use_clause . 2)) (IF . (use_clause . 2)) (LIMITED . (use_clause . 2)) (LOOP . (use_clause . 2)) (NOT . (use_clause . 2)) (NULL . (use_clause . 2)) (OVERRIDING . (use_clause . 2)) (PACKAGE . (use_clause . 2)) (PRAGMA . (use_clause . 2)) (PRIVATE . (use_clause . 2)) (PROCEDURE . (use_clause . 2)) (PROTECTED . (use_clause . 2)) (RAISE . (use_clause . 2)) (REQUEUE . (use_clause . 2)) (RETURN . (use_clause . 2)) (SEPARATE . (use_clause . 2)) (SELECT . (use_clause . 2)) (SUBTYPE . (use_clause . 2)) (TASK . (use_clause . 2)) (TYPE . (use_clause . 2)) (USE . (use_clause . 2)) (WHILE . (use_clause . 2)) (WITH . (use_clause . 2)) (LESS_LESS . (use_clause . 2)) (IDENTIFIER . (use_clause . 2)) (STRING_LITERAL . (use_clause . 2)) (CHARACTER_LITERAL . (use_clause . 2)) (Wisi_EOI . (use_clause . 2)))
      ((default . error) (ACCEPT . (with_clause . 3)) (ABORT . (with_clause . 3)) (BEGIN . (with_clause . 3)) (CASE . (with_clause . 3)) (DECLARE . (with_clause . 3)) (DELAY . (with_clause . 3)) (ENTRY . (with_clause . 3)) (EXIT . (with_clause . 3)) (FOR . (with_clause . 3)) (FUNCTION . (with_clause . 3)) (GENERIC . (with_clause . 3)) (GOTO . (with_clause . 3)) (IF . (with_clause . 3)) (LIMITED . (with_clause . 3)) (LOOP . (with_clause . 3)) (NOT . (with_clause . 3)) (NULL . (with_clause . 3)) (OVERRIDING . (with_clause . 3)) (PACKAGE . (with_clause . 3)) (PRAGMA . (with_clause . 3)) (PRIVATE . (with_clause . 3)) (PROCEDURE . (with_clause . 3)) (PROTECTED . (with_clause . 3)) (RAISE . (with_clause . 3)) (REQUEUE . (with_clause . 3)) (RETURN . (with_clause . 3)) (SEPARATE . (with_clause . 3)) (SELECT . (with_clause . 3)) (SUBTYPE . (with_clause . 3)) (TASK . (with_clause . 3)) (TYPE . (with_clause . 3)) (USE . (with_clause . 3)) (WHILE . (with_clause . 3)) (WITH . (with_clause . 3)) (LESS_LESS . (with_clause . 3)) (IDENTIFIER . (with_clause . 3)) (STRING_LITERAL . (with_clause . 3)) (CHARACTER_LITERAL . (with_clause . 3)) (Wisi_EOI . (with_clause . 3)))
      ((default . error) (ACCEPT . (goto_label . 0)) (ABORT . (goto_label . 0)) (BEGIN . (goto_label . 0)) (CASE . (goto_label . 0)) (DECLARE . (goto_label . 0)) (DELAY . (goto_label . 0)) (ELSE . (goto_label . 0)) (ELSIF . (goto_label . 0)) (END . (goto_label . 0)) (ENTRY . (goto_label . 0)) (EXCEPTION . (goto_label . 0)) (EXIT . (goto_label . 0)) (FOR . (goto_label . 0)) (FUNCTION . (goto_label . 0)) (GENERIC . (goto_label . 0)) (GOTO . (goto_label . 0)) (IF . (goto_label . 0)) (LIMITED . (goto_label . 0)) (LOOP . (goto_label . 0)) (NOT . (goto_label . 0)) (NULL . (goto_label . 0)) (OR . (goto_label . 0)) (OVERRIDING . (goto_label . 0)) (PACKAGE . (goto_label . 0)) (PRAGMA . (goto_label . 0)) (PRIVATE . (goto_label . 0)) (PROCEDURE . (goto_label . 0)) (PROTECTED . (goto_label . 0)) (RAISE . (goto_label . 0)) (REQUEUE . (goto_label . 0)) (RETURN . (goto_label . 0)) (SEPARATE . (goto_label . 0)) (SELECT . (goto_label . 0)) (SUBTYPE . (goto_label . 0)) (TASK . (goto_label . 0)) (THEN . (goto_label . 0)) (TYPE . (goto_label . 0)) (USE . (goto_label . 0)) (WHEN . (goto_label . 0)) (WHILE . (goto_label . 0)) (WITH . (goto_label . 0)) (LESS_LESS . (goto_label . 0)) (IDENTIFIER . (goto_label . 0)) (STRING_LITERAL . (goto_label . 0)) (CHARACTER_LITERAL . (goto_label . 0)) (Wisi_EOI . (goto_label . 0)))
      ((default . error) (RENAMES .  552))
      ((default . error) (NULL .  553))
      ((default . error) (RENAMES .  554))
      ((default . error) (ACCESS .  555) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (END .  557))
      ((default . error) (END . (handled_sequence_of_statements . 1)) (EXCEPTION .  558))
      ((default . error) (BEGIN . (declarations . 2)) (END . (declarations . 2)) (ENTRY . (declarations . 2)) (FOR . (declarations . 2)) (FUNCTION . (declarations . 2)) (GENERIC . (declarations . 2)) (NOT . (declarations . 2)) (OVERRIDING . (declarations . 2)) (PACKAGE . (declarations . 2)) (PRAGMA . (declarations . 2)) (PRIVATE . (declarations . 2)) (PROCEDURE . (declarations . 2)) (PROTECTED . (declarations . 2)) (SUBTYPE . (declarations . 2)) (TASK . (declarations . 2)) (TYPE . (declarations . 2)) (USE . (declarations . 2)) (IDENTIFIER . (declarations . 2)))
      ((default . error) (BEGIN . (declarative_part_opt . 0)) (END . (declarative_part_opt . 0)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PRIVATE . (declarative_part_opt . 0)) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (BEGIN .  561))
      ((default . error) (BEGIN . (declarations . 3)) (END . (declarations . 3)) (ENTRY . (declarations . 3)) (FOR . (declarations . 3)) (FUNCTION . (declarations . 3)) (GENERIC . (declarations . 3)) (NOT . (declarations . 3)) (OVERRIDING . (declarations . 3)) (PACKAGE . (declarations . 3)) (PRAGMA . (declarations . 3)) (PRIVATE . (declarations . 3)) (PROCEDURE . (declarations . 3)) (PROTECTED . (declarations . 3)) (SUBTYPE . (declarations . 3)) (TASK . (declarations . 3)) (TYPE . (declarations . 3)) (USE . (declarations . 3)) (IDENTIFIER . (declarations . 3)))
      ((default . error) (IN .  310) (OF .  311) (COLON .  312))
      ((default . error) (END .  562))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IS . (aspect_specification_opt . 1)) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (TICK_1 .  239))
      ((default . error) (ACCEPT . (generic_package_declaration . 0)) (ABORT . (generic_package_declaration . 0)) (BEGIN . (generic_package_declaration . 0)) (CASE . (generic_package_declaration . 0)) (DECLARE . (generic_package_declaration . 0)) (DELAY . (generic_package_declaration . 0)) (END . (generic_package_declaration . 0)) (ENTRY . (generic_package_declaration . 0)) (EXIT . (generic_package_declaration . 0)) (FOR . (generic_package_declaration . 0)) (FUNCTION . (generic_package_declaration . 0)) (GENERIC . (generic_package_declaration . 0)) (GOTO . (generic_package_declaration . 0)) (IF . (generic_package_declaration . 0)) (LIMITED . (generic_package_declaration . 0)) (LOOP . (generic_package_declaration . 0)) (NOT . (generic_package_declaration . 0)) (NULL . (generic_package_declaration . 0)) (OVERRIDING . (generic_package_declaration . 0)) (PACKAGE . (generic_package_declaration . 0)) (PRAGMA . (generic_package_declaration . 0)) (PRIVATE . (generic_package_declaration . 0)) (PROCEDURE . (generic_package_declaration . 0)) (PROTECTED . (generic_package_declaration . 0)) (RAISE . (generic_package_declaration . 0)) (REQUEUE . (generic_package_declaration . 0)) (RETURN . (generic_package_declaration . 0)) (SEPARATE . (generic_package_declaration . 0)) (SELECT . (generic_package_declaration . 0)) (SUBTYPE . (generic_package_declaration . 0)) (TASK . (generic_package_declaration . 0)) (TYPE . (generic_package_declaration . 0)) (USE . (generic_package_declaration . 0)) (WHILE . (generic_package_declaration . 0)) (WITH . (generic_package_declaration . 0)) (LESS_LESS . (generic_package_declaration . 0)) (IDENTIFIER . (generic_package_declaration . 0)) (STRING_LITERAL . (generic_package_declaration . 0)) (CHARACTER_LITERAL . (generic_package_declaration . 0)) (Wisi_EOI . (generic_package_declaration . 0)))
      ((default . error) (SEMICOLON .  564))
      ((default . error) (ACCESS . (aliased_opt . 0)) (ARRAY . (aliased_opt . 0)) (CONSTANT . (aliased_opt . 0)) (DO . (aliased_opt . 0)) (IN . (aliased_opt . 0)) (NOT . (aliased_opt . 0)) (OUT . (aliased_opt . 0)) (WITH . (aliased_opt . 0)) (RIGHT_PAREN . (aliased_opt . 0)) (COLON_EQUAL . (aliased_opt . 0)) (SEMICOLON . (aliased_opt . 0)) (IDENTIFIER . (aliased_opt . 0)) (STRING_LITERAL . (aliased_opt . 0)) (CHARACTER_LITERAL . (aliased_opt . 0)))
      ((default . error) (COLON_EQUAL .  565))
      ((default . error) (SEMICOLON .  566))
      ((default . error) (ACCESS . (constant_opt . 1)) (ARRAY . (constant_opt . 1)) (CONSTANT .  567) (NOT . (constant_opt . 1)) (WITH . (constant_opt . 1)) (COLON_EQUAL . (constant_opt . 1)) (SEMICOLON . (constant_opt . 1)) (IDENTIFIER . (constant_opt . 1)) (STRING_LITERAL . (constant_opt . 1)) (CHARACTER_LITERAL . (constant_opt . 1)))
      ((default . error) (COLON . (identifier_list . 0)) (COMMA . (identifier_list . 0)))
      ((default . error) (RIGHT_PAREN .  569) (COMMA .  442))
      ((default . error) (RIGHT_PAREN .  570))
      ((default . error) (IS . (association_opt . 4)) (RIGHT_PAREN . (association_opt . 4)) (BAR . (discrete_choice . 0)) (COMMA . (association_opt . 4)) (EQUAL_GREATER . (discrete_choice . 0)) (SEMICOLON . (association_opt . 4)))
      ((default . error) (RIGHT_PAREN . (range_list . 1)) (BAR . (discrete_choice . 2)) (COMMA . (range_list . 1)) (EQUAL_GREATER . (discrete_choice . 2)))
      ((default . error) (RIGHT_PAREN .  571) (COMMA .  572))
      ((default . error) (SEMICOLON .  573))
      ((default . error) (ACCEPT . (selected_component . 3)) (ABORT . (selected_component . 3)) (AND . (selected_component . 3)) (BEGIN . (selected_component . 3)) (CASE . (selected_component . 3)) (DECLARE . (selected_component . 3)) (DELAY . (selected_component . 3)) (DIGITS . (selected_component . 3)) (DO . (selected_component . 3)) (ELSE . (selected_component . 3)) (ELSIF . (selected_component . 3)) (EXIT . (selected_component . 3)) (FOR . (selected_component . 3)) (GOTO . (selected_component . 3)) (IF . (selected_component . 3)) (IN . (selected_component . 3)) (IS . (selected_component . 3)) (LOOP . (selected_component . 3)) (MOD . (selected_component . 3)) (NOT . (selected_component . 3)) (NULL . (selected_component . 3)) (OF . (selected_component . 3)) (OR . (selected_component . 3)) (PRAGMA . (selected_component . 3)) (RAISE . (selected_component . 3)) (RANGE . (selected_component . 3)) (REM . (selected_component . 3)) (RENAMES . (selected_component . 3)) (REQUEUE . (selected_component . 3)) (RETURN . (selected_component . 3)) (SELECT . (selected_component . 3)) (THEN . (selected_component . 3)) (USE . (selected_component . 3)) (WHILE . (selected_component . 3)) (WITH . (selected_component . 3)) (XOR . (selected_component . 3)) (LEFT_PAREN . (selected_component . 3)) (RIGHT_PAREN . (selected_component . 3)) (AMPERSAND . (selected_component . 3)) (BAR . (selected_component . 3)) (COLON_EQUAL . (selected_component . 3)) (COMMA . (selected_component . 3)) (DOT . (selected_component . 3)) (DOT_DOT . (selected_component . 3)) (EQUAL . (selected_component . 3)) (EQUAL_GREATER . (selected_component . 3)) (GREATER . (selected_component . 3)) (GREATER_EQUAL . (selected_component . 3)) (LESS . (selected_component . 3)) (LESS_EQUAL . (selected_component . 3)) (LESS_LESS . (selected_component . 3)) (MINUS . (selected_component . 3)) (PLUS . (selected_component . 3)) (SEMICOLON . (selected_component . 3)) (SLASH . (selected_component . 3)) (SLASH_EQUAL . (selected_component . 3)) (STAR . (selected_component . 3)) (STAR_STAR . (selected_component . 3)) (TICK_1 . (selected_component . 3)) (IDENTIFIER . (selected_component . 3)) (STRING_LITERAL . (selected_component . 3)) (CHARACTER_LITERAL . (selected_component . 3)))
      ((default . error) (ACCEPT . (selected_component . 0)) (ABORT . (selected_component . 0)) (AND . (selected_component . 0)) (BEGIN . (selected_component . 0)) (CASE . (selected_component . 0)) (DECLARE . (selected_component . 0)) (DELAY . (selected_component . 0)) (DIGITS . (selected_component . 0)) (DO . (selected_component . 0)) (ELSE . (selected_component . 0)) (ELSIF . (selected_component . 0)) (EXIT . (selected_component . 0)) (FOR . (selected_component . 0)) (GOTO . (selected_component . 0)) (IF . (selected_component . 0)) (IN . (selected_component . 0)) (IS . (selected_component . 0)) (LOOP . (selected_component . 0)) (MOD . (selected_component . 0)) (NOT . (selected_component . 0)) (NULL . (selected_component . 0)) (OF . (selected_component . 0)) (OR . (selected_component . 0)) (PRAGMA . (selected_component . 0)) (RAISE . (selected_component . 0)) (RANGE . (selected_component . 0)) (REM . (selected_component . 0)) (RENAMES . (selected_component . 0)) (REQUEUE . (selected_component . 0)) (RETURN . (selected_component . 0)) (SELECT . (selected_component . 0)) (THEN . (selected_component . 0)) (USE . (selected_component . 0)) (WHILE . (selected_component . 0)) (WITH . (selected_component . 0)) (XOR . (selected_component . 0)) (LEFT_PAREN . (selected_component . 0)) (RIGHT_PAREN . (selected_component . 0)) (AMPERSAND . (selected_component . 0)) (BAR . (selected_component . 0)) (COLON_EQUAL . (selected_component . 0)) (COMMA . (selected_component . 0)) (DOT . (selected_component . 0)) (DOT_DOT . (selected_component . 0)) (EQUAL . (selected_component . 0)) (EQUAL_GREATER . (selected_component . 0)) (GREATER . (selected_component . 0)) (GREATER_EQUAL . (selected_component . 0)) (LESS . (selected_component . 0)) (LESS_EQUAL . (selected_component . 0)) (LESS_LESS . (selected_component . 0)) (MINUS . (selected_component . 0)) (PLUS . (selected_component . 0)) (SEMICOLON . (selected_component . 0)) (SLASH . (selected_component . 0)) (SLASH_EQUAL . (selected_component . 0)) (STAR . (selected_component . 0)) (STAR_STAR . (selected_component . 0)) (TICK_1 . (selected_component . 0)) (IDENTIFIER . (selected_component . 0)) (STRING_LITERAL . (selected_component . 0)) (CHARACTER_LITERAL . (selected_component . 0)))
      ((default . error) (ACCEPT . (selected_component . 2)) (ABORT . (selected_component . 2)) (AND . (selected_component . 2)) (BEGIN . (selected_component . 2)) (CASE . (selected_component . 2)) (DECLARE . (selected_component . 2)) (DELAY . (selected_component . 2)) (DIGITS . (selected_component . 2)) (DO . (selected_component . 2)) (ELSE . (selected_component . 2)) (ELSIF . (selected_component . 2)) (EXIT . (selected_component . 2)) (FOR . (selected_component . 2)) (GOTO . (selected_component . 2)) (IF . (selected_component . 2)) (IN . (selected_component . 2)) (IS . (selected_component . 2)) (LOOP . (selected_component . 2)) (MOD . (selected_component . 2)) (NOT . (selected_component . 2)) (NULL . (selected_component . 2)) (OF . (selected_component . 2)) (OR . (selected_component . 2)) (PRAGMA . (selected_component . 2)) (RAISE . (selected_component . 2)) (RANGE . (selected_component . 2)) (REM . (selected_component . 2)) (RENAMES . (selected_component . 2)) (REQUEUE . (selected_component . 2)) (RETURN . (selected_component . 2)) (SELECT . (selected_component . 2)) (THEN . (selected_component . 2)) (USE . (selected_component . 2)) (WHILE . (selected_component . 2)) (WITH . (selected_component . 2)) (XOR . (selected_component . 2)) (LEFT_PAREN . (selected_component . 2)) (RIGHT_PAREN . (selected_component . 2)) (AMPERSAND . (selected_component . 2)) (BAR . (selected_component . 2)) (COLON_EQUAL . (selected_component . 2)) (COMMA . (selected_component . 2)) (DOT . (selected_component . 2)) (DOT_DOT . (selected_component . 2)) (EQUAL . (selected_component . 2)) (EQUAL_GREATER . (selected_component . 2)) (GREATER . (selected_component . 2)) (GREATER_EQUAL . (selected_component . 2)) (LESS . (selected_component . 2)) (LESS_EQUAL . (selected_component . 2)) (LESS_LESS . (selected_component . 2)) (MINUS . (selected_component . 2)) (PLUS . (selected_component . 2)) (SEMICOLON . (selected_component . 2)) (SLASH . (selected_component . 2)) (SLASH_EQUAL . (selected_component . 2)) (STAR . (selected_component . 2)) (STAR_STAR . (selected_component . 2)) (TICK_1 . (selected_component . 2)) (IDENTIFIER . (selected_component . 2)) (STRING_LITERAL . (selected_component . 2)) (CHARACTER_LITERAL . (selected_component . 2)))
      ((default . error) (ACCEPT . (selected_component . 1)) (ABORT . (selected_component . 1)) (AND . (selected_component . 1)) (BEGIN . (selected_component . 1)) (CASE . (selected_component . 1)) (DECLARE . (selected_component . 1)) (DELAY . (selected_component . 1)) (DIGITS . (selected_component . 1)) (DO . (selected_component . 1)) (ELSE . (selected_component . 1)) (ELSIF . (selected_component . 1)) (EXIT . (selected_component . 1)) (FOR . (selected_component . 1)) (GOTO . (selected_component . 1)) (IF . (selected_component . 1)) (IN . (selected_component . 1)) (IS . (selected_component . 1)) (LOOP . (selected_component . 1)) (MOD . (selected_component . 1)) (NOT . (selected_component . 1)) (NULL . (selected_component . 1)) (OF . (selected_component . 1)) (OR . (selected_component . 1)) (PRAGMA . (selected_component . 1)) (RAISE . (selected_component . 1)) (RANGE . (selected_component . 1)) (REM . (selected_component . 1)) (RENAMES . (selected_component . 1)) (REQUEUE . (selected_component . 1)) (RETURN . (selected_component . 1)) (SELECT . (selected_component . 1)) (THEN . (selected_component . 1)) (USE . (selected_component . 1)) (WHILE . (selected_component . 1)) (WITH . (selected_component . 1)) (XOR . (selected_component . 1)) (LEFT_PAREN . (selected_component . 1)) (RIGHT_PAREN . (selected_component . 1)) (AMPERSAND . (selected_component . 1)) (BAR . (selected_component . 1)) (COLON_EQUAL . (selected_component . 1)) (COMMA . (selected_component . 1)) (DOT . (selected_component . 1)) (DOT_DOT . (selected_component . 1)) (EQUAL . (selected_component . 1)) (EQUAL_GREATER . (selected_component . 1)) (GREATER . (selected_component . 1)) (GREATER_EQUAL . (selected_component . 1)) (LESS . (selected_component . 1)) (LESS_EQUAL . (selected_component . 1)) (LESS_LESS . (selected_component . 1)) (MINUS . (selected_component . 1)) (PLUS . (selected_component . 1)) (SEMICOLON . (selected_component . 1)) (SLASH . (selected_component . 1)) (SLASH_EQUAL . (selected_component . 1)) (STAR . (selected_component . 1)) (STAR_STAR . (selected_component . 1)) (TICK_1 . (selected_component . 1)) (IDENTIFIER . (selected_component . 1)) (STRING_LITERAL . (selected_component . 1)) (CHARACTER_LITERAL . (selected_component . 1)))
      ((default . error) (ACCEPT . (attribute_designator . 1)) (ABORT . (attribute_designator . 1)) (AND . (attribute_designator . 1)) (BEGIN . (attribute_designator . 1)) (CASE . (attribute_designator . 1)) (DECLARE . (attribute_designator . 1)) (DELAY . (attribute_designator . 1)) (DIGITS . (attribute_designator . 1)) (DO . (attribute_designator . 1)) (ELSE . (attribute_designator . 1)) (ELSIF . (attribute_designator . 1)) (EXIT . (attribute_designator . 1)) (FOR . (attribute_designator . 1)) (GOTO . (attribute_designator . 1)) (IF . (attribute_designator . 1)) (IN . (attribute_designator . 1)) (IS . (attribute_designator . 1)) (LOOP . (attribute_designator . 1)) (MOD . (attribute_designator . 1)) (NOT . (attribute_designator . 1)) (NULL . (attribute_designator . 1)) (OF . (attribute_designator . 1)) (OR . (attribute_designator . 1)) (PRAGMA . (attribute_designator . 1)) (RAISE . (attribute_designator . 1)) (RANGE . (attribute_designator . 1)) (REM . (attribute_designator . 1)) (RENAMES . (attribute_designator . 1)) (REQUEUE . (attribute_designator . 1)) (RETURN . (attribute_designator . 1)) (SELECT . (attribute_designator . 1)) (THEN . (attribute_designator . 1)) (USE . (attribute_designator . 1)) (WHILE . (attribute_designator . 1)) (WITH . (attribute_designator . 1)) (XOR . (attribute_designator . 1)) (LEFT_PAREN . (attribute_designator . 1)) (RIGHT_PAREN . (attribute_designator . 1)) (AMPERSAND . (attribute_designator . 1)) (BAR . (attribute_designator . 1)) (COLON_EQUAL . (attribute_designator . 1)) (COMMA . (attribute_designator . 1)) (DOT . (attribute_designator . 1)) (DOT_DOT . (attribute_designator . 1)) (EQUAL . (attribute_designator . 1)) (EQUAL_GREATER . (attribute_designator . 1)) (GREATER . (attribute_designator . 1)) (GREATER_EQUAL . (attribute_designator . 1)) (LESS . (attribute_designator . 1)) (LESS_EQUAL . (attribute_designator . 1)) (LESS_LESS . (attribute_designator . 1)) (MINUS . (attribute_designator . 1)) (PLUS . (attribute_designator . 1)) (SEMICOLON . (attribute_designator . 1)) (SLASH . (attribute_designator . 1)) (SLASH_EQUAL . (attribute_designator . 1)) (STAR . (attribute_designator . 1)) (STAR_STAR . (attribute_designator . 1)) (TICK_1 . (attribute_designator . 1)) (IDENTIFIER . (attribute_designator . 1)) (STRING_LITERAL . (attribute_designator . 1)) (CHARACTER_LITERAL . (attribute_designator . 1)))
      ((default . error) (ACCEPT . (attribute_designator . 2)) (ABORT . (attribute_designator . 2)) (AND . (attribute_designator . 2)) (BEGIN . (attribute_designator . 2)) (CASE . (attribute_designator . 2)) (DECLARE . (attribute_designator . 2)) (DELAY . (attribute_designator . 2)) (DIGITS . (attribute_designator . 2)) (DO . (attribute_designator . 2)) (ELSE . (attribute_designator . 2)) (ELSIF . (attribute_designator . 2)) (EXIT . (attribute_designator . 2)) (FOR . (attribute_designator . 2)) (GOTO . (attribute_designator . 2)) (IF . (attribute_designator . 2)) (IN . (attribute_designator . 2)) (IS . (attribute_designator . 2)) (LOOP . (attribute_designator . 2)) (MOD . (attribute_designator . 2)) (NOT . (attribute_designator . 2)) (NULL . (attribute_designator . 2)) (OF . (attribute_designator . 2)) (OR . (attribute_designator . 2)) (PRAGMA . (attribute_designator . 2)) (RAISE . (attribute_designator . 2)) (RANGE . (attribute_designator . 2)) (REM . (attribute_designator . 2)) (RENAMES . (attribute_designator . 2)) (REQUEUE . (attribute_designator . 2)) (RETURN . (attribute_designator . 2)) (SELECT . (attribute_designator . 2)) (THEN . (attribute_designator . 2)) (USE . (attribute_designator . 2)) (WHILE . (attribute_designator . 2)) (WITH . (attribute_designator . 2)) (XOR . (attribute_designator . 2)) (LEFT_PAREN . (attribute_designator . 2)) (RIGHT_PAREN . (attribute_designator . 2)) (AMPERSAND . (attribute_designator . 2)) (BAR . (attribute_designator . 2)) (COLON_EQUAL . (attribute_designator . 2)) (COMMA . (attribute_designator . 2)) (DOT . (attribute_designator . 2)) (DOT_DOT . (attribute_designator . 2)) (EQUAL . (attribute_designator . 2)) (EQUAL_GREATER . (attribute_designator . 2)) (GREATER . (attribute_designator . 2)) (GREATER_EQUAL . (attribute_designator . 2)) (LESS . (attribute_designator . 2)) (LESS_EQUAL . (attribute_designator . 2)) (LESS_LESS . (attribute_designator . 2)) (MINUS . (attribute_designator . 2)) (PLUS . (attribute_designator . 2)) (SEMICOLON . (attribute_designator . 2)) (SLASH . (attribute_designator . 2)) (SLASH_EQUAL . (attribute_designator . 2)) (STAR . (attribute_designator . 2)) (STAR_STAR . (attribute_designator . 2)) (TICK_1 . (attribute_designator . 2)) (IDENTIFIER . (attribute_designator . 2)) (STRING_LITERAL . (attribute_designator . 2)) (CHARACTER_LITERAL . (attribute_designator . 2)))
      ((default . error) (ACCEPT . (attribute_designator . 3)) (ABORT . (attribute_designator . 3)) (AND . (attribute_designator . 3)) (BEGIN . (attribute_designator . 3)) (CASE . (attribute_designator . 3)) (DECLARE . (attribute_designator . 3)) (DELAY . (attribute_designator . 3)) (DIGITS . (attribute_designator . 3)) (DO . (attribute_designator . 3)) (ELSE . (attribute_designator . 3)) (ELSIF . (attribute_designator . 3)) (EXIT . (attribute_designator . 3)) (FOR . (attribute_designator . 3)) (GOTO . (attribute_designator . 3)) (IF . (attribute_designator . 3)) (IN . (attribute_designator . 3)) (IS . (attribute_designator . 3)) (LOOP . (attribute_designator . 3)) (MOD . (attribute_designator . 3)) (NOT . (attribute_designator . 3)) (NULL . (attribute_designator . 3)) (OF . (attribute_designator . 3)) (OR . (attribute_designator . 3)) (PRAGMA . (attribute_designator . 3)) (RAISE . (attribute_designator . 3)) (RANGE . (attribute_designator . 3)) (REM . (attribute_designator . 3)) (RENAMES . (attribute_designator . 3)) (REQUEUE . (attribute_designator . 3)) (RETURN . (attribute_designator . 3)) (SELECT . (attribute_designator . 3)) (THEN . (attribute_designator . 3)) (USE . (attribute_designator . 3)) (WHILE . (attribute_designator . 3)) (WITH . (attribute_designator . 3)) (XOR . (attribute_designator . 3)) (LEFT_PAREN . (attribute_designator . 3)) (RIGHT_PAREN . (attribute_designator . 3)) (AMPERSAND . (attribute_designator . 3)) (BAR . (attribute_designator . 3)) (COLON_EQUAL . (attribute_designator . 3)) (COMMA . (attribute_designator . 3)) (DOT . (attribute_designator . 3)) (DOT_DOT . (attribute_designator . 3)) (EQUAL . (attribute_designator . 3)) (EQUAL_GREATER . (attribute_designator . 3)) (GREATER . (attribute_designator . 3)) (GREATER_EQUAL . (attribute_designator . 3)) (LESS . (attribute_designator . 3)) (LESS_EQUAL . (attribute_designator . 3)) (LESS_LESS . (attribute_designator . 3)) (MINUS . (attribute_designator . 3)) (PLUS . (attribute_designator . 3)) (SEMICOLON . (attribute_designator . 3)) (SLASH . (attribute_designator . 3)) (SLASH_EQUAL . (attribute_designator . 3)) (STAR . (attribute_designator . 3)) (STAR_STAR . (attribute_designator . 3)) (TICK_1 . (attribute_designator . 3)) (IDENTIFIER . (attribute_designator . 3)) (STRING_LITERAL . (attribute_designator . 3)) (CHARACTER_LITERAL . (attribute_designator . 3)))
      ((default . error) (ACCEPT . (attribute_designator . 4)) (ABORT . (attribute_designator . 4)) (AND . (attribute_designator . 4)) (BEGIN . (attribute_designator . 4)) (CASE . (attribute_designator . 4)) (DECLARE . (attribute_designator . 4)) (DELAY . (attribute_designator . 4)) (DIGITS . (attribute_designator . 4)) (DO . (attribute_designator . 4)) (ELSE . (attribute_designator . 4)) (ELSIF . (attribute_designator . 4)) (EXIT . (attribute_designator . 4)) (FOR . (attribute_designator . 4)) (GOTO . (attribute_designator . 4)) (IF . (attribute_designator . 4)) (IN . (attribute_designator . 4)) (IS . (attribute_designator . 4)) (LOOP . (attribute_designator . 4)) (MOD . (attribute_designator . 4)) (NOT . (attribute_designator . 4)) (NULL . (attribute_designator . 4)) (OF . (attribute_designator . 4)) (OR . (attribute_designator . 4)) (PRAGMA . (attribute_designator . 4)) (RAISE . (attribute_designator . 4)) (RANGE . (attribute_designator . 4)) (REM . (attribute_designator . 4)) (RENAMES . (attribute_designator . 4)) (REQUEUE . (attribute_designator . 4)) (RETURN . (attribute_designator . 4)) (SELECT . (attribute_designator . 4)) (THEN . (attribute_designator . 4)) (USE . (attribute_designator . 4)) (WHILE . (attribute_designator . 4)) (WITH . (attribute_designator . 4)) (XOR . (attribute_designator . 4)) (LEFT_PAREN . (attribute_designator . 4)) (RIGHT_PAREN . (attribute_designator . 4)) (AMPERSAND . (attribute_designator . 4)) (BAR . (attribute_designator . 4)) (COLON_EQUAL . (attribute_designator . 4)) (COMMA . (attribute_designator . 4)) (DOT . (attribute_designator . 4)) (DOT_DOT . (attribute_designator . 4)) (EQUAL . (attribute_designator . 4)) (EQUAL_GREATER . (attribute_designator . 4)) (GREATER . (attribute_designator . 4)) (GREATER_EQUAL . (attribute_designator . 4)) (LESS . (attribute_designator . 4)) (LESS_EQUAL . (attribute_designator . 4)) (LESS_LESS . (attribute_designator . 4)) (MINUS . (attribute_designator . 4)) (PLUS . (attribute_designator . 4)) (SEMICOLON . (attribute_designator . 4)) (SLASH . (attribute_designator . 4)) (SLASH_EQUAL . (attribute_designator . 4)) (STAR . (attribute_designator . 4)) (STAR_STAR . (attribute_designator . 4)) (TICK_1 . (attribute_designator . 4)) (IDENTIFIER . (attribute_designator . 4)) (STRING_LITERAL . (attribute_designator . 4)) (CHARACTER_LITERAL . (attribute_designator . 4)))
      ((default . error) (ACCEPT . (qualified_expression . 0)) (ABORT . (qualified_expression . 0)) (AND . (qualified_expression . 0)) (BEGIN . (qualified_expression . 0)) (CASE . (qualified_expression . 0)) (DECLARE . (qualified_expression . 0)) (DELAY . (qualified_expression . 0)) (DIGITS . (qualified_expression . 0)) (DO . (qualified_expression . 0)) (ELSE . (qualified_expression . 0)) (ELSIF . (qualified_expression . 0)) (EXIT . (qualified_expression . 0)) (FOR . (qualified_expression . 0)) (GOTO . (qualified_expression . 0)) (IF . (qualified_expression . 0)) (IN . (qualified_expression . 0)) (IS . (qualified_expression . 0)) (LOOP . (qualified_expression . 0)) (MOD . (qualified_expression . 0)) (NOT . (qualified_expression . 0)) (NULL . (qualified_expression . 0)) (OF . (qualified_expression . 0)) (OR . (qualified_expression . 0)) (PRAGMA . (qualified_expression . 0)) (RAISE . (qualified_expression . 0)) (RANGE . (qualified_expression . 0)) (REM . (qualified_expression . 0)) (RENAMES . (qualified_expression . 0)) (REQUEUE . (qualified_expression . 0)) (RETURN . (qualified_expression . 0)) (SELECT . (qualified_expression . 0)) (THEN . (qualified_expression . 0)) (USE . (qualified_expression . 0)) (WHILE . (qualified_expression . 0)) (WITH . (qualified_expression . 0)) (XOR . (qualified_expression . 0)) (LEFT_PAREN . (qualified_expression . 0)) (RIGHT_PAREN . (qualified_expression . 0)) (AMPERSAND . (qualified_expression . 0)) (BAR . (qualified_expression . 0)) (COLON_EQUAL . (qualified_expression . 0)) (COMMA . (qualified_expression . 0)) (DOT . (qualified_expression . 0)) (DOT_DOT . (qualified_expression . 0)) (EQUAL . (qualified_expression . 0)) (EQUAL_GREATER . (qualified_expression . 0)) (GREATER . (qualified_expression . 0)) (GREATER_EQUAL . (qualified_expression . 0)) (LESS . (qualified_expression . 0)) (LESS_EQUAL . (qualified_expression . 0)) (LESS_LESS . (qualified_expression . 0)) (MINUS . (qualified_expression . 0)) (PLUS . (qualified_expression . 0)) (SEMICOLON . (qualified_expression . 0)) (SLASH . (qualified_expression . 0)) (SLASH_EQUAL . (qualified_expression . 0)) (STAR . (qualified_expression . 0)) (STAR_STAR . (qualified_expression . 0)) (TICK_1 . (qualified_expression . 0)) (IDENTIFIER . (qualified_expression . 0)) (STRING_LITERAL . (qualified_expression . 0)) (CHARACTER_LITERAL . (qualified_expression . 0)))
      ((default . error) (ACCEPT . (attribute_reference . 0)) (ABORT . (attribute_reference . 0)) (AND . (attribute_reference . 0)) (BEGIN . (attribute_reference . 0)) (CASE . (attribute_reference . 0)) (DECLARE . (attribute_reference . 0)) (DELAY . (attribute_reference . 0)) (DIGITS . (attribute_reference . 0)) (DO . (attribute_reference . 0)) (ELSE . (attribute_reference . 0)) (ELSIF . (attribute_reference . 0)) (EXIT . (attribute_reference . 0)) (FOR . (attribute_reference . 0)) (GOTO . (attribute_reference . 0)) (IF . (attribute_reference . 0)) (IN . (attribute_reference . 0)) (IS . (attribute_reference . 0)) (LOOP . (attribute_reference . 0)) (MOD . (attribute_reference . 0)) (NOT . (attribute_reference . 0)) (NULL . (attribute_reference . 0)) (OF . (attribute_reference . 0)) (OR . (attribute_reference . 0)) (PRAGMA . (attribute_reference . 0)) (RAISE . (attribute_reference . 0)) (RANGE . (attribute_reference . 0)) (REM . (attribute_reference . 0)) (RENAMES . (attribute_reference . 0)) (REQUEUE . (attribute_reference . 0)) (RETURN . (attribute_reference . 0)) (SELECT . (attribute_reference . 0)) (THEN . (attribute_reference . 0)) (USE . (attribute_reference . 0)) (WHILE . (attribute_reference . 0)) (WITH . (attribute_reference . 0)) (XOR . (attribute_reference . 0)) (LEFT_PAREN . (attribute_reference . 0)) (RIGHT_PAREN . (attribute_reference . 0)) (AMPERSAND . (attribute_reference . 0)) (BAR . (attribute_reference . 0)) (COLON_EQUAL . (attribute_reference . 0)) (COMMA . (attribute_reference . 0)) (DOT . (attribute_reference . 0)) (DOT_DOT . (attribute_reference . 0)) (EQUAL . (attribute_reference . 0)) (EQUAL_GREATER . (attribute_reference . 0)) (GREATER . (attribute_reference . 0)) (GREATER_EQUAL . (attribute_reference . 0)) (LESS . (attribute_reference . 0)) (LESS_EQUAL . (attribute_reference . 0)) (LESS_LESS . (attribute_reference . 0)) (MINUS . (attribute_reference . 0)) (PLUS . (attribute_reference . 0)) (SEMICOLON . (attribute_reference . 0)) (SLASH . (attribute_reference . 0)) (SLASH_EQUAL . (attribute_reference . 0)) (STAR . (attribute_reference . 0)) (STAR_STAR . (attribute_reference . 0)) (TICK_1 . (attribute_reference . 0)) (IDENTIFIER . (attribute_reference . 0)) (STRING_LITERAL . (attribute_reference . 0)) (CHARACTER_LITERAL . (attribute_reference . 0)))
      ((default . error) (ACCEPT . (attribute_designator . 0)) (ABORT . (attribute_designator . 0)) (AND . (attribute_designator . 0)) (BEGIN . (attribute_designator . 0)) (CASE . (attribute_designator . 0)) (DECLARE . (attribute_designator . 0)) (DELAY . (attribute_designator . 0)) (DIGITS . (attribute_designator . 0)) (DO . (attribute_designator . 0)) (ELSE . (attribute_designator . 0)) (ELSIF . (attribute_designator . 0)) (EXIT . (attribute_designator . 0)) (FOR . (attribute_designator . 0)) (GOTO . (attribute_designator . 0)) (IF . (attribute_designator . 0)) (IN . (attribute_designator . 0)) (IS . (attribute_designator . 0)) (LOOP . (attribute_designator . 0)) (MOD . (attribute_designator . 0)) (NOT . (attribute_designator . 0)) (NULL . (attribute_designator . 0)) (OF . (attribute_designator . 0)) (OR . (attribute_designator . 0)) (PRAGMA . (attribute_designator . 0)) (RAISE . (attribute_designator . 0)) (RANGE . (attribute_designator . 0)) (REM . (attribute_designator . 0)) (RENAMES . (attribute_designator . 0)) (REQUEUE . (attribute_designator . 0)) (RETURN . (attribute_designator . 0)) (SELECT . (attribute_designator . 0)) (THEN . (attribute_designator . 0)) (USE . (attribute_designator . 0)) (WHILE . (attribute_designator . 0)) (WITH . (attribute_designator . 0)) (XOR . (attribute_designator . 0)) (LEFT_PAREN . ( 235 (attribute_designator . 0))) (RIGHT_PAREN . (attribute_designator . 0)) (AMPERSAND . (attribute_designator . 0)) (BAR . (attribute_designator . 0)) (COLON_EQUAL . (attribute_designator . 0)) (COMMA . (attribute_designator . 0)) (DOT . ( 237 (attribute_designator . 0))) (DOT_DOT . (attribute_designator . 0)) (EQUAL . (attribute_designator . 0)) (EQUAL_GREATER . (attribute_designator . 0)) (GREATER . (attribute_designator . 0)) (GREATER_EQUAL . (attribute_designator . 0)) (LESS . (attribute_designator . 0)) (LESS_EQUAL . (attribute_designator . 0)) (LESS_LESS . (attribute_designator . 0)) (MINUS . (attribute_designator . 0)) (PLUS . (attribute_designator . 0)) (SEMICOLON . (attribute_designator . 0)) (SLASH . (attribute_designator . 0)) (SLASH_EQUAL . (attribute_designator . 0)) (STAR . (attribute_designator . 0)) (STAR_STAR . (attribute_designator . 0)) (TICK_1 . ( 239 (attribute_designator . 0))) (IDENTIFIER . (attribute_designator . 0)) (STRING_LITERAL . (attribute_designator . 0)) (CHARACTER_LITERAL . (attribute_designator . 0)))
      ((default . error) (WITH . (parameter_profile_opt . 1)) (LEFT_PAREN .  574) (SEMICOLON . (parameter_profile_opt . 1)))
      ((default . error) (IS .  576) (RETURN .  316) (LEFT_PAREN .  317) (DOT .  237) (TICK_1 .  239))
      ((default . error) (IS . ( 577 (parameter_profile_opt . 1))) (RENAMES . (parameter_profile_opt . 1)) (WITH . (parameter_profile_opt . 1)) (LEFT_PAREN .  317) (DOT .  237) (SEMICOLON . (parameter_profile_opt . 1)) (TICK_1 .  239))
      ((default . error) (LEFT_PAREN .  578))
      ((default . error) (NULL .  580))
      ((default . error) (ABSTRACT .  581) (SEPARATE .  582))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IS .  584) (SEMICOLON .  585))
      ((default . error) (RIGHT_PAREN . (parameter_specification . 4)) (SEMICOLON . (parameter_specification . 4)) (IDENTIFIER .  164))
      ((default . error) (DO .  586) (SEMICOLON .  587))
      ((default . error) (ABS .  121) (AND . (expression_opt . 1)) (DIGITS . (expression_opt . 1)) (DO . (expression_opt . 1)) (ELSE . (expression_opt . 1)) (ELSIF . (expression_opt . 1)) (IS . (expression_opt . 1)) (LOOP . (expression_opt . 1)) (NEW .  122) (NOT .  123) (NULL .  124) (OR . (expression_opt . 1)) (RAISE .  125) (RANGE . (expression_opt . 1)) (THEN . (expression_opt . 1)) (WITH . (expression_opt . 1)) (XOR . (expression_opt . 1)) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (BAR . (expression_opt . 1)) (COMMA . (expression_opt . 1)) (EQUAL_GREATER . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IS .  589))
      ((default . error) (IDENTIFIER . (quantifier . 0)))
      ((default . error) (IDENTIFIER . (quantifier . 1)))
      ((default . error) (IDENTIFIER .  394))
      ((default . error) (THEN .  591))
      ((default . error) (AND . (primary . 1)) (IN . (primary . 1)) (IS . (primary . 1)) (MOD . (primary . 1)) (NOT . (primary . 1)) (OR . (primary . 1)) (REM . (primary . 1)) (WITH . (primary . 1)) (XOR . (primary . 1)) (RIGHT_PAREN . (primary . 1)) (AMPERSAND . (primary . 1)) (BAR . (primary . 1)) (COMMA . (primary . 1)) (DOT_DOT . (primary . 1)) (EQUAL . (primary . 1)) (EQUAL_GREATER . (primary . 1)) (GREATER . (primary . 1)) (GREATER_EQUAL . (primary . 1)) (LESS . (primary . 1)) (LESS_EQUAL . (primary . 1)) (MINUS . (primary . 1)) (PLUS . (primary . 1)) (SEMICOLON . (primary . 1)) (SLASH . (primary . 1)) (SLASH_EQUAL . (primary . 1)) (STAR . (primary . 1)) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (RIGHT_PAREN .  593))
      ((default . error) (ABS .  121) (IS . (expression_opt . 1)) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (BOX .  594) (COMMA . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (aggregate . 4)) (ABORT . (aggregate . 4)) (AND . (aggregate . 4)) (BEGIN . (aggregate . 4)) (CASE . (aggregate . 4)) (DECLARE . (aggregate . 4)) (DELAY . (aggregate . 4)) (DIGITS . (aggregate . 4)) (DO . (aggregate . 4)) (ELSE . (aggregate . 4)) (ELSIF . (aggregate . 4)) (EXIT . (aggregate . 4)) (FOR . (aggregate . 4)) (GOTO . (aggregate . 4)) (IF . (aggregate . 4)) (IN . (aggregate . 4)) (IS . (aggregate . 4)) (LOOP . (aggregate . 4)) (MOD . (aggregate . 4)) (NOT . (aggregate . 4)) (NULL . (aggregate . 4)) (OF . (aggregate . 4)) (OR . (aggregate . 4)) (PRAGMA . (aggregate . 4)) (RAISE . (aggregate . 4)) (RANGE . (aggregate . 4)) (REM . (aggregate . 4)) (RENAMES . (aggregate . 4)) (REQUEUE . (aggregate . 4)) (RETURN . (aggregate . 4)) (SELECT . (aggregate . 4)) (THEN . (aggregate . 4)) (USE . (aggregate . 4)) (WHILE . (aggregate . 4)) (WITH . (aggregate . 4)) (XOR . (aggregate . 4)) (LEFT_PAREN . (aggregate . 4)) (RIGHT_PAREN . (aggregate . 4)) (AMPERSAND . (aggregate . 4)) (BAR . (aggregate . 4)) (COLON_EQUAL . (aggregate . 4)) (COMMA . (aggregate . 4)) (DOT . (aggregate . 4)) (DOT_DOT . (aggregate . 4)) (EQUAL . (aggregate . 4)) (EQUAL_GREATER . (aggregate . 4)) (GREATER . (aggregate . 4)) (GREATER_EQUAL . (aggregate . 4)) (LESS . (aggregate . 4)) (LESS_EQUAL . (aggregate . 4)) (LESS_LESS . (aggregate . 4)) (MINUS . (aggregate . 4)) (PLUS . (aggregate . 4)) (SEMICOLON . (aggregate . 4)) (SLASH . (aggregate . 4)) (SLASH_EQUAL . (aggregate . 4)) (STAR . (aggregate . 4)) (STAR_STAR . (aggregate . 4)) (TICK_1 . (aggregate . 4)) (IDENTIFIER . (aggregate . 4)) (STRING_LITERAL . (aggregate . 4)) (CHARACTER_LITERAL . (aggregate . 4)))
      ((default . error) (ABS .  121) (IS . (association_opt . 5)) (NEW .  122) (NOT .  260) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (association_opt . 5)) (BAR . (discrete_choice_list . 2)) (COMMA . (association_opt . 5)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (SEMICOLON . (association_opt . 5)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  263))
      ((default . error) (ACCEPT . (aggregate . 3)) (ABORT . (aggregate . 3)) (AND . (aggregate . 3)) (BEGIN . (aggregate . 3)) (CASE . (aggregate . 3)) (DECLARE . (aggregate . 3)) (DELAY . (aggregate . 3)) (DIGITS . (aggregate . 3)) (DO . (aggregate . 3)) (ELSE . (aggregate . 3)) (ELSIF . (aggregate . 3)) (EXIT . (aggregate . 3)) (FOR . (aggregate . 3)) (GOTO . (aggregate . 3)) (IF . (aggregate . 3)) (IN . (aggregate . 3)) (IS . (aggregate . 3)) (LOOP . (aggregate . 3)) (MOD . (aggregate . 3)) (NOT . (aggregate . 3)) (NULL . (aggregate . 3)) (OF . (aggregate . 3)) (OR . (aggregate . 3)) (PRAGMA . (aggregate . 3)) (RAISE . (aggregate . 3)) (RANGE . (aggregate . 3)) (REM . (aggregate . 3)) (RENAMES . (aggregate . 3)) (REQUEUE . (aggregate . 3)) (RETURN . (aggregate . 3)) (SELECT . (aggregate . 3)) (THEN . (aggregate . 3)) (USE . (aggregate . 3)) (WHILE . (aggregate . 3)) (WITH . (aggregate . 3)) (XOR . (aggregate . 3)) (LEFT_PAREN . (aggregate . 3)) (RIGHT_PAREN . (aggregate . 3)) (AMPERSAND . (aggregate . 3)) (BAR . (aggregate . 3)) (COLON_EQUAL . (aggregate . 3)) (COMMA . (aggregate . 3)) (DOT . (aggregate . 3)) (DOT_DOT . (aggregate . 3)) (EQUAL . (aggregate . 3)) (EQUAL_GREATER . (aggregate . 3)) (GREATER . (aggregate . 3)) (GREATER_EQUAL . (aggregate . 3)) (LESS . (aggregate . 3)) (LESS_EQUAL . (aggregate . 3)) (LESS_LESS . (aggregate . 3)) (MINUS . (aggregate . 3)) (PLUS . (aggregate . 3)) (SEMICOLON . (aggregate . 3)) (SLASH . (aggregate . 3)) (SLASH_EQUAL . (aggregate . 3)) (STAR . (aggregate . 3)) (STAR_STAR . (aggregate . 3)) (TICK_1 . (aggregate . 3)) (IDENTIFIER . (aggregate . 3)) (STRING_LITERAL . (aggregate . 3)) (CHARACTER_LITERAL . (aggregate . 3)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  260) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (IS . (expression_opt . 1)) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (BOX .  599) (COMMA . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  260) (NULL .  601) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (association_opt . 5)) (BAR . (discrete_choice_list . 2)) (COMMA . (association_opt . 5)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  263))
      ((default . error) (ACCESS .  415) (DELTA .  416) (DIGITS .  417) (MOD .  418) (RANGE .  603) (LEFT_PAREN .  126) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  260) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (BAR . (discrete_choice_list . 2)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (END . (case_statement_alternative_list . 1)) (WHEN . (case_statement_alternative_list . 1)))
      ((default . error) (END .  606) (WHEN .  449))
      ((default . error) (AND . (factor . 0)) (DIGITS . (factor . 0)) (DO . (factor . 0)) (ELSE . (factor . 0)) (ELSIF . (factor . 0)) (IN . (factor . 0)) (IS . (factor . 0)) (LOOP . (factor . 0)) (MOD . (factor . 0)) (NOT . (factor . 0)) (OF . (factor . 0)) (OR . (factor . 0)) (RANGE . (factor . 0)) (REM . (factor . 0)) (THEN . (factor . 0)) (WITH . (factor . 0)) (XOR . (factor . 0)) (RIGHT_PAREN . (factor . 0)) (AMPERSAND . (factor . 0)) (BAR . (factor . 0)) (COLON_EQUAL . (factor . 0)) (COMMA . (factor . 0)) (DOT_DOT . (factor . 0)) (EQUAL . (factor . 0)) (EQUAL_GREATER . (factor . 0)) (GREATER . (factor . 0)) (GREATER_EQUAL . (factor . 0)) (LESS . (factor . 0)) (LESS_EQUAL . (factor . 0)) (MINUS . (factor . 0)) (PLUS . (factor . 0)) (SEMICOLON . (factor . 0)) (SLASH . (factor . 0)) (SLASH_EQUAL . (factor . 0)) (STAR . (factor . 0)))
      ((default . error) (AND . (relation_and_list . 0)) (DIGITS . (relation_and_list . 0)) (DO . (relation_and_list . 0)) (ELSE . (relation_and_list . 0)) (ELSIF . (relation_and_list . 0)) (IS . (relation_and_list . 0)) (LOOP . (relation_and_list . 0)) (OR . (relation_and_list . 0)) (RANGE . (relation_and_list . 0)) (THEN . (relation_and_list . 0)) (WITH . (relation_and_list . 0)) (XOR . (relation_and_list . 0)) (RIGHT_PAREN . (relation_and_list . 0)) (BAR . (relation_and_list . 0)) (COMMA . (relation_and_list . 0)) (EQUAL_GREATER . (relation_and_list . 0)) (SEMICOLON . (relation_and_list . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AND . (relation_or_list . 0)) (DIGITS . (relation_or_list . 0)) (DO . (relation_or_list . 0)) (ELSE . (relation_or_list . 0)) (ELSIF . (relation_or_list . 0)) (IS . (relation_or_list . 0)) (LOOP . (relation_or_list . 0)) (OR . (relation_or_list . 0)) (RANGE . (relation_or_list . 0)) (THEN . (relation_or_list . 0)) (WITH . (relation_or_list . 0)) (XOR . (relation_or_list . 0)) (RIGHT_PAREN . (relation_or_list . 0)) (BAR . (relation_or_list . 0)) (COMMA . (relation_or_list . 0)) (EQUAL_GREATER . (relation_or_list . 0)) (SEMICOLON . (relation_or_list . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AND . (relation_xor_list . 0)) (DIGITS . (relation_xor_list . 0)) (DO . (relation_xor_list . 0)) (ELSE . (relation_xor_list . 0)) (ELSIF . (relation_xor_list . 0)) (IS . (relation_xor_list . 0)) (LOOP . (relation_xor_list . 0)) (OR . (relation_xor_list . 0)) (RANGE . (relation_xor_list . 0)) (THEN . (relation_xor_list . 0)) (WITH . (relation_xor_list . 0)) (XOR . (relation_xor_list . 0)) (RIGHT_PAREN . (relation_xor_list . 0)) (BAR . (relation_xor_list . 0)) (COMMA . (relation_xor_list . 0)) (EQUAL_GREATER . (relation_xor_list . 0)) (SEMICOLON . (relation_xor_list . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AND . (relation_and_list . 1)) (DIGITS . (relation_and_list . 1)) (DO . (relation_and_list . 1)) (ELSE . (relation_and_list . 1)) (ELSIF . (relation_and_list . 1)) (IS . (relation_and_list . 1)) (LOOP . (relation_and_list . 1)) (OR . (relation_and_list . 1)) (RANGE . (relation_and_list . 1)) (THEN . (relation_and_list . 1)) (WITH . (relation_and_list . 1)) (XOR . (relation_and_list . 1)) (RIGHT_PAREN . (relation_and_list . 1)) (BAR . (relation_and_list . 1)) (COMMA . (relation_and_list . 1)) (EQUAL_GREATER . (relation_and_list . 1)) (SEMICOLON . (relation_and_list . 1)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AND . (relation_or_list . 1)) (DIGITS . (relation_or_list . 1)) (DO . (relation_or_list . 1)) (ELSE . (relation_or_list . 1)) (ELSIF . (relation_or_list . 1)) (IS . (relation_or_list . 1)) (LOOP . (relation_or_list . 1)) (OR . (relation_or_list . 1)) (RANGE . (relation_or_list . 1)) (THEN . (relation_or_list . 1)) (WITH . (relation_or_list . 1)) (XOR . (relation_or_list . 1)) (RIGHT_PAREN . (relation_or_list . 1)) (BAR . (relation_or_list . 1)) (COMMA . (relation_or_list . 1)) (EQUAL_GREATER . (relation_or_list . 1)) (SEMICOLON . (relation_or_list . 1)))
      ((default . error) (AND . (relation_xor_list . 1)) (DIGITS . (relation_xor_list . 1)) (DO . (relation_xor_list . 1)) (ELSE . (relation_xor_list . 1)) (ELSIF . (relation_xor_list . 1)) (IS . (relation_xor_list . 1)) (LOOP . (relation_xor_list . 1)) (OR . (relation_xor_list . 1)) (RANGE . (relation_xor_list . 1)) (THEN . (relation_xor_list . 1)) (WITH . (relation_xor_list . 1)) (XOR . (relation_xor_list . 1)) (RIGHT_PAREN . (relation_xor_list . 1)) (BAR . (relation_xor_list . 1)) (COMMA . (relation_xor_list . 1)) (EQUAL_GREATER . (relation_xor_list . 1)) (SEMICOLON . (relation_xor_list . 1)))
      ((default . error) (AND . (relation . 1)) (DIGITS . (relation . 1)) (DO . (relation . 1)) (ELSE . (relation . 1)) (ELSIF . (relation . 1)) (IS . (relation . 1)) (LOOP . (relation . 1)) (OR . (relation . 1)) (RANGE . (relation . 1)) (THEN . (relation . 1)) (WITH . (relation . 1)) (XOR . (relation . 1)) (RIGHT_PAREN . (relation . 1)) (BAR . ( 612 (relation . 1))) (COMMA . (relation . 1)) (EQUAL_GREATER . (relation . 1)) (SEMICOLON . (relation . 1)))
      ((default . error) (AND . (membership_choice_list . 1)) (DIGITS . (membership_choice_list . 1)) (DO . (membership_choice_list . 1)) (ELSE . (membership_choice_list . 1)) (ELSIF . (membership_choice_list . 1)) (IS . (membership_choice_list . 1)) (LOOP . (membership_choice_list . 1)) (OR . (membership_choice_list . 1)) (RANGE . (membership_choice_list . 1)) (THEN . (membership_choice_list . 1)) (WITH . (membership_choice_list . 1)) (XOR . (membership_choice_list . 1)) (RIGHT_PAREN . (membership_choice_list . 1)) (BAR . (membership_choice_list . 1)) (COMMA . (membership_choice_list . 1)) (EQUAL_GREATER . (membership_choice_list . 1)) (SEMICOLON . (membership_choice_list . 1)))
      ((default . error) (AND . (membership_choice . 1)) (DIGITS . (membership_choice . 1)) (DO . (membership_choice . 1)) (ELSE . (membership_choice . 1)) (ELSIF . (membership_choice . 1)) (IS . (membership_choice . 1)) (LOOP . (membership_choice . 1)) (OR . (membership_choice . 1)) (RANGE . (membership_choice . 1)) (THEN . (membership_choice . 1)) (WITH . (membership_choice . 1)) (XOR . (membership_choice . 1)) (RIGHT_PAREN . (membership_choice . 1)) (BAR . (membership_choice . 1)) (COMMA . (membership_choice . 1)) (EQUAL_GREATER . (membership_choice . 1)) (SEMICOLON . (membership_choice . 1)))
      ((default . error) (AND . (membership_choice . 0)) (DIGITS . (membership_choice . 0)) (DO . (membership_choice . 0)) (ELSE . (membership_choice . 0)) (ELSIF . (membership_choice . 0)) (IS . (membership_choice . 0)) (LOOP . (membership_choice . 0)) (OR . (membership_choice . 0)) (RANGE . (membership_choice . 0)) (THEN . (membership_choice . 0)) (WITH . (membership_choice . 0)) (XOR . (membership_choice . 0)) (RIGHT_PAREN . (membership_choice . 0)) (BAR . (membership_choice . 0)) (COMMA . (membership_choice . 0)) (DOT_DOT .  448) (EQUAL_GREATER . (membership_choice . 0)) (SEMICOLON . (membership_choice . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AND . (relation . 2)) (DIGITS . (relation . 2)) (DO . (relation . 2)) (ELSE . (relation . 2)) (ELSIF . (relation . 2)) (IS . (relation . 2)) (LOOP . (relation . 2)) (OR . (relation . 2)) (RANGE . (relation . 2)) (THEN . (relation . 2)) (WITH . (relation . 2)) (XOR . (relation . 2)) (RIGHT_PAREN . (relation . 2)) (BAR . (relation . 2)) (COMMA . (relation . 2)) (EQUAL_GREATER . (relation . 2)) (SEMICOLON . (relation . 2)))
      ((default . error) (AND . (term . 0)) (DIGITS . (term . 0)) (DO . (term . 0)) (ELSE . (term . 0)) (ELSIF . (term . 0)) (IN . (term . 0)) (IS . (term . 0)) (LOOP . (term . 0)) (MOD . (term . 0)) (NOT . (term . 0)) (OF . (term . 0)) (OR . (term . 0)) (RANGE . (term . 0)) (REM . (term . 0)) (THEN . (term . 0)) (WITH . (term . 0)) (XOR . (term . 0)) (RIGHT_PAREN . (term . 0)) (AMPERSAND . (term . 0)) (BAR . (term . 0)) (COLON_EQUAL . (term . 0)) (COMMA . (term . 0)) (DOT_DOT . (term . 0)) (EQUAL . (term . 0)) (EQUAL_GREATER . (term . 0)) (GREATER . (term . 0)) (GREATER_EQUAL . (term . 0)) (LESS . (term . 0)) (LESS_EQUAL . (term . 0)) (MINUS . (term . 0)) (PLUS . (term . 0)) (SEMICOLON . (term . 0)) (SLASH . (term . 0)) (SLASH_EQUAL . (term . 0)) (STAR . (term . 0)))
      ((default . error) (AND . (term_list . 0)) (DIGITS . (term_list . 0)) (DO . (term_list . 0)) (ELSE . (term_list . 0)) (ELSIF . (term_list . 0)) (IN . (term_list . 0)) (IS . (term_list . 0)) (LOOP . (term_list . 0)) (MOD .  296) (NOT . (term_list . 0)) (OF . (term_list . 0)) (OR . (term_list . 0)) (RANGE . (term_list . 0)) (REM .  297) (THEN . (term_list . 0)) (WITH . (term_list . 0)) (XOR . (term_list . 0)) (RIGHT_PAREN . (term_list . 0)) (AMPERSAND . (term_list . 0)) (BAR . (term_list . 0)) (COLON_EQUAL . (term_list . 0)) (COMMA . (term_list . 0)) (DOT_DOT . (term_list . 0)) (EQUAL . (term_list . 0)) (EQUAL_GREATER . (term_list . 0)) (GREATER . (term_list . 0)) (GREATER_EQUAL . (term_list . 0)) (LESS . (term_list . 0)) (LESS_EQUAL . (term_list . 0)) (MINUS . (term_list . 0)) (PLUS . (term_list . 0)) (SEMICOLON . (term_list . 0)) (SLASH .  298) (SLASH_EQUAL . (term_list . 0)) (STAR .  299))
      ((default . error) (ACCEPT . (delay_statement . 0)) (ABORT . (delay_statement . 0)) (BEGIN . (delay_statement . 0)) (CASE . (delay_statement . 0)) (DECLARE . (delay_statement . 0)) (DELAY . (delay_statement . 0)) (ELSE . (delay_statement . 0)) (ELSIF . (delay_statement . 0)) (END . (delay_statement . 0)) (ENTRY . (delay_statement . 0)) (EXCEPTION . (delay_statement . 0)) (EXIT . (delay_statement . 0)) (FOR . (delay_statement . 0)) (FUNCTION . (delay_statement . 0)) (GENERIC . (delay_statement . 0)) (GOTO . (delay_statement . 0)) (IF . (delay_statement . 0)) (LIMITED . (delay_statement . 0)) (LOOP . (delay_statement . 0)) (NOT . (delay_statement . 0)) (NULL . (delay_statement . 0)) (OR . (delay_statement . 0)) (OVERRIDING . (delay_statement . 0)) (PACKAGE . (delay_statement . 0)) (PRAGMA . (delay_statement . 0)) (PRIVATE . (delay_statement . 0)) (PROCEDURE . (delay_statement . 0)) (PROTECTED . (delay_statement . 0)) (RAISE . (delay_statement . 0)) (REQUEUE . (delay_statement . 0)) (RETURN . (delay_statement . 0)) (SEPARATE . (delay_statement . 0)) (SELECT . (delay_statement . 0)) (SUBTYPE . (delay_statement . 0)) (TASK . (delay_statement . 0)) (THEN . (delay_statement . 0)) (TYPE . (delay_statement . 0)) (USE . (delay_statement . 0)) (WHEN . (delay_statement . 0)) (WHILE . (delay_statement . 0)) (WITH . (delay_statement . 0)) (LESS_LESS . (delay_statement . 0)) (IDENTIFIER . (delay_statement . 0)) (STRING_LITERAL . (delay_statement . 0)) (CHARACTER_LITERAL . (delay_statement . 0)) (Wisi_EOI . (delay_statement . 0)))
      ((default . error) (SEMICOLON .  614))
      ((default . error) (NEW .  122) (NULL .  615) (LEFT_PAREN .  126) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  473) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (LOOP . (iterator_specification . 5)) (EQUAL_GREATER . (iterator_specification . 5)))
      ((default . error) (AND . (primary . 3)) (IN . (primary . 3)) (LOOP . (subtype_indication . 3)) (MOD . (primary . 3)) (NOT . (primary . 3)) (OR . (primary . 3)) (RANGE .  617) (REM . (primary . 3)) (XOR . (primary . 3)) (LEFT_PAREN .  618) (RIGHT_PAREN . ((primary . 3) (subtype_indication . 3))) (AMPERSAND . (primary . 3)) (BAR . (primary . 3)) (COMMA . ((primary . 3) (subtype_indication . 3))) (DOT .  237) (DOT_DOT . (primary . 3)) (EQUAL . (primary . 3)) (EQUAL_GREATER . ((primary . 3) (subtype_indication . 3))) (GREATER . (primary . 3)) (GREATER_EQUAL . (primary . 3)) (LESS . (primary . 3)) (LESS_EQUAL . (primary . 3)) (MINUS . (primary . 3)) (PLUS . (primary . 3)) (SLASH . (primary . 3)) (SLASH_EQUAL . (primary . 3)) (STAR . (primary . 3)) (STAR_STAR . (primary . 3)) (TICK_1 .  239))
      ((default . error) (LOOP . (discrete_subtype_definition . 1)) (RIGHT_PAREN . (discrete_subtype_definition . 1)) (COMMA . (discrete_subtype_definition . 1)) (EQUAL_GREATER . (discrete_subtype_definition . 1)))
      ((default . error) (DOT_DOT .  448))
      ((default . error) (LOOP . (discrete_subtype_definition . 0)) (RIGHT_PAREN . (discrete_subtype_definition . 0)) (COMMA . (discrete_subtype_definition . 0)) (EQUAL_GREATER . (discrete_subtype_definition . 0)))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (LOOP . (iterator_specification . 4)) (LEFT_PAREN .  235) (DOT .  237) (EQUAL_GREATER . (iterator_specification . 4)) (TICK_1 .  239))
      ((default . error) (NULL .  622))
      ((default . error) (AND . (subtype_indication . 3)) (DO . (subtype_indication . 3)) (OF . (subtype_indication . 3)) (RANGE .  617) (WITH . (subtype_indication . 3)) (LEFT_PAREN .  618) (COLON_EQUAL . (subtype_indication . 3)) (DOT .  237) (SEMICOLON . (subtype_indication . 3)) (TICK_1 .  239))
      ((default . error) (OF .  623))
      ((default . error) (SEMICOLON .  624))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AT .  626) (IDENTIFIER . (mod_clause_opt . 1)))
      ((default . error) (SEMICOLON .  628))
      ((default . error) (DO . (result_profile . 1)) (IS . (result_profile . 1)) (RENAMES . (result_profile . 1)) (WITH . (result_profile . 1)) (RIGHT_PAREN . (result_profile . 1)) (COLON_EQUAL . (result_profile . 1)) (SEMICOLON . (result_profile . 1)))
      ((default . error) (ACCESS .  555) (DO . (name_opt . 1)) (IS . (name_opt . 1)) (RENAMES . (name_opt . 1)) (WITH . (name_opt . 1)) (RIGHT_PAREN . (name_opt . 1)) (COLON_EQUAL . (name_opt . 1)) (SEMICOLON . (name_opt . 1)) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AND . (name . 5)) (IN . (name . 5)) (MOD . (name . 5)) (NOT . (name . 5)) (OR . (name . 5)) (RANGE . (name . 5)) (REM . (name . 5)) (XOR . (name . 5)) (LEFT_PAREN . (name . 5)) (RIGHT_PAREN . (name . 5)) (AMPERSAND . (name . 5)) (BAR . (name . 5)) (COLON . (identifier_list . 1)) (COMMA . ((identifier_list . 1) (name . 5))) (DOT . (name . 5)) (DOT_DOT . (name . 5)) (EQUAL . (name . 5)) (EQUAL_GREATER . (name . 5)) (GREATER . (name . 5)) (GREATER_EQUAL . (name . 5)) (LESS . (name . 5)) (LESS_EQUAL . (name . 5)) (MINUS . (name . 5)) (PLUS . (name . 5)) (SLASH . (name . 5)) (SLASH_EQUAL . (name . 5)) (STAR . (name . 5)) (STAR_STAR . (name . 5)) (TICK_1 . (name . 5)))
      ((default . error) (COLON .  631) (COMMA .  234))
      ((default . error) (RIGHT_PAREN . (parameter_specification_list . 1)) (SEMICOLON . (parameter_specification_list . 1)))
      ((default . error) (RIGHT_PAREN .  632) (SEMICOLON .  633))
      ((default . error) (DO . (parameter_and_result_profile . 0)) (IS . (parameter_and_result_profile . 0)) (RENAMES . (parameter_and_result_profile . 0)) (WITH . (parameter_and_result_profile . 0)) (RIGHT_PAREN . (parameter_and_result_profile . 0)) (COLON_EQUAL . (parameter_and_result_profile . 0)) (SEMICOLON . (parameter_and_result_profile . 0)))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IS .  637) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (IS .  639) (LEFT_PAREN .  235) (DOT .  237) (TICK_1 .  239))
      ((default . error) (ABSTRACT .  640) (NULL .  641) (BOX .  642) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  645))
      ((default . error) (ACCESS . (mode_opt . 0)) (NOT . (mode_opt . 0)) (OUT .  646) (WITH . (mode_opt . 0)) (COLON_EQUAL . (mode_opt . 0)) (SEMICOLON . (mode_opt . 0)) (IDENTIFIER . (mode_opt . 0)) (STRING_LITERAL . (mode_opt . 0)) (CHARACTER_LITERAL . (mode_opt . 0)))
      ((default . error) (ACCESS . (mode_opt . 2)) (NOT . (mode_opt . 2)) (WITH . (mode_opt . 2)) (COLON_EQUAL . (mode_opt . 2)) (SEMICOLON . (mode_opt . 2)) (IDENTIFIER . (mode_opt . 2)) (STRING_LITERAL . (mode_opt . 2)) (CHARACTER_LITERAL . (mode_opt . 2)))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (NOT .  385) (IDENTIFIER . (null_exclusion_opt . 1)) (STRING_LITERAL . (null_exclusion_opt . 1)) (CHARACTER_LITERAL . (null_exclusion_opt . 1)))
      ((default . error) (ELSE .  649) (ELSIF .  650) (END .  651))
      ((default . error) (COMMA .  380) (SEMICOLON .  654))
      ((default . error) (ACCEPT . (with_clause . 1)) (ABORT . (with_clause . 1)) (BEGIN . (with_clause . 1)) (CASE . (with_clause . 1)) (DECLARE . (with_clause . 1)) (DELAY . (with_clause . 1)) (ENTRY . (with_clause . 1)) (EXIT . (with_clause . 1)) (FOR . (with_clause . 1)) (FUNCTION . (with_clause . 1)) (GENERIC . (with_clause . 1)) (GOTO . (with_clause . 1)) (IF . (with_clause . 1)) (LIMITED . (with_clause . 1)) (LOOP . (with_clause . 1)) (NOT . (with_clause . 1)) (NULL . (with_clause . 1)) (OVERRIDING . (with_clause . 1)) (PACKAGE . (with_clause . 1)) (PRAGMA . (with_clause . 1)) (PRIVATE . (with_clause . 1)) (PROCEDURE . (with_clause . 1)) (PROTECTED . (with_clause . 1)) (RAISE . (with_clause . 1)) (REQUEUE . (with_clause . 1)) (RETURN . (with_clause . 1)) (SEPARATE . (with_clause . 1)) (SELECT . (with_clause . 1)) (SUBTYPE . (with_clause . 1)) (TASK . (with_clause . 1)) (TYPE . (with_clause . 1)) (USE . (with_clause . 1)) (WHILE . (with_clause . 1)) (WITH . (with_clause . 1)) (LESS_LESS . (with_clause . 1)) (IDENTIFIER . (with_clause . 1)) (STRING_LITERAL . (with_clause . 1)) (CHARACTER_LITERAL . (with_clause . 1)) (Wisi_EOI . (with_clause . 1)))
      ((default . error) (SEPARATE .  655))
      ((default . error) (IS .  656))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (aspect_specification_opt . 1)) (TICK_1 .  239))
      ((default . error) (IS . (aspect_specification_opt . 0)) (COMMA .  442) (SEMICOLON . (aspect_specification_opt . 0)))
      ((default . error) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PRIVATE . (declarative_part_opt . 1)) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (RIGHT_PAREN .  660) (COMMA .  442))
      ((default . error) (RIGHT_PAREN .  661))
      ((default . error) (ACCEPT . (with_clause . 2)) (ABORT . (with_clause . 2)) (BEGIN . (with_clause . 2)) (CASE . (with_clause . 2)) (DECLARE . (with_clause . 2)) (DELAY . (with_clause . 2)) (ENTRY . (with_clause . 2)) (EXIT . (with_clause . 2)) (FOR . (with_clause . 2)) (FUNCTION . (with_clause . 2)) (GENERIC . (with_clause . 2)) (GOTO . (with_clause . 2)) (IF . (with_clause . 2)) (LIMITED . (with_clause . 2)) (LOOP . (with_clause . 2)) (NOT . (with_clause . 2)) (NULL . (with_clause . 2)) (OVERRIDING . (with_clause . 2)) (PACKAGE . (with_clause . 2)) (PRAGMA . (with_clause . 2)) (PRIVATE . (with_clause . 2)) (PROCEDURE . (with_clause . 2)) (PROTECTED . (with_clause . 2)) (RAISE . (with_clause . 2)) (REQUEUE . (with_clause . 2)) (RETURN . (with_clause . 2)) (SEPARATE . (with_clause . 2)) (SELECT . (with_clause . 2)) (SUBTYPE . (with_clause . 2)) (TASK . (with_clause . 2)) (TYPE . (with_clause . 2)) (USE . (with_clause . 2)) (WHILE . (with_clause . 2)) (WITH . (with_clause . 2)) (LESS_LESS . (with_clause . 2)) (IDENTIFIER . (with_clause . 2)) (STRING_LITERAL . (with_clause . 2)) (CHARACTER_LITERAL . (with_clause . 2)) (Wisi_EOI . (with_clause . 2)))
      ((default . error) (SEPARATE .  662))
      ((default . error) (IS .  663))
      ((default . error) (IS . (aspect_specification_opt . 1)) (WITH .  336))
      ((default . error) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NEW .  665) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PRIVATE . (declarative_part_opt . 1)) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (SEMICOLON .  668))
      ((default . error) (SEMICOLON .  669))
      ((default . error) (ACCESS . (constant_opt . 1)) (CONSTANT .  567) (DO . (constant_opt . 1)) (NOT . (constant_opt . 1)) (COLON_EQUAL . (constant_opt . 1)) (SEMICOLON . (constant_opt . 1)) (IDENTIFIER . (constant_opt . 1)) (STRING_LITERAL . (constant_opt . 1)) (CHARACTER_LITERAL . (constant_opt . 1)))
      ((default . error) (END .  671))
      ((default . error) (FUNCTION . (overriding_indicator_opt . 2)) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  672) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  673) (TASK .  674))
      ((default . error) (ACCEPT .  1) (DELAY .  4) (TERMINATE .  677))
      ((default . error) (BEGIN . (block_label . 0)) (DECLARE . (block_label . 0)) (FOR . (block_label . 0)) (LOOP . (block_label . 0)) (WHILE . (block_label . 0)))
      ((default . error) (ACCEPT . (sequence_of_statements . 0)) (ABORT . (sequence_of_statements . 0)) (BEGIN . (sequence_of_statements . 0)) (CASE . (sequence_of_statements . 0)) (DECLARE . (sequence_of_statements . 0)) (DELAY . (sequence_of_statements . 0)) (ELSE . (sequence_of_statements . 0)) (ELSIF . (sequence_of_statements . 0)) (END . (sequence_of_statements . 0)) (EXCEPTION . (sequence_of_statements . 0)) (EXIT . (sequence_of_statements . 0)) (FOR . (sequence_of_statements . 0)) (GOTO . (sequence_of_statements . 0)) (IF . (sequence_of_statements . 0)) (LOOP . (sequence_of_statements . 0)) (NULL . (sequence_of_statements . 0)) (OR . (sequence_of_statements . 0)) (PRAGMA . (sequence_of_statements . 0)) (RAISE . (sequence_of_statements . 0)) (REQUEUE . (sequence_of_statements . 0)) (RETURN . (sequence_of_statements . 0)) (SELECT . (sequence_of_statements . 0)) (THEN . (sequence_of_statements . 0)) (WHEN . (sequence_of_statements . 0)) (WHILE . (sequence_of_statements . 0)) (LESS_LESS . (sequence_of_statements . 0)) (IDENTIFIER . (sequence_of_statements . 0)) (STRING_LITERAL . (sequence_of_statements . 0)) (CHARACTER_LITERAL . (sequence_of_statements . 0)))
      ((default . error) (END .  680))
      ((default . error) (END .  681))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (ELSE . (sequence_of_statements_opt . 1)) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (OR . (sequence_of_statements_opt . 1)) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ELSE . (select_alternative_list . 0)) (END . (select_alternative_list . 0)) (OR . (select_alternative_list . 0)))
      ((default . error) (END .  683))
      ((default . error) (SEMICOLON .  684))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (SEPARATE .  687))
      ((default . error) (IS .  688))
      ((default . error) (IS . (aspect_specification_opt . 1)) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NEW .  690) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PRIVATE . (declarative_part_opt . 1)) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (ACCEPT . (single_task_declaration . 2)) (ABORT . (single_task_declaration . 2)) (BEGIN . (single_task_declaration . 2)) (CASE . (single_task_declaration . 2)) (DECLARE . (single_task_declaration . 2)) (DELAY . (single_task_declaration . 2)) (END . (single_task_declaration . 2)) (ENTRY . (single_task_declaration . 2)) (EXIT . (single_task_declaration . 2)) (FOR . (single_task_declaration . 2)) (FUNCTION . (single_task_declaration . 2)) (GENERIC . (single_task_declaration . 2)) (GOTO . (single_task_declaration . 2)) (IF . (single_task_declaration . 2)) (LIMITED . (single_task_declaration . 2)) (LOOP . (single_task_declaration . 2)) (NOT . (single_task_declaration . 2)) (NULL . (single_task_declaration . 2)) (OVERRIDING . (single_task_declaration . 2)) (PACKAGE . (single_task_declaration . 2)) (PRAGMA . (single_task_declaration . 2)) (PRIVATE . (single_task_declaration . 2)) (PROCEDURE . (single_task_declaration . 2)) (PROTECTED . (single_task_declaration . 2)) (RAISE . (single_task_declaration . 2)) (REQUEUE . (single_task_declaration . 2)) (RETURN . (single_task_declaration . 2)) (SEPARATE . (single_task_declaration . 2)) (SELECT . (single_task_declaration . 2)) (SUBTYPE . (single_task_declaration . 2)) (TASK . (single_task_declaration . 2)) (TYPE . (single_task_declaration . 2)) (USE . (single_task_declaration . 2)) (WHILE . (single_task_declaration . 2)) (WITH . (single_task_declaration . 2)) (LESS_LESS . (single_task_declaration . 2)) (IDENTIFIER . (single_task_declaration . 2)) (STRING_LITERAL . (single_task_declaration . 2)) (CHARACTER_LITERAL . (single_task_declaration . 2)) (Wisi_EOI . (single_task_declaration . 2)))
      ((default . error) (RIGHT_PAREN .  693))
      ((default . error) (RIGHT_PAREN . (discriminant_specification_list . 1)) (SEMICOLON . (discriminant_specification_list . 1)))
      ((default . error) (RIGHT_PAREN .  694) (SEMICOLON .  695))
      ((default . error) (COLON .  696) (COMMA .  234))
      ((default . error) (ABSTRACT .  697) (ACCESS . (null_exclusion_opt . 1)) (ARRAY .  698) (DELTA .  699) (DIGITS .  700) (INTERFACE .  701) (LIMITED .  702) (MOD .  703) (NEW . ((abstract_limited_synchronized_opt . 5) (abstract_limited_opt . 3))) (NOT .  385) (NULL . (abstract_tagged_limited_opt . 5)) (PRIVATE . (abstract_tagged_limited_opt . 5)) (PROTECTED .  705) (RANGE .  706) (RECORD . (abstract_tagged_limited_opt . 5)) (SYNCHRONIZED .  708) (TAGGED .  709) (TASK .  710) (LEFT_PAREN .  711))
      ((default . error) (ACCEPT . (incomplete_type_declaration . 1)) (ABORT . (incomplete_type_declaration . 1)) (BEGIN . (incomplete_type_declaration . 1)) (CASE . (incomplete_type_declaration . 1)) (DECLARE . (incomplete_type_declaration . 1)) (DELAY . (incomplete_type_declaration . 1)) (END . (incomplete_type_declaration . 1)) (ENTRY . (incomplete_type_declaration . 1)) (EXIT . (incomplete_type_declaration . 1)) (FOR . (incomplete_type_declaration . 1)) (FUNCTION . (incomplete_type_declaration . 1)) (GENERIC . (incomplete_type_declaration . 1)) (GOTO . (incomplete_type_declaration . 1)) (IF . (incomplete_type_declaration . 1)) (LIMITED . (incomplete_type_declaration . 1)) (LOOP . (incomplete_type_declaration . 1)) (NOT . (incomplete_type_declaration . 1)) (NULL . (incomplete_type_declaration . 1)) (OVERRIDING . (incomplete_type_declaration . 1)) (PACKAGE . (incomplete_type_declaration . 1)) (PRAGMA . (incomplete_type_declaration . 1)) (PRIVATE . (incomplete_type_declaration . 1)) (PROCEDURE . (incomplete_type_declaration . 1)) (PROTECTED . (incomplete_type_declaration . 1)) (RAISE . (incomplete_type_declaration . 1)) (REQUEUE . (incomplete_type_declaration . 1)) (RETURN . (incomplete_type_declaration . 1)) (SEPARATE . (incomplete_type_declaration . 1)) (SELECT . (incomplete_type_declaration . 1)) (SUBTYPE . (incomplete_type_declaration . 1)) (TASK . (incomplete_type_declaration . 1)) (TYPE . (incomplete_type_declaration . 1)) (USE . (incomplete_type_declaration . 1)) (WHILE . (incomplete_type_declaration . 1)) (WITH . (incomplete_type_declaration . 1)) (LESS_LESS . (incomplete_type_declaration . 1)) (IDENTIFIER . (incomplete_type_declaration . 1)) (STRING_LITERAL . (incomplete_type_declaration . 1)) (CHARACTER_LITERAL . (incomplete_type_declaration . 1)) (Wisi_EOI . (incomplete_type_declaration . 1)))
      ((default . error) (COMMA .  380) (SEMICOLON .  722))
      ((default . error) (ACCEPT . (use_clause . 1)) (ABORT . (use_clause . 1)) (BEGIN . (use_clause . 1)) (CASE . (use_clause . 1)) (DECLARE . (use_clause . 1)) (DELAY . (use_clause . 1)) (END . (use_clause . 1)) (ENTRY . (use_clause . 1)) (EXIT . (use_clause . 1)) (FOR . (use_clause . 1)) (FUNCTION . (use_clause . 1)) (GENERIC . (use_clause . 1)) (GOTO . (use_clause . 1)) (IF . (use_clause . 1)) (LIMITED . (use_clause . 1)) (LOOP . (use_clause . 1)) (NOT . (use_clause . 1)) (NULL . (use_clause . 1)) (OVERRIDING . (use_clause . 1)) (PACKAGE . (use_clause . 1)) (PRAGMA . (use_clause . 1)) (PRIVATE . (use_clause . 1)) (PROCEDURE . (use_clause . 1)) (PROTECTED . (use_clause . 1)) (RAISE . (use_clause . 1)) (REQUEUE . (use_clause . 1)) (RETURN . (use_clause . 1)) (SEPARATE . (use_clause . 1)) (SELECT . (use_clause . 1)) (SUBTYPE . (use_clause . 1)) (TASK . (use_clause . 1)) (TYPE . (use_clause . 1)) (USE . (use_clause . 1)) (WHILE . (use_clause . 1)) (WITH . (use_clause . 1)) (LESS_LESS . (use_clause . 1)) (IDENTIFIER . (use_clause . 1)) (STRING_LITERAL . (use_clause . 1)) (CHARACTER_LITERAL . (use_clause . 1)) (Wisi_EOI . (use_clause . 1)))
      ((default . error) (LEFT_PAREN .  235) (COMMA . (name_list . 0)) (DOT .  237) (SEMICOLON . (name_list . 0)) (TICK_1 .  239))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCESS . (null_exclusion_opt . 0)) (DO . (null_exclusion_opt . 0)) (IS . (null_exclusion_opt . 0)) (RENAMES . (null_exclusion_opt . 0)) (WITH . (null_exclusion_opt . 0)) (RIGHT_PAREN . (null_exclusion_opt . 0)) (COLON_EQUAL . (null_exclusion_opt . 0)) (SEMICOLON . (null_exclusion_opt . 0)) (IDENTIFIER . (null_exclusion_opt . 0)) (STRING_LITERAL . (null_exclusion_opt . 0)) (CHARACTER_LITERAL . (null_exclusion_opt . 0)))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ALL .  725) (CONSTANT .  726) (FUNCTION . (protected_opt . 1)) (PROCEDURE . (protected_opt . 1)) (PROTECTED .  727) (IDENTIFIER . (general_access_modifier_opt . 2)) (STRING_LITERAL . (general_access_modifier_opt . 2)) (CHARACTER_LITERAL . (general_access_modifier_opt . 2)))
      ((default . error) (RENAMES .  730) (LEFT_PAREN .  235) (DOT .  237) (TICK_1 .  239))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (END . (exception_handler_list_opt . 1)) (PRAGMA .  16) (WHEN .  732))
      ((default . error) (BEGIN . (declarations . 0)) (END . (declarations . 0)) (ENTRY . (declarations . 0)) (FOR . (declarations . 0)) (FUNCTION . (declarations . 0)) (GENERIC . (declarations . 0)) (NOT . (declarations . 0)) (OVERRIDING . (declarations . 0)) (PACKAGE . (declarations . 0)) (PRAGMA . (declarations . 0)) (PRIVATE . (declarations . 0)) (PROCEDURE . (declarations . 0)) (PROTECTED . (declarations . 0)) (SUBTYPE . (declarations . 0)) (TASK . (declarations . 0)) (TYPE . (declarations . 0)) (USE . (declarations . 0)) (IDENTIFIER . (declarations . 0)))
      ((default . error) (BEGIN . (declarations . 1)) (END . (declarations . 1)) (ENTRY . (declarations . 1)) (FOR . (declarations . 1)) (FUNCTION . (declarations . 1)) (GENERIC . (declarations . 1)) (NOT . (declarations . 1)) (OVERRIDING . (declarations . 1)) (PACKAGE . (declarations . 1)) (PRAGMA . (declarations . 1)) (PRIVATE . (declarations . 1)) (PROCEDURE . (declarations . 1)) (PROTECTED . (declarations . 1)) (SUBTYPE . (declarations . 1)) (TASK . (declarations . 1)) (TYPE . (declarations . 1)) (USE . (declarations . 1)) (IDENTIFIER . (declarations . 1)))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXCEPTION . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (LOOP .  738))
      ((default . error) (END .  739))
      ((default . error) (ACCEPT . (generic_subprogram_declaration . 0)) (ABORT . (generic_subprogram_declaration . 0)) (BEGIN . (generic_subprogram_declaration . 0)) (CASE . (generic_subprogram_declaration . 0)) (DECLARE . (generic_subprogram_declaration . 0)) (DELAY . (generic_subprogram_declaration . 0)) (END . (generic_subprogram_declaration . 0)) (ENTRY . (generic_subprogram_declaration . 0)) (EXIT . (generic_subprogram_declaration . 0)) (FOR . (generic_subprogram_declaration . 0)) (FUNCTION . (generic_subprogram_declaration . 0)) (GENERIC . (generic_subprogram_declaration . 0)) (GOTO . (generic_subprogram_declaration . 0)) (IF . (generic_subprogram_declaration . 0)) (LIMITED . (generic_subprogram_declaration . 0)) (LOOP . (generic_subprogram_declaration . 0)) (NOT . (generic_subprogram_declaration . 0)) (NULL . (generic_subprogram_declaration . 0)) (OVERRIDING . (generic_subprogram_declaration . 0)) (PACKAGE . (generic_subprogram_declaration . 0)) (PRAGMA . (generic_subprogram_declaration . 0)) (PRIVATE . (generic_subprogram_declaration . 0)) (PROCEDURE . (generic_subprogram_declaration . 0)) (PROTECTED . (generic_subprogram_declaration . 0)) (RAISE . (generic_subprogram_declaration . 0)) (REQUEUE . (generic_subprogram_declaration . 0)) (RETURN . (generic_subprogram_declaration . 0)) (SEPARATE . (generic_subprogram_declaration . 0)) (SELECT . (generic_subprogram_declaration . 0)) (SUBTYPE . (generic_subprogram_declaration . 0)) (TASK . (generic_subprogram_declaration . 0)) (TYPE . (generic_subprogram_declaration . 0)) (USE . (generic_subprogram_declaration . 0)) (WHILE . (generic_subprogram_declaration . 0)) (WITH . (generic_subprogram_declaration . 0)) (LESS_LESS . (generic_subprogram_declaration . 0)) (IDENTIFIER . (generic_subprogram_declaration . 0)) (STRING_LITERAL . (generic_subprogram_declaration . 0)) (CHARACTER_LITERAL . (generic_subprogram_declaration . 0)) (Wisi_EOI . (generic_subprogram_declaration . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (exception_declaration . 0)) (ABORT . (exception_declaration . 0)) (BEGIN . (exception_declaration . 0)) (CASE . (exception_declaration . 0)) (DECLARE . (exception_declaration . 0)) (DELAY . (exception_declaration . 0)) (END . (exception_declaration . 0)) (ENTRY . (exception_declaration . 0)) (EXIT . (exception_declaration . 0)) (FOR . (exception_declaration . 0)) (FUNCTION . (exception_declaration . 0)) (GENERIC . (exception_declaration . 0)) (GOTO . (exception_declaration . 0)) (IF . (exception_declaration . 0)) (LIMITED . (exception_declaration . 0)) (LOOP . (exception_declaration . 0)) (NOT . (exception_declaration . 0)) (NULL . (exception_declaration . 0)) (OVERRIDING . (exception_declaration . 0)) (PACKAGE . (exception_declaration . 0)) (PRAGMA . (exception_declaration . 0)) (PRIVATE . (exception_declaration . 0)) (PROCEDURE . (exception_declaration . 0)) (PROTECTED . (exception_declaration . 0)) (RAISE . (exception_declaration . 0)) (REQUEUE . (exception_declaration . 0)) (RETURN . (exception_declaration . 0)) (SEPARATE . (exception_declaration . 0)) (SELECT . (exception_declaration . 0)) (SUBTYPE . (exception_declaration . 0)) (TASK . (exception_declaration . 0)) (TYPE . (exception_declaration . 0)) (USE . (exception_declaration . 0)) (WHILE . (exception_declaration . 0)) (WITH . (exception_declaration . 0)) (LESS_LESS . (exception_declaration . 0)) (IDENTIFIER . (exception_declaration . 0)) (STRING_LITERAL . (exception_declaration . 0)) (CHARACTER_LITERAL . (exception_declaration . 0)) (Wisi_EOI . (exception_declaration . 0)))
      ((default . error) (ACCESS . (constant_opt . 0)) (ARRAY . (constant_opt . 0)) (DO . (constant_opt . 0)) (NOT . (constant_opt . 0)) (WITH . (constant_opt . 0)) (COLON_EQUAL . (constant_opt . 0)) (SEMICOLON . (constant_opt . 0)) (IDENTIFIER . (constant_opt . 0)) (STRING_LITERAL . (constant_opt . 0)) (CHARACTER_LITERAL . (constant_opt . 0)))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (ARRAY .  698) (NOT .  741) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (actual_parameter_part . 0)) (ABORT . (actual_parameter_part . 0)) (AND . (actual_parameter_part . 0)) (BEGIN . (actual_parameter_part . 0)) (CASE . (actual_parameter_part . 0)) (DECLARE . (actual_parameter_part . 0)) (DELAY . (actual_parameter_part . 0)) (DIGITS . (actual_parameter_part . 0)) (DO . (actual_parameter_part . 0)) (ELSE . (actual_parameter_part . 0)) (ELSIF . (actual_parameter_part . 0)) (EXIT . (actual_parameter_part . 0)) (FOR . (actual_parameter_part . 0)) (GOTO . (actual_parameter_part . 0)) (IF . (actual_parameter_part . 0)) (IN . (actual_parameter_part . 0)) (IS . (actual_parameter_part . 0)) (LOOP . (actual_parameter_part . 0)) (MOD . (actual_parameter_part . 0)) (NOT . (actual_parameter_part . 0)) (NULL . (actual_parameter_part . 0)) (OF . (actual_parameter_part . 0)) (OR . (actual_parameter_part . 0)) (PRAGMA . (actual_parameter_part . 0)) (RAISE . (actual_parameter_part . 0)) (RANGE . (actual_parameter_part . 0)) (REM . (actual_parameter_part . 0)) (RENAMES . (actual_parameter_part . 0)) (REQUEUE . (actual_parameter_part . 0)) (RETURN . (actual_parameter_part . 0)) (SELECT . (actual_parameter_part . 0)) (THEN . (actual_parameter_part . 0)) (USE . (actual_parameter_part . 0)) (WHILE . (actual_parameter_part . 0)) (WITH . (actual_parameter_part . 0)) (XOR . (actual_parameter_part . 0)) (LEFT_PAREN . (actual_parameter_part . 0)) (RIGHT_PAREN . (actual_parameter_part . 0)) (AMPERSAND . (actual_parameter_part . 0)) (BAR . (actual_parameter_part . 0)) (COLON_EQUAL . (actual_parameter_part . 0)) (COMMA . (actual_parameter_part . 0)) (DOT . (actual_parameter_part . 0)) (DOT_DOT . (actual_parameter_part . 0)) (EQUAL . (actual_parameter_part . 0)) (EQUAL_GREATER . (actual_parameter_part . 0)) (GREATER . (actual_parameter_part . 0)) (GREATER_EQUAL . (actual_parameter_part . 0)) (LESS . (actual_parameter_part . 0)) (LESS_EQUAL . (actual_parameter_part . 0)) (LESS_LESS . (actual_parameter_part . 0)) (MINUS . (actual_parameter_part . 0)) (PLUS . (actual_parameter_part . 0)) (SEMICOLON . (actual_parameter_part . 0)) (SLASH . (actual_parameter_part . 0)) (SLASH_EQUAL . (actual_parameter_part . 0)) (STAR . (actual_parameter_part . 0)) (STAR_STAR . (actual_parameter_part . 0)) (TICK_1 . (actual_parameter_part . 0)) (IDENTIFIER . (actual_parameter_part . 0)) (STRING_LITERAL . (actual_parameter_part . 0)) (CHARACTER_LITERAL . (actual_parameter_part . 0)))
      ((default . error) (ACCEPT . (actual_parameter_part . 1)) (ABORT . (actual_parameter_part . 1)) (AND . (actual_parameter_part . 1)) (BEGIN . (actual_parameter_part . 1)) (CASE . (actual_parameter_part . 1)) (DECLARE . (actual_parameter_part . 1)) (DELAY . (actual_parameter_part . 1)) (DIGITS . (actual_parameter_part . 1)) (DO . (actual_parameter_part . 1)) (ELSE . (actual_parameter_part . 1)) (ELSIF . (actual_parameter_part . 1)) (EXIT . (actual_parameter_part . 1)) (FOR . (actual_parameter_part . 1)) (GOTO . (actual_parameter_part . 1)) (IF . (actual_parameter_part . 1)) (IN . (actual_parameter_part . 1)) (IS . (actual_parameter_part . 1)) (LOOP . (actual_parameter_part . 1)) (MOD . (actual_parameter_part . 1)) (NOT . (actual_parameter_part . 1)) (NULL . (actual_parameter_part . 1)) (OF . (actual_parameter_part . 1)) (OR . (actual_parameter_part . 1)) (PRAGMA . (actual_parameter_part . 1)) (RAISE . (actual_parameter_part . 1)) (RANGE . (actual_parameter_part . 1)) (REM . (actual_parameter_part . 1)) (RENAMES . (actual_parameter_part . 1)) (REQUEUE . (actual_parameter_part . 1)) (RETURN . (actual_parameter_part . 1)) (SELECT . (actual_parameter_part . 1)) (THEN . (actual_parameter_part . 1)) (USE . (actual_parameter_part . 1)) (WHILE . (actual_parameter_part . 1)) (WITH . (actual_parameter_part . 1)) (XOR . (actual_parameter_part . 1)) (LEFT_PAREN . (actual_parameter_part . 1)) (RIGHT_PAREN . (actual_parameter_part . 1)) (AMPERSAND . (actual_parameter_part . 1)) (BAR . (actual_parameter_part . 1)) (COLON_EQUAL . (actual_parameter_part . 1)) (COMMA . (actual_parameter_part . 1)) (DOT . (actual_parameter_part . 1)) (DOT_DOT . (actual_parameter_part . 1)) (EQUAL . (actual_parameter_part . 1)) (EQUAL_GREATER . (actual_parameter_part . 1)) (GREATER . (actual_parameter_part . 1)) (GREATER_EQUAL . (actual_parameter_part . 1)) (LESS . (actual_parameter_part . 1)) (LESS_EQUAL . (actual_parameter_part . 1)) (LESS_LESS . (actual_parameter_part . 1)) (MINUS . (actual_parameter_part . 1)) (PLUS . (actual_parameter_part . 1)) (SEMICOLON . (actual_parameter_part . 1)) (SLASH . (actual_parameter_part . 1)) (SLASH_EQUAL . (actual_parameter_part . 1)) (STAR . (actual_parameter_part . 1)) (STAR_STAR . (actual_parameter_part . 1)) (TICK_1 . (actual_parameter_part . 1)) (IDENTIFIER . (actual_parameter_part . 1)) (STRING_LITERAL . (actual_parameter_part . 1)) (CHARACTER_LITERAL . (actual_parameter_part . 1)))
      ((default . error) (ACCEPT . (name . 0)) (ABORT . (name . 0)) (AND . (name . 0)) (BEGIN . (name . 0)) (CASE . (name . 0)) (DECLARE . (name . 0)) (DELAY . (name . 0)) (DIGITS . (name . 0)) (DO . (name . 0)) (ELSE . (name . 0)) (ELSIF . (name . 0)) (EXIT . (name . 0)) (FOR . (name . 0)) (GOTO . (name . 0)) (IF . (name . 0)) (IN . (name . 0)) (IS . (name . 0)) (LOOP . (name . 0)) (MOD . (name . 0)) (NOT . (name . 0)) (NULL . (name . 0)) (OF . (name . 0)) (OR . (name . 0)) (PRAGMA . (name . 0)) (RAISE . (name . 0)) (RANGE . (name . 0)) (REM . (name . 0)) (RENAMES . (name . 0)) (REQUEUE . (name . 0)) (RETURN . (name . 0)) (SELECT . (name . 0)) (THEN . (name . 0)) (USE . (name . 0)) (WHILE . (name . 0)) (WITH . (name . 0)) (XOR . (name . 0)) (LEFT_PAREN . (name . 0)) (RIGHT_PAREN . (name . 0)) (AMPERSAND . (name . 0)) (BAR . (name . 0)) (COLON_EQUAL . (name . 0)) (COMMA . (name . 0)) (DOT . (name . 0)) (DOT_DOT . (name . 0)) (EQUAL . (name . 0)) (EQUAL_GREATER . (name . 0)) (GREATER . (name . 0)) (GREATER_EQUAL . (name . 0)) (LESS . (name . 0)) (LESS_EQUAL . (name . 0)) (LESS_LESS . (name . 0)) (MINUS . (name . 0)) (PLUS . (name . 0)) (SEMICOLON . (name . 0)) (SLASH . (name . 0)) (SLASH_EQUAL . (name . 0)) (STAR . (name . 0)) (STAR_STAR . (name . 0)) (TICK_1 . (name . 0)) (IDENTIFIER . (name . 0)) (STRING_LITERAL . (name . 0)) (CHARACTER_LITERAL . (name . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (assignment_statement . 0)) (ABORT . (assignment_statement . 0)) (BEGIN . (assignment_statement . 0)) (CASE . (assignment_statement . 0)) (DECLARE . (assignment_statement . 0)) (DELAY . (assignment_statement . 0)) (ELSE . (assignment_statement . 0)) (ELSIF . (assignment_statement . 0)) (END . (assignment_statement . 0)) (ENTRY . (assignment_statement . 0)) (EXCEPTION . (assignment_statement . 0)) (EXIT . (assignment_statement . 0)) (FOR . (assignment_statement . 0)) (FUNCTION . (assignment_statement . 0)) (GENERIC . (assignment_statement . 0)) (GOTO . (assignment_statement . 0)) (IF . (assignment_statement . 0)) (LIMITED . (assignment_statement . 0)) (LOOP . (assignment_statement . 0)) (NOT . (assignment_statement . 0)) (NULL . (assignment_statement . 0)) (OR . (assignment_statement . 0)) (OVERRIDING . (assignment_statement . 0)) (PACKAGE . (assignment_statement . 0)) (PRAGMA . (assignment_statement . 0)) (PRIVATE . (assignment_statement . 0)) (PROCEDURE . (assignment_statement . 0)) (PROTECTED . (assignment_statement . 0)) (RAISE . (assignment_statement . 0)) (REQUEUE . (assignment_statement . 0)) (RETURN . (assignment_statement . 0)) (SEPARATE . (assignment_statement . 0)) (SELECT . (assignment_statement . 0)) (SUBTYPE . (assignment_statement . 0)) (TASK . (assignment_statement . 0)) (THEN . (assignment_statement . 0)) (TYPE . (assignment_statement . 0)) (USE . (assignment_statement . 0)) (WHEN . (assignment_statement . 0)) (WHILE . (assignment_statement . 0)) (WITH . (assignment_statement . 0)) (LESS_LESS . (assignment_statement . 0)) (IDENTIFIER . (assignment_statement . 0)) (STRING_LITERAL . (assignment_statement . 0)) (CHARACTER_LITERAL . (assignment_statement . 0)) (Wisi_EOI . (assignment_statement . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  473) (NULL .  124) (LEFT_PAREN .  126) (RIGHT_PAREN . (parameter_specification . 4)) (MINUS .  127) (PLUS .  128) (SEMICOLON . (parameter_specification . 4)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  491) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (NEW .  748))
      ((default . error) (NEW .  749))
      ((default . error) (ABS .  121) (CASE .  257) (FOR .  258) (IF .  259) (NEW .  122) (NOT .  260) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . ((association_opt . 5) (expression_opt . 1))) (BAR . (discrete_choice_list . 2)) (COMMA . (association_opt . 5)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  263))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (aspect_specification_opt . 1)) (TICK_1 .  239))
      ((default . error) (BEGIN . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (ACCEPT . (subprogram_declaration . 0)) (ABORT . (subprogram_declaration . 0)) (BEGIN . (subprogram_declaration . 0)) (CASE . (subprogram_declaration . 0)) (DECLARE . (subprogram_declaration . 0)) (DELAY . (subprogram_declaration . 0)) (END . (subprogram_declaration . 0)) (ENTRY . (subprogram_declaration . 0)) (EXIT . (subprogram_declaration . 0)) (FOR . (subprogram_declaration . 0)) (FUNCTION . (subprogram_declaration . 0)) (GENERIC . (subprogram_declaration . 0)) (GOTO . (subprogram_declaration . 0)) (IF . (subprogram_declaration . 0)) (LIMITED . (subprogram_declaration . 0)) (LOOP . (subprogram_declaration . 0)) (NOT . (subprogram_declaration . 0)) (NULL . (subprogram_declaration . 0)) (OVERRIDING . (subprogram_declaration . 0)) (PACKAGE . (subprogram_declaration . 0)) (PRAGMA . (subprogram_declaration . 0)) (PRIVATE . (subprogram_declaration . 0)) (PROCEDURE . (subprogram_declaration . 0)) (PROTECTED . (subprogram_declaration . 0)) (RAISE . (subprogram_declaration . 0)) (REQUEUE . (subprogram_declaration . 0)) (RETURN . (subprogram_declaration . 0)) (SEPARATE . (subprogram_declaration . 0)) (SELECT . (subprogram_declaration . 0)) (SUBTYPE . (subprogram_declaration . 0)) (TASK . (subprogram_declaration . 0)) (TYPE . (subprogram_declaration . 0)) (USE . (subprogram_declaration . 0)) (WHILE . (subprogram_declaration . 0)) (WITH . (subprogram_declaration . 0)) (LESS_LESS . (subprogram_declaration . 0)) (IDENTIFIER . (subprogram_declaration . 0)) (STRING_LITERAL . (subprogram_declaration . 0)) (CHARACTER_LITERAL . (subprogram_declaration . 0)) (Wisi_EOI . (subprogram_declaration . 0)))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXCEPTION . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (accept_statement . 1)) (ABORT . (accept_statement . 1)) (BEGIN . (accept_statement . 1)) (CASE . (accept_statement . 1)) (DECLARE . (accept_statement . 1)) (DELAY . (accept_statement . 1)) (ELSE . (accept_statement . 1)) (ELSIF . (accept_statement . 1)) (END . (accept_statement . 1)) (ENTRY . (accept_statement . 1)) (EXCEPTION . (accept_statement . 1)) (EXIT . (accept_statement . 1)) (FOR . (accept_statement . 1)) (FUNCTION . (accept_statement . 1)) (GENERIC . (accept_statement . 1)) (GOTO . (accept_statement . 1)) (IF . (accept_statement . 1)) (LIMITED . (accept_statement . 1)) (LOOP . (accept_statement . 1)) (NOT . (accept_statement . 1)) (NULL . (accept_statement . 1)) (OR . (accept_statement . 1)) (OVERRIDING . (accept_statement . 1)) (PACKAGE . (accept_statement . 1)) (PRAGMA . (accept_statement . 1)) (PRIVATE . (accept_statement . 1)) (PROCEDURE . (accept_statement . 1)) (PROTECTED . (accept_statement . 1)) (RAISE . (accept_statement . 1)) (REQUEUE . (accept_statement . 1)) (RETURN . (accept_statement . 1)) (SEPARATE . (accept_statement . 1)) (SELECT . (accept_statement . 1)) (SUBTYPE . (accept_statement . 1)) (TASK . (accept_statement . 1)) (THEN . (accept_statement . 1)) (TYPE . (accept_statement . 1)) (USE . (accept_statement . 1)) (WHEN . (accept_statement . 1)) (WHILE . (accept_statement . 1)) (WITH . (accept_statement . 1)) (LESS_LESS . (accept_statement . 1)) (IDENTIFIER . (accept_statement . 1)) (STRING_LITERAL . (accept_statement . 1)) (CHARACTER_LITERAL . (accept_statement . 1)) (Wisi_EOI . (accept_statement . 1)))
      ((default . error) (AND . (raise_expression . 0)) (DIGITS . (raise_expression . 0)) (DO . (raise_expression . 0)) (ELSE . (raise_expression . 0)) (ELSIF . (raise_expression . 0)) (IS . (raise_expression . 0)) (LOOP . (raise_expression . 0)) (OR . (raise_expression . 0)) (RANGE . (raise_expression . 0)) (THEN . (raise_expression . 0)) (WITH . (raise_expression . 0)) (XOR . (raise_expression . 0)) (RIGHT_PAREN . (raise_expression . 0)) (BAR . (raise_expression . 0)) (COMMA . (raise_expression . 0)) (EQUAL_GREATER . (raise_expression . 0)) (SEMICOLON . (raise_expression . 0)))
      ((default . error) (WHEN .  760))
      ((default . error) (EQUAL_GREATER .  763))
      ((default . error) (ABS .  121) (ELSE . (expression_opt . 1)) (ELSIF . (expression_opt . 1)) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (LEFT_PAREN .  235) (BAR . (discrete_choice . 1)) (DOT .  237) (EQUAL_GREATER . (discrete_choice . 1)) (TICK_1 .  239))
      ((default . error) (ACCEPT . (aggregate . 2)) (ABORT . (aggregate . 2)) (AND . (aggregate . 2)) (BEGIN . (aggregate . 2)) (CASE . (aggregate . 2)) (DECLARE . (aggregate . 2)) (DELAY . (aggregate . 2)) (DIGITS . (aggregate . 2)) (DO . (aggregate . 2)) (ELSE . (aggregate . 2)) (ELSIF . (aggregate . 2)) (EXIT . (aggregate . 2)) (FOR . (aggregate . 2)) (GOTO . (aggregate . 2)) (IF . (aggregate . 2)) (IN . (aggregate . 2)) (IS . (aggregate . 2)) (LOOP . (aggregate . 2)) (MOD . (aggregate . 2)) (NOT . (aggregate . 2)) (NULL . (aggregate . 2)) (OF . (aggregate . 2)) (OR . (aggregate . 2)) (PRAGMA . (aggregate . 2)) (RAISE . (aggregate . 2)) (RANGE . (aggregate . 2)) (REM . (aggregate . 2)) (RENAMES . (aggregate . 2)) (REQUEUE . (aggregate . 2)) (RETURN . (aggregate . 2)) (SELECT . (aggregate . 2)) (THEN . (aggregate . 2)) (USE . (aggregate . 2)) (WHILE . (aggregate . 2)) (WITH . (aggregate . 2)) (XOR . (aggregate . 2)) (LEFT_PAREN . (aggregate . 2)) (RIGHT_PAREN . (aggregate . 2)) (AMPERSAND . (aggregate . 2)) (BAR . (aggregate . 2)) (COLON_EQUAL . (aggregate . 2)) (COMMA . (aggregate . 2)) (DOT . (aggregate . 2)) (DOT_DOT . (aggregate . 2)) (EQUAL . (aggregate . 2)) (EQUAL_GREATER . (aggregate . 2)) (GREATER . (aggregate . 2)) (GREATER_EQUAL . (aggregate . 2)) (LESS . (aggregate . 2)) (LESS_EQUAL . (aggregate . 2)) (LESS_LESS . (aggregate . 2)) (MINUS . (aggregate . 2)) (PLUS . (aggregate . 2)) (SEMICOLON . (aggregate . 2)) (SLASH . (aggregate . 2)) (SLASH_EQUAL . (aggregate . 2)) (STAR . (aggregate . 2)) (STAR_STAR . (aggregate . 2)) (TICK_1 . (aggregate . 2)) (IDENTIFIER . (aggregate . 2)) (STRING_LITERAL . (aggregate . 2)) (CHARACTER_LITERAL . (aggregate . 2)))
      ((default . error) (IS . (association_opt . 1)) (RIGHT_PAREN . (association_opt . 1)) (COMMA . (association_opt . 1)) (SEMICOLON . (association_opt . 1)))
      ((default . error) (IS . (association_opt . 0)) (RIGHT_PAREN . (association_opt . 0)) (COMMA . (association_opt . 0)) (SEMICOLON . (association_opt . 0)))
      ((default . error) (IS . (association_list . 0)) (RIGHT_PAREN . (association_list . 0)) (COMMA . (association_list . 0)) (SEMICOLON . (association_list . 0)))
      ((default . error) (BAR . (discrete_choice_list . 0)) (EQUAL_GREATER . (discrete_choice_list . 0)))
      ((default . error) (BAR . (discrete_choice . 0)) (EQUAL_GREATER . (discrete_choice . 0)))
      ((default . error) (IS . (association_opt . 3)) (RIGHT_PAREN . (association_opt . 3)) (COMMA . (association_opt . 3)) (SEMICOLON . (association_opt . 3)))
      ((default . error) (IS . (association_opt . 2)) (RIGHT_PAREN . (association_opt . 2)) (COMMA . (association_opt . 2)) (SEMICOLON . (association_opt . 2)))
      ((default . error) (AND . (primary . 1)) (IN . (primary . 1)) (MOD . (primary . 1)) (NOT . (primary . 1)) (OR . (primary . 1)) (RECORD .  765) (REM . (primary . 1)) (XOR . (primary . 1)) (RIGHT_PAREN . (primary . 1)) (AMPERSAND . (primary . 1)) (BAR . (primary . 1)) (COMMA . (primary . 1)) (DOT_DOT . (primary . 1)) (EQUAL . (primary . 1)) (EQUAL_GREATER . (primary . 1)) (GREATER . (primary . 1)) (GREATER_EQUAL . (primary . 1)) (LESS . (primary . 1)) (LESS_EQUAL . (primary . 1)) (MINUS . (primary . 1)) (PLUS . (primary . 1)) (SLASH . (primary . 1)) (SLASH_EQUAL . (primary . 1)) (STAR . (primary . 1)) (STAR_STAR . (primary . 1)))
      ((default . error) (RIGHT_PAREN .  766) (COMMA .  442))
      ((default . error) (AND . (range_g . 1)) (DIGITS . (range_g . 1)) (DO . (range_g . 1)) (ELSE . (range_g . 1)) (ELSIF . (range_g . 1)) (IS . (range_g . 1)) (LOOP . (range_g . 1)) (OF . (range_g . 1)) (OR . (range_g . 1)) (RANGE . (range_g . 1)) (THEN . (range_g . 1)) (WITH . (range_g . 1)) (XOR . (range_g . 1)) (LEFT_PAREN .  767) (RIGHT_PAREN . (range_g . 1)) (BAR . (range_g . 1)) (COLON_EQUAL . (range_g . 1)) (COMMA . (range_g . 1)) (EQUAL_GREATER . (range_g . 1)) (SEMICOLON . (range_g . 1)))
      ((default . error) (AND . (range_g . 2)) (DIGITS . (range_g . 2)) (DO . (range_g . 2)) (ELSE . (range_g . 2)) (ELSIF . (range_g . 2)) (IS . (range_g . 2)) (LOOP . (range_g . 2)) (OF . (range_g . 2)) (OR . (range_g . 2)) (RANGE . (range_g . 2)) (THEN . (range_g . 2)) (WITH . (range_g . 2)) (XOR . (range_g . 2)) (RIGHT_PAREN . (range_g . 2)) (BAR . (range_g . 2)) (COLON_EQUAL . (range_g . 2)) (COMMA . (range_g . 2)) (EQUAL_GREATER . (range_g . 2)) (SEMICOLON . (range_g . 2)))
      ((default . error) (BAR .  444) (EQUAL_GREATER .  768))
      ((default . error) (CASE .  769))
      ((default . error) (END . (case_statement_alternative_list . 0)) (WHEN . (case_statement_alternative_list . 0)))
      ((default . error) (AND . (relation_and_then_list . 0)) (DIGITS . (relation_and_then_list . 0)) (DO . (relation_and_then_list . 0)) (ELSE . (relation_and_then_list . 0)) (ELSIF . (relation_and_then_list . 0)) (IS . (relation_and_then_list . 0)) (LOOP . (relation_and_then_list . 0)) (OR . (relation_and_then_list . 0)) (RANGE . (relation_and_then_list . 0)) (THEN . (relation_and_then_list . 0)) (WITH . (relation_and_then_list . 0)) (XOR . (relation_and_then_list . 0)) (RIGHT_PAREN . (relation_and_then_list . 0)) (BAR . (relation_and_then_list . 0)) (COMMA . (relation_and_then_list . 0)) (EQUAL_GREATER . (relation_and_then_list . 0)) (SEMICOLON . (relation_and_then_list . 0)))
      ((default . error) (AND . (relation_or_else_list . 0)) (DIGITS . (relation_or_else_list . 0)) (DO . (relation_or_else_list . 0)) (ELSE . (relation_or_else_list . 0)) (ELSIF . (relation_or_else_list . 0)) (IS . (relation_or_else_list . 0)) (LOOP . (relation_or_else_list . 0)) (OR . (relation_or_else_list . 0)) (RANGE . (relation_or_else_list . 0)) (THEN . (relation_or_else_list . 0)) (WITH . (relation_or_else_list . 0)) (XOR . (relation_or_else_list . 0)) (RIGHT_PAREN . (relation_or_else_list . 0)) (BAR . (relation_or_else_list . 0)) (COMMA . (relation_or_else_list . 0)) (EQUAL_GREATER . (relation_or_else_list . 0)) (SEMICOLON . (relation_or_else_list . 0)))
      ((default . error) (AND . (relation_and_then_list . 1)) (DIGITS . (relation_and_then_list . 1)) (DO . (relation_and_then_list . 1)) (ELSE . (relation_and_then_list . 1)) (ELSIF . (relation_and_then_list . 1)) (IS . (relation_and_then_list . 1)) (LOOP . (relation_and_then_list . 1)) (OR . (relation_and_then_list . 1)) (RANGE . (relation_and_then_list . 1)) (THEN . (relation_and_then_list . 1)) (WITH . (relation_and_then_list . 1)) (XOR . (relation_and_then_list . 1)) (RIGHT_PAREN . (relation_and_then_list . 1)) (BAR . (relation_and_then_list . 1)) (COMMA . (relation_and_then_list . 1)) (EQUAL_GREATER . (relation_and_then_list . 1)) (SEMICOLON . (relation_and_then_list . 1)))
      ((default . error) (AND . (relation_or_else_list . 1)) (DIGITS . (relation_or_else_list . 1)) (DO . (relation_or_else_list . 1)) (ELSE . (relation_or_else_list . 1)) (ELSIF . (relation_or_else_list . 1)) (IS . (relation_or_else_list . 1)) (LOOP . (relation_or_else_list . 1)) (OR . (relation_or_else_list . 1)) (RANGE . (relation_or_else_list . 1)) (THEN . (relation_or_else_list . 1)) (WITH . (relation_or_else_list . 1)) (XOR . (relation_or_else_list . 1)) (RIGHT_PAREN . (relation_or_else_list . 1)) (BAR . (relation_or_else_list . 1)) (COMMA . (relation_or_else_list . 1)) (EQUAL_GREATER . (relation_or_else_list . 1)) (SEMICOLON . (relation_or_else_list . 1)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AND . (relation . 0)) (DIGITS . (relation . 0)) (DO . (relation . 0)) (ELSE . (relation . 0)) (ELSIF . (relation . 0)) (IS . (relation . 0)) (LOOP . (relation . 0)) (OR . (relation . 0)) (RANGE . (relation . 0)) (THEN . (relation . 0)) (WITH . (relation . 0)) (XOR . (relation . 0)) (RIGHT_PAREN . (relation . 0)) (BAR . ( 612 (relation . 0))) (COMMA . (relation . 0)) (EQUAL_GREATER . (relation . 0)) (SEMICOLON . (relation . 0)))
      ((default . error) (ACCEPT . (exit_statement . 0)) (ABORT . (exit_statement . 0)) (BEGIN . (exit_statement . 0)) (CASE . (exit_statement . 0)) (DECLARE . (exit_statement . 0)) (DELAY . (exit_statement . 0)) (ELSE . (exit_statement . 0)) (ELSIF . (exit_statement . 0)) (END . (exit_statement . 0)) (ENTRY . (exit_statement . 0)) (EXCEPTION . (exit_statement . 0)) (EXIT . (exit_statement . 0)) (FOR . (exit_statement . 0)) (FUNCTION . (exit_statement . 0)) (GENERIC . (exit_statement . 0)) (GOTO . (exit_statement . 0)) (IF . (exit_statement . 0)) (LIMITED . (exit_statement . 0)) (LOOP . (exit_statement . 0)) (NOT . (exit_statement . 0)) (NULL . (exit_statement . 0)) (OR . (exit_statement . 0)) (OVERRIDING . (exit_statement . 0)) (PACKAGE . (exit_statement . 0)) (PRAGMA . (exit_statement . 0)) (PRIVATE . (exit_statement . 0)) (PROCEDURE . (exit_statement . 0)) (PROTECTED . (exit_statement . 0)) (RAISE . (exit_statement . 0)) (REQUEUE . (exit_statement . 0)) (RETURN . (exit_statement . 0)) (SEPARATE . (exit_statement . 0)) (SELECT . (exit_statement . 0)) (SUBTYPE . (exit_statement . 0)) (TASK . (exit_statement . 0)) (THEN . (exit_statement . 0)) (TYPE . (exit_statement . 0)) (USE . (exit_statement . 0)) (WHEN . (exit_statement . 0)) (WHILE . (exit_statement . 0)) (WITH . (exit_statement . 0)) (LESS_LESS . (exit_statement . 0)) (IDENTIFIER . (exit_statement . 0)) (STRING_LITERAL . (exit_statement . 0)) (CHARACTER_LITERAL . (exit_statement . 0)) (Wisi_EOI . (exit_statement . 0)))
      ((default . error) (MOD . (primary . 1)) (REM . (primary . 1)) (AMPERSAND . (primary . 1)) (DOT_DOT . (primary . 1)) (MINUS . (primary . 1)) (PLUS . (primary . 1)) (SLASH . (primary . 1)) (STAR . (primary . 1)) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (LOOP . (iterator_specification . 2)) (EQUAL_GREATER . (iterator_specification . 2)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (CASE .  257) (FOR .  258) (IF .  259) (NEW .  122) (NOT .  773) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (association_opt . 5)) (BAR . (discrete_choice_list . 2)) (COMMA . (association_opt . 5)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  263))
      ((default . error) (AND . (subtype_indication . 2)) (DO . (subtype_indication . 2)) (LOOP . (subtype_indication . 2)) (OF . (subtype_indication . 2)) (WITH . (subtype_indication . 2)) (RIGHT_PAREN . (subtype_indication . 2)) (COLON_EQUAL . (subtype_indication . 2)) (COMMA . (subtype_indication . 2)) (EQUAL_GREATER . (subtype_indication . 2)) (SEMICOLON . (subtype_indication . 2)))
      ((default . error) (AND . (constraint . 1)) (DO . (constraint . 1)) (LOOP . (constraint . 1)) (OF . (constraint . 1)) (WITH . (constraint . 1)) (RIGHT_PAREN . (constraint . 1)) (COLON_EQUAL . (constraint . 1)) (COMMA . (constraint . 1)) (EQUAL_GREATER . (constraint . 1)) (SEMICOLON . (constraint . 1)))
      ((default . error) (LOOP . (iterator_specification . 3)) (LEFT_PAREN .  235) (DOT .  237) (EQUAL_GREATER . (iterator_specification . 3)) (TICK_1 .  239))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (REVERSE .  777) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (aspect_clause . 0)) (ABORT . (aspect_clause . 0)) (BEGIN . (aspect_clause . 0)) (CASE . (aspect_clause . 0)) (DECLARE . (aspect_clause . 0)) (DELAY . (aspect_clause . 0)) (END . (aspect_clause . 0)) (ENTRY . (aspect_clause . 0)) (EXIT . (aspect_clause . 0)) (FOR . (aspect_clause . 0)) (FUNCTION . (aspect_clause . 0)) (GENERIC . (aspect_clause . 0)) (GOTO . (aspect_clause . 0)) (IF . (aspect_clause . 0)) (LIMITED . (aspect_clause . 0)) (LOOP . (aspect_clause . 0)) (NOT . (aspect_clause . 0)) (NULL . (aspect_clause . 0)) (OVERRIDING . (aspect_clause . 0)) (PACKAGE . (aspect_clause . 0)) (PRAGMA . (aspect_clause . 0)) (PRIVATE . (aspect_clause . 0)) (PROCEDURE . (aspect_clause . 0)) (PROTECTED . (aspect_clause . 0)) (RAISE . (aspect_clause . 0)) (REQUEUE . (aspect_clause . 0)) (RETURN . (aspect_clause . 0)) (SEPARATE . (aspect_clause . 0)) (SELECT . (aspect_clause . 0)) (SUBTYPE . (aspect_clause . 0)) (TASK . (aspect_clause . 0)) (TYPE . (aspect_clause . 0)) (USE . (aspect_clause . 0)) (WHEN . (aspect_clause . 0)) (WHILE . (aspect_clause . 0)) (WITH . (aspect_clause . 0)) (LESS_LESS . (aspect_clause . 0)) (IDENTIFIER . (aspect_clause . 0)) (STRING_LITERAL . (aspect_clause . 0)) (CHARACTER_LITERAL . (aspect_clause . 0)) (Wisi_EOI . (aspect_clause . 0)))
      ((default . error) (SEMICOLON .  779))
      ((default . error) (MOD .  780))
      ((default . error) (IDENTIFIER .  781))
      ((default . error) (ACCEPT . (enumeration_representation_clause . 0)) (ABORT . (enumeration_representation_clause . 0)) (BEGIN . (enumeration_representation_clause . 0)) (CASE . (enumeration_representation_clause . 0)) (DECLARE . (enumeration_representation_clause . 0)) (DELAY . (enumeration_representation_clause . 0)) (END . (enumeration_representation_clause . 0)) (ENTRY . (enumeration_representation_clause . 0)) (EXIT . (enumeration_representation_clause . 0)) (FOR . (enumeration_representation_clause . 0)) (FUNCTION . (enumeration_representation_clause . 0)) (GENERIC . (enumeration_representation_clause . 0)) (GOTO . (enumeration_representation_clause . 0)) (IF . (enumeration_representation_clause . 0)) (LIMITED . (enumeration_representation_clause . 0)) (LOOP . (enumeration_representation_clause . 0)) (NOT . (enumeration_representation_clause . 0)) (NULL . (enumeration_representation_clause . 0)) (OVERRIDING . (enumeration_representation_clause . 0)) (PACKAGE . (enumeration_representation_clause . 0)) (PRAGMA . (enumeration_representation_clause . 0)) (PRIVATE . (enumeration_representation_clause . 0)) (PROCEDURE . (enumeration_representation_clause . 0)) (PROTECTED . (enumeration_representation_clause . 0)) (RAISE . (enumeration_representation_clause . 0)) (REQUEUE . (enumeration_representation_clause . 0)) (RETURN . (enumeration_representation_clause . 0)) (SEPARATE . (enumeration_representation_clause . 0)) (SELECT . (enumeration_representation_clause . 0)) (SUBTYPE . (enumeration_representation_clause . 0)) (TASK . (enumeration_representation_clause . 0)) (TYPE . (enumeration_representation_clause . 0)) (USE . (enumeration_representation_clause . 0)) (WHEN . (enumeration_representation_clause . 0)) (WHILE . (enumeration_representation_clause . 0)) (WITH . (enumeration_representation_clause . 0)) (LESS_LESS . (enumeration_representation_clause . 0)) (IDENTIFIER . (enumeration_representation_clause . 0)) (STRING_LITERAL . (enumeration_representation_clause . 0)) (CHARACTER_LITERAL . (enumeration_representation_clause . 0)) (Wisi_EOI . (enumeration_representation_clause . 0)))
      ((default . error) (DO . (name_opt . 0)) (IS . (name_opt . 0)) (RENAMES . (name_opt . 0)) (WITH . (name_opt . 0)) (LEFT_PAREN .  235) (RIGHT_PAREN . (name_opt . 0)) (COLON_EQUAL . (name_opt . 0)) (DOT .  237) (SEMICOLON . (name_opt . 0)) (TICK_1 .  239))
      ((default . error) (DO . (result_profile . 0)) (IS . (result_profile . 0)) (RENAMES . (result_profile . 0)) (WITH . (result_profile . 0)) (RIGHT_PAREN . (result_profile . 0)) (COLON_EQUAL . (result_profile . 0)) (SEMICOLON . (result_profile . 0)))
      ((default . error) (ACCESS . (aliased_opt . 1)) (ALIASED .  400) (IN . (aliased_opt . 1)) (NOT . (aliased_opt . 1)) (OUT . (aliased_opt . 1)) (RIGHT_PAREN . (aliased_opt . 1)) (COLON_EQUAL . (aliased_opt . 1)) (SEMICOLON . (aliased_opt . 1)) (IDENTIFIER . (aliased_opt . 1)) (STRING_LITERAL . (aliased_opt . 1)) (CHARACTER_LITERAL . (aliased_opt . 1)))
      ((default . error) (DO . (formal_part . 0)) (IS . (formal_part . 0)) (RENAMES . (formal_part . 0)) (RETURN . (formal_part . 0)) (WHEN . (formal_part . 0)) (WITH . (formal_part . 0)) (RIGHT_PAREN . (formal_part . 0)) (COLON_EQUAL . (formal_part . 0)) (SEMICOLON . (formal_part . 0)))
      ((default . error) (RIGHT_PAREN . (parameter_specification . 4)) (SEMICOLON . (parameter_specification . 4)) (IDENTIFIER .  164))
      ((default . error) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (aspect_specification_opt . 1)) (TICK_1 .  239))
      ((default . error) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (aspect_specification_opt . 1)) (TICK_1 .  239))
      ((default . error) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (aspect_specification_opt . 1)) (TICK_1 .  239))
      ((default . error) (ABSTRACT .  789) (ACCESS . (null_exclusion_opt . 1)) (ARRAY .  698) (DELTA .  790) (DIGITS .  791) (INTERFACE .  701) (LIMITED .  792) (MOD .  793) (NEW . (abstract_limited_synchronized_opt . 5)) (NOT .  385) (PRIVATE . (abstract_tagged_limited_opt . 5)) (PROTECTED .  705) (RANGE .  794) (SYNCHRONIZED .  708) (TAGGED .  795) (TASK .  710) (LEFT_PAREN .  796))
      ((default . error) (SEMICOLON .  804))
      ((default . error) (NEW .  805))
      ((default . error) (NULL .  641) (WITH .  336) (BOX .  642) (SEMICOLON . (aspect_specification_opt . 1)) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (WITH . (subprogram_default . 2)) (SEMICOLON . (subprogram_default . 2)))
      ((default . error) (WITH . (subprogram_default . 1)) (SEMICOLON . (subprogram_default . 1)))
      ((default . error) (WITH . (subprogram_default . 0)) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (subprogram_default . 0)) (TICK_1 .  239))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (FUNCTION . (formal_subprogram_declaration . 3)) (PACKAGE . (formal_subprogram_declaration . 3)) (PRAGMA . (formal_subprogram_declaration . 3)) (PROCEDURE . (formal_subprogram_declaration . 3)) (TYPE . (formal_subprogram_declaration . 3)) (USE . (formal_subprogram_declaration . 3)) (WITH . (formal_subprogram_declaration . 3)) (IDENTIFIER . (formal_subprogram_declaration . 3)))
      ((default . error) (ACCESS . (mode_opt . 1)) (NOT . (mode_opt . 1)) (WITH . (mode_opt . 1)) (COLON_EQUAL . (mode_opt . 1)) (SEMICOLON . (mode_opt . 1)) (IDENTIFIER . (mode_opt . 1)) (STRING_LITERAL . (mode_opt . 1)) (CHARACTER_LITERAL . (mode_opt . 1)))
      ((default . error) (WITH .  336) (COLON_EQUAL .  809) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (ACCESS .  555) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (THEN . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IF .  814))
      ((default . error) (ELSE . (elsif_statement_list . 1)) (ELSIF . (elsif_statement_list . 1)) (END . (elsif_statement_list . 1)))
      ((default . error) (ELSE .  815) (ELSIF .  650) (END .  816))
      ((default . error) (ACCEPT . (with_clause . 0)) (ABORT . (with_clause . 0)) (BEGIN . (with_clause . 0)) (CASE . (with_clause . 0)) (DECLARE . (with_clause . 0)) (DELAY . (with_clause . 0)) (ENTRY . (with_clause . 0)) (EXIT . (with_clause . 0)) (FOR . (with_clause . 0)) (FUNCTION . (with_clause . 0)) (GENERIC . (with_clause . 0)) (GOTO . (with_clause . 0)) (IF . (with_clause . 0)) (LIMITED . (with_clause . 0)) (LOOP . (with_clause . 0)) (NOT . (with_clause . 0)) (NULL . (with_clause . 0)) (OVERRIDING . (with_clause . 0)) (PACKAGE . (with_clause . 0)) (PRAGMA . (with_clause . 0)) (PRIVATE . (with_clause . 0)) (PROCEDURE . (with_clause . 0)) (PROTECTED . (with_clause . 0)) (RAISE . (with_clause . 0)) (REQUEUE . (with_clause . 0)) (RETURN . (with_clause . 0)) (SEPARATE . (with_clause . 0)) (SELECT . (with_clause . 0)) (SUBTYPE . (with_clause . 0)) (TASK . (with_clause . 0)) (TYPE . (with_clause . 0)) (USE . (with_clause . 0)) (WHILE . (with_clause . 0)) (WITH . (with_clause . 0)) (LESS_LESS . (with_clause . 0)) (IDENTIFIER . (with_clause . 0)) (STRING_LITERAL . (with_clause . 0)) (CHARACTER_LITERAL . (with_clause . 0)) (Wisi_EOI . (with_clause . 0)))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (BEGIN . (declarative_part_opt . 1)) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (aspect_specification_opt . 1)) (TICK_1 .  239))
      ((default . error) (SEMICOLON .  821))
      ((default . error) (END .  822) (PRIVATE .  823))
      ((default . error) (SEMICOLON .  824))
      ((default . error) (SEMICOLON .  825))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (END . (protected_operation_item_list_opt . 1)) (ENTRY .  827) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (NOT .  12) (OVERRIDING .  14) (PROCEDURE . (overriding_indicator_opt . 2)))
      ((default . error) (IS .  838))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (END .  841) (PRIVATE .  842))
      ((default . error) (SEMICOLON .  843))
      ((default . error) (ACCEPT . (raise_statement . 0)) (ABORT . (raise_statement . 0)) (BEGIN . (raise_statement . 0)) (CASE . (raise_statement . 0)) (DECLARE . (raise_statement . 0)) (DELAY . (raise_statement . 0)) (ELSE . (raise_statement . 0)) (ELSIF . (raise_statement . 0)) (END . (raise_statement . 0)) (ENTRY . (raise_statement . 0)) (EXCEPTION . (raise_statement . 0)) (EXIT . (raise_statement . 0)) (FOR . (raise_statement . 0)) (FUNCTION . (raise_statement . 0)) (GENERIC . (raise_statement . 0)) (GOTO . (raise_statement . 0)) (IF . (raise_statement . 0)) (LIMITED . (raise_statement . 0)) (LOOP . (raise_statement . 0)) (NOT . (raise_statement . 0)) (NULL . (raise_statement . 0)) (OR . (raise_statement . 0)) (OVERRIDING . (raise_statement . 0)) (PACKAGE . (raise_statement . 0)) (PRAGMA . (raise_statement . 0)) (PRIVATE . (raise_statement . 0)) (PROCEDURE . (raise_statement . 0)) (PROTECTED . (raise_statement . 0)) (RAISE . (raise_statement . 0)) (REQUEUE . (raise_statement . 0)) (RETURN . (raise_statement . 0)) (SEPARATE . (raise_statement . 0)) (SELECT . (raise_statement . 0)) (SUBTYPE . (raise_statement . 0)) (TASK . (raise_statement . 0)) (THEN . (raise_statement . 0)) (TYPE . (raise_statement . 0)) (USE . (raise_statement . 0)) (WHEN . (raise_statement . 0)) (WHILE . (raise_statement . 0)) (WITH . (raise_statement . 0)) (LESS_LESS . (raise_statement . 0)) (IDENTIFIER . (raise_statement . 0)) (STRING_LITERAL . (raise_statement . 0)) (CHARACTER_LITERAL . (raise_statement . 0)) (Wisi_EOI . (raise_statement . 0)))
      ((default . error) (ACCEPT . (requeue_statement . 0)) (ABORT . (requeue_statement . 0)) (BEGIN . (requeue_statement . 0)) (CASE . (requeue_statement . 0)) (DECLARE . (requeue_statement . 0)) (DELAY . (requeue_statement . 0)) (ELSE . (requeue_statement . 0)) (ELSIF . (requeue_statement . 0)) (END . (requeue_statement . 0)) (ENTRY . (requeue_statement . 0)) (EXCEPTION . (requeue_statement . 0)) (EXIT . (requeue_statement . 0)) (FOR . (requeue_statement . 0)) (FUNCTION . (requeue_statement . 0)) (GENERIC . (requeue_statement . 0)) (GOTO . (requeue_statement . 0)) (IF . (requeue_statement . 0)) (LIMITED . (requeue_statement . 0)) (LOOP . (requeue_statement . 0)) (NOT . (requeue_statement . 0)) (NULL . (requeue_statement . 0)) (OR . (requeue_statement . 0)) (OVERRIDING . (requeue_statement . 0)) (PACKAGE . (requeue_statement . 0)) (PRAGMA . (requeue_statement . 0)) (PRIVATE . (requeue_statement . 0)) (PROCEDURE . (requeue_statement . 0)) (PROTECTED . (requeue_statement . 0)) (RAISE . (requeue_statement . 0)) (REQUEUE . (requeue_statement . 0)) (RETURN . (requeue_statement . 0)) (SEPARATE . (requeue_statement . 0)) (SELECT . (requeue_statement . 0)) (SUBTYPE . (requeue_statement . 0)) (TASK . (requeue_statement . 0)) (THEN . (requeue_statement . 0)) (TYPE . (requeue_statement . 0)) (USE . (requeue_statement . 0)) (WHEN . (requeue_statement . 0)) (WHILE . (requeue_statement . 0)) (WITH . (requeue_statement . 0)) (LESS_LESS . (requeue_statement . 0)) (IDENTIFIER . (requeue_statement . 0)) (STRING_LITERAL . (requeue_statement . 0)) (CHARACTER_LITERAL . (requeue_statement . 0)) (Wisi_EOI . (requeue_statement . 0)))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (NOT .  741) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (RETURN .  847))
      ((default . error) (BODY .  848))
      ((default . error) (BODY .  849))
      ((default . error) (BODY .  850))
      ((default . error) (FUNCTION .  7) (PROCEDURE .  18))
      ((default . error) (ACCEPT . (subunit . 0)) (ABORT . (subunit . 0)) (BEGIN . (subunit . 0)) (CASE . (subunit . 0)) (DECLARE . (subunit . 0)) (DELAY . (subunit . 0)) (ENTRY . (subunit . 0)) (EXIT . (subunit . 0)) (FOR . (subunit . 0)) (FUNCTION . (subunit . 0)) (GENERIC . (subunit . 0)) (GOTO . (subunit . 0)) (IF . (subunit . 0)) (LIMITED . (subunit . 0)) (LOOP . (subunit . 0)) (NOT . (subunit . 0)) (NULL . (subunit . 0)) (OVERRIDING . (subunit . 0)) (PACKAGE . (subunit . 0)) (PRAGMA . (subunit . 0)) (PRIVATE . (subunit . 0)) (PROCEDURE . (subunit . 0)) (PROTECTED . (subunit . 0)) (RAISE . (subunit . 0)) (REQUEUE . (subunit . 0)) (RETURN . (subunit . 0)) (SEPARATE . (subunit . 0)) (SELECT . (subunit . 0)) (SUBTYPE . (subunit . 0)) (TASK . (subunit . 0)) (TYPE . (subunit . 0)) (USE . (subunit . 0)) (WHILE . (subunit . 0)) (WITH . (subunit . 0)) (LESS_LESS . (subunit . 0)) (IDENTIFIER . (subunit . 0)) (STRING_LITERAL . (subunit . 0)) (CHARACTER_LITERAL . (subunit . 0)) (Wisi_EOI . (subunit . 0)))
      ((default . error) (SEMICOLON .  852))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (ELSE . (sequence_of_statements_opt . 1)) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (OR . (sequence_of_statements_opt . 1)) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ELSE . (select_alternative . 2)) (END . (select_alternative . 2)) (OR . (select_alternative . 2)))
      ((default . error) (SELECT .  854))
      ((default . error) (SELECT .  855))
      ((default . error) (ELSE . (delay_alternative . 0)) (END . (delay_alternative . 0)) (OR . (delay_alternative . 0)))
      ((default . error) (SELECT .  856))
      ((default . error) (ACCEPT . (selective_accept . 1)) (ABORT . (selective_accept . 1)) (BEGIN . (selective_accept . 1)) (CASE . (selective_accept . 1)) (DECLARE . (selective_accept . 1)) (DELAY . (selective_accept . 1)) (ELSE . (selective_accept . 1)) (ELSIF . (selective_accept . 1)) (END . (selective_accept . 1)) (ENTRY . (selective_accept . 1)) (EXCEPTION . (selective_accept . 1)) (EXIT . (selective_accept . 1)) (FOR . (selective_accept . 1)) (FUNCTION . (selective_accept . 1)) (GENERIC . (selective_accept . 1)) (GOTO . (selective_accept . 1)) (IF . (selective_accept . 1)) (LIMITED . (selective_accept . 1)) (LOOP . (selective_accept . 1)) (NOT . (selective_accept . 1)) (NULL . (selective_accept . 1)) (OR . (selective_accept . 1)) (OVERRIDING . (selective_accept . 1)) (PACKAGE . (selective_accept . 1)) (PRAGMA . (selective_accept . 1)) (PRIVATE . (selective_accept . 1)) (PROCEDURE . (selective_accept . 1)) (PROTECTED . (selective_accept . 1)) (RAISE . (selective_accept . 1)) (REQUEUE . (selective_accept . 1)) (RETURN . (selective_accept . 1)) (SEPARATE . (selective_accept . 1)) (SELECT . (selective_accept . 1)) (SUBTYPE . (selective_accept . 1)) (TASK . (selective_accept . 1)) (THEN . (selective_accept . 1)) (TYPE . (selective_accept . 1)) (USE . (selective_accept . 1)) (WHEN . (selective_accept . 1)) (WHILE . (selective_accept . 1)) (WITH . (selective_accept . 1)) (LESS_LESS . (selective_accept . 1)) (IDENTIFIER . (selective_accept . 1)) (STRING_LITERAL . (selective_accept . 1)) (CHARACTER_LITERAL . (selective_accept . 1)) (Wisi_EOI . (selective_accept . 1)))
      ((default . error) (END .  857))
      ((default . error) (SEMICOLON .  858))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (BEGIN . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (IS .  861) (SEMICOLON .  862))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (END . (task_definition . 1)) (PRIVATE .  864))
      ((default . error) (END .  865))
      ((default . error) (IS . (discriminant_part_opt . 0)) (WITH . (discriminant_part_opt . 0)) (SEMICOLON . (discriminant_part_opt . 0)))
      ((default . error) (IS . (discriminant_part_opt . 1)) (WITH . (discriminant_part_opt . 1)) (SEMICOLON . (discriminant_part_opt . 1)))
      ((default . error) (RIGHT_PAREN . (discriminant_specification_opt . 4)) (SEMICOLON . (discriminant_specification_opt . 4)) (IDENTIFIER .  164))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (NOT .  867) (IDENTIFIER .  868) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (LIMITED .  873) (NEW . ((abstract_limited_synchronized_opt . 2) (abstract_limited_opt . 2))) (SYNCHRONIZED .  874) (TAGGED .  875))
      ((default . error) (LEFT_PAREN .  876))
      ((default . error) (ABS .  121) (DIGITS . (expression_opt . 1)) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (RANGE . (expression_opt . 1)) (WITH . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (RANGE . (expression_opt . 1)) (WITH . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (WITH . (interface_type_definition . 8)) (SEMICOLON . (interface_type_definition . 8)))
      ((default . error) (INTERFACE .  879) (NEW . ((abstract_limited_synchronized_opt . 3) (abstract_limited_opt . 1))) (NULL . (abstract_tagged_limited_opt . 4)) (PRIVATE . (abstract_tagged_limited_opt . 4)) (RECORD . (abstract_tagged_limited_opt . 4)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (WITH . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (RECORD .  881))
      ((default . error) (INTERFACE .  882))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (CASE .  884) (END . (component_list_opt . 1)) (FOR .  183) (NULL .  885) (IDENTIFIER .  164))
      ((default . error) (INTERFACE .  893) (NEW . (abstract_limited_synchronized_opt . 4)))
      ((default . error) (LIMITED .  894) (NULL . (abstract_tagged_limited_opt . 3)) (PRIVATE . (abstract_tagged_limited_opt . 3)) (RECORD . (abstract_tagged_limited_opt . 3)) (SEMICOLON .  895))
      ((default . error) (INTERFACE .  896))
      ((default . error) (IDENTIFIER .  897) (CHARACTER_LITERAL .  898))
      ((default . error) (NEW .  901))
      ((default . error) (NEW .  902))
      ((default . error) (NULL .  704) (PRIVATE .  903) (RECORD .  707))
      ((default . error) (WITH . (type_definition . 8)) (SEMICOLON . (type_definition . 8)))
      ((default . error) (WITH . (type_definition . 6)) (SEMICOLON . (type_definition . 6)))
      ((default . error) (WITH . (type_definition . 9)) (SEMICOLON . (type_definition . 9)))
      ((default . error) (WITH . (type_definition . 0)) (SEMICOLON . (type_definition . 0)))
      ((default . error) (WITH . (type_definition . 10)) (SEMICOLON . (type_definition . 10)))
      ((default . error) (ACCESS .  555))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (ACCEPT . (use_clause . 0)) (ABORT . (use_clause . 0)) (BEGIN . (use_clause . 0)) (CASE . (use_clause . 0)) (DECLARE . (use_clause . 0)) (DELAY . (use_clause . 0)) (END . (use_clause . 0)) (ENTRY . (use_clause . 0)) (EXIT . (use_clause . 0)) (FOR . (use_clause . 0)) (FUNCTION . (use_clause . 0)) (GENERIC . (use_clause . 0)) (GOTO . (use_clause . 0)) (IF . (use_clause . 0)) (LIMITED . (use_clause . 0)) (LOOP . (use_clause . 0)) (NOT . (use_clause . 0)) (NULL . (use_clause . 0)) (OVERRIDING . (use_clause . 0)) (PACKAGE . (use_clause . 0)) (PRAGMA . (use_clause . 0)) (PRIVATE . (use_clause . 0)) (PROCEDURE . (use_clause . 0)) (PROTECTED . (use_clause . 0)) (RAISE . (use_clause . 0)) (REQUEUE . (use_clause . 0)) (RETURN . (use_clause . 0)) (SEPARATE . (use_clause . 0)) (SELECT . (use_clause . 0)) (SUBTYPE . (use_clause . 0)) (TASK . (use_clause . 0)) (TYPE . (use_clause . 0)) (USE . (use_clause . 0)) (WHILE . (use_clause . 0)) (WITH . (use_clause . 0)) (LESS_LESS . (use_clause . 0)) (IDENTIFIER . (use_clause . 0)) (STRING_LITERAL . (use_clause . 0)) (CHARACTER_LITERAL . (use_clause . 0)) (Wisi_EOI . (use_clause . 0)))
      ((default . error) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (aspect_specification_opt . 1)) (TICK_1 .  239))
      ((default . error) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (aspect_specification_opt . 1)) (TICK_1 .  239))
      ((default . error) (IDENTIFIER . (general_access_modifier_opt . 0)) (STRING_LITERAL . (general_access_modifier_opt . 0)) (CHARACTER_LITERAL . (general_access_modifier_opt . 0)))
      ((default . error) (IDENTIFIER . (general_access_modifier_opt . 1)) (STRING_LITERAL . (general_access_modifier_opt . 1)) (CHARACTER_LITERAL . (general_access_modifier_opt . 1)))
      ((default . error) (FUNCTION . (protected_opt . 0)) (PROCEDURE . (protected_opt . 0)))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (FUNCTION .  909) (PROCEDURE .  910))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  912))
      ((default . error) (OTHERS .  913) (IDENTIFIER .  914) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (END . (exception_handler_list . 1)) (WHEN . (exception_handler_list . 1)))
      ((default . error) (END . (exception_handler_list_opt . 0)) (WHEN .  732))
      ((default . error) (END . (handled_sequence_of_statements . 0)))
      ((default . error) (END . (exception_handler_list . 2)) (WHEN . (exception_handler_list . 2)))
      ((default . error) (END .  919))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (LOOP .  921))
      ((default . error) (SEMICOLON .  922))
      ((default . error) (NULL .  923))
      ((default . error) (WITH .  336) (COLON_EQUAL .  924) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (WITH .  336) (COLON_EQUAL .  926) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (WITH .  336) (COLON_EQUAL .  928) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (RIGHT_PAREN . (range_list . 0)) (COMMA . (range_list . 0)))
      ((default . error) (RIGHT_PAREN .  930))
      ((default . error) (SEMICOLON .  931))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (RIGHT_PAREN .  934) (COMMA .  442))
      ((default . error) (RIGHT_PAREN .  935))
      ((default . error) (RIGHT_PAREN .  936))
      ((default . error) (SEMICOLON .  937))
      ((default . error) (SEMICOLON .  938))
      ((default . error) (SEMICOLON .  939))
      ((default . error) (SEMICOLON .  940))
      ((default . error) (SEMICOLON .  941))
      ((default . error) (BEGIN .  942))
      ((default . error) (END .  943))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  260) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (BAR . (discrete_choice_list . 2)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (RIGHT_PAREN . (case_expression_alternative_list . 1)) (COMMA . (case_expression_alternative_list . 1)))
      ((default . error) (RIGHT_PAREN . (case_expression . 0)) (COMMA .  945))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ELSE .  947) (ELSIF .  948) (RIGHT_PAREN . (if_expression . 3)))
      ((default . error) (RIGHT_PAREN .  951))
      ((default . error) (ACCEPT . (aggregate . 1)) (ABORT . (aggregate . 1)) (AND . (aggregate . 1)) (BEGIN . (aggregate . 1)) (CASE . (aggregate . 1)) (DECLARE . (aggregate . 1)) (DELAY . (aggregate . 1)) (DIGITS . (aggregate . 1)) (DO . (aggregate . 1)) (ELSE . (aggregate . 1)) (ELSIF . (aggregate . 1)) (EXIT . (aggregate . 1)) (FOR . (aggregate . 1)) (GOTO . (aggregate . 1)) (IF . (aggregate . 1)) (IN . (aggregate . 1)) (IS . (aggregate . 1)) (LOOP . (aggregate . 1)) (MOD . (aggregate . 1)) (NOT . (aggregate . 1)) (NULL . (aggregate . 1)) (OF . (aggregate . 1)) (OR . (aggregate . 1)) (PRAGMA . (aggregate . 1)) (RAISE . (aggregate . 1)) (RANGE . (aggregate . 1)) (REM . (aggregate . 1)) (RENAMES . (aggregate . 1)) (REQUEUE . (aggregate . 1)) (RETURN . (aggregate . 1)) (SELECT . (aggregate . 1)) (THEN . (aggregate . 1)) (USE . (aggregate . 1)) (WHILE . (aggregate . 1)) (WITH . (aggregate . 1)) (XOR . (aggregate . 1)) (LEFT_PAREN . (aggregate . 1)) (RIGHT_PAREN . (aggregate . 1)) (AMPERSAND . (aggregate . 1)) (BAR . (aggregate . 1)) (COLON_EQUAL . (aggregate . 1)) (COMMA . (aggregate . 1)) (DOT . (aggregate . 1)) (DOT_DOT . (aggregate . 1)) (EQUAL . (aggregate . 1)) (EQUAL_GREATER . (aggregate . 1)) (GREATER . (aggregate . 1)) (GREATER_EQUAL . (aggregate . 1)) (LESS . (aggregate . 1)) (LESS_EQUAL . (aggregate . 1)) (LESS_LESS . (aggregate . 1)) (MINUS . (aggregate . 1)) (PLUS . (aggregate . 1)) (SEMICOLON . (aggregate . 1)) (SLASH . (aggregate . 1)) (SLASH_EQUAL . (aggregate . 1)) (STAR . (aggregate . 1)) (STAR_STAR . (aggregate . 1)) (TICK_1 . (aggregate . 1)) (IDENTIFIER . (aggregate . 1)) (STRING_LITERAL . (aggregate . 1)) (CHARACTER_LITERAL . (aggregate . 1)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHEN . (sequence_of_statements_opt . 1)) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  954))
      ((default . error) (AND . (membership_choice_list . 0)) (DIGITS . (membership_choice_list . 0)) (DO . (membership_choice_list . 0)) (ELSE . (membership_choice_list . 0)) (ELSIF . (membership_choice_list . 0)) (IS . (membership_choice_list . 0)) (LOOP . (membership_choice_list . 0)) (OR . (membership_choice_list . 0)) (RANGE . (membership_choice_list . 0)) (THEN . (membership_choice_list . 0)) (WITH . (membership_choice_list . 0)) (XOR . (membership_choice_list . 0)) (RIGHT_PAREN . (membership_choice_list . 0)) (BAR . (membership_choice_list . 0)) (COMMA . (membership_choice_list . 0)) (EQUAL_GREATER . (membership_choice_list . 0)) (SEMICOLON . (membership_choice_list . 0)))
      ((default . error) (AND . (subtype_indication . 1)) (DO . (subtype_indication . 1)) (LOOP . (subtype_indication . 1)) (OF . (subtype_indication . 1)) (RANGE .  617) (WITH . (subtype_indication . 1)) (LEFT_PAREN .  618) (RIGHT_PAREN . (subtype_indication . 1)) (COLON_EQUAL . (subtype_indication . 1)) (COMMA . (subtype_indication . 1)) (DOT .  237) (EQUAL_GREATER . (subtype_indication . 1)) (SEMICOLON . (subtype_indication . 1)) (TICK_1 .  239))
      ((default . error) (AND . (constraint . 0)) (DO . (constraint . 0)) (LOOP . (constraint . 0)) (OF . (constraint . 0)) (WITH . (constraint . 0)) (RIGHT_PAREN . (constraint . 0)) (COLON_EQUAL . (constraint . 0)) (COMMA . (constraint . 0)) (EQUAL_GREATER . (constraint . 0)) (SEMICOLON . (constraint . 0)))
      ((default . error) (NEW .  122) (NULL .  956) (LEFT_PAREN .  126) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (RIGHT_PAREN . (discrete_subtype_definition_list . 1)) (COMMA . (discrete_subtype_definition_list . 1)))
      ((default . error) (RIGHT_PAREN .  957) (COMMA .  958))
      ((default . error) (RIGHT_PAREN . ((discrete_subtype_definition . 1) (range_list . 1))) (BAR . (discrete_choice . 2)) (COMMA . ((discrete_subtype_definition . 1) (range_list . 1))) (EQUAL_GREATER . (discrete_choice . 2)))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (LOOP . (iterator_specification . 1)) (LEFT_PAREN .  235) (DOT .  237) (EQUAL_GREATER . (iterator_specification . 1)) (TICK_1 .  239))
      ((default . error) (ACCEPT . (at_clause . 0)) (ABORT . (at_clause . 0)) (BEGIN . (at_clause . 0)) (CASE . (at_clause . 0)) (DECLARE . (at_clause . 0)) (DELAY . (at_clause . 0)) (END . (at_clause . 0)) (ENTRY . (at_clause . 0)) (EXIT . (at_clause . 0)) (FOR . (at_clause . 0)) (FUNCTION . (at_clause . 0)) (GENERIC . (at_clause . 0)) (GOTO . (at_clause . 0)) (IF . (at_clause . 0)) (LIMITED . (at_clause . 0)) (LOOP . (at_clause . 0)) (NOT . (at_clause . 0)) (NULL . (at_clause . 0)) (OVERRIDING . (at_clause . 0)) (PACKAGE . (at_clause . 0)) (PRAGMA . (at_clause . 0)) (PRIVATE . (at_clause . 0)) (PROCEDURE . (at_clause . 0)) (PROTECTED . (at_clause . 0)) (RAISE . (at_clause . 0)) (REQUEUE . (at_clause . 0)) (RETURN . (at_clause . 0)) (SEPARATE . (at_clause . 0)) (SELECT . (at_clause . 0)) (SUBTYPE . (at_clause . 0)) (TASK . (at_clause . 0)) (TYPE . (at_clause . 0)) (USE . (at_clause . 0)) (WHEN . (at_clause . 0)) (WHILE . (at_clause . 0)) (WITH . (at_clause . 0)) (LESS_LESS . (at_clause . 0)) (IDENTIFIER . (at_clause . 0)) (STRING_LITERAL . (at_clause . 0)) (CHARACTER_LITERAL . (at_clause . 0)) (Wisi_EOI . (at_clause . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AT .  961))
      ((default . error) (END . (component_clause_list . 1)) (IDENTIFIER . (component_clause_list . 1)))
      ((default . error) (END .  962) (IDENTIFIER .  781))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (IN .  503) (NOT . ( 385 (mode_opt . 3))) (OUT .  504) (IDENTIFIER . (mode_opt . 3)) (STRING_LITERAL . (mode_opt . 3)) (CHARACTER_LITERAL . (mode_opt . 3)))
      ((default . error) (RIGHT_PAREN . (parameter_specification_list . 0)) (SEMICOLON . (parameter_specification_list . 0)))
      ((default . error) (SEMICOLON .  966))
      ((default . error) (SEMICOLON .  967))
      ((default . error) (SEMICOLON .  968))
      ((default . error) (LIMITED .  969) (NEW . (abstract_limited_synchronized_opt . 2)) (SYNCHRONIZED .  874) (TAGGED .  875))
      ((default . error) (BOX .  970))
      ((default . error) (BOX .  971))
      ((default . error) (INTERFACE .  879) (NEW . (abstract_limited_synchronized_opt . 3)) (PRIVATE . (abstract_tagged_limited_opt . 4)))
      ((default . error) (BOX .  972))
      ((default . error) (BOX .  973))
      ((default . error) (LIMITED .  894) (PRIVATE . (abstract_tagged_limited_opt . 3)) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (BOX .  975))
      ((default . error) (NEW .  976))
      ((default . error) (PRIVATE .  977))
      ((default . error) (WITH . (formal_type_definition . 9)) (SEMICOLON . (formal_type_definition . 9)))
      ((default . error) (WITH . (formal_type_definition . 8)) (SEMICOLON . (formal_type_definition . 8)))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (WITH . (formal_type_definition . 1)) (SEMICOLON . (formal_type_definition . 1)))
      ((default . error) (WITH . (formal_type_definition . 10)) (SEMICOLON . (formal_type_definition . 10)))
      ((default . error) (FUNCTION . (formal_type_declaration . 2)) (PACKAGE . (formal_type_declaration . 2)) (PRAGMA . (formal_type_declaration . 2)) (PROCEDURE . (formal_type_declaration . 2)) (TYPE . (formal_type_declaration . 2)) (USE . (formal_type_declaration . 2)) (WITH . (formal_type_declaration . 2)) (IDENTIFIER . (formal_type_declaration . 2)))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  980))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (SEMICOLON .  982))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (WITH . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  984))
      ((default . error) (WITH .  336) (LEFT_PAREN .  235) (COLON_EQUAL .  985) (DOT .  237) (SEMICOLON . (aspect_specification_opt . 1)) (TICK_1 .  239))
      ((default . error) (END .  987))
      ((default . error) (THEN .  988))
      ((default . error) (SEMICOLON .  989))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IF .  991))
      ((default . error) (ELSE . (elsif_statement_list . 0)) (ELSIF . (elsif_statement_list . 0)) (END . (elsif_statement_list . 0)))
      ((default . error) (SEMICOLON .  992))
      ((default . error) (BEGIN .  993) (END .  994))
      ((default . error) (SEMICOLON .  995))
      ((default . error) (ACCEPT . (package_renaming_declaration . 0)) (ABORT . (package_renaming_declaration . 0)) (BEGIN . (package_renaming_declaration . 0)) (CASE . (package_renaming_declaration . 0)) (DECLARE . (package_renaming_declaration . 0)) (DELAY . (package_renaming_declaration . 0)) (END . (package_renaming_declaration . 0)) (ENTRY . (package_renaming_declaration . 0)) (EXIT . (package_renaming_declaration . 0)) (FOR . (package_renaming_declaration . 0)) (FUNCTION . (package_renaming_declaration . 0)) (GENERIC . (package_renaming_declaration . 0)) (GOTO . (package_renaming_declaration . 0)) (IF . (package_renaming_declaration . 0)) (LIMITED . (package_renaming_declaration . 0)) (LOOP . (package_renaming_declaration . 0)) (NOT . (package_renaming_declaration . 0)) (NULL . (package_renaming_declaration . 0)) (OVERRIDING . (package_renaming_declaration . 0)) (PACKAGE . (package_renaming_declaration . 0)) (PRAGMA . (package_renaming_declaration . 0)) (PRIVATE . (package_renaming_declaration . 0)) (PROCEDURE . (package_renaming_declaration . 0)) (PROTECTED . (package_renaming_declaration . 0)) (RAISE . (package_renaming_declaration . 0)) (REQUEUE . (package_renaming_declaration . 0)) (RETURN . (package_renaming_declaration . 0)) (SEPARATE . (package_renaming_declaration . 0)) (SELECT . (package_renaming_declaration . 0)) (SUBTYPE . (package_renaming_declaration . 0)) (TASK . (package_renaming_declaration . 0)) (TYPE . (package_renaming_declaration . 0)) (USE . (package_renaming_declaration . 0)) (WHILE . (package_renaming_declaration . 0)) (WITH . (package_renaming_declaration . 0)) (LESS_LESS . (package_renaming_declaration . 0)) (IDENTIFIER . (package_renaming_declaration . 0)) (STRING_LITERAL . (package_renaming_declaration . 0)) (CHARACTER_LITERAL . (package_renaming_declaration . 0)) (Wisi_EOI . (package_renaming_declaration . 0)))
      ((default . error) (SEMICOLON . (name_opt . 1)) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (ACCEPT . (pragma_g . 0)) (ABORT . (pragma_g . 0)) (BEGIN . (pragma_g . 0)) (CASE . (pragma_g . 0)) (DECLARE . (pragma_g . 0)) (DELAY . (pragma_g . 0)) (ELSE . (pragma_g . 0)) (ELSIF . (pragma_g . 0)) (END . (pragma_g . 0)) (ENTRY . (pragma_g . 0)) (EXCEPTION . (pragma_g . 0)) (EXIT . (pragma_g . 0)) (FOR . (pragma_g . 0)) (FUNCTION . (pragma_g . 0)) (GENERIC . (pragma_g . 0)) (GOTO . (pragma_g . 0)) (IF . (pragma_g . 0)) (LIMITED . (pragma_g . 0)) (LOOP . (pragma_g . 0)) (NOT . (pragma_g . 0)) (NULL . (pragma_g . 0)) (OR . (pragma_g . 0)) (OVERRIDING . (pragma_g . 0)) (PACKAGE . (pragma_g . 0)) (PRAGMA . (pragma_g . 0)) (PRIVATE . (pragma_g . 0)) (PROCEDURE . (pragma_g . 0)) (PROTECTED . (pragma_g . 0)) (RAISE . (pragma_g . 0)) (REQUEUE . (pragma_g . 0)) (RETURN . (pragma_g . 0)) (SEPARATE . (pragma_g . 0)) (SELECT . (pragma_g . 0)) (SUBTYPE . (pragma_g . 0)) (TASK . (pragma_g . 0)) (THEN . (pragma_g . 0)) (TYPE . (pragma_g . 0)) (USE . (pragma_g . 0)) (WHEN . (pragma_g . 0)) (WHILE . (pragma_g . 0)) (WITH . (pragma_g . 0)) (LESS_LESS . (pragma_g . 0)) (IDENTIFIER . (pragma_g . 0)) (STRING_LITERAL . (pragma_g . 0)) (CHARACTER_LITERAL . (pragma_g . 0)) (Wisi_EOI . (pragma_g . 0)))
      ((default . error) (ACCEPT . (pragma_g . 1)) (ABORT . (pragma_g . 1)) (BEGIN . (pragma_g . 1)) (CASE . (pragma_g . 1)) (DECLARE . (pragma_g . 1)) (DELAY . (pragma_g . 1)) (ELSE . (pragma_g . 1)) (ELSIF . (pragma_g . 1)) (END . (pragma_g . 1)) (ENTRY . (pragma_g . 1)) (EXCEPTION . (pragma_g . 1)) (EXIT . (pragma_g . 1)) (FOR . (pragma_g . 1)) (FUNCTION . (pragma_g . 1)) (GENERIC . (pragma_g . 1)) (GOTO . (pragma_g . 1)) (IF . (pragma_g . 1)) (LIMITED . (pragma_g . 1)) (LOOP . (pragma_g . 1)) (NOT . (pragma_g . 1)) (NULL . (pragma_g . 1)) (OR . (pragma_g . 1)) (OVERRIDING . (pragma_g . 1)) (PACKAGE . (pragma_g . 1)) (PRAGMA . (pragma_g . 1)) (PRIVATE . (pragma_g . 1)) (PROCEDURE . (pragma_g . 1)) (PROTECTED . (pragma_g . 1)) (RAISE . (pragma_g . 1)) (REQUEUE . (pragma_g . 1)) (RETURN . (pragma_g . 1)) (SEPARATE . (pragma_g . 1)) (SELECT . (pragma_g . 1)) (SUBTYPE . (pragma_g . 1)) (TASK . (pragma_g . 1)) (THEN . (pragma_g . 1)) (TYPE . (pragma_g . 1)) (USE . (pragma_g . 1)) (WHEN . (pragma_g . 1)) (WHILE . (pragma_g . 1)) (WITH . (pragma_g . 1)) (LESS_LESS . (pragma_g . 1)) (IDENTIFIER . (pragma_g . 1)) (STRING_LITERAL . (pragma_g . 1)) (CHARACTER_LITERAL . (pragma_g . 1)) (Wisi_EOI . (pragma_g . 1)))
      ((default . error) (SEMICOLON .  998))
      ((default . error) (IDENTIFIER .  999))
      ((default . error) (END . (protected_operation_item . 5)) (ENTRY . (protected_operation_item . 5)) (FOR . (protected_operation_item . 5)) (FUNCTION . (protected_operation_item . 5)) (NOT . (protected_operation_item . 5)) (OVERRIDING . (protected_operation_item . 5)) (PROCEDURE . (protected_operation_item . 5)))
      ((default . error) (END . (protected_operation_item . 2)) (ENTRY . (protected_operation_item . 2)) (FOR . (protected_operation_item . 2)) (FUNCTION . (protected_operation_item . 2)) (NOT . (protected_operation_item . 2)) (OVERRIDING . (protected_operation_item . 2)) (PROCEDURE . (protected_operation_item . 2)))
      ((default . error) (END . (protected_operation_item . 3)) (ENTRY . (protected_operation_item . 3)) (FOR . (protected_operation_item . 3)) (FUNCTION . (protected_operation_item . 3)) (NOT . (protected_operation_item . 3)) (OVERRIDING . (protected_operation_item . 3)) (PROCEDURE . (protected_operation_item . 3)))
      ((default . error) (END . (protected_operation_item . 4)) (ENTRY . (protected_operation_item . 4)) (FOR . (protected_operation_item . 4)) (FUNCTION . (protected_operation_item . 4)) (NOT . (protected_operation_item . 4)) (OVERRIDING . (protected_operation_item . 4)) (PROCEDURE . (protected_operation_item . 4)))
      ((default . error) (FUNCTION .  7) (PROCEDURE .  18))
      ((default . error) (END . (protected_operation_item_list . 1)) (ENTRY . (protected_operation_item_list . 1)) (FOR . (protected_operation_item_list . 1)) (FUNCTION . (protected_operation_item_list . 1)) (NOT . (protected_operation_item_list . 1)) (OVERRIDING . (protected_operation_item_list . 1)) (PROCEDURE . (protected_operation_item_list . 1)))
      ((default . error) (END . (protected_operation_item_list_opt . 0)) (ENTRY .  827) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (NOT .  12) (OVERRIDING .  14) (PROCEDURE . (overriding_indicator_opt . 2)))
      ((default . error) (END .  1002))
      ((default . error) (END . (protected_operation_item . 1)) (ENTRY . (protected_operation_item . 1)) (FOR . (protected_operation_item . 1)) (FUNCTION . (protected_operation_item . 1)) (NOT . (protected_operation_item . 1)) (OVERRIDING . (protected_operation_item . 1)) (PROCEDURE . (protected_operation_item . 1)))
      ((default . error) (END . (protected_operation_item . 0)) (ENTRY . (protected_operation_item . 0)) (FOR . (protected_operation_item . 0)) (FUNCTION . (protected_operation_item . 0)) (NOT . (protected_operation_item . 0)) (OVERRIDING . (protected_operation_item . 0)) (PROCEDURE . (protected_operation_item . 0)))
      ((default . error) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NEW .  1003) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PRIVATE . (declarative_part_opt . 1)) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (AND .  1005) (WITH .  1006))
      ((default . error) (AND . (interface_list . 1)) (WITH . (interface_list . 1)) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (interface_list . 1)) (TICK_1 .  239))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (ACCEPT . (single_protected_declaration . 1)) (ABORT . (single_protected_declaration . 1)) (BEGIN . (single_protected_declaration . 1)) (CASE . (single_protected_declaration . 1)) (DECLARE . (single_protected_declaration . 1)) (DELAY . (single_protected_declaration . 1)) (END . (single_protected_declaration . 1)) (ENTRY . (single_protected_declaration . 1)) (EXIT . (single_protected_declaration . 1)) (FOR . (single_protected_declaration . 1)) (FUNCTION . (single_protected_declaration . 1)) (GENERIC . (single_protected_declaration . 1)) (GOTO . (single_protected_declaration . 1)) (IF . (single_protected_declaration . 1)) (LIMITED . (single_protected_declaration . 1)) (LOOP . (single_protected_declaration . 1)) (NOT . (single_protected_declaration . 1)) (NULL . (single_protected_declaration . 1)) (OVERRIDING . (single_protected_declaration . 1)) (PACKAGE . (single_protected_declaration . 1)) (PRAGMA . (single_protected_declaration . 1)) (PRIVATE . (single_protected_declaration . 1)) (PROCEDURE . (single_protected_declaration . 1)) (PROTECTED . (single_protected_declaration . 1)) (RAISE . (single_protected_declaration . 1)) (REQUEUE . (single_protected_declaration . 1)) (RETURN . (single_protected_declaration . 1)) (SEPARATE . (single_protected_declaration . 1)) (SELECT . (single_protected_declaration . 1)) (SUBTYPE . (single_protected_declaration . 1)) (TASK . (single_protected_declaration . 1)) (TYPE . (single_protected_declaration . 1)) (USE . (single_protected_declaration . 1)) (WHILE . (single_protected_declaration . 1)) (WITH . (single_protected_declaration . 1)) (LESS_LESS . (single_protected_declaration . 1)) (IDENTIFIER . (single_protected_declaration . 1)) (STRING_LITERAL . (single_protected_declaration . 1)) (CHARACTER_LITERAL . (single_protected_declaration . 1)) (Wisi_EOI . (single_protected_declaration . 1)))
      ((default . error) (DO . (return_subtype_indication . 1)) (COLON_EQUAL . (return_subtype_indication . 1)) (SEMICOLON . (return_subtype_indication . 1)))
      ((default . error) (DO . (extended_return_object_declaration . 1)) (COLON_EQUAL .  1009) (SEMICOLON . (extended_return_object_declaration . 1)))
      ((default . error) (DO . (return_subtype_indication . 0)) (COLON_EQUAL . (return_subtype_indication . 0)) (SEMICOLON . (return_subtype_indication . 0)))
      ((default . error) (SEMICOLON .  1010))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  1012))
      ((default . error) (IDENTIFIER .  1013))
      ((default . error) (IS . (aspect_specification_opt . 1)) (WITH .  336))
      ((default . error) (ELSE . (select_alternative . 1)) (END . (select_alternative . 1)) (OR . (select_alternative . 1)))
      ((default . error) (ELSE . (select_alternative . 0)) (END . (select_alternative . 0)) (OR . (select_alternative . 0)))
      ((default . error) (SEMICOLON .  1015))
      ((default . error) (SEMICOLON .  1016))
      ((default . error) (SEMICOLON .  1017))
      ((default . error) (SELECT .  1018))
      ((default . error) (ACCEPT . (subtype_declaration . 0)) (ABORT . (subtype_declaration . 0)) (BEGIN . (subtype_declaration . 0)) (CASE . (subtype_declaration . 0)) (DECLARE . (subtype_declaration . 0)) (DELAY . (subtype_declaration . 0)) (END . (subtype_declaration . 0)) (ENTRY . (subtype_declaration . 0)) (EXIT . (subtype_declaration . 0)) (FOR . (subtype_declaration . 0)) (FUNCTION . (subtype_declaration . 0)) (GENERIC . (subtype_declaration . 0)) (GOTO . (subtype_declaration . 0)) (IF . (subtype_declaration . 0)) (LIMITED . (subtype_declaration . 0)) (LOOP . (subtype_declaration . 0)) (NOT . (subtype_declaration . 0)) (NULL . (subtype_declaration . 0)) (OVERRIDING . (subtype_declaration . 0)) (PACKAGE . (subtype_declaration . 0)) (PRAGMA . (subtype_declaration . 0)) (PRIVATE . (subtype_declaration . 0)) (PROCEDURE . (subtype_declaration . 0)) (PROTECTED . (subtype_declaration . 0)) (RAISE . (subtype_declaration . 0)) (REQUEUE . (subtype_declaration . 0)) (RETURN . (subtype_declaration . 0)) (SEPARATE . (subtype_declaration . 0)) (SELECT . (subtype_declaration . 0)) (SUBTYPE . (subtype_declaration . 0)) (TASK . (subtype_declaration . 0)) (TYPE . (subtype_declaration . 0)) (USE . (subtype_declaration . 0)) (WHILE . (subtype_declaration . 0)) (WITH . (subtype_declaration . 0)) (LESS_LESS . (subtype_declaration . 0)) (IDENTIFIER . (subtype_declaration . 0)) (STRING_LITERAL . (subtype_declaration . 0)) (CHARACTER_LITERAL . (subtype_declaration . 0)) (Wisi_EOI . (subtype_declaration . 0)))
      ((default . error) (SEMICOLON .  1019))
      ((default . error) (BEGIN .  1020))
      ((default . error) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NEW .  1021) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PRIVATE . (declarative_part_opt . 1)) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (ACCEPT . (task_type_declaration . 2)) (ABORT . (task_type_declaration . 2)) (BEGIN . (task_type_declaration . 2)) (CASE . (task_type_declaration . 2)) (DECLARE . (task_type_declaration . 2)) (DELAY . (task_type_declaration . 2)) (END . (task_type_declaration . 2)) (ENTRY . (task_type_declaration . 2)) (EXIT . (task_type_declaration . 2)) (FOR . (task_type_declaration . 2)) (FUNCTION . (task_type_declaration . 2)) (GENERIC . (task_type_declaration . 2)) (GOTO . (task_type_declaration . 2)) (IF . (task_type_declaration . 2)) (LIMITED . (task_type_declaration . 2)) (LOOP . (task_type_declaration . 2)) (NOT . (task_type_declaration . 2)) (NULL . (task_type_declaration . 2)) (OVERRIDING . (task_type_declaration . 2)) (PACKAGE . (task_type_declaration . 2)) (PRAGMA . (task_type_declaration . 2)) (PRIVATE . (task_type_declaration . 2)) (PROCEDURE . (task_type_declaration . 2)) (PROTECTED . (task_type_declaration . 2)) (RAISE . (task_type_declaration . 2)) (REQUEUE . (task_type_declaration . 2)) (RETURN . (task_type_declaration . 2)) (SEPARATE . (task_type_declaration . 2)) (SELECT . (task_type_declaration . 2)) (SUBTYPE . (task_type_declaration . 2)) (TASK . (task_type_declaration . 2)) (TYPE . (task_type_declaration . 2)) (USE . (task_type_declaration . 2)) (WHILE . (task_type_declaration . 2)) (WITH . (task_type_declaration . 2)) (LESS_LESS . (task_type_declaration . 2)) (IDENTIFIER . (task_type_declaration . 2)) (STRING_LITERAL . (task_type_declaration . 2)) (CHARACTER_LITERAL . (task_type_declaration . 2)) (Wisi_EOI . (task_type_declaration . 2)))
      ((default . error) (AND .  1005) (WITH .  1023))
      ((default . error) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (RIGHT_PAREN . (discriminant_specification_list . 0)) (SEMICOLON . (discriminant_specification_list . 0)))
      ((default . error) (NULL .  1026))
      ((default . error) (LEFT_PAREN . (name . 5)) (RIGHT_PAREN . (null_exclusion_opt_name_type . 0)) (COLON_EQUAL . (null_exclusion_opt_name_type . 0)) (DOT . (name . 5)) (SEMICOLON . (null_exclusion_opt_name_type . 0)) (TICK_1 . (name . 5)))
      ((default . error) (RIGHT_PAREN . (discriminant_specification_opt . 3)) (COLON_EQUAL .  1027) (SEMICOLON . (discriminant_specification_opt . 3)))
      ((default . error) (LEFT_PAREN .  235) (DOT .  237) (TICK_1 .  239))
      ((default . error) (RIGHT_PAREN . (discriminant_specification_opt . 2)) (COLON_EQUAL .  1028) (SEMICOLON . (discriminant_specification_opt . 2)))
      ((default . error) (LEFT_PAREN . (name . 2)) (RIGHT_PAREN . (null_exclusion_opt_name_type . 1)) (COLON_EQUAL . (null_exclusion_opt_name_type . 1)) (DOT . (name . 2)) (SEMICOLON . (null_exclusion_opt_name_type . 1)) (TICK_1 . (name . 2)))
      ((default . error) (NEW . ((abstract_limited_synchronized_opt . 0) (abstract_limited_opt . 0))))
      ((default . error) (NEW . (abstract_limited_synchronized_opt . 1)))
      ((default . error) (LIMITED .  1029) (NULL . (abstract_tagged_limited_opt . 1)) (PRIVATE . (abstract_tagged_limited_opt . 1)) (RECORD . (abstract_tagged_limited_opt . 1)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  473) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (DIGITS .  1034) (RANGE .  1035) (WITH . (real_range_specification_opt . 1)) (SEMICOLON . (real_range_specification_opt . 1)))
      ((default . error) (RANGE .  1035) (WITH . (real_range_specification_opt . 1)) (SEMICOLON . (real_range_specification_opt . 1)))
      ((default . error) (AND .  1038) (WITH . (interface_type_definition . 4)) (SEMICOLON . (interface_type_definition . 4)))
      ((default . error) (WITH . (type_definition . 2)) (SEMICOLON . (type_definition . 2)))
      ((default . error) (WITH . (record_definition . 1)) (SEMICOLON . (record_definition . 1)))
      ((default . error) (AND .  1039) (WITH . (interface_type_definition . 6)) (SEMICOLON . (interface_type_definition . 6)))
      ((default . error) (DOT_DOT .  1040))
      ((default . error) (IS . (direct_name_opt . 1)) (IDENTIFIER .  1041) (STRING_LITERAL .  1042))
      ((default . error) (SEMICOLON .  1045))
      ((default . error) (CASE . (component_item . 1)) (END . (component_item . 1)) (FOR . (component_item . 1)) (WHEN . (component_item . 1)) (IDENTIFIER . (component_item . 1)))
      ((default . error) (CASE . (component_item . 0)) (END . (component_item . 0)) (FOR . (component_item . 0)) (WHEN . (component_item . 0)) (IDENTIFIER . (component_item . 0)))
      ((default . error) (CASE . (component_list . 2)) (END . (component_list . 2)) (FOR . (component_list . 2)) (WHEN . (component_list . 2)) (IDENTIFIER . (component_list . 2)))
      ((default . error) (CASE .  884) (END . (component_list_opt . 0)) (FOR .  183) (WHEN . (component_list_opt . 0)) (IDENTIFIER .  164))
      ((default . error) (END .  1048))
      ((default . error) (COLON .  1049) (COMMA .  234))
      ((default . error) (CASE . (component_list . 3)) (END . (component_list . 3)) (FOR . (component_list . 3)) (WHEN . (component_list . 3)) (IDENTIFIER . (component_list . 3)))
      ((default . error) (AND .  1050) (WITH . (interface_type_definition . 7)) (SEMICOLON . (interface_type_definition . 7)))
      ((default . error) (NULL . (abstract_tagged_limited_opt . 2)) (PRIVATE . (abstract_tagged_limited_opt . 2)) (RECORD . (abstract_tagged_limited_opt . 2)))
      ((default . error) (ACCEPT . (incomplete_type_declaration . 0)) (ABORT . (incomplete_type_declaration . 0)) (BEGIN . (incomplete_type_declaration . 0)) (CASE . (incomplete_type_declaration . 0)) (DECLARE . (incomplete_type_declaration . 0)) (DELAY . (incomplete_type_declaration . 0)) (END . (incomplete_type_declaration . 0)) (ENTRY . (incomplete_type_declaration . 0)) (EXIT . (incomplete_type_declaration . 0)) (FOR . (incomplete_type_declaration . 0)) (FUNCTION . (incomplete_type_declaration . 0)) (GENERIC . (incomplete_type_declaration . 0)) (GOTO . (incomplete_type_declaration . 0)) (IF . (incomplete_type_declaration . 0)) (LIMITED . (incomplete_type_declaration . 0)) (LOOP . (incomplete_type_declaration . 0)) (NOT . (incomplete_type_declaration . 0)) (NULL . (incomplete_type_declaration . 0)) (OVERRIDING . (incomplete_type_declaration . 0)) (PACKAGE . (incomplete_type_declaration . 0)) (PRAGMA . (incomplete_type_declaration . 0)) (PRIVATE . (incomplete_type_declaration . 0)) (PROCEDURE . (incomplete_type_declaration . 0)) (PROTECTED . (incomplete_type_declaration . 0)) (RAISE . (incomplete_type_declaration . 0)) (REQUEUE . (incomplete_type_declaration . 0)) (RETURN . (incomplete_type_declaration . 0)) (SEPARATE . (incomplete_type_declaration . 0)) (SELECT . (incomplete_type_declaration . 0)) (SUBTYPE . (incomplete_type_declaration . 0)) (TASK . (incomplete_type_declaration . 0)) (TYPE . (incomplete_type_declaration . 0)) (USE . (incomplete_type_declaration . 0)) (WHILE . (incomplete_type_declaration . 0)) (WITH . (incomplete_type_declaration . 0)) (LESS_LESS . (incomplete_type_declaration . 0)) (IDENTIFIER . (incomplete_type_declaration . 0)) (STRING_LITERAL . (incomplete_type_declaration . 0)) (CHARACTER_LITERAL . (incomplete_type_declaration . 0)) (Wisi_EOI . (incomplete_type_declaration . 0)))
      ((default . error) (AND .  1051) (WITH . (interface_type_definition . 5)) (SEMICOLON . (interface_type_definition . 5)))
      ((default . error) (RIGHT_PAREN . (enumeration_literal . 0)) (COMMA . (enumeration_literal . 0)))
      ((default . error) (RIGHT_PAREN . (enumeration_literal . 1)) (COMMA . (enumeration_literal . 1)))
      ((default . error) (RIGHT_PAREN . (enumeration_literal_list . 1)) (COMMA . (enumeration_literal_list . 1)))
      ((default . error) (RIGHT_PAREN .  1052) (COMMA .  1053))
      ((default . error) (NOT .  482) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (WITH . (type_definition . 7)) (SEMICOLON . (type_definition . 7)))
      ((default . error) (SEMICOLON .  1057))
      ((default . error) (SEMICOLON .  1058))
      ((default . error) (SEMICOLON .  1059))
      ((default . error) (DO . (access_definition . 2)) (IS . (access_definition . 2)) (RENAMES . (access_definition . 2)) (WITH . (access_definition . 2)) (LEFT_PAREN .  235) (RIGHT_PAREN . (access_definition . 2)) (COLON_EQUAL . (access_definition . 2)) (DOT .  237) (SEMICOLON . (access_definition . 2)) (TICK_1 .  239))
      ((default . error) (RETURN .  316) (LEFT_PAREN .  430))
      ((default . error) (DO . (parameter_profile_opt . 1)) (IS . (parameter_profile_opt . 1)) (RENAMES . (parameter_profile_opt . 1)) (WITH . (parameter_profile_opt . 1)) (LEFT_PAREN .  430) (RIGHT_PAREN . (parameter_profile_opt . 1)) (COLON_EQUAL . (parameter_profile_opt . 1)) (SEMICOLON . (parameter_profile_opt . 1)))
      ((default . error) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (aspect_specification_opt . 1)) (TICK_1 .  239))
      ((default . error) (ACCEPT . (block_statement . 1)) (ABORT . (block_statement . 1)) (BEGIN . (block_statement . 1)) (CASE . (block_statement . 1)) (DECLARE . (block_statement . 1)) (DELAY . (block_statement . 1)) (ELSE . (block_statement . 1)) (ELSIF . (block_statement . 1)) (END . (block_statement . 1)) (ENTRY . (block_statement . 1)) (EXCEPTION . (block_statement . 1)) (EXIT . (block_statement . 1)) (FOR . (block_statement . 1)) (FUNCTION . (block_statement . 1)) (GENERIC . (block_statement . 1)) (GOTO . (block_statement . 1)) (IF . (block_statement . 1)) (LIMITED . (block_statement . 1)) (LOOP . (block_statement . 1)) (NOT . (block_statement . 1)) (NULL . (block_statement . 1)) (OR . (block_statement . 1)) (OVERRIDING . (block_statement . 1)) (PACKAGE . (block_statement . 1)) (PRAGMA . (block_statement . 1)) (PRIVATE . (block_statement . 1)) (PROCEDURE . (block_statement . 1)) (PROTECTED . (block_statement . 1)) (RAISE . (block_statement . 1)) (REQUEUE . (block_statement . 1)) (RETURN . (block_statement . 1)) (SEPARATE . (block_statement . 1)) (SELECT . (block_statement . 1)) (SUBTYPE . (block_statement . 1)) (TASK . (block_statement . 1)) (THEN . (block_statement . 1)) (TYPE . (block_statement . 1)) (USE . (block_statement . 1)) (WHEN . (block_statement . 1)) (WHILE . (block_statement . 1)) (WITH . (block_statement . 1)) (LESS_LESS . (block_statement . 1)) (IDENTIFIER . (block_statement . 1)) (STRING_LITERAL . (block_statement . 1)) (CHARACTER_LITERAL . (block_statement . 1)) (Wisi_EOI . (block_statement . 1)))
      ((default . error) (BAR . (exception_choice . 1)) (EQUAL_GREATER . (exception_choice . 1)))
      ((default . error) (LEFT_PAREN . (name . 5)) (BAR . (name . 5)) (COLON .  1063) (DOT . (name . 5)) (EQUAL_GREATER . (name . 5)) (TICK_1 . (name . 5)))
      ((default . error) (BAR . (exception_choice_list . 1)) (EQUAL_GREATER . (exception_choice_list . 1)))
      ((default . error) (BAR .  1064) (EQUAL_GREATER .  1065))
      ((default . error) (LEFT_PAREN .  235) (BAR . (exception_choice . 0)) (DOT .  237) (EQUAL_GREATER . (exception_choice . 0)) (TICK_1 .  239))
      ((default . error) (END . (exception_handler_list . 0)) (WHEN . (exception_handler_list . 0)))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (SEMICOLON .  1067))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (ACCEPT . (declaration . 9)) (ABORT . (declaration . 9)) (BEGIN . (declaration . 9)) (CASE . (declaration . 9)) (DECLARE . (declaration . 9)) (DELAY . (declaration . 9)) (END . (declaration . 9)) (ENTRY . (declaration . 9)) (EXIT . (declaration . 9)) (FOR . (declaration . 9)) (FUNCTION . (declaration . 9)) (GENERIC . (declaration . 9)) (GOTO . (declaration . 9)) (IF . (declaration . 9)) (LIMITED . (declaration . 9)) (LOOP . (declaration . 9)) (NOT . (declaration . 9)) (NULL . (declaration . 9)) (OVERRIDING . (declaration . 9)) (PACKAGE . (declaration . 9)) (PRAGMA . (declaration . 9)) (PRIVATE . (declaration . 9)) (PROCEDURE . (declaration . 9)) (PROTECTED . (declaration . 9)) (RAISE . (declaration . 9)) (REQUEUE . (declaration . 9)) (RETURN . (declaration . 9)) (SEPARATE . (declaration . 9)) (SELECT . (declaration . 9)) (SUBTYPE . (declaration . 9)) (TASK . (declaration . 9)) (TYPE . (declaration . 9)) (USE . (declaration . 9)) (WHILE . (declaration . 9)) (WITH . (declaration . 9)) (LESS_LESS . (declaration . 9)) (IDENTIFIER . (declaration . 9)) (STRING_LITERAL . (declaration . 9)) (CHARACTER_LITERAL . (declaration . 9)) (Wisi_EOI . (declaration . 9)))
      ((default . error) (ACCESS . (null_exclusion_opt . 0)) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (WITH . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  1070))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (WITH . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  1072))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (WITH . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  1074))
      ((default . error) (WITH . (parameter_profile_opt . 1)) (LEFT_PAREN .  430) (SEMICOLON . (parameter_profile_opt . 1)))
      ((default . error) (ACCEPT . (entry_declaration . 1)) (ABORT . (entry_declaration . 1)) (BEGIN . (entry_declaration . 1)) (CASE . (entry_declaration . 1)) (DECLARE . (entry_declaration . 1)) (DELAY . (entry_declaration . 1)) (END . (entry_declaration . 1)) (ENTRY . (entry_declaration . 1)) (EXIT . (entry_declaration . 1)) (FOR . (entry_declaration . 1)) (FUNCTION . (entry_declaration . 1)) (GENERIC . (entry_declaration . 1)) (GOTO . (entry_declaration . 1)) (IF . (entry_declaration . 1)) (LIMITED . (entry_declaration . 1)) (LOOP . (entry_declaration . 1)) (NOT . (entry_declaration . 1)) (NULL . (entry_declaration . 1)) (OVERRIDING . (entry_declaration . 1)) (PACKAGE . (entry_declaration . 1)) (PRAGMA . (entry_declaration . 1)) (PRIVATE . (entry_declaration . 1)) (PROCEDURE . (entry_declaration . 1)) (PROTECTED . (entry_declaration . 1)) (RAISE . (entry_declaration . 1)) (REQUEUE . (entry_declaration . 1)) (RETURN . (entry_declaration . 1)) (SEPARATE . (entry_declaration . 1)) (SELECT . (entry_declaration . 1)) (SUBTYPE . (entry_declaration . 1)) (TASK . (entry_declaration . 1)) (TYPE . (entry_declaration . 1)) (USE . (entry_declaration . 1)) (WHILE . (entry_declaration . 1)) (WITH . (entry_declaration . 1)) (LESS_LESS . (entry_declaration . 1)) (IDENTIFIER . (entry_declaration . 1)) (STRING_LITERAL . (entry_declaration . 1)) (CHARACTER_LITERAL . (entry_declaration . 1)) (Wisi_EOI . (entry_declaration . 1)))
      ((default . error) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (aspect_specification_opt . 1)) (TICK_1 .  239))
      ((default . error) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (aspect_specification_opt . 1)) (TICK_1 .  239))
      ((default . error) (WITH . (paren_expression . 1)) (SEMICOLON . (paren_expression . 1)))
      ((default . error) (WITH . (paren_expression . 2)) (SEMICOLON . (paren_expression . 2)))
      ((default . error) (WITH . (paren_expression . 0)) (SEMICOLON . (paren_expression . 0)))
      ((default . error) (ACCEPT . (expression_function_declaration . 0)) (ABORT . (expression_function_declaration . 0)) (BEGIN . (expression_function_declaration . 0)) (CASE . (expression_function_declaration . 0)) (DECLARE . (expression_function_declaration . 0)) (DELAY . (expression_function_declaration . 0)) (END . (expression_function_declaration . 0)) (ENTRY . (expression_function_declaration . 0)) (EXIT . (expression_function_declaration . 0)) (FOR . (expression_function_declaration . 0)) (FUNCTION . (expression_function_declaration . 0)) (GENERIC . (expression_function_declaration . 0)) (GOTO . (expression_function_declaration . 0)) (IF . (expression_function_declaration . 0)) (LIMITED . (expression_function_declaration . 0)) (LOOP . (expression_function_declaration . 0)) (NOT . (expression_function_declaration . 0)) (NULL . (expression_function_declaration . 0)) (OVERRIDING . (expression_function_declaration . 0)) (PACKAGE . (expression_function_declaration . 0)) (PRAGMA . (expression_function_declaration . 0)) (PRIVATE . (expression_function_declaration . 0)) (PROCEDURE . (expression_function_declaration . 0)) (PROTECTED . (expression_function_declaration . 0)) (RAISE . (expression_function_declaration . 0)) (REQUEUE . (expression_function_declaration . 0)) (RETURN . (expression_function_declaration . 0)) (SEPARATE . (expression_function_declaration . 0)) (SELECT . (expression_function_declaration . 0)) (SUBTYPE . (expression_function_declaration . 0)) (TASK . (expression_function_declaration . 0)) (TYPE . (expression_function_declaration . 0)) (USE . (expression_function_declaration . 0)) (WHILE . (expression_function_declaration . 0)) (WITH . (expression_function_declaration . 0)) (LESS_LESS . (expression_function_declaration . 0)) (IDENTIFIER . (expression_function_declaration . 0)) (STRING_LITERAL . (expression_function_declaration . 0)) (CHARACTER_LITERAL . (expression_function_declaration . 0)) (Wisi_EOI . (expression_function_declaration . 0)))
      ((default . error) (ACCEPT . (null_procedure_declaration . 0)) (ABORT . (null_procedure_declaration . 0)) (BEGIN . (null_procedure_declaration . 0)) (CASE . (null_procedure_declaration . 0)) (DECLARE . (null_procedure_declaration . 0)) (DELAY . (null_procedure_declaration . 0)) (END . (null_procedure_declaration . 0)) (ENTRY . (null_procedure_declaration . 0)) (EXIT . (null_procedure_declaration . 0)) (FOR . (null_procedure_declaration . 0)) (FUNCTION . (null_procedure_declaration . 0)) (GENERIC . (null_procedure_declaration . 0)) (GOTO . (null_procedure_declaration . 0)) (IF . (null_procedure_declaration . 0)) (LIMITED . (null_procedure_declaration . 0)) (LOOP . (null_procedure_declaration . 0)) (NOT . (null_procedure_declaration . 0)) (NULL . (null_procedure_declaration . 0)) (OVERRIDING . (null_procedure_declaration . 0)) (PACKAGE . (null_procedure_declaration . 0)) (PRAGMA . (null_procedure_declaration . 0)) (PRIVATE . (null_procedure_declaration . 0)) (PROCEDURE . (null_procedure_declaration . 0)) (PROTECTED . (null_procedure_declaration . 0)) (RAISE . (null_procedure_declaration . 0)) (REQUEUE . (null_procedure_declaration . 0)) (RETURN . (null_procedure_declaration . 0)) (SEPARATE . (null_procedure_declaration . 0)) (SELECT . (null_procedure_declaration . 0)) (SUBTYPE . (null_procedure_declaration . 0)) (TASK . (null_procedure_declaration . 0)) (TYPE . (null_procedure_declaration . 0)) (USE . (null_procedure_declaration . 0)) (WHILE . (null_procedure_declaration . 0)) (WITH . (null_procedure_declaration . 0)) (LESS_LESS . (null_procedure_declaration . 0)) (IDENTIFIER . (null_procedure_declaration . 0)) (STRING_LITERAL . (null_procedure_declaration . 0)) (CHARACTER_LITERAL . (null_procedure_declaration . 0)) (Wisi_EOI . (null_procedure_declaration . 0)))
      ((default . error) (ACCEPT . (abstract_subprogram_declaration . 0)) (ABORT . (abstract_subprogram_declaration . 0)) (BEGIN . (abstract_subprogram_declaration . 0)) (CASE . (abstract_subprogram_declaration . 0)) (DECLARE . (abstract_subprogram_declaration . 0)) (DELAY . (abstract_subprogram_declaration . 0)) (END . (abstract_subprogram_declaration . 0)) (ENTRY . (abstract_subprogram_declaration . 0)) (EXIT . (abstract_subprogram_declaration . 0)) (FOR . (abstract_subprogram_declaration . 0)) (FUNCTION . (abstract_subprogram_declaration . 0)) (GENERIC . (abstract_subprogram_declaration . 0)) (GOTO . (abstract_subprogram_declaration . 0)) (IF . (abstract_subprogram_declaration . 0)) (LIMITED . (abstract_subprogram_declaration . 0)) (LOOP . (abstract_subprogram_declaration . 0)) (NOT . (abstract_subprogram_declaration . 0)) (NULL . (abstract_subprogram_declaration . 0)) (OVERRIDING . (abstract_subprogram_declaration . 0)) (PACKAGE . (abstract_subprogram_declaration . 0)) (PRAGMA . (abstract_subprogram_declaration . 0)) (PRIVATE . (abstract_subprogram_declaration . 0)) (PROCEDURE . (abstract_subprogram_declaration . 0)) (PROTECTED . (abstract_subprogram_declaration . 0)) (RAISE . (abstract_subprogram_declaration . 0)) (REQUEUE . (abstract_subprogram_declaration . 0)) (RETURN . (abstract_subprogram_declaration . 0)) (SEPARATE . (abstract_subprogram_declaration . 0)) (SELECT . (abstract_subprogram_declaration . 0)) (SUBTYPE . (abstract_subprogram_declaration . 0)) (TASK . (abstract_subprogram_declaration . 0)) (TYPE . (abstract_subprogram_declaration . 0)) (USE . (abstract_subprogram_declaration . 0)) (WHILE . (abstract_subprogram_declaration . 0)) (WITH . (abstract_subprogram_declaration . 0)) (LESS_LESS . (abstract_subprogram_declaration . 0)) (IDENTIFIER . (abstract_subprogram_declaration . 0)) (STRING_LITERAL . (abstract_subprogram_declaration . 0)) (CHARACTER_LITERAL . (abstract_subprogram_declaration . 0)) (Wisi_EOI . (abstract_subprogram_declaration . 0)))
      ((default . error) (ACCEPT . (subprogram_body_stub . 0)) (ABORT . (subprogram_body_stub . 0)) (BEGIN . (subprogram_body_stub . 0)) (CASE . (subprogram_body_stub . 0)) (DECLARE . (subprogram_body_stub . 0)) (DELAY . (subprogram_body_stub . 0)) (END . (subprogram_body_stub . 0)) (ENTRY . (subprogram_body_stub . 0)) (EXIT . (subprogram_body_stub . 0)) (FOR . (subprogram_body_stub . 0)) (FUNCTION . (subprogram_body_stub . 0)) (GENERIC . (subprogram_body_stub . 0)) (GOTO . (subprogram_body_stub . 0)) (IF . (subprogram_body_stub . 0)) (LIMITED . (subprogram_body_stub . 0)) (LOOP . (subprogram_body_stub . 0)) (NOT . (subprogram_body_stub . 0)) (NULL . (subprogram_body_stub . 0)) (OVERRIDING . (subprogram_body_stub . 0)) (PACKAGE . (subprogram_body_stub . 0)) (PRAGMA . (subprogram_body_stub . 0)) (PRIVATE . (subprogram_body_stub . 0)) (PROCEDURE . (subprogram_body_stub . 0)) (PROTECTED . (subprogram_body_stub . 0)) (RAISE . (subprogram_body_stub . 0)) (REQUEUE . (subprogram_body_stub . 0)) (RETURN . (subprogram_body_stub . 0)) (SEPARATE . (subprogram_body_stub . 0)) (SELECT . (subprogram_body_stub . 0)) (SUBTYPE . (subprogram_body_stub . 0)) (TASK . (subprogram_body_stub . 0)) (TYPE . (subprogram_body_stub . 0)) (USE . (subprogram_body_stub . 0)) (WHILE . (subprogram_body_stub . 0)) (WITH . (subprogram_body_stub . 0)) (LESS_LESS . (subprogram_body_stub . 0)) (IDENTIFIER . (subprogram_body_stub . 0)) (STRING_LITERAL . (subprogram_body_stub . 0)) (CHARACTER_LITERAL . (subprogram_body_stub . 0)) (Wisi_EOI . (subprogram_body_stub . 0)))
      ((default . error) (ACCEPT . (subprogram_renaming_declaration . 0)) (ABORT . (subprogram_renaming_declaration . 0)) (BEGIN . (subprogram_renaming_declaration . 0)) (CASE . (subprogram_renaming_declaration . 0)) (DECLARE . (subprogram_renaming_declaration . 0)) (DELAY . (subprogram_renaming_declaration . 0)) (END . (subprogram_renaming_declaration . 0)) (ENTRY . (subprogram_renaming_declaration . 0)) (EXIT . (subprogram_renaming_declaration . 0)) (FOR . (subprogram_renaming_declaration . 0)) (FUNCTION . (subprogram_renaming_declaration . 0)) (GENERIC . (subprogram_renaming_declaration . 0)) (GOTO . (subprogram_renaming_declaration . 0)) (IF . (subprogram_renaming_declaration . 0)) (LIMITED . (subprogram_renaming_declaration . 0)) (LOOP . (subprogram_renaming_declaration . 0)) (NOT . (subprogram_renaming_declaration . 0)) (NULL . (subprogram_renaming_declaration . 0)) (OVERRIDING . (subprogram_renaming_declaration . 0)) (PACKAGE . (subprogram_renaming_declaration . 0)) (PRAGMA . (subprogram_renaming_declaration . 0)) (PRIVATE . (subprogram_renaming_declaration . 0)) (PROCEDURE . (subprogram_renaming_declaration . 0)) (PROTECTED . (subprogram_renaming_declaration . 0)) (RAISE . (subprogram_renaming_declaration . 0)) (REQUEUE . (subprogram_renaming_declaration . 0)) (RETURN . (subprogram_renaming_declaration . 0)) (SEPARATE . (subprogram_renaming_declaration . 0)) (SELECT . (subprogram_renaming_declaration . 0)) (SUBTYPE . (subprogram_renaming_declaration . 0)) (TASK . (subprogram_renaming_declaration . 0)) (TYPE . (subprogram_renaming_declaration . 0)) (USE . (subprogram_renaming_declaration . 0)) (WHILE . (subprogram_renaming_declaration . 0)) (WITH . (subprogram_renaming_declaration . 0)) (LESS_LESS . (subprogram_renaming_declaration . 0)) (IDENTIFIER . (subprogram_renaming_declaration . 0)) (STRING_LITERAL . (subprogram_renaming_declaration . 0)) (CHARACTER_LITERAL . (subprogram_renaming_declaration . 0)) (Wisi_EOI . (subprogram_renaming_declaration . 0)))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXCEPTION . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (BAR .  444) (EQUAL_GREATER .  1080))
      ((default . error) (WHEN .  760))
      ((default . error) (RIGHT_PAREN . (quantified_expression . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (THEN . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ELSE . (elsif_expression_list . 1)) (ELSIF . (elsif_expression_list . 1)) (RIGHT_PAREN . (elsif_expression_list . 1)))
      ((default . error) (ELSE .  1084) (ELSIF .  948) (RIGHT_PAREN . (if_expression . 2)))
      ((default . error) (ACCEPT . (aggregate . 0)) (ABORT . (aggregate . 0)) (AND . (aggregate . 0)) (BEGIN . (aggregate . 0)) (CASE . (aggregate . 0)) (DECLARE . (aggregate . 0)) (DELAY . (aggregate . 0)) (DIGITS . (aggregate . 0)) (DO . (aggregate . 0)) (ELSE . (aggregate . 0)) (ELSIF . (aggregate . 0)) (EXIT . (aggregate . 0)) (FOR . (aggregate . 0)) (GOTO . (aggregate . 0)) (IF . (aggregate . 0)) (IN . (aggregate . 0)) (IS . (aggregate . 0)) (LOOP . (aggregate . 0)) (MOD . (aggregate . 0)) (NOT . (aggregate . 0)) (NULL . (aggregate . 0)) (OF . (aggregate . 0)) (OR . (aggregate . 0)) (PRAGMA . (aggregate . 0)) (RAISE . (aggregate . 0)) (RANGE . (aggregate . 0)) (REM . (aggregate . 0)) (RENAMES . (aggregate . 0)) (REQUEUE . (aggregate . 0)) (RETURN . (aggregate . 0)) (SELECT . (aggregate . 0)) (THEN . (aggregate . 0)) (USE . (aggregate . 0)) (WHILE . (aggregate . 0)) (WITH . (aggregate . 0)) (XOR . (aggregate . 0)) (LEFT_PAREN . (aggregate . 0)) (RIGHT_PAREN . (aggregate . 0)) (AMPERSAND . (aggregate . 0)) (BAR . (aggregate . 0)) (COLON_EQUAL . (aggregate . 0)) (COMMA . (aggregate . 0)) (DOT . (aggregate . 0)) (DOT_DOT . (aggregate . 0)) (EQUAL . (aggregate . 0)) (EQUAL_GREATER . (aggregate . 0)) (GREATER . (aggregate . 0)) (GREATER_EQUAL . (aggregate . 0)) (LESS . (aggregate . 0)) (LESS_EQUAL . (aggregate . 0)) (LESS_LESS . (aggregate . 0)) (MINUS . (aggregate . 0)) (PLUS . (aggregate . 0)) (SEMICOLON . (aggregate . 0)) (SLASH . (aggregate . 0)) (SLASH_EQUAL . (aggregate . 0)) (STAR . (aggregate . 0)) (STAR_STAR . (aggregate . 0)) (TICK_1 . (aggregate . 0)) (IDENTIFIER . (aggregate . 0)) (STRING_LITERAL . (aggregate . 0)) (CHARACTER_LITERAL . (aggregate . 0)))
      ((default . error) (RIGHT_PAREN .  1086))
      ((default . error) (END . (case_statement_alternative . 0)) (WHEN . (case_statement_alternative . 0)))
      ((default . error) (ACCEPT . (case_statement . 0)) (ABORT . (case_statement . 0)) (BEGIN . (case_statement . 0)) (CASE . (case_statement . 0)) (DECLARE . (case_statement . 0)) (DELAY . (case_statement . 0)) (ELSE . (case_statement . 0)) (ELSIF . (case_statement . 0)) (END . (case_statement . 0)) (ENTRY . (case_statement . 0)) (EXCEPTION . (case_statement . 0)) (EXIT . (case_statement . 0)) (FOR . (case_statement . 0)) (FUNCTION . (case_statement . 0)) (GENERIC . (case_statement . 0)) (GOTO . (case_statement . 0)) (IF . (case_statement . 0)) (LIMITED . (case_statement . 0)) (LOOP . (case_statement . 0)) (NOT . (case_statement . 0)) (NULL . (case_statement . 0)) (OR . (case_statement . 0)) (OVERRIDING . (case_statement . 0)) (PACKAGE . (case_statement . 0)) (PRAGMA . (case_statement . 0)) (PRIVATE . (case_statement . 0)) (PROCEDURE . (case_statement . 0)) (PROTECTED . (case_statement . 0)) (RAISE . (case_statement . 0)) (REQUEUE . (case_statement . 0)) (RETURN . (case_statement . 0)) (SEPARATE . (case_statement . 0)) (SELECT . (case_statement . 0)) (SUBTYPE . (case_statement . 0)) (TASK . (case_statement . 0)) (THEN . (case_statement . 0)) (TYPE . (case_statement . 0)) (USE . (case_statement . 0)) (WHEN . (case_statement . 0)) (WHILE . (case_statement . 0)) (WITH . (case_statement . 0)) (LESS_LESS . (case_statement . 0)) (IDENTIFIER . (case_statement . 0)) (STRING_LITERAL . (case_statement . 0)) (CHARACTER_LITERAL . (case_statement . 0)) (Wisi_EOI . (case_statement . 0)))
      ((default . error) (AND . (subtype_indication . 0)) (DO . (subtype_indication . 0)) (LOOP . (subtype_indication . 0)) (OF . (subtype_indication . 0)) (WITH . (subtype_indication . 0)) (RIGHT_PAREN . (subtype_indication . 0)) (COLON_EQUAL . (subtype_indication . 0)) (COMMA . (subtype_indication . 0)) (EQUAL_GREATER . (subtype_indication . 0)) (SEMICOLON . (subtype_indication . 0)))
      ((default . error) (AND . (primary . 1)) (IN . (primary . 1)) (MOD . (primary . 1)) (NOT . (primary . 1)) (OR . (primary . 1)) (REM . (primary . 1)) (XOR . (primary . 1)) (RIGHT_PAREN . (primary . 1)) (AMPERSAND . (primary . 1)) (BAR . (primary . 1)) (COMMA . (primary . 1)) (DOT_DOT . (primary . 1)) (EQUAL . (primary . 1)) (EQUAL_GREATER . (primary . 1)) (GREATER . (primary . 1)) (GREATER_EQUAL . (primary . 1)) (LESS . (primary . 1)) (LESS_EQUAL . (primary . 1)) (MINUS . (primary . 1)) (PLUS . (primary . 1)) (SLASH . (primary . 1)) (SLASH_EQUAL . (primary . 1)) (STAR . (primary . 1)) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (AND . (index_constraint . 0)) (DO . (index_constraint . 0)) (LOOP . (index_constraint . 0)) (OF . (index_constraint . 0)) (WITH . (index_constraint . 0)) (RIGHT_PAREN . (index_constraint . 0)) (COLON_EQUAL . (index_constraint . 0)) (COMMA . (index_constraint . 0)) (EQUAL_GREATER . (index_constraint . 0)) (SEMICOLON . (index_constraint . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  473) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (LOOP . (iterator_specification . 0)) (LEFT_PAREN .  235) (DOT .  237) (EQUAL_GREATER . (iterator_specification . 0)) (TICK_1 .  239))
      ((default . error) (SEMICOLON .  1089))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (RECORD .  1091))
      ((default . error) (END . (component_clause_list . 0)) (IDENTIFIER . (component_clause_list . 0)))
      ((default . error) (RIGHT_PAREN . (parameter_specification . 3)) (COLON_EQUAL .  1092) (SEMICOLON . (parameter_specification . 3)))
      ((default . error) (NOT .  385) (IDENTIFIER . (null_exclusion_opt . 1)) (STRING_LITERAL . (null_exclusion_opt . 1)) (CHARACTER_LITERAL . (null_exclusion_opt . 1)))
      ((default . error) (ACCEPT . (generic_renaming_declaration . 2)) (ABORT . (generic_renaming_declaration . 2)) (BEGIN . (generic_renaming_declaration . 2)) (CASE . (generic_renaming_declaration . 2)) (DECLARE . (generic_renaming_declaration . 2)) (DELAY . (generic_renaming_declaration . 2)) (END . (generic_renaming_declaration . 2)) (ENTRY . (generic_renaming_declaration . 2)) (EXIT . (generic_renaming_declaration . 2)) (FOR . (generic_renaming_declaration . 2)) (FUNCTION . (generic_renaming_declaration . 2)) (GENERIC . (generic_renaming_declaration . 2)) (GOTO . (generic_renaming_declaration . 2)) (IF . (generic_renaming_declaration . 2)) (LIMITED . (generic_renaming_declaration . 2)) (LOOP . (generic_renaming_declaration . 2)) (NOT . (generic_renaming_declaration . 2)) (NULL . (generic_renaming_declaration . 2)) (OVERRIDING . (generic_renaming_declaration . 2)) (PACKAGE . (generic_renaming_declaration . 2)) (PRAGMA . (generic_renaming_declaration . 2)) (PRIVATE . (generic_renaming_declaration . 2)) (PROCEDURE . (generic_renaming_declaration . 2)) (PROTECTED . (generic_renaming_declaration . 2)) (RAISE . (generic_renaming_declaration . 2)) (REQUEUE . (generic_renaming_declaration . 2)) (RETURN . (generic_renaming_declaration . 2)) (SEPARATE . (generic_renaming_declaration . 2)) (SELECT . (generic_renaming_declaration . 2)) (SUBTYPE . (generic_renaming_declaration . 2)) (TASK . (generic_renaming_declaration . 2)) (TYPE . (generic_renaming_declaration . 2)) (USE . (generic_renaming_declaration . 2)) (WHILE . (generic_renaming_declaration . 2)) (WITH . (generic_renaming_declaration . 2)) (LESS_LESS . (generic_renaming_declaration . 2)) (IDENTIFIER . (generic_renaming_declaration . 2)) (STRING_LITERAL . (generic_renaming_declaration . 2)) (CHARACTER_LITERAL . (generic_renaming_declaration . 2)) (Wisi_EOI . (generic_renaming_declaration . 2)))
      ((default . error) (ACCEPT . (generic_renaming_declaration . 0)) (ABORT . (generic_renaming_declaration . 0)) (BEGIN . (generic_renaming_declaration . 0)) (CASE . (generic_renaming_declaration . 0)) (DECLARE . (generic_renaming_declaration . 0)) (DELAY . (generic_renaming_declaration . 0)) (END . (generic_renaming_declaration . 0)) (ENTRY . (generic_renaming_declaration . 0)) (EXIT . (generic_renaming_declaration . 0)) (FOR . (generic_renaming_declaration . 0)) (FUNCTION . (generic_renaming_declaration . 0)) (GENERIC . (generic_renaming_declaration . 0)) (GOTO . (generic_renaming_declaration . 0)) (IF . (generic_renaming_declaration . 0)) (LIMITED . (generic_renaming_declaration . 0)) (LOOP . (generic_renaming_declaration . 0)) (NOT . (generic_renaming_declaration . 0)) (NULL . (generic_renaming_declaration . 0)) (OVERRIDING . (generic_renaming_declaration . 0)) (PACKAGE . (generic_renaming_declaration . 0)) (PRAGMA . (generic_renaming_declaration . 0)) (PRIVATE . (generic_renaming_declaration . 0)) (PROCEDURE . (generic_renaming_declaration . 0)) (PROTECTED . (generic_renaming_declaration . 0)) (RAISE . (generic_renaming_declaration . 0)) (REQUEUE . (generic_renaming_declaration . 0)) (RETURN . (generic_renaming_declaration . 0)) (SEPARATE . (generic_renaming_declaration . 0)) (SELECT . (generic_renaming_declaration . 0)) (SUBTYPE . (generic_renaming_declaration . 0)) (TASK . (generic_renaming_declaration . 0)) (TYPE . (generic_renaming_declaration . 0)) (USE . (generic_renaming_declaration . 0)) (WHILE . (generic_renaming_declaration . 0)) (WITH . (generic_renaming_declaration . 0)) (LESS_LESS . (generic_renaming_declaration . 0)) (IDENTIFIER . (generic_renaming_declaration . 0)) (STRING_LITERAL . (generic_renaming_declaration . 0)) (CHARACTER_LITERAL . (generic_renaming_declaration . 0)) (Wisi_EOI . (generic_renaming_declaration . 0)))
      ((default . error) (ACCEPT . (generic_renaming_declaration . 1)) (ABORT . (generic_renaming_declaration . 1)) (BEGIN . (generic_renaming_declaration . 1)) (CASE . (generic_renaming_declaration . 1)) (DECLARE . (generic_renaming_declaration . 1)) (DELAY . (generic_renaming_declaration . 1)) (END . (generic_renaming_declaration . 1)) (ENTRY . (generic_renaming_declaration . 1)) (EXIT . (generic_renaming_declaration . 1)) (FOR . (generic_renaming_declaration . 1)) (FUNCTION . (generic_renaming_declaration . 1)) (GENERIC . (generic_renaming_declaration . 1)) (GOTO . (generic_renaming_declaration . 1)) (IF . (generic_renaming_declaration . 1)) (LIMITED . (generic_renaming_declaration . 1)) (LOOP . (generic_renaming_declaration . 1)) (NOT . (generic_renaming_declaration . 1)) (NULL . (generic_renaming_declaration . 1)) (OVERRIDING . (generic_renaming_declaration . 1)) (PACKAGE . (generic_renaming_declaration . 1)) (PRAGMA . (generic_renaming_declaration . 1)) (PRIVATE . (generic_renaming_declaration . 1)) (PROCEDURE . (generic_renaming_declaration . 1)) (PROTECTED . (generic_renaming_declaration . 1)) (RAISE . (generic_renaming_declaration . 1)) (REQUEUE . (generic_renaming_declaration . 1)) (RETURN . (generic_renaming_declaration . 1)) (SEPARATE . (generic_renaming_declaration . 1)) (SELECT . (generic_renaming_declaration . 1)) (SUBTYPE . (generic_renaming_declaration . 1)) (TASK . (generic_renaming_declaration . 1)) (TYPE . (generic_renaming_declaration . 1)) (USE . (generic_renaming_declaration . 1)) (WHILE . (generic_renaming_declaration . 1)) (WITH . (generic_renaming_declaration . 1)) (LESS_LESS . (generic_renaming_declaration . 1)) (IDENTIFIER . (generic_renaming_declaration . 1)) (STRING_LITERAL . (generic_renaming_declaration . 1)) (CHARACTER_LITERAL . (generic_renaming_declaration . 1)) (Wisi_EOI . (generic_renaming_declaration . 1)))
      ((default . error) (NEW . (abstract_limited_synchronized_opt . 0)))
      ((default . error) (DIGITS .  1094) (WITH . (formal_type_definition . 7)) (SEMICOLON . (formal_type_definition . 7)))
      ((default . error) (WITH . (formal_type_definition . 5)) (SEMICOLON . (formal_type_definition . 5)))
      ((default . error) (WITH . (formal_type_definition . 4)) (SEMICOLON . (formal_type_definition . 4)))
      ((default . error) (WITH . (formal_type_definition . 3)) (SEMICOLON . (formal_type_definition . 3)))
      ((default . error) (SEMICOLON .  1095))
      ((default . error) (RIGHT_PAREN .  1096))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (WITH . (formal_type_definition . 0)) (SEMICOLON . (formal_type_definition . 0)))
      ((default . error) (SEMICOLON .  1098))
      ((default . error) (WITH . (formal_package_actual_part . 1)) (LEFT_PAREN .  1099) (DOT .  237) (SEMICOLON . (formal_package_actual_part . 1)) (TICK_1 .  239))
      ((default . error) (FUNCTION . (formal_subprogram_declaration . 2)) (PACKAGE . (formal_subprogram_declaration . 2)) (PRAGMA . (formal_subprogram_declaration . 2)) (PROCEDURE . (formal_subprogram_declaration . 2)) (TYPE . (formal_subprogram_declaration . 2)) (USE . (formal_subprogram_declaration . 2)) (WITH . (formal_subprogram_declaration . 2)) (IDENTIFIER . (formal_subprogram_declaration . 2)))
      ((default . error) (SEMICOLON .  1101))
      ((default . error) (FUNCTION . (formal_subprogram_declaration . 1)) (PACKAGE . (formal_subprogram_declaration . 1)) (PRAGMA . (formal_subprogram_declaration . 1)) (PROCEDURE . (formal_subprogram_declaration . 1)) (TYPE . (formal_subprogram_declaration . 1)) (USE . (formal_subprogram_declaration . 1)) (WITH . (formal_subprogram_declaration . 1)) (IDENTIFIER . (formal_subprogram_declaration . 1)))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (FUNCTION . (formal_object_declaration . 3)) (PACKAGE . (formal_object_declaration . 3)) (PRAGMA . (formal_object_declaration . 3)) (PROCEDURE . (formal_object_declaration . 3)) (TYPE . (formal_object_declaration . 3)) (USE . (formal_object_declaration . 3)) (WITH . (formal_object_declaration . 3)) (IDENTIFIER . (formal_object_declaration . 3)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (WITH . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  1104))
      ((default . error) (IF .  1105))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (ELSE . (sequence_of_statements_opt . 1)) (ELSIF . (sequence_of_statements_opt . 1)) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (if_statement . 3)) (ABORT . (if_statement . 3)) (BEGIN . (if_statement . 3)) (CASE . (if_statement . 3)) (DECLARE . (if_statement . 3)) (DELAY . (if_statement . 3)) (ELSE . (if_statement . 3)) (ELSIF . (if_statement . 3)) (END . (if_statement . 3)) (ENTRY . (if_statement . 3)) (EXCEPTION . (if_statement . 3)) (EXIT . (if_statement . 3)) (FOR . (if_statement . 3)) (FUNCTION . (if_statement . 3)) (GENERIC . (if_statement . 3)) (GOTO . (if_statement . 3)) (IF . (if_statement . 3)) (LIMITED . (if_statement . 3)) (LOOP . (if_statement . 3)) (NOT . (if_statement . 3)) (NULL . (if_statement . 3)) (OR . (if_statement . 3)) (OVERRIDING . (if_statement . 3)) (PACKAGE . (if_statement . 3)) (PRAGMA . (if_statement . 3)) (PRIVATE . (if_statement . 3)) (PROCEDURE . (if_statement . 3)) (PROTECTED . (if_statement . 3)) (RAISE . (if_statement . 3)) (REQUEUE . (if_statement . 3)) (RETURN . (if_statement . 3)) (SEPARATE . (if_statement . 3)) (SELECT . (if_statement . 3)) (SUBTYPE . (if_statement . 3)) (TASK . (if_statement . 3)) (THEN . (if_statement . 3)) (TYPE . (if_statement . 3)) (USE . (if_statement . 3)) (WHEN . (if_statement . 3)) (WHILE . (if_statement . 3)) (WITH . (if_statement . 3)) (LESS_LESS . (if_statement . 3)) (IDENTIFIER . (if_statement . 3)) (STRING_LITERAL . (if_statement . 3)) (CHARACTER_LITERAL . (if_statement . 3)) (Wisi_EOI . (if_statement . 3)))
      ((default . error) (END .  1107))
      ((default . error) (SEMICOLON .  1108))
      ((default . error) (ACCEPT . (package_body_stub . 0)) (ABORT . (package_body_stub . 0)) (BEGIN . (package_body_stub . 0)) (CASE . (package_body_stub . 0)) (DECLARE . (package_body_stub . 0)) (DELAY . (package_body_stub . 0)) (END . (package_body_stub . 0)) (ENTRY . (package_body_stub . 0)) (EXIT . (package_body_stub . 0)) (FOR . (package_body_stub . 0)) (FUNCTION . (package_body_stub . 0)) (GENERIC . (package_body_stub . 0)) (GOTO . (package_body_stub . 0)) (IF . (package_body_stub . 0)) (LIMITED . (package_body_stub . 0)) (LOOP . (package_body_stub . 0)) (NOT . (package_body_stub . 0)) (NULL . (package_body_stub . 0)) (OVERRIDING . (package_body_stub . 0)) (PACKAGE . (package_body_stub . 0)) (PRAGMA . (package_body_stub . 0)) (PRIVATE . (package_body_stub . 0)) (PROCEDURE . (package_body_stub . 0)) (PROTECTED . (package_body_stub . 0)) (RAISE . (package_body_stub . 0)) (REQUEUE . (package_body_stub . 0)) (RETURN . (package_body_stub . 0)) (SEPARATE . (package_body_stub . 0)) (SELECT . (package_body_stub . 0)) (SUBTYPE . (package_body_stub . 0)) (TASK . (package_body_stub . 0)) (TYPE . (package_body_stub . 0)) (USE . (package_body_stub . 0)) (WHILE . (package_body_stub . 0)) (WITH . (package_body_stub . 0)) (LESS_LESS . (package_body_stub . 0)) (IDENTIFIER . (package_body_stub . 0)) (STRING_LITERAL . (package_body_stub . 0)) (CHARACTER_LITERAL . (package_body_stub . 0)) (Wisi_EOI . (package_body_stub . 0)))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXCEPTION . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON . (name_opt . 1)) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (generic_instantiation . 0)) (ABORT . (generic_instantiation . 0)) (BEGIN . (generic_instantiation . 0)) (CASE . (generic_instantiation . 0)) (DECLARE . (generic_instantiation . 0)) (DELAY . (generic_instantiation . 0)) (END . (generic_instantiation . 0)) (ENTRY . (generic_instantiation . 0)) (EXIT . (generic_instantiation . 0)) (FOR . (generic_instantiation . 0)) (FUNCTION . (generic_instantiation . 0)) (GENERIC . (generic_instantiation . 0)) (GOTO . (generic_instantiation . 0)) (IF . (generic_instantiation . 0)) (LIMITED . (generic_instantiation . 0)) (LOOP . (generic_instantiation . 0)) (NOT . (generic_instantiation . 0)) (NULL . (generic_instantiation . 0)) (OVERRIDING . (generic_instantiation . 0)) (PACKAGE . (generic_instantiation . 0)) (PRAGMA . (generic_instantiation . 0)) (PRIVATE . (generic_instantiation . 0)) (PROCEDURE . (generic_instantiation . 0)) (PROTECTED . (generic_instantiation . 0)) (RAISE . (generic_instantiation . 0)) (REQUEUE . (generic_instantiation . 0)) (RETURN . (generic_instantiation . 0)) (SEPARATE . (generic_instantiation . 0)) (SELECT . (generic_instantiation . 0)) (SUBTYPE . (generic_instantiation . 0)) (TASK . (generic_instantiation . 0)) (TYPE . (generic_instantiation . 0)) (USE . (generic_instantiation . 0)) (WHILE . (generic_instantiation . 0)) (WITH . (generic_instantiation . 0)) (LESS_LESS . (generic_instantiation . 0)) (IDENTIFIER . (generic_instantiation . 0)) (STRING_LITERAL . (generic_instantiation . 0)) (CHARACTER_LITERAL . (generic_instantiation . 0)) (Wisi_EOI . (generic_instantiation . 0)))
      ((default . error) (SEMICOLON . (package_specification . 1)))
      ((default . error) (END .  1111))
      ((default . error) (ACCEPT . (protected_body_stub . 0)) (ABORT . (protected_body_stub . 0)) (BEGIN . (protected_body_stub . 0)) (CASE . (protected_body_stub . 0)) (DECLARE . (protected_body_stub . 0)) (DELAY . (protected_body_stub . 0)) (END . (protected_body_stub . 0)) (ENTRY . (protected_body_stub . 0)) (EXIT . (protected_body_stub . 0)) (FOR . (protected_body_stub . 0)) (FUNCTION . (protected_body_stub . 0)) (GENERIC . (protected_body_stub . 0)) (GOTO . (protected_body_stub . 0)) (IF . (protected_body_stub . 0)) (LIMITED . (protected_body_stub . 0)) (LOOP . (protected_body_stub . 0)) (NOT . (protected_body_stub . 0)) (NULL . (protected_body_stub . 0)) (OVERRIDING . (protected_body_stub . 0)) (PACKAGE . (protected_body_stub . 0)) (PRAGMA . (protected_body_stub . 0)) (PRIVATE . (protected_body_stub . 0)) (PROCEDURE . (protected_body_stub . 0)) (PROTECTED . (protected_body_stub . 0)) (RAISE . (protected_body_stub . 0)) (REQUEUE . (protected_body_stub . 0)) (RETURN . (protected_body_stub . 0)) (SEPARATE . (protected_body_stub . 0)) (SELECT . (protected_body_stub . 0)) (SUBTYPE . (protected_body_stub . 0)) (TASK . (protected_body_stub . 0)) (TYPE . (protected_body_stub . 0)) (USE . (protected_body_stub . 0)) (WHILE . (protected_body_stub . 0)) (WITH . (protected_body_stub . 0)) (LESS_LESS . (protected_body_stub . 0)) (IDENTIFIER . (protected_body_stub . 0)) (STRING_LITERAL . (protected_body_stub . 0)) (CHARACTER_LITERAL . (protected_body_stub . 0)) (Wisi_EOI . (protected_body_stub . 0)))
      ((default . error) (WHEN . (parameter_profile_opt . 1)) (LEFT_PAREN .  1112))
      ((default . error) (IS . (aspect_specification_opt . 1)) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (END . (protected_operation_item_list . 0)) (ENTRY . (protected_operation_item_list . 0)) (FOR . (protected_operation_item_list . 0)) (FUNCTION . (protected_operation_item_list . 0)) (NOT . (protected_operation_item_list . 0)) (OVERRIDING . (protected_operation_item_list . 0)) (PROCEDURE . (protected_operation_item_list . 0)))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  1117))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PRIVATE . (declarative_part_opt . 1)) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (SEMICOLON . (protected_definition . 1)))
      ((default . error) (END .  1120))
      ((default . error) (ABS .  121) (DO . (expression_opt . 1)) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (extended_return_statement . 0)) (ABORT . (extended_return_statement . 0)) (BEGIN . (extended_return_statement . 0)) (CASE . (extended_return_statement . 0)) (DECLARE . (extended_return_statement . 0)) (DELAY . (extended_return_statement . 0)) (ELSE . (extended_return_statement . 0)) (ELSIF . (extended_return_statement . 0)) (END . (extended_return_statement . 0)) (ENTRY . (extended_return_statement . 0)) (EXCEPTION . (extended_return_statement . 0)) (EXIT . (extended_return_statement . 0)) (FOR . (extended_return_statement . 0)) (FUNCTION . (extended_return_statement . 0)) (GENERIC . (extended_return_statement . 0)) (GOTO . (extended_return_statement . 0)) (IF . (extended_return_statement . 0)) (LIMITED . (extended_return_statement . 0)) (LOOP . (extended_return_statement . 0)) (NOT . (extended_return_statement . 0)) (NULL . (extended_return_statement . 0)) (OR . (extended_return_statement . 0)) (OVERRIDING . (extended_return_statement . 0)) (PACKAGE . (extended_return_statement . 0)) (PRAGMA . (extended_return_statement . 0)) (PRIVATE . (extended_return_statement . 0)) (PROCEDURE . (extended_return_statement . 0)) (PROTECTED . (extended_return_statement . 0)) (RAISE . (extended_return_statement . 0)) (REQUEUE . (extended_return_statement . 0)) (RETURN . (extended_return_statement . 0)) (SEPARATE . (extended_return_statement . 0)) (SELECT . (extended_return_statement . 0)) (SUBTYPE . (extended_return_statement . 0)) (TASK . (extended_return_statement . 0)) (THEN . (extended_return_statement . 0)) (TYPE . (extended_return_statement . 0)) (USE . (extended_return_statement . 0)) (WHEN . (extended_return_statement . 0)) (WHILE . (extended_return_statement . 0)) (WITH . (extended_return_statement . 0)) (LESS_LESS . (extended_return_statement . 0)) (IDENTIFIER . (extended_return_statement . 0)) (STRING_LITERAL . (extended_return_statement . 0)) (CHARACTER_LITERAL . (extended_return_statement . 0)) (Wisi_EOI . (extended_return_statement . 0)))
      ((default . error) (IS . (aspect_specification_opt . 1)) (WITH .  336) (LEFT_PAREN .  235) (DOT .  237) (TICK_1 .  239))
      ((default . error) (IS . (aspect_specification_opt . 1)) (WITH .  336))
      ((default . error) (IS . (aspect_specification_opt . 1)) (WITH .  336))
      ((default . error) (IS .  584))
      ((default . error) (ACCEPT . (conditional_entry_call . 0)) (ABORT . (conditional_entry_call . 0)) (BEGIN . (conditional_entry_call . 0)) (CASE . (conditional_entry_call . 0)) (DECLARE . (conditional_entry_call . 0)) (DELAY . (conditional_entry_call . 0)) (ELSE . (conditional_entry_call . 0)) (ELSIF . (conditional_entry_call . 0)) (END . (conditional_entry_call . 0)) (ENTRY . (conditional_entry_call . 0)) (EXCEPTION . (conditional_entry_call . 0)) (EXIT . (conditional_entry_call . 0)) (FOR . (conditional_entry_call . 0)) (FUNCTION . (conditional_entry_call . 0)) (GENERIC . (conditional_entry_call . 0)) (GOTO . (conditional_entry_call . 0)) (IF . (conditional_entry_call . 0)) (LIMITED . (conditional_entry_call . 0)) (LOOP . (conditional_entry_call . 0)) (NOT . (conditional_entry_call . 0)) (NULL . (conditional_entry_call . 0)) (OR . (conditional_entry_call . 0)) (OVERRIDING . (conditional_entry_call . 0)) (PACKAGE . (conditional_entry_call . 0)) (PRAGMA . (conditional_entry_call . 0)) (PRIVATE . (conditional_entry_call . 0)) (PROCEDURE . (conditional_entry_call . 0)) (PROTECTED . (conditional_entry_call . 0)) (RAISE . (conditional_entry_call . 0)) (REQUEUE . (conditional_entry_call . 0)) (RETURN . (conditional_entry_call . 0)) (SEPARATE . (conditional_entry_call . 0)) (SELECT . (conditional_entry_call . 0)) (SUBTYPE . (conditional_entry_call . 0)) (TASK . (conditional_entry_call . 0)) (THEN . (conditional_entry_call . 0)) (TYPE . (conditional_entry_call . 0)) (USE . (conditional_entry_call . 0)) (WHEN . (conditional_entry_call . 0)) (WHILE . (conditional_entry_call . 0)) (WITH . (conditional_entry_call . 0)) (LESS_LESS . (conditional_entry_call . 0)) (IDENTIFIER . (conditional_entry_call . 0)) (STRING_LITERAL . (conditional_entry_call . 0)) (CHARACTER_LITERAL . (conditional_entry_call . 0)) (Wisi_EOI . (conditional_entry_call . 0)))
      ((default . error) (ACCEPT . (timed_entry_call . 0)) (ABORT . (timed_entry_call . 0)) (BEGIN . (timed_entry_call . 0)) (CASE . (timed_entry_call . 0)) (DECLARE . (timed_entry_call . 0)) (DELAY . (timed_entry_call . 0)) (ELSE . (timed_entry_call . 0)) (ELSIF . (timed_entry_call . 0)) (END . (timed_entry_call . 0)) (ENTRY . (timed_entry_call . 0)) (EXCEPTION . (timed_entry_call . 0)) (EXIT . (timed_entry_call . 0)) (FOR . (timed_entry_call . 0)) (FUNCTION . (timed_entry_call . 0)) (GENERIC . (timed_entry_call . 0)) (GOTO . (timed_entry_call . 0)) (IF . (timed_entry_call . 0)) (LIMITED . (timed_entry_call . 0)) (LOOP . (timed_entry_call . 0)) (NOT . (timed_entry_call . 0)) (NULL . (timed_entry_call . 0)) (OR . (timed_entry_call . 0)) (OVERRIDING . (timed_entry_call . 0)) (PACKAGE . (timed_entry_call . 0)) (PRAGMA . (timed_entry_call . 0)) (PRIVATE . (timed_entry_call . 0)) (PROCEDURE . (timed_entry_call . 0)) (PROTECTED . (timed_entry_call . 0)) (RAISE . (timed_entry_call . 0)) (REQUEUE . (timed_entry_call . 0)) (RETURN . (timed_entry_call . 0)) (SEPARATE . (timed_entry_call . 0)) (SELECT . (timed_entry_call . 0)) (SUBTYPE . (timed_entry_call . 0)) (TASK . (timed_entry_call . 0)) (THEN . (timed_entry_call . 0)) (TYPE . (timed_entry_call . 0)) (USE . (timed_entry_call . 0)) (WHEN . (timed_entry_call . 0)) (WHILE . (timed_entry_call . 0)) (WITH . (timed_entry_call . 0)) (LESS_LESS . (timed_entry_call . 0)) (IDENTIFIER . (timed_entry_call . 0)) (STRING_LITERAL . (timed_entry_call . 0)) (CHARACTER_LITERAL . (timed_entry_call . 0)) (Wisi_EOI . (timed_entry_call . 0)))
      ((default . error) (ACCEPT . (selective_accept . 0)) (ABORT . (selective_accept . 0)) (BEGIN . (selective_accept . 0)) (CASE . (selective_accept . 0)) (DECLARE . (selective_accept . 0)) (DELAY . (selective_accept . 0)) (ELSE . (selective_accept . 0)) (ELSIF . (selective_accept . 0)) (END . (selective_accept . 0)) (ENTRY . (selective_accept . 0)) (EXCEPTION . (selective_accept . 0)) (EXIT . (selective_accept . 0)) (FOR . (selective_accept . 0)) (FUNCTION . (selective_accept . 0)) (GENERIC . (selective_accept . 0)) (GOTO . (selective_accept . 0)) (IF . (selective_accept . 0)) (LIMITED . (selective_accept . 0)) (LOOP . (selective_accept . 0)) (NOT . (selective_accept . 0)) (NULL . (selective_accept . 0)) (OR . (selective_accept . 0)) (OVERRIDING . (selective_accept . 0)) (PACKAGE . (selective_accept . 0)) (PRAGMA . (selective_accept . 0)) (PRIVATE . (selective_accept . 0)) (PROCEDURE . (selective_accept . 0)) (PROTECTED . (selective_accept . 0)) (RAISE . (selective_accept . 0)) (REQUEUE . (selective_accept . 0)) (RETURN . (selective_accept . 0)) (SEPARATE . (selective_accept . 0)) (SELECT . (selective_accept . 0)) (SUBTYPE . (selective_accept . 0)) (TASK . (selective_accept . 0)) (THEN . (selective_accept . 0)) (TYPE . (selective_accept . 0)) (USE . (selective_accept . 0)) (WHEN . (selective_accept . 0)) (WHILE . (selective_accept . 0)) (WITH . (selective_accept . 0)) (LESS_LESS . (selective_accept . 0)) (IDENTIFIER . (selective_accept . 0)) (STRING_LITERAL . (selective_accept . 0)) (CHARACTER_LITERAL . (selective_accept . 0)) (Wisi_EOI . (selective_accept . 0)))
      ((default . error) (SEMICOLON .  1122))
      ((default . error) (ACCEPT . (task_body_stub . 0)) (ABORT . (task_body_stub . 0)) (BEGIN . (task_body_stub . 0)) (CASE . (task_body_stub . 0)) (DECLARE . (task_body_stub . 0)) (DELAY . (task_body_stub . 0)) (END . (task_body_stub . 0)) (ENTRY . (task_body_stub . 0)) (EXIT . (task_body_stub . 0)) (FOR . (task_body_stub . 0)) (FUNCTION . (task_body_stub . 0)) (GENERIC . (task_body_stub . 0)) (GOTO . (task_body_stub . 0)) (IF . (task_body_stub . 0)) (LIMITED . (task_body_stub . 0)) (LOOP . (task_body_stub . 0)) (NOT . (task_body_stub . 0)) (NULL . (task_body_stub . 0)) (OVERRIDING . (task_body_stub . 0)) (PACKAGE . (task_body_stub . 0)) (PRAGMA . (task_body_stub . 0)) (PRIVATE . (task_body_stub . 0)) (PROCEDURE . (task_body_stub . 0)) (PROTECTED . (task_body_stub . 0)) (RAISE . (task_body_stub . 0)) (REQUEUE . (task_body_stub . 0)) (RETURN . (task_body_stub . 0)) (SEPARATE . (task_body_stub . 0)) (SELECT . (task_body_stub . 0)) (SUBTYPE . (task_body_stub . 0)) (TASK . (task_body_stub . 0)) (TYPE . (task_body_stub . 0)) (USE . (task_body_stub . 0)) (WHILE . (task_body_stub . 0)) (WITH . (task_body_stub . 0)) (LESS_LESS . (task_body_stub . 0)) (IDENTIFIER . (task_body_stub . 0)) (STRING_LITERAL . (task_body_stub . 0)) (CHARACTER_LITERAL . (task_body_stub . 0)) (Wisi_EOI . (task_body_stub . 0)))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXCEPTION . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (END .  1125))
      ((default . error) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PRIVATE . (declarative_part_opt . 1)) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (END . (task_definition . 0)))
      ((default . error) (SEMICOLON .  1127))
      ((default . error) (ACCESS . (null_exclusion_opt . 0)) (IDENTIFIER .  1128) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (NULL . (abstract_tagged_limited_opt . 0)) (PRIVATE . (abstract_tagged_limited_opt . 0)) (RECORD . (abstract_tagged_limited_opt . 0)))
      ((default . error) (RIGHT_PAREN .  1132) (COMMA .  958))
      ((default . error) (RIGHT_PAREN . (index_subtype_definition_list . 1)) (COMMA . (index_subtype_definition_list . 1)))
      ((default . error) (RIGHT_PAREN .  1133) (COMMA .  1134))
      ((default . error) (MOD . (primary . 3)) (RANGE .  1135) (REM . (primary . 3)) (LEFT_PAREN .  618) (RIGHT_PAREN . (subtype_indication . 3)) (AMPERSAND . (primary . 3)) (COMMA . (subtype_indication . 3)) (DOT .  237) (DOT_DOT . (primary . 3)) (MINUS . (primary . 3)) (PLUS . (primary . 3)) (SLASH . (primary . 3)) (STAR . (primary . 3)) (STAR_STAR . (primary . 3)) (TICK_1 .  239))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (RANGE . (expression_opt . 1)) (WITH . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (WITH . (type_definition . 5)) (SEMICOLON . (type_definition . 5)))
      ((default . error) (WITH . (type_definition . 3)) (SEMICOLON . (type_definition . 3)))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IS . (direct_name . 0)))
      ((default . error) (IS . (direct_name . 1)))
      ((default . error) (IS . (direct_name_opt . 0)))
      ((default . error) (IS .  1141))
      ((default . error) (CASE . (component_list . 4)) (END . (component_list . 4)) (FOR . (component_list . 4)) (WHEN . (component_list . 4)) (IDENTIFIER . (component_list . 4)))
      ((default . error) (CASE . (component_list . 0)) (END . (component_list . 0)) (FOR . (component_list . 0)) (WHEN . (component_list . 0)) (IDENTIFIER . (component_list . 0)))
      ((default . error) (CASE . (component_list . 1)) (END . (component_list . 1)) (FOR . (component_list . 1)) (WHEN . (component_list . 1)) (IDENTIFIER . (component_list . 1)))
      ((default . error) (RECORD .  1142))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (ALIASED .  1143) (NOT .  741) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (WITH . (enumeration_type_definition . 0)) (SEMICOLON . (enumeration_type_definition . 0)))
      ((default . error) (IDENTIFIER .  897) (CHARACTER_LITERAL .  898))
      ((default . error) (AND .  1150) (WITH . (and_interface_list_opt . 1)))
      ((default . error) (AND .  1150) (RANGE .  617) (WITH . ((and_interface_list_opt . 1) (constraint_opt . 1))) (LEFT_PAREN .  618) (DOT .  237) (SEMICOLON . (constraint_opt . 1)) (TICK_1 .  239))
      ((default . error) (SEMICOLON .  1155))
      ((default . error) (ACCEPT . (full_type_declaration . 0)) (ABORT . (full_type_declaration . 0)) (BEGIN . (full_type_declaration . 0)) (CASE . (full_type_declaration . 0)) (DECLARE . (full_type_declaration . 0)) (DELAY . (full_type_declaration . 0)) (END . (full_type_declaration . 0)) (ENTRY . (full_type_declaration . 0)) (EXIT . (full_type_declaration . 0)) (FOR . (full_type_declaration . 0)) (FUNCTION . (full_type_declaration . 0)) (GENERIC . (full_type_declaration . 0)) (GOTO . (full_type_declaration . 0)) (IF . (full_type_declaration . 0)) (LIMITED . (full_type_declaration . 0)) (LOOP . (full_type_declaration . 0)) (NOT . (full_type_declaration . 0)) (NULL . (full_type_declaration . 0)) (OVERRIDING . (full_type_declaration . 0)) (PACKAGE . (full_type_declaration . 0)) (PRAGMA . (full_type_declaration . 0)) (PRIVATE . (full_type_declaration . 0)) (PROCEDURE . (full_type_declaration . 0)) (PROTECTED . (full_type_declaration . 0)) (RAISE . (full_type_declaration . 0)) (REQUEUE . (full_type_declaration . 0)) (RETURN . (full_type_declaration . 0)) (SEPARATE . (full_type_declaration . 0)) (SELECT . (full_type_declaration . 0)) (SUBTYPE . (full_type_declaration . 0)) (TASK . (full_type_declaration . 0)) (TYPE . (full_type_declaration . 0)) (USE . (full_type_declaration . 0)) (WHILE . (full_type_declaration . 0)) (WITH . (full_type_declaration . 0)) (LESS_LESS . (full_type_declaration . 0)) (IDENTIFIER . (full_type_declaration . 0)) (STRING_LITERAL . (full_type_declaration . 0)) (CHARACTER_LITERAL . (full_type_declaration . 0)) (Wisi_EOI . (full_type_declaration . 0)))
      ((default . error) (ACCEPT . (object_renaming_declaration . 2)) (ABORT . (object_renaming_declaration . 2)) (BEGIN . (object_renaming_declaration . 2)) (CASE . (object_renaming_declaration . 2)) (DECLARE . (object_renaming_declaration . 2)) (DELAY . (object_renaming_declaration . 2)) (END . (object_renaming_declaration . 2)) (ENTRY . (object_renaming_declaration . 2)) (EXIT . (object_renaming_declaration . 2)) (FOR . (object_renaming_declaration . 2)) (FUNCTION . (object_renaming_declaration . 2)) (GENERIC . (object_renaming_declaration . 2)) (GOTO . (object_renaming_declaration . 2)) (IF . (object_renaming_declaration . 2)) (LIMITED . (object_renaming_declaration . 2)) (LOOP . (object_renaming_declaration . 2)) (NOT . (object_renaming_declaration . 2)) (NULL . (object_renaming_declaration . 2)) (OVERRIDING . (object_renaming_declaration . 2)) (PACKAGE . (object_renaming_declaration . 2)) (PRAGMA . (object_renaming_declaration . 2)) (PRIVATE . (object_renaming_declaration . 2)) (PROCEDURE . (object_renaming_declaration . 2)) (PROTECTED . (object_renaming_declaration . 2)) (RAISE . (object_renaming_declaration . 2)) (REQUEUE . (object_renaming_declaration . 2)) (RETURN . (object_renaming_declaration . 2)) (SEPARATE . (object_renaming_declaration . 2)) (SELECT . (object_renaming_declaration . 2)) (SUBTYPE . (object_renaming_declaration . 2)) (TASK . (object_renaming_declaration . 2)) (TYPE . (object_renaming_declaration . 2)) (USE . (object_renaming_declaration . 2)) (WHILE . (object_renaming_declaration . 2)) (WITH . (object_renaming_declaration . 2)) (LESS_LESS . (object_renaming_declaration . 2)) (IDENTIFIER . (object_renaming_declaration . 2)) (STRING_LITERAL . (object_renaming_declaration . 2)) (CHARACTER_LITERAL . (object_renaming_declaration . 2)) (Wisi_EOI . (object_renaming_declaration . 2)))
      ((default . error) (ACCEPT . (object_renaming_declaration . 1)) (ABORT . (object_renaming_declaration . 1)) (BEGIN . (object_renaming_declaration . 1)) (CASE . (object_renaming_declaration . 1)) (DECLARE . (object_renaming_declaration . 1)) (DELAY . (object_renaming_declaration . 1)) (END . (object_renaming_declaration . 1)) (ENTRY . (object_renaming_declaration . 1)) (EXIT . (object_renaming_declaration . 1)) (FOR . (object_renaming_declaration . 1)) (FUNCTION . (object_renaming_declaration . 1)) (GENERIC . (object_renaming_declaration . 1)) (GOTO . (object_renaming_declaration . 1)) (IF . (object_renaming_declaration . 1)) (LIMITED . (object_renaming_declaration . 1)) (LOOP . (object_renaming_declaration . 1)) (NOT . (object_renaming_declaration . 1)) (NULL . (object_renaming_declaration . 1)) (OVERRIDING . (object_renaming_declaration . 1)) (PACKAGE . (object_renaming_declaration . 1)) (PRAGMA . (object_renaming_declaration . 1)) (PRIVATE . (object_renaming_declaration . 1)) (PROCEDURE . (object_renaming_declaration . 1)) (PROTECTED . (object_renaming_declaration . 1)) (RAISE . (object_renaming_declaration . 1)) (REQUEUE . (object_renaming_declaration . 1)) (RETURN . (object_renaming_declaration . 1)) (SEPARATE . (object_renaming_declaration . 1)) (SELECT . (object_renaming_declaration . 1)) (SUBTYPE . (object_renaming_declaration . 1)) (TASK . (object_renaming_declaration . 1)) (TYPE . (object_renaming_declaration . 1)) (USE . (object_renaming_declaration . 1)) (WHILE . (object_renaming_declaration . 1)) (WITH . (object_renaming_declaration . 1)) (LESS_LESS . (object_renaming_declaration . 1)) (IDENTIFIER . (object_renaming_declaration . 1)) (STRING_LITERAL . (object_renaming_declaration . 1)) (CHARACTER_LITERAL . (object_renaming_declaration . 1)) (Wisi_EOI . (object_renaming_declaration . 1)))
      ((default . error) (DO . (access_definition . 1)) (IS . (access_definition . 1)) (RENAMES . (access_definition . 1)) (WITH . (access_definition . 1)) (RIGHT_PAREN . (access_definition . 1)) (COLON_EQUAL . (access_definition . 1)) (SEMICOLON . (access_definition . 1)))
      ((default . error) (DO . (access_definition . 0)) (IS . (access_definition . 0)) (RENAMES . (access_definition . 0)) (WITH . (access_definition . 0)) (RIGHT_PAREN . (access_definition . 0)) (COLON_EQUAL . (access_definition . 0)) (SEMICOLON . (access_definition . 0)))
      ((default . error) (SEMICOLON .  1156))
      ((default . error) (OTHERS .  913) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (OTHERS .  913) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHEN . (sequence_of_statements_opt . 1)) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  1160))
      ((default . error) (ACCEPT . (loop_statement . 1)) (ABORT . (loop_statement . 1)) (BEGIN . (loop_statement . 1)) (CASE . (loop_statement . 1)) (DECLARE . (loop_statement . 1)) (DELAY . (loop_statement . 1)) (ELSE . (loop_statement . 1)) (ELSIF . (loop_statement . 1)) (END . (loop_statement . 1)) (ENTRY . (loop_statement . 1)) (EXCEPTION . (loop_statement . 1)) (EXIT . (loop_statement . 1)) (FOR . (loop_statement . 1)) (FUNCTION . (loop_statement . 1)) (GENERIC . (loop_statement . 1)) (GOTO . (loop_statement . 1)) (IF . (loop_statement . 1)) (LIMITED . (loop_statement . 1)) (LOOP . (loop_statement . 1)) (NOT . (loop_statement . 1)) (NULL . (loop_statement . 1)) (OR . (loop_statement . 1)) (OVERRIDING . (loop_statement . 1)) (PACKAGE . (loop_statement . 1)) (PRAGMA . (loop_statement . 1)) (PRIVATE . (loop_statement . 1)) (PROCEDURE . (loop_statement . 1)) (PROTECTED . (loop_statement . 1)) (RAISE . (loop_statement . 1)) (REQUEUE . (loop_statement . 1)) (RETURN . (loop_statement . 1)) (SEPARATE . (loop_statement . 1)) (SELECT . (loop_statement . 1)) (SUBTYPE . (loop_statement . 1)) (TASK . (loop_statement . 1)) (THEN . (loop_statement . 1)) (TYPE . (loop_statement . 1)) (USE . (loop_statement . 1)) (WHEN . (loop_statement . 1)) (WHILE . (loop_statement . 1)) (WITH . (loop_statement . 1)) (LESS_LESS . (loop_statement . 1)) (IDENTIFIER . (loop_statement . 1)) (STRING_LITERAL . (loop_statement . 1)) (CHARACTER_LITERAL . (loop_statement . 1)) (Wisi_EOI . (loop_statement . 1)))
      ((default . error) (SEMICOLON .  1161))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (ACCEPT . (object_declaration . 4)) (ABORT . (object_declaration . 4)) (BEGIN . (object_declaration . 4)) (CASE . (object_declaration . 4)) (DECLARE . (object_declaration . 4)) (DELAY . (object_declaration . 4)) (END . (object_declaration . 4)) (ENTRY . (object_declaration . 4)) (EXIT . (object_declaration . 4)) (FOR . (object_declaration . 4)) (FUNCTION . (object_declaration . 4)) (GENERIC . (object_declaration . 4)) (GOTO . (object_declaration . 4)) (IF . (object_declaration . 4)) (LIMITED . (object_declaration . 4)) (LOOP . (object_declaration . 4)) (NOT . (object_declaration . 4)) (NULL . (object_declaration . 4)) (OVERRIDING . (object_declaration . 4)) (PACKAGE . (object_declaration . 4)) (PRAGMA . (object_declaration . 4)) (PRIVATE . (object_declaration . 4)) (PROCEDURE . (object_declaration . 4)) (PROTECTED . (object_declaration . 4)) (RAISE . (object_declaration . 4)) (REQUEUE . (object_declaration . 4)) (RETURN . (object_declaration . 4)) (SEPARATE . (object_declaration . 4)) (SELECT . (object_declaration . 4)) (SUBTYPE . (object_declaration . 4)) (TASK . (object_declaration . 4)) (TYPE . (object_declaration . 4)) (USE . (object_declaration . 4)) (WHILE . (object_declaration . 4)) (WITH . (object_declaration . 4)) (LESS_LESS . (object_declaration . 4)) (IDENTIFIER . (object_declaration . 4)) (STRING_LITERAL . (object_declaration . 4)) (CHARACTER_LITERAL . (object_declaration . 4)) (Wisi_EOI . (object_declaration . 4)))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (ACCEPT . (object_declaration . 5)) (ABORT . (object_declaration . 5)) (BEGIN . (object_declaration . 5)) (CASE . (object_declaration . 5)) (DECLARE . (object_declaration . 5)) (DELAY . (object_declaration . 5)) (END . (object_declaration . 5)) (ENTRY . (object_declaration . 5)) (EXIT . (object_declaration . 5)) (FOR . (object_declaration . 5)) (FUNCTION . (object_declaration . 5)) (GENERIC . (object_declaration . 5)) (GOTO . (object_declaration . 5)) (IF . (object_declaration . 5)) (LIMITED . (object_declaration . 5)) (LOOP . (object_declaration . 5)) (NOT . (object_declaration . 5)) (NULL . (object_declaration . 5)) (OVERRIDING . (object_declaration . 5)) (PACKAGE . (object_declaration . 5)) (PRAGMA . (object_declaration . 5)) (PRIVATE . (object_declaration . 5)) (PROCEDURE . (object_declaration . 5)) (PROTECTED . (object_declaration . 5)) (RAISE . (object_declaration . 5)) (REQUEUE . (object_declaration . 5)) (RETURN . (object_declaration . 5)) (SEPARATE . (object_declaration . 5)) (SELECT . (object_declaration . 5)) (SUBTYPE . (object_declaration . 5)) (TASK . (object_declaration . 5)) (TYPE . (object_declaration . 5)) (USE . (object_declaration . 5)) (WHILE . (object_declaration . 5)) (WITH . (object_declaration . 5)) (LESS_LESS . (object_declaration . 5)) (IDENTIFIER . (object_declaration . 5)) (STRING_LITERAL . (object_declaration . 5)) (CHARACTER_LITERAL . (object_declaration . 5)) (Wisi_EOI . (object_declaration . 5)))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (ACCEPT . (object_declaration . 3)) (ABORT . (object_declaration . 3)) (BEGIN . (object_declaration . 3)) (CASE . (object_declaration . 3)) (DECLARE . (object_declaration . 3)) (DELAY . (object_declaration . 3)) (END . (object_declaration . 3)) (ENTRY . (object_declaration . 3)) (EXIT . (object_declaration . 3)) (FOR . (object_declaration . 3)) (FUNCTION . (object_declaration . 3)) (GENERIC . (object_declaration . 3)) (GOTO . (object_declaration . 3)) (IF . (object_declaration . 3)) (LIMITED . (object_declaration . 3)) (LOOP . (object_declaration . 3)) (NOT . (object_declaration . 3)) (NULL . (object_declaration . 3)) (OVERRIDING . (object_declaration . 3)) (PACKAGE . (object_declaration . 3)) (PRAGMA . (object_declaration . 3)) (PRIVATE . (object_declaration . 3)) (PROCEDURE . (object_declaration . 3)) (PROTECTED . (object_declaration . 3)) (RAISE . (object_declaration . 3)) (REQUEUE . (object_declaration . 3)) (RETURN . (object_declaration . 3)) (SEPARATE . (object_declaration . 3)) (SELECT . (object_declaration . 3)) (SUBTYPE . (object_declaration . 3)) (TASK . (object_declaration . 3)) (TYPE . (object_declaration . 3)) (USE . (object_declaration . 3)) (WHILE . (object_declaration . 3)) (WITH . (object_declaration . 3)) (LESS_LESS . (object_declaration . 3)) (IDENTIFIER . (object_declaration . 3)) (STRING_LITERAL . (object_declaration . 3)) (CHARACTER_LITERAL . (object_declaration . 3)) (Wisi_EOI . (object_declaration . 3)))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (SEMICOLON .  1166))
      ((default . error) (SEMICOLON .  1167))
      ((default . error) (END .  1168))
      ((default . error) (SEMICOLON .  1169))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (COMMA . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (RIGHT_PAREN . (case_expression_alternative_list . 0)) (COMMA . (case_expression_alternative_list . 0)))
      ((default . error) (RIGHT_PAREN . (if_expression . 1)))
      ((default . error) (THEN .  1171))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ELSE . (elsif_expression_list . 0)) (ELSIF . (elsif_expression_list . 0)) (RIGHT_PAREN . (elsif_expression_list . 0)))
      ((default . error) (AND . (range_g . 0)) (DIGITS . (range_g . 0)) (DO . (range_g . 0)) (ELSE . (range_g . 0)) (ELSIF . (range_g . 0)) (IS . (range_g . 0)) (LOOP . (range_g . 0)) (OF . (range_g . 0)) (OR . (range_g . 0)) (RANGE . (range_g . 0)) (THEN . (range_g . 0)) (WITH . (range_g . 0)) (XOR . (range_g . 0)) (RIGHT_PAREN . (range_g . 0)) (BAR . (range_g . 0)) (COLON_EQUAL . (range_g . 0)) (COMMA . (range_g . 0)) (EQUAL_GREATER . (range_g . 0)) (SEMICOLON . (range_g . 0)))
      ((default . error) (RANGE .  617) (LEFT_PAREN .  618) (RIGHT_PAREN . (subtype_indication . 1)) (BAR . (discrete_choice . 1)) (COMMA . (subtype_indication . 1)) (DOT .  237) (EQUAL_GREATER . (discrete_choice . 1)) (TICK_1 .  239))
      ((default . error) (RIGHT_PAREN . (discrete_subtype_definition_list . 0)) (COMMA . (discrete_subtype_definition_list . 0)))
      ((default . error) (IDENTIFIER . (mod_clause_opt . 0)))
      ((default . error) (RANGE .  1173))
      ((default . error) (SEMICOLON .  1174))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (BOX .  1177))
      ((default . error) (FUNCTION . (formal_type_declaration . 1)) (PACKAGE . (formal_type_declaration . 1)) (PRAGMA . (formal_type_declaration . 1)) (PROCEDURE . (formal_type_declaration . 1)) (TYPE . (formal_type_declaration . 1)) (USE . (formal_type_declaration . 1)) (WITH . (formal_type_declaration . 1)) (IDENTIFIER . (formal_type_declaration . 1)))
      ((default . error) (WITH . (formal_type_definition . 2)) (SEMICOLON . (formal_type_definition . 2)))
      ((default . error) (AND .  1150) (WITH . (and_interface_list_opt . 1)) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (and_interface_list_opt . 1)) (TICK_1 .  239))
      ((default . error) (FUNCTION . (formal_type_declaration . 0)) (PACKAGE . (formal_type_declaration . 0)) (PRAGMA . (formal_type_declaration . 0)) (PROCEDURE . (formal_type_declaration . 0)) (TYPE . (formal_type_declaration . 0)) (USE . (formal_type_declaration . 0)) (WITH . (formal_type_declaration . 0)) (IDENTIFIER . (formal_type_declaration . 0)))
      ((default . error) (ABS .  121) (CASE .  257) (FOR .  258) (IF .  259) (NEW .  122) (NOT .  260) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (association_opt . 5)) (BAR . (discrete_choice_list . 2)) (BOX .  1179) (COMMA . (association_opt . 5)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  263))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (FUNCTION . (formal_subprogram_declaration . 0)) (PACKAGE . (formal_subprogram_declaration . 0)) (PRAGMA . (formal_subprogram_declaration . 0)) (PROCEDURE . (formal_subprogram_declaration . 0)) (TYPE . (formal_subprogram_declaration . 0)) (USE . (formal_subprogram_declaration . 0)) (WITH . (formal_subprogram_declaration . 0)) (IDENTIFIER . (formal_subprogram_declaration . 0)))
      ((default . error) (SEMICOLON .  1181))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (FUNCTION . (formal_object_declaration . 2)) (PACKAGE . (formal_object_declaration . 2)) (PRAGMA . (formal_object_declaration . 2)) (PROCEDURE . (formal_object_declaration . 2)) (TYPE . (formal_object_declaration . 2)) (USE . (formal_object_declaration . 2)) (WITH . (formal_object_declaration . 2)) (IDENTIFIER . (formal_object_declaration . 2)))
      ((default . error) (SEMICOLON .  1183))
      ((default . error) (ELSE . (elsif_statement_item . 0)) (ELSIF . (elsif_statement_item . 0)) (END . (elsif_statement_item . 0)))
      ((default . error) (IF .  1184))
      ((default . error) (ACCEPT . (if_statement . 2)) (ABORT . (if_statement . 2)) (BEGIN . (if_statement . 2)) (CASE . (if_statement . 2)) (DECLARE . (if_statement . 2)) (DELAY . (if_statement . 2)) (ELSE . (if_statement . 2)) (ELSIF . (if_statement . 2)) (END . (if_statement . 2)) (ENTRY . (if_statement . 2)) (EXCEPTION . (if_statement . 2)) (EXIT . (if_statement . 2)) (FOR . (if_statement . 2)) (FUNCTION . (if_statement . 2)) (GENERIC . (if_statement . 2)) (GOTO . (if_statement . 2)) (IF . (if_statement . 2)) (LIMITED . (if_statement . 2)) (LOOP . (if_statement . 2)) (NOT . (if_statement . 2)) (NULL . (if_statement . 2)) (OR . (if_statement . 2)) (OVERRIDING . (if_statement . 2)) (PACKAGE . (if_statement . 2)) (PRAGMA . (if_statement . 2)) (PRIVATE . (if_statement . 2)) (PROCEDURE . (if_statement . 2)) (PROTECTED . (if_statement . 2)) (RAISE . (if_statement . 2)) (REQUEUE . (if_statement . 2)) (RETURN . (if_statement . 2)) (SEPARATE . (if_statement . 2)) (SELECT . (if_statement . 2)) (SUBTYPE . (if_statement . 2)) (TASK . (if_statement . 2)) (THEN . (if_statement . 2)) (TYPE . (if_statement . 2)) (USE . (if_statement . 2)) (WHEN . (if_statement . 2)) (WHILE . (if_statement . 2)) (WITH . (if_statement . 2)) (LESS_LESS . (if_statement . 2)) (IDENTIFIER . (if_statement . 2)) (STRING_LITERAL . (if_statement . 2)) (CHARACTER_LITERAL . (if_statement . 2)) (Wisi_EOI . (if_statement . 2)))
      ((default . error) (END .  1185))
      ((default . error) (SEMICOLON .  1186))
      ((default . error) (SEMICOLON . (name_opt . 1)) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (FOR .  1188) (RIGHT_PAREN . (parameter_specification . 4)) (SEMICOLON . (parameter_specification . 4)) (IDENTIFIER .  164))
      ((default . error) (WHEN .  1189))
      ((default . error) (WHEN . (entry_body_formal_part . 1)))
      ((default . error) (SEMICOLON .  1190))
      ((default . error) (AND .  1005) (WITH .  1191))
      ((default . error) (ACCEPT . (protected_type_declaration . 1)) (ABORT . (protected_type_declaration . 1)) (BEGIN . (protected_type_declaration . 1)) (CASE . (protected_type_declaration . 1)) (DECLARE . (protected_type_declaration . 1)) (DELAY . (protected_type_declaration . 1)) (END . (protected_type_declaration . 1)) (ENTRY . (protected_type_declaration . 1)) (EXIT . (protected_type_declaration . 1)) (FOR . (protected_type_declaration . 1)) (FUNCTION . (protected_type_declaration . 1)) (GENERIC . (protected_type_declaration . 1)) (GOTO . (protected_type_declaration . 1)) (IF . (protected_type_declaration . 1)) (LIMITED . (protected_type_declaration . 1)) (LOOP . (protected_type_declaration . 1)) (NOT . (protected_type_declaration . 1)) (NULL . (protected_type_declaration . 1)) (OVERRIDING . (protected_type_declaration . 1)) (PACKAGE . (protected_type_declaration . 1)) (PRAGMA . (protected_type_declaration . 1)) (PRIVATE . (protected_type_declaration . 1)) (PROCEDURE . (protected_type_declaration . 1)) (PROTECTED . (protected_type_declaration . 1)) (RAISE . (protected_type_declaration . 1)) (REQUEUE . (protected_type_declaration . 1)) (RETURN . (protected_type_declaration . 1)) (SEPARATE . (protected_type_declaration . 1)) (SELECT . (protected_type_declaration . 1)) (SUBTYPE . (protected_type_declaration . 1)) (TASK . (protected_type_declaration . 1)) (TYPE . (protected_type_declaration . 1)) (USE . (protected_type_declaration . 1)) (WHILE . (protected_type_declaration . 1)) (WITH . (protected_type_declaration . 1)) (LESS_LESS . (protected_type_declaration . 1)) (IDENTIFIER . (protected_type_declaration . 1)) (STRING_LITERAL . (protected_type_declaration . 1)) (CHARACTER_LITERAL . (protected_type_declaration . 1)) (Wisi_EOI . (protected_type_declaration . 1)))
      ((default . error) (AND . (interface_list . 0)) (WITH . (interface_list . 0)) (LEFT_PAREN .  235) (DOT .  237) (SEMICOLON . (interface_list . 0)) (TICK_1 .  239))
      ((default . error) (SEMICOLON .  1192))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (DO . (extended_return_object_declaration . 0)) (SEMICOLON . (extended_return_object_declaration . 0)))
      ((default . error) (ACCEPT . (asynchronous_select . 0)) (ABORT . (asynchronous_select . 0)) (BEGIN . (asynchronous_select . 0)) (CASE . (asynchronous_select . 0)) (DECLARE . (asynchronous_select . 0)) (DELAY . (asynchronous_select . 0)) (ELSE . (asynchronous_select . 0)) (ELSIF . (asynchronous_select . 0)) (END . (asynchronous_select . 0)) (ENTRY . (asynchronous_select . 0)) (EXCEPTION . (asynchronous_select . 0)) (EXIT . (asynchronous_select . 0)) (FOR . (asynchronous_select . 0)) (FUNCTION . (asynchronous_select . 0)) (GENERIC . (asynchronous_select . 0)) (GOTO . (asynchronous_select . 0)) (IF . (asynchronous_select . 0)) (LIMITED . (asynchronous_select . 0)) (LOOP . (asynchronous_select . 0)) (NOT . (asynchronous_select . 0)) (NULL . (asynchronous_select . 0)) (OR . (asynchronous_select . 0)) (OVERRIDING . (asynchronous_select . 0)) (PACKAGE . (asynchronous_select . 0)) (PRAGMA . (asynchronous_select . 0)) (PRIVATE . (asynchronous_select . 0)) (PROCEDURE . (asynchronous_select . 0)) (PROTECTED . (asynchronous_select . 0)) (RAISE . (asynchronous_select . 0)) (REQUEUE . (asynchronous_select . 0)) (RETURN . (asynchronous_select . 0)) (SEPARATE . (asynchronous_select . 0)) (SELECT . (asynchronous_select . 0)) (SUBTYPE . (asynchronous_select . 0)) (TASK . (asynchronous_select . 0)) (THEN . (asynchronous_select . 0)) (TYPE . (asynchronous_select . 0)) (USE . (asynchronous_select . 0)) (WHEN . (asynchronous_select . 0)) (WHILE . (asynchronous_select . 0)) (WITH . (asynchronous_select . 0)) (LESS_LESS . (asynchronous_select . 0)) (IDENTIFIER . (asynchronous_select . 0)) (STRING_LITERAL . (asynchronous_select . 0)) (CHARACTER_LITERAL . (asynchronous_select . 0)) (Wisi_EOI . (asynchronous_select . 0)))
      ((default . error) (END .  1194))
      ((default . error) (AND .  1005) (WITH .  1195))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (END .  1197))
      ((default . error) (ACCEPT . (single_task_declaration . 1)) (ABORT . (single_task_declaration . 1)) (BEGIN . (single_task_declaration . 1)) (CASE . (single_task_declaration . 1)) (DECLARE . (single_task_declaration . 1)) (DELAY . (single_task_declaration . 1)) (END . (single_task_declaration . 1)) (ENTRY . (single_task_declaration . 1)) (EXIT . (single_task_declaration . 1)) (FOR . (single_task_declaration . 1)) (FUNCTION . (single_task_declaration . 1)) (GENERIC . (single_task_declaration . 1)) (GOTO . (single_task_declaration . 1)) (IF . (single_task_declaration . 1)) (LIMITED . (single_task_declaration . 1)) (LOOP . (single_task_declaration . 1)) (NOT . (single_task_declaration . 1)) (NULL . (single_task_declaration . 1)) (OVERRIDING . (single_task_declaration . 1)) (PACKAGE . (single_task_declaration . 1)) (PRAGMA . (single_task_declaration . 1)) (PRIVATE . (single_task_declaration . 1)) (PROCEDURE . (single_task_declaration . 1)) (PROTECTED . (single_task_declaration . 1)) (RAISE . (single_task_declaration . 1)) (REQUEUE . (single_task_declaration . 1)) (RETURN . (single_task_declaration . 1)) (SEPARATE . (single_task_declaration . 1)) (SELECT . (single_task_declaration . 1)) (SUBTYPE . (single_task_declaration . 1)) (TASK . (single_task_declaration . 1)) (TYPE . (single_task_declaration . 1)) (USE . (single_task_declaration . 1)) (WHILE . (single_task_declaration . 1)) (WITH . (single_task_declaration . 1)) (LESS_LESS . (single_task_declaration . 1)) (IDENTIFIER . (single_task_declaration . 1)) (STRING_LITERAL . (single_task_declaration . 1)) (CHARACTER_LITERAL . (single_task_declaration . 1)) (Wisi_EOI . (single_task_declaration . 1)))
      ((default . error) (LEFT_PAREN . (name . 5)) (RIGHT_PAREN . (null_exclusion_opt_name_type . 2)) (COLON_EQUAL . (null_exclusion_opt_name_type . 2)) (DOT . (name . 5)) (SEMICOLON . (null_exclusion_opt_name_type . 2)) (TICK_1 . (name . 5)))
      ((default . error) (LEFT_PAREN . (name . 2)) (RIGHT_PAREN . (null_exclusion_opt_name_type . 3)) (COLON_EQUAL . (null_exclusion_opt_name_type . 3)) (DOT . (name . 2)) (SEMICOLON . (null_exclusion_opt_name_type . 3)) (TICK_1 . (name . 2)))
      ((default . error) (RIGHT_PAREN . (discriminant_specification_opt . 1)) (SEMICOLON . (discriminant_specification_opt . 1)))
      ((default . error) (RIGHT_PAREN . (discriminant_specification_opt . 0)) (SEMICOLON . (discriminant_specification_opt . 0)))
      ((default . error) (OF .  1198))
      ((default . error) (OF .  1199))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (BOX .  1202) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (RANGE .  1035) (WITH . (real_range_specification_opt . 1)) (SEMICOLON . (real_range_specification_opt . 1)))
      ((default . error) (DOT_DOT .  1204))
      ((default . error) (AND .  1005) (WITH . (interface_type_definition . 0)) (SEMICOLON . (interface_type_definition . 0)))
      ((default . error) (AND .  1005) (WITH . (interface_type_definition . 2)) (SEMICOLON . (interface_type_definition . 2)))
      ((default . error) (WITH . (type_definition . 1)) (SEMICOLON . (type_definition . 1)))
      ((default . error) (WHEN .  1205))
      ((default . error) (WITH . (record_definition . 0)) (SEMICOLON . (record_definition . 0)))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (NOT .  741) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (WITH . (component_definition . 3)) (COLON_EQUAL . (component_definition . 3)) (SEMICOLON . (component_definition . 3)))
      ((default . error) (WITH .  336) (COLON_EQUAL .  1210) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (WITH . (component_definition . 1)) (COLON_EQUAL . (component_definition . 1)) (SEMICOLON . (component_definition . 1)))
      ((default . error) (AND .  1005) (WITH . (interface_type_definition . 3)) (SEMICOLON . (interface_type_definition . 3)))
      ((default . error) (AND .  1005) (WITH . (interface_type_definition . 1)) (SEMICOLON . (interface_type_definition . 1)))
      ((default . error) (RIGHT_PAREN . (enumeration_literal_list . 0)) (COMMA . (enumeration_literal_list . 0)))
      ((default . error) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (WITH .  1213))
      ((default . error) (WITH .  1214))
      ((default . error) (WITH . (constraint_opt . 0)) (SEMICOLON . (constraint_opt . 0)))
      ((default . error) (WITH . (derived_type_definition . 1)) (SEMICOLON . (derived_type_definition . 1)))
      ((default . error) (ACCEPT . (private_type_declaration . 0)) (ABORT . (private_type_declaration . 0)) (BEGIN . (private_type_declaration . 0)) (CASE . (private_type_declaration . 0)) (DECLARE . (private_type_declaration . 0)) (DELAY . (private_type_declaration . 0)) (END . (private_type_declaration . 0)) (ENTRY . (private_type_declaration . 0)) (EXIT . (private_type_declaration . 0)) (FOR . (private_type_declaration . 0)) (FUNCTION . (private_type_declaration . 0)) (GENERIC . (private_type_declaration . 0)) (GOTO . (private_type_declaration . 0)) (IF . (private_type_declaration . 0)) (LIMITED . (private_type_declaration . 0)) (LOOP . (private_type_declaration . 0)) (NOT . (private_type_declaration . 0)) (NULL . (private_type_declaration . 0)) (OVERRIDING . (private_type_declaration . 0)) (PACKAGE . (private_type_declaration . 0)) (PRAGMA . (private_type_declaration . 0)) (PRIVATE . (private_type_declaration . 0)) (PROCEDURE . (private_type_declaration . 0)) (PROTECTED . (private_type_declaration . 0)) (RAISE . (private_type_declaration . 0)) (REQUEUE . (private_type_declaration . 0)) (RETURN . (private_type_declaration . 0)) (SEPARATE . (private_type_declaration . 0)) (SELECT . (private_type_declaration . 0)) (SUBTYPE . (private_type_declaration . 0)) (TASK . (private_type_declaration . 0)) (TYPE . (private_type_declaration . 0)) (USE . (private_type_declaration . 0)) (WHILE . (private_type_declaration . 0)) (WITH . (private_type_declaration . 0)) (LESS_LESS . (private_type_declaration . 0)) (IDENTIFIER . (private_type_declaration . 0)) (STRING_LITERAL . (private_type_declaration . 0)) (CHARACTER_LITERAL . (private_type_declaration . 0)) (Wisi_EOI . (private_type_declaration . 0)))
      ((default . error) (ACCEPT . (object_renaming_declaration . 0)) (ABORT . (object_renaming_declaration . 0)) (BEGIN . (object_renaming_declaration . 0)) (CASE . (object_renaming_declaration . 0)) (DECLARE . (object_renaming_declaration . 0)) (DELAY . (object_renaming_declaration . 0)) (END . (object_renaming_declaration . 0)) (ENTRY . (object_renaming_declaration . 0)) (EXIT . (object_renaming_declaration . 0)) (FOR . (object_renaming_declaration . 0)) (FUNCTION . (object_renaming_declaration . 0)) (GENERIC . (object_renaming_declaration . 0)) (GOTO . (object_renaming_declaration . 0)) (IF . (object_renaming_declaration . 0)) (LIMITED . (object_renaming_declaration . 0)) (LOOP . (object_renaming_declaration . 0)) (NOT . (object_renaming_declaration . 0)) (NULL . (object_renaming_declaration . 0)) (OVERRIDING . (object_renaming_declaration . 0)) (PACKAGE . (object_renaming_declaration . 0)) (PRAGMA . (object_renaming_declaration . 0)) (PRIVATE . (object_renaming_declaration . 0)) (PROCEDURE . (object_renaming_declaration . 0)) (PROTECTED . (object_renaming_declaration . 0)) (RAISE . (object_renaming_declaration . 0)) (REQUEUE . (object_renaming_declaration . 0)) (RETURN . (object_renaming_declaration . 0)) (SEPARATE . (object_renaming_declaration . 0)) (SELECT . (object_renaming_declaration . 0)) (SUBTYPE . (object_renaming_declaration . 0)) (TASK . (object_renaming_declaration . 0)) (TYPE . (object_renaming_declaration . 0)) (USE . (object_renaming_declaration . 0)) (WHILE . (object_renaming_declaration . 0)) (WITH . (object_renaming_declaration . 0)) (LESS_LESS . (object_renaming_declaration . 0)) (IDENTIFIER . (object_renaming_declaration . 0)) (STRING_LITERAL . (object_renaming_declaration . 0)) (CHARACTER_LITERAL . (object_renaming_declaration . 0)) (Wisi_EOI . (object_renaming_declaration . 0)))
      ((default . error) (BAR .  1064) (EQUAL_GREATER .  1215))
      ((default . error) (BAR . (exception_choice_list . 0)) (EQUAL_GREATER . (exception_choice_list . 0)))
      ((default . error) (END . (exception_handler . 1)) (WHEN . (exception_handler . 1)))
      ((default . error) (ACCEPT . (block_statement . 0)) (ABORT . (block_statement . 0)) (BEGIN . (block_statement . 0)) (CASE . (block_statement . 0)) (DECLARE . (block_statement . 0)) (DELAY . (block_statement . 0)) (ELSE . (block_statement . 0)) (ELSIF . (block_statement . 0)) (END . (block_statement . 0)) (ENTRY . (block_statement . 0)) (EXCEPTION . (block_statement . 0)) (EXIT . (block_statement . 0)) (FOR . (block_statement . 0)) (FUNCTION . (block_statement . 0)) (GENERIC . (block_statement . 0)) (GOTO . (block_statement . 0)) (IF . (block_statement . 0)) (LIMITED . (block_statement . 0)) (LOOP . (block_statement . 0)) (NOT . (block_statement . 0)) (NULL . (block_statement . 0)) (OR . (block_statement . 0)) (OVERRIDING . (block_statement . 0)) (PACKAGE . (block_statement . 0)) (PRAGMA . (block_statement . 0)) (PRIVATE . (block_statement . 0)) (PROCEDURE . (block_statement . 0)) (PROTECTED . (block_statement . 0)) (RAISE . (block_statement . 0)) (REQUEUE . (block_statement . 0)) (RETURN . (block_statement . 0)) (SEPARATE . (block_statement . 0)) (SELECT . (block_statement . 0)) (SUBTYPE . (block_statement . 0)) (TASK . (block_statement . 0)) (THEN . (block_statement . 0)) (TYPE . (block_statement . 0)) (USE . (block_statement . 0)) (WHEN . (block_statement . 0)) (WHILE . (block_statement . 0)) (WITH . (block_statement . 0)) (LESS_LESS . (block_statement . 0)) (IDENTIFIER . (block_statement . 0)) (STRING_LITERAL . (block_statement . 0)) (CHARACTER_LITERAL . (block_statement . 0)) (Wisi_EOI . (block_statement . 0)))
      ((default . error) (ACCEPT . (loop_statement . 0)) (ABORT . (loop_statement . 0)) (BEGIN . (loop_statement . 0)) (CASE . (loop_statement . 0)) (DECLARE . (loop_statement . 0)) (DELAY . (loop_statement . 0)) (ELSE . (loop_statement . 0)) (ELSIF . (loop_statement . 0)) (END . (loop_statement . 0)) (ENTRY . (loop_statement . 0)) (EXCEPTION . (loop_statement . 0)) (EXIT . (loop_statement . 0)) (FOR . (loop_statement . 0)) (FUNCTION . (loop_statement . 0)) (GENERIC . (loop_statement . 0)) (GOTO . (loop_statement . 0)) (IF . (loop_statement . 0)) (LIMITED . (loop_statement . 0)) (LOOP . (loop_statement . 0)) (NOT . (loop_statement . 0)) (NULL . (loop_statement . 0)) (OR . (loop_statement . 0)) (OVERRIDING . (loop_statement . 0)) (PACKAGE . (loop_statement . 0)) (PRAGMA . (loop_statement . 0)) (PRIVATE . (loop_statement . 0)) (PROCEDURE . (loop_statement . 0)) (PROTECTED . (loop_statement . 0)) (RAISE . (loop_statement . 0)) (REQUEUE . (loop_statement . 0)) (RETURN . (loop_statement . 0)) (SEPARATE . (loop_statement . 0)) (SELECT . (loop_statement . 0)) (SUBTYPE . (loop_statement . 0)) (TASK . (loop_statement . 0)) (THEN . (loop_statement . 0)) (TYPE . (loop_statement . 0)) (USE . (loop_statement . 0)) (WHEN . (loop_statement . 0)) (WHILE . (loop_statement . 0)) (WITH . (loop_statement . 0)) (LESS_LESS . (loop_statement . 0)) (IDENTIFIER . (loop_statement . 0)) (STRING_LITERAL . (loop_statement . 0)) (CHARACTER_LITERAL . (loop_statement . 0)) (Wisi_EOI . (loop_statement . 0)))
      ((default . error) (SEMICOLON .  1216))
      ((default . error) (SEMICOLON .  1217))
      ((default . error) (SEMICOLON .  1218))
      ((default . error) (SEMICOLON .  1219))
      ((default . error) (ACCEPT . (generic_instantiation . 2)) (ABORT . (generic_instantiation . 2)) (BEGIN . (generic_instantiation . 2)) (CASE . (generic_instantiation . 2)) (DECLARE . (generic_instantiation . 2)) (DELAY . (generic_instantiation . 2)) (END . (generic_instantiation . 2)) (ENTRY . (generic_instantiation . 2)) (EXIT . (generic_instantiation . 2)) (FOR . (generic_instantiation . 2)) (FUNCTION . (generic_instantiation . 2)) (GENERIC . (generic_instantiation . 2)) (GOTO . (generic_instantiation . 2)) (IF . (generic_instantiation . 2)) (LIMITED . (generic_instantiation . 2)) (LOOP . (generic_instantiation . 2)) (NOT . (generic_instantiation . 2)) (NULL . (generic_instantiation . 2)) (OVERRIDING . (generic_instantiation . 2)) (PACKAGE . (generic_instantiation . 2)) (PRAGMA . (generic_instantiation . 2)) (PRIVATE . (generic_instantiation . 2)) (PROCEDURE . (generic_instantiation . 2)) (PROTECTED . (generic_instantiation . 2)) (RAISE . (generic_instantiation . 2)) (REQUEUE . (generic_instantiation . 2)) (RETURN . (generic_instantiation . 2)) (SEPARATE . (generic_instantiation . 2)) (SELECT . (generic_instantiation . 2)) (SUBTYPE . (generic_instantiation . 2)) (TASK . (generic_instantiation . 2)) (TYPE . (generic_instantiation . 2)) (USE . (generic_instantiation . 2)) (WHILE . (generic_instantiation . 2)) (WITH . (generic_instantiation . 2)) (LESS_LESS . (generic_instantiation . 2)) (IDENTIFIER . (generic_instantiation . 2)) (STRING_LITERAL . (generic_instantiation . 2)) (CHARACTER_LITERAL . (generic_instantiation . 2)) (Wisi_EOI . (generic_instantiation . 2)))
      ((default . error) (ACCEPT . (generic_instantiation . 1)) (ABORT . (generic_instantiation . 1)) (BEGIN . (generic_instantiation . 1)) (CASE . (generic_instantiation . 1)) (DECLARE . (generic_instantiation . 1)) (DELAY . (generic_instantiation . 1)) (END . (generic_instantiation . 1)) (ENTRY . (generic_instantiation . 1)) (EXIT . (generic_instantiation . 1)) (FOR . (generic_instantiation . 1)) (FUNCTION . (generic_instantiation . 1)) (GENERIC . (generic_instantiation . 1)) (GOTO . (generic_instantiation . 1)) (IF . (generic_instantiation . 1)) (LIMITED . (generic_instantiation . 1)) (LOOP . (generic_instantiation . 1)) (NOT . (generic_instantiation . 1)) (NULL . (generic_instantiation . 1)) (OVERRIDING . (generic_instantiation . 1)) (PACKAGE . (generic_instantiation . 1)) (PRAGMA . (generic_instantiation . 1)) (PRIVATE . (generic_instantiation . 1)) (PROCEDURE . (generic_instantiation . 1)) (PROTECTED . (generic_instantiation . 1)) (RAISE . (generic_instantiation . 1)) (REQUEUE . (generic_instantiation . 1)) (RETURN . (generic_instantiation . 1)) (SEPARATE . (generic_instantiation . 1)) (SELECT . (generic_instantiation . 1)) (SUBTYPE . (generic_instantiation . 1)) (TASK . (generic_instantiation . 1)) (TYPE . (generic_instantiation . 1)) (USE . (generic_instantiation . 1)) (WHILE . (generic_instantiation . 1)) (WITH . (generic_instantiation . 1)) (LESS_LESS . (generic_instantiation . 1)) (IDENTIFIER . (generic_instantiation . 1)) (STRING_LITERAL . (generic_instantiation . 1)) (CHARACTER_LITERAL . (generic_instantiation . 1)) (Wisi_EOI . (generic_instantiation . 1)))
      ((default . error) (SEMICOLON . (name_opt . 1)) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (accept_statement . 0)) (ABORT . (accept_statement . 0)) (BEGIN . (accept_statement . 0)) (CASE . (accept_statement . 0)) (DECLARE . (accept_statement . 0)) (DELAY . (accept_statement . 0)) (ELSE . (accept_statement . 0)) (ELSIF . (accept_statement . 0)) (END . (accept_statement . 0)) (ENTRY . (accept_statement . 0)) (EXCEPTION . (accept_statement . 0)) (EXIT . (accept_statement . 0)) (FOR . (accept_statement . 0)) (FUNCTION . (accept_statement . 0)) (GENERIC . (accept_statement . 0)) (GOTO . (accept_statement . 0)) (IF . (accept_statement . 0)) (LIMITED . (accept_statement . 0)) (LOOP . (accept_statement . 0)) (NOT . (accept_statement . 0)) (NULL . (accept_statement . 0)) (OR . (accept_statement . 0)) (OVERRIDING . (accept_statement . 0)) (PACKAGE . (accept_statement . 0)) (PRAGMA . (accept_statement . 0)) (PRIVATE . (accept_statement . 0)) (PROCEDURE . (accept_statement . 0)) (PROTECTED . (accept_statement . 0)) (RAISE . (accept_statement . 0)) (REQUEUE . (accept_statement . 0)) (RETURN . (accept_statement . 0)) (SEPARATE . (accept_statement . 0)) (SELECT . (accept_statement . 0)) (SUBTYPE . (accept_statement . 0)) (TASK . (accept_statement . 0)) (THEN . (accept_statement . 0)) (TYPE . (accept_statement . 0)) (USE . (accept_statement . 0)) (WHEN . (accept_statement . 0)) (WHILE . (accept_statement . 0)) (WITH . (accept_statement . 0)) (LESS_LESS . (accept_statement . 0)) (IDENTIFIER . (accept_statement . 0)) (STRING_LITERAL . (accept_statement . 0)) (CHARACTER_LITERAL . (accept_statement . 0)) (Wisi_EOI . (accept_statement . 0)))
      ((default . error) (RIGHT_PAREN . (case_expression_alternative . 0)) (COMMA . (case_expression_alternative . 0)))
      ((default . error) (ABS .  121) (ELSE . (expression_opt . 1)) (ELSIF . (expression_opt . 1)) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (RIGHT_PAREN . (if_expression . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (record_representation_clause . 0)) (ABORT . (record_representation_clause . 0)) (BEGIN . (record_representation_clause . 0)) (CASE . (record_representation_clause . 0)) (DECLARE . (record_representation_clause . 0)) (DELAY . (record_representation_clause . 0)) (END . (record_representation_clause . 0)) (ENTRY . (record_representation_clause . 0)) (EXIT . (record_representation_clause . 0)) (FOR . (record_representation_clause . 0)) (FUNCTION . (record_representation_clause . 0)) (GENERIC . (record_representation_clause . 0)) (GOTO . (record_representation_clause . 0)) (IF . (record_representation_clause . 0)) (LIMITED . (record_representation_clause . 0)) (LOOP . (record_representation_clause . 0)) (NOT . (record_representation_clause . 0)) (NULL . (record_representation_clause . 0)) (OVERRIDING . (record_representation_clause . 0)) (PACKAGE . (record_representation_clause . 0)) (PRAGMA . (record_representation_clause . 0)) (PRIVATE . (record_representation_clause . 0)) (PROCEDURE . (record_representation_clause . 0)) (PROTECTED . (record_representation_clause . 0)) (RAISE . (record_representation_clause . 0)) (REQUEUE . (record_representation_clause . 0)) (RETURN . (record_representation_clause . 0)) (SEPARATE . (record_representation_clause . 0)) (SELECT . (record_representation_clause . 0)) (SUBTYPE . (record_representation_clause . 0)) (TASK . (record_representation_clause . 0)) (TYPE . (record_representation_clause . 0)) (USE . (record_representation_clause . 0)) (WHEN . (record_representation_clause . 0)) (WHILE . (record_representation_clause . 0)) (WITH . (record_representation_clause . 0)) (LESS_LESS . (record_representation_clause . 0)) (IDENTIFIER . (record_representation_clause . 0)) (STRING_LITERAL . (record_representation_clause . 0)) (CHARACTER_LITERAL . (record_representation_clause . 0)) (Wisi_EOI . (record_representation_clause . 0)))
      ((default . error) (RIGHT_PAREN . (parameter_specification . 2)) (SEMICOLON . (parameter_specification . 2)))
      ((default . error) (LEFT_PAREN .  235) (RIGHT_PAREN . (parameter_specification . 1)) (COLON_EQUAL .  1223) (DOT .  237) (SEMICOLON . (parameter_specification . 1)) (TICK_1 .  239))
      ((default . error) (WITH . (formal_type_definition . 6)) (SEMICOLON . (formal_type_definition . 6)))
      ((default . error) (WITH . ( 1224 (formal_derived_type_definition . 1))) (SEMICOLON . (formal_derived_type_definition . 1)))
      ((default . error) (RIGHT_PAREN .  1225))
      ((default . error) (SEMICOLON .  1226))
      ((default . error) (FUNCTION . (formal_object_declaration . 1)) (PACKAGE . (formal_object_declaration . 1)) (PRAGMA . (formal_object_declaration . 1)) (PROCEDURE . (formal_object_declaration . 1)) (TYPE . (formal_object_declaration . 1)) (USE . (formal_object_declaration . 1)) (WITH . (formal_object_declaration . 1)) (IDENTIFIER . (formal_object_declaration . 1)))
      ((default . error) (SEMICOLON .  1227))
      ((default . error) (ACCEPT . (if_statement . 1)) (ABORT . (if_statement . 1)) (BEGIN . (if_statement . 1)) (CASE . (if_statement . 1)) (DECLARE . (if_statement . 1)) (DELAY . (if_statement . 1)) (ELSE . (if_statement . 1)) (ELSIF . (if_statement . 1)) (END . (if_statement . 1)) (ENTRY . (if_statement . 1)) (EXCEPTION . (if_statement . 1)) (EXIT . (if_statement . 1)) (FOR . (if_statement . 1)) (FUNCTION . (if_statement . 1)) (GENERIC . (if_statement . 1)) (GOTO . (if_statement . 1)) (IF . (if_statement . 1)) (LIMITED . (if_statement . 1)) (LOOP . (if_statement . 1)) (NOT . (if_statement . 1)) (NULL . (if_statement . 1)) (OR . (if_statement . 1)) (OVERRIDING . (if_statement . 1)) (PACKAGE . (if_statement . 1)) (PRAGMA . (if_statement . 1)) (PRIVATE . (if_statement . 1)) (PROCEDURE . (if_statement . 1)) (PROTECTED . (if_statement . 1)) (RAISE . (if_statement . 1)) (REQUEUE . (if_statement . 1)) (RETURN . (if_statement . 1)) (SEPARATE . (if_statement . 1)) (SELECT . (if_statement . 1)) (SUBTYPE . (if_statement . 1)) (TASK . (if_statement . 1)) (THEN . (if_statement . 1)) (TYPE . (if_statement . 1)) (USE . (if_statement . 1)) (WHEN . (if_statement . 1)) (WHILE . (if_statement . 1)) (WITH . (if_statement . 1)) (LESS_LESS . (if_statement . 1)) (IDENTIFIER . (if_statement . 1)) (STRING_LITERAL . (if_statement . 1)) (CHARACTER_LITERAL . (if_statement . 1)) (Wisi_EOI . (if_statement . 1)))
      ((default . error) (SEMICOLON .  1228))
      ((default . error) (SEMICOLON . (name_opt . 1)) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (package_body . 1)) (ABORT . (package_body . 1)) (BEGIN . (package_body . 1)) (CASE . (package_body . 1)) (DECLARE . (package_body . 1)) (DELAY . (package_body . 1)) (END . (package_body . 1)) (ENTRY . (package_body . 1)) (EXIT . (package_body . 1)) (FOR . (package_body . 1)) (FUNCTION . (package_body . 1)) (GENERIC . (package_body . 1)) (GOTO . (package_body . 1)) (IF . (package_body . 1)) (LIMITED . (package_body . 1)) (LOOP . (package_body . 1)) (NOT . (package_body . 1)) (NULL . (package_body . 1)) (OVERRIDING . (package_body . 1)) (PACKAGE . (package_body . 1)) (PRAGMA . (package_body . 1)) (PRIVATE . (package_body . 1)) (PROCEDURE . (package_body . 1)) (PROTECTED . (package_body . 1)) (RAISE . (package_body . 1)) (REQUEUE . (package_body . 1)) (RETURN . (package_body . 1)) (SEPARATE . (package_body . 1)) (SELECT . (package_body . 1)) (SUBTYPE . (package_body . 1)) (TASK . (package_body . 1)) (TYPE . (package_body . 1)) (USE . (package_body . 1)) (WHILE . (package_body . 1)) (WITH . (package_body . 1)) (LESS_LESS . (package_body . 1)) (IDENTIFIER . (package_body . 1)) (STRING_LITERAL . (package_body . 1)) (CHARACTER_LITERAL . (package_body . 1)) (Wisi_EOI . (package_body . 1)))
      ((default . error) (SEMICOLON . (package_specification . 0)))
      ((default . error) (IDENTIFIER .  1230))
      ((default . error) (ABS .  121) (IS . (expression_opt . 1)) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (protected_body . 0)) (ABORT . (protected_body . 0)) (BEGIN . (protected_body . 0)) (CASE . (protected_body . 0)) (DECLARE . (protected_body . 0)) (DELAY . (protected_body . 0)) (END . (protected_body . 0)) (ENTRY . (protected_body . 0)) (EXIT . (protected_body . 0)) (FOR . (protected_body . 0)) (FUNCTION . (protected_body . 0)) (GENERIC . (protected_body . 0)) (GOTO . (protected_body . 0)) (IF . (protected_body . 0)) (LIMITED . (protected_body . 0)) (LOOP . (protected_body . 0)) (NOT . (protected_body . 0)) (NULL . (protected_body . 0)) (OVERRIDING . (protected_body . 0)) (PACKAGE . (protected_body . 0)) (PRAGMA . (protected_body . 0)) (PRIVATE . (protected_body . 0)) (PROCEDURE . (protected_body . 0)) (PROTECTED . (protected_body . 0)) (RAISE . (protected_body . 0)) (REQUEUE . (protected_body . 0)) (RETURN . (protected_body . 0)) (SEPARATE . (protected_body . 0)) (SELECT . (protected_body . 0)) (SUBTYPE . (protected_body . 0)) (TASK . (protected_body . 0)) (TYPE . (protected_body . 0)) (USE . (protected_body . 0)) (WHILE . (protected_body . 0)) (WITH . (protected_body . 0)) (LESS_LESS . (protected_body . 0)) (IDENTIFIER . (protected_body . 0)) (STRING_LITERAL . (protected_body . 0)) (CHARACTER_LITERAL . (protected_body . 0)) (Wisi_EOI . (protected_body . 0)))
      ((default . error) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PRIVATE . (declarative_part_opt . 1)) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (ACCEPT . (single_protected_declaration . 0)) (ABORT . (single_protected_declaration . 0)) (BEGIN . (single_protected_declaration . 0)) (CASE . (single_protected_declaration . 0)) (DECLARE . (single_protected_declaration . 0)) (DELAY . (single_protected_declaration . 0)) (END . (single_protected_declaration . 0)) (ENTRY . (single_protected_declaration . 0)) (EXIT . (single_protected_declaration . 0)) (FOR . (single_protected_declaration . 0)) (FUNCTION . (single_protected_declaration . 0)) (GENERIC . (single_protected_declaration . 0)) (GOTO . (single_protected_declaration . 0)) (IF . (single_protected_declaration . 0)) (LIMITED . (single_protected_declaration . 0)) (LOOP . (single_protected_declaration . 0)) (NOT . (single_protected_declaration . 0)) (NULL . (single_protected_declaration . 0)) (OVERRIDING . (single_protected_declaration . 0)) (PACKAGE . (single_protected_declaration . 0)) (PRAGMA . (single_protected_declaration . 0)) (PRIVATE . (single_protected_declaration . 0)) (PROCEDURE . (single_protected_declaration . 0)) (PROTECTED . (single_protected_declaration . 0)) (RAISE . (single_protected_declaration . 0)) (REQUEUE . (single_protected_declaration . 0)) (RETURN . (single_protected_declaration . 0)) (SEPARATE . (single_protected_declaration . 0)) (SELECT . (single_protected_declaration . 0)) (SUBTYPE . (single_protected_declaration . 0)) (TASK . (single_protected_declaration . 0)) (TYPE . (single_protected_declaration . 0)) (USE . (single_protected_declaration . 0)) (WHILE . (single_protected_declaration . 0)) (WITH . (single_protected_declaration . 0)) (LESS_LESS . (single_protected_declaration . 0)) (IDENTIFIER . (single_protected_declaration . 0)) (STRING_LITERAL . (single_protected_declaration . 0)) (CHARACTER_LITERAL . (single_protected_declaration . 0)) (Wisi_EOI . (single_protected_declaration . 0)))
      ((default . error) (SEMICOLON . (protected_definition . 0)))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (END . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PRIVATE . (declarative_part_opt . 1)) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (SEMICOLON .  1235))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (ALIASED .  1143) (NOT .  741) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (ALIASED .  1143) (NOT .  741) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (RIGHT_PAREN . (index_subtype_definition_list . 0)) (COMMA . (index_subtype_definition_list . 0)))
      ((default . error) (RANGE .  1239) (LEFT_PAREN .  235) (DOT .  237) (TICK_1 .  239))
      ((default . error) (RIGHT_PAREN . (index_subtype_definition . 0)) (COMMA . (index_subtype_definition . 0)))
      ((default . error) (WITH . (type_definition . 4)) (SEMICOLON . (type_definition . 4)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  260) (NULL .  124) (OTHERS .  262) (RAISE .  125) (LEFT_PAREN .  126) (BAR . (discrete_choice_list . 2)) (EQUAL_GREATER . (discrete_choice_list . 2)) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (END .  1242) (WHEN .  1205))
      ((default . error) (END . (variant_list . 1)) (WHEN . (variant_list . 1)))
      ((default . error) (WITH . (component_definition . 2)) (COLON_EQUAL . (component_definition . 2)) (SEMICOLON . (component_definition . 2)))
      ((default . error) (WITH . (component_definition . 0)) (COLON_EQUAL . (component_definition . 0)) (SEMICOLON . (component_definition . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (WITH . (expression_opt . 1)) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (SEMICOLON .  1245))
      ((default . error) (AND .  1005) (WITH . (and_interface_list_opt . 0)) (SEMICOLON . (and_interface_list_opt . 0)))
      ((default . error) (PRIVATE .  1246))
      ((default . error) (NULL .  704) (RECORD .  707))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHEN . (sequence_of_statements_opt . 1)) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (object_declaration . 1)) (ABORT . (object_declaration . 1)) (BEGIN . (object_declaration . 1)) (CASE . (object_declaration . 1)) (DECLARE . (object_declaration . 1)) (DELAY . (object_declaration . 1)) (END . (object_declaration . 1)) (ENTRY . (object_declaration . 1)) (EXIT . (object_declaration . 1)) (FOR . (object_declaration . 1)) (FUNCTION . (object_declaration . 1)) (GENERIC . (object_declaration . 1)) (GOTO . (object_declaration . 1)) (IF . (object_declaration . 1)) (LIMITED . (object_declaration . 1)) (LOOP . (object_declaration . 1)) (NOT . (object_declaration . 1)) (NULL . (object_declaration . 1)) (OVERRIDING . (object_declaration . 1)) (PACKAGE . (object_declaration . 1)) (PRAGMA . (object_declaration . 1)) (PRIVATE . (object_declaration . 1)) (PROCEDURE . (object_declaration . 1)) (PROTECTED . (object_declaration . 1)) (RAISE . (object_declaration . 1)) (REQUEUE . (object_declaration . 1)) (RETURN . (object_declaration . 1)) (SEPARATE . (object_declaration . 1)) (SELECT . (object_declaration . 1)) (SUBTYPE . (object_declaration . 1)) (TASK . (object_declaration . 1)) (TYPE . (object_declaration . 1)) (USE . (object_declaration . 1)) (WHILE . (object_declaration . 1)) (WITH . (object_declaration . 1)) (LESS_LESS . (object_declaration . 1)) (IDENTIFIER . (object_declaration . 1)) (STRING_LITERAL . (object_declaration . 1)) (CHARACTER_LITERAL . (object_declaration . 1)) (Wisi_EOI . (object_declaration . 1)))
      ((default . error) (ACCEPT . (object_declaration . 2)) (ABORT . (object_declaration . 2)) (BEGIN . (object_declaration . 2)) (CASE . (object_declaration . 2)) (DECLARE . (object_declaration . 2)) (DELAY . (object_declaration . 2)) (END . (object_declaration . 2)) (ENTRY . (object_declaration . 2)) (EXIT . (object_declaration . 2)) (FOR . (object_declaration . 2)) (FUNCTION . (object_declaration . 2)) (GENERIC . (object_declaration . 2)) (GOTO . (object_declaration . 2)) (IF . (object_declaration . 2)) (LIMITED . (object_declaration . 2)) (LOOP . (object_declaration . 2)) (NOT . (object_declaration . 2)) (NULL . (object_declaration . 2)) (OVERRIDING . (object_declaration . 2)) (PACKAGE . (object_declaration . 2)) (PRAGMA . (object_declaration . 2)) (PRIVATE . (object_declaration . 2)) (PROCEDURE . (object_declaration . 2)) (PROTECTED . (object_declaration . 2)) (RAISE . (object_declaration . 2)) (REQUEUE . (object_declaration . 2)) (RETURN . (object_declaration . 2)) (SEPARATE . (object_declaration . 2)) (SELECT . (object_declaration . 2)) (SUBTYPE . (object_declaration . 2)) (TASK . (object_declaration . 2)) (TYPE . (object_declaration . 2)) (USE . (object_declaration . 2)) (WHILE . (object_declaration . 2)) (WITH . (object_declaration . 2)) (LESS_LESS . (object_declaration . 2)) (IDENTIFIER . (object_declaration . 2)) (STRING_LITERAL . (object_declaration . 2)) (CHARACTER_LITERAL . (object_declaration . 2)) (Wisi_EOI . (object_declaration . 2)))
      ((default . error) (ACCEPT . (object_declaration . 0)) (ABORT . (object_declaration . 0)) (BEGIN . (object_declaration . 0)) (CASE . (object_declaration . 0)) (DECLARE . (object_declaration . 0)) (DELAY . (object_declaration . 0)) (END . (object_declaration . 0)) (ENTRY . (object_declaration . 0)) (EXIT . (object_declaration . 0)) (FOR . (object_declaration . 0)) (FUNCTION . (object_declaration . 0)) (GENERIC . (object_declaration . 0)) (GOTO . (object_declaration . 0)) (IF . (object_declaration . 0)) (LIMITED . (object_declaration . 0)) (LOOP . (object_declaration . 0)) (NOT . (object_declaration . 0)) (NULL . (object_declaration . 0)) (OVERRIDING . (object_declaration . 0)) (PACKAGE . (object_declaration . 0)) (PRAGMA . (object_declaration . 0)) (PRIVATE . (object_declaration . 0)) (PROCEDURE . (object_declaration . 0)) (PROTECTED . (object_declaration . 0)) (RAISE . (object_declaration . 0)) (REQUEUE . (object_declaration . 0)) (RETURN . (object_declaration . 0)) (SEPARATE . (object_declaration . 0)) (SELECT . (object_declaration . 0)) (SUBTYPE . (object_declaration . 0)) (TASK . (object_declaration . 0)) (TYPE . (object_declaration . 0)) (USE . (object_declaration . 0)) (WHILE . (object_declaration . 0)) (WITH . (object_declaration . 0)) (LESS_LESS . (object_declaration . 0)) (IDENTIFIER . (object_declaration . 0)) (STRING_LITERAL . (object_declaration . 0)) (CHARACTER_LITERAL . (object_declaration . 0)) (Wisi_EOI . (object_declaration . 0)))
      ((default . error) (ACCEPT . (entry_declaration . 0)) (ABORT . (entry_declaration . 0)) (BEGIN . (entry_declaration . 0)) (CASE . (entry_declaration . 0)) (DECLARE . (entry_declaration . 0)) (DELAY . (entry_declaration . 0)) (END . (entry_declaration . 0)) (ENTRY . (entry_declaration . 0)) (EXIT . (entry_declaration . 0)) (FOR . (entry_declaration . 0)) (FUNCTION . (entry_declaration . 0)) (GENERIC . (entry_declaration . 0)) (GOTO . (entry_declaration . 0)) (IF . (entry_declaration . 0)) (LIMITED . (entry_declaration . 0)) (LOOP . (entry_declaration . 0)) (NOT . (entry_declaration . 0)) (NULL . (entry_declaration . 0)) (OVERRIDING . (entry_declaration . 0)) (PACKAGE . (entry_declaration . 0)) (PRAGMA . (entry_declaration . 0)) (PRIVATE . (entry_declaration . 0)) (PROCEDURE . (entry_declaration . 0)) (PROTECTED . (entry_declaration . 0)) (RAISE . (entry_declaration . 0)) (REQUEUE . (entry_declaration . 0)) (RETURN . (entry_declaration . 0)) (SEPARATE . (entry_declaration . 0)) (SELECT . (entry_declaration . 0)) (SUBTYPE . (entry_declaration . 0)) (TASK . (entry_declaration . 0)) (TYPE . (entry_declaration . 0)) (USE . (entry_declaration . 0)) (WHILE . (entry_declaration . 0)) (WITH . (entry_declaration . 0)) (LESS_LESS . (entry_declaration . 0)) (IDENTIFIER . (entry_declaration . 0)) (STRING_LITERAL . (entry_declaration . 0)) (CHARACTER_LITERAL . (entry_declaration . 0)) (Wisi_EOI . (entry_declaration . 0)))
      ((default . error) (SEMICOLON .  1249))
      ((default . error) (ELSE . (elsif_expression_item . 0)) (ELSIF . (elsif_expression_item . 0)) (RIGHT_PAREN . (elsif_expression_item . 0)))
      ((default . error) (DOT_DOT .  1250))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (RAISE .  125) (LEFT_PAREN .  126) (RIGHT_PAREN . (expression_opt . 1)) (MINUS .  127) (PLUS .  128) (SEMICOLON . (expression_opt . 1)) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (PRIVATE .  1252))
      ((default . error) (WITH . (formal_package_actual_part . 0)) (SEMICOLON . (formal_package_actual_part . 0)))
      ((default . error) (FUNCTION . (formal_package_declaration . 0)) (PACKAGE . (formal_package_declaration . 0)) (PRAGMA . (formal_package_declaration . 0)) (PROCEDURE . (formal_package_declaration . 0)) (TYPE . (formal_package_declaration . 0)) (USE . (formal_package_declaration . 0)) (WITH . (formal_package_declaration . 0)) (IDENTIFIER . (formal_package_declaration . 0)))
      ((default . error) (FUNCTION . (formal_object_declaration . 0)) (PACKAGE . (formal_object_declaration . 0)) (PRAGMA . (formal_object_declaration . 0)) (PROCEDURE . (formal_object_declaration . 0)) (TYPE . (formal_object_declaration . 0)) (USE . (formal_object_declaration . 0)) (WITH . (formal_object_declaration . 0)) (IDENTIFIER . (formal_object_declaration . 0)))
      ((default . error) (ACCEPT . (if_statement . 0)) (ABORT . (if_statement . 0)) (BEGIN . (if_statement . 0)) (CASE . (if_statement . 0)) (DECLARE . (if_statement . 0)) (DELAY . (if_statement . 0)) (ELSE . (if_statement . 0)) (ELSIF . (if_statement . 0)) (END . (if_statement . 0)) (ENTRY . (if_statement . 0)) (EXCEPTION . (if_statement . 0)) (EXIT . (if_statement . 0)) (FOR . (if_statement . 0)) (FUNCTION . (if_statement . 0)) (GENERIC . (if_statement . 0)) (GOTO . (if_statement . 0)) (IF . (if_statement . 0)) (LIMITED . (if_statement . 0)) (LOOP . (if_statement . 0)) (NOT . (if_statement . 0)) (NULL . (if_statement . 0)) (OR . (if_statement . 0)) (OVERRIDING . (if_statement . 0)) (PACKAGE . (if_statement . 0)) (PRAGMA . (if_statement . 0)) (PRIVATE . (if_statement . 0)) (PROCEDURE . (if_statement . 0)) (PROTECTED . (if_statement . 0)) (RAISE . (if_statement . 0)) (REQUEUE . (if_statement . 0)) (RETURN . (if_statement . 0)) (SEPARATE . (if_statement . 0)) (SELECT . (if_statement . 0)) (SUBTYPE . (if_statement . 0)) (TASK . (if_statement . 0)) (THEN . (if_statement . 0)) (TYPE . (if_statement . 0)) (USE . (if_statement . 0)) (WHEN . (if_statement . 0)) (WHILE . (if_statement . 0)) (WITH . (if_statement . 0)) (LESS_LESS . (if_statement . 0)) (IDENTIFIER . (if_statement . 0)) (STRING_LITERAL . (if_statement . 0)) (CHARACTER_LITERAL . (if_statement . 0)) (Wisi_EOI . (if_statement . 0)))
      ((default . error) (SEMICOLON .  1253))
      ((default . error) (IN .  1254))
      ((default . error) (IS .  1255))
      ((default . error) (SEMICOLON .  1256))
      ((default . error) (SEMICOLON .  1257))
      ((default . error) (END .  1258))
      ((default . error) (ACCEPT . (task_type_declaration . 1)) (ABORT . (task_type_declaration . 1)) (BEGIN . (task_type_declaration . 1)) (CASE . (task_type_declaration . 1)) (DECLARE . (task_type_declaration . 1)) (DELAY . (task_type_declaration . 1)) (END . (task_type_declaration . 1)) (ENTRY . (task_type_declaration . 1)) (EXIT . (task_type_declaration . 1)) (FOR . (task_type_declaration . 1)) (FUNCTION . (task_type_declaration . 1)) (GENERIC . (task_type_declaration . 1)) (GOTO . (task_type_declaration . 1)) (IF . (task_type_declaration . 1)) (LIMITED . (task_type_declaration . 1)) (LOOP . (task_type_declaration . 1)) (NOT . (task_type_declaration . 1)) (NULL . (task_type_declaration . 1)) (OVERRIDING . (task_type_declaration . 1)) (PACKAGE . (task_type_declaration . 1)) (PRAGMA . (task_type_declaration . 1)) (PRIVATE . (task_type_declaration . 1)) (PROCEDURE . (task_type_declaration . 1)) (PROTECTED . (task_type_declaration . 1)) (RAISE . (task_type_declaration . 1)) (REQUEUE . (task_type_declaration . 1)) (RETURN . (task_type_declaration . 1)) (SEPARATE . (task_type_declaration . 1)) (SELECT . (task_type_declaration . 1)) (SUBTYPE . (task_type_declaration . 1)) (TASK . (task_type_declaration . 1)) (TYPE . (task_type_declaration . 1)) (USE . (task_type_declaration . 1)) (WHILE . (task_type_declaration . 1)) (WITH . (task_type_declaration . 1)) (LESS_LESS . (task_type_declaration . 1)) (IDENTIFIER . (task_type_declaration . 1)) (STRING_LITERAL . (task_type_declaration . 1)) (CHARACTER_LITERAL . (task_type_declaration . 1)) (Wisi_EOI . (task_type_declaration . 1)))
      ((default . error) (SEMICOLON .  1259))
      ((default . error) (WITH . (array_type_definition . 1)) (COLON_EQUAL . (array_type_definition . 1)) (SEMICOLON . (array_type_definition . 1)))
      ((default . error) (WITH . (array_type_definition . 0)) (COLON_EQUAL . (array_type_definition . 0)) (SEMICOLON . (array_type_definition . 0)))
      ((default . error) (BOX .  1202))
      ((default . error) (WITH . (real_range_specification_opt . 0)) (SEMICOLON . (real_range_specification_opt . 0)))
      ((default . error) (BAR .  444) (EQUAL_GREATER .  1260))
      ((default . error) (CASE .  1261))
      ((default . error) (END . (variant_list . 0)) (WHEN . (variant_list . 0)))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (CASE . (component_declaration . 1)) (END . (component_declaration . 1)) (FOR . (component_declaration . 1)) (WHEN . (component_declaration . 1)) (IDENTIFIER . (component_declaration . 1)))
      ((default . error) (WITH .  336) (SEMICOLON . (aspect_specification_opt . 1)))
      ((default . error) (WITH . (derived_type_definition . 0)) (SEMICOLON . (derived_type_definition . 0)))
      ((default . error) (END . (exception_handler . 0)) (WHEN . (exception_handler . 0)))
      ((default . error) (ACCEPT . (subprogram_body . 0)) (ABORT . (subprogram_body . 0)) (BEGIN . (subprogram_body . 0)) (CASE . (subprogram_body . 0)) (DECLARE . (subprogram_body . 0)) (DELAY . (subprogram_body . 0)) (END . (subprogram_body . 0)) (ENTRY . (subprogram_body . 0)) (EXIT . (subprogram_body . 0)) (FOR . (subprogram_body . 0)) (FUNCTION . (subprogram_body . 0)) (GENERIC . (subprogram_body . 0)) (GOTO . (subprogram_body . 0)) (IF . (subprogram_body . 0)) (LIMITED . (subprogram_body . 0)) (LOOP . (subprogram_body . 0)) (NOT . (subprogram_body . 0)) (NULL . (subprogram_body . 0)) (OVERRIDING . (subprogram_body . 0)) (PACKAGE . (subprogram_body . 0)) (PRAGMA . (subprogram_body . 0)) (PRIVATE . (subprogram_body . 0)) (PROCEDURE . (subprogram_body . 0)) (PROTECTED . (subprogram_body . 0)) (RAISE . (subprogram_body . 0)) (REQUEUE . (subprogram_body . 0)) (RETURN . (subprogram_body . 0)) (SEPARATE . (subprogram_body . 0)) (SELECT . (subprogram_body . 0)) (SUBTYPE . (subprogram_body . 0)) (TASK . (subprogram_body . 0)) (TYPE . (subprogram_body . 0)) (USE . (subprogram_body . 0)) (WHILE . (subprogram_body . 0)) (WITH . (subprogram_body . 0)) (LESS_LESS . (subprogram_body . 0)) (IDENTIFIER . (subprogram_body . 0)) (STRING_LITERAL . (subprogram_body . 0)) (CHARACTER_LITERAL . (subprogram_body . 0)) (Wisi_EOI . (subprogram_body . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  123) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (RIGHT_PAREN . (parameter_specification . 0)) (SEMICOLON . (parameter_specification . 0)))
      ((default . error) (WITH . (formal_derived_type_definition . 0)) (SEMICOLON . (formal_derived_type_definition . 0)))
      ((default . error) (ACCEPT . (package_body . 0)) (ABORT . (package_body . 0)) (BEGIN . (package_body . 0)) (CASE . (package_body . 0)) (DECLARE . (package_body . 0)) (DELAY . (package_body . 0)) (END . (package_body . 0)) (ENTRY . (package_body . 0)) (EXIT . (package_body . 0)) (FOR . (package_body . 0)) (FUNCTION . (package_body . 0)) (GENERIC . (package_body . 0)) (GOTO . (package_body . 0)) (IF . (package_body . 0)) (LIMITED . (package_body . 0)) (LOOP . (package_body . 0)) (NOT . (package_body . 0)) (NULL . (package_body . 0)) (OVERRIDING . (package_body . 0)) (PACKAGE . (package_body . 0)) (PRAGMA . (package_body . 0)) (PRIVATE . (package_body . 0)) (PROCEDURE . (package_body . 0)) (PROTECTED . (package_body . 0)) (RAISE . (package_body . 0)) (REQUEUE . (package_body . 0)) (RETURN . (package_body . 0)) (SEPARATE . (package_body . 0)) (SELECT . (package_body . 0)) (SUBTYPE . (package_body . 0)) (TASK . (package_body . 0)) (TYPE . (package_body . 0)) (USE . (package_body . 0)) (WHILE . (package_body . 0)) (WITH . (package_body . 0)) (LESS_LESS . (package_body . 0)) (IDENTIFIER . (package_body . 0)) (STRING_LITERAL . (package_body . 0)) (CHARACTER_LITERAL . (package_body . 0)) (Wisi_EOI . (package_body . 0)))
      ((default . error) (ABS .  121) (NEW .  122) (NOT .  473) (NULL .  124) (LEFT_PAREN .  126) (MINUS .  127) (PLUS .  128) (NUMERIC_LITERAL .  129) (IDENTIFIER .  119) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (BEGIN . (declarative_part_opt . 1)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  183) (FUNCTION . (overriding_indicator_opt . 2)) (GENERIC .  8) (NOT .  12) (OVERRIDING .  14) (PACKAGE .  15) (PRAGMA .  16) (PROCEDURE . (overriding_indicator_opt . 2)) (PROTECTED .  19) (SUBTYPE .  25) (TASK .  26) (TYPE .  27) (USE .  28) (IDENTIFIER .  185))
      ((default . error) (ACCEPT . (protected_type_declaration . 0)) (ABORT . (protected_type_declaration . 0)) (BEGIN . (protected_type_declaration . 0)) (CASE . (protected_type_declaration . 0)) (DECLARE . (protected_type_declaration . 0)) (DELAY . (protected_type_declaration . 0)) (END . (protected_type_declaration . 0)) (ENTRY . (protected_type_declaration . 0)) (EXIT . (protected_type_declaration . 0)) (FOR . (protected_type_declaration . 0)) (FUNCTION . (protected_type_declaration . 0)) (GENERIC . (protected_type_declaration . 0)) (GOTO . (protected_type_declaration . 0)) (IF . (protected_type_declaration . 0)) (LIMITED . (protected_type_declaration . 0)) (LOOP . (protected_type_declaration . 0)) (NOT . (protected_type_declaration . 0)) (NULL . (protected_type_declaration . 0)) (OVERRIDING . (protected_type_declaration . 0)) (PACKAGE . (protected_type_declaration . 0)) (PRAGMA . (protected_type_declaration . 0)) (PRIVATE . (protected_type_declaration . 0)) (PROCEDURE . (protected_type_declaration . 0)) (PROTECTED . (protected_type_declaration . 0)) (RAISE . (protected_type_declaration . 0)) (REQUEUE . (protected_type_declaration . 0)) (RETURN . (protected_type_declaration . 0)) (SEPARATE . (protected_type_declaration . 0)) (SELECT . (protected_type_declaration . 0)) (SUBTYPE . (protected_type_declaration . 0)) (TASK . (protected_type_declaration . 0)) (TYPE . (protected_type_declaration . 0)) (USE . (protected_type_declaration . 0)) (WHILE . (protected_type_declaration . 0)) (WITH . (protected_type_declaration . 0)) (LESS_LESS . (protected_type_declaration . 0)) (IDENTIFIER . (protected_type_declaration . 0)) (STRING_LITERAL . (protected_type_declaration . 0)) (CHARACTER_LITERAL . (protected_type_declaration . 0)) (Wisi_EOI . (protected_type_declaration . 0)))
      ((default . error) (ACCEPT . (task_body . 0)) (ABORT . (task_body . 0)) (BEGIN . (task_body . 0)) (CASE . (task_body . 0)) (DECLARE . (task_body . 0)) (DELAY . (task_body . 0)) (END . (task_body . 0)) (ENTRY . (task_body . 0)) (EXIT . (task_body . 0)) (FOR . (task_body . 0)) (FUNCTION . (task_body . 0)) (GENERIC . (task_body . 0)) (GOTO . (task_body . 0)) (IF . (task_body . 0)) (LIMITED . (task_body . 0)) (LOOP . (task_body . 0)) (NOT . (task_body . 0)) (NULL . (task_body . 0)) (OVERRIDING . (task_body . 0)) (PACKAGE . (task_body . 0)) (PRAGMA . (task_body . 0)) (PRIVATE . (task_body . 0)) (PROCEDURE . (task_body . 0)) (PROTECTED . (task_body . 0)) (RAISE . (task_body . 0)) (REQUEUE . (task_body . 0)) (RETURN . (task_body . 0)) (SEPARATE . (task_body . 0)) (SELECT . (task_body . 0)) (SUBTYPE . (task_body . 0)) (TASK . (task_body . 0)) (TYPE . (task_body . 0)) (USE . (task_body . 0)) (WHILE . (task_body . 0)) (WITH . (task_body . 0)) (LESS_LESS . (task_body . 0)) (IDENTIFIER . (task_body . 0)) (STRING_LITERAL . (task_body . 0)) (CHARACTER_LITERAL . (task_body . 0)) (Wisi_EOI . (task_body . 0)))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (ACCEPT . (single_task_declaration . 0)) (ABORT . (single_task_declaration . 0)) (BEGIN . (single_task_declaration . 0)) (CASE . (single_task_declaration . 0)) (DECLARE . (single_task_declaration . 0)) (DELAY . (single_task_declaration . 0)) (END . (single_task_declaration . 0)) (ENTRY . (single_task_declaration . 0)) (EXIT . (single_task_declaration . 0)) (FOR . (single_task_declaration . 0)) (FUNCTION . (single_task_declaration . 0)) (GENERIC . (single_task_declaration . 0)) (GOTO . (single_task_declaration . 0)) (IF . (single_task_declaration . 0)) (LIMITED . (single_task_declaration . 0)) (LOOP . (single_task_declaration . 0)) (NOT . (single_task_declaration . 0)) (NULL . (single_task_declaration . 0)) (OVERRIDING . (single_task_declaration . 0)) (PACKAGE . (single_task_declaration . 0)) (PRAGMA . (single_task_declaration . 0)) (PRIVATE . (single_task_declaration . 0)) (PROCEDURE . (single_task_declaration . 0)) (PROTECTED . (single_task_declaration . 0)) (RAISE . (single_task_declaration . 0)) (REQUEUE . (single_task_declaration . 0)) (RETURN . (single_task_declaration . 0)) (SEPARATE . (single_task_declaration . 0)) (SELECT . (single_task_declaration . 0)) (SUBTYPE . (single_task_declaration . 0)) (TASK . (single_task_declaration . 0)) (TYPE . (single_task_declaration . 0)) (USE . (single_task_declaration . 0)) (WHILE . (single_task_declaration . 0)) (WITH . (single_task_declaration . 0)) (LESS_LESS . (single_task_declaration . 0)) (IDENTIFIER . (single_task_declaration . 0)) (STRING_LITERAL . (single_task_declaration . 0)) (CHARACTER_LITERAL . (single_task_declaration . 0)) (Wisi_EOI . (single_task_declaration . 0)))
      ((default . error) (CASE .  884) (END . (component_list_opt . 1)) (FOR .  183) (NULL .  885) (WHEN . (component_list_opt . 1)) (IDENTIFIER .  164))
      ((default . error) (SEMICOLON .  1269))
      ((default . error) (SEMICOLON .  1270))
      ((default . error) (SEMICOLON .  1271))
      ((default . error) (SEMICOLON .  1272))
      ((default . error) (RIGHT_PAREN .  1273))
      ((default . error) (BEGIN .  1274))
      ((default . error) (SEMICOLON .  1275))
      ((default . error) (END . (variant . 0)) (WHEN . (variant . 0)))
      ((default . error) (CASE . (variant_part . 0)) (END . (variant_part . 0)) (FOR . (variant_part . 0)) (WHEN . (variant_part . 0)) (IDENTIFIER . (variant_part . 0)))
      ((default . error) (CASE . (component_declaration . 0)) (END . (component_declaration . 0)) (FOR . (component_declaration . 0)) (WHEN . (component_declaration . 0)) (IDENTIFIER . (component_declaration . 0)))
      ((default . error) (ACCEPT . (private_extension_declaration . 0)) (ABORT . (private_extension_declaration . 0)) (BEGIN . (private_extension_declaration . 0)) (CASE . (private_extension_declaration . 0)) (DECLARE . (private_extension_declaration . 0)) (DELAY . (private_extension_declaration . 0)) (END . (private_extension_declaration . 0)) (ENTRY . (private_extension_declaration . 0)) (EXIT . (private_extension_declaration . 0)) (FOR . (private_extension_declaration . 0)) (FUNCTION . (private_extension_declaration . 0)) (GENERIC . (private_extension_declaration . 0)) (GOTO . (private_extension_declaration . 0)) (IF . (private_extension_declaration . 0)) (LIMITED . (private_extension_declaration . 0)) (LOOP . (private_extension_declaration . 0)) (NOT . (private_extension_declaration . 0)) (NULL . (private_extension_declaration . 0)) (OVERRIDING . (private_extension_declaration . 0)) (PACKAGE . (private_extension_declaration . 0)) (PRAGMA . (private_extension_declaration . 0)) (PRIVATE . (private_extension_declaration . 0)) (PROCEDURE . (private_extension_declaration . 0)) (PROTECTED . (private_extension_declaration . 0)) (RAISE . (private_extension_declaration . 0)) (REQUEUE . (private_extension_declaration . 0)) (RETURN . (private_extension_declaration . 0)) (SEPARATE . (private_extension_declaration . 0)) (SELECT . (private_extension_declaration . 0)) (SUBTYPE . (private_extension_declaration . 0)) (TASK . (private_extension_declaration . 0)) (TYPE . (private_extension_declaration . 0)) (USE . (private_extension_declaration . 0)) (WHILE . (private_extension_declaration . 0)) (WITH . (private_extension_declaration . 0)) (LESS_LESS . (private_extension_declaration . 0)) (IDENTIFIER . (private_extension_declaration . 0)) (STRING_LITERAL . (private_extension_declaration . 0)) (CHARACTER_LITERAL . (private_extension_declaration . 0)) (Wisi_EOI . (private_extension_declaration . 0)))
      ((default . error) (END . (component_clause . 0)) (IDENTIFIER . (component_clause . 0)))
      ((default . error) (WHEN . (parameter_profile_opt . 1)) (LEFT_PAREN .  430))
      ((default . error) (ACCEPT .  1) (ABORT .  2) (BEGIN . (block_label_opt . 1)) (CASE .  3) (DECLARE . (block_label_opt . 1)) (DELAY .  4) (END . (sequence_of_statements_opt . 1)) (EXCEPTION . (sequence_of_statements_opt . 1)) (EXIT .  5) (FOR . (block_label_opt . 1)) (GOTO .  9) (IF .  10) (LOOP . (block_label_opt . 1)) (NULL .  13) (PRAGMA .  16) (RAISE .  20) (REQUEUE .  21) (RETURN .  22) (SELECT .  24) (WHILE . (block_label_opt . 1)) (LESS_LESS .  31) (IDENTIFIER .  359) (STRING_LITERAL .  33) (CHARACTER_LITERAL .  34))
      ((default . error) (ACCEPT . (task_type_declaration . 0)) (ABORT . (task_type_declaration . 0)) (BEGIN . (task_type_declaration . 0)) (CASE . (task_type_declaration . 0)) (DECLARE . (task_type_declaration . 0)) (DELAY . (task_type_declaration . 0)) (END . (task_type_declaration . 0)) (ENTRY . (task_type_declaration . 0)) (EXIT . (task_type_declaration . 0)) (FOR . (task_type_declaration . 0)) (FUNCTION . (task_type_declaration . 0)) (GENERIC . (task_type_declaration . 0)) (GOTO . (task_type_declaration . 0)) (IF . (task_type_declaration . 0)) (LIMITED . (task_type_declaration . 0)) (LOOP . (task_type_declaration . 0)) (NOT . (task_type_declaration . 0)) (NULL . (task_type_declaration . 0)) (OVERRIDING . (task_type_declaration . 0)) (PACKAGE . (task_type_declaration . 0)) (PRAGMA . (task_type_declaration . 0)) (PRIVATE . (task_type_declaration . 0)) (PROCEDURE . (task_type_declaration . 0)) (PROTECTED . (task_type_declaration . 0)) (RAISE . (task_type_declaration . 0)) (REQUEUE . (task_type_declaration . 0)) (RETURN . (task_type_declaration . 0)) (SEPARATE . (task_type_declaration . 0)) (SELECT . (task_type_declaration . 0)) (SUBTYPE . (task_type_declaration . 0)) (TASK . (task_type_declaration . 0)) (TYPE . (task_type_declaration . 0)) (USE . (task_type_declaration . 0)) (WHILE . (task_type_declaration . 0)) (WITH . (task_type_declaration . 0)) (LESS_LESS . (task_type_declaration . 0)) (IDENTIFIER . (task_type_declaration . 0)) (STRING_LITERAL . (task_type_declaration . 0)) (CHARACTER_LITERAL . (task_type_declaration . 0)) (Wisi_EOI . (task_type_declaration . 0)))
      ((default . error) (WHEN . (entry_body_formal_part . 0)))
      ((default . error) (END .  1278))
      ((default . error) (SEMICOLON . (identifier_opt . 1)) (IDENTIFIER .  149))
      ((default . error) (SEMICOLON .  1280))
      ((default . error) (END . (entry_body . 0)) (ENTRY . (entry_body . 0)) (FOR . (entry_body . 0)) (FUNCTION . (entry_body . 0)) (NOT . (entry_body . 0)) (OVERRIDING . (entry_body . 0)) (PROCEDURE . (entry_body . 0)))]
     [((abstract_subprogram_declaration . 35)(accept_statement . 36)(aspect_clause . 37)(assignment_statement . 38)(asynchronous_select . 39)(at_clause . 40)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(body_g . 45)(body_stub . 46)(case_statement . 47)(compilation_unit . 48)(compilation_unit_list . 49)(compound_statement . 50)(conditional_entry_call . 51)(declaration . 52)(delay_statement . 53)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(exit_statement . 57)(expression_function_declaration . 58)(extended_return_statement . 59)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(goto_label . 68)(identifier_list . 69)(if_statement . 70)(incomplete_type_declaration . 71)(loop_statement . 72)(name . 73)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 83)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_call_statement . 86)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(qualified_expression . 92)(raise_statement . 93)(record_representation_clause . 94)(renaming_declaration . 95)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(simple_return_statement . 100)(simple_statement . 101)(single_protected_declaration . 102)(single_task_declaration . 103)(statement . 104)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(subunit . 110)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(timed_entry_call . 114)(type_declaration . 115)(use_clause . 116)(with_clause . 117))
      nil
      ((attribute_reference . 41)(name . 120)(qualified_expression . 92)(selected_component . 97))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 132)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 148)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((identifier_opt . 150))
      ((attribute_reference . 153)(direct_name . 154)(iterator_specification . 155)(iterator_specification_opt . 156)(name . 157)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(name . 158)(qualified_expression . 92)(selected_component . 97))
      ((formal_object_declaration . 165)(formal_subprogram_declaration . 166)(formal_type_declaration . 167)(formal_package_declaration . 168)(generic_formal_parameter_declarations . 169)(generic_formal_parameter_declaration . 170)(identifier_list . 171)(pragma_g . 172)(use_clause . 173))
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 175)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 181)(qualified_expression . 92)(selected_component . 97))
      nil
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 186)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      ((attribute_reference . 41)(name . 187)(qualified_expression . 92)(selected_component . 97))
      nil
      ((attribute_reference . 41)(name . 192)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(name . 193)(qualified_expression . 92)(selected_component . 97))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 195)(extended_return_object_declaration . 196)(extended_return_object_declaration_opt . 197)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((accept_statement . 201)(attribute_reference . 41)(delay_alternative . 202)(delay_statement . 203)(entry_call_alternative . 204)(name . 205)(procedure_call_statement . 206)(qualified_expression . 92)(selected_component . 97)(select_alternative . 207)(select_alternative_list . 208)(select_alternative_list_opt . 209)(triggering_alternative . 210))
      nil
      nil
      nil
      ((attribute_reference . 41)(name_list . 218)(name . 219)(qualified_expression . 92)(selected_component . 97))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 220)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((attribute_reference . 41)(name_list . 221)(name . 219)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((iteration_scheme . 228))
      nil
      nil
      nil
      nil
      nil
      ((abstract_subprogram_declaration . 35)(accept_statement . 36)(aspect_clause . 37)(assignment_statement . 38)(asynchronous_select . 39)(at_clause . 40)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(body_g . 45)(body_stub . 46)(case_statement . 47)(compilation_unit . 229)(compound_statement . 50)(conditional_entry_call . 51)(declaration . 52)(delay_statement . 53)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(exit_statement . 57)(expression_function_declaration . 58)(extended_return_statement . 59)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(goto_label . 68)(identifier_list . 69)(if_statement . 70)(incomplete_type_declaration . 71)(loop_statement . 72)(name . 73)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 83)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_call_statement . 86)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(qualified_expression . 92)(raise_statement . 93)(record_representation_clause . 94)(renaming_declaration . 95)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(simple_return_statement . 100)(simple_statement . 101)(single_protected_declaration . 102)(single_task_declaration . 103)(statement . 104)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(subunit . 110)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(timed_entry_call . 114)(type_declaration . 115)(use_clause . 116)(with_clause . 117))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((function_specification . 61)(package_specification . 231)(procedure_specification . 87)(subprogram_specification . 232))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      nil
      nil
      nil
      ((function_specification . 245)(procedure_specification . 246)(subprogram_specification . 247))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 250)(actual_parameter_part_opt . 251))
      nil
      ((actual_parameter_part . 240)(tick . 241))
      ((aggregate . 130)(attribute_reference . 41)(name . 134)(primary . 253)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(name . 254)(qualified_expression . 92)(selected_component . 97))
      ((aggregate . 130)(attribute_reference . 41)(name . 134)(primary . 255)(qualified_expression . 92)(selected_component . 97))
      nil
      ((attribute_reference . 41)(name . 256)(qualified_expression . 92)(selected_component . 97))
      ((aggregate . 130)(association_opt . 264)(association_list . 265)(attribute_reference . 41)(case_expression . 266)(conditional_quantified_expression . 267)(discrete_choice . 268)(discrete_choice_list . 269)(expression . 270)(expression_opt . 271)(factor . 133)(if_expression . 272)(name . 273)(primary . 135)(qualified_expression . 92)(quantified_expression . 274)(raise_expression . 136)(range_g . 275)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((relational_operator . 295))
      ((multiplying_operator . 300))
      ((binary_adding_operator . 304))
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(selected_component . 97)(term . 144)(term_list . 305))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 306)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      ((actual_parameter_part . 240)(formal_part . 318)(parameter_and_result_profile . 319)(result_profile . 320)(tick . 241))
      ((attribute_reference . 41)(name . 321)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(name . 322)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(name . 323)(qualified_expression . 92)(selected_component . 97))
      nil
      ((function_specification . 61)(procedure_specification . 87)(subprogram_specification . 326))
      nil
      nil
      nil
      nil
      nil
      ((formal_object_declaration . 165)(formal_subprogram_declaration . 166)(formal_type_declaration . 167)(formal_package_declaration . 168)(generic_formal_parameter_declaration . 327)(identifier_list . 171)(pragma_g . 172)(use_clause . 173))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name_list . 332)(name . 219)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      ((attribute_reference . 41)(name . 333)(qualified_expression . 92)(selected_component . 97))
      ((actual_parameter_part . 240)(aspect_specification_opt . 337)(tick . 241))
      nil
      ((attribute_reference . 153)(direct_name . 154)(name . 157)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(name_list . 341)(name . 219)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      ((actual_parameter_part . 240)(formal_part . 343)(parameter_profile_opt . 344)(tick . 241))
      nil
      nil
      ((aspect_specification_opt . 347))
      nil
      ((actual_parameter_part . 240)(tick . 241))
      ((actual_parameter_part . 240)(tick . 241))
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 356)(qualified_expression . 92)(selected_component . 97))
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 358)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 361)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 363)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      ((accept_statement . 36)(actual_parameter_part . 240)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 366)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(tick . 241)(timed_entry_call . 114))
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 367)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 375))
      ((discriminant_part_opt . 377))
      nil
      ((attribute_reference . 41)(name_list . 379)(name . 219)(qualified_expression . 92)(selected_component . 97))
      nil
      ((actual_parameter_part . 240)(tick . 241))
      nil
      nil
      nil
      ((access_definition . 386)(null_exclusion_opt . 387))
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(handled_sequence_of_statements . 388)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 389)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 392)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      ((iterator_specification . 155)(iterator_specification_opt . 156))
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 395)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      ((attribute_reference . 41)(name . 397)(qualified_expression . 92)(selected_component . 97))
      nil
      ((aspect_specification_opt . 399))
      ((aliased_opt . 403))
      nil
      ((aggregate . 130)(association_opt . 264)(association_list . 405)(attribute_reference . 41)(case_expression . 266)(conditional_quantified_expression . 406)(discrete_choice . 268)(discrete_choice_list . 269)(expression . 407)(factor . 133)(if_expression . 272)(name . 273)(primary . 135)(qualified_expression . 92)(quantified_expression . 274)(raise_expression . 136)(range_g . 408)(range_list . 409)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 410)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      nil
      ((aggregate . 419)(attribute_reference . 41)(attribute_designator . 420)(name . 421)(qualified_expression . 92)(selected_component . 97))
      nil
      ((attribute_reference . 41)(name . 423)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(name . 424)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      ((aspect_specification_opt . 429))
      nil
      ((aggregate . 130)(association_opt . 264)(association_list . 405)(attribute_reference . 41)(case_expression . 266)(conditional_quantified_expression . 406)(discrete_choice . 268)(discrete_choice_list . 269)(expression . 407)(factor . 133)(if_expression . 272)(name . 273)(primary . 135)(qualified_expression . 92)(quantified_expression . 274)(raise_expression . 136)(range_g . 275)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((formal_part . 343)(parameter_profile_opt . 431))
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      nil
      ((actual_parameter_part . 240)(tick . 241))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 433)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((quantifier . 436))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 437)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(name . 134)(primary . 255)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 240)(tick . 447))
      nil
      nil
      ((relational_operator . 295))
      ((case_statement_alternative . 450)(case_statement_alternative_list . 451))
      ((aggregate . 130)(attribute_reference . 41)(name . 134)(primary . 452)(qualified_expression . 92)(selected_component . 97))
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation . 453)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation . 455)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation . 457)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation . 459)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation . 461)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation . 462)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(membership_choice_list . 463)(membership_choice . 464)(name . 273)(primary . 135)(qualified_expression . 92)(range_g . 465)(selected_component . 97)(simple_expression . 466)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(selected_component . 97)(simple_expression . 468)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 469)(name . 134)(primary . 135)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(selected_component . 97)(term . 470))
      ((binary_adding_operator . 304))
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 472)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(attribute_reference . 41)(discrete_subtype_definition . 475)(factor . 133)(name . 476)(primary . 135)(qualified_expression . 92)(range_g . 477)(selected_component . 97)(simple_expression . 478)(subtype_indication . 479)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((attribute_reference . 41)(name . 481)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(name . 483)(qualified_expression . 92)(selected_component . 97)(subtype_indication . 484))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 485)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 488))
      ((access_definition . 489)(null_exclusion_opt . 490))
      ((aggregate . 130)(association_opt . 264)(association_list . 405)(attribute_reference . 41)(case_expression . 266)(conditional_quantified_expression . 406)(discrete_choice . 268)(discrete_choice_list . 269)(expression . 407)(factor . 133)(identifier_list . 492)(if_expression . 272)(name . 273)(parameter_specification . 493)(parameter_specification_list . 494)(primary . 135)(qualified_expression . 92)(quantified_expression . 274)(raise_expression . 136)(range_g . 408)(range_list . 409)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((result_profile . 495))
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      ((actual_parameter_part . 240)(tick . 241))
      ((actual_parameter_part . 240)(tick . 241))
      ((discriminant_part_opt . 499))
      ((attribute_reference . 41)(name . 500)(qualified_expression . 92)(selected_component . 97))
      ((aspect_specification_opt . 502))
      nil
      ((mode_opt . 505))
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 506)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      ((attribute_reference . 41)(name_list . 507)(name . 219)(qualified_expression . 92)(selected_component . 97))
      nil
      ((actual_parameter_part . 240)(aspect_specification_opt . 510)(tick . 241))
      nil
      ((attribute_reference . 41)(name . 512)(qualified_expression . 92)(selected_component . 97))
      ((aggregate . 130)(association_opt . 264)(association_list . 513)(attribute_reference . 41)(discrete_choice . 268)(discrete_choice_list . 269)(expression . 407)(factor . 133)(name . 273)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(range_g . 275)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(association_opt . 264)(association_list . 515)(attribute_reference . 41)(case_expression . 266)(conditional_quantified_expression . 516)(discrete_choice . 268)(discrete_choice_list . 269)(expression . 407)(factor . 133)(if_expression . 272)(name . 273)(primary . 135)(qualified_expression . 92)(quantified_expression . 274)(raise_expression . 136)(range_g . 275)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      ((access_definition . 386)(null_exclusion_opt . 387))
      nil
      nil
      ((aspect_specification_opt . 519))
      ((discriminant_part_opt . 520))
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 522)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      ((aliased_opt . 524))
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(handled_sequence_of_statements . 525)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 389)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      ((actual_parameter_part . 240)(tick . 241))
      nil
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(simple_return_statement . 100)(simple_statement . 101)(statement . 529)(timed_entry_call . 114))
      nil
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 530)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      ((delay_alternative . 531)(delay_statement . 532))
      nil
      nil
      ((accept_statement . 201)(delay_alternative . 202)(delay_statement . 532)(select_alternative . 533))
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 534)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      ((attribute_reference . 41)(name . 483)(qualified_expression . 92)(selected_component . 97)(subtype_indication . 537))
      ((aspect_specification_opt . 539))
      ((discriminant_part_opt . 540))
      nil
      ((discriminant_specification_opt . 544)(discriminant_specification_list . 545)(identifier_list . 546))
      nil
      ((attribute_reference . 41)(name_list . 549)(name . 219)(qualified_expression . 92)(selected_component . 97))
      nil
      ((attribute_reference . 41)(name . 551)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 556)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 559)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 560)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      nil
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 563)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      ((actual_parameter_part . 240)(aspect_specification_opt . 337)(tick . 241))
      nil
      nil
      nil
      nil
      nil
      ((constant_opt . 568))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      ((formal_part . 343)(parameter_profile_opt . 575))
      ((actual_parameter_part . 240)(formal_part . 318)(parameter_and_result_profile . 319)(result_profile . 320)(tick . 241))
      ((actual_parameter_part . 240)(formal_part . 343)(parameter_profile_opt . 344)(tick . 241))
      ((paren_expression . 579))
      nil
      nil
      ((attribute_reference . 41)(name . 583)(qualified_expression . 92)(selected_component . 97))
      nil
      ((identifier_list . 492)(parameter_specification . 493)(parameter_specification_list . 494))
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 588)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      ((iterator_specification . 590))
      nil
      ((attribute_reference . 41)(name . 592)(qualified_expression . 92)(selected_component . 97))
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 595)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(association_opt . 596)(attribute_reference . 41)(discrete_choice . 268)(discrete_choice_list . 269)(expression . 407)(factor . 133)(name . 273)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(range_g . 275)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(attribute_reference . 41)(discrete_choice . 597)(expression . 598)(factor . 133)(name . 273)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(range_g . 275)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 600)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(association_opt . 264)(association_list . 602)(attribute_reference . 41)(discrete_choice . 268)(discrete_choice_list . 269)(expression . 407)(factor . 133)(name . 273)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(range_g . 275)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 419)(attribute_reference . 41)(attribute_designator . 420)(name . 421)(qualified_expression . 92)(selected_component . 97))
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(selected_component . 97)(simple_expression . 604)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(discrete_choice . 268)(discrete_choice_list . 605)(expression . 598)(factor . 133)(name . 273)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(range_g . 275)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((case_statement_alternative . 607))
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation . 608)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation . 609)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation . 610)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation . 611)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(membership_choice_list . 613)(membership_choice . 464)(name . 273)(primary . 135)(qualified_expression . 92)(range_g . 465)(selected_component . 97)(simple_expression . 466)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((multiplying_operator . 300))
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(name . 134)(primary . 255)(qualified_expression . 92)(selected_component . 97))
      ((aggregate . 130)(attribute_reference . 41)(discrete_subtype_definition . 616)(factor . 133)(name . 476)(primary . 135)(qualified_expression . 92)(range_g . 477)(selected_component . 97)(simple_expression . 478)(subtype_indication . 479)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((actual_parameter_part . 240)(constraint . 619)(index_constraint . 620)(tick . 447))
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 621)(qualified_expression . 92)(selected_component . 97))
      ((actual_parameter_part . 240)(tick . 241))
      nil
      ((actual_parameter_part . 240)(constraint . 619)(index_constraint . 620)(tick . 241))
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 625)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((mod_clause_opt . 627))
      nil
      nil
      ((attribute_reference . 41)(name . 629)(name_opt . 630)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 634)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(name . 635)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(name . 636)(qualified_expression . 92)(selected_component . 97))
      ((aspect_specification_opt . 638))
      ((actual_parameter_part . 240)(tick . 241))
      ((attribute_reference . 41)(name . 643)(qualified_expression . 92)(selected_component . 97)(subprogram_default . 644))
      nil
      nil
      nil
      ((access_definition . 647)(null_exclusion_opt . 648))
      ((elsif_statement_item . 652)(elsif_statement_list . 653))
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 657)(qualified_expression . 92)(selected_component . 97))
      ((actual_parameter_part . 240)(aspect_specification_opt . 658)(tick . 241))
      nil
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 659)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 664))
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 666)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_definition . 667)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      nil
      ((constant_opt . 670))
      nil
      ((function_specification . 61)(overriding_indicator_opt . 675)(package_body . 78)(procedure_specification . 87)(proper_body . 676)(protected_body . 89)(subprogram_body . 105)(task_body . 111))
      ((accept_statement . 678)(delay_alternative . 679)(delay_statement . 532))
      nil
      nil
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 682)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 685)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      ((aspect_specification_opt . 686))
      nil
      nil
      ((aspect_specification_opt . 689))
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 691)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_definition . 692)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      nil
      nil
      nil
      nil
      ((abstract_limited_synchronized_opt . 712)(abstract_limited_opt . 713)(abstract_tagged_limited_opt . 714)(access_definition . 715)(array_type_definition . 716)(derived_type_definition . 717)(enumeration_type_definition . 718)(interface_type_definition . 719)(null_exclusion_opt . 720)(type_definition . 721))
      nil
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      ((attribute_reference . 41)(name . 723)(qualified_expression . 92)(selected_component . 97))
      nil
      ((attribute_reference . 41)(name . 724)(qualified_expression . 92)(selected_component . 97))
      ((general_access_modifier_opt . 728)(protected_opt . 729))
      ((actual_parameter_part . 240)(tick . 241))
      ((identifier_opt . 731))
      ((exception_handler . 733)(exception_handler_list . 734)(exception_handler_list_opt . 735)(pragma_g . 736))
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(handled_sequence_of_statements . 737)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 389)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 740)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((access_definition . 742)(array_type_definition . 743)(attribute_reference . 41)(name . 483)(null_exclusion_opt . 720)(qualified_expression . 92)(selected_component . 97)(subtype_indication . 744))
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 273)(primary . 135)(qualified_expression . 92)(range_g . 745)(selected_component . 97)(simple_expression . 478)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(attribute_reference . 41)(discrete_subtype_definition . 746)(factor . 133)(identifier_list . 492)(name . 476)(parameter_specification . 493)(parameter_specification_list . 494)(primary . 135)(qualified_expression . 92)(range_g . 477)(selected_component . 97)(simple_expression . 478)(subtype_indication . 479)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aspect_specification_opt . 747))
      nil
      nil
      ((aggregate . 130)(association_opt . 264)(association_list . 750)(attribute_reference . 41)(case_expression . 266)(conditional_quantified_expression . 751)(discrete_choice . 268)(discrete_choice_list . 269)(expression . 270)(expression_opt . 752)(factor . 133)(if_expression . 272)(name . 273)(primary . 135)(qualified_expression . 92)(quantified_expression . 274)(raise_expression . 136)(range_g . 275)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aspect_specification_opt . 753))
      ((aspect_specification_opt . 754))
      ((aspect_specification_opt . 755))
      ((aspect_specification_opt . 756))
      ((actual_parameter_part . 240)(aspect_specification_opt . 757)(tick . 241))
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 758)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(handled_sequence_of_statements . 759)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 389)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      ((case_expression_alternative . 761)(case_expression_alternative_list . 762))
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 764)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((actual_parameter_part . 240)(tick . 241))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(membership_choice . 770)(name . 273)(primary . 135)(qualified_expression . 92)(range_g . 465)(selected_component . 97)(simple_expression . 466)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((attribute_reference . 41)(name . 771)(qualified_expression . 92)(selected_component . 97))
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 273)(primary . 135)(qualified_expression . 92)(range_g . 772)(selected_component . 97)(simple_expression . 478)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(association_opt . 264)(association_list . 405)(attribute_reference . 41)(case_expression . 266)(conditional_quantified_expression . 406)(discrete_choice . 268)(discrete_choice_list . 269)(discrete_subtype_definition . 774)(discrete_subtype_definition_list . 775)(expression . 407)(factor . 133)(if_expression . 272)(name . 476)(primary . 135)(qualified_expression . 92)(quantified_expression . 274)(raise_expression . 136)(range_g . 776)(range_list . 409)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(subtype_indication . 479)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      ((attribute_reference . 41)(name . 771)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(name . 778)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      ((component_clause . 782)(component_clause_list . 783))
      nil
      ((actual_parameter_part . 240)(tick . 241))
      nil
      ((aliased_opt . 784))
      nil
      ((identifier_list . 492)(parameter_specification . 785))
      ((actual_parameter_part . 240)(aspect_specification_opt . 786)(tick . 241))
      ((actual_parameter_part . 240)(aspect_specification_opt . 787)(tick . 241))
      ((actual_parameter_part . 240)(aspect_specification_opt . 788)(tick . 241))
      ((abstract_limited_synchronized_opt . 797)(abstract_tagged_limited_opt . 798)(access_definition . 799)(array_type_definition . 800)(formal_type_definition . 801)(formal_derived_type_definition . 802)(interface_type_definition . 803)(null_exclusion_opt . 720))
      nil
      nil
      ((aspect_specification_opt . 806)(attribute_reference . 41)(name . 643)(qualified_expression . 92)(selected_component . 97)(subprogram_default . 807))
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      ((aspect_specification_opt . 808))
      nil
      nil
      ((aspect_specification_opt . 810))
      ((attribute_reference . 41)(name . 811)(qualified_expression . 92)(selected_component . 97))
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 812)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 813)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((elsif_statement_item . 817))
      nil
      ((aspect_specification_opt . 818))
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 819)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      ((actual_parameter_part . 240)(aspect_specification_opt . 820)(tick . 241))
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 826))
      ((aspect_clause . 828)(at_clause . 40)(entry_body . 829)(enumeration_representation_clause . 55)(expression_function_declaration . 830)(function_specification . 61)(null_procedure_declaration . 831)(overriding_indicator_opt . 832)(procedure_specification . 87)(protected_operation_item . 833)(protected_operation_item_list . 834)(protected_operation_item_list_opt . 835)(record_representation_clause . 94)(subprogram_body . 836)(subprogram_declaration . 837))
      nil
      ((attribute_reference . 41)(interface_list . 839)(name . 840)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      nil
      ((access_definition . 844)(attribute_reference . 41)(name . 483)(null_exclusion_opt . 720)(qualified_expression . 92)(return_subtype_indication . 845)(selected_component . 97)(subtype_indication . 846))
      nil
      nil
      nil
      nil
      ((function_specification . 61)(procedure_specification . 87)(subprogram_specification . 851))
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 853)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 859))
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 860)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      ((attribute_reference . 41)(interface_list . 863)(name . 840)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      nil
      ((discriminant_specification_opt . 866)(identifier_list . 546))
      ((access_definition . 869)(attribute_reference . 41)(name . 870)(null_exclusion_opt . 720)(null_exclusion_opt_name_type . 871)(qualified_expression . 92)(selected_component . 872))
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 877)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 878)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 880)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(selected_component . 97)(simple_expression . 883)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aspect_clause . 886)(at_clause . 40)(component_declaration . 887)(component_item . 888)(component_list . 889)(component_list_opt . 890)(enumeration_representation_clause . 55)(identifier_list . 891)(record_representation_clause . 94)(variant_part . 892))
      nil
      nil
      nil
      ((enumeration_literal . 899)(enumeration_literal_list . 900))
      nil
      nil
      ((record_definition . 904))
      nil
      nil
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 905))
      nil
      ((actual_parameter_part . 240)(aspect_specification_opt . 906)(tick . 241))
      ((actual_parameter_part . 240)(aspect_specification_opt . 907)(tick . 241))
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 908)(qualified_expression . 92)(selected_component . 97))
      nil
      ((attribute_reference . 41)(name . 911)(qualified_expression . 92)(selected_component . 97))
      nil
      ((attribute_reference . 41)(exception_choice . 915)(exception_choice_list . 916)(name . 917)(qualified_expression . 92)(selected_component . 97))
      nil
      ((exception_handler . 918))
      nil
      nil
      nil
      ((identifier_opt . 920))
      nil
      nil
      nil
      ((aspect_specification_opt . 925))
      ((aspect_specification_opt . 927))
      ((aspect_specification_opt . 929))
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 932)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(name . 933)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(discrete_choice . 268)(discrete_choice_list . 944)(expression . 598)(factor . 133)(name . 273)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(range_g . 275)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 946)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((elsif_expression_item . 949)(elsif_expression_list . 950))
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 952)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 953)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      ((actual_parameter_part . 240)(constraint . 955)(index_constraint . 620)(tick . 241))
      nil
      ((aggregate . 130)(attribute_reference . 41)(name . 134)(primary . 255)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 959)(qualified_expression . 92)(selected_component . 97))
      ((actual_parameter_part . 240)(tick . 241))
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 960)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((component_clause . 963))
      ((access_definition . 964)(mode_opt . 965)(null_exclusion_opt . 720))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 974))
      nil
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 978))
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 979)(qualified_expression . 92)(selected_component . 97))
      nil
      ((aspect_specification_opt . 981))
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 983)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((actual_parameter_part . 240)(aspect_specification_opt . 986)(tick . 241))
      nil
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 990)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 629)(name_opt . 996)(qualified_expression . 92)(selected_component . 97))
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 997)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((function_specification . 245)(procedure_specification . 246)(subprogram_specification . 1000))
      nil
      ((aspect_clause . 828)(at_clause . 40)(entry_body . 829)(enumeration_representation_clause . 55)(expression_function_declaration . 830)(function_specification . 61)(null_procedure_declaration . 831)(overriding_indicator_opt . 832)(procedure_specification . 87)(protected_operation_item . 1001)(record_representation_clause . 94)(subprogram_body . 836)(subprogram_declaration . 837))
      nil
      nil
      nil
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 666)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_definition . 1004)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      ((actual_parameter_part . 240)(tick . 241))
      ((identifier_opt . 1007))
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 1008)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 1011)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      ((aspect_specification_opt . 1014))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 691)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_definition . 1022)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      nil
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 1024)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      ((identifier_opt . 1025))
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(discrete_subtype_definition . 774)(discrete_subtype_definition_list . 1030)(factor . 133)(index_subtype_definition . 1031)(index_subtype_definition_list . 1032)(name . 1033)(primary . 135)(qualified_expression . 92)(range_g . 477)(selected_component . 97)(simple_expression . 478)(subtype_indication . 479)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((real_range_specification_opt . 1036))
      ((real_range_specification_opt . 1037))
      nil
      nil
      nil
      nil
      nil
      ((direct_name . 1043)(direct_name_opt . 1044))
      nil
      nil
      nil
      nil
      ((aspect_clause . 886)(at_clause . 40)(component_declaration . 887)(component_item . 1046)(enumeration_representation_clause . 55)(identifier_list . 891)(record_representation_clause . 94)(variant_part . 1047))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 483)(qualified_expression . 92)(selected_component . 97)(subtype_indication . 1054))
      ((attribute_reference . 41)(name . 1055)(qualified_expression . 92)(selected_component . 97))
      ((aspect_specification_opt . 1056))
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      ((formal_part . 318)(parameter_and_result_profile . 1060)(result_profile . 320))
      ((formal_part . 343)(parameter_profile_opt . 1061))
      ((actual_parameter_part . 240)(aspect_specification_opt . 1062)(tick . 241))
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      nil
      ((identifier_opt . 1066))
      nil
      ((identifier_opt . 1068))
      nil
      ((attribute_reference . 41)(name . 771)(qualified_expression . 92)(selected_component . 97))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1069)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1071)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1073)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((formal_part . 343)(parameter_profile_opt . 1075))
      nil
      ((actual_parameter_part . 240)(aspect_specification_opt . 1076)(tick . 241))
      ((actual_parameter_part . 240)(aspect_specification_opt . 1077)(tick . 241))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(handled_sequence_of_statements . 1078)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 389)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      ((identifier_opt . 1079))
      nil
      ((case_expression_alternative . 1081))
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1082)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1083)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((elsif_expression_item . 1085))
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 1087)(qualified_expression . 92)(selected_component . 97))
      nil
      ((aggregate . 130)(attribute_reference . 41)(discrete_subtype_definition . 1088)(factor . 133)(name . 476)(primary . 135)(qualified_expression . 92)(range_g . 477)(selected_component . 97)(simple_expression . 478)(subtype_indication . 479)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((actual_parameter_part . 240)(tick . 241))
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(selected_component . 97)(simple_expression . 1090)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      ((null_exclusion_opt . 1093))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 1097)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      ((actual_parameter_part . 240)(formal_package_actual_part . 1100)(tick . 241))
      nil
      nil
      nil
      ((aspect_specification_opt . 1102))
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1103)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 1106)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(handled_sequence_of_statements . 1109)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 389)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      ((attribute_reference . 41)(name . 629)(name_opt . 1110)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      nil
      ((entry_body_formal_part . 1113)(formal_part . 343)(parameter_profile_opt . 1114))
      ((aspect_specification_opt . 429))
      nil
      ((identifier_opt . 1115))
      ((attribute_reference . 41)(interface_list . 1116)(name . 840)(qualified_expression . 92)(selected_component . 97))
      nil
      ((attribute_reference . 41)(name . 1118)(qualified_expression . 92)(selected_component . 97))
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 666)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_definition . 1119)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1121)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((actual_parameter_part . 240)(aspect_specification_opt . 510)(tick . 241))
      ((aspect_specification_opt . 519))
      ((aspect_specification_opt . 539))
      nil
      nil
      nil
      nil
      nil
      nil
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(handled_sequence_of_statements . 1123)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 389)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      ((attribute_reference . 41)(interface_list . 1124)(name . 840)(qualified_expression . 92)(selected_component . 97))
      nil
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 691)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_definition . 1126)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      nil
      ((attribute_reference . 41)(name . 870)(qualified_expression . 92)(selected_component . 1129))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1130)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1131)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 240)(constraint . 619)(index_constraint . 620)(tick . 447))
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1136)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(selected_component . 97)(simple_expression . 1137)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((attribute_reference . 41)(interface_list . 1138)(name . 840)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(interface_list . 1139)(name . 840)(qualified_expression . 92)(selected_component . 97))
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(selected_component . 97)(simple_expression . 1140)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((access_definition . 1144)(attribute_reference . 41)(component_definition . 1145)(name . 483)(null_exclusion_opt . 720)(qualified_expression . 92)(selected_component . 97)(subtype_indication . 1146))
      ((attribute_reference . 41)(interface_list . 1147)(name . 840)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(interface_list . 1148)(name . 840)(qualified_expression . 92)(selected_component . 97))
      nil
      ((enumeration_literal . 1149))
      ((and_interface_list_opt . 1151))
      ((actual_parameter_part . 240)(and_interface_list_opt . 1152)(constraint . 1153)(constraint_opt . 1154)(index_constraint . 620)(tick . 241))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(exception_choice . 915)(exception_choice_list . 1157)(name . 917)(qualified_expression . 92)(selected_component . 97))
      ((attribute_reference . 41)(exception_choice . 1158)(name . 917)(qualified_expression . 92)(selected_component . 97))
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 1159)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      nil
      ((aspect_specification_opt . 1162))
      nil
      ((aspect_specification_opt . 1163))
      nil
      ((aspect_specification_opt . 1164))
      nil
      ((aspect_specification_opt . 1165))
      nil
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1170)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1172)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((actual_parameter_part . 240)(constraint . 955)(index_constraint . 620)(tick . 241))
      nil
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1175)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((attribute_reference . 41)(name . 1176)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      ((actual_parameter_part . 240)(and_interface_list_opt . 1178)(tick . 241))
      nil
      ((aggregate . 130)(association_opt . 264)(association_list . 405)(attribute_reference . 41)(case_expression . 266)(conditional_quantified_expression . 406)(discrete_choice . 268)(discrete_choice_list . 269)(expression . 407)(factor . 133)(if_expression . 272)(name . 273)(primary . 135)(qualified_expression . 92)(quantified_expression . 274)(raise_expression . 136)(range_g . 408)(range_list . 409)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aspect_specification_opt . 1180))
      nil
      nil
      ((aspect_specification_opt . 1182))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 629)(name_opt . 1187)(qualified_expression . 92)(selected_component . 97))
      ((identifier_list . 492)(parameter_specification . 493)(parameter_specification_list . 494))
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      nil
      ((identifier_opt . 1193))
      nil
      nil
      nil
      nil
      ((identifier_opt . 1196))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(index_subtype_definition . 1200)(name . 1201)(qualified_expression . 92)(selected_component . 97))
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 273)(primary . 135)(qualified_expression . 92)(range_g . 772)(selected_component . 97)(simple_expression . 478)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((real_range_specification_opt . 1203))
      nil
      nil
      nil
      nil
      ((variant_list . 1206)(variant . 1207))
      nil
      ((access_definition . 1208)(attribute_reference . 41)(name . 483)(null_exclusion_opt . 720)(qualified_expression . 92)(selected_component . 97)(subtype_indication . 1209))
      nil
      ((aspect_specification_opt . 1211))
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(interface_list . 1212)(name . 840)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 629)(name_opt . 1220)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1221)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(selected_component . 97)(simple_expression . 1222)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      ((actual_parameter_part . 240)(tick . 241))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 41)(name . 629)(name_opt . 1229)(qualified_expression . 92)(selected_component . 97))
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1231)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 666)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_definition . 1232)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      nil
      ((identifier_opt . 1233))
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 691)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_definition . 1234)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      ((identifier_opt . 1236))
      ((access_definition . 1144)(attribute_reference . 41)(component_definition . 1237)(name . 483)(null_exclusion_opt . 720)(qualified_expression . 92)(selected_component . 97)(subtype_indication . 1146))
      ((access_definition . 1144)(attribute_reference . 41)(component_definition . 1238)(name . 483)(null_exclusion_opt . 720)(qualified_expression . 92)(selected_component . 97)(subtype_indication . 1146))
      nil
      ((actual_parameter_part . 240)(tick . 241))
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(selected_component . 97)(simple_expression . 1240)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((aggregate . 130)(attribute_reference . 41)(discrete_choice . 268)(discrete_choice_list . 1241)(expression . 598)(factor . 133)(name . 273)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(range_g . 275)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 276)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((variant . 1243))
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1244)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      ((record_definition . 1247))
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 1248)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(expression . 131)(expression_opt . 1251)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(raise_expression . 136)(relation_and_list . 137)(relation_and_then_list . 138)(relation_or_list . 139)(relation_or_else_list . 140)(relation_xor_list . 141)(relation . 142)(selected_component . 97)(simple_expression . 143)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 1262))
      nil
      ((aspect_specification_opt . 1263))
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(factor . 133)(name . 134)(primary . 135)(qualified_expression . 92)(selected_component . 97)(simple_expression . 1264)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      nil
      nil
      nil
      ((aggregate . 130)(attribute_reference . 41)(discrete_subtype_definition . 1265)(factor . 133)(name . 476)(primary . 135)(qualified_expression . 92)(range_g . 477)(selected_component . 97)(simple_expression . 478)(subtype_indication . 479)(term . 144)(term_list . 145)(unary_adding_operator . 146))
      ((abstract_subprogram_declaration . 35)(aspect_clause . 37)(at_clause . 40)(body_g . 45)(body_stub . 46)(declaration . 390)(declarations . 391)(declarative_part_opt . 1266)(entry_declaration . 54)(enumeration_representation_clause . 55)(exception_declaration . 56)(expression_function_declaration . 58)(full_type_declaration . 60)(function_specification . 61)(generic_declaration . 62)(generic_formal_part . 63)(generic_instantiation . 64)(generic_package_declaration . 65)(generic_renaming_declaration . 66)(generic_subprogram_declaration . 67)(identifier_list . 69)(incomplete_type_declaration . 71)(null_procedure_declaration . 74)(object_declaration . 75)(object_renaming_declaration . 76)(overriding_indicator_opt . 77)(package_body . 78)(package_body_stub . 79)(package_declaration . 80)(package_renaming_declaration . 81)(package_specification . 82)(pragma_g . 393)(private_extension_declaration . 84)(private_type_declaration . 85)(procedure_specification . 87)(proper_body . 88)(protected_body . 89)(protected_body_stub . 90)(protected_type_declaration . 91)(record_representation_clause . 94)(renaming_declaration . 95)(single_protected_declaration . 102)(single_task_declaration . 103)(subprogram_body . 105)(subprogram_body_stub . 106)(subprogram_declaration . 107)(subprogram_renaming_declaration . 108)(subtype_declaration . 109)(task_body . 111)(task_body_stub . 112)(task_type_declaration . 113)(type_declaration . 115)(use_clause . 116))
      nil
      nil
      ((identifier_opt . 1267))
      nil
      ((aspect_clause . 886)(at_clause . 40)(component_declaration . 887)(component_item . 888)(component_list . 889)(component_list_opt . 1268)(enumeration_representation_clause . 55)(identifier_list . 891)(record_representation_clause . 94)(variant_part . 892))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((formal_part . 343)(parameter_profile_opt . 1276))
      ((accept_statement . 36)(assignment_statement . 38)(asynchronous_select . 39)(attribute_reference . 41)(block_label . 42)(block_label_opt . 43)(block_statement . 44)(case_statement . 47)(compound_statement . 50)(conditional_entry_call . 51)(delay_statement . 53)(exit_statement . 57)(extended_return_statement . 59)(goto_label . 68)(handled_sequence_of_statements . 1277)(if_statement . 70)(loop_statement . 72)(name . 73)(pragma_g . 83)(procedure_call_statement . 86)(qualified_expression . 92)(raise_statement . 93)(requeue_statement . 96)(selected_component . 97)(selective_accept . 98)(select_statement . 99)(sequence_of_statements . 360)(sequence_of_statements_opt . 389)(simple_return_statement . 100)(simple_statement . 101)(statement . 362)(timed_entry_call . 114))
      nil
      nil
      nil
      ((identifier_opt . 1279))
      nil
      nil]))
  "Parser table.")

(provide 'ada-lalr-elisp)
;; end of file
