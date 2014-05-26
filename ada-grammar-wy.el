;;; ada-grammar-wy.el --- Generated parser support file

;; Copyright (C) 2013  Free Software Foundation, Inc.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or (at
;; your option) any later version.
;;
;; This software is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

(require 'wisi)
(require 'semantic/lex)
(require 'wisi-compile)

(defconst ada-grammar-wy--keyword-table
  (semantic-lex-make-keyword-table
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
    ("(" . LEFT_PAREN)
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
    (")" . RIGHT_PAREN)
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
    )
   nil)
  "Table of language keywords.")

(defconst ada-grammar-wy--token-table
  (semantic-lex-make-type-table
   '(
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
      (TICK . "'")
     )
     ("symbol"
      (IDENTIFIER)
     )
     ("string-double"
      (STRING_LITERAL)
     )
     ("string-single"
      (CHARACTER_LITERAL)
     )
    )
   nil)
  "Table of language tokens.")

(defconst ada-grammar-wy--parse-table
   (wisi-compile-grammar
   '((AMPERSAND BAR BOX COLON COLON_EQUAL COMMA DOT DOT_DOT EQUAL EQUAL_GREATER GREATER GREATER_EQUAL GREATER_GREATER LESS LESS_EQUAL LESS_LESS MINUS PLUS SEMICOLON SLASH SLASH_EQUAL STAR STAR_STAR TICK IDENTIFIER STRING_LITERAL CHARACTER_LITERAL ABS ACCEPT ABORT ABSTRACT ACCESS ALIASED ALL AND ARRAY AT BEGIN BODY CASE CONSTANT DECLARE DELAY DELTA DIGITS DO ELSE ELSIF END ENTRY EXCEPTION EXIT FOR FUNCTION GENERIC GOTO IF IN INTERFACE IS LEFT_PAREN LIMITED LOOP MOD NEW NOT NULL OF OR OTHERS OUT OVERRIDING PACKAGE PRAGMA PRIVATE PROCEDURE PROTECTED RAISE RANGE RECORD REM RENAMES REQUEUE RETURN REVERSE RIGHT_PAREN SEPARATE SELECT SOME SUBTYPE SYNCHRONIZED TAGGED TASK TERMINATE THEN TYPE UNTIL USE WHEN WHILE WITH XOR )
     ((abstract_limited_synchronized_opt
       (())
       ((ABSTRACT LIMITED ))
       ((ABSTRACT SYNCHRONIZED ))
       ((ABSTRACT ))
       ((LIMITED ))
       ((SYNCHRONIZED )))
      (abstract_limited_opt
       (())
       ((ABSTRACT LIMITED ))
       ((LIMITED ))
       ((ABSTRACT )))
      (abstract_tagged_limited_opt
       (())
       ((ABSTRACT TAGGED LIMITED ))
       ((ABSTRACT TAGGED ))
       ((TAGGED LIMITED ))
       ((TAGGED ))
       ((LIMITED )))
      (abstract_subprogram_declaration
       ((overriding_indicator_opt subprogram_specification IS ABSTRACT aspect_specification_opt SEMICOLON )
        (wisi-statement-action 1 'statement-start 2 'statement-other 6 'statement-end)))
      (accept_statement
       ((ACCEPT IDENTIFIER actual_parameter_part_opt parameter_profile_opt DO handled_sequence_of_statements END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 2 'name-paren 5 'block-middle 7 'block-end 9 'statement-end)
        (wisi-containing-action 2 3)
        (wisi-containing-action 2 4)
        (wisi-containing-action 5 6)
        (wisi-motion-action 1 5 '(6 EXCEPTION))))
       ((ACCEPT IDENTIFIER actual_parameter_part_opt parameter_profile_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'name-paren 5 'statement-end)
        (wisi-containing-action 2 3)
        (wisi-containing-action 2 4))))
      (access_definition
       ((null_exclusion_opt ACCESS general_access_modifier_opt name )
        (wisi-statement-action 4 'type))
       ((null_exclusion_opt ACCESS protected_opt PROCEDURE parameter_profile_opt )
        (progn
        (wisi-statement-action 4 'name-paren)
        (wisi-containing-action 4 5)))
       ((null_exclusion_opt ACCESS protected_opt FUNCTION parameter_and_result_profile )
        (progn
        (wisi-statement-action 4 'name-paren)
        (wisi-containing-action 4 5)
        (wisi-motion-action 4 '(5 RETURN)))))
      (actual_parameter_part
       ((LEFT_PAREN association_list RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'close-paren)
        (wisi-containing-action 1 2))))
      (actual_parameter_part_opt
       (())
       ((actual_parameter_part )))
      (aggregate
       ((LEFT_PAREN association_list RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'close-paren)
        (wisi-containing-action 1 2)))
       ((LEFT_PAREN expression WITH association_list RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'statement-other 5 'close-paren)
        (wisi-containing-action 1 2)
        (wisi-containing-action 1 3)
        (wisi-containing-action 3 4)))
       ((LEFT_PAREN expression WITH NULL RECORD RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'statement-other 6 'close-paren)
        (wisi-containing-action 1 2)
        (wisi-containing-action 1 3)))
       ((LEFT_PAREN NULL RECORD RIGHT_PAREN )
        (wisi-statement-action 1 'open-paren 4 'close-paren)))
      (aliased_opt
       (())
       ((ALIASED )))
      (and_interface_list_opt
       (())
       ((AND interface_list )))
      (array_type_definition
       ((ARRAY LEFT_PAREN index_subtype_definition_list RIGHT_PAREN OF component_definition )
        (progn
        (wisi-statement-action 2 'open-paren 4 'close-paren 5 'statement-other)
        (wisi-containing-action 2 3)
        (wisi-containing-action 5 6)))
       ((ARRAY LEFT_PAREN discrete_subtype_definition_list RIGHT_PAREN OF component_definition )
        (progn
        (wisi-statement-action 2 'open-paren 4 'close-paren 5 'statement-other)
        (wisi-containing-action 2 3)
        (wisi-containing-action 5 6))))
      (aspect_clause
       ((FOR attribute_reference USE expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'statement-other 5 'statement-end)
        (wisi-containing-action 3 4)))
       ((enumeration_representation_clause ))
       ((record_representation_clause ))
       ((at_clause )))
      (aspect_specification_opt
       (())
       ((WITH association_list )
        (progn
        (wisi-statement-action 1 'statement-other)
        (wisi-containing-action 1 2))))
      (assignment_statement
       ((name COLON_EQUAL expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 4 'statement-end)
        (wisi-containing-action 2 3))))
      (association_opt
       (())
       ((CHARACTER_LITERAL EQUAL_GREATER expression )
        (progn
        (wisi-statement-action 2 'statement-other)
        (wisi-containing-action 2 3)))
       ((CHARACTER_LITERAL EQUAL_GREATER BOX ))
       ((discrete_choice_list EQUAL_GREATER expression )
        (progn
        (wisi-statement-action 2 'statement-other)
        (wisi-containing-action 2 3)))
       ((discrete_choice_list EQUAL_GREATER BOX ))
       ((expression_opt )))
      (association_list
       ((association_opt ))
       ((association_list COMMA association_opt )
        (progn
        (wisi-statement-action 2 'list-break)
        (wisi-containing-action 2 3))))
      (asynchronous_select
       ((SELECT triggering_alternative THEN ABORT sequence_of_statements_opt END SELECT SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'block-middle 4 'statement-other 6 'block-end 8 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 5))))
      (at_clause
       ((FOR direct_name USE AT expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 4 'statement-other 6 'statement-end)
        (wisi-containing-action 4 5))))
      (attribute_reference
       ((name TICK attribute_designator )))
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
      (block_statement
       ((DECLARE declarative_part_opt BEGIN handled_sequence_of_statements END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'block-middle 5 'block-end 7 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)
        (wisi-motion-action 1 3 '(4 EXCEPTION) 5)))
       ((BEGIN handled_sequence_of_statements END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'block-end 5 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-motion-action 1 '(2 EXCEPTION) 3))))
      (body
       ((proper_body ))
       ((body_stub )))
      (body_stub
       ((subprogram_body_stub ))
       ((package_body_stub ))
       ((task_body_stub ))
       ((protected_body_stub )))
      (case_expression
       ((CASE expression IS case_expression_alternative_list )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-middle)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4))))
      (case_expression_alternative
       ((WHEN discrete_choice_list EQUAL_GREATER expression )
        (progn
        (wisi-statement-action 1 'block-middle 3 'statement-other)
        (wisi-containing-action 3 4))))
      (case_expression_alternative_list
       ((case_expression_alternative ))
       ((case_expression_alternative_list COMMA case_expression_alternative )
        (progn
        (wisi-statement-action 2 'list-break)
        (wisi-containing-action 2 3))))
      (case_statement
       ((CASE expression_opt IS case_statement_alternative_list END CASE SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'block-middle 5 'block-end 7 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)
        (wisi-motion-action 1 '(4 WHEN) 5))))
      (case_statement_alternative
       ((WHEN discrete_choice_list EQUAL_GREATER sequence_of_statements_opt )
        (progn
        (wisi-statement-action 1 'block-middle 3 'statement-other)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4))))
      (case_statement_alternative_list
       ((case_statement_alternative ))
       ((case_statement_alternative_list case_statement_alternative )))
      (choice_expression
       ((choice_relation ))
       ((choice_relation_and_list ))
       ((choice_relation_or_list ))
       ((choice_relation_xor_list ))
       ((choice_relation_and_then_list ))
       ((choice_relation_or_else_list )))
      (choice_relation_and_list
       ((choice_relation AND choice_relation ))
       ((choice_relation_and_list AND choice_relation )))
      (choice_relation_or_list
       ((choice_relation OR choice_relation ))
       ((choice_relation_or_list OR choice_relation )))
      (choice_relation_xor_list
       ((choice_relation XOR choice_relation ))
       ((choice_relation_xor_list XOR choice_relation )))
      (choice_relation_and_then_list
       ((choice_relation AND THEN choice_relation ))
       ((choice_relation_and_then_list AND THEN choice_relation )))
      (choice_relation_or_else_list
       ((choice_relation OR ELSE choice_relation ))
       ((choice_relation_or_else_list OR ELSE choice_relation )))
      (choice_relation
       ((simple_expression relational_operator simple_expression ))
       ((simple_expression )))
      (compilation_unit
       ((context_item ))
       ((library_item ))
       ((subunit )))
      (compilation_unit_list
       ((compilation_unit ))
       ((compilation_unit_list compilation_unit )))
      (component_clause
       ((IDENTIFIER AT simple_expression RANGE simple_expression DOT_DOT simple_expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 4 'statement-other 6 'statement-other 8 'statement-end)
        (wisi-containing-action 2 3)
        (wisi-containing-action 4 5)
        (wisi-containing-action 6 7))))
      (component_clause_list
       ((component_clause ))
       ((component_clause_list component_clause )))
      (component_declaration
       ((identifier_list COLON component_definition COLON_EQUAL expression aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 4 'statement-other 7 'statement-end)
        (wisi-containing-action 2 3)
        (wisi-containing-action 4 5)
        (wisi-containing-action 4 6)))
       ((identifier_list COLON component_definition aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 5 'statement-end)
        (wisi-containing-action 2 3)
        (wisi-containing-action 2 4))))
      (component_definition
       ((ALIASED subtype_indication ))
       ((subtype_indication ))
       ((ALIASED access_definition ))
       ((access_definition )))
      (component_item
       ((component_declaration ))
       ((aspect_clause )))
      (component_list
       ((component_item ))
       ((component_list component_item ))
       ((component_list variant_part ))
       ((variant_part ))
       ((NULL SEMICOLON )
        (wisi-statement-action 1 'statement-start 2 'statement-end)))
      (component_list_opt
       (())
       ((component_list )))
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
        (wisi-statement-action 1 'block-start 3 'block-middle 5 'block-end 7 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4))))
      (constant_opt
       (())
       ((CONSTANT )))
      (constraint
       ((RANGE range ))
       ((index_constraint )))
      (constraint_opt
       (())
       ((constraint )))
      (context_item
       ((pragma ))
       ((with_clause ))
       ((use_clause )))
      (declaration
       ((abstract_subprogram_declaration ))
       ((aspect_clause ))
       ((body ))
       ((entry_declaration ))
       ((exception_declaration ))
       ((expression_function_declaration ))
       ((generic_declaration ))
       ((generic_instantiation ))
       ((null_procedure_declaration ))
       ((identifier_list COLON CONSTANT COLON_EQUAL expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 6 'statement-end)
        (wisi-containing-action 1 5)))
       ((object_declaration ))
       ((package_declaration ))
       ((pragma ))
       ((renaming_declaration ))
       ((subprogram_declaration ))
       ((subtype_declaration ))
       ((type_declaration ))
       ((use_clause )))
      (declarations
       ((declaration ))
       ((declarations declaration )))
      (declarative_part_opt
       (())
       ((declarations )))
      (delay_alternative
       ((delay_statement sequence_of_statements_opt )))
      (delay_statement
       ((DELAY UNTIL expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 4 'statement-end)
        (wisi-containing-action 1 3)))
       ((DELAY expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'statement-end)
        (wisi-containing-action 1 2))))
      (derived_type_definition
       ((abstract_limited_opt NEW name and_interface_list_opt WITH record_definition )
        (wisi-statement-action 5 'statement-other))
       ((abstract_limited_opt NEW name constraint_opt )))
      (direct_name
       ((IDENTIFIER ))
       ((STRING_LITERAL )))
      (discrete_choice
       ((choice_expression ))
       ((NOT NULL name ))
       ((range ))
       ((OTHERS )))
      (discrete_choice_list
       (())
       ((discrete_choice ))
       ((discrete_choice_list BAR discrete_choice )))
      (discrete_subtype_definition
       ((subtype_indication ))
       ((range )))
      (discrete_subtype_definition_list
       ((discrete_subtype_definition ))
       ((discrete_subtype_definition_list COMMA discrete_subtype_definition )
        (progn
        (wisi-statement-action 2 'list-break)
        (wisi-containing-action 2 3))))
      (discriminant_part_opt
       (())
       ((LEFT_PAREN BOX RIGHT_PAREN ))
       ((LEFT_PAREN discriminant_specification_list RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'close-paren)
        (wisi-containing-action 1 2))))
      (discriminant_specification_opt
       (())
       ((identifier_list COLON null_exclusion_opt_name COLON_EQUAL expression ))
       ((identifier_list COLON null_exclusion_opt_name ))
       ((identifier_list COLON access_definition COLON_EQUAL expression ))
       ((identifier_list COLON access_definition )))
      (discriminant_specification_list
       ((discriminant_specification_opt ))
       ((discriminant_specification_list SEMICOLON discriminant_specification_opt )
        (progn
        (wisi-statement-action 2 'list-break)
        (wisi-containing-action 2 3))))
      (elsif_expression_item
       ((ELSIF expression THEN expression )
        (progn
        (wisi-statement-action 1 'statement-other 3 'block-middle)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4))))
      (elsif_expression_list
       ((elsif_expression_item ))
       ((elsif_expression_list elsif_expression_item )))
      (elsif_statement_item
       ((ELSIF expression_opt THEN sequence_of_statements_opt )
        (progn
        (wisi-statement-action 1 'statement-other 3 'block-middle)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4))))
      (elsif_statement_list
       ((elsif_statement_item ))
       ((elsif_statement_list elsif_statement_item )))
      (entry_body
       ((ENTRY IDENTIFIER entry_body_formal_part WHEN expression_opt IS declarative_part_opt BEGIN handled_sequence_of_statements END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 4' statement-other 6 'block-middle 8 'block-middle 10 'block-end
        12 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 4 5)
        (wisi-containing-action 6 7)
        (wisi-containing-action 8 9)
        (wisi-motion-action 1 4 6 8 10))))
      (entry_body_formal_part
       ((LEFT_PAREN FOR IDENTIFIER IN discrete_subtype_definition RIGHT_PAREN parameter_profile_opt )
        (progn
        (wisi-statement-action 1 'open-paren 6 'close-paren)
        (wisi-containing-action 1 4)))
       ((parameter_profile_opt )))
      (entry_call_alternative
       ((procedure_call_statement sequence_of_statements_opt ))
       ((name sequence_of_statements_opt )))
      (entry_declaration
       ((overriding_indicator_opt ENTRY IDENTIFIER LEFT_PAREN discrete_subtype_definition RIGHT_PAREN parameter_profile_opt aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'block-middle 4 'open-paren 6 'close-paren 8 'statement-end)
        (wisi-containing-action 2 4)
        (wisi-containing-action 4 5)
        (wisi-containing-action 2 6)
        (wisi-containing-action 2 7)))
       ((overriding_indicator_opt ENTRY IDENTIFIER parameter_profile_opt aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'block-middle 6 'statement-end)
        (wisi-containing-action 2 4)
        (wisi-containing-action 2 5))))
      (enumeration_literal
       ((IDENTIFIER ))
       ((CHARACTER_LITERAL )))
      (enumeration_literal_list
       ((enumeration_literal ))
       ((enumeration_literal_list COMMA enumeration_literal )
        (progn
        (wisi-statement-action 2 'list-break)
        (wisi-containing-action 2 3))))
      (enumeration_representation_clause
       ((FOR name USE aggregate SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'statement-other 5 'statement-end)
        (wisi-containing-action 3 4))))
      (enumeration_type_definition
       ((LEFT_PAREN enumeration_literal_list RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'close-paren)
        (wisi-containing-action 1 2))))
      (exception_choice
       ((name ))
       ((OTHERS )))
      (exception_choice_list
       ((exception_choice ))
       ((exception_choice_list BAR exception_choice )))
      (exception_declaration
       ((identifier_list COLON EXCEPTION SEMICOLON )
        (wisi-statement-action 1 'statement-start 4 'statement-end)))
      (exception_handler
       ((WHEN IDENTIFIER COLON exception_choice_list EQUAL_GREATER sequence_of_statements_opt )
        (progn
        (wisi-statement-action 1 'block-middle 5 'statement-other)
        (wisi-containing-action 1 4)
        (wisi-containing-action 5 6)))
       ((WHEN exception_choice_list EQUAL_GREATER sequence_of_statements_opt )
        (progn
        (wisi-statement-action 1 'block-middle 3 'statement-other)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4))))
      (exception_handler_list
       ((exception_handler ))
       ((exception_handler_list exception_handler )))
      (exception_handler_list_opt
       (())
       ((exception_handler_list )))
      (exit_statement
       ((EXIT identifier_opt WHEN expression_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'statement-other 5 'statement-end)
        (wisi-containing-action 3 4)))
       ((EXIT identifier_opt SEMICOLON )
        (wisi-statement-action 1 'statement-start 3 'statement-end)))
      (expression
       ((relation ))
       ((relation_and_list ))
       ((relation_and_then_list ))
       ((relation_or_list ))
       ((relation_or_else_list ))
       ((relation_xor_list )))
      (expression_opt
       (())
       ((expression )))
      (expression_function_declaration
       ((overriding_indicator_opt function_specification IS paren_expression aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 6 'statement-end)
        (wisi-containing-action 2 4)
        (wisi-containing-action 2 5))))
      (extended_return_object_declaration
       ((IDENTIFIER COLON aliased_opt constant_opt return_subtype_indication COLON_EQUAL expression ))
       ((IDENTIFIER COLON aliased_opt constant_opt return_subtype_indication )))
      (extended_return_object_declaration_opt
       (())
       ((extended_return_object_declaration )))
      (extended_return_statement
       ((RETURN extended_return_object_declaration_opt DO handled_sequence_of_statements END RETURN SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'block-middle 5 'block-end 7 'statement-end)
        (wisi-containing-action 3 4)))
       ((RETURN extended_return_object_declaration SEMICOLON )
        (wisi-statement-action 1 'statement-start 3 'statement-end)))
      (factor
       ((primary STAR_STAR primary ))
       ((primary ))
       ((ABS primary ))
       ((NOT primary )))
      (formal_object_declaration
       ((identifier_list COLON mode_opt null_exclusion_opt name COLON_EQUAL expression aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 6 'statement-other 9 'statement-end)
        (wisi-containing-action 6 7)
        (wisi-containing-action 6 8)))
       ((identifier_list COLON mode_opt null_exclusion_opt name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 7 'statement-end)
        (wisi-containing-action 5 6)))
       ((identifier_list COLON mode_opt access_definition COLON_EQUAL expression aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 5 'statement-other 8 'statement-end)
        (wisi-containing-action 5 6)
        (wisi-containing-action 5 7)))
       ((identifier_list COLON mode_opt access_definition aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 6 'statement-end)
        (wisi-containing-action 4 5))))
      (formal_part
       ((LEFT_PAREN parameter_specification_list RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'close-paren)
        (wisi-containing-action 1 2))))
      (formal_subprogram_declaration
       ((WITH subprogram_specification IS subprogram_default aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 6 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 5)))
       ((WITH subprogram_specification aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 4 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 2 3)))
       ((WITH subprogram_specification IS ABSTRACT subprogram_default aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 7 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 6)))
       ((WITH subprogram_specification IS ABSTRACT aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 6 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 5))))
      (formal_type_declaration
       ((TYPE IDENTIFIER discriminant_part_opt IS formal_type_definition aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 4 'statement-other 7 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 4 5)
        (wisi-containing-action 4 6)))
       ((TYPE IDENTIFIER discriminant_part_opt IS TAGGED aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 7 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 4 6)))
       ((TYPE IDENTIFIER discriminant_part_opt aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 5 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 2 6))))
      (formal_type_definition
       ((abstract_tagged_limited_opt PRIVATE ))
       ((formal_derived_type_definition ))
       ((LEFT_PAREN BOX RIGHT_PAREN ))
       ((RANGE BOX ))
       ((MOD BOX ))
       ((DIGITS BOX ))
       ((DELTA BOX ))
       ((DELTA BOX DIGITS BOX ))
       ((array_type_definition ))
       ((access_definition ))
       ((interface_type_definition )))
      (formal_derived_type_definition
       ((abstract_limited_synchronized_opt NEW name AND interface_list WITH PRIVATE ))
       ((abstract_limited_synchronized_opt NEW name WITH PRIVATE ))
       ((abstract_limited_synchronized_opt NEW name AND interface_list ))
       ((abstract_limited_synchronized_opt NEW name )))
      (formal_package_declaration
       ((WITH PACKAGE name IS NEW name formal_package_actual_part aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 5 'statement-other 6 'name 7 'statement-other 8 'statement-other 9 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 5 6)
        (wisi-containing-action 6 7)
        (wisi-containing-action 6 8))))
      (formal_package_actual_part
       ((LEFT_PAREN BOX RIGHT_PAREN ))
       (()))
      (full_type_declaration
       ((TYPE IDENTIFIER discriminant_part_opt IS type_definition aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'name 4 'statement-other 7 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 4 5)
        (wisi-containing-action 4 6)))
       ((task_type_declaration ))
       ((protected_type_declaration )))
      (function_specification
       ((FUNCTION name parameter_and_result_profile )
        (progn
        (wisi-statement-action 1 'statement-other 2 'name)
        (wisi-containing-action 1 2)
        (wisi-containing-action 1 3)
        (wisi-motion-action 1 '(3 RETURN)))))
      (general_access_modifier_opt
       (())
       ((ALL ))
       ((CONSTANT )))
      (generic_declaration
       ((generic_subprogram_declaration ))
       ((generic_package_declaration )))
      (generic_formal_part
       ((GENERIC generic_formal_parameter_declarations )
        (progn
        (wisi-statement-action 1 'block-start)
        (wisi-containing-action 1 2)))
       ((GENERIC )
        (wisi-statement-action 1 'block-start)))
      (generic_formal_parameter_declarations
       ((generic_formal_parameter_declaration ))
       ((generic_formal_parameter_declarations generic_formal_parameter_declaration )))
      (generic_formal_parameter_declaration
       ((formal_object_declaration ))
       ((formal_type_declaration ))
       ((formal_subprogram_declaration ))
       ((formal_package_declaration ))
       ((pragma )))
      (generic_instantiation
       ((PACKAGE name IS NEW name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'name 4 'statement-other 7 'statement-end)
        (wisi-containing-action 4 5)
        (wisi-containing-action 5 6)))
       ((overriding_indicator_opt PROCEDURE name IS NEW name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'block-middle 3 'name 5 'statement-other 8 'statement-end)
        (wisi-containing-action 5 6)
        (wisi-containing-action 6 7)))
       ((overriding_indicator_opt FUNCTION name IS NEW name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'block-middle 3 'name 5 'statement-other 8 'statement-end)
        (wisi-containing-action 5 6)
        (wisi-containing-action 6 7))))
      (generic_package_declaration
       ((generic_formal_part package_specification SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 2 'block-middle 3 'statement-end)
        (wisi-motion-action 1 2 3))))
      (generic_renaming_declaration
       ((GENERIC PACKAGE name RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 3 'name 4 'statement-other 7 'statement-end)
        (wisi-containing-action 2 3)
        (wisi-containing-action 3 6)))
       ((GENERIC PROCEDURE name RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 3 'name 4 'statement-other 7 'statement-end)
        (wisi-containing-action 2 3)
        (wisi-containing-action 3 6)))
       ((GENERIC FUNCTION name RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 3 'name 4 'statement-other 7 'statement-end)
        (wisi-containing-action 2 3)
        (wisi-containing-action 3 6))))
      (generic_subprogram_declaration
       ((generic_formal_part subprogram_specification aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 2 'block-middle 4 'statement-end)
        (wisi-containing-action 2 3)
        (wisi-motion-action 1 2))))
      (handled_sequence_of_statements
       ((sequence_of_statements_opt EXCEPTION exception_handler_list_opt )
        (progn
        (wisi-statement-action 2 'block-middle)
        (wisi-containing-action 2 3)
        (wisi-motion-action 2 '(3 WHEN))))
       ((sequence_of_statements_opt )))
      (identifier_list
       ((IDENTIFIER ))
       ((identifier_list COMMA IDENTIFIER )))
      (identifier_opt
       (())
       ((IDENTIFIER )))
      (if_expression
       ((IF expression THEN expression elsif_expression_list ELSE expression )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-middle 6 'block-middle)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)
        (wisi-containing-action 3 5)
        (wisi-containing-action 6 7)
        (wisi-motion-action 1 3 '(5 (ELSIF THEN)) 6)))
       ((IF expression THEN expression elsif_expression_list )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-middle)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)
        (wisi-containing-action 3 5)
        (wisi-motion-action 1 3 '(5 (ELSIF THEN)))))
       ((IF expression THEN expression ELSE expression )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-middle 5 'block-middle)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)
        (wisi-containing-action 5 6)
        (wisi-motion-action 1 3 5)))
       ((IF expression THEN expression )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-middle)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)
        (wisi-motion-action 1 3))))
      (if_statement
       ((IF expression_opt THEN sequence_of_statements_opt elsif_statement_list ELSE sequence_of_statements_opt END IF SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-middle 6 'block-middle 8 'block-end 10 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)
        (wisi-containing-action 3 5)
        (wisi-containing-action 6 7)
        (wisi-motion-action 1 3 '(5 (ELSIF THEN)) 6 8)))
       ((IF expression_opt THEN sequence_of_statements_opt elsif_statement_list END IF SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-middle 6 'block-end 9 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)
        (wisi-containing-action 3 5)
        (wisi-motion-action 1 3 '(5 (ELSIF THEN)) 6)))
       ((IF expression_opt THEN sequence_of_statements_opt ELSE sequence_of_statements_opt END IF SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-middle 5 'block-middle 7 'block-end 9 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)
        (wisi-containing-action 5 6)
        (wisi-motion-action 1 3 5 7)))
       ((IF expression_opt THEN sequence_of_statements_opt END IF SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-middle 5 'block-end 7 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)
        (wisi-motion-action 1 3 5))))
      (incomplete_type_declaration
       ((TYPE IDENTIFIER discriminant_part_opt IS TAGGED SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'name 6 'statement-end)
        (wisi-containing-action 1 3)))
       ((TYPE IDENTIFIER SEMICOLON )
        (wisi-statement-action 1 'statement-start 2 'name 3 'statement-end)))
      (index_constraint
       ((LEFT_PAREN discrete_subtype_definition_list RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'close-paren)
        (wisi-containing-action 1 2))))
      (index_subtype_definition
       ((name RANGE BOX )))
      (index_subtype_definition_list
       ((index_subtype_definition ))
       ((index_subtype_definition_list COMMA index_subtype_definition )
        (progn
        (wisi-statement-action 2 'list-break)
        (wisi-containing-action 2 3))))
      (interface_list
       ((name ))
       ((interface_list AND name )))
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
        (progn
        (wisi-statement-action 1 'statement-start)
        (wisi-containing-action 1 2)))
       ((FOR iterator_specification_opt )
        (progn
        (wisi-statement-action 1 'statement-start)
        (wisi-containing-action 1 2))))
      (iterator_specification
       ((IDENTIFIER IN REVERSE discrete_subtype_definition ))
       ((IDENTIFIER IN discrete_subtype_definition ))
       ((IDENTIFIER COLON subtype_indication OF REVERSE name ))
       ((IDENTIFIER COLON subtype_indication OF name ))
       ((IDENTIFIER OF REVERSE name ))
       ((IDENTIFIER OF name )))
      (iterator_specification_opt
       (())
       ((iterator_specification )))
      (label_opt
       (())
       ((LESS_LESS IDENTIFIER GREATER_GREATER ))
       ((IDENTIFIER COLON )))
      (library_item
       ((PRIVATE library_unit_declaration ))
       ((library_unit_declaration ))
       ((subprogram_body ))
       ((package_body ))
       ((library_unit_renaming_declaration )))
      (library_unit_declaration
       ((subprogram_declaration ))
       ((package_declaration ))
       ((generic_declaration ))
       ((generic_instantiation )))
      (library_unit_renaming_declaration
       ((package_renaming_declaration ))
       ((generic_renaming_declaration ))
       ((subprogram_renaming_declaration )))
      (loop_statement
       ((iteration_scheme LOOP sequence_of_statements_opt END LOOP identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'block-middle 4 'block-end 7 'statement-end)
        (wisi-containing-action 2 3)
        (wisi-motion-action 1 2 4)))
       ((LOOP sequence_of_statements_opt END LOOP identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'block-end 6 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-motion-action 1 3))))
      (membership_choice_list
       ((membership_choice ))
       ((membership_choice_list BAR membership_choice )))
      (membership_choice
       ((simple_expression ))
       ((range )))
      (mod_clause_opt
       (())
       ((AT MOD expression SEMICOLON )))
      (mode_opt
       (())
       ((IN ))
       ((IN OUT ))
       ((OUT )))
      (multiplying_operator
       ((STAR ))
       ((SLASH ))
       ((MOD ))
       ((REM )))
      (name_list
       ((name ))
       ((name_list COMMA name )
        (progn
        (wisi-statement-action 2 'statement-other)
        (wisi-containing-action 2 3))))
      (name
       ((IDENTIFIER ))
       ((CHARACTER_LITERAL ))
       ((name LEFT_PAREN range RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'name-paren 2 'open-paren 4 'close-paren)
        (wisi-containing-action 1 2)
        (wisi-containing-action 2 3)))
       ((selected_component ))
       ((attribute_reference ))
       ((name actual_parameter_part )
        (progn
        (wisi-statement-action 1 'name-paren)
        (wisi-containing-action 1 2)))
       ((qualified_expression ))
       ((STRING_LITERAL )))
      (name_opt
       (())
       ((name )))
      (null_exclusion_opt
       (())
       ((NOT NULL )))
      (null_exclusion_opt_name
       ((IDENTIFIER ))
       ((selected_component ))
       ((NOT NULL IDENTIFIER ))
       ((NOT NULL selected_component )))
      (null_procedure_declaration
       ((overriding_indicator_opt procedure_specification IS NULL aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 3 'name 6 'statement-end)
        (wisi-containing-action 2 5))))
      (object_declaration
       ((identifier_list COLON aliased_opt constant_opt subtype_indication COLON_EQUAL expression aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 6 'statement-other 9 'statement-end)
        (wisi-containing-action 2 5)
        (wisi-containing-action 6 7)
        (wisi-containing-action 1 8)))
       ((identifier_list COLON aliased_opt constant_opt subtype_indication aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 7 'statement-end)
        (wisi-containing-action 2 5)
        (wisi-containing-action 1 6)))
       ((identifier_list COLON aliased_opt constant_opt access_definition COLON_EQUAL expression aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 6 'statement-other 9 'statement-end)
        (wisi-containing-action 2 5)
        (wisi-containing-action 6 7)
        (wisi-containing-action 1 8)))
       ((identifier_list COLON aliased_opt constant_opt access_definition aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 7 'statement-end)
        (wisi-containing-action 2 5)
        (wisi-containing-action 1 6)))
       ((identifier_list COLON aliased_opt constant_opt array_type_definition COLON_EQUAL expression aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 6 'statement-other 9 'statement-end)
        (wisi-containing-action 2 5)
        (wisi-containing-action 6 7)
        (wisi-containing-action 1 8)))
       ((identifier_list COLON aliased_opt constant_opt array_type_definition aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 7 'statement-end)
        (wisi-containing-action 2 5)
        (wisi-containing-action 1 6)))
       ((single_task_declaration ))
       ((single_protected_declaration )))
      (object_renaming_declaration
       ((IDENTIFIER COLON null_exclusion_opt name RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 4 'name 5 'statement-other 6 'name 8 'statement-end)
        (wisi-containing-action 1 4)
        (wisi-containing-action 1 6)
        (wisi-containing-action 1 7)))
       ((IDENTIFIER COLON access_definition RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 4 'statement-other 5 'name 7 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 1 5)
        (wisi-containing-action 1 6)))
       ((IDENTIFIER COLON EXCEPTION RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 4 'statement-other 5 'name 7 'statement-end)
        (wisi-containing-action 1 5)
        (wisi-containing-action 1 6))))
      (overriding_indicator_opt
       ((NOT OVERRIDING )
        (wisi-statement-action 1 'statement-start 2 'statement-other))
       ((OVERRIDING )
        (wisi-statement-action 1 'statement-start))
       (()))
      (package_body
       ((PACKAGE BODY name aspect_specification_opt IS declarative_part_opt BEGIN handled_sequence_of_statements END name_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'name 5 'block-middle 7 'block-middle
        9 'block-end 11 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 3 4)
        (wisi-containing-action 5 6)
        (wisi-containing-action 7 8)))
       ((PACKAGE BODY name aspect_specification_opt IS declarative_part_opt END name_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'name 5 'block-middle 7 'block-end 9 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 3 4)
        (wisi-containing-action 5 6))))
      (package_body_stub
       ((PACKAGE BODY name IS SEPARATE aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 7 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 3 6))))
      (package_declaration
       ((package_specification SEMICOLON )
        (wisi-statement-action 1 'statement-start 2 'statement-end)))
      (package_renaming_declaration
       ((PACKAGE name RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'name 3 'statement-other 6 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 5))))
      (package_specification
       ((PACKAGE name aspect_specification_opt IS declarative_part_opt PRIVATE declarative_part_opt END name_opt )
        (progn
        (wisi-statement-action 1 'statement-start 2 'name 4 'block-start 6 'block-middle 8 'block-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 2 3)
        (wisi-containing-action 4 5)
        (wisi-containing-action 6 7)
        (wisi-motion-action 1 4 6 8)))
       ((PACKAGE name aspect_specification_opt IS declarative_part_opt END name )
        (progn
        (wisi-statement-action 1 'statement-start 2 'name 4 'block-start 6 'block-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 2 3)
        (wisi-containing-action 4 5)
        (wisi-motion-action 1 4 6))))
      (parameter_and_result_profile
       ((formal_part RETURN null_exclusion_opt name_opt )
        (progn
        (wisi-statement-action
        2 'return-1
        4 'type)
        (wisi-containing-action 2 4)))
       ((RETURN name_opt )
        (wisi-statement-action 1 'return-2 2 'type))
       ((formal_part RETURN access_definition )
        (progn
        (wisi-statement-action 2 'return-1)
        (wisi-containing-action 2 3)))
       ((RETURN access_definition )
        (progn
        (wisi-statement-action 1 'return-2)
        (wisi-containing-action 1 2))))
      (parameter_profile_opt
       (())
       ((formal_part )))
      (parameter_specification
       ((identifier_list COLON aliased_opt mode_opt null_exclusion_opt name COLON_EQUAL expression ))
       ((identifier_list COLON aliased_opt mode_opt null_exclusion_opt name ))
       ((identifier_list COLON access_definition COLON_EQUAL expression ))
       ((identifier_list COLON access_definition )))
      (parameter_specification_list
       ((parameter_specification ))
       ((parameter_specification_list SEMICOLON parameter_specification )
        (progn
        (wisi-statement-action 2 'list-break)
        (wisi-containing-action 2 3))))
      (paren_expression
       ((LEFT_PAREN expression RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'close-paren)
        (wisi-containing-action 1 2)))
       ((LEFT_PAREN case_expression RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'close-paren)
        (wisi-containing-action 1 2)))
       ((LEFT_PAREN if_expression RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'close-paren)
        (wisi-containing-action 1 2))))
      (pragma
       ((PRAGMA IDENTIFIER LEFT_PAREN pragma_argument_association_list RIGHT_PAREN SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'open-paren 5 'close-paren 6 'statement-end)
        (wisi-containing-action 3 4)))
       ((PRAGMA IDENTIFIER SEMICOLON )
        (wisi-statement-action 1 'statement-start 3 'statement-end)))
      (pragma_argument_association
       ((IDENTIFIER EQUAL_GREATER expression ))
       ((expression ))
       ((IDENTIFIER TICK IDENTIFIER EQUAL_GREATER expression )))
      (pragma_argument_association_list
       ((pragma_argument_association ))
       ((pragma_argument_association_list COMMA pragma_argument_association )))
      (primary
       ((NULL ))
       ((aggregate ))
       ((name ))
       ((NEW name ))
       ((LEFT_PAREN if_expression RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'close-paren)
        (wisi-containing-action 1 2)))
       ((LEFT_PAREN case_expression RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'close-paren)
        (wisi-containing-action 1 2)))
       ((LEFT_PAREN quantified_expression RIGHT_PAREN )
        (progn
        (wisi-statement-action 1 'open-paren 3 'close-paren)
        (wisi-containing-action 1 2))))
      (private_extension_declaration
       ((TYPE IDENTIFIER discriminant_part_opt IS abstract_limited_synchronized_opt NEW subtype_indication and_interface_list_opt WITH PRIVATE aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'name 6 'statement-other 12 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 6 7)
        (wisi-containing-action 6 8)
        (wisi-containing-action 2 11))))
      (private_type_declaration
       ((TYPE IDENTIFIER discriminant_part_opt IS abstract_tagged_limited_opt PRIVATE aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'name 8 'statement-end)
        (wisi-containing-action 1 7))))
      (procedure_call_statement
       ((name SEMICOLON )
        (wisi-statement-action 1 'statement-start 2 'statement-end)))
      (procedure_specification
       ((PROCEDURE name parameter_profile_opt )
        (progn
        (wisi-statement-action 1 'statement-other 2 'name)
        (wisi-containing-action 1 2)
        (wisi-containing-action 1 3))))
      (proper_body
       ((subprogram_body ))
       ((package_body ))
       ((task_body ))
       ((protected_body )))
      (protected_body
       ((PROTECTED BODY IDENTIFIER aspect_specification_opt IS protected_operation_item_list_opt END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'name 5 'block-middle 7 'block-end 9 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 1 4)
        (wisi-containing-action 5 6)
        (wisi-motion-action 1 5 7))))
      (protected_body_stub
       ((PROTECTED BODY IDENTIFIER IS SEPARATE aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 7 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 3 6))))
      (protected_definition
       ((declarative_part_opt PRIVATE declarative_part_opt END identifier_opt )
        (progn
        (wisi-statement-action 2 'block-middle 4 'block-end)
        (wisi-containing-action 2 3)))
       ((declarative_part_opt END identifier_opt )
        (wisi-statement-action 2 'block-end)))
      (protected_operation_item
       ((subprogram_declaration ))
       ((subprogram_body ))
       ((entry_body ))
       ((aspect_clause )))
      (protected_operation_item_list
       ((protected_operation_item ))
       ((protected_operation_item_list protected_operation_item )))
      (protected_operation_item_list_opt
       (())
       ((protected_operation_item_list )))
      (protected_opt
       (())
       ((PROTECTED )))
      (protected_type_declaration
       ((PROTECTED TYPE IDENTIFIER discriminant_part_opt aspect_specification_opt IS NEW interface_list WITH protected_definition SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'name 6 'block-start 11 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 3 5)
        (wisi-containing-action 9 10)))
       ((PROTECTED TYPE IDENTIFIER discriminant_part_opt aspect_specification_opt IS protected_definition SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'name 6 'block-start 8 'statement-end)
        (wisi-containing-action 1 3)
        (wisi-containing-action 3 5)
        (wisi-containing-action 6 7))))
      (qualified_expression
       ((name TICK aggregate )
        (progn
        (wisi-statement-action 1 'statement-other)
        (wisi-containing-action 1 3))))
      (quantified_expression
       ((FOR quantifier iterator_specification EQUAL_GREATER expression )
        (progn
        (wisi-statement-action 4 'statement-other)
        (wisi-containing-action 4 5))))
      (quantifier
       ((ALL ))
       ((SOME )))
      (raise_statement
       ((RAISE SEMICOLON )
        (wisi-statement-action 1 'statement-start 2 'statement-end))
       ((RAISE name WITH expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'statement-other 5 'statement-end)
        (wisi-containing-action 3 4)))
       ((RAISE name SEMICOLON )
        (wisi-statement-action 1 'statement-start 3 'statement-end)))
      (range
       ((name TICK RANGE LEFT_PAREN expression RIGHT_PAREN )
        (progn
        (wisi-statement-action 4 'open-paren 6 'close-paren)
        (wisi-containing-action 4 5)))
       ((name TICK RANGE ))
       ((simple_expression DOT_DOT simple_expression )))
      (real_range_specification_opt
       (())
       ((RANGE simple_expression DOT_DOT simple_expression )))
      (record_definition
       ((RECORD component_list_opt END RECORD )
        (progn
        (wisi-statement-action 1 'block-start 3 'block-end)
        (wisi-containing-action 1 2)))
       ((NULL RECORD )))
      (record_representation_clause
       ((FOR name USE record_rep SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'statement-other 5 'statement-end)
        (wisi-containing-action 3 4))))
      (record_rep
       ((RECORD mod_clause_opt component_clause_list END RECORD )
        (progn
        (wisi-statement-action 1 'block-start 4 'block-end)
        (wisi-containing-action 1 3))))
      (record_type_definition
       ((abstract_tagged_limited_opt record_definition )))
      (relation_and_list
       ((relation AND relation ))
       ((relation_and_list AND relation )))
      (relation_and_then_list
       ((relation AND THEN relation ))
       ((relation_and_then_list AND THEN relation )))
      (relation_or_list
       ((relation OR relation ))
       ((relation_or_list OR relation )))
      (relation_or_else_list
       ((relation OR ELSE relation ))
       ((relation_or_else_list OR ELSE relation )))
      (relation_xor_list
       ((relation XOR relation ))
       ((relation_xor_list XOR relation )))
      (relation
       ((simple_expression ))
       ((simple_expression relational_operator simple_expression ))
       ((simple_expression NOT IN membership_choice_list ))
       ((simple_expression IN membership_choice_list )))
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
        (progn
        (wisi-statement-action 1 'statement-start 2 'name 5 'statement-end)
        (wisi-containing-action 1 2)))
       ((REQUEUE name SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'name 5 'statement-end)
        (wisi-containing-action 1 2))))
      (return_subtype_indication
       ((subtype_indication ))
       ((access_definition )))
      (selected_component
       ((name DOT IDENTIFIER ))
       ((name DOT CHARACTER_LITERAL ))
       ((name DOT STRING_LITERAL ))
       ((name DOT ALL )))
      (selective_accept
       ((SELECT select_alternative_list_opt ELSE sequence_of_statements_opt END SELECT SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'block-middle 5 'block-end 7 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)
        (wisi-motion-action 1 '(2 OR) 3 5)))
       ((SELECT select_alternative_list_opt END SELECT SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'block-end 5 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-motion-action 1 '(2 OR) 3))))
      (select_alternative
       ((WHEN expression EQUAL_GREATER accept_statement sequence_of_statements_opt )
        (progn
        (wisi-statement-action 1 'block-start 3 'statement-other)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)
        (wisi-containing-action 3 5)))
       ((accept_statement sequence_of_statements_opt ))
       ((WHEN expression EQUAL_GREATER delay_alternative )
        (progn
        (wisi-statement-action 1 'block-start 3 'statement-other)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4)))
       ((delay_alternative ))
       ((WHEN expression EQUAL_GREATER TERMINATE SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'statement-other 4 'statement-start 5 'statement-end)
        (wisi-containing-action 1 2)))
       ((TERMINATE SEMICOLON )
        (wisi-statement-action 1 'statement-start 2 'statement-end)))
      (select_alternative_list
       ((select_alternative ))
       ((select_alternative_list OR select_alternative )
        (wisi-statement-action 2 'block-middle)))
      (select_alternative_list_opt
       (())
       ((select_alternative_list )))
      (select_statement
       ((selective_accept ))
       ((timed_entry_call ))
       ((conditional_entry_call ))
       ((asynchronous_select )))
      (sequence_of_statements
       ((statement ))
       ((sequence_of_statements statement )))
      (sequence_of_statements_opt
       (())
       ((sequence_of_statements )))
      (simple_expression
       ((unary_adding_operator term_list ))
       ((term_list )))
      (simple_return_statement
       ((RETURN SEMICOLON )
        (wisi-statement-action 1 'statement-start 2 'statement-end))
       ((RETURN expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'statement-end)
        (wisi-containing-action 1 2))))
      (simple_statement
       ((NULL SEMICOLON )
        (wisi-statement-action 1 'statement-start 2 'statement-end))
       ((assignment_statement ))
       ((exit_statement ))
       ((GOTO IDENTIFIER SEMICOLON )
        (wisi-statement-action 1 'statement-start 3 'statement-end))
       ((procedure_call_statement ))
       ((simple_return_statement ))
       ((requeue_statement ))
       ((delay_statement ))
       ((ABORT name SEMICOLON )
        (wisi-statement-action 1 'statement-start 3 'statement-end))
       ((raise_statement ))
       ((pragma )))
      (single_protected_declaration
       ((PROTECTED IDENTIFIER aspect_specification_opt IS NEW interface_list WITH protected_definition SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 2 'name 7 'block-middle 9 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 2 3)
        (wisi-containing-action 7 8)))
       ((PROTECTED IDENTIFIER aspect_specification_opt IS protected_definition SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 2 'name 4 'block-middle 6 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 2 3)
        (wisi-containing-action 4 5))))
      (single_task_declaration
       ((TASK IDENTIFIER aspect_specification_opt IS NEW interface_list WITH task_definition SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 2 'name 7 'block-middle 9 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 2 3)
        (wisi-containing-action 7 8)))
       ((TASK IDENTIFIER aspect_specification_opt IS task_definition SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 2 'name 4 'block-middle 6 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 2 3)
        (wisi-containing-action 4 5)))
       ((TASK IDENTIFIER aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 4 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 2 3))))
      (statement
       ((label_opt simple_statement )
        (wisi-statement-action 1 'statement-start 2 'statement-other))
       ((label_opt compound_statement )
        (wisi-statement-action 1 'statement-start 2 'statement-other)))
      (subprogram_body
       ((overriding_indicator_opt subprogram_specification aspect_specification_opt IS declarative_part_opt BEGIN handled_sequence_of_statements END name_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'block-middle 4 'block-middle 6 'block-middle 8 'block-end 10 'statement-end)
        (wisi-containing-action 2 3)
        (wisi-containing-action 4 5)
        (wisi-containing-action 6 7)
        (wisi-motion-action 1 2 4 6 8))))
      (subprogram_body_stub
       ((overriding_indicator_opt subprogram_specification IS SEPARATE aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'block-middle 6 'statement-end)
        (wisi-containing-action 2 5))))
      (subprogram_declaration
       ((overriding_indicator_opt subprogram_specification aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'block-middle 4 'statement-end)
        (wisi-containing-action 2 3))))
      (subprogram_default
       ((name ))
       ((BOX ))
       ((NULL )))
      (subprogram_renaming_declaration
       ((overriding_indicator_opt subprogram_specification RENAMES name aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'block-middle 3 'statement-other 6 'statement-end)
        (wisi-containing-action 2 5))))
      (subprogram_specification
       ((procedure_specification ))
       ((function_specification )))
      (subtype_declaration
       ((SUBTYPE IDENTIFIER IS subtype_indication aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'name 3 'statement-other 6 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 2 3)
        (wisi-containing-action 3 4))))
      (subtype_indication
       ((NOT NULL name constraint )
        (progn
        (wisi-statement-action 3 'name)
        (wisi-containing-action 3 4)))
       ((NOT NULL name ))
       ((name constraint )
        (progn
        (wisi-statement-action 1 'name)
        (wisi-containing-action 1 2)))
       ((name )))
      (subunit
       ((SEPARATE LEFT_PAREN name RIGHT_PAREN proper_body )
        (progn
        (wisi-statement-action 2 'open-paren 4 'close-paren)
        (wisi-containing-action 2 3))))
      (task_body
       ((TASK BODY IDENTIFIER aspect_specification_opt IS declarative_part_opt BEGIN handled_sequence_of_statements END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'name 5 'block-start 7 'block-middle 9 'block-end 11 'statement-end)
        (wisi-containing-action 3 4)
        (wisi-containing-action 5 6)
        (wisi-containing-action 7 8)
        (wisi-motion-action 1 5 7 9))))
      (task_body_stub
       ((TASK BODY IDENTIFIER IS SEPARATE aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 7 'statement-end)
        (wisi-containing-action 3 6))))
      (task_definition
       ((declarative_part_opt PRIVATE declarative_part_opt END identifier_opt )
        (progn
        (wisi-statement-action 2 'block-middle 4 'block-end)
        (wisi-containing-action 2 3)))
       ((declarative_part_opt END identifier_opt )
        (wisi-statement-action 2 'block-end)))
      (task_type_declaration
       ((TASK TYPE IDENTIFIER discriminant_part_opt aspect_specification_opt IS NEW interface_list WITH task_definition SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'name 10 'statement-other 11 'statement-end)
        (wisi-containing-action 3 5)
        (wisi-containing-action 9 10)))
       ((TASK TYPE IDENTIFIER discriminant_part_opt aspect_specification_opt IS task_definition SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'name 6 'block-start 8 'statement-end)
        (wisi-containing-action 3 5)
        (wisi-containing-action 6 7)))
       ((TASK TYPE IDENTIFIER discriminant_part_opt aspect_specification_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'name 6 'statement-end)
        (wisi-containing-action 3 5))))
      (term
       ((factor ))
       ((term multiplying_operator factor )))
      (term_list
       ((term ))
       ((term_list binary_adding_operator term )))
      (timed_entry_call
       ((SELECT entry_call_alternative OR delay_alternative END SELECT SEMICOLON )
        (progn
        (wisi-statement-action 1 'block-start 3 'block-middle 5 'block-end 6 'statement-end)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4))))
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
       ((MOD expression ))
       ((DIGITS expression real_range_specification_opt ))
       ((DELTA expression real_range_specification_opt ))
       ((DELTA expression DIGITS expression real_range_specification_opt ))
       ((array_type_definition ))
       ((record_type_definition ))
       ((access_definition ))
       ((derived_type_definition ))
       ((interface_type_definition )))
      (variant_part
       ((CASE direct_name IS variant_list END CASE SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-start 5 'block-end 7 'statement-end)
        (wisi-containing-action 3 4))))
      (variant_list
       ((variant ))
       ((variant_list variant )))
      (variant
       ((WHEN discrete_choice_list EQUAL_GREATER component_list )
        (progn
        (wisi-statement-action 1 'block-middle 3 'statement-other)
        (wisi-containing-action 1 2)
        (wisi-containing-action 3 4))))
      (unary_adding_operator
       ((PLUS ))
       ((MINUS )))
      (use_clause
       ((USE name_list SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'statement-end)
        (wisi-containing-action 1 2)))
       ((USE ALL TYPE name_list SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 5 'statement-end)
        (wisi-containing-action 1 4)))
       ((USE TYPE name_list SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 4 'statement-end)
        (wisi-containing-action 1 3))))
      (with_clause
       ((LIMITED PRIVATE WITH name_list SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'statement-other 5 'statement-end)
        (wisi-containing-action 3 4)))
       ((LIMITED WITH name_list SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 4 'statement-end)
        (wisi-containing-action 2 3)))
       ((PRIVATE WITH name_list SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 2 'statement-other 4 'statement-end)
        (wisi-containing-action 2 3)))
       ((WITH name_list SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'statement-end)
        (wisi-containing-action 1 2)))))
     [((default . error) (SEPARATE .  10) (USE .  11) (LIMITED .  3) (PRIVATE .  8) (WITH .  12) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (PACKAGE .  6) (GENERIC .  2))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (FUNCTION . ( 73 (generic_formal_part . 1))) (PROCEDURE . ( 75 (generic_formal_part . 1))) (PACKAGE . ( 74 (generic_formal_part . 1))) (PRAGMA .  7) (WITH .  77) (TYPE .  76) (IDENTIFIER .  72))
      ((default . error) (WITH .  71) (PRIVATE .  70))
      ((default . error) (OVERRIDING .  69))
      ((default . error) (FUNCTION . (overriding_indicator_opt . 1)) (PROCEDURE . (overriding_indicator_opt . 1)) (ENTRY . (overriding_indicator_opt . 1)))
      ((default . error) (BODY .  67) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  66))
      ((default . error) (WITH .  63) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (PACKAGE .  62) (GENERIC .  61))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (LEFT_PAREN .  59))
      ((default . error) (TYPE .  57) (ALL .  56) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) ($EOI . (compilation_unit_list . 0)) (FUNCTION . (compilation_unit_list . 0)) (GENERIC . (compilation_unit_list . 0)) (LIMITED . (compilation_unit_list . 0)) (NOT . (compilation_unit_list . 0)) (OVERRIDING . (compilation_unit_list . 0)) (PACKAGE . (compilation_unit_list . 0)) (PRAGMA . (compilation_unit_list . 0)) (PRIVATE . (compilation_unit_list . 0)) (PROCEDURE . (compilation_unit_list . 0)) (SEPARATE . (compilation_unit_list . 0)) (USE . (compilation_unit_list . 0)) (WITH . (compilation_unit_list . 0)))
      ((default . error) ($EOI .  46) (SEPARATE .  10) (USE .  11) (LIMITED .  3) (PRIVATE .  8) (WITH .  12) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (PACKAGE .  6) (GENERIC .  2))
      ((default . error) (WITH . (compilation_unit . 0)) (USE . (compilation_unit . 0)) (SEPARATE . (compilation_unit . 0)) (PROCEDURE . (compilation_unit . 0)) (PRIVATE . (compilation_unit . 0)) (PRAGMA . (compilation_unit . 0)) (PACKAGE . (compilation_unit . 0)) (OVERRIDING . (compilation_unit . 0)) (NOT . (compilation_unit . 0)) (LIMITED . (compilation_unit . 0)) (GENERIC . (compilation_unit . 0)) (FUNCTION . (compilation_unit . 0)) ($EOI . (compilation_unit . 0)))
      ((default . error) (RENAMES . (subprogram_specification . 1)) (IS . (subprogram_specification . 1)) (WITH . (subprogram_specification . 1)) (SEMICOLON . (subprogram_specification . 1)))
      ((default . error) (WITH . (library_unit_declaration . 2)) (USE . (library_unit_declaration . 2)) (SEPARATE . (library_unit_declaration . 2)) (PROCEDURE . (library_unit_declaration . 2)) (PRIVATE . (library_unit_declaration . 2)) (PRAGMA . (library_unit_declaration . 2)) (PACKAGE . (library_unit_declaration . 2)) (OVERRIDING . (library_unit_declaration . 2)) (NOT . (library_unit_declaration . 2)) (LIMITED . (library_unit_declaration . 2)) (GENERIC . (library_unit_declaration . 2)) (FUNCTION . (library_unit_declaration . 2)) ($EOI . (library_unit_declaration . 2)))
      ((default . error) (PACKAGE .  43) (FUNCTION .  1) (PROCEDURE .  9))
      ((default . error) (WITH . (library_unit_declaration . 3)) (USE . (library_unit_declaration . 3)) (SEPARATE . (library_unit_declaration . 3)) (PROCEDURE . (library_unit_declaration . 3)) (PRIVATE . (library_unit_declaration . 3)) (PRAGMA . (library_unit_declaration . 3)) (PACKAGE . (library_unit_declaration . 3)) (OVERRIDING . (library_unit_declaration . 3)) (NOT . (library_unit_declaration . 3)) (LIMITED . (library_unit_declaration . 3)) (GENERIC . (library_unit_declaration . 3)) (FUNCTION . (library_unit_declaration . 3)) ($EOI . (library_unit_declaration . 3)))
      ((default . error) ($EOI . (generic_declaration . 1)) (LIMITED . (generic_declaration . 1)) (SEPARATE . (generic_declaration . 1)) (WITH . (generic_declaration . 1)) (PRIVATE . (generic_declaration . 1)) (END . (generic_declaration . 1)) (BEGIN . (generic_declaration . 1)) (IDENTIFIER . (generic_declaration . 1)) (ENTRY . (generic_declaration . 1)) (FOR . (generic_declaration . 1)) (FUNCTION . (generic_declaration . 1)) (GENERIC . (generic_declaration . 1)) (NOT . (generic_declaration . 1)) (OVERRIDING . (generic_declaration . 1)) (PACKAGE . (generic_declaration . 1)) (PRAGMA . (generic_declaration . 1)) (PROCEDURE . (generic_declaration . 1)) (PROTECTED . (generic_declaration . 1)) (SUBTYPE . (generic_declaration . 1)) (TASK . (generic_declaration . 1)) (TYPE . (generic_declaration . 1)) (USE . (generic_declaration . 1)))
      ((default . error) (WITH . (library_unit_renaming_declaration . 1)) (USE . (library_unit_renaming_declaration . 1)) (SEPARATE . (library_unit_renaming_declaration . 1)) (PROCEDURE . (library_unit_renaming_declaration . 1)) (PRIVATE . (library_unit_renaming_declaration . 1)) (PRAGMA . (library_unit_renaming_declaration . 1)) (PACKAGE . (library_unit_renaming_declaration . 1)) (OVERRIDING . (library_unit_renaming_declaration . 1)) (NOT . (library_unit_renaming_declaration . 1)) (LIMITED . (library_unit_renaming_declaration . 1)) (GENERIC . (library_unit_renaming_declaration . 1)) (FUNCTION . (library_unit_renaming_declaration . 1)) ($EOI . (library_unit_renaming_declaration . 1)))
      ((default . error) ($EOI . (generic_declaration . 0)) (LIMITED . (generic_declaration . 0)) (SEPARATE . (generic_declaration . 0)) (WITH . (generic_declaration . 0)) (PRIVATE . (generic_declaration . 0)) (END . (generic_declaration . 0)) (BEGIN . (generic_declaration . 0)) (IDENTIFIER . (generic_declaration . 0)) (ENTRY . (generic_declaration . 0)) (FOR . (generic_declaration . 0)) (FUNCTION . (generic_declaration . 0)) (GENERIC . (generic_declaration . 0)) (NOT . (generic_declaration . 0)) (OVERRIDING . (generic_declaration . 0)) (PACKAGE . (generic_declaration . 0)) (PRAGMA . (generic_declaration . 0)) (PROCEDURE . (generic_declaration . 0)) (PROTECTED . (generic_declaration . 0)) (SUBTYPE . (generic_declaration . 0)) (TASK . (generic_declaration . 0)) (TYPE . (generic_declaration . 0)) (USE . (generic_declaration . 0)))
      ((default . error) (WITH . (compilation_unit . 1)) (USE . (compilation_unit . 1)) (SEPARATE . (compilation_unit . 1)) (PROCEDURE . (compilation_unit . 1)) (PRIVATE . (compilation_unit . 1)) (PRAGMA . (compilation_unit . 1)) (PACKAGE . (compilation_unit . 1)) (OVERRIDING . (compilation_unit . 1)) (NOT . (compilation_unit . 1)) (LIMITED . (compilation_unit . 1)) (GENERIC . (compilation_unit . 1)) (FUNCTION . (compilation_unit . 1)) ($EOI . (compilation_unit . 1)))
      ((default . error) ($EOI . (library_item . 1)) (FUNCTION . (library_item . 1)) (GENERIC . (library_item . 1)) (LIMITED . (library_item . 1)) (NOT . (library_item . 1)) (OVERRIDING . (library_item . 1)) (PACKAGE . (library_item . 1)) (PRAGMA . (library_item . 1)) (PRIVATE . (library_item . 1)) (PROCEDURE . (library_item . 1)) (SEPARATE . (library_item . 1)) (USE . (library_item . 1)) (WITH . (library_item . 1)))
      ((default . error) ($EOI . (library_item . 4)) (FUNCTION . (library_item . 4)) (GENERIC . (library_item . 4)) (LIMITED . (library_item . 4)) (NOT . (library_item . 4)) (OVERRIDING . (library_item . 4)) (PACKAGE . (library_item . 4)) (PRAGMA . (library_item . 4)) (PRIVATE . (library_item . 4)) (PROCEDURE . (library_item . 4)) (SEPARATE . (library_item . 4)) (USE . (library_item . 4)) (WITH . (library_item . 4)))
      ((default . error) (FUNCTION .  40) (PROCEDURE .  41))
      ((default . error) ($EOI . (library_item . 3)) (FUNCTION . (library_item . 3)) (GENERIC . (library_item . 3)) (LIMITED . (library_item . 3)) (NOT . (library_item . 3)) (OVERRIDING . (library_item . 3)) (PACKAGE . (library_item . 3)) (PRAGMA . (library_item . 3)) (PRIVATE . (library_item . 3)) (PROCEDURE . (library_item . 3)) (SEPARATE . (library_item . 3)) (USE . (library_item . 3)) (WITH . (library_item . 3)))
      ((default . error) (WITH . (library_unit_declaration . 1)) (USE . (library_unit_declaration . 1)) (SEPARATE . (library_unit_declaration . 1)) (PROCEDURE . (library_unit_declaration . 1)) (PRIVATE . (library_unit_declaration . 1)) (PRAGMA . (library_unit_declaration . 1)) (PACKAGE . (library_unit_declaration . 1)) (OVERRIDING . (library_unit_declaration . 1)) (NOT . (library_unit_declaration . 1)) (LIMITED . (library_unit_declaration . 1)) (GENERIC . (library_unit_declaration . 1)) (FUNCTION . (library_unit_declaration . 1)) ($EOI . (library_unit_declaration . 1)))
      ((default . error) (WITH . (library_unit_renaming_declaration . 0)) (USE . (library_unit_renaming_declaration . 0)) (SEPARATE . (library_unit_renaming_declaration . 0)) (PROCEDURE . (library_unit_renaming_declaration . 0)) (PRIVATE . (library_unit_renaming_declaration . 0)) (PRAGMA . (library_unit_renaming_declaration . 0)) (PACKAGE . (library_unit_renaming_declaration . 0)) (OVERRIDING . (library_unit_renaming_declaration . 0)) (NOT . (library_unit_renaming_declaration . 0)) (LIMITED . (library_unit_renaming_declaration . 0)) (GENERIC . (library_unit_renaming_declaration . 0)) (FUNCTION . (library_unit_renaming_declaration . 0)) ($EOI . (library_unit_renaming_declaration . 0)))
      ((default . error) (SEMICOLON .  39))
      ((default . error) ($EOI . (context_item . 0)) (FUNCTION . (context_item . 0)) (GENERIC . (context_item . 0)) (LIMITED . (context_item . 0)) (NOT . (context_item . 0)) (OVERRIDING . (context_item . 0)) (PACKAGE . (context_item . 0)) (PRAGMA . (context_item . 0)) (PRIVATE . (context_item . 0)) (PROCEDURE . (context_item . 0)) (SEPARATE . (context_item . 0)) (USE . (context_item . 0)) (WITH . (context_item . 0)))
      ((default . error) (RENAMES . (subprogram_specification . 0)) (IS . (subprogram_specification . 0)) (WITH . (subprogram_specification . 0)) (SEMICOLON . (subprogram_specification . 0)))
      ((default . error) ($EOI . (library_item . 2)) (FUNCTION . (library_item . 2)) (GENERIC . (library_item . 2)) (LIMITED . (library_item . 2)) (NOT . (library_item . 2)) (OVERRIDING . (library_item . 2)) (PACKAGE . (library_item . 2)) (PRAGMA . (library_item . 2)) (PRIVATE . (library_item . 2)) (PROCEDURE . (library_item . 2)) (SEPARATE . (library_item . 2)) (USE . (library_item . 2)) (WITH . (library_item . 2)))
      ((default . error) (WITH . (library_unit_declaration . 0)) (USE . (library_unit_declaration . 0)) (SEPARATE . (library_unit_declaration . 0)) (PROCEDURE . (library_unit_declaration . 0)) (PRIVATE . (library_unit_declaration . 0)) (PRAGMA . (library_unit_declaration . 0)) (PACKAGE . (library_unit_declaration . 0)) (OVERRIDING . (library_unit_declaration . 0)) (NOT . (library_unit_declaration . 0)) (LIMITED . (library_unit_declaration . 0)) (GENERIC . (library_unit_declaration . 0)) (FUNCTION . (library_unit_declaration . 0)) ($EOI . (library_unit_declaration . 0)))
      ((default . error) (WITH . (library_unit_renaming_declaration . 2)) (USE . (library_unit_renaming_declaration . 2)) (SEPARATE . (library_unit_renaming_declaration . 2)) (PROCEDURE . (library_unit_renaming_declaration . 2)) (PRIVATE . (library_unit_renaming_declaration . 2)) (PRAGMA . (library_unit_renaming_declaration . 2)) (PACKAGE . (library_unit_renaming_declaration . 2)) (OVERRIDING . (library_unit_renaming_declaration . 2)) (NOT . (library_unit_renaming_declaration . 2)) (LIMITED . (library_unit_renaming_declaration . 2)) (GENERIC . (library_unit_renaming_declaration . 2)) (FUNCTION . (library_unit_renaming_declaration . 2)) ($EOI . (library_unit_renaming_declaration . 2)))
      ((default . error) (WITH . (compilation_unit . 2)) (USE . (compilation_unit . 2)) (SEPARATE . (compilation_unit . 2)) (PROCEDURE . (compilation_unit . 2)) (PRIVATE . (compilation_unit . 2)) (PRAGMA . (compilation_unit . 2)) (PACKAGE . (compilation_unit . 2)) (OVERRIDING . (compilation_unit . 2)) (NOT . (compilation_unit . 2)) (LIMITED . (compilation_unit . 2)) (GENERIC . (compilation_unit . 2)) (FUNCTION . (compilation_unit . 2)) ($EOI . (compilation_unit . 2)))
      ((default . error) ($EOI . (context_item . 2)) (FUNCTION . (context_item . 2)) (GENERIC . (context_item . 2)) (LIMITED . (context_item . 2)) (NOT . (context_item . 2)) (OVERRIDING . (context_item . 2)) (PACKAGE . (context_item . 2)) (PRAGMA . (context_item . 2)) (PRIVATE . (context_item . 2)) (PROCEDURE . (context_item . 2)) (SEPARATE . (context_item . 2)) (USE . (context_item . 2)) (WITH . (context_item . 2)))
      ((default . error) ($EOI . (context_item . 1)) (FUNCTION . (context_item . 1)) (GENERIC . (context_item . 1)) (LIMITED . (context_item . 1)) (NOT . (context_item . 1)) (OVERRIDING . (context_item . 1)) (PACKAGE . (context_item . 1)) (PRAGMA . (context_item . 1)) (PRIVATE . (context_item . 1)) (PROCEDURE . (context_item . 1)) (SEPARATE . (context_item . 1)) (USE . (context_item . 1)) (WITH . (context_item . 1)))
      ((default . error) (USE . (package_declaration . 0)) (TYPE . (package_declaration . 0)) (TASK . (package_declaration . 0)) (SUBTYPE . (package_declaration . 0)) (PROTECTED . (package_declaration . 0)) (PROCEDURE . (package_declaration . 0)) (PRAGMA . (package_declaration . 0)) (PACKAGE . (package_declaration . 0)) (OVERRIDING . (package_declaration . 0)) (NOT . (package_declaration . 0)) (GENERIC . (package_declaration . 0)) (FUNCTION . (package_declaration . 0)) (FOR . (package_declaration . 0)) (ENTRY . (package_declaration . 0)) (IDENTIFIER . (package_declaration . 0)) (BEGIN . (package_declaration . 0)) (END . (package_declaration . 0)) (PRIVATE . (package_declaration . 0)) (WITH . (package_declaration . 0)) (SEPARATE . (package_declaration . 0)) (LIMITED . (package_declaration . 0)) ($EOI . (package_declaration . 0)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (RENAMES .  127) (SEMICOLON . (aspect_specification_opt . 0)) (IS . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (SEMICOLON .  125))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) ($EOI . accept) (XOR . accept) (WITH . accept) (WHILE . accept) (WHEN . accept) (USE . accept) (UNTIL . accept) (TYPE . accept) (THEN . accept) (TERMINATE . accept) (TASK . accept) (TAGGED . accept) (SYNCHRONIZED . accept) (SUBTYPE . accept) (SOME . accept) (SELECT . accept) (SEPARATE . accept) (RIGHT_PAREN . accept) (REVERSE . accept) (RETURN . accept) (REQUEUE . accept) (RENAMES . accept) (REM . accept) (RECORD . accept) (RANGE . accept) (RAISE . accept) (PROTECTED . accept) (PROCEDURE . accept) (PRIVATE . accept) (PRAGMA . accept) (PACKAGE . accept) (OVERRIDING . accept) (OUT . accept) (OTHERS . accept) (OR . accept) (OF . accept) (NULL . accept) (NOT . accept) (NEW . accept) (MOD . accept) (LOOP . accept) (LIMITED . accept) (LEFT_PAREN . accept) (IS . accept) (INTERFACE . accept) (IN . accept) (IF . accept) (GOTO . accept) (GENERIC . accept) (FUNCTION . accept) (FOR . accept) (EXIT . accept) (EXCEPTION . accept) (ENTRY . accept) (END . accept) (ELSIF . accept) (ELSE . accept) (DO . accept) (DIGITS . accept) (DELTA . accept) (DELAY . accept) (DECLARE . accept) (CONSTANT . accept) (CASE . accept) (BODY . accept) (BEGIN . accept) (AT . accept) (ARRAY . accept) (AND . accept) (ALL . accept) (ALIASED . accept) (ACCESS . accept) (ABSTRACT . accept) (ABORT . accept) (ACCEPT . accept) (ABS . accept) (CHARACTER_LITERAL . accept) (STRING_LITERAL . accept) (IDENTIFIER . accept) (TICK . accept) (STAR_STAR . accept) (STAR . accept) (SLASH_EQUAL . accept) (SLASH . accept) (SEMICOLON . accept) (PLUS . accept) (MINUS . accept) (LESS_LESS . accept) (LESS_EQUAL . accept) (LESS . accept) (GREATER_GREATER . accept) (GREATER_EQUAL . accept) (GREATER . accept) (EQUAL_GREATER . accept) (EQUAL . accept) (DOT_DOT . accept) (DOT . accept) (COMMA . accept) (COLON_EQUAL . accept) (COLON . accept) (BOX . accept) (BAR . accept) (AMPERSAND . accept))
      ((default . error) (WITH . (compilation_unit_list . 1)) (USE . (compilation_unit_list . 1)) (SEPARATE . (compilation_unit_list . 1)) (PROCEDURE . (compilation_unit_list . 1)) (PRIVATE . (compilation_unit_list . 1)) (PRAGMA . (compilation_unit_list . 1)) (PACKAGE . (compilation_unit_list . 1)) (OVERRIDING . (compilation_unit_list . 1)) (NOT . (compilation_unit_list . 1)) (LIMITED . (compilation_unit_list . 1)) (GENERIC . (compilation_unit_list . 1)) (FUNCTION . (compilation_unit_list . 1)) ($EOI . (compilation_unit_list . 1)))
      ((default . error) (USE . (name . 0)) (DO . (name . 0)) (RENAMES . (name . 0)) (ELSIF . (name . 0)) (ELSE . (name . 0)) (LESS_LESS . (name . 0)) (IDENTIFIER . (name . 0)) (STRING_LITERAL . (name . 0)) (CHARACTER_LITERAL . (name . 0)) (ACCEPT . (name . 0)) (ABORT . (name . 0)) (BEGIN . (name . 0)) (CASE . (name . 0)) (DECLARE . (name . 0)) (DELAY . (name . 0)) (EXIT . (name . 0)) (FOR . (name . 0)) (GOTO . (name . 0)) (IF . (name . 0)) (LOOP . (name . 0)) (NULL . (name . 0)) (PRAGMA . (name . 0)) (RAISE . (name . 0)) (REQUEUE . (name . 0)) (RETURN . (name . 0)) (SELECT . (name . 0)) (WHILE . (name . 0)) (OF . (name . 0)) (DIGITS . (name . 0)) (COMMA . (name . 0)) (THEN . (name . 0)) (COLON_EQUAL . (name . 0)) (WITH . (name . 0)) (BAR . (name . 0)) (EQUAL_GREATER . (name . 0)) (IS . (name . 0)) (SLASH_EQUAL . (name . 0)) (LESS_EQUAL . (name . 0)) (LESS . (name . 0)) (GREATER_EQUAL . (name . 0)) (GREATER . (name . 0)) (EQUAL . (name . 0)) (NOT . (name . 0)) (IN . (name . 0)) (AND . (name . 0)) (OR . (name . 0)) (XOR . (name . 0)) (SEMICOLON . (name . 0)) (RIGHT_PAREN . (name . 0)) (LEFT_PAREN . (name . 0)) (RANGE . (name . 0)) (TICK . (name . 0)) (DOT . (name . 0)) (PLUS . (name . 0)) (MINUS . (name . 0)) (AMPERSAND . (name . 0)) (DOT_DOT . (name . 0)) (SLASH . (name . 0)) (STAR . (name . 0)) (MOD . (name . 0)) (REM . (name . 0)) (STAR_STAR . (name . 0)))
      ((default . error) (USE . (name . 7)) (DO . (name . 7)) (RENAMES . (name . 7)) (ELSIF . (name . 7)) (ELSE . (name . 7)) (LESS_LESS . (name . 7)) (IDENTIFIER . (name . 7)) (STRING_LITERAL . (name . 7)) (CHARACTER_LITERAL . (name . 7)) (ACCEPT . (name . 7)) (ABORT . (name . 7)) (BEGIN . (name . 7)) (CASE . (name . 7)) (DECLARE . (name . 7)) (DELAY . (name . 7)) (EXIT . (name . 7)) (FOR . (name . 7)) (GOTO . (name . 7)) (IF . (name . 7)) (LOOP . (name . 7)) (NULL . (name . 7)) (PRAGMA . (name . 7)) (RAISE . (name . 7)) (REQUEUE . (name . 7)) (RETURN . (name . 7)) (SELECT . (name . 7)) (WHILE . (name . 7)) (OF . (name . 7)) (DIGITS . (name . 7)) (COMMA . (name . 7)) (THEN . (name . 7)) (COLON_EQUAL . (name . 7)) (WITH . (name . 7)) (BAR . (name . 7)) (EQUAL_GREATER . (name . 7)) (IS . (name . 7)) (SLASH_EQUAL . (name . 7)) (LESS_EQUAL . (name . 7)) (LESS . (name . 7)) (GREATER_EQUAL . (name . 7)) (GREATER . (name . 7)) (EQUAL . (name . 7)) (NOT . (name . 7)) (IN . (name . 7)) (AND . (name . 7)) (OR . (name . 7)) (XOR . (name . 7)) (SEMICOLON . (name . 7)) (RIGHT_PAREN . (name . 7)) (LEFT_PAREN . (name . 7)) (RANGE . (name . 7)) (TICK . (name . 7)) (DOT . (name . 7)) (PLUS . (name . 7)) (MINUS . (name . 7)) (AMPERSAND . (name . 7)) (DOT_DOT . (name . 7)) (SLASH . (name . 7)) (STAR . (name . 7)) (MOD . (name . 7)) (REM . (name . 7)) (STAR_STAR . (name . 7)))
      ((default . error) (DO . (name . 1)) (USE . (name . 1)) (COMMA . (name . 1)) (RENAMES . (name . 1)) (ELSIF . (name . 1)) (ELSE . (name . 1)) (LESS_LESS . (name . 1)) (IDENTIFIER . (name . 1)) (STRING_LITERAL . (name . 1)) (CHARACTER_LITERAL . (name . 1)) (ACCEPT . (name . 1)) (ABORT . (name . 1)) (BEGIN . (name . 1)) (CASE . (name . 1)) (DECLARE . (name . 1)) (DELAY . (name . 1)) (EXIT . (name . 1)) (FOR . (name . 1)) (GOTO . (name . 1)) (IF . (name . 1)) (LOOP . (name . 1)) (NULL . (name . 1)) (PRAGMA . (name . 1)) (RAISE . (name . 1)) (REQUEUE . (name . 1)) (RETURN . (name . 1)) (SELECT . (name . 1)) (WHILE . (name . 1)) (OF . (name . 1)) (DIGITS . (name . 1)) (THEN . (name . 1)) (COLON_EQUAL . (name . 1)) (WITH . (name . 1)) (BAR . (name . 1)) (EQUAL_GREATER . (name . 1)) (IS . (name . 1)) (SLASH_EQUAL . (name . 1)) (LESS_EQUAL . (name . 1)) (LESS . (name . 1)) (GREATER_EQUAL . (name . 1)) (GREATER . (name . 1)) (EQUAL . (name . 1)) (NOT . (name . 1)) (IN . (name . 1)) (AND . (name . 1)) (OR . (name . 1)) (XOR . (name . 1)) (SEMICOLON . (name . 1)) (RIGHT_PAREN . (name . 1)) (LEFT_PAREN . (name . 1)) (RANGE . (name . 1)) (TICK . (name . 1)) (DOT . (name . 1)) (PLUS . (name . 1)) (MINUS . (name . 1)) (AMPERSAND . (name . 1)) (DOT_DOT . (name . 1)) (SLASH . (name . 1)) (STAR . (name . 1)) (MOD . (name . 1)) (REM . (name . 1)) (STAR_STAR . (name . 1)))
      ((default . error) (USE . (name . 4)) (DO . (name . 4)) (RENAMES . (name . 4)) (ELSIF . (name . 4)) (ELSE . (name . 4)) (LESS_LESS . (name . 4)) (IDENTIFIER . (name . 4)) (STRING_LITERAL . (name . 4)) (CHARACTER_LITERAL . (name . 4)) (ACCEPT . (name . 4)) (ABORT . (name . 4)) (BEGIN . (name . 4)) (CASE . (name . 4)) (DECLARE . (name . 4)) (DELAY . (name . 4)) (EXIT . (name . 4)) (FOR . (name . 4)) (GOTO . (name . 4)) (IF . (name . 4)) (LOOP . (name . 4)) (NULL . (name . 4)) (PRAGMA . (name . 4)) (RAISE . (name . 4)) (REQUEUE . (name . 4)) (RETURN . (name . 4)) (SELECT . (name . 4)) (WHILE . (name . 4)) (OF . (name . 4)) (DIGITS . (name . 4)) (COMMA . (name . 4)) (THEN . (name . 4)) (COLON_EQUAL . (name . 4)) (WITH . (name . 4)) (BAR . (name . 4)) (EQUAL_GREATER . (name . 4)) (IS . (name . 4)) (SLASH_EQUAL . (name . 4)) (LESS_EQUAL . (name . 4)) (LESS . (name . 4)) (GREATER_EQUAL . (name . 4)) (GREATER . (name . 4)) (EQUAL . (name . 4)) (NOT . (name . 4)) (IN . (name . 4)) (AND . (name . 4)) (OR . (name . 4)) (XOR . (name . 4)) (SEMICOLON . (name . 4)) (RIGHT_PAREN . (name . 4)) (LEFT_PAREN . (name . 4)) (RANGE . (name . 4)) (TICK . (name . 4)) (DOT . (name . 4)) (PLUS . (name . 4)) (MINUS . (name . 4)) (AMPERSAND . (name . 4)) (DOT_DOT . (name . 4)) (SLASH . (name . 4)) (STAR . (name . 4)) (MOD . (name . 4)) (REM . (name . 4)) (STAR_STAR . (name . 4)))
      ((default . error) (COMMA .  119) (SEMICOLON .  123))
      ((default . error) (DOT .  87) (SEMICOLON . (name_list . 0)) (COMMA . (name_list . 0)) (TICK .  88) (LEFT_PAREN .  106))
      ((default . error) (DO . (name . 6)) (USE . (name . 6)) (RENAMES . (name . 6)) (ELSIF . (name . 6)) (ELSE . (name . 6)) (LESS_LESS . (name . 6)) (IDENTIFIER . (name . 6)) (STRING_LITERAL . (name . 6)) (CHARACTER_LITERAL . (name . 6)) (ACCEPT . (name . 6)) (ABORT . (name . 6)) (BEGIN . (name . 6)) (CASE . (name . 6)) (DECLARE . (name . 6)) (DELAY . (name . 6)) (EXIT . (name . 6)) (FOR . (name . 6)) (GOTO . (name . 6)) (IF . (name . 6)) (LOOP . (name . 6)) (NULL . (name . 6)) (PRAGMA . (name . 6)) (RAISE . (name . 6)) (REQUEUE . (name . 6)) (RETURN . (name . 6)) (SELECT . (name . 6)) (WHILE . (name . 6)) (OF . (name . 6)) (DIGITS . (name . 6)) (COMMA . (name . 6)) (THEN . (name . 6)) (COLON_EQUAL . (name . 6)) (WITH . (name . 6)) (BAR . (name . 6)) (EQUAL_GREATER . (name . 6)) (IS . (name . 6)) (SLASH_EQUAL . (name . 6)) (LESS_EQUAL . (name . 6)) (LESS . (name . 6)) (GREATER_EQUAL . (name . 6)) (GREATER . (name . 6)) (EQUAL . (name . 6)) (NOT . (name . 6)) (IN . (name . 6)) (AND . (name . 6)) (OR . (name . 6)) (XOR . (name . 6)) (SEMICOLON . (name . 6)) (RIGHT_PAREN . (name . 6)) (LEFT_PAREN . (name . 6)) (RANGE . (name . 6)) (TICK . (name . 6)) (DOT . (name . 6)) (PLUS . (name . 6)) (MINUS . (name . 6)) (AMPERSAND . (name . 6)) (DOT_DOT . (name . 6)) (SLASH . (name . 6)) (STAR . (name . 6)) (MOD . (name . 6)) (REM . (name . 6)) (STAR_STAR . (name . 6)))
      ((default . error) (DO . (name . 3)) (USE . (name . 3)) (RENAMES . (name . 3)) (ELSIF . (name . 3)) (ELSE . (name . 3)) (LESS_LESS . (name . 3)) (IDENTIFIER . (name . 3)) (STRING_LITERAL . (name . 3)) (CHARACTER_LITERAL . (name . 3)) (ACCEPT . (name . 3)) (ABORT . (name . 3)) (BEGIN . (name . 3)) (CASE . (name . 3)) (DECLARE . (name . 3)) (DELAY . (name . 3)) (EXIT . (name . 3)) (FOR . (name . 3)) (GOTO . (name . 3)) (IF . (name . 3)) (LOOP . (name . 3)) (NULL . (name . 3)) (PRAGMA . (name . 3)) (RAISE . (name . 3)) (REQUEUE . (name . 3)) (RETURN . (name . 3)) (SELECT . (name . 3)) (WHILE . (name . 3)) (OF . (name . 3)) (DIGITS . (name . 3)) (COMMA . (name . 3)) (THEN . (name . 3)) (COLON_EQUAL . (name . 3)) (WITH . (name . 3)) (BAR . (name . 3)) (EQUAL_GREATER . (name . 3)) (IS . (name . 3)) (SLASH_EQUAL . (name . 3)) (LESS_EQUAL . (name . 3)) (LESS . (name . 3)) (GREATER_EQUAL . (name . 3)) (GREATER . (name . 3)) (EQUAL . (name . 3)) (NOT . (name . 3)) (IN . (name . 3)) (AND . (name . 3)) (OR . (name . 3)) (XOR . (name . 3)) (SEMICOLON . (name . 3)) (RIGHT_PAREN . (name . 3)) (LEFT_PAREN . (name . 3)) (RANGE . (name . 3)) (TICK . (name . 3)) (DOT . (name . 3)) (PLUS . (name . 3)) (MINUS . (name . 3)) (AMPERSAND . (name . 3)) (DOT_DOT . (name . 3)) (SLASH . (name . 3)) (STAR . (name . 3)) (MOD . (name . 3)) (REM . (name . 3)) (STAR_STAR . (name . 3)))
      ((default . error) (TYPE .  122))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (COMMA .  119) (SEMICOLON .  120))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (DOT .  87) (TICK .  88) (IS . (parameter_profile_opt . 0)) (SEMICOLON . (parameter_profile_opt . 0)) (WITH . (parameter_profile_opt . 0)) (LEFT_PAREN .  89))
      ((default . error) (FUNCTION . (generic_formal_part . 1)) (PROCEDURE . (generic_formal_part . 1)) (PACKAGE . (generic_formal_part . 1)) (PRAGMA .  7) (WITH .  77) (TYPE .  76) (IDENTIFIER .  72))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (WITH . (library_item . 0)) (USE . (library_item . 0)) (SEPARATE . (library_item . 0)) (PROCEDURE . (library_item . 0)) (PRIVATE . (library_item . 0)) (PRAGMA . (library_item . 0)) (PACKAGE . (library_item . 0)) (OVERRIDING . (library_item . 0)) (NOT . (library_item . 0)) (LIMITED . (library_item . 0)) (GENERIC . (library_item . 0)) (FUNCTION . (library_item . 0)) ($EOI . (library_item . 0)))
      ((default . error) (FUNCTION .  40) (PROCEDURE .  41))
      ((default . error) (LEFT_PAREN .  112) (SEMICOLON .  111))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (RENAMES .  107) (DOT .  87) (TICK .  88) (IS . ( 105 (aspect_specification_opt . 0))) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (ENTRY . (overriding_indicator_opt . 0)) (PROCEDURE . (overriding_indicator_opt . 0)) (FUNCTION . (overriding_indicator_opt . 0)))
      ((default . error) (WITH .  104))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (COLON . (identifier_list . 0)) (COMMA . (identifier_list . 0)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  99))
      ((default . error) (PACKAGE .  97) (FUNCTION .  1) (PROCEDURE .  9))
      ((default . error) (PACKAGE . (generic_formal_parameter_declaration . 0)) (PROCEDURE . (generic_formal_parameter_declaration . 0)) (FUNCTION . (generic_formal_parameter_declaration . 0)) (WITH . (generic_formal_parameter_declaration . 0)) (TYPE . (generic_formal_parameter_declaration . 0)) (PRAGMA . (generic_formal_parameter_declaration . 0)) (IDENTIFIER . (generic_formal_parameter_declaration . 0)))
      ((default . error) (PACKAGE . (generic_formal_parameter_declaration . 2)) (PROCEDURE . (generic_formal_parameter_declaration . 2)) (FUNCTION . (generic_formal_parameter_declaration . 2)) (WITH . (generic_formal_parameter_declaration . 2)) (TYPE . (generic_formal_parameter_declaration . 2)) (PRAGMA . (generic_formal_parameter_declaration . 2)) (IDENTIFIER . (generic_formal_parameter_declaration . 2)))
      ((default . error) (PACKAGE . (generic_formal_parameter_declaration . 1)) (PROCEDURE . (generic_formal_parameter_declaration . 1)) (FUNCTION . (generic_formal_parameter_declaration . 1)) (WITH . (generic_formal_parameter_declaration . 1)) (TYPE . (generic_formal_parameter_declaration . 1)) (PRAGMA . (generic_formal_parameter_declaration . 1)) (IDENTIFIER . (generic_formal_parameter_declaration . 1)))
      ((default . error) (PACKAGE . (generic_formal_parameter_declaration . 3)) (PROCEDURE . (generic_formal_parameter_declaration . 3)) (FUNCTION . (generic_formal_parameter_declaration . 3)) (WITH . (generic_formal_parameter_declaration . 3)) (TYPE . (generic_formal_parameter_declaration . 3)) (PRAGMA . (generic_formal_parameter_declaration . 3)) (IDENTIFIER . (generic_formal_parameter_declaration . 3)))
      ((default . error) (PACKAGE . (generic_formal_part . 0)) (PROCEDURE . (generic_formal_part . 0)) (FUNCTION . (generic_formal_part . 0)) (PRAGMA .  7) (WITH .  77) (TYPE .  76) (IDENTIFIER .  72))
      ((default . error) (PACKAGE . (generic_formal_parameter_declarations . 0)) (PROCEDURE . (generic_formal_parameter_declarations . 0)) (FUNCTION . (generic_formal_parameter_declarations . 0)) (IDENTIFIER . (generic_formal_parameter_declarations . 0)) (PRAGMA . (generic_formal_parameter_declarations . 0)) (TYPE . (generic_formal_parameter_declarations . 0)) (WITH . (generic_formal_parameter_declarations . 0)))
      ((default . error) (COMMA .  95) (COLON .  94))
      ((default . error) (PACKAGE . (generic_formal_parameter_declaration . 4)) (PROCEDURE . (generic_formal_parameter_declaration . 4)) (FUNCTION . (generic_formal_parameter_declaration . 4)) (WITH . (generic_formal_parameter_declaration . 4)) (TYPE . (generic_formal_parameter_declaration . 4)) (PRAGMA . (generic_formal_parameter_declaration . 4)) (IDENTIFIER . (generic_formal_parameter_declaration . 4)))
      ((default . error) (DOT .  87) (TICK .  88) (RETURN .  90) (LEFT_PAREN .  89))
      ((default . error) (IDENTIFIER .  225) (CHARACTER_LITERAL .  227) (STRING_LITERAL .  226) (ALL .  228))
      ((default . error) (LEFT_PAREN .  220) (ACCESS .  217) (DELTA .  218) (DIGITS .  219) (MOD .  221) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (STRING_LITERAL .  49) (CHARACTER_LITERAL .  170) (RIGHT_PAREN . ((association_opt . 0) (expression_opt . 0))) (COMMA . ((association_opt . 0) (expression_opt . 0))) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (PLUS .  144) (MINUS .  143) (IDENTIFIER .  213) (OTHERS .  172) (ABS .  146) (NOT .  171) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (WITH . (name_opt . 0)) (SEMICOLON . (name_opt . 0)) (IS . (name_opt . 0)) (RENAMES . (name_opt . 0)) (COLON_EQUAL . (name_opt . 0)) (RIGHT_PAREN . (name_opt . 0)) (DO . (name_opt . 0)) (ACCESS . (null_exclusion_opt . 0)) (NOT .  208) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (DO . (name . 5)) (OF . (name . 5)) (WHILE . (name . 5)) (SELECT . (name . 5)) (REQUEUE . (name . 5)) (RAISE . (name . 5)) (PRAGMA . (name . 5)) (NULL . (name . 5)) (LOOP . (name . 5)) (IF . (name . 5)) (GOTO . (name . 5)) (FOR . (name . 5)) (EXIT . (name . 5)) (DELAY . (name . 5)) (DECLARE . (name . 5)) (CASE . (name . 5)) (BEGIN . (name . 5)) (ABORT . (name . 5)) (ACCEPT . (name . 5)) (CHARACTER_LITERAL . (name . 5)) (STRING_LITERAL . (name . 5)) (IDENTIFIER . (name . 5)) (LESS_LESS . (name . 5)) (COLON_EQUAL . (name . 5)) (USE . (name . 5)) (PLUS . (name . 5)) (MINUS . (name . 5)) (AMPERSAND . (name . 5)) (SLASH . (name . 5)) (STAR . (name . 5)) (MOD . (name . 5)) (REM . (name . 5)) (STAR_STAR . (name . 5)) (XOR . (name . 5)) (OR . (name . 5)) (AND . (name . 5)) (IN . (name . 5)) (NOT . (name . 5)) (EQUAL . (name . 5)) (GREATER . (name . 5)) (GREATER_EQUAL . (name . 5)) (LESS . (name . 5)) (LESS_EQUAL . (name . 5)) (SLASH_EQUAL . (name . 5)) (DOT_DOT . (name . 5)) (THEN . (name . 5)) (RANGE . (name . 5)) (DIGITS . (name . 5)) (EQUAL_GREATER . (name . 5)) (ELSE . (name . 5)) (ELSIF . (name . 5)) (BAR . (name . 5)) (RIGHT_PAREN . (name . 5)) (RETURN . (name . 5)) (RENAMES . (name . 5)) (IS . (name . 5)) (WITH . (name . 5)) (TICK . (name . 5)) (DOT . (name . 5)) (LEFT_PAREN . (name . 5)) (SEMICOLON . (name . 5)) (COMMA . (name . 5)))
      ((default . error) (RETURN .  207))
      ((default . error) (RENAMES . (function_specification . 0)) (IS . (function_specification . 0)) (SEMICOLON . (function_specification . 0)) (WITH . (function_specification . 0)))
      ((default . error) (ACCESS . (mode_opt . 0)) (NOT . (mode_opt . 0)) (IDENTIFIER . (mode_opt . 0)) (STRING_LITERAL . (mode_opt . 0)) (CHARACTER_LITERAL . (mode_opt . 0)) (IN .  204) (OUT .  205))
      ((default . error) (IDENTIFIER .  203))
      ((default . error) (WITH . (generic_formal_parameter_declarations . 1)) (TYPE . (generic_formal_parameter_declarations . 1)) (PRAGMA . (generic_formal_parameter_declarations . 1)) (IDENTIFIER . (generic_formal_parameter_declarations . 1)) (FUNCTION . (generic_formal_parameter_declarations . 1)) (PROCEDURE . (generic_formal_parameter_declarations . 1)) (PACKAGE . (generic_formal_parameter_declarations . 1)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IS .  200) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (WITH . (discriminant_part_opt . 0)) (SEMICOLON . (discriminant_part_opt . 0)) (IS . (discriminant_part_opt . 0)) (LEFT_PAREN .  198))
      ((default . error) (DOT .  87) (TICK .  88) (RENAMES .  197) (LEFT_PAREN .  106))
      ((default . error) (DOT .  87) (TICK .  88) (RENAMES .  196) (LEFT_PAREN .  106))
      ((default . error) (DOT .  87) (TICK .  88) (RENAMES .  195) (LEFT_PAREN .  106))
      ((default . error) (COMMA .  119) (SEMICOLON .  194))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (NEW .  192))
      ((default . error) (IDENTIFIER .  48) (STRING_LITERAL .  49) (CHARACTER_LITERAL .  170) (RIGHT_PAREN . ((association_opt . 0) (expression_opt . 0))) (COMMA . ((association_opt . 0) (expression_opt . 0))) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (PLUS .  144) (MINUS .  143) (OTHERS .  172) (ABS .  146) (NOT .  171) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (SEMICOLON . ((association_opt . 0) (expression_opt . 0))) (IS . ((association_opt . 0) (expression_opt . 0))) (COMMA . ((association_opt . 0) (expression_opt . 0))) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (OTHERS .  172) (IDENTIFIER .  48) (CHARACTER_LITERAL .  170) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  171) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (IS .  169))
      ((default . error) (DOT .  87) (TICK .  88) (IS . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (OR . (pragma . 1)) (THEN . (pragma . 1)) (WHEN . (pragma . 1)) (EXCEPTION . (pragma . 1)) (LESS_LESS . (pragma . 1)) (STRING_LITERAL . (pragma . 1)) (CHARACTER_LITERAL . (pragma . 1)) (ACCEPT . (pragma . 1)) (ABORT . (pragma . 1)) (CASE . (pragma . 1)) (DECLARE . (pragma . 1)) (DELAY . (pragma . 1)) (EXIT . (pragma . 1)) (GOTO . (pragma . 1)) (IF . (pragma . 1)) (LOOP . (pragma . 1)) (NULL . (pragma . 1)) (RAISE . (pragma . 1)) (REQUEUE . (pragma . 1)) (RETURN . (pragma . 1)) (SELECT . (pragma . 1)) (WHILE . (pragma . 1)) (ELSE . (pragma . 1)) (ELSIF . (pragma . 1)) (SEPARATE . (pragma . 1)) (LIMITED . (pragma . 1)) ($EOI . (pragma . 1)) (WITH . (pragma . 1)) (PRIVATE . (pragma . 1)) (END . (pragma . 1)) (BEGIN . (pragma . 1)) (IDENTIFIER . (pragma . 1)) (ENTRY . (pragma . 1)) (FOR . (pragma . 1)) (FUNCTION . (pragma . 1)) (GENERIC . (pragma . 1)) (NOT . (pragma . 1)) (OVERRIDING . (pragma . 1)) (PACKAGE . (pragma . 1)) (PRAGMA . (pragma . 1)) (PROCEDURE . (pragma . 1)) (PROTECTED . (pragma . 1)) (SUBTYPE . (pragma . 1)) (TASK . (pragma . 1)) (TYPE . (pragma . 1)) (USE . (pragma . 1)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  145) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (COMMA .  119) (SEMICOLON .  141))
      ((default . error) (DOT .  87) (TICK .  88) (IS . ( 105 (aspect_specification_opt . 0))) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (RIGHT_PAREN . (parameter_profile_opt . 1)) (COLON_EQUAL . (parameter_profile_opt . 1)) (RENAMES . (parameter_profile_opt . 1)) (IS . (parameter_profile_opt . 1)) (DO . (parameter_profile_opt . 1)) (WITH . (parameter_profile_opt . 1)) (SEMICOLON . (parameter_profile_opt . 1)) (WHEN . (parameter_profile_opt . 1)))
      ((default . error) (RENAMES . (procedure_specification . 0)) (IS . (procedure_specification . 0)) (SEMICOLON . (procedure_specification . 0)) (WITH . (procedure_specification . 0)))
      ((default . error) (DOT .  87) (TICK .  88) (RIGHT_PAREN .  140) (LEFT_PAREN .  106))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (WITH . (use_clause . 0)) (SEPARATE . (use_clause . 0)) (LIMITED . (use_clause . 0)) ($EOI . (use_clause . 0)) (PRIVATE . (use_clause . 0)) (END . (use_clause . 0)) (BEGIN . (use_clause . 0)) (IDENTIFIER . (use_clause . 0)) (ENTRY . (use_clause . 0)) (FOR . (use_clause . 0)) (FUNCTION . (use_clause . 0)) (GENERIC . (use_clause . 0)) (NOT . (use_clause . 0)) (OVERRIDING . (use_clause . 0)) (PACKAGE . (use_clause . 0)) (PRAGMA . (use_clause . 0)) (PROCEDURE . (use_clause . 0)) (PROTECTED . (use_clause . 0)) (SUBTYPE . (use_clause . 0)) (TASK . (use_clause . 0)) (TYPE . (use_clause . 0)) (USE . (use_clause . 0)))
      ((default . error) (COMMA .  119) (SEMICOLON .  138))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (WITH . (with_clause . 3)) (USE . (with_clause . 3)) (SEPARATE . (with_clause . 3)) (PROCEDURE . (with_clause . 3)) (PRIVATE . (with_clause . 3)) (PRAGMA . (with_clause . 3)) (PACKAGE . (with_clause . 3)) (OVERRIDING . (with_clause . 3)) (NOT . (with_clause . 3)) (LIMITED . (with_clause . 3)) (GENERIC . (with_clause . 3)) (FUNCTION . (with_clause . 3)) ($EOI . (with_clause . 3)))
      ((default . error) (SEMICOLON .  136))
      ((default . error) (WITH . (generic_package_declaration . 0)) (SEPARATE . (generic_package_declaration . 0)) (LIMITED . (generic_package_declaration . 0)) ($EOI . (generic_package_declaration . 0)) (END . (generic_package_declaration . 0)) (PRIVATE . (generic_package_declaration . 0)) (USE . (generic_package_declaration . 0)) (TYPE . (generic_package_declaration . 0)) (TASK . (generic_package_declaration . 0)) (SUBTYPE . (generic_package_declaration . 0)) (PROTECTED . (generic_package_declaration . 0)) (PROCEDURE . (generic_package_declaration . 0)) (PRAGMA . (generic_package_declaration . 0)) (PACKAGE . (generic_package_declaration . 0)) (OVERRIDING . (generic_package_declaration . 0)) (NOT . (generic_package_declaration . 0)) (GENERIC . (generic_package_declaration . 0)) (FUNCTION . (generic_package_declaration . 0)) (FOR . (generic_package_declaration . 0)) (ENTRY . (generic_package_declaration . 0)) (IDENTIFIER . (generic_package_declaration . 0)) (BEGIN . (generic_package_declaration . 0)))
      ((default . error) (DOT .  87) (TICK .  88) (IS . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (SEMICOLON .  133) (IS .  134))
      ((default . error) (DOT .  87) (TICK .  88) (IS . ( 132 (parameter_profile_opt . 0))) (SEMICOLON . (parameter_profile_opt . 0)) (WITH . (parameter_profile_opt . 0)) (RENAMES . (parameter_profile_opt . 0)) (LEFT_PAREN .  89))
      ((default . error) (DOT .  87) (TICK .  88) (IS .  131) (RETURN .  90) (LEFT_PAREN .  89))
      ((default . error) (NEW .  384))
      ((default . error) (NEW .  383))
      ((default . error) (TYPE . (subprogram_declaration . 0)) (TASK . (subprogram_declaration . 0)) (SUBTYPE . (subprogram_declaration . 0)) (PROTECTED . (subprogram_declaration . 0)) (FOR . (subprogram_declaration . 0)) (ENTRY . (subprogram_declaration . 0)) (IDENTIFIER . (subprogram_declaration . 0)) (BEGIN . (subprogram_declaration . 0)) (END . (subprogram_declaration . 0)) (WITH . (subprogram_declaration . 0)) (USE . (subprogram_declaration . 0)) (SEPARATE . (subprogram_declaration . 0)) (PROCEDURE . (subprogram_declaration . 0)) (PRIVATE . (subprogram_declaration . 0)) (PRAGMA . (subprogram_declaration . 0)) (PACKAGE . (subprogram_declaration . 0)) (OVERRIDING . (subprogram_declaration . 0)) (NOT . (subprogram_declaration . 0)) (LIMITED . (subprogram_declaration . 0)) (GENERIC . (subprogram_declaration . 0)) (FUNCTION . (subprogram_declaration . 0)) ($EOI . (subprogram_declaration . 0)))
      ((default . error) (BEGIN . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (BEGIN . (generic_subprogram_declaration . 0)) (IDENTIFIER . (generic_subprogram_declaration . 0)) (ENTRY . (generic_subprogram_declaration . 0)) (FOR . (generic_subprogram_declaration . 0)) (FUNCTION . (generic_subprogram_declaration . 0)) (GENERIC . (generic_subprogram_declaration . 0)) (NOT . (generic_subprogram_declaration . 0)) (OVERRIDING . (generic_subprogram_declaration . 0)) (PACKAGE . (generic_subprogram_declaration . 0)) (PRAGMA . (generic_subprogram_declaration . 0)) (PROCEDURE . (generic_subprogram_declaration . 0)) (PROTECTED . (generic_subprogram_declaration . 0)) (SUBTYPE . (generic_subprogram_declaration . 0)) (TASK . (generic_subprogram_declaration . 0)) (TYPE . (generic_subprogram_declaration . 0)) (USE . (generic_subprogram_declaration . 0)) (PRIVATE . (generic_subprogram_declaration . 0)) (END . (generic_subprogram_declaration . 0)) ($EOI . (generic_subprogram_declaration . 0)) (LIMITED . (generic_subprogram_declaration . 0)) (SEPARATE . (generic_subprogram_declaration . 0)) (WITH . (generic_subprogram_declaration . 0)))
      ((default . error) (COMMA .  119) (SEMICOLON .  380))
      ((default . error) (USE . (use_clause . 2)) (TYPE . (use_clause . 2)) (TASK . (use_clause . 2)) (SUBTYPE . (use_clause . 2)) (PROTECTED . (use_clause . 2)) (PROCEDURE . (use_clause . 2)) (PRAGMA . (use_clause . 2)) (PACKAGE . (use_clause . 2)) (OVERRIDING . (use_clause . 2)) (NOT . (use_clause . 2)) (GENERIC . (use_clause . 2)) (FUNCTION . (use_clause . 2)) (FOR . (use_clause . 2)) (ENTRY . (use_clause . 2)) (IDENTIFIER . (use_clause . 2)) (BEGIN . (use_clause . 2)) (END . (use_clause . 2)) (PRIVATE . (use_clause . 2)) ($EOI . (use_clause . 2)) (LIMITED . (use_clause . 2)) (SEPARATE . (use_clause . 2)) (WITH . (use_clause . 2)))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (name_list . 1)) (COMMA . (name_list . 1)) (LEFT_PAREN .  106))
      ((default . error) (PROTECTED .  376) (TASK .  377) (PACKAGE .  375) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)))
      ((default . error) ($EOI . (with_clause . 2)) (FUNCTION . (with_clause . 2)) (GENERIC . (with_clause . 2)) (LIMITED . (with_clause . 2)) (NOT . (with_clause . 2)) (OVERRIDING . (with_clause . 2)) (PACKAGE . (with_clause . 2)) (PRAGMA . (with_clause . 2)) (PRIVATE . (with_clause . 2)) (PROCEDURE . (with_clause . 2)) (SEPARATE . (with_clause . 2)) (USE . (with_clause . 2)) (WITH . (with_clause . 2)))
      ((default . error) (SEMICOLON .  133))
      ((default . error) (IDENTIFIER . (unary_adding_operator . 1)) (STRING_LITERAL . (unary_adding_operator . 1)) (CHARACTER_LITERAL . (unary_adding_operator . 1)) (ABS . (unary_adding_operator . 1)) (LEFT_PAREN . (unary_adding_operator . 1)) (NEW . (unary_adding_operator . 1)) (NOT . (unary_adding_operator . 1)) (NULL . (unary_adding_operator . 1)))
      ((default . error) (IDENTIFIER . (unary_adding_operator . 0)) (STRING_LITERAL . (unary_adding_operator . 0)) (CHARACTER_LITERAL . (unary_adding_operator . 0)) (ABS . (unary_adding_operator . 0)) (LEFT_PAREN . (unary_adding_operator . 0)) (NEW . (unary_adding_operator . 0)) (NOT . (unary_adding_operator . 0)) (NULL . (unary_adding_operator . 0)))
      ((default . error) (EQUAL_GREATER .  373) (RIGHT_PAREN . (name . 0)) (COMMA . (name . 0)) (STAR_STAR . (name . 0)) (REM . (name . 0)) (MOD . (name . 0)) (STAR . (name . 0)) (SLASH . (name . 0)) (SLASH_EQUAL . (name . 0)) (LESS_EQUAL . (name . 0)) (LESS . (name . 0)) (GREATER_EQUAL . (name . 0)) (GREATER . (name . 0)) (EQUAL . (name . 0)) (NOT . (name . 0)) (IN . (name . 0)) (AMPERSAND . (name . 0)) (MINUS . (name . 0)) (PLUS . (name . 0)) (LEFT_PAREN . (name . 0)) (AND . (name . 0)) (OR . (name . 0)) (XOR . (name . 0)) (DOT . (name . 0)) (TICK . ( 374 (name . 0))))
      ((default . error) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (IF .  368) (CASE .  366) (FOR .  367) (RIGHT_PAREN . ((association_opt . 0) (expression_opt . 0))) (COMMA . ((association_opt . 0) (expression_opt . 0))) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (PLUS .  144) (MINUS .  143) (OTHERS .  172) (ABS .  146) (NOT .  171) (IDENTIFIER .  48) (CHARACTER_LITERAL .  170) (STRING_LITERAL .  49) (NULL .  229) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (OF . (primary . 0)) (COLON_EQUAL . (primary . 0)) (DO . (primary . 0)) (LOOP . (primary . 0)) (ELSIF . (primary . 0)) (ELSE . (primary . 0)) (DIGITS . (primary . 0)) (RIGHT_PAREN . (primary . 0)) (COMMA . (primary . 0)) (RANGE . (primary . 0)) (THEN . (primary . 0)) (WITH . (primary . 0)) (BAR . (primary . 0)) (EQUAL_GREATER . (primary . 0)) (IS . (primary . 0)) (IN . (primary . 0)) (NOT . (primary . 0)) (EQUAL . (primary . 0)) (GREATER . (primary . 0)) (GREATER_EQUAL . (primary . 0)) (LESS . (primary . 0)) (LESS_EQUAL . (primary . 0)) (SLASH_EQUAL . (primary . 0)) (AND . (primary . 0)) (OR . (primary . 0)) (XOR . (primary . 0)) (SEMICOLON . (primary . 0)) (PLUS . (primary . 0)) (MINUS . (primary . 0)) (AMPERSAND . (primary . 0)) (DOT_DOT . (primary . 0)) (SLASH . (primary . 0)) (STAR . (primary . 0)) (MOD . (primary . 0)) (REM . (primary . 0)) (STAR_STAR . (primary . 0)))
      ((default . error) (OF . (primary . 1)) (COLON_EQUAL . (primary . 1)) (DO . (primary . 1)) (LOOP . (primary . 1)) (ELSIF . (primary . 1)) (ELSE . (primary . 1)) (DIGITS . (primary . 1)) (RIGHT_PAREN . (primary . 1)) (COMMA . (primary . 1)) (RANGE . (primary . 1)) (THEN . (primary . 1)) (WITH . (primary . 1)) (BAR . (primary . 1)) (EQUAL_GREATER . (primary . 1)) (IS . (primary . 1)) (IN . (primary . 1)) (NOT . (primary . 1)) (EQUAL . (primary . 1)) (GREATER . (primary . 1)) (GREATER_EQUAL . (primary . 1)) (LESS . (primary . 1)) (LESS_EQUAL . (primary . 1)) (SLASH_EQUAL . (primary . 1)) (AND . (primary . 1)) (OR . (primary . 1)) (XOR . (primary . 1)) (SEMICOLON . (primary . 1)) (PLUS . (primary . 1)) (MINUS . (primary . 1)) (AMPERSAND . (primary . 1)) (DOT_DOT . (primary . 1)) (SLASH . (primary . 1)) (STAR . (primary . 1)) (MOD . (primary . 1)) (REM . (primary . 1)) (STAR_STAR . (primary . 1)))
      ((default . error) (COMMA . (pragma_argument_association . 1)) (RIGHT_PAREN . (pragma_argument_association . 1)))
      ((default . error) (OF . (term . 0)) (COLON_EQUAL . (term . 0)) (DO . (term . 0)) (LOOP . (term . 0)) (ELSIF . (term . 0)) (ELSE . (term . 0)) (DIGITS . (term . 0)) (RIGHT_PAREN . (term . 0)) (COMMA . (term . 0)) (RANGE . (term . 0)) (THEN . (term . 0)) (WITH . (term . 0)) (BAR . (term . 0)) (EQUAL_GREATER . (term . 0)) (IS . (term . 0)) (IN . (term . 0)) (NOT . (term . 0)) (EQUAL . (term . 0)) (GREATER . (term . 0)) (GREATER_EQUAL . (term . 0)) (LESS . (term . 0)) (LESS_EQUAL . (term . 0)) (SLASH_EQUAL . (term . 0)) (AND . (term . 0)) (OR . (term . 0)) (XOR . (term . 0)) (SEMICOLON . (term . 0)) (PLUS . (term . 0)) (MINUS . (term . 0)) (AMPERSAND . (term . 0)) (DOT_DOT . (term . 0)) (SLASH . (term . 0)) (STAR . (term . 0)) (MOD . (term . 0)) (REM . (term . 0)))
      ((default . error) (DOT .  87) (OF . (primary . 2)) (COLON_EQUAL . (primary . 2)) (DO . (primary . 2)) (LOOP . (primary . 2)) (BAR . (primary . 2)) (COMMA . (primary . 2)) (ELSIF . (primary . 2)) (ELSE . (primary . 2)) (EQUAL_GREATER . (primary . 2)) (RIGHT_PAREN . (primary . 2)) (DIGITS . (primary . 2)) (RANGE . (primary . 2)) (THEN . (primary . 2)) (DOT_DOT . (primary . 2)) (WITH . (primary . 2)) (IS . (primary . 2)) (IN . (primary . 2)) (NOT . (primary . 2)) (EQUAL . (primary . 2)) (GREATER . (primary . 2)) (GREATER_EQUAL . (primary . 2)) (LESS . (primary . 2)) (LESS_EQUAL . (primary . 2)) (SLASH_EQUAL . (primary . 2)) (AND . (primary . 2)) (OR . (primary . 2)) (XOR . (primary . 2)) (PLUS . (primary . 2)) (MINUS . (primary . 2)) (AMPERSAND . (primary . 2)) (SEMICOLON . (primary . 2)) (SLASH . (primary . 2)) (STAR . (primary . 2)) (MOD . (primary . 2)) (REM . (primary . 2)) (STAR_STAR . (primary . 2)) (TICK .  88) (LEFT_PAREN .  106))
      ((default . error) (RIGHT_PAREN . (pragma_argument_association_list . 0)) (COMMA . (pragma_argument_association_list . 0)))
      ((default . error) (COMMA .  363) (RIGHT_PAREN .  364))
      ((default . error) (OF . (factor . 1)) (COLON_EQUAL . (factor . 1)) (DO . (factor . 1)) (LOOP . (factor . 1)) (ELSIF . (factor . 1)) (ELSE . (factor . 1)) (DIGITS . (factor . 1)) (COMMA . (factor . 1)) (RIGHT_PAREN . (factor . 1)) (RANGE . (factor . 1)) (THEN . (factor . 1)) (WITH . (factor . 1)) (BAR . (factor . 1)) (EQUAL_GREATER . (factor . 1)) (IS . (factor . 1)) (SLASH_EQUAL . (factor . 1)) (LESS_EQUAL . (factor . 1)) (LESS . (factor . 1)) (GREATER_EQUAL . (factor . 1)) (GREATER . (factor . 1)) (EQUAL . (factor . 1)) (NOT . (factor . 1)) (IN . (factor . 1)) (AND . (factor . 1)) (OR . (factor . 1)) (XOR . (factor . 1)) (SEMICOLON . (factor . 1)) (REM . (factor . 1)) (MOD . (factor . 1)) (STAR . (factor . 1)) (SLASH . (factor . 1)) (DOT_DOT . (factor . 1)) (AMPERSAND . (factor . 1)) (MINUS . (factor . 1)) (PLUS . (factor . 1)) (STAR_STAR .  362))
      ((default . error) (AND .  361) (DO . (expression . 1)) (LOOP . (expression . 1)) (ELSIF . (expression . 1)) (ELSE . (expression . 1)) (EQUAL_GREATER . (expression . 1)) (DIGITS . (expression . 1)) (COMMA . (expression . 1)) (RIGHT_PAREN . (expression . 1)) (RANGE . (expression . 1)) (THEN . (expression . 1)) (WITH . (expression . 1)) (SEMICOLON . (expression . 1)) (IS . (expression . 1)))
      ((default . error) (AND .  360) (DO . (expression . 2)) (LOOP . (expression . 2)) (ELSIF . (expression . 2)) (ELSE . (expression . 2)) (EQUAL_GREATER . (expression . 2)) (DIGITS . (expression . 2)) (COMMA . (expression . 2)) (RIGHT_PAREN . (expression . 2)) (RANGE . (expression . 2)) (THEN . (expression . 2)) (WITH . (expression . 2)) (SEMICOLON . (expression . 2)) (IS . (expression . 2)))
      ((default . error) (OR .  359) (DO . (expression . 3)) (LOOP . (expression . 3)) (ELSIF . (expression . 3)) (ELSE . (expression . 3)) (EQUAL_GREATER . (expression . 3)) (DIGITS . (expression . 3)) (COMMA . (expression . 3)) (RIGHT_PAREN . (expression . 3)) (RANGE . (expression . 3)) (THEN . (expression . 3)) (WITH . (expression . 3)) (SEMICOLON . (expression . 3)) (IS . (expression . 3)))
      ((default . error) (OR .  358) (DO . (expression . 4)) (LOOP . (expression . 4)) (ELSIF . (expression . 4)) (ELSE . (expression . 4)) (EQUAL_GREATER . (expression . 4)) (DIGITS . (expression . 4)) (COMMA . (expression . 4)) (RIGHT_PAREN . (expression . 4)) (RANGE . (expression . 4)) (THEN . (expression . 4)) (WITH . (expression . 4)) (SEMICOLON . (expression . 4)) (IS . (expression . 4)))
      ((default . error) (XOR .  357) (DO . (expression . 5)) (LOOP . (expression . 5)) (ELSIF . (expression . 5)) (ELSE . (expression . 5)) (EQUAL_GREATER . (expression . 5)) (DIGITS . (expression . 5)) (COMMA . (expression . 5)) (RIGHT_PAREN . (expression . 5)) (RANGE . (expression . 5)) (THEN . (expression . 5)) (WITH . (expression . 5)) (SEMICOLON . (expression . 5)) (IS . (expression . 5)))
      ((default . error) (XOR .  356) (OR .  355) (AND .  354) (DO . (expression . 0)) (LOOP . (expression . 0)) (ELSIF . (expression . 0)) (ELSE . (expression . 0)) (EQUAL_GREATER . (expression . 0)) (DIGITS . (expression . 0)) (COMMA . (expression . 0)) (RIGHT_PAREN . (expression . 0)) (RANGE . (expression . 0)) (THEN . (expression . 0)) (WITH . (expression . 0)) (SEMICOLON . (expression . 0)) (IS . (expression . 0)))
      ((default . error) (IN .  271) (NOT .  272) (DO . (relation . 0)) (LOOP . (relation . 0)) (COMMA . (relation . 0)) (ELSIF . (relation . 0)) (ELSE . (relation . 0)) (EQUAL_GREATER . (relation . 0)) (RIGHT_PAREN . (relation . 0)) (DIGITS . (relation . 0)) (RANGE . (relation . 0)) (THEN . (relation . 0)) (SEMICOLON . (relation . 0)) (WITH . (relation . 0)) (IS . (relation . 0)) (AND . (relation . 0)) (OR . (relation . 0)) (XOR . (relation . 0)) (EQUAL .  265) (SLASH_EQUAL .  270) (LESS .  268) (LESS_EQUAL .  269) (GREATER .  266) (GREATER_EQUAL .  267))
      ((default . error) (OF . (term_list . 0)) (COLON_EQUAL . (term_list . 0)) (DO . (term_list . 0)) (LOOP . (term_list . 0)) (ELSIF . (term_list . 0)) (ELSE . (term_list . 0)) (DIGITS . (term_list . 0)) (COMMA . (term_list . 0)) (RIGHT_PAREN . (term_list . 0)) (RANGE . (term_list . 0)) (THEN . (term_list . 0)) (WITH . (term_list . 0)) (BAR . (term_list . 0)) (EQUAL_GREATER . (term_list . 0)) (IS . (term_list . 0)) (SLASH_EQUAL . (term_list . 0)) (LESS_EQUAL . (term_list . 0)) (LESS . (term_list . 0)) (GREATER_EQUAL . (term_list . 0)) (GREATER . (term_list . 0)) (EQUAL . (term_list . 0)) (NOT . (term_list . 0)) (IN . (term_list . 0)) (AND . (term_list . 0)) (OR . (term_list . 0)) (XOR . (term_list . 0)) (SEMICOLON . (term_list . 0)) (DOT_DOT . (term_list . 0)) (AMPERSAND . (term_list . 0)) (MINUS . (term_list . 0)) (PLUS . (term_list . 0)) (STAR .  349) (SLASH .  348) (MOD .  350) (REM .  351))
      ((default . error) (OF . (simple_expression . 1)) (COLON_EQUAL . (simple_expression . 1)) (DO . (simple_expression . 1)) (LOOP . (simple_expression . 1)) (ELSIF . (simple_expression . 1)) (ELSE . (simple_expression . 1)) (DIGITS . (simple_expression . 1)) (RIGHT_PAREN . (simple_expression . 1)) (COMMA . (simple_expression . 1)) (RANGE . (simple_expression . 1)) (THEN . (simple_expression . 1)) (WITH . (simple_expression . 1)) (BAR . (simple_expression . 1)) (EQUAL_GREATER . (simple_expression . 1)) (IS . (simple_expression . 1)) (IN . (simple_expression . 1)) (NOT . (simple_expression . 1)) (EQUAL . (simple_expression . 1)) (GREATER . (simple_expression . 1)) (GREATER_EQUAL . (simple_expression . 1)) (LESS . (simple_expression . 1)) (LESS_EQUAL . (simple_expression . 1)) (SLASH_EQUAL . (simple_expression . 1)) (AND . (simple_expression . 1)) (OR . (simple_expression . 1)) (XOR . (simple_expression . 1)) (SEMICOLON . (simple_expression . 1)) (DOT_DOT . (simple_expression . 1)) (PLUS .  346) (MINUS .  345) (AMPERSAND .  344))
      ((default . error) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (IS .  342))
      ((default . error) (END . (declarative_part_opt . 0)) (PRIVATE . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (SEMICOLON . (name . 1)) (IS . (name . 1)) (WITH . (name . 1)) (RANGE . (name . 1)) (TICK . (name . 1)) (LEFT_PAREN . (name . 1)) (DOT . (name . 1)) (PLUS . (name . 1)) (MINUS . (name . 1)) (AMPERSAND . (name . 1)) (DOT_DOT . (name . 1)) (IN . (name . 1)) (NOT . (name . 1)) (EQUAL . (name . 1)) (GREATER . (name . 1)) (GREATER_EQUAL . (name . 1)) (LESS . (name . 1)) (LESS_EQUAL . (name . 1)) (SLASH_EQUAL . (name . 1)) (RIGHT_PAREN . (name . 1)) (COMMA . (name . 1)) (SLASH . (name . 1)) (STAR . (name . 1)) (MOD . (name . 1)) (REM . (name . 1)) (STAR_STAR . (name . 1)) (BAR . (name . 1)) (AND . (name . 1)) (OR . (name . 1)) (XOR . (name . 1)) (EQUAL_GREATER . ((name . 1)  287)))
      ((default . error) (NULL .  285) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (BAR . (discrete_choice . 3)) (EQUAL_GREATER . (discrete_choice . 3)))
      ((default . error) (SEMICOLON . (association_list . 0)) (IS . (association_list . 0)) (RIGHT_PAREN . (association_list . 0)) (COMMA . (association_list . 0)))
      ((default . error) (COMMA .  261) (SEMICOLON . (aspect_specification_opt . 1)) (IS . (aspect_specification_opt . 1)))
      ((default . error) (BAR . (discrete_choice . 0)) (EQUAL_GREATER . (discrete_choice . 0)))
      ((default . error) (AND .  284) (EQUAL_GREATER . (choice_expression . 1)) (BAR . (choice_expression . 1)))
      ((default . error) (OR .  283) (EQUAL_GREATER . (choice_expression . 2)) (BAR . (choice_expression . 2)))
      ((default . error) (XOR .  282) (EQUAL_GREATER . (choice_expression . 3)) (BAR . (choice_expression . 3)))
      ((default . error) (AND .  281) (EQUAL_GREATER . (choice_expression . 4)) (BAR . (choice_expression . 4)))
      ((default . error) (OR .  280) (EQUAL_GREATER . (choice_expression . 5)) (BAR . (choice_expression . 5)))
      ((default . error) (XOR .  279) (OR .  278) (AND .  277) (EQUAL_GREATER . (choice_expression . 0)) (BAR . (choice_expression . 0)))
      ((default . error) (EQUAL_GREATER . (discrete_choice_list . 1)) (BAR . (discrete_choice_list . 1)))
      ((default . error) (BAR .  275) (EQUAL_GREATER .  276))
      ((default . error) (LOOP . (expression_opt . 1)) (RIGHT_PAREN . (expression_opt . 1)) (COMMA . (expression_opt . 1)) (SEMICOLON . (expression_opt . 1)) (THEN . (expression_opt . 1)) (IS . (expression_opt . 1)))
      ((default . error) (SEMICOLON . (association_opt . 5)) (IS . (association_opt . 5)) (COMMA . (association_opt . 5)) (RIGHT_PAREN . (association_opt . 5)))
      ((default . error) (DOT .  87) (DO . (primary . 2)) (LOOP . (primary . 2)) (ELSIF . (primary . 2)) (ELSE . (primary . 2)) (DIGITS . (primary . 2)) (RANGE . (primary . 2)) (THEN . (primary . 2)) (SEMICOLON . (primary . 2)) (IS . (primary . 2)) (WITH . (primary . 2)) (IN . (primary . 2)) (NOT . (primary . 2)) (RIGHT_PAREN . (primary . 2)) (COMMA . (primary . 2)) (PLUS . (primary . 2)) (MINUS . (primary . 2)) (AMPERSAND . (primary . 2)) (DOT_DOT . (primary . 2)) (SLASH . (primary . 2)) (STAR . (primary . 2)) (MOD . (primary . 2)) (REM . (primary . 2)) (STAR_STAR . (primary . 2)) (BAR . (primary . 2)) (EQUAL_GREATER . (primary . 2)) (EQUAL . (primary . 2)) (GREATER . (primary . 2)) (GREATER_EQUAL . (primary . 2)) (LESS . (primary . 2)) (LESS_EQUAL . (primary . 2)) (SLASH_EQUAL . (primary . 2)) (AND . (primary . 2)) (OR . (primary . 2)) (XOR . (primary . 2)) (TICK .  274) (LEFT_PAREN .  106))
      ((default . error) (BAR . (discrete_choice . 2)) (EQUAL_GREATER . (discrete_choice . 2)))
      ((default . error) (IN .  271) (NOT .  272) (SEMICOLON . (relation . 0)) (IS . (relation . 0)) (WITH . (relation . 0)) (RIGHT_PAREN . (relation . 0)) (COMMA . (relation . 0)) (DOT_DOT .  264) (BAR . (choice_relation . 1)) (EQUAL_GREATER . (choice_relation . 1)) (AND . ((relation . 0) (choice_relation . 1))) (OR . ((relation . 0) (choice_relation . 1))) (XOR . ((relation . 0) (choice_relation . 1))) (EQUAL .  265) (SLASH_EQUAL .  270) (LESS .  268) (LESS_EQUAL .  269) (GREATER .  266) (GREATER_EQUAL .  267))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (COMMA .  261) (RIGHT_PAREN .  262))
      ((default . error) (BAR . (discrete_choice . 2)) (EQUAL_GREATER . (discrete_choice . 2)) (RIGHT_PAREN .  260))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (COMMA .  119) (SEMICOLON .  258))
      ((default . error) ($EOI . (with_clause . 1)) (FUNCTION . (with_clause . 1)) (GENERIC . (with_clause . 1)) (LIMITED . (with_clause . 1)) (NOT . (with_clause . 1)) (OVERRIDING . (with_clause . 1)) (PACKAGE . (with_clause . 1)) (PRAGMA . (with_clause . 1)) (PRIVATE . (with_clause . 1)) (PROCEDURE . (with_clause . 1)) (SEPARATE . (with_clause . 1)) (USE . (with_clause . 1)) (WITH . (with_clause . 1)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (BOX .  251) (SEMICOLON . (discriminant_specification_opt . 0)) (RIGHT_PAREN . (discriminant_specification_opt . 0)) (IDENTIFIER .  72))
      ((default . error) (IS .  249) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (ABSTRACT .  245) (BOX .  244) (NULL .  246) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (SEMICOLON .  243))
      ((default . error) (DOT .  87) (TICK .  88) (IS .  242) (LEFT_PAREN .  106))
      ((default . error) (COLON . (identifier_list . 1)) (COMMA . (identifier_list . 1)))
      ((default . error) (OUT .  241) (ACCESS . (mode_opt . 1)) (NOT . (mode_opt . 1)) (IDENTIFIER . (mode_opt . 1)) (STRING_LITERAL . (mode_opt . 1)) (CHARACTER_LITERAL . (mode_opt . 1)))
      ((default . error) (ACCESS . (mode_opt . 3)) (NOT . (mode_opt . 3)) (IDENTIFIER . (mode_opt . 3)) (STRING_LITERAL . (mode_opt . 3)) (CHARACTER_LITERAL . (mode_opt . 3)))
      ((default . error) (IDENTIFIER . (null_exclusion_opt . 0)) (STRING_LITERAL . (null_exclusion_opt . 0)) (CHARACTER_LITERAL . (null_exclusion_opt . 0)) (ACCESS . (null_exclusion_opt . 0)) (NOT .  208))
      ((default . error) (IDENTIFIER . (null_exclusion_opt . 0)) (STRING_LITERAL . (null_exclusion_opt . 0)) (CHARACTER_LITERAL . (null_exclusion_opt . 0)) (RIGHT_PAREN . (null_exclusion_opt . 0)) (DO . (null_exclusion_opt . 0)) (RENAMES . (null_exclusion_opt . 0)) (COLON_EQUAL . (null_exclusion_opt . 0)) (WITH . (null_exclusion_opt . 0)) (SEMICOLON . (null_exclusion_opt . 0)) (IS . (null_exclusion_opt . 0)) (ACCESS . (null_exclusion_opt . 0)) (NOT .  208))
      ((default . error) (NULL .  236))
      ((default . error) (RIGHT_PAREN . (parameter_and_result_profile . 3)) (DO . (parameter_and_result_profile . 3)) (RENAMES . (parameter_and_result_profile . 3)) (COLON_EQUAL . (parameter_and_result_profile . 3)) (WITH . (parameter_and_result_profile . 3)) (SEMICOLON . (parameter_and_result_profile . 3)) (IS . (parameter_and_result_profile . 3)))
      ((default . error) (DOT .  87) (RIGHT_PAREN . (name_opt . 1)) (DO . (name_opt . 1)) (RENAMES . (name_opt . 1)) (COLON_EQUAL . (name_opt . 1)) (WITH . (name_opt . 1)) (IS . (name_opt . 1)) (SEMICOLON . (name_opt . 1)) (TICK .  88) (LEFT_PAREN .  106))
      ((default . error) (RIGHT_PAREN . (parameter_and_result_profile . 1)) (DO . (parameter_and_result_profile . 1)) (RENAMES . (parameter_and_result_profile . 1)) (COLON_EQUAL . (parameter_and_result_profile . 1)) (WITH . (parameter_and_result_profile . 1)) (SEMICOLON . (parameter_and_result_profile . 1)) (IS . (parameter_and_result_profile . 1)))
      ((default . error) (ACCESS .  235))
      ((default . error) (IN . (name . 0)) (NOT . (name . 0)) (EQUAL . (name . 0)) (GREATER . (name . 0)) (GREATER_EQUAL . (name . 0)) (LESS . (name . 0)) (LESS_EQUAL . (name . 0)) (SLASH_EQUAL . (name . 0)) (BAR . (name . 0)) (EQUAL_GREATER . (name . 0)) (AND . (name . 0)) (OR . (name . 0)) (XOR . (name . 0)) (RIGHT_PAREN . (name . 0)) (LEFT_PAREN . (name . 0)) (RANGE . (name . 0)) (TICK . (name . 0)) (DOT . (name . 0)) (PLUS . (name . 0)) (MINUS . (name . 0)) (AMPERSAND . (name . 0)) (DOT_DOT . (name . 0)) (SLASH . (name . 0)) (STAR . (name . 0)) (MOD . (name . 0)) (REM . (name . 0)) (STAR_STAR . (name . 0)) (COLON . (identifier_list . 0)) (COMMA . ((name . 0) (identifier_list . 0))))
      ((default . error) (COLON .  234) (COMMA .  95))
      ((default . error) (RIGHT_PAREN . (parameter_specification_list . 0)) (SEMICOLON . (parameter_specification_list . 0)))
      ((default . error) (SEMICOLON .  232) (RIGHT_PAREN .  233))
      ((default . error) (DO . (attribute_designator . 1)) (ELSIF . (attribute_designator . 1)) (ELSE . (attribute_designator . 1)) (DIGITS . (attribute_designator . 1)) (RANGE . (attribute_designator . 1)) (THEN . (attribute_designator . 1)) (USE . (attribute_designator . 1)) (COLON_EQUAL . (attribute_designator . 1)) (WHILE . (attribute_designator . 1)) (SELECT . (attribute_designator . 1)) (REQUEUE . (attribute_designator . 1)) (RAISE . (attribute_designator . 1)) (PRAGMA . (attribute_designator . 1)) (NULL . (attribute_designator . 1)) (LOOP . (attribute_designator . 1)) (IF . (attribute_designator . 1)) (GOTO . (attribute_designator . 1)) (FOR . (attribute_designator . 1)) (EXIT . (attribute_designator . 1)) (DELAY . (attribute_designator . 1)) (DECLARE . (attribute_designator . 1)) (CASE . (attribute_designator . 1)) (BEGIN . (attribute_designator . 1)) (ABORT . (attribute_designator . 1)) (ACCEPT . (attribute_designator . 1)) (CHARACTER_LITERAL . (attribute_designator . 1)) (STRING_LITERAL . (attribute_designator . 1)) (IDENTIFIER . (attribute_designator . 1)) (LESS_LESS . (attribute_designator . 1)) (OF . (attribute_designator . 1)) (IN . (attribute_designator . 1)) (NOT . (attribute_designator . 1)) (RIGHT_PAREN . (attribute_designator . 1)) (PLUS . (attribute_designator . 1)) (MINUS . (attribute_designator . 1)) (AMPERSAND . (attribute_designator . 1)) (DOT_DOT . (attribute_designator . 1)) (SLASH . (attribute_designator . 1)) (STAR . (attribute_designator . 1)) (MOD . (attribute_designator . 1)) (REM . (attribute_designator . 1)) (STAR_STAR . (attribute_designator . 1)) (BAR . (attribute_designator . 1)) (EQUAL_GREATER . (attribute_designator . 1)) (EQUAL . (attribute_designator . 1)) (GREATER . (attribute_designator . 1)) (GREATER_EQUAL . (attribute_designator . 1)) (LESS . (attribute_designator . 1)) (LESS_EQUAL . (attribute_designator . 1)) (SLASH_EQUAL . (attribute_designator . 1)) (AND . (attribute_designator . 1)) (OR . (attribute_designator . 1)) (XOR . (attribute_designator . 1)) (LEFT_PAREN . (attribute_designator . 1)) (SEMICOLON . (attribute_designator . 1)) (COMMA . (attribute_designator . 1)) (DOT . (attribute_designator . 1)) (TICK . (attribute_designator . 1)) (WITH . (attribute_designator . 1)) (IS . (attribute_designator . 1)) (RENAMES . (attribute_designator . 1)) (RETURN . (attribute_designator . 1)))
      ((default . error) (DO . (attribute_designator . 2)) (ELSIF . (attribute_designator . 2)) (ELSE . (attribute_designator . 2)) (DIGITS . (attribute_designator . 2)) (RANGE . (attribute_designator . 2)) (THEN . (attribute_designator . 2)) (USE . (attribute_designator . 2)) (COLON_EQUAL . (attribute_designator . 2)) (WHILE . (attribute_designator . 2)) (SELECT . (attribute_designator . 2)) (REQUEUE . (attribute_designator . 2)) (RAISE . (attribute_designator . 2)) (PRAGMA . (attribute_designator . 2)) (NULL . (attribute_designator . 2)) (LOOP . (attribute_designator . 2)) (IF . (attribute_designator . 2)) (GOTO . (attribute_designator . 2)) (FOR . (attribute_designator . 2)) (EXIT . (attribute_designator . 2)) (DELAY . (attribute_designator . 2)) (DECLARE . (attribute_designator . 2)) (CASE . (attribute_designator . 2)) (BEGIN . (attribute_designator . 2)) (ABORT . (attribute_designator . 2)) (ACCEPT . (attribute_designator . 2)) (CHARACTER_LITERAL . (attribute_designator . 2)) (STRING_LITERAL . (attribute_designator . 2)) (IDENTIFIER . (attribute_designator . 2)) (LESS_LESS . (attribute_designator . 2)) (OF . (attribute_designator . 2)) (IN . (attribute_designator . 2)) (NOT . (attribute_designator . 2)) (RIGHT_PAREN . (attribute_designator . 2)) (PLUS . (attribute_designator . 2)) (MINUS . (attribute_designator . 2)) (AMPERSAND . (attribute_designator . 2)) (DOT_DOT . (attribute_designator . 2)) (SLASH . (attribute_designator . 2)) (STAR . (attribute_designator . 2)) (MOD . (attribute_designator . 2)) (REM . (attribute_designator . 2)) (STAR_STAR . (attribute_designator . 2)) (BAR . (attribute_designator . 2)) (EQUAL_GREATER . (attribute_designator . 2)) (EQUAL . (attribute_designator . 2)) (GREATER . (attribute_designator . 2)) (GREATER_EQUAL . (attribute_designator . 2)) (LESS . (attribute_designator . 2)) (LESS_EQUAL . (attribute_designator . 2)) (SLASH_EQUAL . (attribute_designator . 2)) (AND . (attribute_designator . 2)) (OR . (attribute_designator . 2)) (XOR . (attribute_designator . 2)) (LEFT_PAREN . (attribute_designator . 2)) (SEMICOLON . (attribute_designator . 2)) (COMMA . (attribute_designator . 2)) (DOT . (attribute_designator . 2)) (TICK . (attribute_designator . 2)) (WITH . (attribute_designator . 2)) (IS . (attribute_designator . 2)) (RENAMES . (attribute_designator . 2)) (RETURN . (attribute_designator . 2)))
      ((default . error) (DO . (attribute_designator . 3)) (ELSIF . (attribute_designator . 3)) (ELSE . (attribute_designator . 3)) (DIGITS . (attribute_designator . 3)) (RANGE . (attribute_designator . 3)) (THEN . (attribute_designator . 3)) (USE . (attribute_designator . 3)) (COLON_EQUAL . (attribute_designator . 3)) (WHILE . (attribute_designator . 3)) (SELECT . (attribute_designator . 3)) (REQUEUE . (attribute_designator . 3)) (RAISE . (attribute_designator . 3)) (PRAGMA . (attribute_designator . 3)) (NULL . (attribute_designator . 3)) (LOOP . (attribute_designator . 3)) (IF . (attribute_designator . 3)) (GOTO . (attribute_designator . 3)) (FOR . (attribute_designator . 3)) (EXIT . (attribute_designator . 3)) (DELAY . (attribute_designator . 3)) (DECLARE . (attribute_designator . 3)) (CASE . (attribute_designator . 3)) (BEGIN . (attribute_designator . 3)) (ABORT . (attribute_designator . 3)) (ACCEPT . (attribute_designator . 3)) (CHARACTER_LITERAL . (attribute_designator . 3)) (STRING_LITERAL . (attribute_designator . 3)) (IDENTIFIER . (attribute_designator . 3)) (LESS_LESS . (attribute_designator . 3)) (OF . (attribute_designator . 3)) (IN . (attribute_designator . 3)) (NOT . (attribute_designator . 3)) (RIGHT_PAREN . (attribute_designator . 3)) (PLUS . (attribute_designator . 3)) (MINUS . (attribute_designator . 3)) (AMPERSAND . (attribute_designator . 3)) (DOT_DOT . (attribute_designator . 3)) (SLASH . (attribute_designator . 3)) (STAR . (attribute_designator . 3)) (MOD . (attribute_designator . 3)) (REM . (attribute_designator . 3)) (STAR_STAR . (attribute_designator . 3)) (BAR . (attribute_designator . 3)) (EQUAL_GREATER . (attribute_designator . 3)) (EQUAL . (attribute_designator . 3)) (GREATER . (attribute_designator . 3)) (GREATER_EQUAL . (attribute_designator . 3)) (LESS . (attribute_designator . 3)) (LESS_EQUAL . (attribute_designator . 3)) (SLASH_EQUAL . (attribute_designator . 3)) (AND . (attribute_designator . 3)) (OR . (attribute_designator . 3)) (XOR . (attribute_designator . 3)) (LEFT_PAREN . (attribute_designator . 3)) (SEMICOLON . (attribute_designator . 3)) (COMMA . (attribute_designator . 3)) (DOT . (attribute_designator . 3)) (TICK . (attribute_designator . 3)) (WITH . (attribute_designator . 3)) (IS . (attribute_designator . 3)) (RENAMES . (attribute_designator . 3)) (RETURN . (attribute_designator . 3)))
      ((default . error) (RIGHT_PAREN . ((association_opt . 0) (expression_opt . 0))) (COMMA . ((association_opt . 0) (expression_opt . 0))) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (PLUS .  144) (MINUS .  143) (OTHERS .  172) (ABS .  146) (NOT .  171) (IDENTIFIER .  48) (CHARACTER_LITERAL .  170) (STRING_LITERAL .  49) (NULL .  229) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (DO . (attribute_designator . 4)) (ELSIF . (attribute_designator . 4)) (ELSE . (attribute_designator . 4)) (DIGITS . (attribute_designator . 4)) (RANGE . (attribute_designator . 4)) (THEN . (attribute_designator . 4)) (USE . (attribute_designator . 4)) (COLON_EQUAL . (attribute_designator . 4)) (WHILE . (attribute_designator . 4)) (SELECT . (attribute_designator . 4)) (REQUEUE . (attribute_designator . 4)) (RAISE . (attribute_designator . 4)) (PRAGMA . (attribute_designator . 4)) (NULL . (attribute_designator . 4)) (LOOP . (attribute_designator . 4)) (IF . (attribute_designator . 4)) (GOTO . (attribute_designator . 4)) (FOR . (attribute_designator . 4)) (EXIT . (attribute_designator . 4)) (DELAY . (attribute_designator . 4)) (DECLARE . (attribute_designator . 4)) (CASE . (attribute_designator . 4)) (BEGIN . (attribute_designator . 4)) (ABORT . (attribute_designator . 4)) (ACCEPT . (attribute_designator . 4)) (CHARACTER_LITERAL . (attribute_designator . 4)) (STRING_LITERAL . (attribute_designator . 4)) (IDENTIFIER . (attribute_designator . 4)) (LESS_LESS . (attribute_designator . 4)) (OF . (attribute_designator . 4)) (IN . (attribute_designator . 4)) (NOT . (attribute_designator . 4)) (RIGHT_PAREN . (attribute_designator . 4)) (PLUS . (attribute_designator . 4)) (MINUS . (attribute_designator . 4)) (AMPERSAND . (attribute_designator . 4)) (DOT_DOT . (attribute_designator . 4)) (SLASH . (attribute_designator . 4)) (STAR . (attribute_designator . 4)) (MOD . (attribute_designator . 4)) (REM . (attribute_designator . 4)) (STAR_STAR . (attribute_designator . 4)) (BAR . (attribute_designator . 4)) (EQUAL_GREATER . (attribute_designator . 4)) (EQUAL . (attribute_designator . 4)) (GREATER . (attribute_designator . 4)) (GREATER_EQUAL . (attribute_designator . 4)) (LESS . (attribute_designator . 4)) (LESS_EQUAL . (attribute_designator . 4)) (SLASH_EQUAL . (attribute_designator . 4)) (AND . (attribute_designator . 4)) (OR . (attribute_designator . 4)) (XOR . (attribute_designator . 4)) (LEFT_PAREN . (attribute_designator . 4)) (SEMICOLON . (attribute_designator . 4)) (COMMA . (attribute_designator . 4)) (DOT . (attribute_designator . 4)) (TICK . (attribute_designator . 4)) (WITH . (attribute_designator . 4)) (IS . (attribute_designator . 4)) (RENAMES . (attribute_designator . 4)) (RETURN . (attribute_designator . 4)))
      ((default . error) (DO . (qualified_expression . 0)) (ELSIF . (qualified_expression . 0)) (ELSE . (qualified_expression . 0)) (DIGITS . (qualified_expression . 0)) (RANGE . (qualified_expression . 0)) (THEN . (qualified_expression . 0)) (USE . (qualified_expression . 0)) (COLON_EQUAL . (qualified_expression . 0)) (WHILE . (qualified_expression . 0)) (SELECT . (qualified_expression . 0)) (REQUEUE . (qualified_expression . 0)) (RAISE . (qualified_expression . 0)) (PRAGMA . (qualified_expression . 0)) (NULL . (qualified_expression . 0)) (LOOP . (qualified_expression . 0)) (IF . (qualified_expression . 0)) (GOTO . (qualified_expression . 0)) (FOR . (qualified_expression . 0)) (EXIT . (qualified_expression . 0)) (DELAY . (qualified_expression . 0)) (DECLARE . (qualified_expression . 0)) (CASE . (qualified_expression . 0)) (BEGIN . (qualified_expression . 0)) (ABORT . (qualified_expression . 0)) (ACCEPT . (qualified_expression . 0)) (CHARACTER_LITERAL . (qualified_expression . 0)) (STRING_LITERAL . (qualified_expression . 0)) (IDENTIFIER . (qualified_expression . 0)) (LESS_LESS . (qualified_expression . 0)) (OF . (qualified_expression . 0)) (IN . (qualified_expression . 0)) (NOT . (qualified_expression . 0)) (RIGHT_PAREN . (qualified_expression . 0)) (PLUS . (qualified_expression . 0)) (MINUS . (qualified_expression . 0)) (AMPERSAND . (qualified_expression . 0)) (DOT_DOT . (qualified_expression . 0)) (SLASH . (qualified_expression . 0)) (STAR . (qualified_expression . 0)) (MOD . (qualified_expression . 0)) (REM . (qualified_expression . 0)) (STAR_STAR . (qualified_expression . 0)) (BAR . (qualified_expression . 0)) (EQUAL_GREATER . (qualified_expression . 0)) (EQUAL . (qualified_expression . 0)) (GREATER . (qualified_expression . 0)) (GREATER_EQUAL . (qualified_expression . 0)) (LESS . (qualified_expression . 0)) (LESS_EQUAL . (qualified_expression . 0)) (SLASH_EQUAL . (qualified_expression . 0)) (AND . (qualified_expression . 0)) (OR . (qualified_expression . 0)) (XOR . (qualified_expression . 0)) (SEMICOLON . (qualified_expression . 0)) (COMMA . (qualified_expression . 0)) (LEFT_PAREN . (qualified_expression . 0)) (DOT . (qualified_expression . 0)) (TICK . (qualified_expression . 0)) (WITH . (qualified_expression . 0)) (IS . (qualified_expression . 0)) (RENAMES . (qualified_expression . 0)) (RETURN . (qualified_expression . 0)))
      ((default . error) (DO . (attribute_reference . 0)) (ELSIF . (attribute_reference . 0)) (ELSE . (attribute_reference . 0)) (DIGITS . (attribute_reference . 0)) (RANGE . (attribute_reference . 0)) (THEN . (attribute_reference . 0)) (USE . (attribute_reference . 0)) (COLON_EQUAL . (attribute_reference . 0)) (WHILE . (attribute_reference . 0)) (SELECT . (attribute_reference . 0)) (REQUEUE . (attribute_reference . 0)) (RAISE . (attribute_reference . 0)) (PRAGMA . (attribute_reference . 0)) (NULL . (attribute_reference . 0)) (LOOP . (attribute_reference . 0)) (IF . (attribute_reference . 0)) (GOTO . (attribute_reference . 0)) (FOR . (attribute_reference . 0)) (EXIT . (attribute_reference . 0)) (DELAY . (attribute_reference . 0)) (DECLARE . (attribute_reference . 0)) (CASE . (attribute_reference . 0)) (BEGIN . (attribute_reference . 0)) (ABORT . (attribute_reference . 0)) (ACCEPT . (attribute_reference . 0)) (CHARACTER_LITERAL . (attribute_reference . 0)) (STRING_LITERAL . (attribute_reference . 0)) (IDENTIFIER . (attribute_reference . 0)) (LESS_LESS . (attribute_reference . 0)) (OF . (attribute_reference . 0)) (IN . (attribute_reference . 0)) (NOT . (attribute_reference . 0)) (RIGHT_PAREN . (attribute_reference . 0)) (PLUS . (attribute_reference . 0)) (MINUS . (attribute_reference . 0)) (AMPERSAND . (attribute_reference . 0)) (DOT_DOT . (attribute_reference . 0)) (SLASH . (attribute_reference . 0)) (STAR . (attribute_reference . 0)) (MOD . (attribute_reference . 0)) (REM . (attribute_reference . 0)) (STAR_STAR . (attribute_reference . 0)) (BAR . (attribute_reference . 0)) (EQUAL_GREATER . (attribute_reference . 0)) (EQUAL . (attribute_reference . 0)) (GREATER . (attribute_reference . 0)) (GREATER_EQUAL . (attribute_reference . 0)) (LESS . (attribute_reference . 0)) (LESS_EQUAL . (attribute_reference . 0)) (SLASH_EQUAL . (attribute_reference . 0)) (AND . (attribute_reference . 0)) (OR . (attribute_reference . 0)) (XOR . (attribute_reference . 0)) (LEFT_PAREN . (attribute_reference . 0)) (SEMICOLON . (attribute_reference . 0)) (COMMA . (attribute_reference . 0)) (DOT . (attribute_reference . 0)) (TICK . (attribute_reference . 0)) (WITH . (attribute_reference . 0)) (IS . (attribute_reference . 0)) (RENAMES . (attribute_reference . 0)) (RETURN . (attribute_reference . 0)))
      ((default . error) (DO . (attribute_designator . 0)) (ELSIF . (attribute_designator . 0)) (ELSE . (attribute_designator . 0)) (DIGITS . (attribute_designator . 0)) (RANGE . (attribute_designator . 0)) (THEN . (attribute_designator . 0)) (USE . (attribute_designator . 0)) (COLON_EQUAL . (attribute_designator . 0)) (WHILE . (attribute_designator . 0)) (SELECT . (attribute_designator . 0)) (REQUEUE . (attribute_designator . 0)) (RAISE . (attribute_designator . 0)) (PRAGMA . (attribute_designator . 0)) (NULL . (attribute_designator . 0)) (LOOP . (attribute_designator . 0)) (IF . (attribute_designator . 0)) (GOTO . (attribute_designator . 0)) (FOR . (attribute_designator . 0)) (EXIT . (attribute_designator . 0)) (DELAY . (attribute_designator . 0)) (DECLARE . (attribute_designator . 0)) (CASE . (attribute_designator . 0)) (BEGIN . (attribute_designator . 0)) (ABORT . (attribute_designator . 0)) (ACCEPT . (attribute_designator . 0)) (CHARACTER_LITERAL . (attribute_designator . 0)) (STRING_LITERAL . (attribute_designator . 0)) (IDENTIFIER . (attribute_designator . 0)) (LESS_LESS . (attribute_designator . 0)) (OF . (attribute_designator . 0)) (IN . (attribute_designator . 0)) (NOT . (attribute_designator . 0)) (RIGHT_PAREN . (attribute_designator . 0)) (PLUS . (attribute_designator . 0)) (MINUS . (attribute_designator . 0)) (AMPERSAND . (attribute_designator . 0)) (DOT_DOT . (attribute_designator . 0)) (SLASH . (attribute_designator . 0)) (STAR . (attribute_designator . 0)) (MOD . (attribute_designator . 0)) (REM . (attribute_designator . 0)) (STAR_STAR . (attribute_designator . 0)) (BAR . (attribute_designator . 0)) (EQUAL_GREATER . (attribute_designator . 0)) (EQUAL . (attribute_designator . 0)) (GREATER . (attribute_designator . 0)) (GREATER_EQUAL . (attribute_designator . 0)) (LESS . (attribute_designator . 0)) (LESS_EQUAL . (attribute_designator . 0)) (SLASH_EQUAL . (attribute_designator . 0)) (AND . (attribute_designator . 0)) (OR . (attribute_designator . 0)) (XOR . (attribute_designator . 0)) (SEMICOLON . (attribute_designator . 0)) (COMMA . (attribute_designator . 0)) (DOT . ( 87 (attribute_designator . 0))) (WITH . (attribute_designator . 0)) (IS . (attribute_designator . 0)) (RENAMES . (attribute_designator . 0)) (RETURN . (attribute_designator . 0)) (TICK . ( 88 (attribute_designator . 0)  88)) (LEFT_PAREN . ( 106 (attribute_designator . 0)  106)))
      ((default . error) (DO . (selected_component . 0)) (RIGHT_PAREN . (selected_component . 0)) (BAR . (selected_component . 0)) (ELSIF . (selected_component . 0)) (ELSE . (selected_component . 0)) (EQUAL_GREATER . (selected_component . 0)) (DIGITS . (selected_component . 0)) (RANGE . (selected_component . 0)) (THEN . (selected_component . 0)) (DOT_DOT . (selected_component . 0)) (IN . (selected_component . 0)) (NOT . (selected_component . 0)) (EQUAL . (selected_component . 0)) (GREATER . (selected_component . 0)) (GREATER_EQUAL . (selected_component . 0)) (LESS . (selected_component . 0)) (LESS_EQUAL . (selected_component . 0)) (SLASH_EQUAL . (selected_component . 0)) (AND . (selected_component . 0)) (OR . (selected_component . 0)) (XOR . (selected_component . 0)) (PLUS . (selected_component . 0)) (MINUS . (selected_component . 0)) (AMPERSAND . (selected_component . 0)) (SLASH . (selected_component . 0)) (STAR . (selected_component . 0)) (MOD . (selected_component . 0)) (REM . (selected_component . 0)) (STAR_STAR . (selected_component . 0)) (USE . (selected_component . 0)) (COLON_EQUAL . (selected_component . 0)) (WHILE . (selected_component . 0)) (SELECT . (selected_component . 0)) (REQUEUE . (selected_component . 0)) (RAISE . (selected_component . 0)) (PRAGMA . (selected_component . 0)) (NULL . (selected_component . 0)) (LOOP . (selected_component . 0)) (IF . (selected_component . 0)) (GOTO . (selected_component . 0)) (FOR . (selected_component . 0)) (EXIT . (selected_component . 0)) (DELAY . (selected_component . 0)) (DECLARE . (selected_component . 0)) (CASE . (selected_component . 0)) (BEGIN . (selected_component . 0)) (ABORT . (selected_component . 0)) (ACCEPT . (selected_component . 0)) (CHARACTER_LITERAL . (selected_component . 0)) (STRING_LITERAL . (selected_component . 0)) (IDENTIFIER . (selected_component . 0)) (LESS_LESS . (selected_component . 0)) (OF . (selected_component . 0)) (LEFT_PAREN . (selected_component . 0)) (SEMICOLON . (selected_component . 0)) (COMMA . (selected_component . 0)) (DOT . (selected_component . 0)) (TICK . (selected_component . 0)) (WITH . (selected_component . 0)) (IS . (selected_component . 0)) (RENAMES . (selected_component . 0)) (RETURN . (selected_component . 0)))
      ((default . error) (DO . (selected_component . 2)) (RIGHT_PAREN . (selected_component . 2)) (BAR . (selected_component . 2)) (ELSIF . (selected_component . 2)) (ELSE . (selected_component . 2)) (EQUAL_GREATER . (selected_component . 2)) (DIGITS . (selected_component . 2)) (RANGE . (selected_component . 2)) (THEN . (selected_component . 2)) (DOT_DOT . (selected_component . 2)) (IN . (selected_component . 2)) (NOT . (selected_component . 2)) (EQUAL . (selected_component . 2)) (GREATER . (selected_component . 2)) (GREATER_EQUAL . (selected_component . 2)) (LESS . (selected_component . 2)) (LESS_EQUAL . (selected_component . 2)) (SLASH_EQUAL . (selected_component . 2)) (AND . (selected_component . 2)) (OR . (selected_component . 2)) (XOR . (selected_component . 2)) (PLUS . (selected_component . 2)) (MINUS . (selected_component . 2)) (AMPERSAND . (selected_component . 2)) (SLASH . (selected_component . 2)) (STAR . (selected_component . 2)) (MOD . (selected_component . 2)) (REM . (selected_component . 2)) (STAR_STAR . (selected_component . 2)) (USE . (selected_component . 2)) (COLON_EQUAL . (selected_component . 2)) (WHILE . (selected_component . 2)) (SELECT . (selected_component . 2)) (REQUEUE . (selected_component . 2)) (RAISE . (selected_component . 2)) (PRAGMA . (selected_component . 2)) (NULL . (selected_component . 2)) (LOOP . (selected_component . 2)) (IF . (selected_component . 2)) (GOTO . (selected_component . 2)) (FOR . (selected_component . 2)) (EXIT . (selected_component . 2)) (DELAY . (selected_component . 2)) (DECLARE . (selected_component . 2)) (CASE . (selected_component . 2)) (BEGIN . (selected_component . 2)) (ABORT . (selected_component . 2)) (ACCEPT . (selected_component . 2)) (CHARACTER_LITERAL . (selected_component . 2)) (STRING_LITERAL . (selected_component . 2)) (IDENTIFIER . (selected_component . 2)) (LESS_LESS . (selected_component . 2)) (OF . (selected_component . 2)) (LEFT_PAREN . (selected_component . 2)) (SEMICOLON . (selected_component . 2)) (COMMA . (selected_component . 2)) (DOT . (selected_component . 2)) (TICK . (selected_component . 2)) (WITH . (selected_component . 2)) (IS . (selected_component . 2)) (RENAMES . (selected_component . 2)) (RETURN . (selected_component . 2)))
      ((default . error) (DO . (selected_component . 1)) (RIGHT_PAREN . (selected_component . 1)) (BAR . (selected_component . 1)) (ELSIF . (selected_component . 1)) (ELSE . (selected_component . 1)) (EQUAL_GREATER . (selected_component . 1)) (DIGITS . (selected_component . 1)) (RANGE . (selected_component . 1)) (THEN . (selected_component . 1)) (DOT_DOT . (selected_component . 1)) (IN . (selected_component . 1)) (NOT . (selected_component . 1)) (EQUAL . (selected_component . 1)) (GREATER . (selected_component . 1)) (GREATER_EQUAL . (selected_component . 1)) (LESS . (selected_component . 1)) (LESS_EQUAL . (selected_component . 1)) (SLASH_EQUAL . (selected_component . 1)) (AND . (selected_component . 1)) (OR . (selected_component . 1)) (XOR . (selected_component . 1)) (PLUS . (selected_component . 1)) (MINUS . (selected_component . 1)) (AMPERSAND . (selected_component . 1)) (SLASH . (selected_component . 1)) (STAR . (selected_component . 1)) (MOD . (selected_component . 1)) (REM . (selected_component . 1)) (STAR_STAR . (selected_component . 1)) (USE . (selected_component . 1)) (COLON_EQUAL . (selected_component . 1)) (WHILE . (selected_component . 1)) (SELECT . (selected_component . 1)) (REQUEUE . (selected_component . 1)) (RAISE . (selected_component . 1)) (PRAGMA . (selected_component . 1)) (NULL . (selected_component . 1)) (LOOP . (selected_component . 1)) (IF . (selected_component . 1)) (GOTO . (selected_component . 1)) (FOR . (selected_component . 1)) (EXIT . (selected_component . 1)) (DELAY . (selected_component . 1)) (DECLARE . (selected_component . 1)) (CASE . (selected_component . 1)) (BEGIN . (selected_component . 1)) (ABORT . (selected_component . 1)) (ACCEPT . (selected_component . 1)) (CHARACTER_LITERAL . (selected_component . 1)) (STRING_LITERAL . (selected_component . 1)) (IDENTIFIER . (selected_component . 1)) (LESS_LESS . (selected_component . 1)) (OF . (selected_component . 1)) (LEFT_PAREN . (selected_component . 1)) (SEMICOLON . (selected_component . 1)) (COMMA . (selected_component . 1)) (DOT . (selected_component . 1)) (TICK . (selected_component . 1)) (WITH . (selected_component . 1)) (IS . (selected_component . 1)) (RENAMES . (selected_component . 1)) (RETURN . (selected_component . 1)))
      ((default . error) (DO . (selected_component . 3)) (RIGHT_PAREN . (selected_component . 3)) (BAR . (selected_component . 3)) (ELSIF . (selected_component . 3)) (ELSE . (selected_component . 3)) (EQUAL_GREATER . (selected_component . 3)) (DIGITS . (selected_component . 3)) (RANGE . (selected_component . 3)) (THEN . (selected_component . 3)) (DOT_DOT . (selected_component . 3)) (IN . (selected_component . 3)) (NOT . (selected_component . 3)) (EQUAL . (selected_component . 3)) (GREATER . (selected_component . 3)) (GREATER_EQUAL . (selected_component . 3)) (LESS . (selected_component . 3)) (LESS_EQUAL . (selected_component . 3)) (SLASH_EQUAL . (selected_component . 3)) (AND . (selected_component . 3)) (OR . (selected_component . 3)) (XOR . (selected_component . 3)) (PLUS . (selected_component . 3)) (MINUS . (selected_component . 3)) (AMPERSAND . (selected_component . 3)) (SLASH . (selected_component . 3)) (STAR . (selected_component . 3)) (MOD . (selected_component . 3)) (REM . (selected_component . 3)) (STAR_STAR . (selected_component . 3)) (USE . (selected_component . 3)) (COLON_EQUAL . (selected_component . 3)) (WHILE . (selected_component . 3)) (SELECT . (selected_component . 3)) (REQUEUE . (selected_component . 3)) (RAISE . (selected_component . 3)) (PRAGMA . (selected_component . 3)) (NULL . (selected_component . 3)) (LOOP . (selected_component . 3)) (IF . (selected_component . 3)) (GOTO . (selected_component . 3)) (FOR . (selected_component . 3)) (EXIT . (selected_component . 3)) (DELAY . (selected_component . 3)) (DECLARE . (selected_component . 3)) (CASE . (selected_component . 3)) (BEGIN . (selected_component . 3)) (ABORT . (selected_component . 3)) (ACCEPT . (selected_component . 3)) (CHARACTER_LITERAL . (selected_component . 3)) (STRING_LITERAL . (selected_component . 3)) (IDENTIFIER . (selected_component . 3)) (LESS_LESS . (selected_component . 3)) (OF . (selected_component . 3)) (LEFT_PAREN . (selected_component . 3)) (SEMICOLON . (selected_component . 3)) (COMMA . (selected_component . 3)) (DOT . (selected_component . 3)) (TICK . (selected_component . 3)) (WITH . (selected_component . 3)) (IS . (selected_component . 3)) (RENAMES . (selected_component . 3)) (RETURN . (selected_component . 3)))
      ((default . error) (DOT_DOT . (primary . 0)) (RIGHT_PAREN . (primary . 0)) (COMMA . (primary . 0)) (BAR . (primary . 0)) (EQUAL_GREATER . (primary . 0)) (PLUS . (primary . 0)) (MINUS . (primary . 0)) (AMPERSAND . (primary . 0)) (IN . (primary . 0)) (NOT . (primary . 0)) (EQUAL . (primary . 0)) (GREATER . (primary . 0)) (GREATER_EQUAL . (primary . 0)) (LESS . (primary . 0)) (LESS_EQUAL . (primary . 0)) (SLASH_EQUAL . (primary . 0)) (WITH . (primary . 0)) (SLASH . (primary . 0)) (STAR . (primary . 0)) (MOD . (primary . 0)) (REM . (primary . 0)) (STAR_STAR . (primary . 0)) (AND . (primary . 0)) (OR . (primary . 0)) (XOR . (primary . 0)) (RECORD .  518))
      ((default . error) (COMMA .  261) (RIGHT_PAREN .  517))
      ((default . error) (RIGHT_PAREN . (expression_opt . 1)) (COMMA . (expression_opt . 1)) (WITH .  516))
      ((default . error) (IDENTIFIER .  72))
      ((default . error) (RIGHT_PAREN . (formal_part . 0)) (COLON_EQUAL . (formal_part . 0)) (DO . (formal_part . 0)) (WHEN . (formal_part . 0)) (RENAMES . (formal_part . 0)) (IS . (formal_part . 0)) (SEMICOLON . (formal_part . 0)) (WITH . (formal_part . 0)) (RETURN . (formal_part . 0)))
      ((default . error) (IN . (aliased_opt . 0)) (OUT . (aliased_opt . 0)) (IDENTIFIER . (aliased_opt . 0)) (STRING_LITERAL . (aliased_opt . 0)) (CHARACTER_LITERAL . (aliased_opt . 0)) (ALIASED .  512) (ACCESS . (null_exclusion_opt . 0)) (NOT . ((aliased_opt . 0)  208)))
      ((default . error) (FUNCTION . (protected_opt . 0)) (PROCEDURE . (protected_opt . 0)) (PROTECTED .  509) (IDENTIFIER . (general_access_modifier_opt . 0)) (STRING_LITERAL . (general_access_modifier_opt . 0)) (CHARACTER_LITERAL . (general_access_modifier_opt . 0)) (ALL .  507) (CONSTANT .  508))
      ((default . error) (RIGHT_PAREN . (null_exclusion_opt . 1)) (DO . (null_exclusion_opt . 1)) (RENAMES . (null_exclusion_opt . 1)) (COLON_EQUAL . (null_exclusion_opt . 1)) (ACCESS . (null_exclusion_opt . 1)) (CHARACTER_LITERAL . (null_exclusion_opt . 1)) (STRING_LITERAL . (null_exclusion_opt . 1)) (IDENTIFIER . (null_exclusion_opt . 1)) (WITH . (null_exclusion_opt . 1)) (SEMICOLON . (null_exclusion_opt . 1)) (IS . (null_exclusion_opt . 1)))
      ((default . error) (DO . (parameter_and_result_profile . 2)) (RIGHT_PAREN . (parameter_and_result_profile . 2)) (COLON_EQUAL . (parameter_and_result_profile . 2)) (RENAMES . (parameter_and_result_profile . 2)) (IS . (parameter_and_result_profile . 2)) (SEMICOLON . (parameter_and_result_profile . 2)) (WITH . (parameter_and_result_profile . 2)))
      ((default . error) (ACCESS .  235) (WITH . (name_opt . 0)) (SEMICOLON . (name_opt . 0)) (IS . (name_opt . 0)) (RENAMES . (name_opt . 0)) (COLON_EQUAL . (name_opt . 0)) (RIGHT_PAREN . (name_opt . 0)) (DO . (name_opt . 0)) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (COLON_EQUAL .  504) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (ACCESS .  235) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (CHARACTER_LITERAL . (mode_opt . 2)) (STRING_LITERAL . (mode_opt . 2)) (IDENTIFIER . (mode_opt . 2)) (NOT . (mode_opt . 2)) (ACCESS . (mode_opt . 2)))
      ((default . error) (NEW .  502))
      ((default . error) (WITH . (formal_subprogram_declaration . 1)) (TYPE . (formal_subprogram_declaration . 1)) (PRAGMA . (formal_subprogram_declaration . 1)) (IDENTIFIER . (formal_subprogram_declaration . 1)) (FUNCTION . (formal_subprogram_declaration . 1)) (PROCEDURE . (formal_subprogram_declaration . 1)) (PACKAGE . (formal_subprogram_declaration . 1)))
      ((default . error) (WITH . (subprogram_default . 1)) (SEMICOLON . (subprogram_default . 1)))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108) (BOX .  244) (NULL .  246) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (WITH . (subprogram_default . 2)) (SEMICOLON . (subprogram_default . 2)))
      ((default . error) (WITH . (subprogram_default . 0)) (SEMICOLON . (subprogram_default . 0)) (DOT .  87) (TICK .  88) (LEFT_PAREN .  106))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (LEFT_PAREN .  484) (RANGE .  488) (MOD .  486) (DIGITS .  482) (DELTA .  481) (TASK .  491) (PROTECTED .  487) (INTERFACE .  483) (ARRAY .  480) (PRIVATE . (abstract_tagged_limited_opt . 0)) (TAGGED .  490) (NEW . (abstract_limited_synchronized_opt . 0)) (ABSTRACT .  479) (LIMITED .  485) (SYNCHRONIZED .  489) (ACCESS . (null_exclusion_opt . 0)) (NOT .  208))
      ((default . error) (SEMICOLON .  478))
      ((default . error) (RIGHT_PAREN .  477))
      ((default . error) (RIGHT_PAREN . (discriminant_specification_list . 0)) (SEMICOLON . (discriminant_specification_list . 0)))
      ((default . error) (SEMICOLON .  475) (RIGHT_PAREN .  476))
      ((default . error) (COMMA .  95) (COLON .  474))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (WITH . (with_clause . 0)) (USE . (with_clause . 0)) (SEPARATE . (with_clause . 0)) (PROCEDURE . (with_clause . 0)) (PRIVATE . (with_clause . 0)) (PRAGMA . (with_clause . 0)) (PACKAGE . (with_clause . 0)) (OVERRIDING . (with_clause . 0)) (NOT . (with_clause . 0)) (LIMITED . (with_clause . 0)) (GENERIC . (with_clause . 0)) (FUNCTION . (with_clause . 0)) ($EOI . (with_clause . 0)))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (DO . (name . 2)) (WHILE . (name . 2)) (SELECT . (name . 2)) (REQUEUE . (name . 2)) (RAISE . (name . 2)) (PRAGMA . (name . 2)) (NULL . (name . 2)) (LOOP . (name . 2)) (IF . (name . 2)) (GOTO . (name . 2)) (FOR . (name . 2)) (EXIT . (name . 2)) (DELAY . (name . 2)) (DECLARE . (name . 2)) (CASE . (name . 2)) (BEGIN . (name . 2)) (ABORT . (name . 2)) (ACCEPT . (name . 2)) (CHARACTER_LITERAL . (name . 2)) (STRING_LITERAL . (name . 2)) (IDENTIFIER . (name . 2)) (LESS_LESS . (name . 2)) (USE . (name . 2)) (XOR . (name . 2)) (OR . (name . 2)) (IN . (name . 2)) (NOT . (name . 2)) (EQUAL . (name . 2)) (GREATER . (name . 2)) (GREATER_EQUAL . (name . 2)) (LESS . (name . 2)) (LESS_EQUAL . (name . 2)) (SLASH_EQUAL . (name . 2)) (THEN . (name . 2)) (DIGITS . (name . 2)) (EQUAL_GREATER . (name . 2)) (ELSE . (name . 2)) (ELSIF . (name . 2)) (BAR . (name . 2)) (STAR_STAR . (name . 2)) (REM . (name . 2)) (MOD . (name . 2)) (STAR . (name . 2)) (SLASH . (name . 2)) (DOT_DOT . (name . 2)) (AMPERSAND . (name . 2)) (MINUS . (name . 2)) (PLUS . (name . 2)) (RIGHT_PAREN . (name . 2)) (RANGE . (name . 2)) (COLON_EQUAL . (name . 2)) (AND . (name . 2)) (OF . (name . 2)) (RETURN . (name . 2)) (TICK . (name . 2)) (DOT . (name . 2)) (LEFT_PAREN . (name . 2)) (IS . (name . 2)) (SEMICOLON . (name . 2)) (WITH . (name . 2)) (RENAMES . (name . 2)) (COMMA . (name . 2)))
      ((default . error) (RIGHT_PAREN . ((association_opt . 0) (expression_opt . 0))) (COMMA . ((association_opt . 0) (expression_opt . 0))) (IS . ((association_opt . 0) (expression_opt . 0))) (SEMICOLON . ((association_opt . 0) (expression_opt . 0))) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (OTHERS .  172) (IDENTIFIER .  48) (CHARACTER_LITERAL .  170) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  171) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (STAR_STAR . (actual_parameter_part . 0)) (REM . (actual_parameter_part . 0)) (MOD . (actual_parameter_part . 0)) (STAR . (actual_parameter_part . 0)) (SLASH . (actual_parameter_part . 0)) (DOT_DOT . (actual_parameter_part . 0)) (AMPERSAND . (actual_parameter_part . 0)) (MINUS . (actual_parameter_part . 0)) (PLUS . (actual_parameter_part . 0)) (RIGHT_PAREN . (actual_parameter_part . 0)) (RANGE . (actual_parameter_part . 0)) (COLON_EQUAL . (actual_parameter_part . 0)) (AND . (actual_parameter_part . 0)) (OF . (actual_parameter_part . 0)) (DO . (actual_parameter_part . 0)) (WHILE . (actual_parameter_part . 0)) (SELECT . (actual_parameter_part . 0)) (REQUEUE . (actual_parameter_part . 0)) (RAISE . (actual_parameter_part . 0)) (PRAGMA . (actual_parameter_part . 0)) (NULL . (actual_parameter_part . 0)) (LOOP . (actual_parameter_part . 0)) (IF . (actual_parameter_part . 0)) (GOTO . (actual_parameter_part . 0)) (FOR . (actual_parameter_part . 0)) (EXIT . (actual_parameter_part . 0)) (DELAY . (actual_parameter_part . 0)) (DECLARE . (actual_parameter_part . 0)) (CASE . (actual_parameter_part . 0)) (BEGIN . (actual_parameter_part . 0)) (ABORT . (actual_parameter_part . 0)) (ACCEPT . (actual_parameter_part . 0)) (CHARACTER_LITERAL . (actual_parameter_part . 0)) (STRING_LITERAL . (actual_parameter_part . 0)) (IDENTIFIER . (actual_parameter_part . 0)) (LESS_LESS . (actual_parameter_part . 0)) (USE . (actual_parameter_part . 0)) (XOR . (actual_parameter_part . 0)) (OR . (actual_parameter_part . 0)) (IN . (actual_parameter_part . 0)) (NOT . (actual_parameter_part . 0)) (EQUAL . (actual_parameter_part . 0)) (GREATER . (actual_parameter_part . 0)) (GREATER_EQUAL . (actual_parameter_part . 0)) (LESS . (actual_parameter_part . 0)) (LESS_EQUAL . (actual_parameter_part . 0)) (SLASH_EQUAL . (actual_parameter_part . 0)) (THEN . (actual_parameter_part . 0)) (DIGITS . (actual_parameter_part . 0)) (EQUAL_GREATER . (actual_parameter_part . 0)) (ELSE . (actual_parameter_part . 0)) (ELSIF . (actual_parameter_part . 0)) (BAR . (actual_parameter_part . 0)) (RETURN . (actual_parameter_part . 0)) (TICK . (actual_parameter_part . 0)) (DOT . (actual_parameter_part . 0)) (LEFT_PAREN . (actual_parameter_part . 0)) (IS . (actual_parameter_part . 0)) (SEMICOLON . (actual_parameter_part . 0)) (WITH . (actual_parameter_part . 0)) (RENAMES . (actual_parameter_part . 0)) (COMMA . (actual_parameter_part . 0)))
      ((default . error) (SEMICOLON .  468))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (MINUS . (relational_operator . 0)) (PLUS . (relational_operator . 0)) (IDENTIFIER . (relational_operator . 0)) (STRING_LITERAL . (relational_operator . 0)) (CHARACTER_LITERAL . (relational_operator . 0)) (ABS . (relational_operator . 0)) (LEFT_PAREN . (relational_operator . 0)) (NEW . (relational_operator . 0)) (NOT . (relational_operator . 0)) (NULL . (relational_operator . 0)))
      ((default . error) (MINUS . (relational_operator . 4)) (PLUS . (relational_operator . 4)) (IDENTIFIER . (relational_operator . 4)) (STRING_LITERAL . (relational_operator . 4)) (CHARACTER_LITERAL . (relational_operator . 4)) (ABS . (relational_operator . 4)) (LEFT_PAREN . (relational_operator . 4)) (NEW . (relational_operator . 4)) (NOT . (relational_operator . 4)) (NULL . (relational_operator . 4)))
      ((default . error) (MINUS . (relational_operator . 5)) (PLUS . (relational_operator . 5)) (IDENTIFIER . (relational_operator . 5)) (STRING_LITERAL . (relational_operator . 5)) (CHARACTER_LITERAL . (relational_operator . 5)) (ABS . (relational_operator . 5)) (LEFT_PAREN . (relational_operator . 5)) (NEW . (relational_operator . 5)) (NOT . (relational_operator . 5)) (NULL . (relational_operator . 5)))
      ((default . error) (MINUS . (relational_operator . 2)) (PLUS . (relational_operator . 2)) (IDENTIFIER . (relational_operator . 2)) (STRING_LITERAL . (relational_operator . 2)) (CHARACTER_LITERAL . (relational_operator . 2)) (ABS . (relational_operator . 2)) (LEFT_PAREN . (relational_operator . 2)) (NEW . (relational_operator . 2)) (NOT . (relational_operator . 2)) (NULL . (relational_operator . 2)))
      ((default . error) (MINUS . (relational_operator . 3)) (PLUS . (relational_operator . 3)) (IDENTIFIER . (relational_operator . 3)) (STRING_LITERAL . (relational_operator . 3)) (CHARACTER_LITERAL . (relational_operator . 3)) (ABS . (relational_operator . 3)) (LEFT_PAREN . (relational_operator . 3)) (NEW . (relational_operator . 3)) (NOT . (relational_operator . 3)) (NULL . (relational_operator . 3)))
      ((default . error) (MINUS . (relational_operator . 1)) (PLUS . (relational_operator . 1)) (IDENTIFIER . (relational_operator . 1)) (STRING_LITERAL . (relational_operator . 1)) (CHARACTER_LITERAL . (relational_operator . 1)) (ABS . (relational_operator . 1)) (LEFT_PAREN . (relational_operator . 1)) (NEW . (relational_operator . 1)) (NOT . (relational_operator . 1)) (NULL . (relational_operator . 1)))
      ((default . error) (PLUS .  144) (MINUS .  143) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (IN .  462))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (RANGE .  460) (LEFT_PAREN .  220) (ACCESS .  217) (DELTA .  218) (DIGITS .  219) (MOD .  221) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (OTHERS .  172) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  171) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (BOX .  456) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (THEN .  454) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (ELSE .  452) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (ELSE .  450))
      ((default . error) (THEN .  449))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (XOR . (primary . 0)) (OR . (primary . 0)) (AND . (primary . 0)) (SLASH_EQUAL . (primary . 0)) (LESS_EQUAL . (primary . 0)) (LESS . (primary . 0)) (GREATER_EQUAL . (primary . 0)) (GREATER . (primary . 0)) (EQUAL . (primary . 0)) (EQUAL_GREATER . (primary . 0)) (BAR . (primary . 0)) (PLUS . (primary . 0)) (MINUS . (primary . 0)) (AMPERSAND . (primary . 0)) (DOT_DOT . (primary . 0)) (SLASH . (primary . 0)) (STAR . (primary . 0)) (MOD . (primary . 0)) (REM . (primary . 0)) (IN . (primary . 0)) (NOT . (primary . 0)) (RIGHT_PAREN . (primary . 0)) (COMMA . (primary . 0)) (WITH . (primary . 0)) (IS . (primary . 0)) (SEMICOLON . (primary . 0)) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (COLON_EQUAL . (factor . 3)) (OF . (factor . 3)) (LOOP . (factor . 3)) (DO . (factor . 3)) (PLUS . (factor . 3)) (MINUS . (factor . 3)) (AMPERSAND . (factor . 3)) (SEMICOLON . (factor . 3)) (SLASH . (factor . 3)) (STAR . (factor . 3)) (MOD . (factor . 3)) (REM . (factor . 3)) (XOR . (factor . 3)) (OR . (factor . 3)) (AND . (factor . 3)) (IN . (factor . 3)) (NOT . (factor . 3)) (EQUAL . (factor . 3)) (GREATER . (factor . 3)) (GREATER_EQUAL . (factor . 3)) (LESS . (factor . 3)) (LESS_EQUAL . (factor . 3)) (SLASH_EQUAL . (factor . 3)) (IS . (factor . 3)) (WITH . (factor . 3)) (DOT_DOT . (factor . 3)) (THEN . (factor . 3)) (RANGE . (factor . 3)) (DIGITS . (factor . 3)) (RIGHT_PAREN . (factor . 3)) (EQUAL_GREATER . (factor . 3)) (ELSE . (factor . 3)) (ELSIF . (factor . 3)) (BAR . (factor . 3)) (COMMA . (factor . 3)))
      ((default . error) (BOX .  442) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (COLON . ( 441 (identifier_list . 0))) (COMMA . (identifier_list . 0)))
      ((default . error) (IDENTIFIER .  436) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  437))
      ((default . error) (BODY .  435) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  432) (TYPE .  434) (BODY .  433))
      ((default . error) (IDENTIFIER .  431))
      ((default . error) (TYPE .  430) (BODY .  429) (IDENTIFIER .  428))
      ((default . error) (IDENTIFIER .  427))
      ((default . error) (END . (declaration . 0)) (PRIVATE . (declaration . 0)) (USE . (declaration . 0)) (TYPE . (declaration . 0)) (TASK . (declaration . 0)) (SUBTYPE . (declaration . 0)) (PROTECTED . (declaration . 0)) (PROCEDURE . (declaration . 0)) (PRAGMA . (declaration . 0)) (PACKAGE . (declaration . 0)) (OVERRIDING . (declaration . 0)) (NOT . (declaration . 0)) (GENERIC . (declaration . 0)) (FUNCTION . (declaration . 0)) (FOR . (declaration . 0)) (ENTRY . (declaration . 0)) (IDENTIFIER . (declaration . 0)) (BEGIN . (declaration . 0)))
      ((default . error) (END . (declaration . 1)) (PRIVATE . (declaration . 1)) (USE . (declaration . 1)) (TYPE . (declaration . 1)) (TASK . (declaration . 1)) (SUBTYPE . (declaration . 1)) (PROTECTED . (declaration . 1)) (PROCEDURE . (declaration . 1)) (PRAGMA . (declaration . 1)) (PACKAGE . (declaration . 1)) (OVERRIDING . (declaration . 1)) (NOT . (declaration . 1)) (GENERIC . (declaration . 1)) (FUNCTION . (declaration . 1)) (FOR . (declaration . 1)) (ENTRY . (declaration . 1)) (IDENTIFIER . (declaration . 1)) (BEGIN . (declaration . 1)))
      ((default . error) (WHEN . (aspect_clause . 3)) (PRIVATE . (aspect_clause . 3)) (END . (aspect_clause . 3)) (CASE . (aspect_clause . 3)) (BEGIN . (aspect_clause . 3)) (IDENTIFIER . (aspect_clause . 3)) (ENTRY . (aspect_clause . 3)) (FOR . (aspect_clause . 3)) (FUNCTION . (aspect_clause . 3)) (GENERIC . (aspect_clause . 3)) (NOT . (aspect_clause . 3)) (OVERRIDING . (aspect_clause . 3)) (PACKAGE . (aspect_clause . 3)) (PRAGMA . (aspect_clause . 3)) (PROCEDURE . (aspect_clause . 3)) (PROTECTED . (aspect_clause . 3)) (SUBTYPE . (aspect_clause . 3)) (TASK . (aspect_clause . 3)) (TYPE . (aspect_clause . 3)) (USE . (aspect_clause . 3)))
      ((default . error) (END . (declaration . 2)) (PRIVATE . (declaration . 2)) (USE . (declaration . 2)) (TYPE . (declaration . 2)) (TASK . (declaration . 2)) (SUBTYPE . (declaration . 2)) (PROTECTED . (declaration . 2)) (PROCEDURE . (declaration . 2)) (PRAGMA . (declaration . 2)) (PACKAGE . (declaration . 2)) (OVERRIDING . (declaration . 2)) (NOT . (declaration . 2)) (GENERIC . (declaration . 2)) (FUNCTION . (declaration . 2)) (FOR . (declaration . 2)) (ENTRY . (declaration . 2)) (IDENTIFIER . (declaration . 2)) (BEGIN . (declaration . 2)))
      ((default . error) (PRIVATE . (body . 1)) (END . (body . 1)) (BEGIN . (body . 1)) (IDENTIFIER . (body . 1)) (ENTRY . (body . 1)) (FOR . (body . 1)) (FUNCTION . (body . 1)) (GENERIC . (body . 1)) (NOT . (body . 1)) (OVERRIDING . (body . 1)) (PACKAGE . (body . 1)) (PRAGMA . (body . 1)) (PROCEDURE . (body . 1)) (PROTECTED . (body . 1)) (SUBTYPE . (body . 1)) (TASK . (body . 1)) (TYPE . (body . 1)) (USE . (body . 1)))
      ((default . error) (PRIVATE . (declarations . 0)) (END . (declarations . 0)) (BEGIN . (declarations . 0)) (IDENTIFIER . (declarations . 0)) (ENTRY . (declarations . 0)) (FOR . (declarations . 0)) (FUNCTION . (declarations . 0)) (GENERIC . (declarations . 0)) (NOT . (declarations . 0)) (OVERRIDING . (declarations . 0)) (PACKAGE . (declarations . 0)) (PRAGMA . (declarations . 0)) (PROCEDURE . (declarations . 0)) (PROTECTED . (declarations . 0)) (SUBTYPE . (declarations . 0)) (TASK . (declarations . 0)) (TYPE . (declarations . 0)) (USE . (declarations . 0)))
      ((default . error) (END . (declarative_part_opt . 1)) (PRIVATE . (declarative_part_opt . 1)) (BEGIN . (declarative_part_opt . 1)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (END .  424) (PRIVATE .  425))
      ((default . error) (END . (declaration . 3)) (PRIVATE . (declaration . 3)) (USE . (declaration . 3)) (TYPE . (declaration . 3)) (TASK . (declaration . 3)) (SUBTYPE . (declaration . 3)) (PROTECTED . (declaration . 3)) (PROCEDURE . (declaration . 3)) (PRAGMA . (declaration . 3)) (PACKAGE . (declaration . 3)) (OVERRIDING . (declaration . 3)) (NOT . (declaration . 3)) (GENERIC . (declaration . 3)) (FUNCTION . (declaration . 3)) (FOR . (declaration . 3)) (ENTRY . (declaration . 3)) (IDENTIFIER . (declaration . 3)) (BEGIN . (declaration . 3)))
      ((default . error) (WHEN . (aspect_clause . 1)) (PRIVATE . (aspect_clause . 1)) (END . (aspect_clause . 1)) (CASE . (aspect_clause . 1)) (BEGIN . (aspect_clause . 1)) (IDENTIFIER . (aspect_clause . 1)) (ENTRY . (aspect_clause . 1)) (FOR . (aspect_clause . 1)) (FUNCTION . (aspect_clause . 1)) (GENERIC . (aspect_clause . 1)) (NOT . (aspect_clause . 1)) (OVERRIDING . (aspect_clause . 1)) (PACKAGE . (aspect_clause . 1)) (PRAGMA . (aspect_clause . 1)) (PROCEDURE . (aspect_clause . 1)) (PROTECTED . (aspect_clause . 1)) (SUBTYPE . (aspect_clause . 1)) (TASK . (aspect_clause . 1)) (TYPE . (aspect_clause . 1)) (USE . (aspect_clause . 1)))
      ((default . error) (END . (declaration . 4)) (PRIVATE . (declaration . 4)) (USE . (declaration . 4)) (TYPE . (declaration . 4)) (TASK . (declaration . 4)) (SUBTYPE . (declaration . 4)) (PROTECTED . (declaration . 4)) (PROCEDURE . (declaration . 4)) (PRAGMA . (declaration . 4)) (PACKAGE . (declaration . 4)) (OVERRIDING . (declaration . 4)) (NOT . (declaration . 4)) (GENERIC . (declaration . 4)) (FUNCTION . (declaration . 4)) (FOR . (declaration . 4)) (ENTRY . (declaration . 4)) (IDENTIFIER . (declaration . 4)) (BEGIN . (declaration . 4)))
      ((default . error) (END . (declaration . 5)) (PRIVATE . (declaration . 5)) (USE . (declaration . 5)) (TYPE . (declaration . 5)) (TASK . (declaration . 5)) (SUBTYPE . (declaration . 5)) (PROTECTED . (declaration . 5)) (PROCEDURE . (declaration . 5)) (PRAGMA . (declaration . 5)) (PACKAGE . (declaration . 5)) (OVERRIDING . (declaration . 5)) (NOT . (declaration . 5)) (GENERIC . (declaration . 5)) (FUNCTION . (declaration . 5)) (FOR . (declaration . 5)) (ENTRY . (declaration . 5)) (IDENTIFIER . (declaration . 5)) (BEGIN . (declaration . 5)))
      ((default . error) (PRIVATE . (type_declaration . 0)) (END . (type_declaration . 0)) (BEGIN . (type_declaration . 0)) (IDENTIFIER . (type_declaration . 0)) (ENTRY . (type_declaration . 0)) (FOR . (type_declaration . 0)) (FUNCTION . (type_declaration . 0)) (GENERIC . (type_declaration . 0)) (NOT . (type_declaration . 0)) (OVERRIDING . (type_declaration . 0)) (PACKAGE . (type_declaration . 0)) (PRAGMA . (type_declaration . 0)) (PROCEDURE . (type_declaration . 0)) (PROTECTED . (type_declaration . 0)) (SUBTYPE . (type_declaration . 0)) (TASK . (type_declaration . 0)) (TYPE . (type_declaration . 0)) (USE . (type_declaration . 0)))
      ((default . error) (END . (declaration . 6)) (PRIVATE . (declaration . 6)) (USE . (declaration . 6)) (TYPE . (declaration . 6)) (TASK . (declaration . 6)) (SUBTYPE . (declaration . 6)) (PROTECTED . (declaration . 6)) (PROCEDURE . (declaration . 6)) (PRAGMA . (declaration . 6)) (PACKAGE . (declaration . 6)) (OVERRIDING . (declaration . 6)) (NOT . (declaration . 6)) (GENERIC . (declaration . 6)) (FUNCTION . (declaration . 6)) (FOR . (declaration . 6)) (ENTRY . (declaration . 6)) (IDENTIFIER . (declaration . 6)) (BEGIN . (declaration . 6)))
      ((default . error) (END . (declaration . 7)) (PRIVATE . (declaration . 7)) (USE . (declaration . 7)) (TYPE . (declaration . 7)) (TASK . (declaration . 7)) (SUBTYPE . (declaration . 7)) (PROTECTED . (declaration . 7)) (PROCEDURE . (declaration . 7)) (PRAGMA . (declaration . 7)) (PACKAGE . (declaration . 7)) (OVERRIDING . (declaration . 7)) (NOT . (declaration . 7)) (GENERIC . (declaration . 7)) (FUNCTION . (declaration . 7)) (FOR . (declaration . 7)) (ENTRY . (declaration . 7)) (IDENTIFIER . (declaration . 7)) (BEGIN . (declaration . 7)))
      ((default . error) (PRIVATE . (renaming_declaration . 3)) (END . (renaming_declaration . 3)) (BEGIN . (renaming_declaration . 3)) (IDENTIFIER . (renaming_declaration . 3)) (ENTRY . (renaming_declaration . 3)) (FOR . (renaming_declaration . 3)) (FUNCTION . (renaming_declaration . 3)) (GENERIC . (renaming_declaration . 3)) (NOT . (renaming_declaration . 3)) (OVERRIDING . (renaming_declaration . 3)) (PACKAGE . (renaming_declaration . 3)) (PRAGMA . (renaming_declaration . 3)) (PROCEDURE . (renaming_declaration . 3)) (PROTECTED . (renaming_declaration . 3)) (SUBTYPE . (renaming_declaration . 3)) (TASK . (renaming_declaration . 3)) (TYPE . (renaming_declaration . 3)) (USE . (renaming_declaration . 3)))
      ((default . error) (COMMA .  95) (COLON .  423))
      ((default . error) (PRIVATE . (type_declaration . 1)) (END . (type_declaration . 1)) (BEGIN . (type_declaration . 1)) (IDENTIFIER . (type_declaration . 1)) (ENTRY . (type_declaration . 1)) (FOR . (type_declaration . 1)) (FUNCTION . (type_declaration . 1)) (GENERIC . (type_declaration . 1)) (NOT . (type_declaration . 1)) (OVERRIDING . (type_declaration . 1)) (PACKAGE . (type_declaration . 1)) (PRAGMA . (type_declaration . 1)) (PROCEDURE . (type_declaration . 1)) (PROTECTED . (type_declaration . 1)) (SUBTYPE . (type_declaration . 1)) (TASK . (type_declaration . 1)) (TYPE . (type_declaration . 1)) (USE . (type_declaration . 1)))
      ((default . error) (END . (declaration . 8)) (PRIVATE . (declaration . 8)) (USE . (declaration . 8)) (TYPE . (declaration . 8)) (TASK . (declaration . 8)) (SUBTYPE . (declaration . 8)) (PROTECTED . (declaration . 8)) (PROCEDURE . (declaration . 8)) (PRAGMA . (declaration . 8)) (PACKAGE . (declaration . 8)) (OVERRIDING . (declaration . 8)) (NOT . (declaration . 8)) (GENERIC . (declaration . 8)) (FUNCTION . (declaration . 8)) (FOR . (declaration . 8)) (ENTRY . (declaration . 8)) (IDENTIFIER . (declaration . 8)) (BEGIN . (declaration . 8)))
      ((default . error) (END . (declaration . 10)) (PRIVATE . (declaration . 10)) (USE . (declaration . 10)) (TYPE . (declaration . 10)) (TASK . (declaration . 10)) (SUBTYPE . (declaration . 10)) (PROTECTED . (declaration . 10)) (PROCEDURE . (declaration . 10)) (PRAGMA . (declaration . 10)) (PACKAGE . (declaration . 10)) (OVERRIDING . (declaration . 10)) (NOT . (declaration . 10)) (GENERIC . (declaration . 10)) (FUNCTION . (declaration . 10)) (FOR . (declaration . 10)) (ENTRY . (declaration . 10)) (IDENTIFIER . (declaration . 10)) (BEGIN . (declaration . 10)))
      ((default . error) (PRIVATE . (renaming_declaration . 0)) (END . (renaming_declaration . 0)) (BEGIN . (renaming_declaration . 0)) (IDENTIFIER . (renaming_declaration . 0)) (ENTRY . (renaming_declaration . 0)) (FOR . (renaming_declaration . 0)) (FUNCTION . (renaming_declaration . 0)) (GENERIC . (renaming_declaration . 0)) (NOT . (renaming_declaration . 0)) (OVERRIDING . (renaming_declaration . 0)) (PACKAGE . (renaming_declaration . 0)) (PRAGMA . (renaming_declaration . 0)) (PROCEDURE . (renaming_declaration . 0)) (PROTECTED . (renaming_declaration . 0)) (SUBTYPE . (renaming_declaration . 0)) (TASK . (renaming_declaration . 0)) (TYPE . (renaming_declaration . 0)) (USE . (renaming_declaration . 0)))
      ((default . error) (ENTRY .  419) (FUNCTION .  40) (PROCEDURE .  41))
      ((default . error) ($EOI . (proper_body . 1)) (LIMITED . (proper_body . 1)) (SEPARATE . (proper_body . 1)) (WITH . (proper_body . 1)) (END . (proper_body . 1)) (PRIVATE . (proper_body . 1)) (USE . (proper_body . 1)) (TYPE . (proper_body . 1)) (TASK . (proper_body . 1)) (SUBTYPE . (proper_body . 1)) (PROTECTED . (proper_body . 1)) (PROCEDURE . (proper_body . 1)) (PRAGMA . (proper_body . 1)) (PACKAGE . (proper_body . 1)) (OVERRIDING . (proper_body . 1)) (NOT . (proper_body . 1)) (GENERIC . (proper_body . 1)) (FUNCTION . (proper_body . 1)) (FOR . (proper_body . 1)) (ENTRY . (proper_body . 1)) (IDENTIFIER . (proper_body . 1)) (BEGIN . (proper_body . 1)))
      ((default . error) (END . (body_stub . 1)) (PRIVATE . (body_stub . 1)) (USE . (body_stub . 1)) (TYPE . (body_stub . 1)) (TASK . (body_stub . 1)) (SUBTYPE . (body_stub . 1)) (PROTECTED . (body_stub . 1)) (PROCEDURE . (body_stub . 1)) (PRAGMA . (body_stub . 1)) (PACKAGE . (body_stub . 1)) (OVERRIDING . (body_stub . 1)) (NOT . (body_stub . 1)) (GENERIC . (body_stub . 1)) (FUNCTION . (body_stub . 1)) (FOR . (body_stub . 1)) (ENTRY . (body_stub . 1)) (IDENTIFIER . (body_stub . 1)) (BEGIN . (body_stub . 1)))
      ((default . error) (END . (declaration . 11)) (PRIVATE . (declaration . 11)) (USE . (declaration . 11)) (TYPE . (declaration . 11)) (TASK . (declaration . 11)) (SUBTYPE . (declaration . 11)) (PROTECTED . (declaration . 11)) (PROCEDURE . (declaration . 11)) (PRAGMA . (declaration . 11)) (PACKAGE . (declaration . 11)) (OVERRIDING . (declaration . 11)) (NOT . (declaration . 11)) (GENERIC . (declaration . 11)) (FUNCTION . (declaration . 11)) (FOR . (declaration . 11)) (ENTRY . (declaration . 11)) (IDENTIFIER . (declaration . 11)) (BEGIN . (declaration . 11)))
      ((default . error) (PRIVATE . (renaming_declaration . 1)) (END . (renaming_declaration . 1)) (BEGIN . (renaming_declaration . 1)) (IDENTIFIER . (renaming_declaration . 1)) (ENTRY . (renaming_declaration . 1)) (FOR . (renaming_declaration . 1)) (FUNCTION . (renaming_declaration . 1)) (GENERIC . (renaming_declaration . 1)) (NOT . (renaming_declaration . 1)) (OVERRIDING . (renaming_declaration . 1)) (PACKAGE . (renaming_declaration . 1)) (PRAGMA . (renaming_declaration . 1)) (PROCEDURE . (renaming_declaration . 1)) (PROTECTED . (renaming_declaration . 1)) (SUBTYPE . (renaming_declaration . 1)) (TASK . (renaming_declaration . 1)) (TYPE . (renaming_declaration . 1)) (USE . (renaming_declaration . 1)))
      ((default . error) (END . (declaration . 12)) (PRIVATE . (declaration . 12)) (USE . (declaration . 12)) (TYPE . (declaration . 12)) (TASK . (declaration . 12)) (SUBTYPE . (declaration . 12)) (PROTECTED . (declaration . 12)) (PROCEDURE . (declaration . 12)) (PRAGMA . (declaration . 12)) (PACKAGE . (declaration . 12)) (OVERRIDING . (declaration . 12)) (NOT . (declaration . 12)) (GENERIC . (declaration . 12)) (FUNCTION . (declaration . 12)) (FOR . (declaration . 12)) (ENTRY . (declaration . 12)) (IDENTIFIER . (declaration . 12)) (BEGIN . (declaration . 12)))
      ((default . error) (PRIVATE . (type_declaration . 3)) (END . (type_declaration . 3)) (BEGIN . (type_declaration . 3)) (IDENTIFIER . (type_declaration . 3)) (ENTRY . (type_declaration . 3)) (FOR . (type_declaration . 3)) (FUNCTION . (type_declaration . 3)) (GENERIC . (type_declaration . 3)) (NOT . (type_declaration . 3)) (OVERRIDING . (type_declaration . 3)) (PACKAGE . (type_declaration . 3)) (PRAGMA . (type_declaration . 3)) (PROCEDURE . (type_declaration . 3)) (PROTECTED . (type_declaration . 3)) (SUBTYPE . (type_declaration . 3)) (TASK . (type_declaration . 3)) (TYPE . (type_declaration . 3)) (USE . (type_declaration . 3)))
      ((default . error) (PRIVATE . (type_declaration . 2)) (END . (type_declaration . 2)) (BEGIN . (type_declaration . 2)) (IDENTIFIER . (type_declaration . 2)) (ENTRY . (type_declaration . 2)) (FOR . (type_declaration . 2)) (FUNCTION . (type_declaration . 2)) (GENERIC . (type_declaration . 2)) (NOT . (type_declaration . 2)) (OVERRIDING . (type_declaration . 2)) (PACKAGE . (type_declaration . 2)) (PRAGMA . (type_declaration . 2)) (PROCEDURE . (type_declaration . 2)) (PROTECTED . (type_declaration . 2)) (SUBTYPE . (type_declaration . 2)) (TASK . (type_declaration . 2)) (TYPE . (type_declaration . 2)) (USE . (type_declaration . 2)))
      ((default . error) (PRIVATE . (body . 0)) (END . (body . 0)) (BEGIN . (body . 0)) (IDENTIFIER . (body . 0)) (ENTRY . (body . 0)) (FOR . (body . 0)) (FUNCTION . (body . 0)) (GENERIC . (body . 0)) (NOT . (body . 0)) (OVERRIDING . (body . 0)) (PACKAGE . (body . 0)) (PRAGMA . (body . 0)) (PROCEDURE . (body . 0)) (PROTECTED . (body . 0)) (SUBTYPE . (body . 0)) (TASK . (body . 0)) (TYPE . (body . 0)) (USE . (body . 0)))
      ((default . error) ($EOI . (proper_body . 3)) (LIMITED . (proper_body . 3)) (SEPARATE . (proper_body . 3)) (WITH . (proper_body . 3)) (END . (proper_body . 3)) (PRIVATE . (proper_body . 3)) (USE . (proper_body . 3)) (TYPE . (proper_body . 3)) (TASK . (proper_body . 3)) (SUBTYPE . (proper_body . 3)) (PROTECTED . (proper_body . 3)) (PROCEDURE . (proper_body . 3)) (PRAGMA . (proper_body . 3)) (PACKAGE . (proper_body . 3)) (OVERRIDING . (proper_body . 3)) (NOT . (proper_body . 3)) (GENERIC . (proper_body . 3)) (FUNCTION . (proper_body . 3)) (FOR . (proper_body . 3)) (ENTRY . (proper_body . 3)) (IDENTIFIER . (proper_body . 3)) (BEGIN . (proper_body . 3)))
      ((default . error) (END . (body_stub . 3)) (PRIVATE . (body_stub . 3)) (USE . (body_stub . 3)) (TYPE . (body_stub . 3)) (TASK . (body_stub . 3)) (SUBTYPE . (body_stub . 3)) (PROTECTED . (body_stub . 3)) (PROCEDURE . (body_stub . 3)) (PRAGMA . (body_stub . 3)) (PACKAGE . (body_stub . 3)) (OVERRIDING . (body_stub . 3)) (NOT . (body_stub . 3)) (GENERIC . (body_stub . 3)) (FUNCTION . (body_stub . 3)) (FOR . (body_stub . 3)) (ENTRY . (body_stub . 3)) (IDENTIFIER . (body_stub . 3)) (BEGIN . (body_stub . 3)))
      ((default . error) (END . (full_type_declaration . 2)) (PRIVATE . (full_type_declaration . 2)) (USE . (full_type_declaration . 2)) (TYPE . (full_type_declaration . 2)) (TASK . (full_type_declaration . 2)) (SUBTYPE . (full_type_declaration . 2)) (PROTECTED . (full_type_declaration . 2)) (PROCEDURE . (full_type_declaration . 2)) (PRAGMA . (full_type_declaration . 2)) (PACKAGE . (full_type_declaration . 2)) (OVERRIDING . (full_type_declaration . 2)) (NOT . (full_type_declaration . 2)) (GENERIC . (full_type_declaration . 2)) (FUNCTION . (full_type_declaration . 2)) (FOR . (full_type_declaration . 2)) (ENTRY . (full_type_declaration . 2)) (IDENTIFIER . (full_type_declaration . 2)) (BEGIN . (full_type_declaration . 2)))
      ((default . error) (WHEN . (aspect_clause . 2)) (PRIVATE . (aspect_clause . 2)) (END . (aspect_clause . 2)) (CASE . (aspect_clause . 2)) (BEGIN . (aspect_clause . 2)) (IDENTIFIER . (aspect_clause . 2)) (ENTRY . (aspect_clause . 2)) (FOR . (aspect_clause . 2)) (FUNCTION . (aspect_clause . 2)) (GENERIC . (aspect_clause . 2)) (NOT . (aspect_clause . 2)) (OVERRIDING . (aspect_clause . 2)) (PACKAGE . (aspect_clause . 2)) (PRAGMA . (aspect_clause . 2)) (PROCEDURE . (aspect_clause . 2)) (PROTECTED . (aspect_clause . 2)) (SUBTYPE . (aspect_clause . 2)) (TASK . (aspect_clause . 2)) (TYPE . (aspect_clause . 2)) (USE . (aspect_clause . 2)))
      ((default . error) (END . (declaration . 13)) (PRIVATE . (declaration . 13)) (USE . (declaration . 13)) (TYPE . (declaration . 13)) (TASK . (declaration . 13)) (SUBTYPE . (declaration . 13)) (PROTECTED . (declaration . 13)) (PROCEDURE . (declaration . 13)) (PRAGMA . (declaration . 13)) (PACKAGE . (declaration . 13)) (OVERRIDING . (declaration . 13)) (NOT . (declaration . 13)) (GENERIC . (declaration . 13)) (FUNCTION . (declaration . 13)) (FOR . (declaration . 13)) (ENTRY . (declaration . 13)) (IDENTIFIER . (declaration . 13)) (BEGIN . (declaration . 13)))
      ((default . error) (PRIVATE . (object_declaration . 7)) (END . (object_declaration . 7)) (BEGIN . (object_declaration . 7)) (IDENTIFIER . (object_declaration . 7)) (ENTRY . (object_declaration . 7)) (FOR . (object_declaration . 7)) (FUNCTION . (object_declaration . 7)) (GENERIC . (object_declaration . 7)) (NOT . (object_declaration . 7)) (OVERRIDING . (object_declaration . 7)) (PACKAGE . (object_declaration . 7)) (PRAGMA . (object_declaration . 7)) (PROCEDURE . (object_declaration . 7)) (PROTECTED . (object_declaration . 7)) (SUBTYPE . (object_declaration . 7)) (TASK . (object_declaration . 7)) (TYPE . (object_declaration . 7)) (USE . (object_declaration . 7)))
      ((default . error) (PRIVATE . (object_declaration . 6)) (END . (object_declaration . 6)) (BEGIN . (object_declaration . 6)) (IDENTIFIER . (object_declaration . 6)) (ENTRY . (object_declaration . 6)) (FOR . (object_declaration . 6)) (FUNCTION . (object_declaration . 6)) (GENERIC . (object_declaration . 6)) (NOT . (object_declaration . 6)) (OVERRIDING . (object_declaration . 6)) (PACKAGE . (object_declaration . 6)) (PRAGMA . (object_declaration . 6)) (PROCEDURE . (object_declaration . 6)) (PROTECTED . (object_declaration . 6)) (SUBTYPE . (object_declaration . 6)) (TASK . (object_declaration . 6)) (TYPE . (object_declaration . 6)) (USE . (object_declaration . 6)))
      ((default . error) ($EOI . (proper_body . 0)) (LIMITED . (proper_body . 0)) (SEPARATE . (proper_body . 0)) (WITH . (proper_body . 0)) (END . (proper_body . 0)) (PRIVATE . (proper_body . 0)) (USE . (proper_body . 0)) (TYPE . (proper_body . 0)) (TASK . (proper_body . 0)) (SUBTYPE . (proper_body . 0)) (PROTECTED . (proper_body . 0)) (PROCEDURE . (proper_body . 0)) (PRAGMA . (proper_body . 0)) (PACKAGE . (proper_body . 0)) (OVERRIDING . (proper_body . 0)) (NOT . (proper_body . 0)) (GENERIC . (proper_body . 0)) (FUNCTION . (proper_body . 0)) (FOR . (proper_body . 0)) (ENTRY . (proper_body . 0)) (IDENTIFIER . (proper_body . 0)) (BEGIN . (proper_body . 0)))
      ((default . error) (END . (body_stub . 0)) (PRIVATE . (body_stub . 0)) (USE . (body_stub . 0)) (TYPE . (body_stub . 0)) (TASK . (body_stub . 0)) (SUBTYPE . (body_stub . 0)) (PROTECTED . (body_stub . 0)) (PROCEDURE . (body_stub . 0)) (PRAGMA . (body_stub . 0)) (PACKAGE . (body_stub . 0)) (OVERRIDING . (body_stub . 0)) (NOT . (body_stub . 0)) (GENERIC . (body_stub . 0)) (FUNCTION . (body_stub . 0)) (FOR . (body_stub . 0)) (ENTRY . (body_stub . 0)) (IDENTIFIER . (body_stub . 0)) (BEGIN . (body_stub . 0)))
      ((default . error) (END . (declaration . 14)) (PRIVATE . (declaration . 14)) (USE . (declaration . 14)) (TYPE . (declaration . 14)) (TASK . (declaration . 14)) (SUBTYPE . (declaration . 14)) (PROTECTED . (declaration . 14)) (PROCEDURE . (declaration . 14)) (PRAGMA . (declaration . 14)) (PACKAGE . (declaration . 14)) (OVERRIDING . (declaration . 14)) (NOT . (declaration . 14)) (GENERIC . (declaration . 14)) (FUNCTION . (declaration . 14)) (FOR . (declaration . 14)) (ENTRY . (declaration . 14)) (IDENTIFIER . (declaration . 14)) (BEGIN . (declaration . 14)))
      ((default . error) (PRIVATE . (renaming_declaration . 2)) (END . (renaming_declaration . 2)) (BEGIN . (renaming_declaration . 2)) (IDENTIFIER . (renaming_declaration . 2)) (ENTRY . (renaming_declaration . 2)) (FOR . (renaming_declaration . 2)) (FUNCTION . (renaming_declaration . 2)) (GENERIC . (renaming_declaration . 2)) (NOT . (renaming_declaration . 2)) (OVERRIDING . (renaming_declaration . 2)) (PACKAGE . (renaming_declaration . 2)) (PRAGMA . (renaming_declaration . 2)) (PROCEDURE . (renaming_declaration . 2)) (PROTECTED . (renaming_declaration . 2)) (SUBTYPE . (renaming_declaration . 2)) (TASK . (renaming_declaration . 2)) (TYPE . (renaming_declaration . 2)) (USE . (renaming_declaration . 2)))
      ((default . error) (END . (declaration . 15)) (PRIVATE . (declaration . 15)) (USE . (declaration . 15)) (TYPE . (declaration . 15)) (TASK . (declaration . 15)) (SUBTYPE . (declaration . 15)) (PROTECTED . (declaration . 15)) (PROCEDURE . (declaration . 15)) (PRAGMA . (declaration . 15)) (PACKAGE . (declaration . 15)) (OVERRIDING . (declaration . 15)) (NOT . (declaration . 15)) (GENERIC . (declaration . 15)) (FUNCTION . (declaration . 15)) (FOR . (declaration . 15)) (ENTRY . (declaration . 15)) (IDENTIFIER . (declaration . 15)) (BEGIN . (declaration . 15)))
      ((default . error) ($EOI . (proper_body . 2)) (LIMITED . (proper_body . 2)) (SEPARATE . (proper_body . 2)) (WITH . (proper_body . 2)) (END . (proper_body . 2)) (PRIVATE . (proper_body . 2)) (USE . (proper_body . 2)) (TYPE . (proper_body . 2)) (TASK . (proper_body . 2)) (SUBTYPE . (proper_body . 2)) (PROTECTED . (proper_body . 2)) (PROCEDURE . (proper_body . 2)) (PRAGMA . (proper_body . 2)) (PACKAGE . (proper_body . 2)) (OVERRIDING . (proper_body . 2)) (NOT . (proper_body . 2)) (GENERIC . (proper_body . 2)) (FUNCTION . (proper_body . 2)) (FOR . (proper_body . 2)) (ENTRY . (proper_body . 2)) (IDENTIFIER . (proper_body . 2)) (BEGIN . (proper_body . 2)))
      ((default . error) (END . (body_stub . 2)) (PRIVATE . (body_stub . 2)) (USE . (body_stub . 2)) (TYPE . (body_stub . 2)) (TASK . (body_stub . 2)) (SUBTYPE . (body_stub . 2)) (PROTECTED . (body_stub . 2)) (PROCEDURE . (body_stub . 2)) (PRAGMA . (body_stub . 2)) (PACKAGE . (body_stub . 2)) (OVERRIDING . (body_stub . 2)) (NOT . (body_stub . 2)) (GENERIC . (body_stub . 2)) (FUNCTION . (body_stub . 2)) (FOR . (body_stub . 2)) (ENTRY . (body_stub . 2)) (IDENTIFIER . (body_stub . 2)) (BEGIN . (body_stub . 2)))
      ((default . error) (END . (full_type_declaration . 1)) (PRIVATE . (full_type_declaration . 1)) (USE . (full_type_declaration . 1)) (TYPE . (full_type_declaration . 1)) (TASK . (full_type_declaration . 1)) (SUBTYPE . (full_type_declaration . 1)) (PROTECTED . (full_type_declaration . 1)) (PROCEDURE . (full_type_declaration . 1)) (PRAGMA . (full_type_declaration . 1)) (PACKAGE . (full_type_declaration . 1)) (OVERRIDING . (full_type_declaration . 1)) (NOT . (full_type_declaration . 1)) (GENERIC . (full_type_declaration . 1)) (FUNCTION . (full_type_declaration . 1)) (FOR . (full_type_declaration . 1)) (ENTRY . (full_type_declaration . 1)) (IDENTIFIER . (full_type_declaration . 1)) (BEGIN . (full_type_declaration . 1)))
      ((default . error) (END . (declaration . 16)) (PRIVATE . (declaration . 16)) (USE . (declaration . 16)) (TYPE . (declaration . 16)) (TASK . (declaration . 16)) (SUBTYPE . (declaration . 16)) (PROTECTED . (declaration . 16)) (PROCEDURE . (declaration . 16)) (PRAGMA . (declaration . 16)) (PACKAGE . (declaration . 16)) (OVERRIDING . (declaration . 16)) (NOT . (declaration . 16)) (GENERIC . (declaration . 16)) (FUNCTION . (declaration . 16)) (FOR . (declaration . 16)) (ENTRY . (declaration . 16)) (IDENTIFIER . (declaration . 16)) (BEGIN . (declaration . 16)))
      ((default . error) (END . (declaration . 17)) (PRIVATE . (declaration . 17)) (USE . (declaration . 17)) (TYPE . (declaration . 17)) (TASK . (declaration . 17)) (SUBTYPE . (declaration . 17)) (PROTECTED . (declaration . 17)) (PROCEDURE . (declaration . 17)) (PRAGMA . (declaration . 17)) (PACKAGE . (declaration . 17)) (OVERRIDING . (declaration . 17)) (NOT . (declaration . 17)) (GENERIC . (declaration . 17)) (FUNCTION . (declaration . 17)) (FOR . (declaration . 17)) (ENTRY . (declaration . 17)) (IDENTIFIER . (declaration . 17)) (BEGIN . (declaration . 17)))
      ((default . error) (BEGIN . (declarative_part_opt . 0)) (END . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (COLON_EQUAL . (simple_expression . 0)) (OF . (simple_expression . 0)) (LOOP . (simple_expression . 0)) (DO . (simple_expression . 0)) (DOT_DOT . (simple_expression . 0)) (SEMICOLON . (simple_expression . 0)) (XOR . (simple_expression . 0)) (OR . (simple_expression . 0)) (AND . (simple_expression . 0)) (SLASH_EQUAL . (simple_expression . 0)) (LESS_EQUAL . (simple_expression . 0)) (LESS . (simple_expression . 0)) (GREATER_EQUAL . (simple_expression . 0)) (GREATER . (simple_expression . 0)) (EQUAL . (simple_expression . 0)) (NOT . (simple_expression . 0)) (IN . (simple_expression . 0)) (IS . (simple_expression . 0)) (EQUAL_GREATER . (simple_expression . 0)) (BAR . (simple_expression . 0)) (WITH . (simple_expression . 0)) (THEN . (simple_expression . 0)) (RANGE . (simple_expression . 0)) (COMMA . (simple_expression . 0)) (RIGHT_PAREN . (simple_expression . 0)) (DIGITS . (simple_expression . 0)) (ELSE . (simple_expression . 0)) (ELSIF . (simple_expression . 0)) (PLUS .  346) (MINUS .  345) (AMPERSAND .  344))
      ((default . error) (IDENTIFIER . (binary_adding_operator . 2)) (STRING_LITERAL . (binary_adding_operator . 2)) (CHARACTER_LITERAL . (binary_adding_operator . 2)) (ABS . (binary_adding_operator . 2)) (LEFT_PAREN . (binary_adding_operator . 2)) (NEW . (binary_adding_operator . 2)) (NOT . (binary_adding_operator . 2)) (NULL . (binary_adding_operator . 2)))
      ((default . error) (IDENTIFIER . (binary_adding_operator . 1)) (STRING_LITERAL . (binary_adding_operator . 1)) (CHARACTER_LITERAL . (binary_adding_operator . 1)) (ABS . (binary_adding_operator . 1)) (LEFT_PAREN . (binary_adding_operator . 1)) (NEW . (binary_adding_operator . 1)) (NOT . (binary_adding_operator . 1)) (NULL . (binary_adding_operator . 1)))
      ((default . error) (IDENTIFIER . (binary_adding_operator . 0)) (STRING_LITERAL . (binary_adding_operator . 0)) (CHARACTER_LITERAL . (binary_adding_operator . 0)) (ABS . (binary_adding_operator . 0)) (LEFT_PAREN . (binary_adding_operator . 0)) (NEW . (binary_adding_operator . 0)) (NOT . (binary_adding_operator . 0)) (NULL . (binary_adding_operator . 0)))
      ((default . error) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (IDENTIFIER . (multiplying_operator . 1)) (STRING_LITERAL . (multiplying_operator . 1)) (CHARACTER_LITERAL . (multiplying_operator . 1)) (ABS . (multiplying_operator . 1)) (LEFT_PAREN . (multiplying_operator . 1)) (NEW . (multiplying_operator . 1)) (NOT . (multiplying_operator . 1)) (NULL . (multiplying_operator . 1)))
      ((default . error) (IDENTIFIER . (multiplying_operator . 0)) (STRING_LITERAL . (multiplying_operator . 0)) (CHARACTER_LITERAL . (multiplying_operator . 0)) (ABS . (multiplying_operator . 0)) (LEFT_PAREN . (multiplying_operator . 0)) (NEW . (multiplying_operator . 0)) (NOT . (multiplying_operator . 0)) (NULL . (multiplying_operator . 0)))
      ((default . error) (IDENTIFIER . (multiplying_operator . 2)) (STRING_LITERAL . (multiplying_operator . 2)) (CHARACTER_LITERAL . (multiplying_operator . 2)) (ABS . (multiplying_operator . 2)) (LEFT_PAREN . (multiplying_operator . 2)) (NEW . (multiplying_operator . 2)) (NOT . (multiplying_operator . 2)) (NULL . (multiplying_operator . 2)))
      ((default . error) (IDENTIFIER . (multiplying_operator . 3)) (STRING_LITERAL . (multiplying_operator . 3)) (CHARACTER_LITERAL . (multiplying_operator . 3)) (ABS . (multiplying_operator . 3)) (LEFT_PAREN . (multiplying_operator . 3)) (NEW . (multiplying_operator . 3)) (NOT . (multiplying_operator . 3)) (NULL . (multiplying_operator . 3)))
      ((default . error) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (THEN .  413) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (ELSE .  411) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (ELSE .  408))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (THEN .  406))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  145) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON .  402))
      ((default . error) (DOT .  87) (TICK .  88) (COLON_EQUAL . (primary . 3)) (OF . (primary . 3)) (LOOP . (primary . 3)) (DO . (primary . 3)) (STAR_STAR . (primary . 3)) (REM . (primary . 3)) (MOD . (primary . 3)) (STAR . (primary . 3)) (SLASH . (primary . 3)) (DOT_DOT . (primary . 3)) (AMPERSAND . (primary . 3)) (MINUS . (primary . 3)) (PLUS . (primary . 3)) (SEMICOLON . (primary . 3)) (XOR . (primary . 3)) (OR . (primary . 3)) (AND . (primary . 3)) (SLASH_EQUAL . (primary . 3)) (LESS_EQUAL . (primary . 3)) (LESS . (primary . 3)) (GREATER_EQUAL . (primary . 3)) (GREATER . (primary . 3)) (EQUAL . (primary . 3)) (NOT . (primary . 3)) (IN . (primary . 3)) (IS . (primary . 3)) (EQUAL_GREATER . (primary . 3)) (BAR . (primary . 3)) (WITH . (primary . 3)) (THEN . (primary . 3)) (RANGE . (primary . 3)) (COMMA . (primary . 3)) (RIGHT_PAREN . (primary . 3)) (DIGITS . (primary . 3)) (ELSE . (primary . 3)) (ELSIF . (primary . 3)) (LEFT_PAREN .  106))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (ALL .  398) (SOME .  399))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (RIGHT_PAREN .  396))
      ((default . error) (RIGHT_PAREN .  395))
      ((default . error) (RIGHT_PAREN .  394))
      ((default . error) (COLON_EQUAL . (factor . 2)) (OF . (factor . 2)) (LOOP . (factor . 2)) (DO . (factor . 2)) (PLUS . (factor . 2)) (MINUS . (factor . 2)) (AMPERSAND . (factor . 2)) (DOT_DOT . (factor . 2)) (SLASH . (factor . 2)) (STAR . (factor . 2)) (MOD . (factor . 2)) (REM . (factor . 2)) (SEMICOLON . (factor . 2)) (XOR . (factor . 2)) (OR . (factor . 2)) (AND . (factor . 2)) (IN . (factor . 2)) (NOT . (factor . 2)) (EQUAL . (factor . 2)) (GREATER . (factor . 2)) (GREATER_EQUAL . (factor . 2)) (LESS . (factor . 2)) (LESS_EQUAL . (factor . 2)) (SLASH_EQUAL . (factor . 2)) (IS . (factor . 2)) (EQUAL_GREATER . (factor . 2)) (BAR . (factor . 2)) (WITH . (factor . 2)) (THEN . (factor . 2)) (RANGE . (factor . 2)) (RIGHT_PAREN . (factor . 2)) (COMMA . (factor . 2)) (DIGITS . (factor . 2)) (ELSE . (factor . 2)) (ELSIF . (factor . 2)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (IDENTIFIER .  392))
      ((default . error) (BODY .  67))
      ((default . error) (BODY .  391))
      ((default . error) (BODY .  390))
      ((default . error) (FUNCTION .  1) (PROCEDURE .  9))
      ((default . error) ($EOI . (subunit . 0)) (FUNCTION . (subunit . 0)) (GENERIC . (subunit . 0)) (LIMITED . (subunit . 0)) (NOT . (subunit . 0)) (OVERRIDING . (subunit . 0)) (PACKAGE . (subunit . 0)) (PRAGMA . (subunit . 0)) (PRIVATE . (subunit . 0)) (PROCEDURE . (subunit . 0)) (SEPARATE . (subunit . 0)) (USE . (subunit . 0)) (WITH . (subunit . 0)))
      ((default . error) (WITH . (use_clause . 1)) (SEPARATE . (use_clause . 1)) (LIMITED . (use_clause . 1)) ($EOI . (use_clause . 1)) (PRIVATE . (use_clause . 1)) (END . (use_clause . 1)) (BEGIN . (use_clause . 1)) (IDENTIFIER . (use_clause . 1)) (ENTRY . (use_clause . 1)) (FOR . (use_clause . 1)) (FUNCTION . (use_clause . 1)) (GENERIC . (use_clause . 1)) (NOT . (use_clause . 1)) (OVERRIDING . (use_clause . 1)) (PACKAGE . (use_clause . 1)) (PRAGMA . (use_clause . 1)) (PROCEDURE . (use_clause . 1)) (PROTECTED . (use_clause . 1)) (SUBTYPE . (use_clause . 1)) (TASK . (use_clause . 1)) (TYPE . (use_clause . 1)) (USE . (use_clause . 1)))
      ((default . error) (SEMICOLON .  388))
      ((default . error) (BEGIN .  387))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (EXCEPTION . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (BEGIN . (subprogram_renaming_declaration . 0)) (IDENTIFIER . (subprogram_renaming_declaration . 0)) (ENTRY . (subprogram_renaming_declaration . 0)) (FOR . (subprogram_renaming_declaration . 0)) (PROTECTED . (subprogram_renaming_declaration . 0)) (SUBTYPE . (subprogram_renaming_declaration . 0)) (TASK . (subprogram_renaming_declaration . 0)) (TYPE . (subprogram_renaming_declaration . 0)) (END . (subprogram_renaming_declaration . 0)) (WITH . (subprogram_renaming_declaration . 0)) (USE . (subprogram_renaming_declaration . 0)) (SEPARATE . (subprogram_renaming_declaration . 0)) (PROCEDURE . (subprogram_renaming_declaration . 0)) (PRIVATE . (subprogram_renaming_declaration . 0)) (PRAGMA . (subprogram_renaming_declaration . 0)) (PACKAGE . (subprogram_renaming_declaration . 0)) (OVERRIDING . (subprogram_renaming_declaration . 0)) (NOT . (subprogram_renaming_declaration . 0)) (LIMITED . (subprogram_renaming_declaration . 0)) (GENERIC . (subprogram_renaming_declaration . 0)) (FUNCTION . (subprogram_renaming_declaration . 0)) ($EOI . (subprogram_renaming_declaration . 0)))
      ((default . error) (IS . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (IDENTIFIER .  609))
      ((default . error) (IDENTIFIER .  608))
      ((default . error) (EQUAL_GREATER .  607))
      ((default . error) (COMMA . (pragma_argument_association . 0)) (RIGHT_PAREN . (pragma_argument_association . 0)))
      ((default . error) (OF . (primary . 6)) (COLON_EQUAL . (primary . 6)) (DO . (primary . 6)) (LOOP . (primary . 6)) (ELSIF . (primary . 6)) (ELSE . (primary . 6)) (DIGITS . (primary . 6)) (RIGHT_PAREN . (primary . 6)) (COMMA . (primary . 6)) (RANGE . (primary . 6)) (THEN . (primary . 6)) (WITH . (primary . 6)) (BAR . (primary . 6)) (EQUAL_GREATER . (primary . 6)) (IS . (primary . 6)) (IN . (primary . 6)) (NOT . (primary . 6)) (EQUAL . (primary . 6)) (GREATER . (primary . 6)) (GREATER_EQUAL . (primary . 6)) (LESS . (primary . 6)) (LESS_EQUAL . (primary . 6)) (SLASH_EQUAL . (primary . 6)) (AND . (primary . 6)) (OR . (primary . 6)) (XOR . (primary . 6)) (SEMICOLON . (primary . 6)) (PLUS . (primary . 6)) (MINUS . (primary . 6)) (AMPERSAND . (primary . 6)) (DOT_DOT . (primary . 6)) (SLASH . (primary . 6)) (STAR . (primary . 6)) (MOD . (primary . 6)) (REM . (primary . 6)) (STAR_STAR . (primary . 6)))
      ((default . error) (OF . (primary . 4)) (COLON_EQUAL . (primary . 4)) (DO . (primary . 4)) (LOOP . (primary . 4)) (ELSIF . (primary . 4)) (ELSE . (primary . 4)) (DIGITS . (primary . 4)) (RIGHT_PAREN . (primary . 4)) (COMMA . (primary . 4)) (RANGE . (primary . 4)) (THEN . (primary . 4)) (WITH . (primary . 4)) (BAR . (primary . 4)) (EQUAL_GREATER . (primary . 4)) (IS . (primary . 4)) (IN . (primary . 4)) (NOT . (primary . 4)) (EQUAL . (primary . 4)) (GREATER . (primary . 4)) (GREATER_EQUAL . (primary . 4)) (LESS . (primary . 4)) (LESS_EQUAL . (primary . 4)) (SLASH_EQUAL . (primary . 4)) (AND . (primary . 4)) (OR . (primary . 4)) (XOR . (primary . 4)) (SEMICOLON . (primary . 4)) (PLUS . (primary . 4)) (MINUS . (primary . 4)) (AMPERSAND . (primary . 4)) (DOT_DOT . (primary . 4)) (SLASH . (primary . 4)) (STAR . (primary . 4)) (MOD . (primary . 4)) (REM . (primary . 4)) (STAR_STAR . (primary . 4)))
      ((default . error) (OF . (primary . 5)) (COLON_EQUAL . (primary . 5)) (DO . (primary . 5)) (LOOP . (primary . 5)) (ELSIF . (primary . 5)) (ELSE . (primary . 5)) (DIGITS . (primary . 5)) (RIGHT_PAREN . (primary . 5)) (COMMA . (primary . 5)) (RANGE . (primary . 5)) (THEN . (primary . 5)) (WITH . (primary . 5)) (BAR . (primary . 5)) (EQUAL_GREATER . (primary . 5)) (IS . (primary . 5)) (IN . (primary . 5)) (NOT . (primary . 5)) (EQUAL . (primary . 5)) (GREATER . (primary . 5)) (GREATER_EQUAL . (primary . 5)) (LESS . (primary . 5)) (LESS_EQUAL . (primary . 5)) (SLASH_EQUAL . (primary . 5)) (AND . (primary . 5)) (OR . (primary . 5)) (XOR . (primary . 5)) (SEMICOLON . (primary . 5)) (PLUS . (primary . 5)) (MINUS . (primary . 5)) (AMPERSAND . (primary . 5)) (DOT_DOT . (primary . 5)) (SLASH . (primary . 5)) (STAR . (primary . 5)) (MOD . (primary . 5)) (REM . (primary . 5)) (STAR_STAR . (primary . 5)))
      ((default . error) (THEN .  606))
      ((default . error) (IDENTIFIER . (quantifier . 0)))
      ((default . error) (IDENTIFIER . (quantifier . 1)))
      ((default . error) (IDENTIFIER .  604))
      ((default . error) (IS .  603))
      ((default . error) (WHEN . (pragma . 0)) (THEN . (pragma . 0)) (OR . (pragma . 0)) (ELSIF . (pragma . 0)) (ELSE . (pragma . 0)) (WHILE . (pragma . 0)) (SELECT . (pragma . 0)) (RETURN . (pragma . 0)) (REQUEUE . (pragma . 0)) (RAISE . (pragma . 0)) (NULL . (pragma . 0)) (LOOP . (pragma . 0)) (IF . (pragma . 0)) (GOTO . (pragma . 0)) (EXIT . (pragma . 0)) (DELAY . (pragma . 0)) (DECLARE . (pragma . 0)) (CASE . (pragma . 0)) (ABORT . (pragma . 0)) (ACCEPT . (pragma . 0)) (CHARACTER_LITERAL . (pragma . 0)) (STRING_LITERAL . (pragma . 0)) (LESS_LESS . (pragma . 0)) (EXCEPTION . (pragma . 0)) (USE . (pragma . 0)) (TYPE . (pragma . 0)) (TASK . (pragma . 0)) (SUBTYPE . (pragma . 0)) (PROTECTED . (pragma . 0)) (PROCEDURE . (pragma . 0)) (PRAGMA . (pragma . 0)) (PACKAGE . (pragma . 0)) (OVERRIDING . (pragma . 0)) (NOT . (pragma . 0)) (GENERIC . (pragma . 0)) (FUNCTION . (pragma . 0)) (FOR . (pragma . 0)) (ENTRY . (pragma . 0)) (IDENTIFIER . (pragma . 0)) (BEGIN . (pragma . 0)) (END . (pragma . 0)) (PRIVATE . (pragma . 0)) (WITH . (pragma . 0)) ($EOI . (pragma . 0)) (LIMITED . (pragma . 0)) (SEPARATE . (pragma . 0)))
      ((default . error) (RIGHT_PAREN . (pragma_argument_association_list . 1)) (COMMA . (pragma_argument_association_list . 1)))
      ((default . error) (OF . (factor . 0)) (COLON_EQUAL . (factor . 0)) (DO . (factor . 0)) (LOOP . (factor . 0)) (ELSIF . (factor . 0)) (ELSE . (factor . 0)) (DIGITS . (factor . 0)) (COMMA . (factor . 0)) (RIGHT_PAREN . (factor . 0)) (RANGE . (factor . 0)) (THEN . (factor . 0)) (WITH . (factor . 0)) (BAR . (factor . 0)) (EQUAL_GREATER . (factor . 0)) (IS . (factor . 0)) (SLASH_EQUAL . (factor . 0)) (LESS_EQUAL . (factor . 0)) (LESS . (factor . 0)) (GREATER_EQUAL . (factor . 0)) (GREATER . (factor . 0)) (EQUAL . (factor . 0)) (NOT . (factor . 0)) (IN . (factor . 0)) (AND . (factor . 0)) (OR . (factor . 0)) (XOR . (factor . 0)) (SEMICOLON . (factor . 0)) (REM . (factor . 0)) (MOD . (factor . 0)) (STAR . (factor . 0)) (SLASH . (factor . 0)) (DOT_DOT . (factor . 0)) (AMPERSAND . (factor . 0)) (MINUS . (factor . 0)) (PLUS . (factor . 0)))
      ((default . error) (DO . (relation_and_list . 1)) (LOOP . (relation_and_list . 1)) (ELSIF . (relation_and_list . 1)) (ELSE . (relation_and_list . 1)) (EQUAL_GREATER . (relation_and_list . 1)) (DIGITS . (relation_and_list . 1)) (RIGHT_PAREN . (relation_and_list . 1)) (COMMA . (relation_and_list . 1)) (RANGE . (relation_and_list . 1)) (THEN . (relation_and_list . 1)) (SEMICOLON . (relation_and_list . 1)) (WITH . (relation_and_list . 1)) (IS . (relation_and_list . 1)) (AND . (relation_and_list . 1)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (DO . (relation_or_list . 1)) (LOOP . (relation_or_list . 1)) (ELSIF . (relation_or_list . 1)) (ELSE . (relation_or_list . 1)) (EQUAL_GREATER . (relation_or_list . 1)) (DIGITS . (relation_or_list . 1)) (RIGHT_PAREN . (relation_or_list . 1)) (COMMA . (relation_or_list . 1)) (RANGE . (relation_or_list . 1)) (THEN . (relation_or_list . 1)) (SEMICOLON . (relation_or_list . 1)) (WITH . (relation_or_list . 1)) (IS . (relation_or_list . 1)) (OR . (relation_or_list . 1)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (DO . (relation_xor_list . 1)) (LOOP . (relation_xor_list . 1)) (ELSIF . (relation_xor_list . 1)) (ELSE . (relation_xor_list . 1)) (EQUAL_GREATER . (relation_xor_list . 1)) (DIGITS . (relation_xor_list . 1)) (RIGHT_PAREN . (relation_xor_list . 1)) (COMMA . (relation_xor_list . 1)) (RANGE . (relation_xor_list . 1)) (THEN . (relation_xor_list . 1)) (SEMICOLON . (relation_xor_list . 1)) (WITH . (relation_xor_list . 1)) (IS . (relation_xor_list . 1)) (XOR . (relation_xor_list . 1)))
      ((default . error) (DO . (relation_xor_list . 0)) (LOOP . (relation_xor_list . 0)) (ELSIF . (relation_xor_list . 0)) (ELSE . (relation_xor_list . 0)) (EQUAL_GREATER . (relation_xor_list . 0)) (DIGITS . (relation_xor_list . 0)) (RIGHT_PAREN . (relation_xor_list . 0)) (COMMA . (relation_xor_list . 0)) (RANGE . (relation_xor_list . 0)) (THEN . (relation_xor_list . 0)) (SEMICOLON . (relation_xor_list . 0)) (WITH . (relation_xor_list . 0)) (IS . (relation_xor_list . 0)) (XOR . (relation_xor_list . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (DO . (relation_or_list . 0)) (LOOP . (relation_or_list . 0)) (ELSIF . (relation_or_list . 0)) (ELSE . (relation_or_list . 0)) (EQUAL_GREATER . (relation_or_list . 0)) (DIGITS . (relation_or_list . 0)) (RIGHT_PAREN . (relation_or_list . 0)) (COMMA . (relation_or_list . 0)) (RANGE . (relation_or_list . 0)) (THEN . (relation_or_list . 0)) (SEMICOLON . (relation_or_list . 0)) (WITH . (relation_or_list . 0)) (IS . (relation_or_list . 0)) (OR . (relation_or_list . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (DO . (relation_and_list . 0)) (LOOP . (relation_and_list . 0)) (ELSIF . (relation_and_list . 0)) (ELSE . (relation_and_list . 0)) (EQUAL_GREATER . (relation_and_list . 0)) (DIGITS . (relation_and_list . 0)) (RIGHT_PAREN . (relation_and_list . 0)) (COMMA . (relation_and_list . 0)) (RANGE . (relation_and_list . 0)) (THEN . (relation_and_list . 0)) (SEMICOLON . (relation_and_list . 0)) (WITH . (relation_and_list . 0)) (IS . (relation_and_list . 0)) (AND . (relation_and_list . 0)))
      ((default . error) (DO . (relation . 1)) (LOOP . (relation . 1)) (COMMA . (relation . 1)) (ELSIF . (relation . 1)) (ELSE . (relation . 1)) (EQUAL_GREATER . (relation . 1)) (RIGHT_PAREN . (relation . 1)) (DIGITS . (relation . 1)) (RANGE . (relation . 1)) (THEN . (relation . 1)) (SEMICOLON . (relation . 1)) (WITH . (relation . 1)) (IS . (relation . 1)) (AND . (relation . 1)) (OR . (relation . 1)) (XOR . (relation . 1)))
      ((default . error) (OF . (term . 1)) (COLON_EQUAL . (term . 1)) (DO . (term . 1)) (LOOP . (term . 1)) (ELSIF . (term . 1)) (ELSE . (term . 1)) (DIGITS . (term . 1)) (RIGHT_PAREN . (term . 1)) (COMMA . (term . 1)) (RANGE . (term . 1)) (THEN . (term . 1)) (WITH . (term . 1)) (BAR . (term . 1)) (EQUAL_GREATER . (term . 1)) (IS . (term . 1)) (IN . (term . 1)) (NOT . (term . 1)) (EQUAL . (term . 1)) (GREATER . (term . 1)) (GREATER_EQUAL . (term . 1)) (LESS . (term . 1)) (LESS_EQUAL . (term . 1)) (SLASH_EQUAL . (term . 1)) (AND . (term . 1)) (OR . (term . 1)) (XOR . (term . 1)) (SEMICOLON . (term . 1)) (PLUS . (term . 1)) (MINUS . (term . 1)) (AMPERSAND . (term . 1)) (DOT_DOT . (term . 1)) (SLASH . (term . 1)) (STAR . (term . 1)) (MOD . (term . 1)) (REM . (term . 1)))
      ((default . error) (OF . (term_list . 1)) (COLON_EQUAL . (term_list . 1)) (DO . (term_list . 1)) (LOOP . (term_list . 1)) (ELSIF . (term_list . 1)) (ELSE . (term_list . 1)) (DIGITS . (term_list . 1)) (COMMA . (term_list . 1)) (RIGHT_PAREN . (term_list . 1)) (RANGE . (term_list . 1)) (THEN . (term_list . 1)) (WITH . (term_list . 1)) (BAR . (term_list . 1)) (EQUAL_GREATER . (term_list . 1)) (IS . (term_list . 1)) (SLASH_EQUAL . (term_list . 1)) (LESS_EQUAL . (term_list . 1)) (LESS . (term_list . 1)) (GREATER_EQUAL . (term_list . 1)) (GREATER . (term_list . 1)) (EQUAL . (term_list . 1)) (NOT . (term_list . 1)) (IN . (term_list . 1)) (AND . (term_list . 1)) (OR . (term_list . 1)) (XOR . (term_list . 1)) (SEMICOLON . (term_list . 1)) (DOT_DOT . (term_list . 1)) (AMPERSAND . (term_list . 1)) (MINUS . (term_list . 1)) (PLUS . (term_list . 1)) (STAR .  349) (SLASH .  348) (MOD .  350) (REM .  351))
      ((default . error) (BEGIN .  597) (END .  598))
      ((default . error) (IDENTIFIER .  596))
      ((default . error) (IS . ( 595 (subprogram_specification . 1))) (WITH . (subprogram_specification . 1)) (SEMICOLON . (subprogram_specification . 1)) (RENAMES . (subprogram_specification . 1)))
      ((default . error) (IS . ( 594 (subprogram_specification . 0))) (WITH . (subprogram_specification . 0)) (SEMICOLON . (subprogram_specification . 0)) (RENAMES . (subprogram_specification . 0)))
      ((default . error) (RENAMES .  127) (SEMICOLON . (aspect_specification_opt . 0)) (IS . ( 593 (aspect_specification_opt . 0))) (WITH .  108))
      ((default . error) (EXCEPTION .  591) (CONSTANT . ( 590 (aliased_opt . 0))) (ARRAY . (aliased_opt . 0)) (ACCESS . (aliased_opt . 0)) (NOT . (aliased_opt . 0)) (IDENTIFIER . (aliased_opt . 0)) (STRING_LITERAL . (aliased_opt . 0)) (CHARACTER_LITERAL . (aliased_opt . 0)) (ALIASED .  512))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (END . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (USE . (declarations . 1)) (TYPE . (declarations . 1)) (TASK . (declarations . 1)) (SUBTYPE . (declarations . 1)) (PROTECTED . (declarations . 1)) (PROCEDURE . (declarations . 1)) (PRAGMA . (declarations . 1)) (PACKAGE . (declarations . 1)) (OVERRIDING . (declarations . 1)) (NOT . (declarations . 1)) (GENERIC . (declarations . 1)) (FUNCTION . (declarations . 1)) (FOR . (declarations . 1)) (ENTRY . (declarations . 1)) (IDENTIFIER . (declarations . 1)) (BEGIN . (declarations . 1)) (END . (declarations . 1)) (PRIVATE . (declarations . 1)))
      ((default . error) (SEMICOLON .  586) (IS . (discriminant_part_opt . 0)) (LEFT_PAREN .  198))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (IS . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (IDENTIFIER .  584))
      ((default . error) (IDENTIFIER .  583))
      ((default . error) (IS .  582))
      ((default . error) (IS . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (IDENTIFIER .  580))
      ((default . error) (IDENTIFIER .  579))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (USE . ((direct_name . 0) (name . 0))) (LEFT_PAREN . (name . 0)) (DOT . (name . 0)) (TICK . (name . 0)))
      ((default . error) (USE . ((direct_name . 1) (name . 7))) (LEFT_PAREN . (name . 7)) (DOT . (name . 7)) (TICK . (name . 7)))
      ((default . error) (USE . ( 577 (name . 4))) (LEFT_PAREN . (name . 4)) (DOT . (name . 4)) (TICK . (name . 4)))
      ((default . error) (USE .  576))
      ((default . error) (DOT .  87) (TICK .  88) (USE .  575) (LEFT_PAREN .  106))
      ((default . error) (EXCEPTION .  572) (IDENTIFIER . (null_exclusion_opt . 0)) (STRING_LITERAL . (null_exclusion_opt . 0)) (CHARACTER_LITERAL . (null_exclusion_opt . 0)) (ACCESS . (null_exclusion_opt . 0)) (NOT .  208))
      ((default . error) (SEMICOLON . (association_opt . 2)) (IS . (association_opt . 2)) (COMMA . (association_opt . 2)) (RIGHT_PAREN . (association_opt . 2)))
      ((default . error) (SEMICOLON . (association_opt . 1)) (IS . (association_opt . 1)) (COMMA . (association_opt . 1)) (RIGHT_PAREN . (association_opt . 1)))
      ((default . error) (DOT .  87) (TICK .  88) (BAR . (discrete_choice . 1)) (EQUAL_GREATER . (discrete_choice . 1)) (LEFT_PAREN .  106))
      ((default . error) (BAR . (choice_relation_and_list . 1)) (EQUAL_GREATER . (choice_relation_and_list . 1)) (AND . (choice_relation_and_list . 1)))
      ((default . error) (XOR . (choice_relation . 1)) (OR . (choice_relation . 1)) (BAR . (choice_relation . 1)) (EQUAL_GREATER . (choice_relation . 1)) (AND . (choice_relation . 1)) (EQUAL .  265) (SLASH_EQUAL .  270) (LESS .  268) (LESS_EQUAL .  269) (GREATER .  266) (GREATER_EQUAL .  267))
      ((default . error) (BAR . (choice_relation_or_list . 1)) (EQUAL_GREATER . (choice_relation_or_list . 1)) (OR . (choice_relation_or_list . 1)))
      ((default . error) (BAR . (choice_relation_xor_list . 1)) (EQUAL_GREATER . (choice_relation_xor_list . 1)) (XOR . (choice_relation_xor_list . 1)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (BAR . (choice_relation_xor_list . 0)) (EQUAL_GREATER . (choice_relation_xor_list . 0)) (XOR . (choice_relation_xor_list . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (BAR . (choice_relation_or_list . 0)) (EQUAL_GREATER . (choice_relation_or_list . 0)) (OR . (choice_relation_or_list . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (BAR . (choice_relation_and_list . 0)) (EQUAL_GREATER . (choice_relation_and_list . 0)) (AND . (choice_relation_and_list . 0)))
      ((default . error) (SEMICOLON . (association_opt . 4)) (IS . (association_opt . 4)) (COMMA . (association_opt . 4)) (RIGHT_PAREN . (association_opt . 4)))
      ((default . error) (SEMICOLON . (association_opt . 3)) (IS . (association_opt . 3)) (COMMA . (association_opt . 3)) (RIGHT_PAREN . (association_opt . 3)))
      ((default . error) (EQUAL_GREATER . (discrete_choice_list . 2)) (BAR . (discrete_choice_list . 2)))
      ((default . error) (DOT_DOT .  264) (BAR . (choice_relation . 1)) (EQUAL_GREATER . (choice_relation . 1)) (AND . (choice_relation . 1)) (OR . (choice_relation . 1)) (XOR . (choice_relation . 1)) (EQUAL .  265) (SLASH_EQUAL .  270) (LESS .  268) (LESS_EQUAL .  269) (GREATER .  266) (GREATER_EQUAL .  267))
      ((default . error) (LOOP . (range . 1)) (DO . (range . 1)) (COMMA . (range . 1)) (OF . (range . 1)) (COLON_EQUAL . (range . 1)) (ELSIF . (range . 1)) (ELSE . (range . 1)) (DIGITS . (range . 1)) (RANGE . (range . 1)) (THEN . (range . 1)) (SEMICOLON . (range . 1)) (WITH . (range . 1)) (IS . (range . 1)) (AND . (range . 1)) (OR . (range . 1)) (XOR . (range . 1)) (RIGHT_PAREN . (range . 1)) (EQUAL_GREATER . (range . 1)) (BAR . (range . 1)) (LEFT_PAREN .  566))
      ((default . error) (SEMICOLON . (relation . 1)) (IS . (relation . 1)) (WITH . (relation . 1)) (RIGHT_PAREN . (relation . 1)) (COMMA . (relation . 1)) (BAR . (choice_relation . 0)) (EQUAL_GREATER . (choice_relation . 0)) (AND . ((relation . 1) (choice_relation . 0))) (OR . ((relation . 1) (choice_relation . 0))) (XOR . ((relation . 1) (choice_relation . 0))))
      ((default . error) (PLUS .  144) (MINUS .  143) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (BAR .  564) (DO . (relation . 3)) (LOOP . (relation . 3)) (COMMA . (relation . 3)) (ELSIF . (relation . 3)) (ELSE . (relation . 3)) (EQUAL_GREATER . (relation . 3)) (RIGHT_PAREN . (relation . 3)) (DIGITS . (relation . 3)) (RANGE . (relation . 3)) (THEN . (relation . 3)) (SEMICOLON . (relation . 3)) (WITH . (relation . 3)) (IS . (relation . 3)) (AND . (relation . 3)) (OR . (relation . 3)) (XOR . (relation . 3)))
      ((default . error) (DO . (membership_choice_list . 0)) (LOOP . (membership_choice_list . 0)) (COMMA . (membership_choice_list . 0)) (ELSIF . (membership_choice_list . 0)) (ELSE . (membership_choice_list . 0)) (EQUAL_GREATER . (membership_choice_list . 0)) (RIGHT_PAREN . (membership_choice_list . 0)) (DIGITS . (membership_choice_list . 0)) (RANGE . (membership_choice_list . 0)) (THEN . (membership_choice_list . 0)) (SEMICOLON . (membership_choice_list . 0)) (WITH . (membership_choice_list . 0)) (IS . (membership_choice_list . 0)) (AND . (membership_choice_list . 0)) (OR . (membership_choice_list . 0)) (XOR . (membership_choice_list . 0)) (BAR . (membership_choice_list . 0)))
      ((default . error) (DO . (membership_choice . 1)) (LOOP . (membership_choice . 1)) (COMMA . (membership_choice . 1)) (ELSIF . (membership_choice . 1)) (ELSE . (membership_choice . 1)) (EQUAL_GREATER . (membership_choice . 1)) (RIGHT_PAREN . (membership_choice . 1)) (DIGITS . (membership_choice . 1)) (RANGE . (membership_choice . 1)) (THEN . (membership_choice . 1)) (SEMICOLON . (membership_choice . 1)) (WITH . (membership_choice . 1)) (IS . (membership_choice . 1)) (AND . (membership_choice . 1)) (OR . (membership_choice . 1)) (XOR . (membership_choice . 1)) (BAR . (membership_choice . 1)))
      ((default . error) (DOT_DOT .  264) (DO . (membership_choice . 0)) (LOOP . (membership_choice . 0)) (COMMA . (membership_choice . 0)) (ELSIF . (membership_choice . 0)) (ELSE . (membership_choice . 0)) (EQUAL_GREATER . (membership_choice . 0)) (RIGHT_PAREN . (membership_choice . 0)) (DIGITS . (membership_choice . 0)) (RANGE . (membership_choice . 0)) (THEN . (membership_choice . 0)) (SEMICOLON . (membership_choice . 0)) (WITH . (membership_choice . 0)) (IS . (membership_choice . 0)) (AND . (membership_choice . 0)) (OR . (membership_choice . 0)) (XOR . (membership_choice . 0)) (BAR . (membership_choice . 0)))
      ((default . error) (DO . (range . 2)) (LOOP . (range . 2)) (OF . (range . 2)) (COLON_EQUAL . (range . 2)) (ELSIF . (range . 2)) (ELSE . (range . 2)) (DIGITS . (range . 2)) (RANGE . (range . 2)) (THEN . (range . 2)) (SEMICOLON . (range . 2)) (WITH . (range . 2)) (IS . (range . 2)) (AND . (range . 2)) (OR . (range . 2)) (XOR . (range . 2)) (COMMA . (range . 2)) (RIGHT_PAREN . (range . 2)) (EQUAL_GREATER . (range . 2)) (BAR . (range . 2)))
      ((default . error) (BEGIN . (package_renaming_declaration . 0)) (IDENTIFIER . (package_renaming_declaration . 0)) (ENTRY . (package_renaming_declaration . 0)) (FOR . (package_renaming_declaration . 0)) (PROTECTED . (package_renaming_declaration . 0)) (SUBTYPE . (package_renaming_declaration . 0)) (TASK . (package_renaming_declaration . 0)) (TYPE . (package_renaming_declaration . 0)) (END . (package_renaming_declaration . 0)) (WITH . (package_renaming_declaration . 0)) (USE . (package_renaming_declaration . 0)) (SEPARATE . (package_renaming_declaration . 0)) (PROCEDURE . (package_renaming_declaration . 0)) (PRIVATE . (package_renaming_declaration . 0)) (PRAGMA . (package_renaming_declaration . 0)) (PACKAGE . (package_renaming_declaration . 0)) (OVERRIDING . (package_renaming_declaration . 0)) (NOT . (package_renaming_declaration . 0)) (LIMITED . (package_renaming_declaration . 0)) (GENERIC . (package_renaming_declaration . 0)) (FUNCTION . (package_renaming_declaration . 0)) ($EOI . (package_renaming_declaration . 0)))
      ((default . error) (SEMICOLON . (association_list . 1)) (IS . (association_list . 1)) (COMMA . (association_list . 1)) (RIGHT_PAREN . (association_list . 1)))
      ((default . error) (SEMICOLON .  563))
      ((default . error) (SEMICOLON .  562))
      ((default . error) (SEMICOLON .  561))
      ((default . error) (SEMICOLON .  560))
      ((default . error) (ACCESS . (null_exclusion_opt . 0)) (NOT .  555) (IDENTIFIER .  554) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (RIGHT_PAREN . (discriminant_specification_opt . 0)) (SEMICOLON . (discriminant_specification_opt . 0)) (IDENTIFIER .  72))
      ((default . error) (IS . (discriminant_part_opt . 2)) (WITH . (discriminant_part_opt . 2)) (SEMICOLON . (discriminant_part_opt . 2)))
      ((default . error) (IS . (discriminant_part_opt . 1)) (WITH . (discriminant_part_opt . 1)) (SEMICOLON . (discriminant_part_opt . 1)))
      ((default . error) (PACKAGE . (formal_type_declaration . 2)) (PROCEDURE . (formal_type_declaration . 2)) (FUNCTION . (formal_type_declaration . 2)) (IDENTIFIER . (formal_type_declaration . 2)) (PRAGMA . (formal_type_declaration . 2)) (TYPE . (formal_type_declaration . 2)) (WITH . (formal_type_declaration . 2)))
      ((default . error) (TAGGED .  552) (NEW . (abstract_limited_synchronized_opt . 3)) (SYNCHRONIZED .  551) (LIMITED .  550))
      ((default . error) (LEFT_PAREN .  549))
      ((default . error) (BOX .  548))
      ((default . error) (BOX .  547))
      ((default . error) (SEMICOLON . (interface_type_definition . 8)) (WITH . (interface_type_definition . 8)))
      ((default . error) (BOX .  546))
      ((default . error) (INTERFACE .  545) (PRIVATE . (abstract_tagged_limited_opt . 5)) (NEW . (abstract_limited_synchronized_opt . 4)))
      ((default . error) (BOX .  544))
      ((default . error) (INTERFACE .  543))
      ((default . error) (BOX .  542))
      ((default . error) (INTERFACE .  541) (NEW . (abstract_limited_synchronized_opt . 5)))
      ((default . error) (PRIVATE . (abstract_tagged_limited_opt . 4)) (LIMITED .  539) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (INTERFACE .  538))
      ((default . error) (NEW .  537))
      ((default . error) (PRIVATE .  536))
      ((default . error) (WITH . (formal_type_definition . 9)) (SEMICOLON . (formal_type_definition . 9)))
      ((default . error) (WITH . (formal_type_definition . 8)) (SEMICOLON . (formal_type_definition . 8)))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (WITH . (formal_type_definition . 1)) (SEMICOLON . (formal_type_definition . 1)))
      ((default . error) (WITH . (formal_type_definition . 10)) (SEMICOLON . (formal_type_definition . 10)))
      ((default . error) (SEMICOLON .  534))
      ((default . error) (SEMICOLON .  533))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (DOT .  87) (TICK .  88) (COLON_EQUAL .  529) (LEFT_PAREN .  106) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON .  527))
      ((default . error) (RIGHT_PAREN . (parameter_and_result_profile . 0)) (DO . (parameter_and_result_profile . 0)) (RENAMES . (parameter_and_result_profile . 0)) (COLON_EQUAL . (parameter_and_result_profile . 0)) (WITH . (parameter_and_result_profile . 0)) (SEMICOLON . (parameter_and_result_profile . 0)) (IS . (parameter_and_result_profile . 0)))
      ((default . error) (IDENTIFIER . (general_access_modifier_opt . 1)) (STRING_LITERAL . (general_access_modifier_opt . 1)) (CHARACTER_LITERAL . (general_access_modifier_opt . 1)))
      ((default . error) (IDENTIFIER . (general_access_modifier_opt . 2)) (STRING_LITERAL . (general_access_modifier_opt . 2)) (CHARACTER_LITERAL . (general_access_modifier_opt . 2)))
      ((default . error) (FUNCTION . (protected_opt . 1)) (PROCEDURE . (protected_opt . 1)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (FUNCTION .  524) (PROCEDURE .  525))
      ((default . error) (IN . (aliased_opt . 1)) (OUT . (aliased_opt . 1)) (ARRAY . (aliased_opt . 1)) (CONSTANT . (aliased_opt . 1)) (IDENTIFIER . (aliased_opt . 1)) (STRING_LITERAL . (aliased_opt . 1)) (CHARACTER_LITERAL . (aliased_opt . 1)) (ACCESS . (aliased_opt . 1)) (NOT . (aliased_opt . 1)))
      ((default . error) (SEMICOLON . (parameter_specification . 3)) (RIGHT_PAREN . (parameter_specification . 3)) (COLON_EQUAL .  523))
      ((default . error) (NOT . (mode_opt . 0)) (IDENTIFIER . (mode_opt . 0)) (STRING_LITERAL . (mode_opt . 0)) (CHARACTER_LITERAL . (mode_opt . 0)) (IN .  204) (OUT .  205))
      ((default . error) (RIGHT_PAREN . (parameter_specification_list . 1)) (SEMICOLON . (parameter_specification_list . 1)))
      ((default . error) (RIGHT_PAREN . ((association_opt . 0) (expression_opt . 0))) (COMMA . ((association_opt . 0) (expression_opt . 0))) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (OTHERS .  172) (IDENTIFIER .  48) (CHARACTER_LITERAL .  170) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  171) (NULL .  520) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (DO . (aggregate . 0)) (LOOP . (aggregate . 0)) (USE . (aggregate . 0)) (COLON_EQUAL . (aggregate . 0)) (WHILE . (aggregate . 0)) (SELECT . (aggregate . 0)) (REQUEUE . (aggregate . 0)) (RAISE . (aggregate . 0)) (PRAGMA . (aggregate . 0)) (NULL . (aggregate . 0)) (IF . (aggregate . 0)) (GOTO . (aggregate . 0)) (FOR . (aggregate . 0)) (EXIT . (aggregate . 0)) (DELAY . (aggregate . 0)) (DECLARE . (aggregate . 0)) (CASE . (aggregate . 0)) (BEGIN . (aggregate . 0)) (ABORT . (aggregate . 0)) (ACCEPT . (aggregate . 0)) (CHARACTER_LITERAL . (aggregate . 0)) (STRING_LITERAL . (aggregate . 0)) (IDENTIFIER . (aggregate . 0)) (LESS_LESS . (aggregate . 0)) (OF . (aggregate . 0)) (ELSIF . (aggregate . 0)) (ELSE . (aggregate . 0)) (DIGITS . (aggregate . 0)) (COMMA . (aggregate . 0)) (RIGHT_PAREN . (aggregate . 0)) (RANGE . (aggregate . 0)) (THEN . (aggregate . 0)) (WITH . (aggregate . 0)) (BAR . (aggregate . 0)) (EQUAL_GREATER . (aggregate . 0)) (IS . (aggregate . 0)) (SLASH_EQUAL . (aggregate . 0)) (LESS_EQUAL . (aggregate . 0)) (LESS . (aggregate . 0)) (GREATER_EQUAL . (aggregate . 0)) (GREATER . (aggregate . 0)) (EQUAL . (aggregate . 0)) (NOT . (aggregate . 0)) (IN . (aggregate . 0)) (AND . (aggregate . 0)) (OR . (aggregate . 0)) (XOR . (aggregate . 0)) (SEMICOLON . (aggregate . 0)) (STAR_STAR . (aggregate . 0)) (REM . (aggregate . 0)) (MOD . (aggregate . 0)) (STAR . (aggregate . 0)) (SLASH . (aggregate . 0)) (DOT_DOT . (aggregate . 0)) (AMPERSAND . (aggregate . 0)) (MINUS . (aggregate . 0)) (PLUS . (aggregate . 0)) (LEFT_PAREN . (aggregate . 0)) (DOT . (aggregate . 0)) (TICK . (aggregate . 0)) (RENAMES . (aggregate . 0)) (RETURN . (aggregate . 0)))
      ((default . error) (RIGHT_PAREN .  519))
      ((default . error) (OF . (aggregate . 3)) (LESS_LESS . (aggregate . 3)) (IDENTIFIER . (aggregate . 3)) (STRING_LITERAL . (aggregate . 3)) (CHARACTER_LITERAL . (aggregate . 3)) (ACCEPT . (aggregate . 3)) (ABORT . (aggregate . 3)) (BEGIN . (aggregate . 3)) (CASE . (aggregate . 3)) (DECLARE . (aggregate . 3)) (DELAY . (aggregate . 3)) (EXIT . (aggregate . 3)) (FOR . (aggregate . 3)) (GOTO . (aggregate . 3)) (IF . (aggregate . 3)) (NULL . (aggregate . 3)) (PRAGMA . (aggregate . 3)) (RAISE . (aggregate . 3)) (REQUEUE . (aggregate . 3)) (SELECT . (aggregate . 3)) (WHILE . (aggregate . 3)) (COLON_EQUAL . (aggregate . 3)) (USE . (aggregate . 3)) (LOOP . (aggregate . 3)) (DO . (aggregate . 3)) (RETURN . (aggregate . 3)) (RENAMES . (aggregate . 3)) (TICK . (aggregate . 3)) (DOT . (aggregate . 3)) (LEFT_PAREN . (aggregate . 3)) (PLUS . (aggregate . 3)) (MINUS . (aggregate . 3)) (AMPERSAND . (aggregate . 3)) (DOT_DOT . (aggregate . 3)) (SLASH . (aggregate . 3)) (STAR . (aggregate . 3)) (MOD . (aggregate . 3)) (REM . (aggregate . 3)) (STAR_STAR . (aggregate . 3)) (SEMICOLON . (aggregate . 3)) (XOR . (aggregate . 3)) (OR . (aggregate . 3)) (AND . (aggregate . 3)) (IN . (aggregate . 3)) (NOT . (aggregate . 3)) (EQUAL . (aggregate . 3)) (GREATER . (aggregate . 3)) (GREATER_EQUAL . (aggregate . 3)) (LESS . (aggregate . 3)) (LESS_EQUAL . (aggregate . 3)) (SLASH_EQUAL . (aggregate . 3)) (IS . (aggregate . 3)) (EQUAL_GREATER . (aggregate . 3)) (BAR . (aggregate . 3)) (WITH . (aggregate . 3)) (THEN . (aggregate . 3)) (RANGE . (aggregate . 3)) (RIGHT_PAREN . (aggregate . 3)) (COMMA . (aggregate . 3)) (DIGITS . (aggregate . 3)) (ELSE . (aggregate . 3)) (ELSIF . (aggregate . 3)))
      ((default . error) (PLUS . (primary . 0)) (MINUS . (primary . 0)) (AMPERSAND . (primary . 0)) (DOT_DOT . (primary . 0)) (IN . (primary . 0)) (NOT . (primary . 0)) (EQUAL . (primary . 0)) (GREATER . (primary . 0)) (GREATER_EQUAL . (primary . 0)) (LESS . (primary . 0)) (LESS_EQUAL . (primary . 0)) (SLASH_EQUAL . (primary . 0)) (RIGHT_PAREN . (primary . 0)) (COMMA . (primary . 0)) (SLASH . (primary . 0)) (STAR . (primary . 0)) (MOD . (primary . 0)) (REM . (primary . 0)) (STAR_STAR . (primary . 0)) (BAR . (primary . 0)) (EQUAL_GREATER . (primary . 0)) (AND . (primary . 0)) (OR . (primary . 0)) (XOR . (primary . 0)) (RECORD .  788))
      ((default . error) (COMMA .  261) (RIGHT_PAREN .  787))
      ((default . error) (IDENTIFIER . (null_exclusion_opt . 0)) (STRING_LITERAL . (null_exclusion_opt . 0)) (CHARACTER_LITERAL . (null_exclusion_opt . 0)) (NOT .  208))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (RETURN .  90) (LEFT_PAREN .  782))
      ((default . error) (IS . (parameter_profile_opt . 0)) (SEMICOLON . (parameter_profile_opt . 0)) (WITH . (parameter_profile_opt . 0)) (COLON_EQUAL . (parameter_profile_opt . 0)) (RENAMES . (parameter_profile_opt . 0)) (DO . (parameter_profile_opt . 0)) (RIGHT_PAREN . (parameter_profile_opt . 0)) (LEFT_PAREN .  782))
      ((default . error) (DOT .  87) (TICK .  88) (RIGHT_PAREN . (access_definition . 0)) (DO . (access_definition . 0)) (RENAMES . (access_definition . 0)) (COLON_EQUAL . (access_definition . 0)) (WITH . (access_definition . 0)) (SEMICOLON . (access_definition . 0)) (IS . (access_definition . 0)) (LEFT_PAREN .  106))
      ((default . error) (WITH . (formal_object_declaration . 3)) (TYPE . (formal_object_declaration . 3)) (PRAGMA . (formal_object_declaration . 3)) (IDENTIFIER . (formal_object_declaration . 3)) (FUNCTION . (formal_object_declaration . 3)) (PROCEDURE . (formal_object_declaration . 3)) (PACKAGE . (formal_object_declaration . 3)))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON .  779))
      ((default . error) (DOT .  87) (TICK .  88) (WITH . (formal_package_actual_part . 1)) (SEMICOLON . (formal_package_actual_part . 1)) (LEFT_PAREN .  777))
      ((default . error) (SEMICOLON .  776))
      ((default . error) (WITH . (formal_subprogram_declaration . 3)) (TYPE . (formal_subprogram_declaration . 3)) (PRAGMA . (formal_subprogram_declaration . 3)) (IDENTIFIER . (formal_subprogram_declaration . 3)) (FUNCTION . (formal_subprogram_declaration . 3)) (PROCEDURE . (formal_subprogram_declaration . 3)) (PACKAGE . (formal_subprogram_declaration . 3)))
      ((default . error) (WITH . (formal_subprogram_declaration . 0)) (TYPE . (formal_subprogram_declaration . 0)) (PRAGMA . (formal_subprogram_declaration . 0)) (IDENTIFIER . (formal_subprogram_declaration . 0)) (FUNCTION . (formal_subprogram_declaration . 0)) (PROCEDURE . (formal_subprogram_declaration . 0)) (PACKAGE . (formal_subprogram_declaration . 0)))
      ((default . error) (SEMICOLON .  775))
      ((default . error) (SEMICOLON . (formal_type_definition . 0)) (WITH . (formal_type_definition . 0)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (AND .  773) (WITH . (interface_type_definition . 5)) (SEMICOLON . (interface_type_definition . 5)))
      ((default . error) (RECORD . (abstract_tagged_limited_opt . 3)) (NULL . (abstract_tagged_limited_opt . 3)) (PRIVATE . (abstract_tagged_limited_opt . 3)))
      ((default . error) (SEMICOLON .  772))
      ((default . error) (AND .  771) (WITH . (interface_type_definition . 7)) (SEMICOLON . (interface_type_definition . 7)))
      ((default . error) (SEMICOLON . (formal_type_definition . 3)) (WITH . (formal_type_definition . 3)))
      ((default . error) (AND .  770) (WITH . (interface_type_definition . 6)) (SEMICOLON . (interface_type_definition . 6)))
      ((default . error) (SEMICOLON . (formal_type_definition . 4)) (WITH . (formal_type_definition . 4)))
      ((default . error) (AND .  769) (WITH . (interface_type_definition . 4)) (SEMICOLON . (interface_type_definition . 4)))
      ((default . error) (RIGHT_PAREN .  768))
      ((default . error) (SEMICOLON . (formal_type_definition . 5)) (WITH . (formal_type_definition . 5)))
      ((default . error) (SEMICOLON . (formal_type_definition . 6)) (WITH . (formal_type_definition . 6)) (DIGITS .  767))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  758) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (NEW . (abstract_limited_synchronized_opt . 1)))
      ((default . error) (NEW . (abstract_limited_synchronized_opt . 2)))
      ((default . error) (LIMITED .  757) (RECORD . (abstract_tagged_limited_opt . 2)) (NULL . (abstract_tagged_limited_opt . 2)) (PRIVATE . (abstract_tagged_limited_opt . 2)))
      ((default . error) (RIGHT_PAREN . (discriminant_specification_list . 1)) (SEMICOLON . (discriminant_specification_list . 1)))
      ((default . error) (SEMICOLON . (null_exclusion_opt_name . 0)) (RIGHT_PAREN . (null_exclusion_opt_name . 0)) (COLON_EQUAL . (null_exclusion_opt_name . 0)) (DOT . (name . 0)) (LEFT_PAREN . (name . 0)) (TICK . (name . 0)))
      ((default . error) (NULL .  756))
      ((default . error) (SEMICOLON . (discriminant_specification_opt . 4)) (RIGHT_PAREN . (discriminant_specification_opt . 4)) (COLON_EQUAL .  755))
      ((default . error) (DOT .  87) (TICK .  88) (LEFT_PAREN .  106))
      ((default . error) (SEMICOLON . (discriminant_specification_opt . 2)) (RIGHT_PAREN . (discriminant_specification_opt . 2)) (COLON_EQUAL .  754))
      ((default . error) (SEMICOLON . (null_exclusion_opt_name . 1)) (RIGHT_PAREN . (null_exclusion_opt_name . 1)) (COLON_EQUAL . (null_exclusion_opt_name . 1)) (DOT . (name . 3)) (LEFT_PAREN . (name . 3)) (TICK . (name . 3)))
      ((default . error) ($EOI . (generic_renaming_declaration . 1)) (LIMITED . (generic_renaming_declaration . 1)) (SEPARATE . (generic_renaming_declaration . 1)) (WITH . (generic_renaming_declaration . 1)) (END . (generic_renaming_declaration . 1)) (PRIVATE . (generic_renaming_declaration . 1)) (USE . (generic_renaming_declaration . 1)) (TYPE . (generic_renaming_declaration . 1)) (TASK . (generic_renaming_declaration . 1)) (SUBTYPE . (generic_renaming_declaration . 1)) (PROTECTED . (generic_renaming_declaration . 1)) (PROCEDURE . (generic_renaming_declaration . 1)) (PRAGMA . (generic_renaming_declaration . 1)) (PACKAGE . (generic_renaming_declaration . 1)) (OVERRIDING . (generic_renaming_declaration . 1)) (NOT . (generic_renaming_declaration . 1)) (GENERIC . (generic_renaming_declaration . 1)) (FUNCTION . (generic_renaming_declaration . 1)) (FOR . (generic_renaming_declaration . 1)) (ENTRY . (generic_renaming_declaration . 1)) (IDENTIFIER . (generic_renaming_declaration . 1)) (BEGIN . (generic_renaming_declaration . 1)))
      ((default . error) ($EOI . (generic_renaming_declaration . 0)) (LIMITED . (generic_renaming_declaration . 0)) (SEPARATE . (generic_renaming_declaration . 0)) (WITH . (generic_renaming_declaration . 0)) (END . (generic_renaming_declaration . 0)) (PRIVATE . (generic_renaming_declaration . 0)) (USE . (generic_renaming_declaration . 0)) (TYPE . (generic_renaming_declaration . 0)) (TASK . (generic_renaming_declaration . 0)) (SUBTYPE . (generic_renaming_declaration . 0)) (PROTECTED . (generic_renaming_declaration . 0)) (PROCEDURE . (generic_renaming_declaration . 0)) (PRAGMA . (generic_renaming_declaration . 0)) (PACKAGE . (generic_renaming_declaration . 0)) (OVERRIDING . (generic_renaming_declaration . 0)) (NOT . (generic_renaming_declaration . 0)) (GENERIC . (generic_renaming_declaration . 0)) (FUNCTION . (generic_renaming_declaration . 0)) (FOR . (generic_renaming_declaration . 0)) (ENTRY . (generic_renaming_declaration . 0)) (IDENTIFIER . (generic_renaming_declaration . 0)) (BEGIN . (generic_renaming_declaration . 0)))
      ((default . error) ($EOI . (generic_renaming_declaration . 2)) (LIMITED . (generic_renaming_declaration . 2)) (SEPARATE . (generic_renaming_declaration . 2)) (WITH . (generic_renaming_declaration . 2)) (END . (generic_renaming_declaration . 2)) (PRIVATE . (generic_renaming_declaration . 2)) (USE . (generic_renaming_declaration . 2)) (TYPE . (generic_renaming_declaration . 2)) (TASK . (generic_renaming_declaration . 2)) (SUBTYPE . (generic_renaming_declaration . 2)) (PROTECTED . (generic_renaming_declaration . 2)) (PROCEDURE . (generic_renaming_declaration . 2)) (PRAGMA . (generic_renaming_declaration . 2)) (PACKAGE . (generic_renaming_declaration . 2)) (OVERRIDING . (generic_renaming_declaration . 2)) (NOT . (generic_renaming_declaration . 2)) (GENERIC . (generic_renaming_declaration . 2)) (FUNCTION . (generic_renaming_declaration . 2)) (FOR . (generic_renaming_declaration . 2)) (ENTRY . (generic_renaming_declaration . 2)) (IDENTIFIER . (generic_renaming_declaration . 2)) (BEGIN . (generic_renaming_declaration . 2)))
      ((default . error) (END . (generic_instantiation . 0)) (BEGIN . (generic_instantiation . 0)) (IDENTIFIER . (generic_instantiation . 0)) (ENTRY . (generic_instantiation . 0)) (FOR . (generic_instantiation . 0)) (PROTECTED . (generic_instantiation . 0)) (SUBTYPE . (generic_instantiation . 0)) (TASK . (generic_instantiation . 0)) (TYPE . (generic_instantiation . 0)) ($EOI . (generic_instantiation . 0)) (FUNCTION . (generic_instantiation . 0)) (GENERIC . (generic_instantiation . 0)) (LIMITED . (generic_instantiation . 0)) (NOT . (generic_instantiation . 0)) (OVERRIDING . (generic_instantiation . 0)) (PACKAGE . (generic_instantiation . 0)) (PRAGMA . (generic_instantiation . 0)) (PRIVATE . (generic_instantiation . 0)) (PROCEDURE . (generic_instantiation . 0)) (SEPARATE . (generic_instantiation . 0)) (USE . (generic_instantiation . 0)) (WITH . (generic_instantiation . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (BAR .  564) (LOOP . (relation . 2)) (DO . (relation . 2)) (XOR . (relation . 2)) (OR . (relation . 2)) (AND . (relation . 2)) (IS . (relation . 2)) (WITH . (relation . 2)) (SEMICOLON . (relation . 2)) (THEN . (relation . 2)) (RANGE . (relation . 2)) (DIGITS . (relation . 2)) (RIGHT_PAREN . (relation . 2)) (EQUAL_GREATER . (relation . 2)) (ELSE . (relation . 2)) (ELSIF . (relation . 2)) (COMMA . (relation . 2)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (AND . (choice_relation_and_then_list . 0)) (EQUAL_GREATER . (choice_relation_and_then_list . 0)) (BAR . (choice_relation_and_then_list . 0)))
      ((default . error) (OR . (choice_relation_or_else_list . 0)) (EQUAL_GREATER . (choice_relation_or_else_list . 0)) (BAR . (choice_relation_or_else_list . 0)))
      ((default . error) (OR . (choice_relation_or_else_list . 1)) (EQUAL_GREATER . (choice_relation_or_else_list . 1)) (BAR . (choice_relation_or_else_list . 1)))
      ((default . error) (AND . (choice_relation_and_then_list . 1)) (EQUAL_GREATER . (choice_relation_and_then_list . 1)) (BAR . (choice_relation_and_then_list . 1)))
      ((default . error) (RENAMES .  750))
      ((default . error) (RENAMES .  749))
      ((default . error) (ACCESS .  235) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (LEFT_PAREN .  220) (RECORD .  745))
      ((default . error) (AT .  744))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (DOT .  87) (TICK .  88) (IS . ( 742 (aspect_specification_opt . 0))) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (WITH . (discriminant_part_opt . 0)) (IS . (discriminant_part_opt . 0)) (LEFT_PAREN .  198))
      ((default . error) (IS . ( 740 (aspect_specification_opt . 0))) (WITH .  108))
      ((default . error) (IS .  739))
      ((default . error) (NOT .  736) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (WITH . (discriminant_part_opt . 0)) (IS . (discriminant_part_opt . 0)) (SEMICOLON . (discriminant_part_opt . 0)) (LEFT_PAREN .  198))
      ((default . error) (IS . ( 734 (aspect_specification_opt . 0))) (WITH .  108))
      ((default . error) (SEMICOLON .  732) (IS .  733))
      ((default . error) (END . (incomplete_type_declaration . 1)) (PRIVATE . (incomplete_type_declaration . 1)) (USE . (incomplete_type_declaration . 1)) (TYPE . (incomplete_type_declaration . 1)) (TASK . (incomplete_type_declaration . 1)) (SUBTYPE . (incomplete_type_declaration . 1)) (PROTECTED . (incomplete_type_declaration . 1)) (PROCEDURE . (incomplete_type_declaration . 1)) (PRAGMA . (incomplete_type_declaration . 1)) (PACKAGE . (incomplete_type_declaration . 1)) (OVERRIDING . (incomplete_type_declaration . 1)) (NOT . (incomplete_type_declaration . 1)) (GENERIC . (incomplete_type_declaration . 1)) (FUNCTION . (incomplete_type_declaration . 1)) (FOR . (incomplete_type_declaration . 1)) (ENTRY . (incomplete_type_declaration . 1)) (IDENTIFIER . (incomplete_type_declaration . 1)) (BEGIN . (incomplete_type_declaration . 1)))
      ((default . error) (IS .  731))
      ((default . error) (END .  730))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (package_specification . 1)) (LEFT_PAREN .  106))
      ((default . error) (COLON_EQUAL .  729))
      ((default . error) (SEMICOLON .  728))
      ((default . error) (IDENTIFIER . (constant_opt . 0)) (STRING_LITERAL . (constant_opt . 0)) (CHARACTER_LITERAL . (constant_opt . 0)) (NOT . (constant_opt . 0)) (ACCESS . (constant_opt . 0)) (ARRAY . (constant_opt . 0)) (CONSTANT .  726))
      ((default . error) (SEPARATE .  725) (ABSTRACT .  724))
      ((default . error) (NULL .  723))
      ((default . error) (LEFT_PAREN .  721))
      ((default . error) (WITH . (parameter_profile_opt . 0)) (SEMICOLON . (parameter_profile_opt . 0)) (LEFT_PAREN .  719))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (EXCEPTION . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (SEMICOLON . (name_opt . 0)) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (LOOP . (relation_and_then_list . 0)) (DO . (relation_and_then_list . 0)) (AND . (relation_and_then_list . 0)) (IS . (relation_and_then_list . 0)) (WITH . (relation_and_then_list . 0)) (SEMICOLON . (relation_and_then_list . 0)) (THEN . (relation_and_then_list . 0)) (RANGE . (relation_and_then_list . 0)) (COMMA . (relation_and_then_list . 0)) (RIGHT_PAREN . (relation_and_then_list . 0)) (DIGITS . (relation_and_then_list . 0)) (EQUAL_GREATER . (relation_and_then_list . 0)) (ELSE . (relation_and_then_list . 0)) (ELSIF . (relation_and_then_list . 0)))
      ((default . error) (LOOP . (relation_or_else_list . 0)) (DO . (relation_or_else_list . 0)) (OR . (relation_or_else_list . 0)) (IS . (relation_or_else_list . 0)) (WITH . (relation_or_else_list . 0)) (SEMICOLON . (relation_or_else_list . 0)) (THEN . (relation_or_else_list . 0)) (RANGE . (relation_or_else_list . 0)) (COMMA . (relation_or_else_list . 0)) (RIGHT_PAREN . (relation_or_else_list . 0)) (DIGITS . (relation_or_else_list . 0)) (EQUAL_GREATER . (relation_or_else_list . 0)) (ELSE . (relation_or_else_list . 0)) (ELSIF . (relation_or_else_list . 0)))
      ((default . error) (LOOP . (relation_or_else_list . 1)) (DO . (relation_or_else_list . 1)) (OR . (relation_or_else_list . 1)) (IS . (relation_or_else_list . 1)) (WITH . (relation_or_else_list . 1)) (SEMICOLON . (relation_or_else_list . 1)) (THEN . (relation_or_else_list . 1)) (RANGE . (relation_or_else_list . 1)) (COMMA . (relation_or_else_list . 1)) (RIGHT_PAREN . (relation_or_else_list . 1)) (DIGITS . (relation_or_else_list . 1)) (EQUAL_GREATER . (relation_or_else_list . 1)) (ELSE . (relation_or_else_list . 1)) (ELSIF . (relation_or_else_list . 1)))
      ((default . error) (LOOP . (relation_and_then_list . 1)) (DO . (relation_and_then_list . 1)) (AND . (relation_and_then_list . 1)) (IS . (relation_and_then_list . 1)) (WITH . (relation_and_then_list . 1)) (SEMICOLON . (relation_and_then_list . 1)) (THEN . (relation_and_then_list . 1)) (RANGE . (relation_and_then_list . 1)) (COMMA . (relation_and_then_list . 1)) (RIGHT_PAREN . (relation_and_then_list . 1)) (DIGITS . (relation_and_then_list . 1)) (EQUAL_GREATER . (relation_and_then_list . 1)) (ELSE . (relation_and_then_list . 1)) (ELSIF . (relation_and_then_list . 1)))
      ((default . error) (WHEN .  714))
      ((default . error) (OF .  713) (COLON .  711) (IN .  712))
      ((default . error) (EQUAL_GREATER .  710))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (IS . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (IS . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (IS .  134))
      ((default . error) (IDENTIFIER .  705))
      ((default . error) (COLON .  704))
      ((default . error) (IDENTIFIER .  703))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (EXCEPTION . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (IS . (expression_opt . 0)) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (BEGIN . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (UNTIL .  697) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (WHEN . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (LOOP . (iterator_specification_opt . 0)) (IDENTIFIER .  604))
      ((default . error) (IDENTIFIER .  692))
      ((default . error) (THEN . (expression_opt . 0)) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (SEMICOLON .  689))
      ((default . error) (SEMICOLON .  687) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (SEMICOLON .  681) (DO . (extended_return_object_declaration_opt . 0)) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  682) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (ELSE . (select_alternative_list_opt . 0)) (END . (select_alternative_list_opt . 0)) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (DELAY .  618) (WHEN .  670) (TERMINATE .  669) (ACCEPT .  613))
      ((default . error) (LOOP . (expression_opt . 0)) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (OR . (compound_statement . 5)) (THEN . (compound_statement . 5)) (WHEN . (compound_statement . 5)) (EXCEPTION . (compound_statement . 5)) (END . (compound_statement . 5)) (LESS_LESS . (compound_statement . 5)) (IDENTIFIER . (compound_statement . 5)) (STRING_LITERAL . (compound_statement . 5)) (CHARACTER_LITERAL . (compound_statement . 5)) (ACCEPT . (compound_statement . 5)) (ABORT . (compound_statement . 5)) (BEGIN . (compound_statement . 5)) (CASE . (compound_statement . 5)) (DECLARE . (compound_statement . 5)) (DELAY . (compound_statement . 5)) (EXIT . (compound_statement . 5)) (FOR . (compound_statement . 5)) (GOTO . (compound_statement . 5)) (IF . (compound_statement . 5)) (LOOP . (compound_statement . 5)) (NULL . (compound_statement . 5)) (PRAGMA . (compound_statement . 5)) (RAISE . (compound_statement . 5)) (REQUEUE . (compound_statement . 5)) (RETURN . (compound_statement . 5)) (SELECT . (compound_statement . 5)) (WHILE . (compound_statement . 5)) (ELSE . (compound_statement . 5)) (ELSIF . (compound_statement . 5)))
      ((default . error) (OR . (simple_statement . 1)) (THEN . (simple_statement . 1)) (WHEN . (simple_statement . 1)) (EXCEPTION . (simple_statement . 1)) (END . (simple_statement . 1)) (LESS_LESS . (simple_statement . 1)) (IDENTIFIER . (simple_statement . 1)) (STRING_LITERAL . (simple_statement . 1)) (CHARACTER_LITERAL . (simple_statement . 1)) (ACCEPT . (simple_statement . 1)) (ABORT . (simple_statement . 1)) (BEGIN . (simple_statement . 1)) (CASE . (simple_statement . 1)) (DECLARE . (simple_statement . 1)) (DELAY . (simple_statement . 1)) (EXIT . (simple_statement . 1)) (FOR . (simple_statement . 1)) (GOTO . (simple_statement . 1)) (IF . (simple_statement . 1)) (LOOP . (simple_statement . 1)) (NULL . (simple_statement . 1)) (PRAGMA . (simple_statement . 1)) (RAISE . (simple_statement . 1)) (REQUEUE . (simple_statement . 1)) (RETURN . (simple_statement . 1)) (SELECT . (simple_statement . 1)) (WHILE . (simple_statement . 1)) (ELSE . (simple_statement . 1)) (ELSIF . (simple_statement . 1)))
      ((default . error) (OR . (select_statement . 3)) (THEN . (select_statement . 3)) (WHEN . (select_statement . 3)) (EXCEPTION . (select_statement . 3)) (END . (select_statement . 3)) (LESS_LESS . (select_statement . 3)) (IDENTIFIER . (select_statement . 3)) (STRING_LITERAL . (select_statement . 3)) (CHARACTER_LITERAL . (select_statement . 3)) (ACCEPT . (select_statement . 3)) (ABORT . (select_statement . 3)) (BEGIN . (select_statement . 3)) (CASE . (select_statement . 3)) (DECLARE . (select_statement . 3)) (DELAY . (select_statement . 3)) (EXIT . (select_statement . 3)) (FOR . (select_statement . 3)) (GOTO . (select_statement . 3)) (IF . (select_statement . 3)) (LOOP . (select_statement . 3)) (NULL . (select_statement . 3)) (PRAGMA . (select_statement . 3)) (RAISE . (select_statement . 3)) (REQUEUE . (select_statement . 3)) (RETURN . (select_statement . 3)) (SELECT . (select_statement . 3)) (WHILE . (select_statement . 3)) (ELSE . (select_statement . 3)) (ELSIF . (select_statement . 3)))
      ((default . error) (OR . (compound_statement . 3)) (THEN . (compound_statement . 3)) (WHEN . (compound_statement . 3)) (EXCEPTION . (compound_statement . 3)) (END . (compound_statement . 3)) (LESS_LESS . (compound_statement . 3)) (IDENTIFIER . (compound_statement . 3)) (STRING_LITERAL . (compound_statement . 3)) (CHARACTER_LITERAL . (compound_statement . 3)) (ACCEPT . (compound_statement . 3)) (ABORT . (compound_statement . 3)) (BEGIN . (compound_statement . 3)) (CASE . (compound_statement . 3)) (DECLARE . (compound_statement . 3)) (DELAY . (compound_statement . 3)) (EXIT . (compound_statement . 3)) (FOR . (compound_statement . 3)) (GOTO . (compound_statement . 3)) (IF . (compound_statement . 3)) (LOOP . (compound_statement . 3)) (NULL . (compound_statement . 3)) (PRAGMA . (compound_statement . 3)) (RAISE . (compound_statement . 3)) (REQUEUE . (compound_statement . 3)) (RETURN . (compound_statement . 3)) (SELECT . (compound_statement . 3)) (WHILE . (compound_statement . 3)) (ELSE . (compound_statement . 3)) (ELSIF . (compound_statement . 3)))
      ((default . error) (OR . (compound_statement . 1)) (THEN . (compound_statement . 1)) (WHEN . (compound_statement . 1)) (EXCEPTION . (compound_statement . 1)) (END . (compound_statement . 1)) (LESS_LESS . (compound_statement . 1)) (IDENTIFIER . (compound_statement . 1)) (STRING_LITERAL . (compound_statement . 1)) (CHARACTER_LITERAL . (compound_statement . 1)) (ACCEPT . (compound_statement . 1)) (ABORT . (compound_statement . 1)) (BEGIN . (compound_statement . 1)) (CASE . (compound_statement . 1)) (DECLARE . (compound_statement . 1)) (DELAY . (compound_statement . 1)) (EXIT . (compound_statement . 1)) (FOR . (compound_statement . 1)) (GOTO . (compound_statement . 1)) (IF . (compound_statement . 1)) (LOOP . (compound_statement . 1)) (NULL . (compound_statement . 1)) (PRAGMA . (compound_statement . 1)) (RAISE . (compound_statement . 1)) (REQUEUE . (compound_statement . 1)) (RETURN . (compound_statement . 1)) (SELECT . (compound_statement . 1)) (WHILE . (compound_statement . 1)) (ELSE . (compound_statement . 1)) (ELSIF . (compound_statement . 1)))
      ((default . error) (OR . (select_statement . 2)) (THEN . (select_statement . 2)) (WHEN . (select_statement . 2)) (EXCEPTION . (select_statement . 2)) (END . (select_statement . 2)) (LESS_LESS . (select_statement . 2)) (IDENTIFIER . (select_statement . 2)) (STRING_LITERAL . (select_statement . 2)) (CHARACTER_LITERAL . (select_statement . 2)) (ACCEPT . (select_statement . 2)) (ABORT . (select_statement . 2)) (BEGIN . (select_statement . 2)) (CASE . (select_statement . 2)) (DECLARE . (select_statement . 2)) (DELAY . (select_statement . 2)) (EXIT . (select_statement . 2)) (FOR . (select_statement . 2)) (GOTO . (select_statement . 2)) (IF . (select_statement . 2)) (LOOP . (select_statement . 2)) (NULL . (select_statement . 2)) (PRAGMA . (select_statement . 2)) (RAISE . (select_statement . 2)) (REQUEUE . (select_statement . 2)) (RETURN . (select_statement . 2)) (SELECT . (select_statement . 2)) (WHILE . (select_statement . 2)) (ELSE . (select_statement . 2)) (ELSIF . (select_statement . 2)))
      ((default . error) (OR . (simple_statement . 7)) (THEN . (simple_statement . 7)) (WHEN . (simple_statement . 7)) (EXCEPTION . (simple_statement . 7)) (END . (simple_statement . 7)) (LESS_LESS . (simple_statement . 7)) (IDENTIFIER . (simple_statement . 7)) (STRING_LITERAL . (simple_statement . 7)) (CHARACTER_LITERAL . (simple_statement . 7)) (ACCEPT . (simple_statement . 7)) (ABORT . (simple_statement . 7)) (BEGIN . (simple_statement . 7)) (CASE . (simple_statement . 7)) (DECLARE . (simple_statement . 7)) (DELAY . (simple_statement . 7)) (EXIT . (simple_statement . 7)) (FOR . (simple_statement . 7)) (GOTO . (simple_statement . 7)) (IF . (simple_statement . 7)) (LOOP . (simple_statement . 7)) (NULL . (simple_statement . 7)) (PRAGMA . (simple_statement . 7)) (RAISE . (simple_statement . 7)) (REQUEUE . (simple_statement . 7)) (RETURN . (simple_statement . 7)) (SELECT . (simple_statement . 7)) (WHILE . (simple_statement . 7)) (ELSE . (simple_statement . 7)) (ELSIF . (simple_statement . 7)))
      ((default . error) (OR . (simple_statement . 2)) (THEN . (simple_statement . 2)) (WHEN . (simple_statement . 2)) (EXCEPTION . (simple_statement . 2)) (END . (simple_statement . 2)) (LESS_LESS . (simple_statement . 2)) (IDENTIFIER . (simple_statement . 2)) (STRING_LITERAL . (simple_statement . 2)) (CHARACTER_LITERAL . (simple_statement . 2)) (ACCEPT . (simple_statement . 2)) (ABORT . (simple_statement . 2)) (BEGIN . (simple_statement . 2)) (CASE . (simple_statement . 2)) (DECLARE . (simple_statement . 2)) (DELAY . (simple_statement . 2)) (EXIT . (simple_statement . 2)) (FOR . (simple_statement . 2)) (GOTO . (simple_statement . 2)) (IF . (simple_statement . 2)) (LOOP . (simple_statement . 2)) (NULL . (simple_statement . 2)) (PRAGMA . (simple_statement . 2)) (RAISE . (simple_statement . 2)) (REQUEUE . (simple_statement . 2)) (RETURN . (simple_statement . 2)) (SELECT . (simple_statement . 2)) (WHILE . (simple_statement . 2)) (ELSE . (simple_statement . 2)) (ELSIF . (simple_statement . 2)))
      ((default . error) (OR . (compound_statement . 4)) (THEN . (compound_statement . 4)) (WHEN . (compound_statement . 4)) (EXCEPTION . (compound_statement . 4)) (END . (compound_statement . 4)) (LESS_LESS . (compound_statement . 4)) (IDENTIFIER . (compound_statement . 4)) (STRING_LITERAL . (compound_statement . 4)) (CHARACTER_LITERAL . (compound_statement . 4)) (ACCEPT . (compound_statement . 4)) (ABORT . (compound_statement . 4)) (BEGIN . (compound_statement . 4)) (CASE . (compound_statement . 4)) (DECLARE . (compound_statement . 4)) (DELAY . (compound_statement . 4)) (EXIT . (compound_statement . 4)) (FOR . (compound_statement . 4)) (GOTO . (compound_statement . 4)) (IF . (compound_statement . 4)) (LOOP . (compound_statement . 4)) (NULL . (compound_statement . 4)) (PRAGMA . (compound_statement . 4)) (RAISE . (compound_statement . 4)) (REQUEUE . (compound_statement . 4)) (RETURN . (compound_statement . 4)) (SELECT . (compound_statement . 4)) (WHILE . (compound_statement . 4)) (ELSE . (compound_statement . 4)) (ELSIF . (compound_statement . 4)))
      ((default . error) (END .  667))
      ((default . error) (OR . (compound_statement . 0)) (THEN . (compound_statement . 0)) (WHEN . (compound_statement . 0)) (EXCEPTION . (compound_statement . 0)) (END . (compound_statement . 0)) (LESS_LESS . (compound_statement . 0)) (IDENTIFIER . (compound_statement . 0)) (STRING_LITERAL . (compound_statement . 0)) (CHARACTER_LITERAL . (compound_statement . 0)) (ACCEPT . (compound_statement . 0)) (ABORT . (compound_statement . 0)) (BEGIN . (compound_statement . 0)) (CASE . (compound_statement . 0)) (DECLARE . (compound_statement . 0)) (DELAY . (compound_statement . 0)) (EXIT . (compound_statement . 0)) (FOR . (compound_statement . 0)) (GOTO . (compound_statement . 0)) (IF . (compound_statement . 0)) (LOOP . (compound_statement . 0)) (NULL . (compound_statement . 0)) (PRAGMA . (compound_statement . 0)) (RAISE . (compound_statement . 0)) (REQUEUE . (compound_statement . 0)) (RETURN . (compound_statement . 0)) (SELECT . (compound_statement . 0)) (WHILE . (compound_statement . 0)) (ELSE . (compound_statement . 0)) (ELSIF . (compound_statement . 0)))
      ((default . error) (LOOP .  666))
      ((default . error) (NULL .  624) (GOTO .  621) (ABORT .  614) (ACCEPT .  613) (DECLARE .  617) (BEGIN .  615) (LOOP .  623) (CASE .  616) (IF .  622) (PRAGMA .  7) (RAISE .  625) (DELAY .  618) (REQUEUE .  626) (RETURN .  627) (EXIT .  619) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (WHILE .  629) (FOR .  620) (SELECT .  628))
      ((default . error) (OR . (compound_statement . 2)) (THEN . (compound_statement . 2)) (WHEN . (compound_statement . 2)) (EXCEPTION . (compound_statement . 2)) (END . (compound_statement . 2)) (LESS_LESS . (compound_statement . 2)) (IDENTIFIER . (compound_statement . 2)) (STRING_LITERAL . (compound_statement . 2)) (CHARACTER_LITERAL . (compound_statement . 2)) (ACCEPT . (compound_statement . 2)) (ABORT . (compound_statement . 2)) (BEGIN . (compound_statement . 2)) (CASE . (compound_statement . 2)) (DECLARE . (compound_statement . 2)) (DELAY . (compound_statement . 2)) (EXIT . (compound_statement . 2)) (FOR . (compound_statement . 2)) (GOTO . (compound_statement . 2)) (IF . (compound_statement . 2)) (LOOP . (compound_statement . 2)) (NULL . (compound_statement . 2)) (PRAGMA . (compound_statement . 2)) (RAISE . (compound_statement . 2)) (REQUEUE . (compound_statement . 2)) (RETURN . (compound_statement . 2)) (SELECT . (compound_statement . 2)) (WHILE . (compound_statement . 2)) (ELSE . (compound_statement . 2)) (ELSIF . (compound_statement . 2)))
      ((default . error) (DOT .  87) (SEMICOLON .  663) (TICK .  88) (COLON_EQUAL .  662) (LEFT_PAREN .  106))
      ((default . error) (OR . (simple_statement . 10)) (THEN . (simple_statement . 10)) (WHEN . (simple_statement . 10)) (EXCEPTION . (simple_statement . 10)) (END . (simple_statement . 10)) (LESS_LESS . (simple_statement . 10)) (IDENTIFIER . (simple_statement . 10)) (STRING_LITERAL . (simple_statement . 10)) (CHARACTER_LITERAL . (simple_statement . 10)) (ACCEPT . (simple_statement . 10)) (ABORT . (simple_statement . 10)) (BEGIN . (simple_statement . 10)) (CASE . (simple_statement . 10)) (DECLARE . (simple_statement . 10)) (DELAY . (simple_statement . 10)) (EXIT . (simple_statement . 10)) (FOR . (simple_statement . 10)) (GOTO . (simple_statement . 10)) (IF . (simple_statement . 10)) (LOOP . (simple_statement . 10)) (NULL . (simple_statement . 10)) (PRAGMA . (simple_statement . 10)) (RAISE . (simple_statement . 10)) (REQUEUE . (simple_statement . 10)) (RETURN . (simple_statement . 10)) (SELECT . (simple_statement . 10)) (WHILE . (simple_statement . 10)) (ELSE . (simple_statement . 10)) (ELSIF . (simple_statement . 10)))
      ((default . error) (OR . (simple_statement . 4)) (THEN . (simple_statement . 4)) (WHEN . (simple_statement . 4)) (EXCEPTION . (simple_statement . 4)) (END . (simple_statement . 4)) (LESS_LESS . (simple_statement . 4)) (IDENTIFIER . (simple_statement . 4)) (STRING_LITERAL . (simple_statement . 4)) (CHARACTER_LITERAL . (simple_statement . 4)) (ACCEPT . (simple_statement . 4)) (ABORT . (simple_statement . 4)) (BEGIN . (simple_statement . 4)) (CASE . (simple_statement . 4)) (DECLARE . (simple_statement . 4)) (DELAY . (simple_statement . 4)) (EXIT . (simple_statement . 4)) (FOR . (simple_statement . 4)) (GOTO . (simple_statement . 4)) (IF . (simple_statement . 4)) (LOOP . (simple_statement . 4)) (NULL . (simple_statement . 4)) (PRAGMA . (simple_statement . 4)) (RAISE . (simple_statement . 4)) (REQUEUE . (simple_statement . 4)) (RETURN . (simple_statement . 4)) (SELECT . (simple_statement . 4)) (WHILE . (simple_statement . 4)) (ELSE . (simple_statement . 4)) (ELSIF . (simple_statement . 4)))
      ((default . error) (OR . (simple_statement . 9)) (THEN . (simple_statement . 9)) (WHEN . (simple_statement . 9)) (EXCEPTION . (simple_statement . 9)) (END . (simple_statement . 9)) (LESS_LESS . (simple_statement . 9)) (IDENTIFIER . (simple_statement . 9)) (STRING_LITERAL . (simple_statement . 9)) (CHARACTER_LITERAL . (simple_statement . 9)) (ACCEPT . (simple_statement . 9)) (ABORT . (simple_statement . 9)) (BEGIN . (simple_statement . 9)) (CASE . (simple_statement . 9)) (DECLARE . (simple_statement . 9)) (DELAY . (simple_statement . 9)) (EXIT . (simple_statement . 9)) (FOR . (simple_statement . 9)) (GOTO . (simple_statement . 9)) (IF . (simple_statement . 9)) (LOOP . (simple_statement . 9)) (NULL . (simple_statement . 9)) (PRAGMA . (simple_statement . 9)) (RAISE . (simple_statement . 9)) (REQUEUE . (simple_statement . 9)) (RETURN . (simple_statement . 9)) (SELECT . (simple_statement . 9)) (WHILE . (simple_statement . 9)) (ELSE . (simple_statement . 9)) (ELSIF . (simple_statement . 9)))
      ((default . error) (OR . (simple_statement . 6)) (THEN . (simple_statement . 6)) (WHEN . (simple_statement . 6)) (EXCEPTION . (simple_statement . 6)) (END . (simple_statement . 6)) (LESS_LESS . (simple_statement . 6)) (IDENTIFIER . (simple_statement . 6)) (STRING_LITERAL . (simple_statement . 6)) (CHARACTER_LITERAL . (simple_statement . 6)) (ACCEPT . (simple_statement . 6)) (ABORT . (simple_statement . 6)) (BEGIN . (simple_statement . 6)) (CASE . (simple_statement . 6)) (DECLARE . (simple_statement . 6)) (DELAY . (simple_statement . 6)) (EXIT . (simple_statement . 6)) (FOR . (simple_statement . 6)) (GOTO . (simple_statement . 6)) (IF . (simple_statement . 6)) (LOOP . (simple_statement . 6)) (NULL . (simple_statement . 6)) (PRAGMA . (simple_statement . 6)) (RAISE . (simple_statement . 6)) (REQUEUE . (simple_statement . 6)) (RETURN . (simple_statement . 6)) (SELECT . (simple_statement . 6)) (WHILE . (simple_statement . 6)) (ELSE . (simple_statement . 6)) (ELSIF . (simple_statement . 6)))
      ((default . error) (OR . (select_statement . 0)) (THEN . (select_statement . 0)) (WHEN . (select_statement . 0)) (EXCEPTION . (select_statement . 0)) (END . (select_statement . 0)) (LESS_LESS . (select_statement . 0)) (IDENTIFIER . (select_statement . 0)) (STRING_LITERAL . (select_statement . 0)) (CHARACTER_LITERAL . (select_statement . 0)) (ACCEPT . (select_statement . 0)) (ABORT . (select_statement . 0)) (BEGIN . (select_statement . 0)) (CASE . (select_statement . 0)) (DECLARE . (select_statement . 0)) (DELAY . (select_statement . 0)) (EXIT . (select_statement . 0)) (FOR . (select_statement . 0)) (GOTO . (select_statement . 0)) (IF . (select_statement . 0)) (LOOP . (select_statement . 0)) (NULL . (select_statement . 0)) (PRAGMA . (select_statement . 0)) (RAISE . (select_statement . 0)) (REQUEUE . (select_statement . 0)) (RETURN . (select_statement . 0)) (SELECT . (select_statement . 0)) (WHILE . (select_statement . 0)) (ELSE . (select_statement . 0)) (ELSIF . (select_statement . 0)))
      ((default . error) (OR . (compound_statement . 6)) (THEN . (compound_statement . 6)) (WHEN . (compound_statement . 6)) (EXCEPTION . (compound_statement . 6)) (END . (compound_statement . 6)) (LESS_LESS . (compound_statement . 6)) (IDENTIFIER . (compound_statement . 6)) (STRING_LITERAL . (compound_statement . 6)) (CHARACTER_LITERAL . (compound_statement . 6)) (ACCEPT . (compound_statement . 6)) (ABORT . (compound_statement . 6)) (BEGIN . (compound_statement . 6)) (CASE . (compound_statement . 6)) (DECLARE . (compound_statement . 6)) (DELAY . (compound_statement . 6)) (EXIT . (compound_statement . 6)) (FOR . (compound_statement . 6)) (GOTO . (compound_statement . 6)) (IF . (compound_statement . 6)) (LOOP . (compound_statement . 6)) (NULL . (compound_statement . 6)) (PRAGMA . (compound_statement . 6)) (RAISE . (compound_statement . 6)) (REQUEUE . (compound_statement . 6)) (RETURN . (compound_statement . 6)) (SELECT . (compound_statement . 6)) (WHILE . (compound_statement . 6)) (ELSE . (compound_statement . 6)) (ELSIF . (compound_statement . 6)))
      ((default . error) (WHEN . (sequence_of_statements_opt . 1)) (THEN . (sequence_of_statements_opt . 1)) (OR . (sequence_of_statements_opt . 1)) (ELSIF . (sequence_of_statements_opt . 1)) (ELSE . (sequence_of_statements_opt . 1)) (END . (sequence_of_statements_opt . 1)) (EXCEPTION . (sequence_of_statements_opt . 1)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (END . (handled_sequence_of_statements . 1)) (EXCEPTION .  660))
      ((default . error) (OR . (simple_statement . 5)) (THEN . (simple_statement . 5)) (WHEN . (simple_statement . 5)) (EXCEPTION . (simple_statement . 5)) (END . (simple_statement . 5)) (LESS_LESS . (simple_statement . 5)) (IDENTIFIER . (simple_statement . 5)) (STRING_LITERAL . (simple_statement . 5)) (CHARACTER_LITERAL . (simple_statement . 5)) (ACCEPT . (simple_statement . 5)) (ABORT . (simple_statement . 5)) (BEGIN . (simple_statement . 5)) (CASE . (simple_statement . 5)) (DECLARE . (simple_statement . 5)) (DELAY . (simple_statement . 5)) (EXIT . (simple_statement . 5)) (FOR . (simple_statement . 5)) (GOTO . (simple_statement . 5)) (IF . (simple_statement . 5)) (LOOP . (simple_statement . 5)) (NULL . (simple_statement . 5)) (PRAGMA . (simple_statement . 5)) (RAISE . (simple_statement . 5)) (REQUEUE . (simple_statement . 5)) (RETURN . (simple_statement . 5)) (SELECT . (simple_statement . 5)) (WHILE . (simple_statement . 5)) (ELSE . (simple_statement . 5)) (ELSIF . (simple_statement . 5)))
      ((default . error) (WHEN . (sequence_of_statements . 0)) (THEN . (sequence_of_statements . 0)) (OR . (sequence_of_statements . 0)) (ELSIF . (sequence_of_statements . 0)) (ELSE . (sequence_of_statements . 0)) (EXCEPTION . (sequence_of_statements . 0)) (END . (sequence_of_statements . 0)) (LESS_LESS . (sequence_of_statements . 0)) (IDENTIFIER . (sequence_of_statements . 0)) (STRING_LITERAL . (sequence_of_statements . 0)) (CHARACTER_LITERAL . (sequence_of_statements . 0)) (ACCEPT . (sequence_of_statements . 0)) (ABORT . (sequence_of_statements . 0)) (BEGIN . (sequence_of_statements . 0)) (CASE . (sequence_of_statements . 0)) (DECLARE . (sequence_of_statements . 0)) (DELAY . (sequence_of_statements . 0)) (EXIT . (sequence_of_statements . 0)) (FOR . (sequence_of_statements . 0)) (GOTO . (sequence_of_statements . 0)) (IF . (sequence_of_statements . 0)) (LOOP . (sequence_of_statements . 0)) (NULL . (sequence_of_statements . 0)) (PRAGMA . (sequence_of_statements . 0)) (RAISE . (sequence_of_statements . 0)) (REQUEUE . (sequence_of_statements . 0)) (RETURN . (sequence_of_statements . 0)) (SELECT . (sequence_of_statements . 0)) (WHILE . (sequence_of_statements . 0)))
      ((default . error) (OR . (select_statement . 1)) (THEN . (select_statement . 1)) (WHEN . (select_statement . 1)) (EXCEPTION . (select_statement . 1)) (END . (select_statement . 1)) (LESS_LESS . (select_statement . 1)) (IDENTIFIER . (select_statement . 1)) (STRING_LITERAL . (select_statement . 1)) (CHARACTER_LITERAL . (select_statement . 1)) (ACCEPT . (select_statement . 1)) (ABORT . (select_statement . 1)) (BEGIN . (select_statement . 1)) (CASE . (select_statement . 1)) (DECLARE . (select_statement . 1)) (DELAY . (select_statement . 1)) (EXIT . (select_statement . 1)) (FOR . (select_statement . 1)) (GOTO . (select_statement . 1)) (IF . (select_statement . 1)) (LOOP . (select_statement . 1)) (NULL . (select_statement . 1)) (PRAGMA . (select_statement . 1)) (RAISE . (select_statement . 1)) (REQUEUE . (select_statement . 1)) (RETURN . (select_statement . 1)) (SELECT . (select_statement . 1)) (WHILE . (select_statement . 1)) (ELSE . (select_statement . 1)) (ELSIF . (select_statement . 1)))
      ((default . error) (SEMICOLON .  659))
      ((default . error) (SEMICOLON .  658))
      ((default . error) (TYPE . (generic_instantiation . 2)) (TASK . (generic_instantiation . 2)) (SUBTYPE . (generic_instantiation . 2)) (PROTECTED . (generic_instantiation . 2)) (FOR . (generic_instantiation . 2)) (ENTRY . (generic_instantiation . 2)) (IDENTIFIER . (generic_instantiation . 2)) (BEGIN . (generic_instantiation . 2)) (END . (generic_instantiation . 2)) (WITH . (generic_instantiation . 2)) (USE . (generic_instantiation . 2)) (SEPARATE . (generic_instantiation . 2)) (PROCEDURE . (generic_instantiation . 2)) (PRIVATE . (generic_instantiation . 2)) (PRAGMA . (generic_instantiation . 2)) (PACKAGE . (generic_instantiation . 2)) (OVERRIDING . (generic_instantiation . 2)) (NOT . (generic_instantiation . 2)) (LIMITED . (generic_instantiation . 2)) (GENERIC . (generic_instantiation . 2)) (FUNCTION . (generic_instantiation . 2)) ($EOI . (generic_instantiation . 2)))
      ((default . error) (TYPE . (generic_instantiation . 1)) (TASK . (generic_instantiation . 1)) (SUBTYPE . (generic_instantiation . 1)) (PROTECTED . (generic_instantiation . 1)) (FOR . (generic_instantiation . 1)) (ENTRY . (generic_instantiation . 1)) (IDENTIFIER . (generic_instantiation . 1)) (BEGIN . (generic_instantiation . 1)) (END . (generic_instantiation . 1)) (WITH . (generic_instantiation . 1)) (USE . (generic_instantiation . 1)) (SEPARATE . (generic_instantiation . 1)) (PROCEDURE . (generic_instantiation . 1)) (PRIVATE . (generic_instantiation . 1)) (PRAGMA . (generic_instantiation . 1)) (PACKAGE . (generic_instantiation . 1)) (OVERRIDING . (generic_instantiation . 1)) (NOT . (generic_instantiation . 1)) (LIMITED . (generic_instantiation . 1)) (GENERIC . (generic_instantiation . 1)) (FUNCTION . (generic_instantiation . 1)) ($EOI . (generic_instantiation . 1)))
      ((default . error) (END . (exception_handler_list_opt . 0)) (WHEN .  930))
      ((default . error) (OR . (sequence_of_statements . 1)) (THEN . (sequence_of_statements . 1)) (WHEN . (sequence_of_statements . 1)) (WHILE . (sequence_of_statements . 1)) (SELECT . (sequence_of_statements . 1)) (RETURN . (sequence_of_statements . 1)) (REQUEUE . (sequence_of_statements . 1)) (RAISE . (sequence_of_statements . 1)) (PRAGMA . (sequence_of_statements . 1)) (NULL . (sequence_of_statements . 1)) (LOOP . (sequence_of_statements . 1)) (IF . (sequence_of_statements . 1)) (GOTO . (sequence_of_statements . 1)) (FOR . (sequence_of_statements . 1)) (EXIT . (sequence_of_statements . 1)) (DELAY . (sequence_of_statements . 1)) (DECLARE . (sequence_of_statements . 1)) (CASE . (sequence_of_statements . 1)) (BEGIN . (sequence_of_statements . 1)) (ABORT . (sequence_of_statements . 1)) (ACCEPT . (sequence_of_statements . 1)) (CHARACTER_LITERAL . (sequence_of_statements . 1)) (STRING_LITERAL . (sequence_of_statements . 1)) (IDENTIFIER . (sequence_of_statements . 1)) (LESS_LESS . (sequence_of_statements . 1)) (END . (sequence_of_statements . 1)) (EXCEPTION . (sequence_of_statements . 1)) (ELSE . (sequence_of_statements . 1)) (ELSIF . (sequence_of_statements . 1)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (WHEN . (procedure_call_statement . 0)) (OR . (procedure_call_statement . 0)) (THEN . (procedure_call_statement . 0)) (ELSIF . (procedure_call_statement . 0)) (ELSE . (procedure_call_statement . 0)) (WHILE . (procedure_call_statement . 0)) (SELECT . (procedure_call_statement . 0)) (RETURN . (procedure_call_statement . 0)) (REQUEUE . (procedure_call_statement . 0)) (RAISE . (procedure_call_statement . 0)) (PRAGMA . (procedure_call_statement . 0)) (NULL . (procedure_call_statement . 0)) (LOOP . (procedure_call_statement . 0)) (IF . (procedure_call_statement . 0)) (GOTO . (procedure_call_statement . 0)) (FOR . (procedure_call_statement . 0)) (EXIT . (procedure_call_statement . 0)) (DELAY . (procedure_call_statement . 0)) (DECLARE . (procedure_call_statement . 0)) (CASE . (procedure_call_statement . 0)) (BEGIN . (procedure_call_statement . 0)) (ABORT . (procedure_call_statement . 0)) (ACCEPT . (procedure_call_statement . 0)) (CHARACTER_LITERAL . (procedure_call_statement . 0)) (STRING_LITERAL . (procedure_call_statement . 0)) (IDENTIFIER . (procedure_call_statement . 0)) (LESS_LESS . (procedure_call_statement . 0)) (END . (procedure_call_statement . 0)) (EXCEPTION . (procedure_call_statement . 0)))
      ((default . error) (OR . (statement . 1)) (THEN . (statement . 1)) (WHEN . (statement . 1)) (EXCEPTION . (statement . 1)) (END . (statement . 1)) (LESS_LESS . (statement . 1)) (IDENTIFIER . (statement . 1)) (STRING_LITERAL . (statement . 1)) (CHARACTER_LITERAL . (statement . 1)) (ACCEPT . (statement . 1)) (ABORT . (statement . 1)) (BEGIN . (statement . 1)) (CASE . (statement . 1)) (DECLARE . (statement . 1)) (DELAY . (statement . 1)) (EXIT . (statement . 1)) (FOR . (statement . 1)) (GOTO . (statement . 1)) (IF . (statement . 1)) (LOOP . (statement . 1)) (NULL . (statement . 1)) (PRAGMA . (statement . 1)) (RAISE . (statement . 1)) (REQUEUE . (statement . 1)) (RETURN . (statement . 1)) (SELECT . (statement . 1)) (WHILE . (statement . 1)) (ELSE . (statement . 1)) (ELSIF . (statement . 1)))
      ((default . error) (OR . (statement . 0)) (THEN . (statement . 0)) (WHEN . (statement . 0)) (EXCEPTION . (statement . 0)) (END . (statement . 0)) (LESS_LESS . (statement . 0)) (IDENTIFIER . (statement . 0)) (STRING_LITERAL . (statement . 0)) (CHARACTER_LITERAL . (statement . 0)) (ACCEPT . (statement . 0)) (ABORT . (statement . 0)) (BEGIN . (statement . 0)) (CASE . (statement . 0)) (DECLARE . (statement . 0)) (DELAY . (statement . 0)) (EXIT . (statement . 0)) (FOR . (statement . 0)) (GOTO . (statement . 0)) (IF . (statement . 0)) (LOOP . (statement . 0)) (NULL . (statement . 0)) (PRAGMA . (statement . 0)) (RAISE . (statement . 0)) (REQUEUE . (statement . 0)) (RETURN . (statement . 0)) (SELECT . (statement . 0)) (WHILE . (statement . 0)) (ELSE . (statement . 0)) (ELSIF . (statement . 0)))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (SEMICOLON . (name_opt . 0)) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (LOOP . (iteration_scheme . 0)))
      ((default . error) (SEMICOLON .  926))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (OR . (sequence_of_statements_opt . 0)) (ELSE . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (ELSE . (select_alternative . 3)) (OR . (select_alternative . 3)) (END . (select_alternative . 3)))
      ((default . error) (OR . (sequence_of_statements_opt . 0)) (END . (sequence_of_statements_opt . 0)) (ELSE . (sequence_of_statements_opt . 0)) (THEN . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (ELSE .  921) (OR .  922))
      ((default . error) (DOT .  87) (SEMICOLON .  663) (TICK .  88) (OR . (sequence_of_statements_opt . 0)) (ELSE . (sequence_of_statements_opt . 0)) (THEN . (sequence_of_statements_opt . 0)) (LEFT_PAREN .  106) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (OR . (sequence_of_statements_opt . 0)) (ELSE . (sequence_of_statements_opt . 0)) (THEN . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (ELSE . (select_alternative_list . 0)) (END . (select_alternative_list . 0)) (OR . (select_alternative_list . 0)))
      ((default . error) (ELSE . (select_alternative_list_opt . 1)) (END . (select_alternative_list_opt . 1)) (OR .  918))
      ((default . error) (ELSE .  916) (END .  917))
      ((default . error) (THEN .  915))
      ((default . error) (WHEN . (simple_return_statement . 0)) (THEN . (simple_return_statement . 0)) (OR . (simple_return_statement . 0)) (ELSIF . (simple_return_statement . 0)) (ELSE . (simple_return_statement . 0)) (WHILE . (simple_return_statement . 0)) (SELECT . (simple_return_statement . 0)) (RETURN . (simple_return_statement . 0)) (REQUEUE . (simple_return_statement . 0)) (RAISE . (simple_return_statement . 0)) (PRAGMA . (simple_return_statement . 0)) (NULL . (simple_return_statement . 0)) (LOOP . (simple_return_statement . 0)) (IF . (simple_return_statement . 0)) (GOTO . (simple_return_statement . 0)) (FOR . (simple_return_statement . 0)) (EXIT . (simple_return_statement . 0)) (DELAY . (simple_return_statement . 0)) (DECLARE . (simple_return_statement . 0)) (CASE . (simple_return_statement . 0)) (BEGIN . (simple_return_statement . 0)) (ABORT . (simple_return_statement . 0)) (ACCEPT . (simple_return_statement . 0)) (CHARACTER_LITERAL . (simple_return_statement . 0)) (STRING_LITERAL . (simple_return_statement . 0)) (IDENTIFIER . (simple_return_statement . 0)) (LESS_LESS . (simple_return_statement . 0)) (END . (simple_return_statement . 0)) (EXCEPTION . (simple_return_statement . 0)))
      ((default . error) (COLON .  914) (STAR_STAR . (name . 0)) (REM . (name . 0)) (MOD . (name . 0)) (STAR . (name . 0)) (SLASH . (name . 0)) (SEMICOLON . (name . 0)) (SLASH_EQUAL . (name . 0)) (LESS_EQUAL . (name . 0)) (LESS . (name . 0)) (GREATER_EQUAL . (name . 0)) (GREATER . (name . 0)) (EQUAL . (name . 0)) (NOT . (name . 0)) (IN . (name . 0)) (AMPERSAND . (name . 0)) (MINUS . (name . 0)) (PLUS . (name . 0)) (LEFT_PAREN . (name . 0)) (AND . (name . 0)) (OR . (name . 0)) (XOR . (name . 0)) (DOT . (name . 0)) (TICK . (name . 0)))
      ((default . error) (SEMICOLON .  913))
      ((default . error) (DO . (extended_return_object_declaration_opt . 1)) (SEMICOLON .  912))
      ((default . error) (DO .  911))
      ((default . error) (WITH .  910) (DOT .  87) (TICK .  88) (SEMICOLON .  909) (LEFT_PAREN .  106))
      ((default . error) (WHEN . (raise_statement . 0)) (THEN . (raise_statement . 0)) (OR . (raise_statement . 0)) (ELSIF . (raise_statement . 0)) (ELSE . (raise_statement . 0)) (WHILE . (raise_statement . 0)) (SELECT . (raise_statement . 0)) (RETURN . (raise_statement . 0)) (REQUEUE . (raise_statement . 0)) (RAISE . (raise_statement . 0)) (PRAGMA . (raise_statement . 0)) (NULL . (raise_statement . 0)) (LOOP . (raise_statement . 0)) (IF . (raise_statement . 0)) (GOTO . (raise_statement . 0)) (FOR . (raise_statement . 0)) (EXIT . (raise_statement . 0)) (DELAY . (raise_statement . 0)) (DECLARE . (raise_statement . 0)) (CASE . (raise_statement . 0)) (BEGIN . (raise_statement . 0)) (ABORT . (raise_statement . 0)) (ACCEPT . (raise_statement . 0)) (CHARACTER_LITERAL . (raise_statement . 0)) (STRING_LITERAL . (raise_statement . 0)) (IDENTIFIER . (raise_statement . 0)) (LESS_LESS . (raise_statement . 0)) (END . (raise_statement . 0)) (EXCEPTION . (raise_statement . 0)))
      ((default . error) (WITH .  908) (DOT .  87) (TICK .  88) (SEMICOLON .  907) (LEFT_PAREN .  106))
      ((default . error) (WHEN . (simple_statement . 0)) (THEN . (simple_statement . 0)) (OR . (simple_statement . 0)) (ELSIF . (simple_statement . 0)) (ELSE . (simple_statement . 0)) (WHILE . (simple_statement . 0)) (SELECT . (simple_statement . 0)) (RETURN . (simple_statement . 0)) (REQUEUE . (simple_statement . 0)) (RAISE . (simple_statement . 0)) (PRAGMA . (simple_statement . 0)) (NULL . (simple_statement . 0)) (LOOP . (simple_statement . 0)) (IF . (simple_statement . 0)) (GOTO . (simple_statement . 0)) (FOR . (simple_statement . 0)) (EXIT . (simple_statement . 0)) (DELAY . (simple_statement . 0)) (DECLARE . (simple_statement . 0)) (CASE . (simple_statement . 0)) (BEGIN . (simple_statement . 0)) (ABORT . (simple_statement . 0)) (ACCEPT . (simple_statement . 0)) (CHARACTER_LITERAL . (simple_statement . 0)) (STRING_LITERAL . (simple_statement . 0)) (IDENTIFIER . (simple_statement . 0)) (LESS_LESS . (simple_statement . 0)) (END . (simple_statement . 0)) (EXCEPTION . (simple_statement . 0)))
      ((default . error) (END .  906))
      ((default . error) (THEN .  905))
      ((default . error) (SEMICOLON .  904))
      ((default . error) (LOOP . (iterator_specification_opt . 1)))
      ((default . error) (LOOP . (iteration_scheme . 1)))
      ((default . error) (WHEN . (identifier_opt . 1)) (SEMICOLON . (identifier_opt . 1)))
      ((default . error) (WHEN .  903) (SEMICOLON .  902))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON .  900))
      ((default . error) (BEGIN .  899))
      ((default . error) (IS .  898))
      ((default . error) (END .  897))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON .  896) (LEFT_PAREN .  106))
      ((default . error) (SEMICOLON . (actual_parameter_part_opt . 0)) (DO . (actual_parameter_part_opt . 0)) (LEFT_PAREN . ((actual_parameter_part_opt . 0)  893)))
      ((default . error) (REQUEUE . (label_opt . 2)) (RAISE . (label_opt . 2)) (PRAGMA . (label_opt . 2)) (NULL . (label_opt . 2)) (GOTO . (label_opt . 2)) (EXIT . (label_opt . 2)) (DELAY . (label_opt . 2)) (ABORT . (label_opt . 2)) (CHARACTER_LITERAL . (label_opt . 2)) (STRING_LITERAL . (label_opt . 2)) (IDENTIFIER . (label_opt . 2)) (WHILE . (label_opt . 2)) (SELECT . (label_opt . 2)) (RETURN . (label_opt . 2)) (LOOP . (label_opt . 2)) (IF . (label_opt . 2)) (FOR . (label_opt . 2)) (DECLARE . (label_opt . 2)) (CASE . (label_opt . 2)) (BEGIN . (label_opt . 2)) (ACCEPT . (label_opt . 2)))
      ((default . error) (GREATER_GREATER .  892))
      ((default . error) (IS .  891))
      ((default . error) (IS .  890))
      ((default . error) (COMMA . (pragma_argument_association . 2)) (RIGHT_PAREN . (pragma_argument_association . 2)))
      ((default . error) (ELSE .  886) (RIGHT_PAREN . (if_expression . 3)) (ELSIF .  887))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (NOT .  736) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (REVERSE .  882) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  758) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (REVERSE .  880) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (OTHERS .  172) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  171) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (RIGHT_PAREN . (case_expression_alternative_list . 0)) (COMMA . (case_expression_alternative_list . 0)))
      ((default . error) (COMMA .  878) (RIGHT_PAREN . (case_expression . 0)))
      ((default . error) (SEMICOLON .  877))
      ((default . error) (END .  876))
      ((default . error) (IDENTIFIER .  213) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  758) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (CASE .  366) (IF .  368) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (ARRAY . (constant_opt . 1)) (IDENTIFIER . (constant_opt . 1)) (STRING_LITERAL . (constant_opt . 1)) (CHARACTER_LITERAL . (constant_opt . 1)) (ACCESS . (constant_opt . 1)) (NOT . (constant_opt . 1)))
      ((default . error) (ARRAY .  480) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (ACCESS . (null_exclusion_opt . 0)) (NOT .  862))
      ((default . error) (USE . (exception_declaration . 0)) (TYPE . (exception_declaration . 0)) (TASK . (exception_declaration . 0)) (SUBTYPE . (exception_declaration . 0)) (PROTECTED . (exception_declaration . 0)) (PROCEDURE . (exception_declaration . 0)) (PRAGMA . (exception_declaration . 0)) (PACKAGE . (exception_declaration . 0)) (OVERRIDING . (exception_declaration . 0)) (NOT . (exception_declaration . 0)) (GENERIC . (exception_declaration . 0)) (FUNCTION . (exception_declaration . 0)) (FOR . (exception_declaration . 0)) (ENTRY . (exception_declaration . 0)) (IDENTIFIER . (exception_declaration . 0)) (BEGIN . (exception_declaration . 0)) (END . (exception_declaration . 0)) (PRIVATE . (exception_declaration . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON . (name_opt . 0)) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (PRIVATE . (abstract_tagged_limited_opt . 0)) (NULL . (abstract_tagged_limited_opt . 0)) (RECORD . (abstract_tagged_limited_opt . 0)) (TAGGED .  849) (RANGE .  847) (MOD .  845) (DIGITS .  842) (DELTA .  841) (TASK .  491) (PROTECTED .  487) (SYNCHRONIZED .  489) (INTERFACE .  483) (ARRAY .  480) (LEFT_PAREN .  843) (ACCESS . (null_exclusion_opt . 0)) (NOT .  208) (NEW . ((abstract_limited_synchronized_opt . 0) (abstract_limited_opt . 0))) (LIMITED .  844) (ABSTRACT .  840))
      ((default . error) (BEGIN . (single_task_declaration . 2)) (IDENTIFIER . (single_task_declaration . 2)) (ENTRY . (single_task_declaration . 2)) (FOR . (single_task_declaration . 2)) (FUNCTION . (single_task_declaration . 2)) (GENERIC . (single_task_declaration . 2)) (NOT . (single_task_declaration . 2)) (OVERRIDING . (single_task_declaration . 2)) (PACKAGE . (single_task_declaration . 2)) (PRAGMA . (single_task_declaration . 2)) (PROCEDURE . (single_task_declaration . 2)) (PROTECTED . (single_task_declaration . 2)) (SUBTYPE . (single_task_declaration . 2)) (TASK . (single_task_declaration . 2)) (TYPE . (single_task_declaration . 2)) (USE . (single_task_declaration . 2)) (PRIVATE . (single_task_declaration . 2)) (END . (single_task_declaration . 2)))
      ((default . error) (NEW .  837) (END . (declarative_part_opt . 0)) (PRIVATE . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (SEPARATE .  836))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (IS . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (NULL .  834))
      ((default . error) (DO . (subtype_indication . 3)) (OF . (subtype_indication . 3)) (AND . (subtype_indication . 3)) (SEMICOLON . (subtype_indication . 3)) (WITH . (subtype_indication . 3)) (COLON_EQUAL . (subtype_indication . 3)) (DOT .  87) (TICK .  88) (RANGE .  833) (LEFT_PAREN .  803))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (NEW .  829) (END . (declarative_part_opt . 0)) (PRIVATE . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (SEPARATE .  828))
      ((default . error) (IS . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (SEPARATE .  826))
      ((default . error) (SEMICOLON .  825))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (IDENTIFIER . (mod_clause_opt . 0)) (AT .  822))
      ((default . error) (SEMICOLON .  821))
      ((default . error) (SEMICOLON .  820))
      ((default . error) (DOT .  87) (TICK .  88) (RENAMES .  819) (LEFT_PAREN .  106))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (XOR . (choice_relation . 0)) (OR . (choice_relation . 0)) (BAR . (choice_relation . 0)) (EQUAL_GREATER . (choice_relation . 0)) (AND . (choice_relation . 0)))
      ((default . error) (RIGHT_PAREN .  816))
      ((default . error) (DO . (membership_choice_list . 1)) (LOOP . (membership_choice_list . 1)) (COMMA . (membership_choice_list . 1)) (ELSIF . (membership_choice_list . 1)) (ELSE . (membership_choice_list . 1)) (EQUAL_GREATER . (membership_choice_list . 1)) (RIGHT_PAREN . (membership_choice_list . 1)) (DIGITS . (membership_choice_list . 1)) (RANGE . (membership_choice_list . 1)) (THEN . (membership_choice_list . 1)) (SEMICOLON . (membership_choice_list . 1)) (WITH . (membership_choice_list . 1)) (IS . (membership_choice_list . 1)) (AND . (membership_choice_list . 1)) (OR . (membership_choice_list . 1)) (XOR . (membership_choice_list . 1)) (BAR . (membership_choice_list . 1)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (IDENTIFIER .  812) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (NULL . (abstract_tagged_limited_opt . 1)) (RECORD . (abstract_tagged_limited_opt . 1)) (PRIVATE . (abstract_tagged_limited_opt . 1)))
      ((default . error) (NULL .  811) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (RIGHT_PAREN . (discrete_subtype_definition_list . 0)) (COMMA . (discrete_subtype_definition_list . 0)))
      ((default . error) (COMMA .  809) (RIGHT_PAREN .  810))
      ((default . error) (RIGHT_PAREN . (index_subtype_definition_list . 0)) (COMMA . (index_subtype_definition_list . 0)))
      ((default . error) (COMMA .  807) (RIGHT_PAREN .  808))
      ((default . error) (RIGHT_PAREN . (subtype_indication . 3)) (COMMA . (subtype_indication . 3)) (PLUS . (primary . 2)) (MINUS . (primary . 2)) (AMPERSAND . (primary . 2)) (DOT_DOT . (primary . 2)) (SLASH . (primary . 2)) (STAR . (primary . 2)) (MOD . (primary . 2)) (REM . (primary . 2)) (STAR_STAR . (primary . 2)) (DOT .  87) (TICK .  274) (RANGE .  804) (LEFT_PAREN .  803))
      ((default . error) (LOOP . (discrete_subtype_definition . 1)) (EQUAL_GREATER . (discrete_subtype_definition . 1)) (COMMA . (discrete_subtype_definition . 1)) (RIGHT_PAREN . (discrete_subtype_definition . 1)))
      ((default . error) (DOT_DOT .  264))
      ((default . error) (LOOP . (discrete_subtype_definition . 0)) (EQUAL_GREATER . (discrete_subtype_definition . 0)) (COMMA . (discrete_subtype_definition . 0)) (RIGHT_PAREN . (discrete_subtype_definition . 0)))
      ((default . error) (BOX .  802))
      ((default . error) (WITH . (formal_type_definition . 2)) (SEMICOLON . (formal_type_definition . 2)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (PACKAGE . (formal_type_declaration . 1)) (PROCEDURE . (formal_type_declaration . 1)) (FUNCTION . (formal_type_declaration . 1)) (IDENTIFIER . (formal_type_declaration . 1)) (PRAGMA . (formal_type_declaration . 1)) (TYPE . (formal_type_declaration . 1)) (WITH . (formal_type_declaration . 1)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (SEMICOLON . (formal_derived_type_definition . 3)) (WITH . ((formal_derived_type_definition . 3)  796)) (DOT .  87) (TICK .  88) (AND .  795) (LEFT_PAREN .  106))
      ((default . error) (PACKAGE . (formal_type_declaration . 0)) (PROCEDURE . (formal_type_declaration . 0)) (FUNCTION . (formal_type_declaration . 0)) (IDENTIFIER . (formal_type_declaration . 0)) (PRAGMA . (formal_type_declaration . 0)) (TYPE . (formal_type_declaration . 0)) (WITH . (formal_type_declaration . 0)))
      ((default . error) (PACKAGE . (formal_subprogram_declaration . 2)) (PROCEDURE . (formal_subprogram_declaration . 2)) (FUNCTION . (formal_subprogram_declaration . 2)) (IDENTIFIER . (formal_subprogram_declaration . 2)) (PRAGMA . (formal_subprogram_declaration . 2)) (TYPE . (formal_subprogram_declaration . 2)) (WITH . (formal_subprogram_declaration . 2)))
      ((default . error) (BOX .  794) (IDENTIFIER .  48) (STRING_LITERAL .  49) (CHARACTER_LITERAL .  170) (RIGHT_PAREN . ((association_opt . 0) (expression_opt . 0))) (COMMA . ((association_opt . 0) (expression_opt . 0))) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (PLUS .  144) (MINUS .  143) (OTHERS .  172) (ABS .  146) (NOT .  171) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (PACKAGE . (formal_object_declaration . 1)) (PROCEDURE . (formal_object_declaration . 1)) (FUNCTION . (formal_object_declaration . 1)) (IDENTIFIER . (formal_object_declaration . 1)) (PRAGMA . (formal_object_declaration . 1)) (TYPE . (formal_object_declaration . 1)) (WITH . (formal_object_declaration . 1)))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (SEMICOLON .  791))
      ((default . error) (IDENTIFIER .  72))
      ((default . error) (RENAMES . (access_definition . 1)) (DO . (access_definition . 1)) (RIGHT_PAREN . (access_definition . 1)) (IS . (access_definition . 1)) (SEMICOLON . (access_definition . 1)) (WITH . (access_definition . 1)) (COLON_EQUAL . (access_definition . 1)))
      ((default . error) (RENAMES . (access_definition . 2)) (DO . (access_definition . 2)) (RIGHT_PAREN . (access_definition . 2)) (IS . (access_definition . 2)) (SEMICOLON . (access_definition . 2)) (WITH . (access_definition . 2)) (COLON_EQUAL . (access_definition . 2)))
      ((default . error) (SEMICOLON . (parameter_specification . 2)) (RIGHT_PAREN . (parameter_specification . 2)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (DO . (aggregate . 1)) (LOOP . (aggregate . 1)) (USE . (aggregate . 1)) (COLON_EQUAL . (aggregate . 1)) (WHILE . (aggregate . 1)) (SELECT . (aggregate . 1)) (REQUEUE . (aggregate . 1)) (RAISE . (aggregate . 1)) (PRAGMA . (aggregate . 1)) (NULL . (aggregate . 1)) (IF . (aggregate . 1)) (GOTO . (aggregate . 1)) (FOR . (aggregate . 1)) (EXIT . (aggregate . 1)) (DELAY . (aggregate . 1)) (DECLARE . (aggregate . 1)) (CASE . (aggregate . 1)) (BEGIN . (aggregate . 1)) (ABORT . (aggregate . 1)) (ACCEPT . (aggregate . 1)) (CHARACTER_LITERAL . (aggregate . 1)) (STRING_LITERAL . (aggregate . 1)) (IDENTIFIER . (aggregate . 1)) (LESS_LESS . (aggregate . 1)) (OF . (aggregate . 1)) (ELSIF . (aggregate . 1)) (ELSE . (aggregate . 1)) (DIGITS . (aggregate . 1)) (COMMA . (aggregate . 1)) (RIGHT_PAREN . (aggregate . 1)) (RANGE . (aggregate . 1)) (THEN . (aggregate . 1)) (WITH . (aggregate . 1)) (BAR . (aggregate . 1)) (EQUAL_GREATER . (aggregate . 1)) (IS . (aggregate . 1)) (SLASH_EQUAL . (aggregate . 1)) (LESS_EQUAL . (aggregate . 1)) (LESS . (aggregate . 1)) (GREATER_EQUAL . (aggregate . 1)) (GREATER . (aggregate . 1)) (EQUAL . (aggregate . 1)) (NOT . (aggregate . 1)) (IN . (aggregate . 1)) (AND . (aggregate . 1)) (OR . (aggregate . 1)) (XOR . (aggregate . 1)) (SEMICOLON . (aggregate . 1)) (STAR_STAR . (aggregate . 1)) (REM . (aggregate . 1)) (MOD . (aggregate . 1)) (STAR . (aggregate . 1)) (SLASH . (aggregate . 1)) (DOT_DOT . (aggregate . 1)) (AMPERSAND . (aggregate . 1)) (MINUS . (aggregate . 1)) (PLUS . (aggregate . 1)) (LEFT_PAREN . (aggregate . 1)) (DOT . (aggregate . 1)) (TICK . (aggregate . 1)) (RENAMES . (aggregate . 1)) (RETURN . (aggregate . 1)))
      ((default . error) (RIGHT_PAREN .  789))
      ((default . error) (OF . (aggregate . 2)) (LESS_LESS . (aggregate . 2)) (IDENTIFIER . (aggregate . 2)) (STRING_LITERAL . (aggregate . 2)) (CHARACTER_LITERAL . (aggregate . 2)) (ACCEPT . (aggregate . 2)) (ABORT . (aggregate . 2)) (BEGIN . (aggregate . 2)) (CASE . (aggregate . 2)) (DECLARE . (aggregate . 2)) (DELAY . (aggregate . 2)) (EXIT . (aggregate . 2)) (FOR . (aggregate . 2)) (GOTO . (aggregate . 2)) (IF . (aggregate . 2)) (NULL . (aggregate . 2)) (PRAGMA . (aggregate . 2)) (RAISE . (aggregate . 2)) (REQUEUE . (aggregate . 2)) (SELECT . (aggregate . 2)) (WHILE . (aggregate . 2)) (COLON_EQUAL . (aggregate . 2)) (USE . (aggregate . 2)) (LOOP . (aggregate . 2)) (DO . (aggregate . 2)) (RETURN . (aggregate . 2)) (RENAMES . (aggregate . 2)) (TICK . (aggregate . 2)) (DOT . (aggregate . 2)) (LEFT_PAREN . (aggregate . 2)) (PLUS . (aggregate . 2)) (MINUS . (aggregate . 2)) (AMPERSAND . (aggregate . 2)) (DOT_DOT . (aggregate . 2)) (SLASH . (aggregate . 2)) (STAR . (aggregate . 2)) (MOD . (aggregate . 2)) (REM . (aggregate . 2)) (STAR_STAR . (aggregate . 2)) (SEMICOLON . (aggregate . 2)) (XOR . (aggregate . 2)) (OR . (aggregate . 2)) (AND . (aggregate . 2)) (IN . (aggregate . 2)) (NOT . (aggregate . 2)) (EQUAL . (aggregate . 2)) (GREATER . (aggregate . 2)) (GREATER_EQUAL . (aggregate . 2)) (LESS . (aggregate . 2)) (LESS_EQUAL . (aggregate . 2)) (SLASH_EQUAL . (aggregate . 2)) (IS . (aggregate . 2)) (EQUAL_GREATER . (aggregate . 2)) (BAR . (aggregate . 2)) (WITH . (aggregate . 2)) (THEN . (aggregate . 2)) (RANGE . (aggregate . 2)) (RIGHT_PAREN . (aggregate . 2)) (COMMA . (aggregate . 2)) (DIGITS . (aggregate . 2)) (ELSE . (aggregate . 2)) (ELSIF . (aggregate . 2)))
      ((default . error) (COLON_EQUAL .  1067) (DOT .  87) (TICK .  88) (RIGHT_PAREN . (parameter_specification . 1)) (SEMICOLON . (parameter_specification . 1)) (LEFT_PAREN .  106))
      ((default . error) (WITH . (formal_object_declaration . 2)) (TYPE . (formal_object_declaration . 2)) (PRAGMA . (formal_object_declaration . 2)) (IDENTIFIER . (formal_object_declaration . 2)) (FUNCTION . (formal_object_declaration . 2)) (PROCEDURE . (formal_object_declaration . 2)) (PACKAGE . (formal_object_declaration . 2)))
      ((default . error) (SEMICOLON .  1066))
      ((default . error) (SEMICOLON .  1065))
      ((default . error) (RIGHT_PAREN .  1064))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (PRIVATE .  1062))
      ((default . error) (AND .  1061) (WITH . (interface_type_definition . 1)) (SEMICOLON . (interface_type_definition . 1)))
      ((default . error) (DOT .  87) (SEMICOLON . (interface_list . 0)) (WITH . (interface_list . 0)) (AND . (interface_list . 0)) (TICK .  88) (LEFT_PAREN .  106))
      ((default . error) (AND .  1061) (WITH . (interface_type_definition . 3)) (SEMICOLON . (interface_type_definition . 3)))
      ((default . error) (AND .  1061) (WITH . (interface_type_definition . 2)) (SEMICOLON . (interface_type_definition . 2)))
      ((default . error) (AND .  1061) (WITH . (interface_type_definition . 0)) (SEMICOLON . (interface_type_definition . 0)))
      ((default . error) (SEMICOLON . (formal_type_definition . 7)) (WITH . (formal_type_definition . 7)))
      ((default . error) (IDENTIFIER .  48) (STRING_LITERAL .  49) (CHARACTER_LITERAL .  170) (RIGHT_PAREN . ((association_opt . 0) (expression_opt . 0))) (COMMA . ((association_opt . 0) (expression_opt . 0))) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (PLUS .  144) (MINUS .  143) (OTHERS .  172) (ABS .  146) (NOT .  1058) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (BOX .  1057) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (LOOP . (subtype_indication . 2)) (DO . (subtype_indication . 2)) (EQUAL_GREATER . (subtype_indication . 2)) (COMMA . (subtype_indication . 2)) (RIGHT_PAREN . (subtype_indication . 2)) (COLON_EQUAL . (subtype_indication . 2)) (WITH . (subtype_indication . 2)) (SEMICOLON . (subtype_indication . 2)) (AND . (subtype_indication . 2)) (OF . (subtype_indication . 2)))
      ((default . error) (LOOP . (constraint . 1)) (DO . (constraint . 1)) (EQUAL_GREATER . (constraint . 1)) (COMMA . (constraint . 1)) (RIGHT_PAREN . (constraint . 1)) (COLON_EQUAL . (constraint . 1)) (WITH . (constraint . 1)) (SEMICOLON . (constraint . 1)) (AND . (constraint . 1)) (OF . (constraint . 1)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (OF .  1054))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  758) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (OF .  1052))
      ((default . error) (PLUS . (primary . 0)) (MINUS . (primary . 0)) (AMPERSAND . (primary . 0)) (DOT_DOT . (primary . 0)) (SLASH . (primary . 0)) (STAR . (primary . 0)) (MOD . (primary . 0)) (REM . (primary . 0)) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (DOT . (name . 0)) (LEFT_PAREN . (name . 0)) (TICK . (name . 0)) (SEMICOLON . (null_exclusion_opt_name . 2)) (RIGHT_PAREN . (null_exclusion_opt_name . 2)) (COLON_EQUAL . (null_exclusion_opt_name . 2)))
      ((default . error) (DOT . (name . 3)) (LEFT_PAREN . (name . 3)) (TICK . (name . 3)) (SEMICOLON . (null_exclusion_opt_name . 3)) (RIGHT_PAREN . (null_exclusion_opt_name . 3)) (COLON_EQUAL . (null_exclusion_opt_name . 3)))
      ((default . error) (SEMICOLON . (discriminant_specification_opt . 3)) (RIGHT_PAREN . (discriminant_specification_opt . 3)))
      ((default . error) (SEMICOLON . (discriminant_specification_opt . 1)) (RIGHT_PAREN . (discriminant_specification_opt . 1)))
      ((default . error) (DO . (range . 0)) (LOOP . (range . 0)) (XOR . (range . 0)) (OR . (range . 0)) (AND . (range . 0)) (IS . (range . 0)) (WITH . (range . 0)) (SEMICOLON . (range . 0)) (THEN . (range . 0)) (RANGE . (range . 0)) (DIGITS . (range . 0)) (ELSE . (range . 0)) (ELSIF . (range . 0)) (COLON_EQUAL . (range . 0)) (OF . (range . 0)) (COMMA . (range . 0)) (BAR . (range . 0)) (EQUAL_GREATER . (range . 0)) (RIGHT_PAREN . (range . 0)))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (WHEN . (record_representation_clause . 0)) (END . (record_representation_clause . 0)) (PRIVATE . (record_representation_clause . 0)) (CASE . (record_representation_clause . 0)) (USE . (record_representation_clause . 0)) (TYPE . (record_representation_clause . 0)) (TASK . (record_representation_clause . 0)) (SUBTYPE . (record_representation_clause . 0)) (PROTECTED . (record_representation_clause . 0)) (PROCEDURE . (record_representation_clause . 0)) (PRAGMA . (record_representation_clause . 0)) (PACKAGE . (record_representation_clause . 0)) (OVERRIDING . (record_representation_clause . 0)) (NOT . (record_representation_clause . 0)) (GENERIC . (record_representation_clause . 0)) (FUNCTION . (record_representation_clause . 0)) (FOR . (record_representation_clause . 0)) (ENTRY . (record_representation_clause . 0)) (IDENTIFIER . (record_representation_clause . 0)) (BEGIN . (record_representation_clause . 0)))
      ((default . error) (WHEN . (enumeration_representation_clause . 0)) (END . (enumeration_representation_clause . 0)) (PRIVATE . (enumeration_representation_clause . 0)) (CASE . (enumeration_representation_clause . 0)) (USE . (enumeration_representation_clause . 0)) (TYPE . (enumeration_representation_clause . 0)) (TASK . (enumeration_representation_clause . 0)) (SUBTYPE . (enumeration_representation_clause . 0)) (PROTECTED . (enumeration_representation_clause . 0)) (PROCEDURE . (enumeration_representation_clause . 0)) (PRAGMA . (enumeration_representation_clause . 0)) (PACKAGE . (enumeration_representation_clause . 0)) (OVERRIDING . (enumeration_representation_clause . 0)) (NOT . (enumeration_representation_clause . 0)) (GENERIC . (enumeration_representation_clause . 0)) (FUNCTION . (enumeration_representation_clause . 0)) (FOR . (enumeration_representation_clause . 0)) (ENTRY . (enumeration_representation_clause . 0)) (IDENTIFIER . (enumeration_representation_clause . 0)) (BEGIN . (enumeration_representation_clause . 0)))
      ((default . error) (MOD .  1048))
      ((default . error) (IDENTIFIER .  1045))
      ((default . error) (SEMICOLON .  1044))
      ((default . error) (WHEN . (aspect_clause . 0)) (PRIVATE . (aspect_clause . 0)) (END . (aspect_clause . 0)) (CASE . (aspect_clause . 0)) (BEGIN . (aspect_clause . 0)) (IDENTIFIER . (aspect_clause . 0)) (ENTRY . (aspect_clause . 0)) (FOR . (aspect_clause . 0)) (FUNCTION . (aspect_clause . 0)) (GENERIC . (aspect_clause . 0)) (NOT . (aspect_clause . 0)) (OVERRIDING . (aspect_clause . 0)) (PACKAGE . (aspect_clause . 0)) (PRAGMA . (aspect_clause . 0)) (PROCEDURE . (aspect_clause . 0)) (PROTECTED . (aspect_clause . 0)) (SUBTYPE . (aspect_clause . 0)) (TASK . (aspect_clause . 0)) (TYPE . (aspect_clause . 0)) (USE . (aspect_clause . 0)))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (IS .  1042))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (END .  1038) (PRIVATE .  1039))
      ((default . error) (SEMICOLON .  1037))
      ((default . error) (SEMICOLON .  1036))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (SEMICOLON .  1032) (IS .  1033))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (END .  1028) (PRIVATE .  1029))
      ((default . error) (SEMICOLON .  1027))
      ((default . error) (SYNCHRONIZED .  551) (TAGGED .  552) (NEW . ((abstract_limited_synchronized_opt . 3) (abstract_limited_opt . 3))) (LIMITED .  1026))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (IDENTIFIER .  1020) (CHARACTER_LITERAL .  1021))
      ((default . error) (INTERFACE .  545) (PRIVATE . (abstract_tagged_limited_opt . 5)) (NULL . (abstract_tagged_limited_opt . 5)) (RECORD . (abstract_tagged_limited_opt . 5)) (NEW . ((abstract_limited_synchronized_opt . 4) (abstract_limited_opt . 2))))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (RECORD .  1018))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (END . (component_list_opt . 0)) (NULL .  1009) (CASE .  1008) (IDENTIFIER .  72) (FOR .  289))
      ((default . error) (SEMICOLON .  1007) (PRIVATE . (abstract_tagged_limited_opt . 4)) (NULL . (abstract_tagged_limited_opt . 4)) (RECORD . (abstract_tagged_limited_opt . 4)) (LIMITED .  539))
      ((default . error) (NEW .  1006))
      ((default . error) (NEW .  1005))
      ((default . error) (PRIVATE .  1003) (RECORD .  848) (NULL .  846))
      ((default . error) (WITH . (type_definition . 8)) (SEMICOLON . (type_definition . 8)))
      ((default . error) (WITH . (type_definition . 6)) (SEMICOLON . (type_definition . 6)))
      ((default . error) (WITH . (type_definition . 9)) (SEMICOLON . (type_definition . 9)))
      ((default . error) (WITH . (type_definition . 0)) (SEMICOLON . (type_definition . 0)))
      ((default . error) (WITH . (type_definition . 10)) (SEMICOLON . (type_definition . 10)))
      ((default . error) (WITH . (type_definition . 7)) (SEMICOLON . (type_definition . 7)))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (SEMICOLON . (package_specification . 0)))
      ((default . error) (SEMICOLON .  1001))
      ((default . error) (NULL .  1000))
      ((default . error) (COLON_EQUAL .  998) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (COLON_EQUAL .  996) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (COLON_EQUAL .  994) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (SEMICOLON .  993))
      ((default . error) (SEMICOLON .  992))
      ((default . error) (SEMICOLON .  991))
      ((default . error) (SEMICOLON .  990))
      ((default . error) (RIGHT_PAREN .  989))
      ((default . error) (RIGHT_PAREN .  988))
      ((default . error) (RIGHT_PAREN .  987))
      ((default . error) (SEMICOLON .  986))
      ((default . error) (RIGHT_PAREN .  985))
      ((default . error) (LOOP . (subtype_indication . 3)) (DOT .  87) (IN . (primary . 2)) (NOT . (primary . 2)) (EQUAL . (primary . 2)) (GREATER . (primary . 2)) (GREATER_EQUAL . (primary . 2)) (LESS . (primary . 2)) (LESS_EQUAL . (primary . 2)) (SLASH_EQUAL . (primary . 2)) (RIGHT_PAREN . ((subtype_indication . 3) (primary . 2))) (COMMA . ((subtype_indication . 3) (primary . 2))) (BAR . (primary . 2)) (EQUAL_GREATER . ((subtype_indication . 3) (primary . 2))) (AND . (primary . 2)) (OR . (primary . 2)) (XOR . (primary . 2)) (PLUS . (primary . 2)) (MINUS . (primary . 2)) (AMPERSAND . (primary . 2)) (DOT_DOT . (primary . 2)) (SLASH . (primary . 2)) (STAR . (primary . 2)) (MOD . (primary . 2)) (REM . (primary . 2)) (STAR_STAR . (primary . 2)) (TICK .  274) (RANGE .  833) (LEFT_PAREN .  803))
      ((default . error) (SEMICOLON . (name_opt . 0)) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (END . (package_body . 1)) (BEGIN . (package_body . 1)) (IDENTIFIER . (package_body . 1)) (ENTRY . (package_body . 1)) (FOR . (package_body . 1)) (PROTECTED . (package_body . 1)) (SUBTYPE . (package_body . 1)) (TASK . (package_body . 1)) (TYPE . (package_body . 1)) (WITH . (package_body . 1)) (USE . (package_body . 1)) (SEPARATE . (package_body . 1)) (PROCEDURE . (package_body . 1)) (PRIVATE . (package_body . 1)) (PRAGMA . (package_body . 1)) (PACKAGE . (package_body . 1)) (OVERRIDING . (package_body . 1)) (NOT . (package_body . 1)) (LIMITED . (package_body . 1)) (GENERIC . (package_body . 1)) (FUNCTION . (package_body . 1)) ($EOI . (package_body . 1)))
      ((default . error) (WHEN .  714))
      ((default . error) (BAR .  275) (EQUAL_GREATER .  982))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (DOT .  87) (TICK .  88) (LOOP . (iterator_specification . 5)) (EQUAL_GREATER . (iterator_specification . 5)) (LEFT_PAREN .  106))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  758) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (LOOP . (iterator_specification . 1)) (EQUAL_GREATER . (iterator_specification . 1)))
      ((default . error) (OF .  979))
      ((default . error) (RIGHT_PAREN . (quantified_expression . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (RIGHT_PAREN . (elsif_expression_list . 0)) (ELSE . (elsif_expression_list . 0)) (ELSIF . (elsif_expression_list . 0)))
      ((default . error) (RIGHT_PAREN . (if_expression . 1)) (ELSE .  975) (ELSIF .  887))
      ((default . error) (END . (protected_operation_item_list_opt . 0)) (ENTRY .  966) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (FOR .  289))
      ((default . error) (BEGIN . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (ACCEPT . (label_opt . 1)) (BEGIN . (label_opt . 1)) (CASE . (label_opt . 1)) (DECLARE . (label_opt . 1)) (FOR . (label_opt . 1)) (IF . (label_opt . 1)) (LOOP . (label_opt . 1)) (RETURN . (label_opt . 1)) (SELECT . (label_opt . 1)) (WHILE . (label_opt . 1)) (IDENTIFIER . (label_opt . 1)) (STRING_LITERAL . (label_opt . 1)) (CHARACTER_LITERAL . (label_opt . 1)) (ABORT . (label_opt . 1)) (DELAY . (label_opt . 1)) (EXIT . (label_opt . 1)) (GOTO . (label_opt . 1)) (NULL . (label_opt . 1)) (PRAGMA . (label_opt . 1)) (RAISE . (label_opt . 1)) (REQUEUE . (label_opt . 1)))
      ((default . error) (RIGHT_PAREN . ((association_opt . 0) (expression_opt . 0))) (COMMA . ((association_opt . 0) (expression_opt . 0))) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (OTHERS .  172) (IDENTIFIER .  48) (CHARACTER_LITERAL .  170) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  171) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON . (actual_parameter_part_opt . 1)) (LEFT_PAREN . (actual_parameter_part_opt . 1)) (DO . (actual_parameter_part_opt . 1)))
      ((default . error) (DO . (parameter_profile_opt . 0)) (SEMICOLON . (parameter_profile_opt . 0)) (LEFT_PAREN .  782))
      ((default . error) (OR . (simple_statement . 8)) (THEN . (simple_statement . 8)) (WHEN . (simple_statement . 8)) (EXCEPTION . (simple_statement . 8)) (END . (simple_statement . 8)) (LESS_LESS . (simple_statement . 8)) (IDENTIFIER . (simple_statement . 8)) (STRING_LITERAL . (simple_statement . 8)) (CHARACTER_LITERAL . (simple_statement . 8)) (ACCEPT . (simple_statement . 8)) (ABORT . (simple_statement . 8)) (BEGIN . (simple_statement . 8)) (CASE . (simple_statement . 8)) (DECLARE . (simple_statement . 8)) (DELAY . (simple_statement . 8)) (EXIT . (simple_statement . 8)) (FOR . (simple_statement . 8)) (GOTO . (simple_statement . 8)) (IF . (simple_statement . 8)) (LOOP . (simple_statement . 8)) (NULL . (simple_statement . 8)) (PRAGMA . (simple_statement . 8)) (RAISE . (simple_statement . 8)) (REQUEUE . (simple_statement . 8)) (RETURN . (simple_statement . 8)) (SELECT . (simple_statement . 8)) (WHILE . (simple_statement . 8)) (ELSE . (simple_statement . 8)) (ELSIF . (simple_statement . 8)))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (WHEN .  960))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (EXCEPTION . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (WHEN . (delay_statement . 1)) (EXCEPTION . (delay_statement . 1)) (ELSIF . (delay_statement . 1)) (THEN . (delay_statement . 1)) (ELSE . (delay_statement . 1)) (OR . (delay_statement . 1)) (END . (delay_statement . 1)) (LESS_LESS . (delay_statement . 1)) (IDENTIFIER . (delay_statement . 1)) (STRING_LITERAL . (delay_statement . 1)) (CHARACTER_LITERAL . (delay_statement . 1)) (ACCEPT . (delay_statement . 1)) (ABORT . (delay_statement . 1)) (BEGIN . (delay_statement . 1)) (CASE . (delay_statement . 1)) (DECLARE . (delay_statement . 1)) (DELAY . (delay_statement . 1)) (EXIT . (delay_statement . 1)) (FOR . (delay_statement . 1)) (GOTO . (delay_statement . 1)) (IF . (delay_statement . 1)) (LOOP . (delay_statement . 1)) (NULL . (delay_statement . 1)) (PRAGMA . (delay_statement . 1)) (RAISE . (delay_statement . 1)) (REQUEUE . (delay_statement . 1)) (RETURN . (delay_statement . 1)) (SELECT . (delay_statement . 1)) (WHILE . (delay_statement . 1)))
      ((default . error) (SEMICOLON .  958))
      ((default . error) (OR . (exit_statement . 1)) (THEN . (exit_statement . 1)) (WHEN . (exit_statement . 1)) (EXCEPTION . (exit_statement . 1)) (END . (exit_statement . 1)) (LESS_LESS . (exit_statement . 1)) (IDENTIFIER . (exit_statement . 1)) (STRING_LITERAL . (exit_statement . 1)) (CHARACTER_LITERAL . (exit_statement . 1)) (ACCEPT . (exit_statement . 1)) (ABORT . (exit_statement . 1)) (BEGIN . (exit_statement . 1)) (CASE . (exit_statement . 1)) (DECLARE . (exit_statement . 1)) (DELAY . (exit_statement . 1)) (EXIT . (exit_statement . 1)) (FOR . (exit_statement . 1)) (GOTO . (exit_statement . 1)) (IF . (exit_statement . 1)) (LOOP . (exit_statement . 1)) (NULL . (exit_statement . 1)) (PRAGMA . (exit_statement . 1)) (RAISE . (exit_statement . 1)) (REQUEUE . (exit_statement . 1)) (RETURN . (exit_statement . 1)) (SELECT . (exit_statement . 1)) (WHILE . (exit_statement . 1)) (ELSE . (exit_statement . 1)) (ELSIF . (exit_statement . 1)))
      ((default . error) (SEMICOLON . (expression_opt . 0)) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (OR . (simple_statement . 3)) (THEN . (simple_statement . 3)) (WHEN . (simple_statement . 3)) (EXCEPTION . (simple_statement . 3)) (END . (simple_statement . 3)) (LESS_LESS . (simple_statement . 3)) (IDENTIFIER . (simple_statement . 3)) (STRING_LITERAL . (simple_statement . 3)) (CHARACTER_LITERAL . (simple_statement . 3)) (ACCEPT . (simple_statement . 3)) (ABORT . (simple_statement . 3)) (BEGIN . (simple_statement . 3)) (CASE . (simple_statement . 3)) (DECLARE . (simple_statement . 3)) (DELAY . (simple_statement . 3)) (EXIT . (simple_statement . 3)) (FOR . (simple_statement . 3)) (GOTO . (simple_statement . 3)) (IF . (simple_statement . 3)) (LOOP . (simple_statement . 3)) (NULL . (simple_statement . 3)) (PRAGMA . (simple_statement . 3)) (RAISE . (simple_statement . 3)) (REQUEUE . (simple_statement . 3)) (RETURN . (simple_statement . 3)) (SELECT . (simple_statement . 3)) (WHILE . (simple_statement . 3)) (ELSE . (simple_statement . 3)) (ELSIF . (simple_statement . 3)))
      ((default . error) (ELSIF . (sequence_of_statements_opt . 0)) (ELSE . (sequence_of_statements_opt . 0)) (END . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (LOOP .  955))
      ((default . error) (OR . (raise_statement . 2)) (THEN . (raise_statement . 2)) (WHEN . (raise_statement . 2)) (EXCEPTION . (raise_statement . 2)) (END . (raise_statement . 2)) (LESS_LESS . (raise_statement . 2)) (IDENTIFIER . (raise_statement . 2)) (STRING_LITERAL . (raise_statement . 2)) (CHARACTER_LITERAL . (raise_statement . 2)) (ACCEPT . (raise_statement . 2)) (ABORT . (raise_statement . 2)) (BEGIN . (raise_statement . 2)) (CASE . (raise_statement . 2)) (DECLARE . (raise_statement . 2)) (DELAY . (raise_statement . 2)) (EXIT . (raise_statement . 2)) (FOR . (raise_statement . 2)) (GOTO . (raise_statement . 2)) (IF . (raise_statement . 2)) (LOOP . (raise_statement . 2)) (NULL . (raise_statement . 2)) (PRAGMA . (raise_statement . 2)) (RAISE . (raise_statement . 2)) (REQUEUE . (raise_statement . 2)) (RETURN . (raise_statement . 2)) (SELECT . (raise_statement . 2)) (WHILE . (raise_statement . 2)) (ELSE . (raise_statement . 2)) (ELSIF . (raise_statement . 2)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (OR . (requeue_statement . 1)) (THEN . (requeue_statement . 1)) (WHEN . (requeue_statement . 1)) (EXCEPTION . (requeue_statement . 1)) (END . (requeue_statement . 1)) (LESS_LESS . (requeue_statement . 1)) (IDENTIFIER . (requeue_statement . 1)) (STRING_LITERAL . (requeue_statement . 1)) (CHARACTER_LITERAL . (requeue_statement . 1)) (ACCEPT . (requeue_statement . 1)) (ABORT . (requeue_statement . 1)) (BEGIN . (requeue_statement . 1)) (CASE . (requeue_statement . 1)) (DECLARE . (requeue_statement . 1)) (DELAY . (requeue_statement . 1)) (EXIT . (requeue_statement . 1)) (FOR . (requeue_statement . 1)) (GOTO . (requeue_statement . 1)) (IF . (requeue_statement . 1)) (LOOP . (requeue_statement . 1)) (NULL . (requeue_statement . 1)) (PRAGMA . (requeue_statement . 1)) (RAISE . (requeue_statement . 1)) (REQUEUE . (requeue_statement . 1)) (RETURN . (requeue_statement . 1)) (SELECT . (requeue_statement . 1)) (WHILE . (requeue_statement . 1)) (ELSE . (requeue_statement . 1)) (ELSIF . (requeue_statement . 1)))
      ((default . error) (ABORT .  953))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (EXCEPTION . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (OR . (extended_return_statement . 1)) (THEN . (extended_return_statement . 1)) (WHEN . (extended_return_statement . 1)) (EXCEPTION . (extended_return_statement . 1)) (END . (extended_return_statement . 1)) (LESS_LESS . (extended_return_statement . 1)) (IDENTIFIER . (extended_return_statement . 1)) (STRING_LITERAL . (extended_return_statement . 1)) (CHARACTER_LITERAL . (extended_return_statement . 1)) (ACCEPT . (extended_return_statement . 1)) (ABORT . (extended_return_statement . 1)) (BEGIN . (extended_return_statement . 1)) (CASE . (extended_return_statement . 1)) (DECLARE . (extended_return_statement . 1)) (DELAY . (extended_return_statement . 1)) (EXIT . (extended_return_statement . 1)) (FOR . (extended_return_statement . 1)) (GOTO . (extended_return_statement . 1)) (IF . (extended_return_statement . 1)) (LOOP . (extended_return_statement . 1)) (NULL . (extended_return_statement . 1)) (PRAGMA . (extended_return_statement . 1)) (RAISE . (extended_return_statement . 1)) (REQUEUE . (extended_return_statement . 1)) (RETURN . (extended_return_statement . 1)) (SELECT . (extended_return_statement . 1)) (WHILE . (extended_return_statement . 1)) (ELSE . (extended_return_statement . 1)) (ELSIF . (extended_return_statement . 1)))
      ((default . error) (OR . (simple_return_statement . 1)) (THEN . (simple_return_statement . 1)) (WHEN . (simple_return_statement . 1)) (EXCEPTION . (simple_return_statement . 1)) (END . (simple_return_statement . 1)) (LESS_LESS . (simple_return_statement . 1)) (IDENTIFIER . (simple_return_statement . 1)) (STRING_LITERAL . (simple_return_statement . 1)) (CHARACTER_LITERAL . (simple_return_statement . 1)) (ACCEPT . (simple_return_statement . 1)) (ABORT . (simple_return_statement . 1)) (BEGIN . (simple_return_statement . 1)) (CASE . (simple_return_statement . 1)) (DECLARE . (simple_return_statement . 1)) (DELAY . (simple_return_statement . 1)) (EXIT . (simple_return_statement . 1)) (FOR . (simple_return_statement . 1)) (GOTO . (simple_return_statement . 1)) (IF . (simple_return_statement . 1)) (LOOP . (simple_return_statement . 1)) (NULL . (simple_return_statement . 1)) (PRAGMA . (simple_return_statement . 1)) (RAISE . (simple_return_statement . 1)) (REQUEUE . (simple_return_statement . 1)) (RETURN . (simple_return_statement . 1)) (SELECT . (simple_return_statement . 1)) (WHILE . (simple_return_statement . 1)) (ELSE . (simple_return_statement . 1)) (ELSIF . (simple_return_statement . 1)))
      ((default . error) (CONSTANT . (aliased_opt . 0)) (IDENTIFIER . (aliased_opt . 0)) (STRING_LITERAL . (aliased_opt . 0)) (CHARACTER_LITERAL . (aliased_opt . 0)) (ACCESS . (aliased_opt . 0)) (NOT . (aliased_opt . 0)) (ALIASED .  512))
      ((default . error) (ABORT .  950))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (SELECT .  948))
      ((default . error) (WHEN .  670) (TERMINATE .  669) (ACCEPT .  613) (DELAY .  618))
      ((default . error) (OR . (entry_call_alternative . 0)) (ELSE . (entry_call_alternative . 0)) (THEN . (triggering_alternative . 0)))
      ((default . error) (OR . (entry_call_alternative . 1)) (ELSE . (entry_call_alternative . 1)) (THEN . (triggering_alternative . 1)))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (DELAY .  618))
      ((default . error) (OR . (delay_alternative . 0)) (END . (delay_alternative . 0)) (ELSE . (delay_alternative . 0)) (THEN . (triggering_alternative . 2)))
      ((default . error) (END . (select_alternative . 1)) (OR . (select_alternative . 1)) (ELSE . (select_alternative . 1)))
      ((default . error) (EQUAL_GREATER .  943))
      ((default . error) (END . (select_alternative . 5)) (OR . (select_alternative . 5)) (ELSE . (select_alternative . 5)))
      ((default . error) (SEMICOLON .  942))
      ((default . error) (END .  941))
      ((default . error) (SEMICOLON .  940))
      ((default . error) (OTHERS .  936) (IDENTIFIER .  935) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (END . (exception_handler_list . 0)) (WHEN . (exception_handler_list . 0)))
      ((default . error) (END . (exception_handler_list_opt . 1)) (WHEN .  930))
      ((default . error) (END . (handled_sequence_of_statements . 0)))
      ((default . error) (WHEN . (exception_handler_list . 1)) (END . (exception_handler_list . 1)))
      ((default . error) (COLON .  1167) (EQUAL_GREATER . (name . 0)) (BAR . (name . 0)) (LEFT_PAREN . (name . 0)) (DOT . (name . 0)) (TICK . (name . 0)))
      ((default . error) (BAR . (exception_choice . 1)) (EQUAL_GREATER . (exception_choice . 1)))
      ((default . error) (EQUAL_GREATER . (exception_choice_list . 0)) (BAR . (exception_choice_list . 0)))
      ((default . error) (BAR .  1165) (EQUAL_GREATER .  1166))
      ((default . error) (DOT .  87) (BAR . (exception_choice . 0)) (EQUAL_GREATER . (exception_choice . 0)) (TICK .  88) (LEFT_PAREN .  106))
      ((default . error) (WHEN . (assignment_statement . 0)) (THEN . (assignment_statement . 0)) (OR . (assignment_statement . 0)) (ELSIF . (assignment_statement . 0)) (ELSE . (assignment_statement . 0)) (WHILE . (assignment_statement . 0)) (SELECT . (assignment_statement . 0)) (RETURN . (assignment_statement . 0)) (REQUEUE . (assignment_statement . 0)) (RAISE . (assignment_statement . 0)) (PRAGMA . (assignment_statement . 0)) (NULL . (assignment_statement . 0)) (LOOP . (assignment_statement . 0)) (IF . (assignment_statement . 0)) (GOTO . (assignment_statement . 0)) (FOR . (assignment_statement . 0)) (EXIT . (assignment_statement . 0)) (DELAY . (assignment_statement . 0)) (DECLARE . (assignment_statement . 0)) (CASE . (assignment_statement . 0)) (BEGIN . (assignment_statement . 0)) (ABORT . (assignment_statement . 0)) (ACCEPT . (assignment_statement . 0)) (CHARACTER_LITERAL . (assignment_statement . 0)) (STRING_LITERAL . (assignment_statement . 0)) (IDENTIFIER . (assignment_statement . 0)) (LESS_LESS . (assignment_statement . 0)) (END . (assignment_statement . 0)) (EXCEPTION . (assignment_statement . 0)))
      ((default . error) (LOOP .  1164))
      ((default . error) (TYPE . (subprogram_body . 0)) (TASK . (subprogram_body . 0)) (SUBTYPE . (subprogram_body . 0)) (PROTECTED . (subprogram_body . 0)) (FOR . (subprogram_body . 0)) (ENTRY . (subprogram_body . 0)) (IDENTIFIER . (subprogram_body . 0)) (BEGIN . (subprogram_body . 0)) (END . (subprogram_body . 0)) ($EOI . (subprogram_body . 0)) (FUNCTION . (subprogram_body . 0)) (GENERIC . (subprogram_body . 0)) (LIMITED . (subprogram_body . 0)) (NOT . (subprogram_body . 0)) (OVERRIDING . (subprogram_body . 0)) (PACKAGE . (subprogram_body . 0)) (PRAGMA . (subprogram_body . 0)) (PRIVATE . (subprogram_body . 0)) (PROCEDURE . (subprogram_body . 0)) (SEPARATE . (subprogram_body . 0)) (USE . (subprogram_body . 0)) (WITH . (subprogram_body . 0)))
      ((default . error) (TERMINATE .  1161) (ACCEPT .  613) (DELAY .  618))
      ((default . error) (END .  1160))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (OR . (sequence_of_statements_opt . 0)) (ELSE . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (END .  1158))
      ((default . error) (ELSE . (select_alternative_list . 1)) (END . (select_alternative_list . 1)) (OR . (select_alternative_list . 1)))
      ((default . error) (SEMICOLON .  1157))
      ((default . error) (END .  1156))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (IDENTIFIER . (constant_opt . 0)) (STRING_LITERAL . (constant_opt . 0)) (CHARACTER_LITERAL . (constant_opt . 0)) (ACCESS . (constant_opt . 0)) (NOT . (constant_opt . 0)) (CONSTANT .  726))
      ((default . error) (END .  1153))
      ((default . error) (SEMICOLON .  1152))
      ((default . error) (SEMICOLON .  1151))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (ELSE .  1145) (END .  1147) (ELSIF .  1146))
      ((default . error) (SEMICOLON .  1144))
      ((default . error) (WHEN . (delay_statement . 0)) (ELSIF . (delay_statement . 0)) (EXCEPTION . (delay_statement . 0)) (WHILE . (delay_statement . 0)) (SELECT . (delay_statement . 0)) (RETURN . (delay_statement . 0)) (REQUEUE . (delay_statement . 0)) (RAISE . (delay_statement . 0)) (PRAGMA . (delay_statement . 0)) (NULL . (delay_statement . 0)) (LOOP . (delay_statement . 0)) (IF . (delay_statement . 0)) (GOTO . (delay_statement . 0)) (FOR . (delay_statement . 0)) (EXIT . (delay_statement . 0)) (DELAY . (delay_statement . 0)) (DECLARE . (delay_statement . 0)) (CASE . (delay_statement . 0)) (BEGIN . (delay_statement . 0)) (ABORT . (delay_statement . 0)) (ACCEPT . (delay_statement . 0)) (CHARACTER_LITERAL . (delay_statement . 0)) (STRING_LITERAL . (delay_statement . 0)) (IDENTIFIER . (delay_statement . 0)) (LESS_LESS . (delay_statement . 0)) (END . (delay_statement . 0)) (OR . (delay_statement . 0)) (ELSE . (delay_statement . 0)) (THEN . (delay_statement . 0)))
      ((default . error) (END .  1143))
      ((default . error) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (OTHERS .  172) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  171) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (END . (case_statement_alternative_list . 0)) (WHEN . (case_statement_alternative_list . 0)))
      ((default . error) (END .  1140) (WHEN .  960))
      ((default . error) (SEMICOLON .  1139))
      ((default . error) (DO .  1138) (SEMICOLON .  1137))
      ((default . error) (BEGIN .  1136))
      ((default . error) (IDENTIFIER .  1135))
      ((default . error) (PROCEDURE . (protected_operation_item . 3)) (OVERRIDING . (protected_operation_item . 3)) (NOT . (protected_operation_item . 3)) (FUNCTION . (protected_operation_item . 3)) (FOR . (protected_operation_item . 3)) (ENTRY . (protected_operation_item . 3)) (END . (protected_operation_item . 3)))
      ((default . error) (PROCEDURE . (protected_operation_item . 2)) (OVERRIDING . (protected_operation_item . 2)) (NOT . (protected_operation_item . 2)) (FUNCTION . (protected_operation_item . 2)) (FOR . (protected_operation_item . 2)) (ENTRY . (protected_operation_item . 2)) (END . (protected_operation_item . 2)))
      ((default . error) (FUNCTION .  1) (PROCEDURE .  9))
      ((default . error) (END . (protected_operation_item_list . 0)) (ENTRY . (protected_operation_item_list . 0)) (FOR . (protected_operation_item_list . 0)) (FUNCTION . (protected_operation_item_list . 0)) (NOT . (protected_operation_item_list . 0)) (OVERRIDING . (protected_operation_item_list . 0)) (PROCEDURE . (protected_operation_item_list . 0)))
      ((default . error) (END . (protected_operation_item_list_opt . 1)) (ENTRY .  966) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (FOR .  289))
      ((default . error) (END .  1132))
      ((default . error) (PROCEDURE . (protected_operation_item . 1)) (OVERRIDING . (protected_operation_item . 1)) (NOT . (protected_operation_item . 1)) (FUNCTION . (protected_operation_item . 1)) (FOR . (protected_operation_item . 1)) (ENTRY . (protected_operation_item . 1)) (END . (protected_operation_item . 1)))
      ((default . error) (PROCEDURE . (protected_operation_item . 0)) (OVERRIDING . (protected_operation_item . 0)) (NOT . (protected_operation_item . 0)) (FUNCTION . (protected_operation_item . 0)) (FOR . (protected_operation_item . 0)) (ENTRY . (protected_operation_item . 0)) (END . (protected_operation_item . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (ELSIF . (elsif_expression_list . 1)) (ELSE . (elsif_expression_list . 1)) (RIGHT_PAREN . (elsif_expression_list . 1)))
      ((default . error) (THEN .  1130))
      ((default . error) (RIGHT_PAREN . (if_expression . 2)))
      ((default . error) (REVERSE .  1128) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (LOOP . (iterator_specification . 0)) (EQUAL_GREATER . (iterator_specification . 0)))
      ((default . error) (DOT .  87) (TICK .  88) (LOOP . (iterator_specification . 4)) (EQUAL_GREATER . (iterator_specification . 4)) (LEFT_PAREN .  106))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (RIGHT_PAREN . (case_expression_alternative_list . 1)) (COMMA . (case_expression_alternative_list . 1)))
      ((default . error) (SEMICOLON .  1126))
      ((default . error) (WITH . (parameter_profile_opt . 0)) (SEMICOLON . (parameter_profile_opt . 0)) (LEFT_PAREN .  782))
      ((default . error) (USE . (entry_declaration . 1)) (TYPE . (entry_declaration . 1)) (TASK . (entry_declaration . 1)) (SUBTYPE . (entry_declaration . 1)) (PROTECTED . (entry_declaration . 1)) (PROCEDURE . (entry_declaration . 1)) (PRAGMA . (entry_declaration . 1)) (PACKAGE . (entry_declaration . 1)) (OVERRIDING . (entry_declaration . 1)) (NOT . (entry_declaration . 1)) (GENERIC . (entry_declaration . 1)) (FUNCTION . (entry_declaration . 1)) (FOR . (entry_declaration . 1)) (ENTRY . (entry_declaration . 1)) (IDENTIFIER . (entry_declaration . 1)) (BEGIN . (entry_declaration . 1)) (END . (entry_declaration . 1)) (PRIVATE . (entry_declaration . 1)))
      ((default . error) (WITH . (paren_expression . 2)) (SEMICOLON . (paren_expression . 2)))
      ((default . error) (WITH . (paren_expression . 0)) (SEMICOLON . (paren_expression . 0)))
      ((default . error) (WITH . (paren_expression . 1)) (SEMICOLON . (paren_expression . 1)))
      ((default . error) (USE . (expression_function_declaration . 0)) (TYPE . (expression_function_declaration . 0)) (TASK . (expression_function_declaration . 0)) (SUBTYPE . (expression_function_declaration . 0)) (PROTECTED . (expression_function_declaration . 0)) (PROCEDURE . (expression_function_declaration . 0)) (PRAGMA . (expression_function_declaration . 0)) (PACKAGE . (expression_function_declaration . 0)) (OVERRIDING . (expression_function_declaration . 0)) (NOT . (expression_function_declaration . 0)) (GENERIC . (expression_function_declaration . 0)) (FUNCTION . (expression_function_declaration . 0)) (FOR . (expression_function_declaration . 0)) (ENTRY . (expression_function_declaration . 0)) (IDENTIFIER . (expression_function_declaration . 0)) (BEGIN . (expression_function_declaration . 0)) (END . (expression_function_declaration . 0)) (PRIVATE . (expression_function_declaration . 0)))
      ((default . error) (USE . (null_procedure_declaration . 0)) (TYPE . (null_procedure_declaration . 0)) (TASK . (null_procedure_declaration . 0)) (SUBTYPE . (null_procedure_declaration . 0)) (PROTECTED . (null_procedure_declaration . 0)) (PROCEDURE . (null_procedure_declaration . 0)) (PRAGMA . (null_procedure_declaration . 0)) (PACKAGE . (null_procedure_declaration . 0)) (OVERRIDING . (null_procedure_declaration . 0)) (NOT . (null_procedure_declaration . 0)) (GENERIC . (null_procedure_declaration . 0)) (FUNCTION . (null_procedure_declaration . 0)) (FOR . (null_procedure_declaration . 0)) (ENTRY . (null_procedure_declaration . 0)) (IDENTIFIER . (null_procedure_declaration . 0)) (BEGIN . (null_procedure_declaration . 0)) (END . (null_procedure_declaration . 0)) (PRIVATE . (null_procedure_declaration . 0)))
      ((default . error) (USE . (abstract_subprogram_declaration . 0)) (TYPE . (abstract_subprogram_declaration . 0)) (TASK . (abstract_subprogram_declaration . 0)) (SUBTYPE . (abstract_subprogram_declaration . 0)) (PROTECTED . (abstract_subprogram_declaration . 0)) (PROCEDURE . (abstract_subprogram_declaration . 0)) (PRAGMA . (abstract_subprogram_declaration . 0)) (PACKAGE . (abstract_subprogram_declaration . 0)) (OVERRIDING . (abstract_subprogram_declaration . 0)) (NOT . (abstract_subprogram_declaration . 0)) (GENERIC . (abstract_subprogram_declaration . 0)) (FUNCTION . (abstract_subprogram_declaration . 0)) (FOR . (abstract_subprogram_declaration . 0)) (ENTRY . (abstract_subprogram_declaration . 0)) (IDENTIFIER . (abstract_subprogram_declaration . 0)) (BEGIN . (abstract_subprogram_declaration . 0)) (END . (abstract_subprogram_declaration . 0)) (PRIVATE . (abstract_subprogram_declaration . 0)))
      ((default . error) (USE . (subprogram_body_stub . 0)) (TYPE . (subprogram_body_stub . 0)) (TASK . (subprogram_body_stub . 0)) (SUBTYPE . (subprogram_body_stub . 0)) (PROTECTED . (subprogram_body_stub . 0)) (PROCEDURE . (subprogram_body_stub . 0)) (PRAGMA . (subprogram_body_stub . 0)) (PACKAGE . (subprogram_body_stub . 0)) (OVERRIDING . (subprogram_body_stub . 0)) (NOT . (subprogram_body_stub . 0)) (GENERIC . (subprogram_body_stub . 0)) (FUNCTION . (subprogram_body_stub . 0)) (FOR . (subprogram_body_stub . 0)) (ENTRY . (subprogram_body_stub . 0)) (IDENTIFIER . (subprogram_body_stub . 0)) (BEGIN . (subprogram_body_stub . 0)) (END . (subprogram_body_stub . 0)) (PRIVATE . (subprogram_body_stub . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON .  1123))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON .  1121))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON .  1119))
      ((default . error) (ACCESS . (null_exclusion_opt . 1)) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (BEGIN . (declaration . 9)) (IDENTIFIER . (declaration . 9)) (ENTRY . (declaration . 9)) (FOR . (declaration . 9)) (FUNCTION . (declaration . 9)) (GENERIC . (declaration . 9)) (NOT . (declaration . 9)) (OVERRIDING . (declaration . 9)) (PACKAGE . (declaration . 9)) (PRAGMA . (declaration . 9)) (PROCEDURE . (declaration . 9)) (PROTECTED . (declaration . 9)) (SUBTYPE . (declaration . 9)) (TASK . (declaration . 9)) (TYPE . (declaration . 9)) (USE . (declaration . 9)) (PRIVATE . (declaration . 9)) (END . (declaration . 9)))
      ((default . error) (SEMICOLON .  1118))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (WITH . (record_type_definition . 0)) (SEMICOLON . (record_type_definition . 0)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (NOT .  736) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (BEGIN . (incomplete_type_declaration . 0)) (IDENTIFIER . (incomplete_type_declaration . 0)) (ENTRY . (incomplete_type_declaration . 0)) (FOR . (incomplete_type_declaration . 0)) (FUNCTION . (incomplete_type_declaration . 0)) (GENERIC . (incomplete_type_declaration . 0)) (NOT . (incomplete_type_declaration . 0)) (OVERRIDING . (incomplete_type_declaration . 0)) (PACKAGE . (incomplete_type_declaration . 0)) (PRAGMA . (incomplete_type_declaration . 0)) (PROCEDURE . (incomplete_type_declaration . 0)) (PROTECTED . (incomplete_type_declaration . 0)) (SUBTYPE . (incomplete_type_declaration . 0)) (TASK . (incomplete_type_declaration . 0)) (TYPE . (incomplete_type_declaration . 0)) (USE . (incomplete_type_declaration . 0)) (PRIVATE . (incomplete_type_declaration . 0)) (END . (incomplete_type_declaration . 0)))
      ((default . error) (IDENTIFIER .  1112) (STRING_LITERAL .  1113))
      ((default . error) (SEMICOLON .  1111))
      ((default . error) (WHEN . (component_item . 1)) (END . (component_item . 1)) (FOR . (component_item . 1)) (IDENTIFIER . (component_item . 1)) (CASE . (component_item . 1)))
      ((default . error) (WHEN . (component_item . 0)) (END . (component_item . 0)) (FOR . (component_item . 0)) (IDENTIFIER . (component_item . 0)) (CASE . (component_item . 0)))
      ((default . error) (WHEN . (component_list . 0)) (END . (component_list . 0)) (CASE . (component_list . 0)) (IDENTIFIER . (component_list . 0)) (FOR . (component_list . 0)))
      ((default . error) (END . (component_list_opt . 1)) (CASE .  1008) (IDENTIFIER .  72) (FOR .  289))
      ((default . error) (END .  1108))
      ((default . error) (COMMA .  95) (COLON .  1107))
      ((default . error) (WHEN . (component_list . 3)) (END . (component_list . 3)) (CASE . (component_list . 3)) (IDENTIFIER . (component_list . 3)) (FOR . (component_list . 3)))
      ((default . error) (DOT_DOT .  1106))
      ((default . error) (SEMICOLON . (record_definition . 1)) (WITH . (record_definition . 1)))
      ((default . error) (SEMICOLON . (type_definition . 2)) (WITH . (type_definition . 2)))
      ((default . error) (COMMA . (enumeration_literal . 0)) (RIGHT_PAREN . (enumeration_literal . 0)))
      ((default . error) (COMMA . (enumeration_literal . 1)) (RIGHT_PAREN . (enumeration_literal . 1)))
      ((default . error) (RIGHT_PAREN . (enumeration_literal_list . 0)) (COMMA . (enumeration_literal_list . 0)))
      ((default . error) (COMMA .  1104) (RIGHT_PAREN .  1105))
      ((default . error) (WITH . (real_range_specification_opt . 0)) (SEMICOLON . (real_range_specification_opt . 0)) (RANGE .  1101))
      ((default . error) (DIGITS .  1100) (WITH . (real_range_specification_opt . 0)) (SEMICOLON . (real_range_specification_opt . 0)) (RANGE .  1101))
      ((default . error) (NEW . ((abstract_limited_opt . 1) (abstract_limited_synchronized_opt . 1))))
      ((default . error) (BEGIN . (single_task_declaration . 1)) (IDENTIFIER . (single_task_declaration . 1)) (ENTRY . (single_task_declaration . 1)) (FOR . (single_task_declaration . 1)) (FUNCTION . (single_task_declaration . 1)) (GENERIC . (single_task_declaration . 1)) (NOT . (single_task_declaration . 1)) (OVERRIDING . (single_task_declaration . 1)) (PACKAGE . (single_task_declaration . 1)) (PRAGMA . (single_task_declaration . 1)) (PROCEDURE . (single_task_declaration . 1)) (PROTECTED . (single_task_declaration . 1)) (SUBTYPE . (single_task_declaration . 1)) (TASK . (single_task_declaration . 1)) (TYPE . (single_task_declaration . 1)) (USE . (single_task_declaration . 1)) (PRIVATE . (single_task_declaration . 1)) (END . (single_task_declaration . 1)))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (END . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (AND .  1061) (WITH .  1097))
      ((default . error) (SEMICOLON .  1096))
      ((default . error) (USE . (task_type_declaration . 2)) (TYPE . (task_type_declaration . 2)) (TASK . (task_type_declaration . 2)) (SUBTYPE . (task_type_declaration . 2)) (PROTECTED . (task_type_declaration . 2)) (PROCEDURE . (task_type_declaration . 2)) (PRAGMA . (task_type_declaration . 2)) (PACKAGE . (task_type_declaration . 2)) (OVERRIDING . (task_type_declaration . 2)) (NOT . (task_type_declaration . 2)) (GENERIC . (task_type_declaration . 2)) (FUNCTION . (task_type_declaration . 2)) (FOR . (task_type_declaration . 2)) (ENTRY . (task_type_declaration . 2)) (IDENTIFIER . (task_type_declaration . 2)) (BEGIN . (task_type_declaration . 2)) (END . (task_type_declaration . 2)) (PRIVATE . (task_type_declaration . 2)))
      ((default . error) (NEW .  1094) (END . (declarative_part_opt . 0)) (PRIVATE . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (DO . (subtype_indication . 1)) (LOOP . (subtype_indication . 1)) (COLON_EQUAL . (subtype_indication . 1)) (SEMICOLON . (subtype_indication . 1)) (OF . (subtype_indication . 1)) (AND . (subtype_indication . 1)) (WITH . (subtype_indication . 1)) (EQUAL_GREATER . (subtype_indication . 1)) (COMMA . (subtype_indication . 1)) (RIGHT_PAREN . (subtype_indication . 1)) (DOT .  87) (TICK .  88) (RANGE .  833) (LEFT_PAREN .  803))
      ((default . error) (LOOP . (constraint . 0)) (EQUAL_GREATER . (constraint . 0)) (DO . (constraint . 0)) (OF . (constraint . 0)) (AND . (constraint . 0)) (SEMICOLON . (constraint . 0)) (WITH . (constraint . 0)) (COLON_EQUAL . (constraint . 0)) (RIGHT_PAREN . (constraint . 0)) (COMMA . (constraint . 0)))
      ((default . error) (USE . (subtype_declaration . 0)) (TYPE . (subtype_declaration . 0)) (TASK . (subtype_declaration . 0)) (SUBTYPE . (subtype_declaration . 0)) (PROTECTED . (subtype_declaration . 0)) (PROCEDURE . (subtype_declaration . 0)) (PRAGMA . (subtype_declaration . 0)) (PACKAGE . (subtype_declaration . 0)) (OVERRIDING . (subtype_declaration . 0)) (NOT . (subtype_declaration . 0)) (GENERIC . (subtype_declaration . 0)) (FUNCTION . (subtype_declaration . 0)) (FOR . (subtype_declaration . 0)) (ENTRY . (subtype_declaration . 0)) (IDENTIFIER . (subtype_declaration . 0)) (BEGIN . (subtype_declaration . 0)) (END . (subtype_declaration . 0)) (PRIVATE . (subtype_declaration . 0)))
      ((default . error) (BEGIN . (single_protected_declaration . 1)) (IDENTIFIER . (single_protected_declaration . 1)) (ENTRY . (single_protected_declaration . 1)) (FOR . (single_protected_declaration . 1)) (FUNCTION . (single_protected_declaration . 1)) (GENERIC . (single_protected_declaration . 1)) (NOT . (single_protected_declaration . 1)) (OVERRIDING . (single_protected_declaration . 1)) (PACKAGE . (single_protected_declaration . 1)) (PRAGMA . (single_protected_declaration . 1)) (PROCEDURE . (single_protected_declaration . 1)) (PROTECTED . (single_protected_declaration . 1)) (SUBTYPE . (single_protected_declaration . 1)) (TASK . (single_protected_declaration . 1)) (TYPE . (single_protected_declaration . 1)) (USE . (single_protected_declaration . 1)) (PRIVATE . (single_protected_declaration . 1)) (END . (single_protected_declaration . 1)))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (END . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (AND .  1061) (WITH .  1090))
      ((default . error) (SEMICOLON .  1089))
      ((default . error) (NEW .  1087) (END . (declarative_part_opt . 0)) (PRIVATE . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (SEMICOLON .  1086))
      ((default . error) (WHEN . (at_clause . 0)) (BEGIN . (at_clause . 0)) (IDENTIFIER . (at_clause . 0)) (ENTRY . (at_clause . 0)) (FOR . (at_clause . 0)) (FUNCTION . (at_clause . 0)) (GENERIC . (at_clause . 0)) (NOT . (at_clause . 0)) (OVERRIDING . (at_clause . 0)) (PACKAGE . (at_clause . 0)) (PRAGMA . (at_clause . 0)) (PROCEDURE . (at_clause . 0)) (PROTECTED . (at_clause . 0)) (SUBTYPE . (at_clause . 0)) (TASK . (at_clause . 0)) (TYPE . (at_clause . 0)) (USE . (at_clause . 0)) (CASE . (at_clause . 0)) (PRIVATE . (at_clause . 0)) (END . (at_clause . 0)))
      ((default . error) (AT .  1085))
      ((default . error) (END . (component_clause_list . 0)) (IDENTIFIER . (component_clause_list . 0)))
      ((default . error) (END .  1083) (IDENTIFIER .  1045))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (DOT .  87) (TICK .  88) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108) (LEFT_PAREN .  106))
      ((default . error) (SEMICOLON .  1080))
      ((default . error) (SEMICOLON .  1079))
      ((default . error) (ALIASED .  1074) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (ACCESS . (null_exclusion_opt . 0)) (NOT .  862))
      ((default . error) (RIGHT_PAREN . (discrete_subtype_definition_list . 1)) (COMMA . (discrete_subtype_definition_list . 1)))
      ((default . error) (ALIASED .  1074) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (ACCESS . (null_exclusion_opt . 0)) (NOT .  862))
      ((default . error) (RIGHT_PAREN . (index_subtype_definition_list . 1)) (COMMA . (index_subtype_definition_list . 1)))
      ((default . error) (DOT .  87) (RANGE .  1073) (TICK .  88) (LEFT_PAREN .  106))
      ((default . error) (COMMA . (index_subtype_definition . 0)) (RIGHT_PAREN . (index_subtype_definition . 0)))
      ((default . error) (NULL .  1072) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (COMMA .  809) (RIGHT_PAREN .  1071))
      ((default . error) (COMMA . (discrete_subtype_definition . 1)) (BAR . (discrete_choice . 2)) (EQUAL_GREATER . (discrete_choice . 2)) (RIGHT_PAREN . ((discrete_subtype_definition . 1)  260)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (SEMICOLON . (formal_derived_type_definition . 1)) (WITH . (formal_derived_type_definition . 1)))
      ((default . error) (SEMICOLON . (formal_derived_type_definition . 2)) (AND .  1061) (WITH . ((formal_derived_type_definition . 2)  1069)))
      ((default . error) (WITH . (formal_package_actual_part . 0)) (SEMICOLON . (formal_package_actual_part . 0)))
      ((default . error) (PACKAGE . (formal_package_declaration . 0)) (PROCEDURE . (formal_package_declaration . 0)) (FUNCTION . (formal_package_declaration . 0)) (IDENTIFIER . (formal_package_declaration . 0)) (PRAGMA . (formal_package_declaration . 0)) (TYPE . (formal_package_declaration . 0)) (WITH . (formal_package_declaration . 0)))
      ((default . error) (PACKAGE . (formal_object_declaration . 0)) (PROCEDURE . (formal_object_declaration . 0)) (FUNCTION . (formal_object_declaration . 0)) (IDENTIFIER . (formal_object_declaration . 0)) (PRAGMA . (formal_object_declaration . 0)) (TYPE . (formal_object_declaration . 0)) (WITH . (formal_object_declaration . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (RIGHT_PAREN . (parameter_specification . 0)) (SEMICOLON . (parameter_specification . 0)))
      ((default . error) (PRIVATE .  1232))
      ((default . error) (DOT .  87) (TICK .  88) (WITH . (interface_list . 1)) (SEMICOLON . (interface_list . 1)) (AND . (interface_list . 1)) (LEFT_PAREN .  106))
      ((default . error) (LOOP . (index_constraint . 0)) (DO . (index_constraint . 0)) (EQUAL_GREATER . (index_constraint . 0)) (COMMA . (index_constraint . 0)) (RIGHT_PAREN . (index_constraint . 0)) (COLON_EQUAL . (index_constraint . 0)) (WITH . (index_constraint . 0)) (SEMICOLON . (index_constraint . 0)) (AND . (index_constraint . 0)) (OF . (index_constraint . 0)))
      ((default . error) (PLUS . (primary . 0)) (MINUS . (primary . 0)) (AMPERSAND . (primary . 0)) (DOT_DOT . (primary . 0)) (SLASH . (primary . 0)) (STAR . (primary . 0)) (MOD . (primary . 0)) (REM . (primary . 0)) (XOR . (primary . 0)) (OR . (primary . 0)) (AND . (primary . 0)) (EQUAL_GREATER . (primary . 0)) (BAR . (primary . 0)) (IN . (primary . 0)) (NOT . (primary . 0)) (EQUAL . (primary . 0)) (GREATER . (primary . 0)) (GREATER_EQUAL . (primary . 0)) (LESS . (primary . 0)) (LESS_EQUAL . (primary . 0)) (SLASH_EQUAL . (primary . 0)) (RIGHT_PAREN . (primary . 0)) (COMMA . (primary . 0)) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (BOX .  1057))
      ((default . error) (ACCESS . (null_exclusion_opt . 0)) (NOT .  862) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (WITH . (component_definition . 3)) (SEMICOLON . (component_definition . 3)) (COLON_EQUAL . (component_definition . 3)))
      ((default . error) (WITH . (array_type_definition . 0)) (SEMICOLON . (array_type_definition . 0)) (COLON_EQUAL . (array_type_definition . 0)))
      ((default . error) (WITH . (component_definition . 1)) (SEMICOLON . (component_definition . 1)) (COLON_EQUAL . (component_definition . 1)))
      ((default . error) (WITH . (array_type_definition . 1)) (SEMICOLON . (array_type_definition . 1)) (COLON_EQUAL . (array_type_definition . 1)))
      ((default . error) (END . (object_renaming_declaration . 2)) (PRIVATE . (object_renaming_declaration . 2)) (USE . (object_renaming_declaration . 2)) (TYPE . (object_renaming_declaration . 2)) (TASK . (object_renaming_declaration . 2)) (SUBTYPE . (object_renaming_declaration . 2)) (PROTECTED . (object_renaming_declaration . 2)) (PROCEDURE . (object_renaming_declaration . 2)) (PRAGMA . (object_renaming_declaration . 2)) (PACKAGE . (object_renaming_declaration . 2)) (OVERRIDING . (object_renaming_declaration . 2)) (NOT . (object_renaming_declaration . 2)) (GENERIC . (object_renaming_declaration . 2)) (FUNCTION . (object_renaming_declaration . 2)) (FOR . (object_renaming_declaration . 2)) (ENTRY . (object_renaming_declaration . 2)) (IDENTIFIER . (object_renaming_declaration . 2)) (BEGIN . (object_renaming_declaration . 2)))
      ((default . error) (END . (object_renaming_declaration . 1)) (PRIVATE . (object_renaming_declaration . 1)) (USE . (object_renaming_declaration . 1)) (TYPE . (object_renaming_declaration . 1)) (TASK . (object_renaming_declaration . 1)) (SUBTYPE . (object_renaming_declaration . 1)) (PROTECTED . (object_renaming_declaration . 1)) (PROCEDURE . (object_renaming_declaration . 1)) (PRAGMA . (object_renaming_declaration . 1)) (PACKAGE . (object_renaming_declaration . 1)) (OVERRIDING . (object_renaming_declaration . 1)) (NOT . (object_renaming_declaration . 1)) (GENERIC . (object_renaming_declaration . 1)) (FUNCTION . (object_renaming_declaration . 1)) (FOR . (object_renaming_declaration . 1)) (ENTRY . (object_renaming_declaration . 1)) (IDENTIFIER . (object_renaming_declaration . 1)) (BEGIN . (object_renaming_declaration . 1)))
      ((default . error) (SEMICOLON .  1228))
      ((default . error) (SEMICOLON .  1227))
      ((default . error) (RECORD .  1226))
      ((default . error) (IDENTIFIER . (component_clause_list . 1)) (END . (component_clause_list . 1)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PRIVATE . (package_body_stub . 0)) (END . (package_body_stub . 0)) (BEGIN . (package_body_stub . 0)) (IDENTIFIER . (package_body_stub . 0)) (ENTRY . (package_body_stub . 0)) (FOR . (package_body_stub . 0)) (FUNCTION . (package_body_stub . 0)) (GENERIC . (package_body_stub . 0)) (NOT . (package_body_stub . 0)) (OVERRIDING . (package_body_stub . 0)) (PACKAGE . (package_body_stub . 0)) (PRAGMA . (package_body_stub . 0)) (PROCEDURE . (package_body_stub . 0)) (PROTECTED . (package_body_stub . 0)) (SUBTYPE . (package_body_stub . 0)) (TASK . (package_body_stub . 0)) (TYPE . (package_body_stub . 0)) (USE . (package_body_stub . 0)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (SEMICOLON .  1223))
      ((default . error) (PRIVATE . (protected_body_stub . 0)) (END . (protected_body_stub . 0)) (BEGIN . (protected_body_stub . 0)) (IDENTIFIER . (protected_body_stub . 0)) (ENTRY . (protected_body_stub . 0)) (FOR . (protected_body_stub . 0)) (FUNCTION . (protected_body_stub . 0)) (GENERIC . (protected_body_stub . 0)) (NOT . (protected_body_stub . 0)) (OVERRIDING . (protected_body_stub . 0)) (PACKAGE . (protected_body_stub . 0)) (PRAGMA . (protected_body_stub . 0)) (PROCEDURE . (protected_body_stub . 0)) (PROTECTED . (protected_body_stub . 0)) (SUBTYPE . (protected_body_stub . 0)) (TASK . (protected_body_stub . 0)) (TYPE . (protected_body_stub . 0)) (USE . (protected_body_stub . 0)))
      ((default . error) (END . (declarative_part_opt . 0)) (PRIVATE . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (END .  1221))
      ((default . error) (SEMICOLON . (protected_definition . 1)))
      ((default . error) (LOOP . (subtype_indication . 0)) (DO . (subtype_indication . 0)) (RIGHT_PAREN . (subtype_indication . 0)) (COMMA . (subtype_indication . 0)) (EQUAL_GREATER . (subtype_indication . 0)) (WITH . (subtype_indication . 0)) (AND . (subtype_indication . 0)) (OF . (subtype_indication . 0)) (SEMICOLON . (subtype_indication . 0)) (COLON_EQUAL . (subtype_indication . 0)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (SEMICOLON .  1219))
      ((default . error) (PRIVATE . (task_body_stub . 0)) (END . (task_body_stub . 0)) (BEGIN . (task_body_stub . 0)) (IDENTIFIER . (task_body_stub . 0)) (ENTRY . (task_body_stub . 0)) (FOR . (task_body_stub . 0)) (FUNCTION . (task_body_stub . 0)) (GENERIC . (task_body_stub . 0)) (NOT . (task_body_stub . 0)) (OVERRIDING . (task_body_stub . 0)) (PACKAGE . (task_body_stub . 0)) (PRAGMA . (task_body_stub . 0)) (PROCEDURE . (task_body_stub . 0)) (PROTECTED . (task_body_stub . 0)) (SUBTYPE . (task_body_stub . 0)) (TASK . (task_body_stub . 0)) (TYPE . (task_body_stub . 0)) (USE . (task_body_stub . 0)))
      ((default . error) (END . (declarative_part_opt . 0)) (PRIVATE . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (END .  1217))
      ((default . error) (SEMICOLON . (task_definition . 1)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (WITH . (type_definition . 4)) (SEMICOLON . (type_definition . 4)))
      ((default . error) (WITH . (type_definition . 3)) (SEMICOLON . (type_definition . 3)))
      ((default . error) (IDENTIFIER .  1020) (CHARACTER_LITERAL .  1021))
      ((default . error) (SEMICOLON . (enumeration_type_definition . 0)) (WITH . (enumeration_type_definition . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (ALIASED .  1074) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (ACCESS . (null_exclusion_opt . 0)) (NOT .  862))
      ((default . error) (RECORD .  1211))
      ((default . error) (WHEN . (component_list . 1)) (FOR . (component_list . 1)) (IDENTIFIER . (component_list . 1)) (CASE . (component_list . 1)) (END . (component_list . 1)))
      ((default . error) (WHEN . (component_list . 2)) (FOR . (component_list . 2)) (IDENTIFIER . (component_list . 2)) (CASE . (component_list . 2)) (END . (component_list . 2)))
      ((default . error) (WHEN . (component_list . 4)) (FOR . (component_list . 4)) (IDENTIFIER . (component_list . 4)) (CASE . (component_list . 4)) (END . (component_list . 4)))
      ((default . error) (IS . (direct_name . 0)))
      ((default . error) (IS . (direct_name . 1)))
      ((default . error) (IS .  1210))
      ((default . error) (WITH . (and_interface_list_opt . 0)) (AND .  1205))
      ((default . error) (DOT .  87) (TICK .  88) (AND .  1205) (WITH . ((and_interface_list_opt . 0) (constraint_opt . 0))) (SEMICOLON . (constraint_opt . 0)) (RANGE .  833) (LEFT_PAREN .  803))
      ((default . error) (SEMICOLON .  1204))
      ((default . error) (END . (full_type_declaration . 0)) (PRIVATE . (full_type_declaration . 0)) (USE . (full_type_declaration . 0)) (TYPE . (full_type_declaration . 0)) (TASK . (full_type_declaration . 0)) (SUBTYPE . (full_type_declaration . 0)) (PROTECTED . (full_type_declaration . 0)) (PROCEDURE . (full_type_declaration . 0)) (PRAGMA . (full_type_declaration . 0)) (PACKAGE . (full_type_declaration . 0)) (OVERRIDING . (full_type_declaration . 0)) (NOT . (full_type_declaration . 0)) (GENERIC . (full_type_declaration . 0)) (FUNCTION . (full_type_declaration . 0)) (FOR . (full_type_declaration . 0)) (ENTRY . (full_type_declaration . 0)) (IDENTIFIER . (full_type_declaration . 0)) (BEGIN . (full_type_declaration . 0)))
      ((default . error) (PRIVATE . (object_declaration . 3)) (END . (object_declaration . 3)) (BEGIN . (object_declaration . 3)) (IDENTIFIER . (object_declaration . 3)) (ENTRY . (object_declaration . 3)) (FOR . (object_declaration . 3)) (FUNCTION . (object_declaration . 3)) (GENERIC . (object_declaration . 3)) (NOT . (object_declaration . 3)) (OVERRIDING . (object_declaration . 3)) (PACKAGE . (object_declaration . 3)) (PRAGMA . (object_declaration . 3)) (PROCEDURE . (object_declaration . 3)) (PROTECTED . (object_declaration . 3)) (SUBTYPE . (object_declaration . 3)) (TASK . (object_declaration . 3)) (TYPE . (object_declaration . 3)) (USE . (object_declaration . 3)))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (PRIVATE . (object_declaration . 5)) (END . (object_declaration . 5)) (BEGIN . (object_declaration . 5)) (IDENTIFIER . (object_declaration . 5)) (ENTRY . (object_declaration . 5)) (FOR . (object_declaration . 5)) (FUNCTION . (object_declaration . 5)) (GENERIC . (object_declaration . 5)) (NOT . (object_declaration . 5)) (OVERRIDING . (object_declaration . 5)) (PACKAGE . (object_declaration . 5)) (PRAGMA . (object_declaration . 5)) (PROCEDURE . (object_declaration . 5)) (PROTECTED . (object_declaration . 5)) (SUBTYPE . (object_declaration . 5)) (TASK . (object_declaration . 5)) (TYPE . (object_declaration . 5)) (USE . (object_declaration . 5)))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (PRIVATE . (object_declaration . 1)) (END . (object_declaration . 1)) (BEGIN . (object_declaration . 1)) (IDENTIFIER . (object_declaration . 1)) (ENTRY . (object_declaration . 1)) (FOR . (object_declaration . 1)) (FUNCTION . (object_declaration . 1)) (GENERIC . (object_declaration . 1)) (NOT . (object_declaration . 1)) (OVERRIDING . (object_declaration . 1)) (PACKAGE . (object_declaration . 1)) (PRAGMA . (object_declaration . 1)) (PROCEDURE . (object_declaration . 1)) (PROTECTED . (object_declaration . 1)) (SUBTYPE . (object_declaration . 1)) (TASK . (object_declaration . 1)) (TYPE . (object_declaration . 1)) (USE . (object_declaration . 1)))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (END . (package_body . 0)) (BEGIN . (package_body . 0)) (IDENTIFIER . (package_body . 0)) (ENTRY . (package_body . 0)) (FOR . (package_body . 0)) (PROTECTED . (package_body . 0)) (SUBTYPE . (package_body . 0)) (TASK . (package_body . 0)) (TYPE . (package_body . 0)) (WITH . (package_body . 0)) (USE . (package_body . 0)) (SEPARATE . (package_body . 0)) (PROCEDURE . (package_body . 0)) (PRIVATE . (package_body . 0)) (PRAGMA . (package_body . 0)) (PACKAGE . (package_body . 0)) (OVERRIDING . (package_body . 0)) (NOT . (package_body . 0)) (LIMITED . (package_body . 0)) (GENERIC . (package_body . 0)) (FUNCTION . (package_body . 0)) ($EOI . (package_body . 0)))
      ((default . error) (COMMA . (case_expression_alternative . 0)) (RIGHT_PAREN . (case_expression_alternative . 0)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (DOT .  87) (TICK .  88) (LOOP . (iterator_specification . 3)) (EQUAL_GREATER . (iterator_specification . 3)) (LEFT_PAREN .  106))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (RIGHT_PAREN . (if_expression . 0)))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (PROCEDURE . (protected_operation_item_list . 1)) (OVERRIDING . (protected_operation_item_list . 1)) (NOT . (protected_operation_item_list . 1)) (FUNCTION . (protected_operation_item_list . 1)) (FOR . (protected_operation_item_list . 1)) (ENTRY . (protected_operation_item_list . 1)) (END . (protected_operation_item_list . 1)))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (IS . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (WHEN . (parameter_profile_opt . 0)) (LEFT_PAREN .  1194))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (EXCEPTION . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (THEN . (accept_statement . 1)) (WHEN . (accept_statement . 1)) (EXCEPTION . (accept_statement . 1)) (ELSIF . (accept_statement . 1)) (ELSE . (accept_statement . 1)) (OR . (accept_statement . 1)) (END . (accept_statement . 1)) (LESS_LESS . (accept_statement . 1)) (IDENTIFIER . (accept_statement . 1)) (STRING_LITERAL . (accept_statement . 1)) (CHARACTER_LITERAL . (accept_statement . 1)) (ACCEPT . (accept_statement . 1)) (ABORT . (accept_statement . 1)) (BEGIN . (accept_statement . 1)) (CASE . (accept_statement . 1)) (DECLARE . (accept_statement . 1)) (DELAY . (accept_statement . 1)) (EXIT . (accept_statement . 1)) (FOR . (accept_statement . 1)) (GOTO . (accept_statement . 1)) (IF . (accept_statement . 1)) (LOOP . (accept_statement . 1)) (NULL . (accept_statement . 1)) (PRAGMA . (accept_statement . 1)) (RAISE . (accept_statement . 1)) (REQUEUE . (accept_statement . 1)) (RETURN . (accept_statement . 1)) (SELECT . (accept_statement . 1)) (WHILE . (accept_statement . 1)))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (EXCEPTION . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (OR . (block_statement . 1)) (THEN . (block_statement . 1)) (WHEN . (block_statement . 1)) (EXCEPTION . (block_statement . 1)) (END . (block_statement . 1)) (LESS_LESS . (block_statement . 1)) (IDENTIFIER . (block_statement . 1)) (STRING_LITERAL . (block_statement . 1)) (CHARACTER_LITERAL . (block_statement . 1)) (ACCEPT . (block_statement . 1)) (ABORT . (block_statement . 1)) (BEGIN . (block_statement . 1)) (CASE . (block_statement . 1)) (DECLARE . (block_statement . 1)) (DELAY . (block_statement . 1)) (EXIT . (block_statement . 1)) (FOR . (block_statement . 1)) (GOTO . (block_statement . 1)) (IF . (block_statement . 1)) (LOOP . (block_statement . 1)) (NULL . (block_statement . 1)) (PRAGMA . (block_statement . 1)) (RAISE . (block_statement . 1)) (REQUEUE . (block_statement . 1)) (RETURN . (block_statement . 1)) (SELECT . (block_statement . 1)) (WHILE . (block_statement . 1)) (ELSE . (block_statement . 1)) (ELSIF . (block_statement . 1)))
      ((default . error) (CASE .  1191))
      ((default . error) (WHEN . (case_statement_alternative_list . 1)) (END . (case_statement_alternative_list . 1)))
      ((default . error) (BAR .  275) (EQUAL_GREATER .  1190))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (OR . (exit_statement . 0)) (THEN . (exit_statement . 0)) (WHEN . (exit_statement . 0)) (EXCEPTION . (exit_statement . 0)) (END . (exit_statement . 0)) (LESS_LESS . (exit_statement . 0)) (IDENTIFIER . (exit_statement . 0)) (STRING_LITERAL . (exit_statement . 0)) (CHARACTER_LITERAL . (exit_statement . 0)) (ACCEPT . (exit_statement . 0)) (ABORT . (exit_statement . 0)) (BEGIN . (exit_statement . 0)) (CASE . (exit_statement . 0)) (DECLARE . (exit_statement . 0)) (DELAY . (exit_statement . 0)) (EXIT . (exit_statement . 0)) (FOR . (exit_statement . 0)) (GOTO . (exit_statement . 0)) (IF . (exit_statement . 0)) (LOOP . (exit_statement . 0)) (NULL . (exit_statement . 0)) (PRAGMA . (exit_statement . 0)) (RAISE . (exit_statement . 0)) (REQUEUE . (exit_statement . 0)) (RETURN . (exit_statement . 0)) (SELECT . (exit_statement . 0)) (WHILE . (exit_statement . 0)) (ELSE . (exit_statement . 0)) (ELSIF . (exit_statement . 0)))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (THEN . (expression_opt . 0)) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (IF .  1186))
      ((default . error) (END . (elsif_statement_list . 0)) (ELSE . (elsif_statement_list . 0)) (ELSIF . (elsif_statement_list . 0)))
      ((default . error) (END .  1184) (ELSE .  1183) (ELSIF .  1146))
      ((default . error) (SEMICOLON .  1182))
      ((default . error) (OR . (raise_statement . 1)) (THEN . (raise_statement . 1)) (WHEN . (raise_statement . 1)) (EXCEPTION . (raise_statement . 1)) (END . (raise_statement . 1)) (LESS_LESS . (raise_statement . 1)) (IDENTIFIER . (raise_statement . 1)) (STRING_LITERAL . (raise_statement . 1)) (CHARACTER_LITERAL . (raise_statement . 1)) (ACCEPT . (raise_statement . 1)) (ABORT . (raise_statement . 1)) (BEGIN . (raise_statement . 1)) (CASE . (raise_statement . 1)) (DECLARE . (raise_statement . 1)) (DELAY . (raise_statement . 1)) (EXIT . (raise_statement . 1)) (FOR . (raise_statement . 1)) (GOTO . (raise_statement . 1)) (IF . (raise_statement . 1)) (LOOP . (raise_statement . 1)) (NULL . (raise_statement . 1)) (PRAGMA . (raise_statement . 1)) (RAISE . (raise_statement . 1)) (REQUEUE . (raise_statement . 1)) (RETURN . (raise_statement . 1)) (SELECT . (raise_statement . 1)) (WHILE . (raise_statement . 1)) (ELSE . (raise_statement . 1)) (ELSIF . (raise_statement . 1)))
      ((default . error) (OR . (requeue_statement . 0)) (THEN . (requeue_statement . 0)) (WHEN . (requeue_statement . 0)) (EXCEPTION . (requeue_statement . 0)) (END . (requeue_statement . 0)) (LESS_LESS . (requeue_statement . 0)) (IDENTIFIER . (requeue_statement . 0)) (STRING_LITERAL . (requeue_statement . 0)) (CHARACTER_LITERAL . (requeue_statement . 0)) (ACCEPT . (requeue_statement . 0)) (ABORT . (requeue_statement . 0)) (BEGIN . (requeue_statement . 0)) (CASE . (requeue_statement . 0)) (DECLARE . (requeue_statement . 0)) (DELAY . (requeue_statement . 0)) (EXIT . (requeue_statement . 0)) (FOR . (requeue_statement . 0)) (GOTO . (requeue_statement . 0)) (IF . (requeue_statement . 0)) (LOOP . (requeue_statement . 0)) (NULL . (requeue_statement . 0)) (PRAGMA . (requeue_statement . 0)) (RAISE . (requeue_statement . 0)) (REQUEUE . (requeue_statement . 0)) (RETURN . (requeue_statement . 0)) (SELECT . (requeue_statement . 0)) (WHILE . (requeue_statement . 0)) (ELSE . (requeue_statement . 0)) (ELSIF . (requeue_statement . 0)))
      ((default . error) (RETURN .  1181))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (ACCESS . (null_exclusion_opt . 0)) (NOT .  862))
      ((default . error) (END .  1177))
      ((default . error) (SELECT .  1176))
      ((default . error) (OR . (selective_accept . 1)) (THEN . (selective_accept . 1)) (WHEN . (selective_accept . 1)) (EXCEPTION . (selective_accept . 1)) (END . (selective_accept . 1)) (LESS_LESS . (selective_accept . 1)) (IDENTIFIER . (selective_accept . 1)) (STRING_LITERAL . (selective_accept . 1)) (CHARACTER_LITERAL . (selective_accept . 1)) (ACCEPT . (selective_accept . 1)) (ABORT . (selective_accept . 1)) (BEGIN . (selective_accept . 1)) (CASE . (selective_accept . 1)) (DECLARE . (selective_accept . 1)) (DELAY . (selective_accept . 1)) (EXIT . (selective_accept . 1)) (FOR . (selective_accept . 1)) (GOTO . (selective_accept . 1)) (IF . (selective_accept . 1)) (LOOP . (selective_accept . 1)) (NULL . (selective_accept . 1)) (PRAGMA . (selective_accept . 1)) (RAISE . (selective_accept . 1)) (REQUEUE . (selective_accept . 1)) (RETURN . (selective_accept . 1)) (SELECT . (selective_accept . 1)) (WHILE . (selective_accept . 1)) (ELSE . (selective_accept . 1)) (ELSIF . (selective_accept . 1)))
      ((default . error) (SELECT .  1175))
      ((default . error) (END . (delay_alternative . 0)) (OR . (delay_alternative . 0)) (ELSE . (delay_alternative . 0)))
      ((default . error) (SELECT .  1174))
      ((default . error) (SEMICOLON .  1173))
      ((default . error) (ELSE . (sequence_of_statements_opt . 0)) (OR . (sequence_of_statements_opt . 0)) (END . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (END . (select_alternative . 2)) (OR . (select_alternative . 2)) (ELSE . (select_alternative . 2)))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (OTHERS .  936) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (WHEN . (sequence_of_statements_opt . 0)) (END . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (OTHERS .  936) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (BAR .  1165) (EQUAL_GREATER .  1274))
      ((default . error) (WHEN . (exception_handler . 1)) (END . (exception_handler . 1)))
      ((default . error) (EQUAL_GREATER . (exception_choice_list . 1)) (BAR . (exception_choice_list . 1)))
      ((default . error) (SEMICOLON .  1273))
      ((default . error) (ELSE . (select_alternative . 0)) (OR . (select_alternative . 0)) (END . (select_alternative . 0)))
      ((default . error) (ELSE . (select_alternative . 4)) (OR . (select_alternative . 4)) (END . (select_alternative . 4)))
      ((default . error) (SEMICOLON .  1272))
      ((default . error) (SEMICOLON .  1271))
      ((default . error) (SEMICOLON .  1270))
      ((default . error) (SELECT .  1269))
      ((default . error) (DO . (return_subtype_indication . 1)) (SEMICOLON . (return_subtype_indication . 1)) (COLON_EQUAL . (return_subtype_indication . 1)))
      ((default . error) (DO . (extended_return_object_declaration . 1)) (SEMICOLON . (extended_return_object_declaration . 1)) (COLON_EQUAL .  1268))
      ((default . error) (DO . (return_subtype_indication . 0)) (SEMICOLON . (return_subtype_indication . 0)) (COLON_EQUAL . (return_subtype_indication . 0)))
      ((default . error) (SEMICOLON .  1267))
      ((default . error) (WHEN . (loop_statement . 1)) (THEN . (loop_statement . 1)) (OR . (loop_statement . 1)) (ELSIF . (loop_statement . 1)) (ELSE . (loop_statement . 1)) (WHILE . (loop_statement . 1)) (SELECT . (loop_statement . 1)) (RETURN . (loop_statement . 1)) (REQUEUE . (loop_statement . 1)) (RAISE . (loop_statement . 1)) (PRAGMA . (loop_statement . 1)) (NULL . (loop_statement . 1)) (LOOP . (loop_statement . 1)) (IF . (loop_statement . 1)) (GOTO . (loop_statement . 1)) (FOR . (loop_statement . 1)) (EXIT . (loop_statement . 1)) (DELAY . (loop_statement . 1)) (DECLARE . (loop_statement . 1)) (CASE . (loop_statement . 1)) (BEGIN . (loop_statement . 1)) (ABORT . (loop_statement . 1)) (ACCEPT . (loop_statement . 1)) (CHARACTER_LITERAL . (loop_statement . 1)) (STRING_LITERAL . (loop_statement . 1)) (IDENTIFIER . (loop_statement . 1)) (LESS_LESS . (loop_statement . 1)) (END . (loop_statement . 1)) (EXCEPTION . (loop_statement . 1)))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (IF .  1265))
      ((default . error) (ELSIF . (elsif_statement_list . 1)) (ELSE . (elsif_statement_list . 1)) (END . (elsif_statement_list . 1)))
      ((default . error) (SEMICOLON .  1264))
      ((default . error) (THEN .  1263))
      ((default . error) (END .  1262))
      ((default . error) (SEMICOLON .  1261))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (WHEN . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (SEMICOLON .  1259))
      ((default . error) (END .  1258))
      ((default . error) (END .  1257))
      ((default . error) (FOR .  1256) (IDENTIFIER .  72))
      ((default . error) (WHEN .  1255))
      ((default . error) (WHEN . (entry_body_formal_part . 1)))
      ((default . error) (SEMICOLON .  1254))
      ((default . error) (ELSE . (elsif_expression_item . 0)) (ELSIF . (elsif_expression_item . 0)) (RIGHT_PAREN . (elsif_expression_item . 0)))
      ((default . error) (DOT .  87) (TICK .  88) (LOOP . (iterator_specification . 2)) (EQUAL_GREATER . (iterator_specification . 2)) (LEFT_PAREN .  106))
      ((default . error) (SEMICOLON .  1253))
      ((default . error) (SEMICOLON .  1252))
      ((default . error) (SEMICOLON .  1251))
      ((default . error) (SEMICOLON .  1250))
      ((default . error) (BEGIN . (private_type_declaration . 0)) (IDENTIFIER . (private_type_declaration . 0)) (ENTRY . (private_type_declaration . 0)) (FOR . (private_type_declaration . 0)) (FUNCTION . (private_type_declaration . 0)) (GENERIC . (private_type_declaration . 0)) (NOT . (private_type_declaration . 0)) (OVERRIDING . (private_type_declaration . 0)) (PACKAGE . (private_type_declaration . 0)) (PRAGMA . (private_type_declaration . 0)) (PROCEDURE . (private_type_declaration . 0)) (PROTECTED . (private_type_declaration . 0)) (SUBTYPE . (private_type_declaration . 0)) (TASK . (private_type_declaration . 0)) (TYPE . (private_type_declaration . 0)) (USE . (private_type_declaration . 0)) (PRIVATE . (private_type_declaration . 0)) (END . (private_type_declaration . 0)))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49))
      ((default . error) (WITH .  1248))
      ((default . error) (WITH . (constraint_opt . 1)) (SEMICOLON . (constraint_opt . 1)))
      ((default . error) (WITH . (derived_type_definition . 1)) (SEMICOLON . (derived_type_definition . 1)))
      ((default . error) (WITH .  1247))
      ((default . error) (WHEN .  1244))
      ((default . error) (SEMICOLON . (record_definition . 0)) (WITH . (record_definition . 0)))
      ((default . error) (COLON_EQUAL .  1242) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (SEMICOLON . (type_definition . 1)) (WITH . (type_definition . 1)))
      ((default . error) (RIGHT_PAREN . (enumeration_literal_list . 1)) (COMMA . (enumeration_literal_list . 1)))
      ((default . error) (DOT_DOT .  1241))
      ((default . error) (WITH . (real_range_specification_opt . 0)) (SEMICOLON . (real_range_specification_opt . 0)) (RANGE .  1101))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (SEMICOLON .  1238))
      ((default . error) (USE . (task_type_declaration . 1)) (TYPE . (task_type_declaration . 1)) (TASK . (task_type_declaration . 1)) (SUBTYPE . (task_type_declaration . 1)) (PROTECTED . (task_type_declaration . 1)) (PROCEDURE . (task_type_declaration . 1)) (PRAGMA . (task_type_declaration . 1)) (PACKAGE . (task_type_declaration . 1)) (OVERRIDING . (task_type_declaration . 1)) (NOT . (task_type_declaration . 1)) (GENERIC . (task_type_declaration . 1)) (FUNCTION . (task_type_declaration . 1)) (FOR . (task_type_declaration . 1)) (ENTRY . (task_type_declaration . 1)) (IDENTIFIER . (task_type_declaration . 1)) (BEGIN . (task_type_declaration . 1)) (END . (task_type_declaration . 1)) (PRIVATE . (task_type_declaration . 1)))
      ((default . error) (AND .  1061) (WITH .  1237))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (SEMICOLON .  1235))
      ((default . error) (USE . (protected_type_declaration . 1)) (TYPE . (protected_type_declaration . 1)) (TASK . (protected_type_declaration . 1)) (SUBTYPE . (protected_type_declaration . 1)) (PROTECTED . (protected_type_declaration . 1)) (PROCEDURE . (protected_type_declaration . 1)) (PRAGMA . (protected_type_declaration . 1)) (PACKAGE . (protected_type_declaration . 1)) (OVERRIDING . (protected_type_declaration . 1)) (NOT . (protected_type_declaration . 1)) (GENERIC . (protected_type_declaration . 1)) (FUNCTION . (protected_type_declaration . 1)) (FOR . (protected_type_declaration . 1)) (ENTRY . (protected_type_declaration . 1)) (IDENTIFIER . (protected_type_declaration . 1)) (BEGIN . (protected_type_declaration . 1)) (END . (protected_type_declaration . 1)) (PRIVATE . (protected_type_declaration . 1)))
      ((default . error) (AND .  1061) (WITH .  1234))
      ((default . error) (RANGE .  1233))
      ((default . error) (SEMICOLON . (record_rep . 0)))
      ((default . error) (IDENTIFIER . (mod_clause_opt . 1)))
      ((default . error) (BEGIN . (object_renaming_declaration . 0)) (IDENTIFIER . (object_renaming_declaration . 0)) (ENTRY . (object_renaming_declaration . 0)) (FOR . (object_renaming_declaration . 0)) (FUNCTION . (object_renaming_declaration . 0)) (GENERIC . (object_renaming_declaration . 0)) (NOT . (object_renaming_declaration . 0)) (OVERRIDING . (object_renaming_declaration . 0)) (PACKAGE . (object_renaming_declaration . 0)) (PRAGMA . (object_renaming_declaration . 0)) (PROCEDURE . (object_renaming_declaration . 0)) (PROTECTED . (object_renaming_declaration . 0)) (SUBTYPE . (object_renaming_declaration . 0)) (TASK . (object_renaming_declaration . 0)) (TYPE . (object_renaming_declaration . 0)) (USE . (object_renaming_declaration . 0)) (PRIVATE . (object_renaming_declaration . 0)) (END . (object_renaming_declaration . 0)))
      ((default . error) (COLON_EQUAL . (component_definition . 2)) (SEMICOLON . (component_definition . 2)) (WITH . (component_definition . 2)))
      ((default . error) (COLON_EQUAL . (component_definition . 0)) (SEMICOLON . (component_definition . 0)) (WITH . (component_definition . 0)))
      ((default . error) (RIGHT_PAREN . (subtype_indication . 1)) (COMMA . (subtype_indication . 1)) (DOT .  87) (TICK .  88) (BAR . (discrete_choice . 1)) (EQUAL_GREATER . (discrete_choice . 1)) (RANGE .  833) (LEFT_PAREN .  803))
      ((default . error) (SEMICOLON . (formal_derived_type_definition . 0)) (WITH . (formal_derived_type_definition . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (END . (declarative_part_opt . 0)) (PRIVATE . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (END . (single_protected_declaration . 0)) (PRIVATE . (single_protected_declaration . 0)) (USE . (single_protected_declaration . 0)) (TYPE . (single_protected_declaration . 0)) (TASK . (single_protected_declaration . 0)) (SUBTYPE . (single_protected_declaration . 0)) (PROTECTED . (single_protected_declaration . 0)) (PROCEDURE . (single_protected_declaration . 0)) (PRAGMA . (single_protected_declaration . 0)) (PACKAGE . (single_protected_declaration . 0)) (OVERRIDING . (single_protected_declaration . 0)) (NOT . (single_protected_declaration . 0)) (GENERIC . (single_protected_declaration . 0)) (FUNCTION . (single_protected_declaration . 0)) (FOR . (single_protected_declaration . 0)) (ENTRY . (single_protected_declaration . 0)) (IDENTIFIER . (single_protected_declaration . 0)) (BEGIN . (single_protected_declaration . 0)))
      ((default . error) (SEMICOLON . (protected_definition . 0)))
      ((default . error) (END . (declarative_part_opt . 0)) (PRIVATE . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (END . (single_task_declaration . 0)) (PRIVATE . (single_task_declaration . 0)) (USE . (single_task_declaration . 0)) (TYPE . (single_task_declaration . 0)) (TASK . (single_task_declaration . 0)) (SUBTYPE . (single_task_declaration . 0)) (PROTECTED . (single_task_declaration . 0)) (PROCEDURE . (single_task_declaration . 0)) (PRAGMA . (single_task_declaration . 0)) (PACKAGE . (single_task_declaration . 0)) (OVERRIDING . (single_task_declaration . 0)) (NOT . (single_task_declaration . 0)) (GENERIC . (single_task_declaration . 0)) (FUNCTION . (single_task_declaration . 0)) (FOR . (single_task_declaration . 0)) (ENTRY . (single_task_declaration . 0)) (IDENTIFIER . (single_task_declaration . 0)) (BEGIN . (single_task_declaration . 0)))
      ((default . error) (SEMICOLON . (task_definition . 0)))
      ((default . error) (WITH . (type_definition . 5)) (SEMICOLON . (type_definition . 5)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON .  1291))
      ((default . error) (EQUAL_GREATER . (discrete_choice_list . 0)) (BAR . (discrete_choice_list . 0)) (OTHERS .  172) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  171) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (END .  1288) (WHEN .  1244))
      ((default . error) (END . (variant_list . 0)) (WHEN . (variant_list . 0)))
      ((default . error) (PRIVATE .  1287))
      ((default . error) (RECORD .  848) (NULL .  846))
      ((default . error) (AND .  1061) (WITH . (and_interface_list_opt . 1)))
      ((default . error) (PRIVATE . (object_declaration . 2)) (END . (object_declaration . 2)) (BEGIN . (object_declaration . 2)) (IDENTIFIER . (object_declaration . 2)) (ENTRY . (object_declaration . 2)) (FOR . (object_declaration . 2)) (FUNCTION . (object_declaration . 2)) (GENERIC . (object_declaration . 2)) (NOT . (object_declaration . 2)) (OVERRIDING . (object_declaration . 2)) (PACKAGE . (object_declaration . 2)) (PRAGMA . (object_declaration . 2)) (PROCEDURE . (object_declaration . 2)) (PROTECTED . (object_declaration . 2)) (SUBTYPE . (object_declaration . 2)) (TASK . (object_declaration . 2)) (TYPE . (object_declaration . 2)) (USE . (object_declaration . 2)))
      ((default . error) (PRIVATE . (object_declaration . 4)) (END . (object_declaration . 4)) (BEGIN . (object_declaration . 4)) (IDENTIFIER . (object_declaration . 4)) (ENTRY . (object_declaration . 4)) (FOR . (object_declaration . 4)) (FUNCTION . (object_declaration . 4)) (GENERIC . (object_declaration . 4)) (NOT . (object_declaration . 4)) (OVERRIDING . (object_declaration . 4)) (PACKAGE . (object_declaration . 4)) (PRAGMA . (object_declaration . 4)) (PROCEDURE . (object_declaration . 4)) (PROTECTED . (object_declaration . 4)) (SUBTYPE . (object_declaration . 4)) (TASK . (object_declaration . 4)) (TYPE . (object_declaration . 4)) (USE . (object_declaration . 4)))
      ((default . error) (PRIVATE . (object_declaration . 0)) (END . (object_declaration . 0)) (BEGIN . (object_declaration . 0)) (IDENTIFIER . (object_declaration . 0)) (ENTRY . (object_declaration . 0)) (FOR . (object_declaration . 0)) (FUNCTION . (object_declaration . 0)) (GENERIC . (object_declaration . 0)) (NOT . (object_declaration . 0)) (OVERRIDING . (object_declaration . 0)) (PACKAGE . (object_declaration . 0)) (PRAGMA . (object_declaration . 0)) (PROCEDURE . (object_declaration . 0)) (PROTECTED . (object_declaration . 0)) (SUBTYPE . (object_declaration . 0)) (TASK . (object_declaration . 0)) (TYPE . (object_declaration . 0)) (USE . (object_declaration . 0)))
      ((default . error) (PRIVATE . (entry_declaration . 0)) (END . (entry_declaration . 0)) (BEGIN . (entry_declaration . 0)) (IDENTIFIER . (entry_declaration . 0)) (ENTRY . (entry_declaration . 0)) (FOR . (entry_declaration . 0)) (FUNCTION . (entry_declaration . 0)) (GENERIC . (entry_declaration . 0)) (NOT . (entry_declaration . 0)) (OVERRIDING . (entry_declaration . 0)) (PACKAGE . (entry_declaration . 0)) (PRAGMA . (entry_declaration . 0)) (PROCEDURE . (entry_declaration . 0)) (PROTECTED . (entry_declaration . 0)) (SUBTYPE . (entry_declaration . 0)) (TASK . (entry_declaration . 0)) (TYPE . (entry_declaration . 0)) (USE . (entry_declaration . 0)))
      ((default . error) (PRIVATE . (protected_body . 0)) (END . (protected_body . 0)) (BEGIN . (protected_body . 0)) (IDENTIFIER . (protected_body . 0)) (ENTRY . (protected_body . 0)) (FOR . (protected_body . 0)) (FUNCTION . (protected_body . 0)) (GENERIC . (protected_body . 0)) (NOT . (protected_body . 0)) (OVERRIDING . (protected_body . 0)) (PACKAGE . (protected_body . 0)) (PRAGMA . (protected_body . 0)) (PROCEDURE . (protected_body . 0)) (PROTECTED . (protected_body . 0)) (SUBTYPE . (protected_body . 0)) (TASK . (protected_body . 0)) (TYPE . (protected_body . 0)) (USE . (protected_body . 0)) ($EOI . (protected_body . 0)) (LIMITED . (protected_body . 0)) (SEPARATE . (protected_body . 0)) (WITH . (protected_body . 0)))
      ((default . error) (IS . (expression_opt . 0)) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (IDENTIFIER .  1284))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (OR . (case_statement . 0)) (THEN . (case_statement . 0)) (WHEN . (case_statement . 0)) (EXCEPTION . (case_statement . 0)) (END . (case_statement . 0)) (LESS_LESS . (case_statement . 0)) (IDENTIFIER . (case_statement . 0)) (STRING_LITERAL . (case_statement . 0)) (CHARACTER_LITERAL . (case_statement . 0)) (ACCEPT . (case_statement . 0)) (ABORT . (case_statement . 0)) (BEGIN . (case_statement . 0)) (CASE . (case_statement . 0)) (DECLARE . (case_statement . 0)) (DELAY . (case_statement . 0)) (EXIT . (case_statement . 0)) (FOR . (case_statement . 0)) (GOTO . (case_statement . 0)) (IF . (case_statement . 0)) (LOOP . (case_statement . 0)) (NULL . (case_statement . 0)) (PRAGMA . (case_statement . 0)) (RAISE . (case_statement . 0)) (REQUEUE . (case_statement . 0)) (RETURN . (case_statement . 0)) (SELECT . (case_statement . 0)) (WHILE . (case_statement . 0)) (ELSE . (case_statement . 0)) (ELSIF . (case_statement . 0)))
      ((default . error) (END . (case_statement_alternative . 0)) (WHEN . (case_statement_alternative . 0)))
      ((default . error) (OR . (block_statement . 0)) (THEN . (block_statement . 0)) (WHEN . (block_statement . 0)) (EXCEPTION . (block_statement . 0)) (END . (block_statement . 0)) (LESS_LESS . (block_statement . 0)) (IDENTIFIER . (block_statement . 0)) (STRING_LITERAL . (block_statement . 0)) (CHARACTER_LITERAL . (block_statement . 0)) (ACCEPT . (block_statement . 0)) (ABORT . (block_statement . 0)) (BEGIN . (block_statement . 0)) (CASE . (block_statement . 0)) (DECLARE . (block_statement . 0)) (DELAY . (block_statement . 0)) (EXIT . (block_statement . 0)) (FOR . (block_statement . 0)) (GOTO . (block_statement . 0)) (IF . (block_statement . 0)) (LOOP . (block_statement . 0)) (NULL . (block_statement . 0)) (PRAGMA . (block_statement . 0)) (RAISE . (block_statement . 0)) (REQUEUE . (block_statement . 0)) (RETURN . (block_statement . 0)) (SELECT . (block_statement . 0)) (WHILE . (block_statement . 0)) (ELSE . (block_statement . 0)) (ELSIF . (block_statement . 0)))
      ((default . error) (IF .  1281))
      ((default . error) (ELSE . (sequence_of_statements_opt . 0)) (ELSIF . (sequence_of_statements_opt . 0)) (END . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (OR . (if_statement . 3)) (THEN . (if_statement . 3)) (WHEN . (if_statement . 3)) (EXCEPTION . (if_statement . 3)) (END . (if_statement . 3)) (LESS_LESS . (if_statement . 3)) (IDENTIFIER . (if_statement . 3)) (STRING_LITERAL . (if_statement . 3)) (CHARACTER_LITERAL . (if_statement . 3)) (ACCEPT . (if_statement . 3)) (ABORT . (if_statement . 3)) (BEGIN . (if_statement . 3)) (CASE . (if_statement . 3)) (DECLARE . (if_statement . 3)) (DELAY . (if_statement . 3)) (EXIT . (if_statement . 3)) (FOR . (if_statement . 3)) (GOTO . (if_statement . 3)) (IF . (if_statement . 3)) (LOOP . (if_statement . 3)) (NULL . (if_statement . 3)) (PRAGMA . (if_statement . 3)) (RAISE . (if_statement . 3)) (REQUEUE . (if_statement . 3)) (RETURN . (if_statement . 3)) (SELECT . (if_statement . 3)) (WHILE . (if_statement . 3)) (ELSE . (if_statement . 3)) (ELSIF . (if_statement . 3)))
      ((default . error) (SEMICOLON .  1279))
      ((default . error) (END .  1278))
      ((default . error) (OR . (extended_return_statement . 0)) (THEN . (extended_return_statement . 0)) (WHEN . (extended_return_statement . 0)) (EXCEPTION . (extended_return_statement . 0)) (END . (extended_return_statement . 0)) (LESS_LESS . (extended_return_statement . 0)) (IDENTIFIER . (extended_return_statement . 0)) (STRING_LITERAL . (extended_return_statement . 0)) (CHARACTER_LITERAL . (extended_return_statement . 0)) (ACCEPT . (extended_return_statement . 0)) (ABORT . (extended_return_statement . 0)) (BEGIN . (extended_return_statement . 0)) (CASE . (extended_return_statement . 0)) (DECLARE . (extended_return_statement . 0)) (DELAY . (extended_return_statement . 0)) (EXIT . (extended_return_statement . 0)) (FOR . (extended_return_statement . 0)) (GOTO . (extended_return_statement . 0)) (IF . (extended_return_statement . 0)) (LOOP . (extended_return_statement . 0)) (NULL . (extended_return_statement . 0)) (PRAGMA . (extended_return_statement . 0)) (RAISE . (extended_return_statement . 0)) (REQUEUE . (extended_return_statement . 0)) (RETURN . (extended_return_statement . 0)) (SELECT . (extended_return_statement . 0)) (WHILE . (extended_return_statement . 0)) (ELSE . (extended_return_statement . 0)) (ELSIF . (extended_return_statement . 0)))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (SEMICOLON .  1276))
      ((default . error) (OR . (selective_accept . 0)) (THEN . (selective_accept . 0)) (WHEN . (selective_accept . 0)) (EXCEPTION . (selective_accept . 0)) (END . (selective_accept . 0)) (LESS_LESS . (selective_accept . 0)) (IDENTIFIER . (selective_accept . 0)) (STRING_LITERAL . (selective_accept . 0)) (CHARACTER_LITERAL . (selective_accept . 0)) (ACCEPT . (selective_accept . 0)) (ABORT . (selective_accept . 0)) (BEGIN . (selective_accept . 0)) (CASE . (selective_accept . 0)) (DECLARE . (selective_accept . 0)) (DELAY . (selective_accept . 0)) (EXIT . (selective_accept . 0)) (FOR . (selective_accept . 0)) (GOTO . (selective_accept . 0)) (IF . (selective_accept . 0)) (LOOP . (selective_accept . 0)) (NULL . (selective_accept . 0)) (PRAGMA . (selective_accept . 0)) (RAISE . (selective_accept . 0)) (REQUEUE . (selective_accept . 0)) (RETURN . (selective_accept . 0)) (SELECT . (selective_accept . 0)) (WHILE . (selective_accept . 0)) (ELSE . (selective_accept . 0)) (ELSIF . (selective_accept . 0)))
      ((default . error) (OR . (conditional_entry_call . 0)) (THEN . (conditional_entry_call . 0)) (WHEN . (conditional_entry_call . 0)) (EXCEPTION . (conditional_entry_call . 0)) (END . (conditional_entry_call . 0)) (LESS_LESS . (conditional_entry_call . 0)) (IDENTIFIER . (conditional_entry_call . 0)) (STRING_LITERAL . (conditional_entry_call . 0)) (CHARACTER_LITERAL . (conditional_entry_call . 0)) (ACCEPT . (conditional_entry_call . 0)) (ABORT . (conditional_entry_call . 0)) (BEGIN . (conditional_entry_call . 0)) (CASE . (conditional_entry_call . 0)) (DECLARE . (conditional_entry_call . 0)) (DELAY . (conditional_entry_call . 0)) (EXIT . (conditional_entry_call . 0)) (FOR . (conditional_entry_call . 0)) (GOTO . (conditional_entry_call . 0)) (IF . (conditional_entry_call . 0)) (LOOP . (conditional_entry_call . 0)) (NULL . (conditional_entry_call . 0)) (PRAGMA . (conditional_entry_call . 0)) (RAISE . (conditional_entry_call . 0)) (REQUEUE . (conditional_entry_call . 0)) (RETURN . (conditional_entry_call . 0)) (SELECT . (conditional_entry_call . 0)) (WHILE . (conditional_entry_call . 0)) (ELSE . (conditional_entry_call . 0)) (ELSIF . (conditional_entry_call . 0)))
      ((default . error) (OR . (timed_entry_call . 0)) (THEN . (timed_entry_call . 0)) (WHEN . (timed_entry_call . 0)) (EXCEPTION . (timed_entry_call . 0)) (END . (timed_entry_call . 0)) (LESS_LESS . (timed_entry_call . 0)) (IDENTIFIER . (timed_entry_call . 0)) (STRING_LITERAL . (timed_entry_call . 0)) (CHARACTER_LITERAL . (timed_entry_call . 0)) (ACCEPT . (timed_entry_call . 0)) (ABORT . (timed_entry_call . 0)) (BEGIN . (timed_entry_call . 0)) (CASE . (timed_entry_call . 0)) (DECLARE . (timed_entry_call . 0)) (DELAY . (timed_entry_call . 0)) (EXIT . (timed_entry_call . 0)) (FOR . (timed_entry_call . 0)) (GOTO . (timed_entry_call . 0)) (IF . (timed_entry_call . 0)) (LOOP . (timed_entry_call . 0)) (NULL . (timed_entry_call . 0)) (PRAGMA . (timed_entry_call . 0)) (RAISE . (timed_entry_call . 0)) (REQUEUE . (timed_entry_call . 0)) (RETURN . (timed_entry_call . 0)) (SELECT . (timed_entry_call . 0)) (WHILE . (timed_entry_call . 0)) (ELSE . (timed_entry_call . 0)) (ELSIF . (timed_entry_call . 0)))
      ((default . error) (OR . (loop_statement . 0)) (THEN . (loop_statement . 0)) (WHEN . (loop_statement . 0)) (EXCEPTION . (loop_statement . 0)) (END . (loop_statement . 0)) (LESS_LESS . (loop_statement . 0)) (IDENTIFIER . (loop_statement . 0)) (STRING_LITERAL . (loop_statement . 0)) (CHARACTER_LITERAL . (loop_statement . 0)) (ACCEPT . (loop_statement . 0)) (ABORT . (loop_statement . 0)) (BEGIN . (loop_statement . 0)) (CASE . (loop_statement . 0)) (DECLARE . (loop_statement . 0)) (DELAY . (loop_statement . 0)) (EXIT . (loop_statement . 0)) (FOR . (loop_statement . 0)) (GOTO . (loop_statement . 0)) (IF . (loop_statement . 0)) (LOOP . (loop_statement . 0)) (NULL . (loop_statement . 0)) (PRAGMA . (loop_statement . 0)) (RAISE . (loop_statement . 0)) (REQUEUE . (loop_statement . 0)) (RETURN . (loop_statement . 0)) (SELECT . (loop_statement . 0)) (WHILE . (loop_statement . 0)) (ELSE . (loop_statement . 0)) (ELSIF . (loop_statement . 0)))
      ((default . error) (WHEN . (sequence_of_statements_opt . 0)) (END . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (WHEN . (exception_handler . 0)) (END . (exception_handler . 0)))
      ((default . error) (WHEN . (asynchronous_select . 0)) (THEN . (asynchronous_select . 0)) (OR . (asynchronous_select . 0)) (ELSIF . (asynchronous_select . 0)) (ELSE . (asynchronous_select . 0)) (WHILE . (asynchronous_select . 0)) (SELECT . (asynchronous_select . 0)) (RETURN . (asynchronous_select . 0)) (REQUEUE . (asynchronous_select . 0)) (RAISE . (asynchronous_select . 0)) (PRAGMA . (asynchronous_select . 0)) (NULL . (asynchronous_select . 0)) (LOOP . (asynchronous_select . 0)) (IF . (asynchronous_select . 0)) (GOTO . (asynchronous_select . 0)) (FOR . (asynchronous_select . 0)) (EXIT . (asynchronous_select . 0)) (DELAY . (asynchronous_select . 0)) (DECLARE . (asynchronous_select . 0)) (CASE . (asynchronous_select . 0)) (BEGIN . (asynchronous_select . 0)) (ABORT . (asynchronous_select . 0)) (ACCEPT . (asynchronous_select . 0)) (CHARACTER_LITERAL . (asynchronous_select . 0)) (STRING_LITERAL . (asynchronous_select . 0)) (IDENTIFIER . (asynchronous_select . 0)) (LESS_LESS . (asynchronous_select . 0)) (END . (asynchronous_select . 0)) (EXCEPTION . (asynchronous_select . 0)))
      ((default . error) (DO . (extended_return_object_declaration . 0)) (SEMICOLON . (extended_return_object_declaration . 0)))
      ((default . error) (IF .  1309))
      ((default . error) (WHEN . (if_statement . 1)) (THEN . (if_statement . 1)) (OR . (if_statement . 1)) (ELSIF . (if_statement . 1)) (ELSE . (if_statement . 1)) (WHILE . (if_statement . 1)) (SELECT . (if_statement . 1)) (RETURN . (if_statement . 1)) (REQUEUE . (if_statement . 1)) (RAISE . (if_statement . 1)) (PRAGMA . (if_statement . 1)) (NULL . (if_statement . 1)) (LOOP . (if_statement . 1)) (IF . (if_statement . 1)) (GOTO . (if_statement . 1)) (FOR . (if_statement . 1)) (EXIT . (if_statement . 1)) (DELAY . (if_statement . 1)) (DECLARE . (if_statement . 1)) (CASE . (if_statement . 1)) (BEGIN . (if_statement . 1)) (ABORT . (if_statement . 1)) (ACCEPT . (if_statement . 1)) (CHARACTER_LITERAL . (if_statement . 1)) (STRING_LITERAL . (if_statement . 1)) (IDENTIFIER . (if_statement . 1)) (LESS_LESS . (if_statement . 1)) (END . (if_statement . 1)) (EXCEPTION . (if_statement . 1)))
      ((default . error) (ELSE . (elsif_statement_item . 0)) (ELSIF . (elsif_statement_item . 0)) (END . (elsif_statement_item . 0)))
      ((default . error) (SEMICOLON .  1308))
      ((default . error) (SEMICOLON .  1307))
      ((default . error) (SEMICOLON .  1306))
      ((default . error) (IN .  1305))
      ((default . error) (IS .  1304))
      ((default . error) (WITH . (derived_type_definition . 0)) (SEMICOLON . (derived_type_definition . 0)))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (CASE .  1302))
      ((default . error) (WHEN . (variant_list . 1)) (END . (variant_list . 1)))
      ((default . error) (BAR .  275) (EQUAL_GREATER .  1301))
      ((default . error) (WHEN . (component_declaration . 1)) (END . (component_declaration . 1)) (CASE . (component_declaration . 1)) (IDENTIFIER . (component_declaration . 1)) (FOR . (component_declaration . 1)))
      ((default . error) (SEMICOLON . (aspect_specification_opt . 0)) (WITH .  108))
      ((default . error) (SEMICOLON . (real_range_specification_opt . 1)) (WITH . (real_range_specification_opt . 1)))
      ((default . error) (SEMICOLON .  1299))
      ((default . error) (SEMICOLON .  1298))
      ((default . error) (DOT_DOT .  1297))
      ((default . error) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  149) (NULL .  150) (NEW .  148) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (LEFT_PAREN .  147))
      ((default . error) (PRIVATE . (protected_type_declaration . 0)) (END . (protected_type_declaration . 0)) (BEGIN . (protected_type_declaration . 0)) (IDENTIFIER . (protected_type_declaration . 0)) (ENTRY . (protected_type_declaration . 0)) (FOR . (protected_type_declaration . 0)) (FUNCTION . (protected_type_declaration . 0)) (GENERIC . (protected_type_declaration . 0)) (NOT . (protected_type_declaration . 0)) (OVERRIDING . (protected_type_declaration . 0)) (PACKAGE . (protected_type_declaration . 0)) (PRAGMA . (protected_type_declaration . 0)) (PROCEDURE . (protected_type_declaration . 0)) (PROTECTED . (protected_type_declaration . 0)) (SUBTYPE . (protected_type_declaration . 0)) (TASK . (protected_type_declaration . 0)) (TYPE . (protected_type_declaration . 0)) (USE . (protected_type_declaration . 0)))
      ((default . error) (PRIVATE . (task_type_declaration . 0)) (END . (task_type_declaration . 0)) (BEGIN . (task_type_declaration . 0)) (IDENTIFIER . (task_type_declaration . 0)) (ENTRY . (task_type_declaration . 0)) (FOR . (task_type_declaration . 0)) (FUNCTION . (task_type_declaration . 0)) (GENERIC . (task_type_declaration . 0)) (NOT . (task_type_declaration . 0)) (OVERRIDING . (task_type_declaration . 0)) (PACKAGE . (task_type_declaration . 0)) (PRAGMA . (task_type_declaration . 0)) (PROCEDURE . (task_type_declaration . 0)) (PROTECTED . (task_type_declaration . 0)) (SUBTYPE . (task_type_declaration . 0)) (TASK . (task_type_declaration . 0)) (TYPE . (task_type_declaration . 0)) (USE . (task_type_declaration . 0)))
      ((default . error) (SEMICOLON .  1316))
      ((default . error) (NULL .  1009) (CASE .  1008) (IDENTIFIER .  72) (FOR .  289))
      ((default . error) (SEMICOLON .  1314))
      ((default . error) (SEMICOLON .  1313))
      ((default . error) (BEGIN . (declarative_part_opt . 0)) (USE .  11) (SUBTYPE .  292) (PRAGMA .  7) (NOT .  4) (OVERRIDING .  5) (FUNCTION . (overriding_indicator_opt . 2)) (PROCEDURE . (overriding_indicator_opt . 2)) (ENTRY . (overriding_indicator_opt . 2)) (FOR .  289) (IDENTIFIER .  288) (TYPE .  294) (GENERIC .  2) (PROTECTED .  291) (TASK .  293) (PACKAGE .  290))
      ((default . error) (IDENTIFIER .  48) (CHARACTER_LITERAL .  50) (STRING_LITERAL .  49) (PLUS .  144) (MINUS .  143) (ABS .  146) (NOT .  758) (NULL .  150) (NEW .  148) (LEFT_PAREN .  147))
      ((default . error) (PRIVATE . (task_body . 0)) (END . (task_body . 0)) (BEGIN . (task_body . 0)) (IDENTIFIER . (task_body . 0)) (ENTRY . (task_body . 0)) (FOR . (task_body . 0)) (FUNCTION . (task_body . 0)) (GENERIC . (task_body . 0)) (NOT . (task_body . 0)) (OVERRIDING . (task_body . 0)) (PACKAGE . (task_body . 0)) (PRAGMA . (task_body . 0)) (PROCEDURE . (task_body . 0)) (PROTECTED . (task_body . 0)) (SUBTYPE . (task_body . 0)) (TASK . (task_body . 0)) (TYPE . (task_body . 0)) (USE . (task_body . 0)) ($EOI . (task_body . 0)) (LIMITED . (task_body . 0)) (SEPARATE . (task_body . 0)) (WITH . (task_body . 0)))
      ((default . error) (THEN . (accept_statement . 0)) (WHEN . (accept_statement . 0)) (EXCEPTION . (accept_statement . 0)) (ELSIF . (accept_statement . 0)) (ELSE . (accept_statement . 0)) (OR . (accept_statement . 0)) (END . (accept_statement . 0)) (LESS_LESS . (accept_statement . 0)) (IDENTIFIER . (accept_statement . 0)) (STRING_LITERAL . (accept_statement . 0)) (CHARACTER_LITERAL . (accept_statement . 0)) (ACCEPT . (accept_statement . 0)) (ABORT . (accept_statement . 0)) (BEGIN . (accept_statement . 0)) (CASE . (accept_statement . 0)) (DECLARE . (accept_statement . 0)) (DELAY . (accept_statement . 0)) (EXIT . (accept_statement . 0)) (FOR . (accept_statement . 0)) (GOTO . (accept_statement . 0)) (IF . (accept_statement . 0)) (LOOP . (accept_statement . 0)) (NULL . (accept_statement . 0)) (PRAGMA . (accept_statement . 0)) (RAISE . (accept_statement . 0)) (REQUEUE . (accept_statement . 0)) (RETURN . (accept_statement . 0)) (SELECT . (accept_statement . 0)) (WHILE . (accept_statement . 0)))
      ((default . error) (OR . (if_statement . 2)) (THEN . (if_statement . 2)) (WHEN . (if_statement . 2)) (EXCEPTION . (if_statement . 2)) (END . (if_statement . 2)) (LESS_LESS . (if_statement . 2)) (IDENTIFIER . (if_statement . 2)) (STRING_LITERAL . (if_statement . 2)) (CHARACTER_LITERAL . (if_statement . 2)) (ACCEPT . (if_statement . 2)) (ABORT . (if_statement . 2)) (BEGIN . (if_statement . 2)) (CASE . (if_statement . 2)) (DECLARE . (if_statement . 2)) (DELAY . (if_statement . 2)) (EXIT . (if_statement . 2)) (FOR . (if_statement . 2)) (GOTO . (if_statement . 2)) (IF . (if_statement . 2)) (LOOP . (if_statement . 2)) (NULL . (if_statement . 2)) (PRAGMA . (if_statement . 2)) (RAISE . (if_statement . 2)) (REQUEUE . (if_statement . 2)) (RETURN . (if_statement . 2)) (SELECT . (if_statement . 2)) (WHILE . (if_statement . 2)) (ELSE . (if_statement . 2)) (ELSIF . (if_statement . 2)))
      ((default . error) (SEMICOLON .  1310))
      ((default . error) (WHEN . (if_statement . 0)) (THEN . (if_statement . 0)) (OR . (if_statement . 0)) (ELSIF . (if_statement . 0)) (ELSE . (if_statement . 0)) (WHILE . (if_statement . 0)) (SELECT . (if_statement . 0)) (RETURN . (if_statement . 0)) (REQUEUE . (if_statement . 0)) (RAISE . (if_statement . 0)) (PRAGMA . (if_statement . 0)) (NULL . (if_statement . 0)) (LOOP . (if_statement . 0)) (IF . (if_statement . 0)) (GOTO . (if_statement . 0)) (FOR . (if_statement . 0)) (EXIT . (if_statement . 0)) (DELAY . (if_statement . 0)) (DECLARE . (if_statement . 0)) (CASE . (if_statement . 0)) (BEGIN . (if_statement . 0)) (ABORT . (if_statement . 0)) (ACCEPT . (if_statement . 0)) (CHARACTER_LITERAL . (if_statement . 0)) (STRING_LITERAL . (if_statement . 0)) (IDENTIFIER . (if_statement . 0)) (LESS_LESS . (if_statement . 0)) (END . (if_statement . 0)) (EXCEPTION . (if_statement . 0)))
      ((default . error) (RIGHT_PAREN .  1320))
      ((default . error) (BEGIN .  1319))
      ((default . error) (BEGIN . (private_extension_declaration . 0)) (IDENTIFIER . (private_extension_declaration . 0)) (ENTRY . (private_extension_declaration . 0)) (FOR . (private_extension_declaration . 0)) (FUNCTION . (private_extension_declaration . 0)) (GENERIC . (private_extension_declaration . 0)) (NOT . (private_extension_declaration . 0)) (OVERRIDING . (private_extension_declaration . 0)) (PACKAGE . (private_extension_declaration . 0)) (PRAGMA . (private_extension_declaration . 0)) (PROCEDURE . (private_extension_declaration . 0)) (PROTECTED . (private_extension_declaration . 0)) (SUBTYPE . (private_extension_declaration . 0)) (TASK . (private_extension_declaration . 0)) (TYPE . (private_extension_declaration . 0)) (USE . (private_extension_declaration . 0)) (PRIVATE . (private_extension_declaration . 0)) (END . (private_extension_declaration . 0)))
      ((default . error) (WHEN . (variant_part . 0)) (END . (variant_part . 0)) (CASE . (variant_part . 0)) (IDENTIFIER . (variant_part . 0)) (FOR . (variant_part . 0)))
      ((default . error) (END . (variant . 0)) (WHEN . (variant . 0)) (CASE .  1008) (IDENTIFIER .  72) (FOR .  289))
      ((default . error) (WHEN . (component_declaration . 0)) (END . (component_declaration . 0)) (CASE . (component_declaration . 0)) (IDENTIFIER . (component_declaration . 0)) (FOR . (component_declaration . 0)))
      ((default . error) (SEMICOLON .  1318))
      ((default . error) (END . (component_clause . 0)) (IDENTIFIER . (component_clause . 0)))
      ((default . error) (END . (sequence_of_statements_opt . 0)) (EXCEPTION . (sequence_of_statements_opt . 0)) (ACCEPT . (label_opt . 0)) (BEGIN . (label_opt . 0)) (CASE . (label_opt . 0)) (DECLARE . (label_opt . 0)) (FOR . (label_opt . 0)) (IF . (label_opt . 0)) (LOOP . (label_opt . 0)) (RETURN . (label_opt . 0)) (SELECT . (label_opt . 0)) (WHILE . (label_opt . 0)) (STRING_LITERAL . (label_opt . 0)) (CHARACTER_LITERAL . (label_opt . 0)) (ABORT . (label_opt . 0)) (DELAY . (label_opt . 0)) (EXIT . (label_opt . 0)) (GOTO . (label_opt . 0)) (NULL . (label_opt . 0)) (PRAGMA . (label_opt . 0)) (RAISE . (label_opt . 0)) (REQUEUE . (label_opt . 0)) (LESS_LESS .  611) (IDENTIFIER . ((label_opt . 0)  612)))
      ((default . error) (WHEN . (parameter_profile_opt . 0)) (LEFT_PAREN .  782))
      ((default . error) (WHEN . (entry_body_formal_part . 0)))
      ((default . error) (END .  1323))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  695))
      ((default . error) (SEMICOLON .  1325))
      ((default . error) (PROCEDURE . (entry_body . 0)) (OVERRIDING . (entry_body . 0)) (NOT . (entry_body . 0)) (FUNCTION . (entry_body . 0)) (FOR . (entry_body . 0)) (ENTRY . (entry_body . 0)) (END . (entry_body . 0)))]
     [((compilation_unit . 13)(compilation_unit_list . 14)(context_item . 15)(function_specification . 16)(generic_declaration . 17)(generic_formal_part . 18)(generic_instantiation . 19)(generic_package_declaration . 20)(generic_renaming_declaration . 21)(generic_subprogram_declaration . 22)(library_item . 23)(library_unit_declaration . 24)(library_unit_renaming_declaration . 25)(overriding_indicator_opt . 26)(package_body . 27)(package_declaration . 28)(package_renaming_declaration . 29)(package_specification . 30)(pragma . 31)(procedure_specification . 32)(subprogram_body . 33)(subprogram_declaration . 34)(subprogram_renaming_declaration . 35)(subunit . 36)(use_clause . 37)(with_clause . 38))
      ((attribute_reference . 51)(name . 86)(qualified_expression . 54)(selected_component . 55))
      ((formal_object_declaration . 78)(formal_subprogram_declaration . 79)(formal_type_declaration . 80)(formal_package_declaration . 81)(generic_formal_parameter_declarations . 82)(generic_formal_parameter_declaration . 83)(identifier_list . 84)(pragma . 85))
      nil
      nil
      nil
      ((attribute_reference . 51)(name . 68)(qualified_expression . 54)(selected_component . 55))
      nil
      ((function_specification . 16)(generic_declaration . 17)(generic_formal_part . 18)(generic_instantiation . 19)(generic_package_declaration . 20)(generic_subprogram_declaration . 22)(library_unit_declaration . 64)(overriding_indicator_opt . 65)(package_declaration . 28)(package_specification . 30)(procedure_specification . 32)(subprogram_declaration . 34))
      ((attribute_reference . 51)(name . 60)(qualified_expression . 54)(selected_component . 55))
      nil
      ((attribute_reference . 51)(name_list . 58)(name . 53)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(name_list . 52)(name . 53)(qualified_expression . 54)(selected_component . 55))
      nil
      ((compilation_unit . 47)(context_item . 15)(function_specification . 16)(generic_declaration . 17)(generic_formal_part . 18)(generic_instantiation . 19)(generic_package_declaration . 20)(generic_renaming_declaration . 21)(generic_subprogram_declaration . 22)(library_item . 23)(library_unit_declaration . 24)(library_unit_renaming_declaration . 25)(overriding_indicator_opt . 26)(package_body . 27)(package_declaration . 28)(package_renaming_declaration . 29)(package_specification . 30)(pragma . 31)(procedure_specification . 32)(subprogram_body . 33)(subprogram_declaration . 34)(subprogram_renaming_declaration . 35)(subunit . 36)(use_clause . 37)(with_clause . 38))
      nil
      nil
      nil
      ((function_specification . 16)(package_specification . 44)(procedure_specification . 32)(subprogram_specification . 45))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((function_specification . 16)(procedure_specification . 32)(subprogram_specification . 42))
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
      ((attribute_reference . 51)(name . 130)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(name . 129)(qualified_expression . 54)(selected_component . 55))
      ((aspect_specification_opt . 128))
      ((attribute_reference . 51)(name . 126)(qualified_expression . 54)(selected_component . 55))
      nil
      ((aspect_specification_opt . 124))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      nil
      ((attribute_reference . 51)(name_list . 121)(name . 53)(qualified_expression . 54)(selected_component . 55))
      nil
      ((attribute_reference . 51)(name . 118)(qualified_expression . 54)(selected_component . 55))
      ((actual_parameter_part . 91)(formal_part . 116)(parameter_profile_opt . 117))
      ((formal_object_declaration . 78)(formal_subprogram_declaration . 79)(formal_type_declaration . 80)(formal_package_declaration . 81)(generic_formal_parameter_declarations . 82)(generic_formal_parameter_declaration . 83)(identifier_list . 84)(pragma . 85))
      ((attribute_reference . 51)(name . 115)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(name_list . 114)(name . 53)(qualified_expression . 54)(selected_component . 55))
      nil
      ((function_specification . 16)(procedure_specification . 32)(subprogram_specification . 113))
      nil
      ((attribute_reference . 51)(name . 110)(qualified_expression . 54)(selected_component . 55))
      ((actual_parameter_part . 91)(aspect_specification_opt . 109))
      nil
      nil
      ((attribute_reference . 51)(name_list . 103)(name . 53)(qualified_expression . 54)(selected_component . 55))
      nil
      ((attribute_reference . 51)(name . 102)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(name . 101)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(name . 100)(qualified_expression . 54)(selected_component . 55))
      nil
      ((function_specification . 16)(procedure_specification . 32)(subprogram_specification . 98))
      nil
      nil
      nil
      nil
      ((formal_object_declaration . 78)(formal_subprogram_declaration . 79)(formal_type_declaration . 80)(formal_package_declaration . 81)(generic_formal_parameter_declaration . 96)(identifier_list . 84)(pragma . 85))
      nil
      nil
      nil
      ((actual_parameter_part . 91)(formal_part . 92)(parameter_and_result_profile . 93))
      nil
      ((aggregate . 222)(attribute_reference . 51)(attribute_designator . 223)(name . 224)(qualified_expression . 54)(selected_component . 55))
      ((aggregate . 151)(association_opt . 173)(association_list . 190)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 183)(expression . 184)(expression_opt . 185)(factor . 153)(identifier_list . 214)(name . 186)(parameter_specification . 215)(parameter_specification_list . 216)(primary . 157)(qualified_expression . 54)(range . 191)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 188)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((access_definition . 209)(attribute_reference . 51)(name . 210)(name_opt . 211)(null_exclusion_opt . 212)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      ((mode_opt . 206))
      nil
      nil
      ((attribute_reference . 51)(name . 202)(qualified_expression . 54)(selected_component . 55))
      ((aspect_specification_opt . 201))
      ((discriminant_part_opt . 199))
      ((actual_parameter_part . 91))
      ((actual_parameter_part . 91))
      ((actual_parameter_part . 91))
      nil
      ((attribute_reference . 51)(name_list . 193)(name . 53)(qualified_expression . 54)(selected_component . 55))
      nil
      ((aggregate . 151)(association_opt . 173)(association_list . 190)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 183)(expression . 184)(expression_opt . 185)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 191)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 188)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((attribute_reference . 51)(name . 189)(qualified_expression . 54)(selected_component . 55))
      ((aggregate . 151)(association_opt . 173)(association_list . 174)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 183)(expression . 184)(expression_opt . 185)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 187)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 188)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((actual_parameter_part . 91)(aspect_specification_opt . 168))
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 152)(factor . 153)(name . 154)(pragma_argument_association . 155)(pragma_argument_association_list . 156)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aspect_specification_opt . 142))
      nil
      ((actual_parameter_part . 91)(aspect_specification_opt . 109))
      nil
      nil
      ((actual_parameter_part . 91))
      ((attribute_reference . 51)(name . 139)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      ((attribute_reference . 51)(name_list . 137)(name . 53)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      ((actual_parameter_part . 91)(aspect_specification_opt . 109))
      ((attribute_reference . 51)(name . 135)(qualified_expression . 54)(selected_component . 55))
      nil
      ((actual_parameter_part . 91)(formal_part . 116)(parameter_profile_opt . 117))
      ((actual_parameter_part . 91)(formal_part . 92)(parameter_and_result_profile . 93))
      nil
      nil
      nil
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 382)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      ((actual_parameter_part . 91)(aspect_specification_opt . 381))
      nil
      nil
      nil
      ((actual_parameter_part . 91))
      ((function_specification . 16)(overriding_indicator_opt . 378)(package_body . 317)(procedure_specification . 32)(proper_body . 379)(protected_body . 325)(subprogram_body . 332)(task_body . 337))
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(name . 154)(primary . 372)(qualified_expression . 54)(selected_component . 55))
      ((aggregate . 151)(association_opt . 173)(association_list . 230)(attribute_reference . 51)(case_expression . 369)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 183)(expression . 231)(expression_opt . 185)(factor . 153)(if_expression . 370)(name . 186)(primary . 157)(qualified_expression . 54)(quantified_expression . 371)(range . 187)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 188)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((attribute_reference . 51)(name . 365)(qualified_expression . 54)(selected_component . 55))
      ((aggregate . 151)(attribute_reference . 51)(name . 154)(primary . 286)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((relational_operator . 353))
      ((multiplying_operator . 352))
      ((binary_adding_operator . 347))
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(term . 165)(term_list . 343))
      nil
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 302)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      nil
      ((aggregate . 151)(attribute_reference . 51)(name . 154)(primary . 286)(qualified_expression . 54)(selected_component . 55))
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
      ((actual_parameter_part . 91))
      nil
      ((relational_operator . 273))
      ((actual_parameter_part . 91)(aspect_specification_opt . 263))
      nil
      nil
      ((attribute_reference . 51)(name . 259)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      ((attribute_reference . 51)(name . 257)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(name . 256)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(name . 255)(qualified_expression . 54)(selected_component . 55))
      ((discriminant_specification_opt . 252)(discriminant_specification_list . 253)(identifier_list . 254))
      ((aspect_specification_opt . 250))
      ((attribute_reference . 51)(name . 247)(qualified_expression . 54)(selected_component . 55)(subprogram_default . 248))
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      nil
      ((access_definition . 239)(null_exclusion_opt . 240))
      ((access_definition . 237)(null_exclusion_opt . 238))
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 151)(association_opt . 173)(association_list . 230)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 183)(expression . 231)(expression_opt . 185)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 187)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 188)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((identifier_list . 214)(parameter_specification . 515))
      nil
      ((access_definition . 513)(aliased_opt . 514)(null_exclusion_opt . 212))
      ((general_access_modifier_opt . 510)(protected_opt . 511))
      nil
      nil
      ((attribute_reference . 51)(name . 210)(name_opt . 506)(qualified_expression . 54)(selected_component . 55))
      ((aspect_specification_opt . 505))
      ((attribute_reference . 51)(name . 503)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 500)(attribute_reference . 51)(name . 247)(qualified_expression . 54)(selected_component . 55)(subprogram_default . 501))
      nil
      ((actual_parameter_part . 91))
      ((aspect_specification_opt . 499))
      ((abstract_limited_synchronized_opt . 492)(abstract_tagged_limited_opt . 493)(access_definition . 494)(array_type_definition . 495)(formal_type_definition . 496)(formal_derived_type_definition . 497)(interface_type_definition . 498)(null_exclusion_opt . 212))
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91)(aspect_specification_opt . 473))
      ((actual_parameter_part . 91)(aspect_specification_opt . 472))
      ((actual_parameter_part . 91)(aspect_specification_opt . 471))
      nil
      ((actual_parameter_part . 91)(aspect_specification_opt . 470))
      nil
      ((aggregate . 151)(association_opt . 469)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 183)(expression . 184)(expression_opt . 185)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 187)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 188)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 467)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(membership_choice_list . 463)(membership_choice . 464)(name . 186)(primary . 157)(qualified_expression . 54)(range . 465)(selected_component . 55)(simple_expression . 466)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 461)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 222)(attribute_reference . 51)(attribute_designator . 223)(name . 224)(qualified_expression . 54)(selected_component . 55))
      ((aggregate . 151)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 458)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 187)(selected_component . 55)(simple_expression . 459)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(expression . 457)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(choice_relation . 455)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 446)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(choice_relation . 453)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 446)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(choice_relation . 451)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 446)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(choice_relation . 448)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 446)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(choice_relation . 447)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 446)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(choice_relation . 445)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 446)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((attribute_reference . 51)(name . 444)(qualified_expression . 54)(selected_component . 55))
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 443)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((attribute_reference . 438)(direct_name . 439)(name . 440)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(name . 68)(qualified_expression . 54)(selected_component . 55))
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
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 426)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
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
      ((function_specification . 420)(procedure_specification . 421)(subprogram_specification . 422))
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
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 418)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      ((binary_adding_operator . 347))
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(term . 417))
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 416)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55))
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 415)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation . 414)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation . 412)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation . 410)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation . 409)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation . 407)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation . 405)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(name . 154)(primary . 404)(qualified_expression . 54)(selected_component . 55))
      ((aggregate . 151)(attribute_reference . 51)(expression . 152)(factor . 153)(name . 154)(pragma_argument_association . 403)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((actual_parameter_part . 91))
      ((aggregate . 151)(attribute_reference . 51)(expression . 401)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((quantifier . 400))
      ((aggregate . 151)(attribute_reference . 51)(expression . 397)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 393)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      nil
      ((function_specification . 16)(procedure_specification . 32)(subprogram_specification . 389))
      nil
      nil
      nil
      nil
      ((attribute_reference . 51)(name . 386)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(name . 385)(qualified_expression . 54)(selected_component . 55))
      ((actual_parameter_part . 91)(aspect_specification_opt . 657))
      ((actual_parameter_part . 91)(aspect_specification_opt . 656))
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(handled_sequence_of_statements . 639)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 652)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      ((aspect_specification_opt . 610))
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
      ((iterator_specification . 605))
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation . 602)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation . 601)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation . 600)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation . 599)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      ((multiplying_operator . 352))
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 128))
      ((aliased_opt . 592))
      ((attribute_reference . 51)(name . 589)(qualified_expression . 54)(selected_component . 55))
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 588)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      nil
      ((discriminant_part_opt . 587))
      ((aspect_specification_opt . 585))
      nil
      nil
      nil
      ((aspect_specification_opt . 581))
      nil
      nil
      ((attribute_reference . 51)(name . 578)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91))
      ((access_definition . 573)(null_exclusion_opt . 574))
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      ((relational_operator . 567))
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(choice_relation . 571)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 446)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(choice_relation . 570)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 446)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((aggregate . 151)(attribute_reference . 51)(choice_relation . 569)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 446)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((aggregate . 151)(attribute_reference . 51)(choice_relation . 568)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 446)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      nil
      ((relational_operator . 567))
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(membership_choice_list . 565)(membership_choice . 464)(name . 186)(primary . 157)(qualified_expression . 54)(range . 465)(selected_component . 55)(simple_expression . 466)(term . 165)(term_list . 166)(unary_adding_operator . 167))
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
      ((access_definition . 556)(attribute_reference . 51)(name . 557)(null_exclusion_opt . 212)(null_exclusion_opt_name . 558)(qualified_expression . 54)(selected_component . 559))
      ((discriminant_specification_opt . 553)(identifier_list . 254))
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
      ((aspect_specification_opt . 540))
      nil
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 535))
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 532))
      ((attribute_reference . 51)(name . 531)(qualified_expression . 54)(selected_component . 55))
      ((actual_parameter_part . 91)(aspect_specification_opt . 530))
      ((aggregate . 151)(attribute_reference . 51)(expression . 528)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 51)(name . 526)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      ((mode_opt . 522))
      nil
      ((aggregate . 151)(association_opt . 173)(association_list . 521)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 183)(expression . 184)(expression_opt . 185)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 187)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 188)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      nil
      nil
      ((null_exclusion_opt . 786))
      ((aggregate . 151)(attribute_reference . 51)(expression . 785)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((formal_part . 92)(parameter_and_result_profile . 784))
      ((formal_part . 116)(parameter_profile_opt . 783))
      ((actual_parameter_part . 91))
      nil
      ((aspect_specification_opt . 781))
      ((aggregate . 151)(attribute_reference . 51)(expression . 780)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((actual_parameter_part . 91)(formal_package_actual_part . 778))
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 51)(name . 774)(qualified_expression . 54)(selected_component . 55))
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
      ((aggregate . 151)(attribute_reference . 51)(discrete_subtype_definition . 759)(discrete_subtype_definition_list . 760)(factor . 153)(index_subtype_definition . 761)(index_subtype_definition_list . 762)(name . 763)(primary . 157)(qualified_expression . 54)(range . 764)(selected_component . 55)(simple_expression . 765)(subtype_indication . 766)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(membership_choice . 753)(name . 186)(primary . 157)(qualified_expression . 54)(range . 465)(selected_component . 55)(simple_expression . 466)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 752)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 751)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 51)(name . 748)(qualified_expression . 54)(selected_component . 55))
      ((aggregate . 746)(record_rep . 747))
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 743)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((actual_parameter_part . 91)(aspect_specification_opt . 168))
      ((discriminant_part_opt . 741))
      ((aspect_specification_opt . 707))
      nil
      ((attribute_reference . 51)(name . 737)(qualified_expression . 54)(selected_component . 55)(subtype_indication . 738))
      ((discriminant_part_opt . 735))
      ((aspect_specification_opt . 706))
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      ((constant_opt . 727))
      nil
      nil
      ((paren_expression . 722))
      ((formal_part . 116)(parameter_profile_opt . 720))
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(handled_sequence_of_statements . 718)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 652)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      ((attribute_reference . 51)(name . 210)(name_opt . 717)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      nil
      ((case_expression_alternative . 715)(case_expression_alternative_list . 716))
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 709)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(expression . 708)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aspect_specification_opt . 707))
      ((aspect_specification_opt . 706))
      nil
      nil
      nil
      nil
      ((attribute_reference . 51)(name . 702)(qualified_expression . 54)(selected_component . 55))
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(handled_sequence_of_statements . 701)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 652)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      ((aggregate . 151)(attribute_reference . 51)(expression . 184)(expression_opt . 700)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 699)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      ((aggregate . 151)(attribute_reference . 51)(expression . 698)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((identifier_opt . 696))
      ((iterator_specification . 693)(iterator_specification_opt . 694))
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 184)(expression_opt . 691)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 690)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      ((attribute_reference . 51)(name . 688)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(name . 686)(qualified_expression . 54)(selected_component . 55))
      ((aggregate . 151)(attribute_reference . 51)(expression . 683)(extended_return_object_declaration . 684)(extended_return_object_declaration_opt . 685)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((accept_statement . 671)(attribute_reference . 51)(delay_alternative . 672)(delay_statement . 673)(entry_call_alternative . 674)(name . 675)(procedure_call_statement . 676)(qualified_expression . 54)(selected_component . 55)(select_alternative . 677)(select_alternative_list . 678)(select_alternative_list_opt . 679)(triggering_alternative . 680))
      ((aggregate . 151)(attribute_reference . 51)(expression . 184)(expression_opt . 668)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
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
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(compound_statement . 664)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(simple_return_statement . 653)(simple_statement . 665)(timed_entry_call . 655))
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      nil
      nil
      nil
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(simple_return_statement . 653)(statement . 661)(timed_entry_call . 655))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((exception_handler . 931)(exception_handler_list . 932)(exception_handler_list_opt . 933))
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 929)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 928)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      ((attribute_reference . 51)(name . 210)(name_opt . 927)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 925)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 924)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 923)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      ((accept_statement . 630)(actual_parameter_part . 91)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 920)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 919)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 901)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91))
      ((actual_parameter_part . 894)(actual_parameter_part_opt . 895))
      nil
      nil
      nil
      nil
      nil
      ((elsif_expression_item . 888)(elsif_expression_list . 889))
      ((aggregate . 151)(attribute_reference . 51)(expression . 885)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((attribute_reference . 51)(name . 737)(qualified_expression . 54)(selected_component . 55)(subtype_indication . 884))
      ((aggregate . 151)(attribute_reference . 51)(discrete_subtype_definition . 883)(factor . 153)(name . 875)(primary . 157)(qualified_expression . 54)(range . 764)(selected_component . 55)(simple_expression . 765)(subtype_indication . 766)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((attribute_reference . 51)(name . 881)(qualified_expression . 54)(selected_component . 55))
      ((aggregate . 151)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 879)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 187)(selected_component . 55)(simple_expression . 459)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(discrete_subtype_definition . 874)(factor . 153)(identifier_list . 214)(name . 875)(parameter_specification . 215)(parameter_specification_list . 216)(primary . 157)(qualified_expression . 54)(range . 764)(selected_component . 55)(simple_expression . 765)(subtype_indication . 766)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aspect_specification_opt . 873))
      ((aggregate . 151)(attribute_reference . 51)(case_expression . 870)(expression . 871)(factor . 153)(if_expression . 872)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aspect_specification_opt . 869))
      ((aspect_specification_opt . 868))
      ((aspect_specification_opt . 867))
      ((aspect_specification_opt . 866))
      nil
      ((access_definition . 863)(array_type_definition . 864)(attribute_reference . 51)(name . 737)(null_exclusion_opt . 212)(qualified_expression . 54)(selected_component . 55)(subtype_indication . 865))
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 861)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((attribute_reference . 51)(name . 210)(name_opt . 860)(qualified_expression . 54)(selected_component . 55))
      ((abstract_limited_synchronized_opt . 850)(abstract_limited_opt . 851)(abstract_tagged_limited_opt . 852)(access_definition . 853)(array_type_definition . 854)(derived_type_definition . 855)(enumeration_type_definition . 856)(interface_type_definition . 857)(null_exclusion_opt . 212)(record_type_definition . 858)(type_definition . 859))
      nil
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 838)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_definition . 839)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      nil
      ((aspect_specification_opt . 835))
      nil
      ((actual_parameter_part . 91)(constraint . 805)(index_constraint . 806))
      ((aspect_specification_opt . 832))
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 830)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_definition . 831)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      nil
      ((aspect_specification_opt . 827))
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 824)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((mod_clause_opt . 823))
      nil
      nil
      ((actual_parameter_part . 91))
      ((attribute_reference . 51)(name . 818)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(name . 817)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 815)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(expression . 814)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((attribute_reference . 51)(name . 557)(qualified_expression . 54)(selected_component . 813))
      nil
      ((aggregate . 151)(attribute_reference . 51)(name . 154)(primary . 286)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91)(constraint . 805)(index_constraint . 806))
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 51)(interface_list . 801)(name . 798)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(interface_list . 800)(name . 798)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(interface_list . 799)(name . 798)(qualified_expression . 54)(selected_component . 55))
      nil
      ((attribute_reference . 51)(interface_list . 797)(name . 798)(qualified_expression . 54)(selected_component . 55))
      ((actual_parameter_part . 91))
      nil
      nil
      ((aggregate . 151)(association_opt . 173)(association_list . 190)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 183)(expression . 184)(expression_opt . 185)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 191)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 188)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aspect_specification_opt . 793))
      nil
      ((aspect_specification_opt . 792))
      nil
      ((identifier_list . 214)(parameter_specification . 215)(parameter_specification_list . 216))
      nil
      nil
      nil
      ((attribute_reference . 51)(name . 790)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      nil
      nil
      ((attribute_reference . 51)(interface_list . 1063)(name . 798)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      nil
      nil
      ((aggregate . 151)(association_opt . 173)(association_list . 190)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 183)(discrete_subtype_definition . 759)(discrete_subtype_definition_list . 1059)(expression . 184)(expression_opt . 185)(factor . 153)(name . 875)(primary . 157)(qualified_expression . 54)(range . 1060)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 188)(subtype_indication . 766)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 1035)(selected_component . 55)(simple_expression . 765)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      ((attribute_reference . 51)(index_subtype_definition . 1055)(name . 1056)(qualified_expression . 54)(selected_component . 55))
      nil
      ((aggregate . 151)(attribute_reference . 51)(discrete_subtype_definition . 1053)(factor . 153)(name . 875)(primary . 157)(qualified_expression . 54)(range . 764)(selected_component . 55)(simple_expression . 765)(subtype_indication . 766)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((attribute_reference . 51)(name . 1034)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91)(aspect_specification_opt . 1051))
      ((actual_parameter_part . 91)(aspect_specification_opt . 1050))
      ((attribute_reference . 51)(name . 1049)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      ((component_clause . 1046)(component_clause_list . 1047))
      nil
      nil
      ((aspect_specification_opt . 1043))
      nil
      ((aspect_specification_opt . 1041))
      ((attribute_reference . 51)(interface_list . 1040)(name . 798)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 1035)(selected_component . 55)(simple_expression . 765)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((attribute_reference . 51)(name . 1034)(qualified_expression . 54)(selected_component . 55))
      nil
      ((aspect_specification_opt . 1031))
      ((attribute_reference . 51)(interface_list . 1030)(name . 798)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 1025)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(expression . 1024)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((enumeration_literal . 1022)(enumeration_literal_list . 1023))
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 1019)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 1017)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aspect_clause . 1010)(at_clause . 297)(component_declaration . 1011)(component_item . 1012)(component_list . 1013)(component_list_opt . 1014)(enumeration_representation_clause . 304)(identifier_list . 1015)(record_representation_clause . 328)(variant_part . 1016))
      nil
      nil
      nil
      ((record_definition . 1004))
      nil
      nil
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 1002))
      nil
      nil
      nil
      ((aspect_specification_opt . 999))
      ((aspect_specification_opt . 997))
      ((aspect_specification_opt . 995))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91)(constraint . 805)(index_constraint . 806))
      ((attribute_reference . 51)(name . 210)(name_opt . 984)(qualified_expression . 54)(selected_component . 55))
      nil
      ((case_expression_alternative . 983))
      nil
      ((attribute_reference . 51)(name . 981)(qualified_expression . 54)(selected_component . 55))
      ((actual_parameter_part . 91))
      ((aggregate . 151)(attribute_reference . 51)(discrete_subtype_definition . 980)(factor . 153)(name . 875)(primary . 157)(qualified_expression . 54)(range . 764)(selected_component . 55)(simple_expression . 765)(subtype_indication . 766)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 978)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(expression . 977)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((elsif_expression_item . 976))
      ((aspect_clause . 967)(at_clause . 297)(entry_body . 968)(enumeration_representation_clause . 304)(function_specification . 16)(overriding_indicator_opt . 969)(procedure_specification . 32)(protected_operation_item . 970)(protected_operation_item_list . 971)(protected_operation_item_list_opt . 972)(record_representation_clause . 328)(subprogram_body . 973)(subprogram_declaration . 974))
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 965)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      nil
      ((aggregate . 151)(association_opt . 173)(association_list . 190)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 183)(expression . 184)(expression_opt . 185)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 187)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 188)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((formal_part . 116)(parameter_profile_opt . 964))
      nil
      ((identifier_opt . 963))
      ((case_statement_alternative . 961)(case_statement_alternative_list . 962))
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(handled_sequence_of_statements . 959)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 652)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 184)(expression_opt . 957)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 956)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 954)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(handled_sequence_of_statements . 952)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 652)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      nil
      ((aliased_opt . 951))
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 949)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      ((accept_statement . 671)(delay_alternative . 672)(delay_statement . 945)(select_alternative . 947))
      nil
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 946)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      ((delay_alternative . 944)(delay_statement . 945))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 51)(exception_choice . 937)(exception_choice_list . 938)(name . 939)(qualified_expression . 54)(selected_component . 55))
      nil
      ((exception_handler . 934))
      nil
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      nil
      ((accept_statement . 1162)(delay_alternative . 1163)(delay_statement . 945))
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 1159)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      nil
      nil
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 1155)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      ((constant_opt . 1154))
      nil
      nil
      nil
      ((identifier_opt . 1150))
      ((elsif_statement_item . 1148)(elsif_statement_list . 1149))
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 1142)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 187)(selected_component . 55)(simple_expression . 459)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((case_statement_alternative . 1141))
      nil
      nil
      nil
      nil
      nil
      nil
      ((function_specification . 16)(procedure_specification . 32)(subprogram_specification . 1134))
      nil
      ((aspect_clause . 967)(at_clause . 297)(entry_body . 968)(enumeration_representation_clause . 304)(function_specification . 16)(overriding_indicator_opt . 969)(procedure_specification . 32)(protected_operation_item . 1133)(record_representation_clause . 328)(subprogram_body . 973)(subprogram_declaration . 974))
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 1131)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      ((attribute_reference . 51)(name . 1129)(qualified_expression . 54)(selected_component . 55))
      nil
      ((actual_parameter_part . 91))
      ((aggregate . 151)(attribute_reference . 51)(expression . 1127)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      ((formal_part . 116)(parameter_profile_opt . 1125))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 1124)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 1122)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 1120)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((attribute_reference . 51)(name . 1034)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      ((aspect_specification_opt . 1117))
      nil
      ((attribute_reference . 51)(name . 1116)(qualified_expression . 54)(selected_component . 55))
      ((attribute_reference . 51)(name . 737)(qualified_expression . 54)(selected_component . 55)(subtype_indication . 1115))
      nil
      ((direct_name . 1114))
      nil
      nil
      nil
      nil
      ((aspect_clause . 1010)(at_clause . 297)(component_declaration . 1011)(component_item . 1109)(enumeration_representation_clause . 304)(identifier_list . 1015)(record_representation_clause . 328)(variant_part . 1110))
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
      ((real_range_specification_opt . 1103))
      ((real_range_specification_opt . 1102))
      nil
      nil
      ((identifier_opt . 1099))
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 1098)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      nil
      nil
      nil
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 838)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_definition . 1095)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      ((actual_parameter_part . 91)(constraint . 1093)(index_constraint . 806))
      nil
      nil
      nil
      ((identifier_opt . 1092))
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 1091)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      nil
      nil
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 830)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_definition . 1088)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      nil
      nil
      nil
      nil
      ((component_clause . 1084))
      ((aggregate . 151)(attribute_reference . 51)(expression . 1082)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((actual_parameter_part . 91)(aspect_specification_opt . 1081))
      nil
      nil
      ((access_definition . 1075)(attribute_reference . 51)(component_definition . 1078)(name . 737)(null_exclusion_opt . 212)(qualified_expression . 54)(selected_component . 55)(subtype_indication . 1077))
      nil
      ((access_definition . 1075)(attribute_reference . 51)(component_definition . 1076)(name . 737)(null_exclusion_opt . 212)(qualified_expression . 54)(selected_component . 55)(subtype_indication . 1077))
      nil
      ((actual_parameter_part . 91))
      nil
      ((aggregate . 151)(attribute_reference . 51)(name . 154)(primary . 286)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      ((attribute_reference . 51)(name . 1070)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 1068)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      ((attribute_reference . 51)(name . 1231)(qualified_expression . 54)(selected_component . 55))
      nil
      ((access_definition . 1229)(attribute_reference . 51)(name . 737)(null_exclusion_opt . 212)(qualified_expression . 54)(selected_component . 55)(subtype_indication . 1230))
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
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 1225)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((attribute_reference . 51)(interface_list . 1224)(name . 798)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 830)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_definition . 1222)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      nil
      nil
      nil
      ((attribute_reference . 51)(interface_list . 1220)(name . 798)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 838)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_definition . 1218)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 1216)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 1215)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      ((enumeration_literal . 1214))
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 1213)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((access_definition . 1075)(attribute_reference . 51)(component_definition . 1212)(name . 737)(null_exclusion_opt . 212)(qualified_expression . 54)(selected_component . 55)(subtype_indication . 1077))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((and_interface_list_opt . 1209))
      ((actual_parameter_part . 91)(and_interface_list_opt . 1206)(constraint . 1207)(constraint_opt . 1208)(index_constraint . 806))
      nil
      nil
      nil
      ((aspect_specification_opt . 1203))
      nil
      ((aspect_specification_opt . 1202))
      nil
      ((aspect_specification_opt . 1201))
      ((aspect_specification_opt . 1200))
      nil
      nil
      ((attribute_reference . 51)(name . 1199)(qualified_expression . 54)(selected_component . 55))
      ((actual_parameter_part . 91))
      ((aggregate . 151)(attribute_reference . 51)(expression . 1198)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((identifier_opt . 1197))
      nil
      ((aspect_specification_opt . 128))
      ((entry_body_formal_part . 1195)(formal_part . 116)(parameter_profile_opt . 1196))
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(handled_sequence_of_statements . 1193)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 652)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(handled_sequence_of_statements . 1192)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 652)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      nil
      nil
      nil
      ((identifier_opt . 1189))
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 1188)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      ((aggregate . 151)(attribute_reference . 51)(expression . 184)(expression_opt . 1187)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      ((elsif_statement_item . 1185))
      nil
      nil
      nil
      nil
      ((access_definition . 1178)(attribute_reference . 51)(name . 737)(null_exclusion_opt . 212)(qualified_expression . 54)(return_subtype_indication . 1179)(selected_component . 55)(subtype_indication . 1180))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 1172)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      ((identifier_opt . 1171))
      ((attribute_reference . 51)(exception_choice . 1170)(name . 939)(qualified_expression . 54)(selected_component . 55))
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 1169)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      ((attribute_reference . 51)(exception_choice . 937)(exception_choice_list . 1168)(name . 939)(qualified_expression . 54)(selected_component . 55))
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
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 1266)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      nil
      nil
      nil
      nil
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 1260)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      nil
      nil
      ((identifier_list . 214)(parameter_specification . 215)(parameter_specification_list . 216))
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91))
      nil
      nil
      nil
      nil
      nil
      ((attribute_reference . 51)(interface_list . 1249)(name . 798)(qualified_expression . 54)(selected_component . 55))
      nil
      nil
      nil
      nil
      ((variant_list . 1245)(variant . 1246))
      nil
      ((aspect_specification_opt . 1243))
      nil
      nil
      nil
      ((real_range_specification_opt . 1240))
      ((identifier_opt . 1239))
      nil
      nil
      nil
      ((identifier_opt . 1236))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((actual_parameter_part . 91)(constraint . 1093)(index_constraint . 806))
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 1296)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 830)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_definition . 1295)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      nil
      nil
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 838)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_definition . 1294)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 1293)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((aggregate . 151)(attribute_reference . 51)(expression . 1292)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((aggregate . 151)(attribute_reference . 51)(choice_expression . 175)(choice_relation_and_list . 176)(choice_relation_or_list . 177)(choice_relation_xor_list . 178)(choice_relation_and_then_list . 179)(choice_relation_or_else_list . 180)(choice_relation . 181)(discrete_choice . 182)(discrete_choice_list . 1290)(factor . 153)(name . 186)(primary . 157)(qualified_expression . 54)(range . 187)(selected_component . 55)(simple_expression . 459)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      ((variant . 1289))
      nil
      nil
      ((record_definition . 1286))
      nil
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 184)(expression_opt . 1285)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      ((identifier_opt . 1283))
      ((identifier_opt . 1282))
      nil
      nil
      nil
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 1280)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(expression . 1277)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(relation_and_list . 158)(relation_and_then_list . 159)(relation_or_list . 160)(relation_or_else_list . 161)(relation_xor_list . 162)(relation . 163)(selected_component . 55)(simple_expression . 164)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      nil
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 1275)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
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
      ((aspect_specification_opt . 1303))
      nil
      nil
      nil
      nil
      ((aspect_specification_opt . 1300))
      nil
      nil
      nil
      nil
      ((aggregate . 151)(attribute_reference . 51)(factor . 153)(name . 154)(primary . 157)(qualified_expression . 54)(selected_component . 55)(simple_expression . 1317)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      ((aspect_clause . 1010)(at_clause . 297)(component_declaration . 1011)(component_item . 1012)(component_list . 1315)(enumeration_representation_clause . 304)(identifier_list . 1015)(record_representation_clause . 328)(variant_part . 1016))
      nil
      nil
      ((abstract_subprogram_declaration . 295)(aspect_clause . 296)(at_clause . 297)(body . 298)(body_stub . 299)(declaration . 300)(declarations . 301)(declarative_part_opt . 1312)(entry_declaration . 303)(enumeration_representation_clause . 304)(exception_declaration . 305)(expression_function_declaration . 306)(full_type_declaration . 307)(function_specification . 16)(generic_declaration . 308)(generic_formal_part . 18)(generic_instantiation . 309)(generic_package_declaration . 20)(generic_renaming_declaration . 310)(generic_subprogram_declaration . 22)(identifier_list . 311)(incomplete_type_declaration . 312)(null_procedure_declaration . 313)(object_declaration . 314)(object_renaming_declaration . 315)(overriding_indicator_opt . 316)(package_body . 317)(package_body_stub . 318)(package_declaration . 319)(package_renaming_declaration . 320)(package_specification . 30)(pragma . 321)(private_extension_declaration . 322)(private_type_declaration . 323)(procedure_specification . 32)(proper_body . 324)(protected_body . 325)(protected_body_stub . 326)(protected_type_declaration . 327)(record_representation_clause . 328)(renaming_declaration . 329)(single_protected_declaration . 330)(single_task_declaration . 331)(subprogram_body . 332)(subprogram_body_stub . 333)(subprogram_declaration . 334)(subprogram_renaming_declaration . 335)(subtype_declaration . 336)(task_body . 337)(task_body_stub . 338)(task_type_declaration . 339)(type_declaration . 340)(use_clause . 341))
      ((aggregate . 151)(attribute_reference . 51)(discrete_subtype_definition . 1311)(factor . 153)(name . 875)(primary . 157)(qualified_expression . 54)(range . 764)(selected_component . 55)(simple_expression . 765)(subtype_indication . 766)(term . 165)(term_list . 166)(unary_adding_operator . 167))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aspect_clause . 1010)(at_clause . 297)(component_declaration . 1011)(component_item . 1109)(enumeration_representation_clause . 304)(identifier_list . 1015)(record_representation_clause . 328)(variant_part . 1110))
      nil
      nil
      nil
      ((accept_statement . 630)(assignment_statement . 631)(asynchronous_select . 632)(attribute_reference . 51)(block_statement . 633)(case_statement . 634)(conditional_entry_call . 635)(delay_statement . 636)(exit_statement . 637)(extended_return_statement . 638)(handled_sequence_of_statements . 1322)(if_statement . 640)(iteration_scheme . 641)(label_opt . 642)(loop_statement . 643)(name . 644)(pragma . 645)(procedure_call_statement . 646)(qualified_expression . 54)(raise_statement . 647)(requeue_statement . 648)(selected_component . 55)(selective_accept . 649)(select_statement . 650)(sequence_of_statements . 651)(sequence_of_statements_opt . 652)(simple_return_statement . 653)(statement . 654)(timed_entry_call . 655))
      ((formal_part . 116)(parameter_profile_opt . 1321))
      nil
      nil
      ((identifier_opt . 1324))
      nil
      nil]))
  "Parser table.")

(provide 'ada-grammar-wy)

;; end of file
