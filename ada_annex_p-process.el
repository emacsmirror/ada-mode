;;; ada_annex_p-process.el --- Generated parser support file  -*- buffer-read-only:t lexical-binding:t -*-
;;  command line: wisitoken-bnf-generate.exe  --generate LR1 Ada_Emacs re2c PROCESS text_rep ada_annex_p.wy

;;  Copyright (C) 2013 - 2022 Free Software Foundation, Inc.

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
;;  along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

(require 'wisi-process-parse)

(defconst ada_annex_p-process-token-table
  [WHITESPACE
   NEW_LINE
   COMMENT
   GNAT_PREP_IF
   GNAT_PREP_ELSIF
   GNAT_PREP_ELSE
   GNAT_PREP_END_IF
   CONFLICT_MARK_A
   CONFLICT_MARK_B
   CONFLICT_MARK_END
   PLACEHOLDER
   AT
   RAISE
   SEPARATE
   TERMINATE
   SELECT
   UNTIL
   DELAY
   ABORT
   REQUEUE
   ACCEPT
   ENTRY
   GENERIC
   EXCEPTION
   RENAMES
   OVERRIDING
   BODY
   PRIVATE
   PACKAGE
   OUT
   RETURN
   GOTO
   EXIT
   DO
   REVERSE
   WHILE
   LOOP
   PARALLEL
   BEGIN
   DECLARE
   SOME
   ELSE
   IF
   THEN
   ELSIF
   REM
   ABS
   IN
   XOR
   OR
   USE
   FOR
   NOT
   FUNCTION
   PROCEDURE
   ALL
   ACCESS
   INTERFACE
   SYNCHRONIZED
   PROTECTED
   TASK
   WITH
   OTHERS
   WHEN
   CASE
   NULL
   END
   RECORD
   TAGGED
   OF
   ARRAY
   DELTA
   DIGITS
   MOD
   RANGE
   AND
   NEW
   LIMITED
   ABSTRACT
   CONSTANT
   ALIASED
   SUBTYPE
   IS
   TYPE
   PRAGMA
   LEFT_PAREN
   LEFT_SQUARE_BRACKET
   RIGHT_PAREN
   RIGHT_SQUARE_BRACKET
   AMPERSAND
   AT_SIGN
   BAR
   BOX
   COLON
   COLON_EQUAL
   COMMA
   DOT
   DOT_DOT
   EQUAL
   EQUAL_GREATER
   GREATER
   GREATER_EQUAL
   GREATER_GREATER
   LESS
   LESS_EQUAL
   LESS_LESS
   MINUS
   PLUS
   SEMICOLON
   SLASH
   SLASH_EQUAL
   STAR
   STAR_STAR
   TICK_1
   TICK_2
   NUMERIC_LITERAL
   IDENTIFIER
   STRING_LITERAL
   CHARACTER_LITERAL
   Wisi_EOI
   wisitoken_accept
   tick
   conditional_quantified_expression
   pragma_argument_association_list
   pragma_g
   pragma_argument_association
   basic_declaration
   type_declaration
   full_type_declaration
   type_definition
   subtype_declaration
   subtype_indication
   constraint
   scalar_constraint
   assign_value
   object_declaration
   defining_identifier_list
   number_declaration
   derived_type_definition
   range_constraint
   range_g
   enumeration_literal_list
   enumeration_type_definition
   enumeration_literal_specification
   integer_type_definition
   signed_integer_type_definition
   modular_type_definition
   real_type_definition
   floating_point_definition
   real_range_specification
   fixed_point_definition
   ordinary_fixed_point_definition
   decimal_fixed_point_definition
   digits_constraint
   array_type_definition
   index_subtype_definition_list
   unconstrained_array_definition
   index_subtype_definition
   discrete_subtype_definition_list
   constrained_array_definition
   discrete_subtype_definition
   component_definition
   index_constraint
   discrete_range
   discriminant_part
   unknown_discriminant_part
   discriminant_specification_list
   known_discriminant_part
   discriminant_specification
   record_type_definition
   record_definition
   component_list
   component_item
   component_declaration
   variant_list
   variant_part
   variant
   discrete_choice_list
   discrete_choice
   record_extension_part
   abstract_subprogram_declaration
   interface_type_definition
   interface_list
   access_type_definition
   access_to_object_definition
   general_access_modifier
   access_to_subprogram_definition
   null_exclusion
   access_definition
   incomplete_type_declaration
   declarative_item
   declarative_item_pragma
   declarative_part
   basic_declarative_item
   proper_body
   name
   direct_name
   explicit_dereference
   slice
   selected_component
   selector_name
   attribute_reference
   attribute_designator
   range_attribute_reference
   range_attribute_designator
   aggregate
   record_aggregate
   record_component_association_list
   record_component_association
   component_choice_list
   extension_aggregate
   array_aggregate
   expression_list
   positional_array_aggregate
   null_array_aggregate
   named_array_aggregate
   array_component_association_list
   array_component_association
   delta_aggregate
   record_delta_aggregate
   array_delta_aggregate
   iterated_element_association
   AND_relation_list
   AND_THEN_relation_list
   OR_relation_list
   OR_ELSE_relation_list
   XOR_relation_list
   expression
   relation
   membership_choice_list
   membership_choice
   simple_expression
   term
   factor
   primary
   relational_operator
   binary_adding_operator
   unary_adding_operator
   multiplying_operator
   conditional_expression
   elsif_expression_item
   elsif_expression_list
   if_expression
   condition
   case_expression_alternative_list
   case_expression
   case_expression_alternative
   quantified_expression
   quantifier
   declare_expression
   declare_item
   reduction_attribute_reference
   value_sequence
   reduction_attribute_designator
   reduction_specification
   qualified_expression
   allocator
   subtype_indication_paren_constraint
   subpool_specification
   sequence_of_statements
   sequence_of_statements_opt
   statement
   simple_statement
   compound_statement
   null_statement
   label
   statement_identifier
   assignment_statement
   target_name
   elsif_statement_item
   elsif_statement_list
   if_statement
   case_statement_alternative_list
   case_statement
   case_statement_alternative
   loop_statement
   iteration_scheme
   chunk_specification
   loop_parameter_specification
   iterator_filter
   iterator_specification
   loop_parameter_subtype_indication
   procedural_iterator
   iterator_parameter_specification
   identifier_opt
   label_opt
   block_statement
   statement_AND_list
   parallel_block_statement
   exit_statement
   goto_statement
   subprogram_declaration
   subprogram_specification
   procedure_specification
   function_specification
   parameter_profile
   result_profile
   parameter_and_result_profile
   parameter_specification_list
   formal_part
   parameter_specification
   mode
   global_aspect_definition
   global_aspect_element
   global_mode
   basic_global_mode
   global_set
   global_designator
   name_opt
   subprogram_body
   procedure_call_statement
   function_call
   parameter_association_list
   actual_parameter_part
   assoc_expression
   parameter_association
   simple_return_statement
   extended_return_object_declaration
   extended_return_statement
   return_subtype_indication
   null_procedure_declaration
   expression_function_declaration
   package_declaration
   basic_declarative_item_pragma
   basic_declarative_item_list
   package_specification
   package_body
   private_type_declaration
   private_extension_declaration
   overriding_indicator
   use_clause
   name_list
   use_package_clause
   use_type_clause
   renaming_declaration
   object_renaming_declaration
   exception_renaming_declaration
   package_renaming_declaration
   subprogram_renaming_declaration
   generic_renaming_declaration
   task_type_declaration
   single_task_declaration
   task_item_list
   task_definition
   task_item
   task_body
   protected_type_declaration
   single_protected_declaration
   protected_operation_declaration_list
   protected_element_declaration_list
   protected_definition
   protected_operation_declaration
   protected_element_declaration
   protected_operation_item_list
   protected_body
   protected_operation_item
   entry_declaration
   accept_statement
   entry_index
   entry_body
   entry_body_formal_part
   entry_barrier
   entry_index_specification
   requeue_statement
   delay_statement
   delay_until_statement
   delay_relative_statement
   select_statement
   guard_select
   select_alternative_list
   selective_accept
   guard
   select_alternative
   accept_alternative
   delay_alternative
   terminate_alternative
   timed_entry_call
   entry_call_alternative
   conditional_entry_call
   asynchronous_select
   triggering_alternative
   abortable_part
   abort_statement
   compilation
   compilation_unit
   with_clause
   limited_with_clause
   nonlimited_with_clause
   body_stub
   subprogram_body_stub
   package_body_stub
   task_body_stub
   protected_body_stub
   subunit
   exception_declaration
   exception_handler_list
   handled_sequence_of_statements
   exception_choice_list
   exception_handler
   choice_parameter_specification
   exception_choice
   raise_statement
   raise_expression
   generic_declaration
   generic_subprogram_declaration
   generic_package_declaration
   generic_formal_part
   generic_formal_parameter_declaration
   generic_instantiation
   formal_object_declaration
   formal_type_declaration
   formal_complete_type_declaration
   formal_incomplete_type_declaration
   formal_type_definition
   formal_private_type_definition
   formal_derived_type_definition
   formal_discrete_type_definition
   formal_signed_integer_type_definition
   formal_modular_type_definition
   formal_floating_point_definition
   formal_ordinary_fixed_point_definition
   formal_decimal_fixed_point_definition
   formal_array_type_definition
   formal_access_type_definition
   formal_interface_type_definition
   formal_subprogram_declaration
   formal_concrete_subprogram_declaration
   formal_abstract_subprogram_declaration
   subprogram_default
   default_name
   formal_package_declaration
   aspect_clause
   aspect_association
   aspect_mark_list
   aspect_specification
   aspect_mark
   aspect_definition
   attribute_definition_clause
   enumeration_representation_clause
   enumeration_aggregate
   record_representation_clause
   component_clause
   position
   first_bit
   last_bit
   extended_global_aspect_definition
   extended_global_aspect_element
   extended_global_mode
   formal_parameter_designator
   formal_parameter_set
   formal_group_designator
   dispatching_operation_set
   dispatching_operation_specifier
   delta_constraint
   at_clause
   mod_clause
   discrete_range_COMMA_list
   component_item_component_item_list
   declarative_item_pragma_list
   record_component_association_COMMA_list
   declare_item_list
   statement_statement_list
   label_list
   global_aspect_element_COMMA_list
   generic_formal_parameter_declaration_list
   term_binary_adding_operator_list
   component_clause_list
   Wisi_SOI
   ])

(defconst ada_annex_p-process-face-table
  [
   font-lock-constant-face
   font-lock-function-name-face
   font-lock-type-face
   nil
   ])

(defconst ada_annex_p-process-repair-image
  '(
   (AT . "at")
   (RAISE . "raise")
   (SEPARATE . "separate")
   (TERMINATE . "terminate")
   (SELECT . "select")
   (UNTIL . "until")
   (DELAY . "delay")
   (ABORT . "abort")
   (REQUEUE . "requeue")
   (ACCEPT . "accept")
   (ENTRY . "entry")
   (GENERIC . "generic")
   (EXCEPTION . "exception")
   (RENAMES . "renames")
   (OVERRIDING . "overriding")
   (BODY . "body")
   (PRIVATE . "private")
   (PACKAGE . "package")
   (OUT . "out")
   (RETURN . "return")
   (GOTO . "goto")
   (EXIT . "exit")
   (DO . "do")
   (REVERSE . "reverse")
   (WHILE . "while")
   (LOOP . "loop")
   (PARALLEL . "parallel")
   (BEGIN . "begin")
   (DECLARE . "declare")
   (SOME . "some")
   (ELSE . "else")
   (IF . "if")
   (THEN . "then")
   (ELSIF . "elsif")
   (REM . "rem")
   (ABS . "abs")
   (IN . "in")
   (XOR . "xor")
   (OR . "or")
   (USE . "use")
   (FOR . "for")
   (NOT . "not")
   (FUNCTION . "function")
   (PROCEDURE . "procedure")
   (ALL . "all")
   (ACCESS . "access")
   (INTERFACE . "interface")
   (SYNCHRONIZED . "synchronized")
   (PROTECTED . "protected")
   (TASK . "task")
   (WITH . "with")
   (OTHERS . "others")
   (WHEN . "when")
   (CASE . "case")
   (NULL . "null")
   (END . "end")
   (RECORD . "record")
   (TAGGED . "tagged")
   (OF . "of")
   (ARRAY . "array")
   (DELTA . "delta")
   (DIGITS . "digits")
   (MOD . "mod")
   (RANGE . "range")
   (AND . "and")
   (NEW . "new")
   (LIMITED . "limited")
   (ABSTRACT . "abstract")
   (CONSTANT . "constant")
   (ALIASED . "aliased")
   (SUBTYPE . "subtype")
   (IS . "is")
   (TYPE . "type")
   (PRAGMA . "pragma")
   (LEFT_PAREN . "(")
   (LEFT_SQUARE_BRACKET . "[")
   (RIGHT_PAREN . ")")
   (RIGHT_SQUARE_BRACKET . "]")
   (AMPERSAND . "&")
   (AT_SIGN . "@")
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
   (TICK_2 . "'")
   (NUMERIC_LITERAL . "1234567890")
   (IDENTIFIER . "A_Bogus_Identifier")
   (STRING_LITERAL . "\"\"")
   (CHARACTER_LITERAL . "' '")
   ))

(provide 'ada_annex_p-process)
