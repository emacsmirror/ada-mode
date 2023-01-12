--  generated parser support file. -*- buffer-read-only:t  -*-
--  command line: wisitoken-bnf-generate.exe  --generate LR1 Ada_Emacs re2c PROCESS text_rep ada_annex_p.wy
--

--  Copyright (C) 2013 - 2022 Free Software Foundation, Inc.

--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License as
--  published by the Free Software Foundation; either version 3, or (at
--  your option) any later version.
--
--  This software is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

with WisiToken.Syntax_Trees;
package Ada_Annex_P_Process_Actions is

   Descriptor : aliased constant WisiToken.Descriptor :=
     (First_Terminal    => 11,
      Last_Terminal       => 119,
      First_Nonterminal   => 120,
      Last_Nonterminal    => 466,
      SOI_ID              => 467,
      EOI_ID              => 119,
      Accept_ID           => 120,
      Case_Insensitive    => True,
      New_Line_ID         => 1,
      String_1_ID         => 118,
      String_2_ID         => 117,
      Image               =>
        (new String'("WHITESPACE"),
         new String'("NEW_LINE"),
         new String'("COMMENT"),
         new String'("GNAT_PREP_IF"),
         new String'("GNAT_PREP_ELSIF"),
         new String'("GNAT_PREP_ELSE"),
         new String'("GNAT_PREP_END_IF"),
         new String'("CONFLICT_MARK_A"),
         new String'("CONFLICT_MARK_B"),
         new String'("CONFLICT_MARK_END"),
         new String'("PLACEHOLDER"),
         new String'("AT"),
         new String'("RAISE"),
         new String'("SEPARATE"),
         new String'("TERMINATE"),
         new String'("SELECT"),
         new String'("UNTIL"),
         new String'("DELAY"),
         new String'("ABORT"),
         new String'("REQUEUE"),
         new String'("ACCEPT"),
         new String'("ENTRY"),
         new String'("GENERIC"),
         new String'("EXCEPTION"),
         new String'("RENAMES"),
         new String'("OVERRIDING"),
         new String'("BODY"),
         new String'("PRIVATE"),
         new String'("PACKAGE"),
         new String'("OUT"),
         new String'("RETURN"),
         new String'("GOTO"),
         new String'("EXIT"),
         new String'("DO"),
         new String'("REVERSE"),
         new String'("WHILE"),
         new String'("LOOP"),
         new String'("PARALLEL"),
         new String'("BEGIN"),
         new String'("DECLARE"),
         new String'("SOME"),
         new String'("IF"),
         new String'("ELSIF"),
         new String'("REM"),
         new String'("ABS"),
         new String'("IN"),
         new String'("XOR"),
         new String'("ELSE"),
         new String'("OR"),
         new String'("THEN"),
         new String'("USE"),
         new String'("FOR"),
         new String'("NOT"),
         new String'("FUNCTION"),
         new String'("PROCEDURE"),
         new String'("ALL"),
         new String'("ACCESS"),
         new String'("INTERFACE"),
         new String'("SYNCHRONIZED"),
         new String'("PROTECTED"),
         new String'("TASK"),
         new String'("WITH"),
         new String'("OTHERS"),
         new String'("WHEN"),
         new String'("CASE"),
         new String'("NULL"),
         new String'("END"),
         new String'("RECORD"),
         new String'("TAGGED"),
         new String'("OF"),
         new String'("ARRAY"),
         new String'("DELTA"),
         new String'("DIGITS"),
         new String'("MOD"),
         new String'("RANGE"),
         new String'("AND"),
         new String'("NEW"),
         new String'("LIMITED"),
         new String'("ABSTRACT"),
         new String'("CONSTANT"),
         new String'("ALIASED"),
         new String'("SUBTYPE"),
         new String'("IS"),
         new String'("TYPE"),
         new String'("PRAGMA"),
         new String'("LEFT_PAREN"),
         new String'("LEFT_SQUARE_BRACKET"),
         new String'("RIGHT_PAREN"),
         new String'("RIGHT_SQUARE_BRACKET"),
         new String'("AMPERSAND"),
         new String'("AT_SIGN"),
         new String'("BAR"),
         new String'("BOX"),
         new String'("COLON"),
         new String'("COLON_EQUAL"),
         new String'("COMMA"),
         new String'("DOT"),
         new String'("DOT_DOT"),
         new String'("EQUAL"),
         new String'("EQUAL_GREATER"),
         new String'("GREATER"),
         new String'("GREATER_EQUAL"),
         new String'("GREATER_GREATER"),
         new String'("LESS"),
         new String'("LESS_EQUAL"),
         new String'("LESS_LESS"),
         new String'("MINUS"),
         new String'("PLUS"),
         new String'("SEMICOLON"),
         new String'("SLASH"),
         new String'("SLASH_EQUAL"),
         new String'("STAR"),
         new String'("STAR_STAR"),
         new String'("TICK_1"),
         new String'("TICK_2"),
         new String'("NUMERIC_LITERAL"),
         new String'("IDENTIFIER"),
         new String'("STRING_LITERAL"),
         new String'("CHARACTER_LITERAL"),
         new String'("Wisi_EOI"),
         new String'("wisitoken_accept"),
         new String'("tick"),
         new String'("conditional_quantified_expression"),
         new String'("pragma_argument_association_list"),
         new String'("pragma_g"),
         new String'("pragma_argument_association"),
         new String'("basic_declaration"),
         new String'("type_declaration"),
         new String'("full_type_declaration"),
         new String'("type_definition"),
         new String'("subtype_declaration"),
         new String'("subtype_indication"),
         new String'("constraint"),
         new String'("scalar_constraint"),
         new String'("assign_value"),
         new String'("object_declaration"),
         new String'("defining_identifier_list"),
         new String'("number_declaration"),
         new String'("derived_type_definition"),
         new String'("range_constraint"),
         new String'("range_g"),
         new String'("enumeration_literal_list"),
         new String'("enumeration_type_definition"),
         new String'("enumeration_literal_specification"),
         new String'("integer_type_definition"),
         new String'("signed_integer_type_definition"),
         new String'("modular_type_definition"),
         new String'("real_type_definition"),
         new String'("floating_point_definition"),
         new String'("real_range_specification"),
         new String'("fixed_point_definition"),
         new String'("ordinary_fixed_point_definition"),
         new String'("decimal_fixed_point_definition"),
         new String'("digits_constraint"),
         new String'("array_type_definition"),
         new String'("index_subtype_definition_list"),
         new String'("unconstrained_array_definition"),
         new String'("index_subtype_definition"),
         new String'("discrete_subtype_definition_list"),
         new String'("constrained_array_definition"),
         new String'("discrete_subtype_definition"),
         new String'("component_definition"),
         new String'("index_constraint"),
         new String'("discrete_range"),
         new String'("discriminant_part"),
         new String'("unknown_discriminant_part"),
         new String'("discriminant_specification_list"),
         new String'("known_discriminant_part"),
         new String'("discriminant_specification"),
         new String'("record_type_definition"),
         new String'("record_definition"),
         new String'("component_list"),
         new String'("component_item"),
         new String'("component_declaration"),
         new String'("variant_list"),
         new String'("variant_part"),
         new String'("variant"),
         new String'("discrete_choice_list"),
         new String'("discrete_choice"),
         new String'("record_extension_part"),
         new String'("abstract_subprogram_declaration"),
         new String'("interface_type_definition"),
         new String'("interface_list"),
         new String'("access_type_definition"),
         new String'("access_to_object_definition"),
         new String'("general_access_modifier"),
         new String'("access_to_subprogram_definition"),
         new String'("null_exclusion"),
         new String'("access_definition"),
         new String'("incomplete_type_declaration"),
         new String'("declarative_item"),
         new String'("declarative_item_pragma"),
         new String'("declarative_part"),
         new String'("basic_declarative_item"),
         new String'("proper_body"),
         new String'("name"),
         new String'("direct_name"),
         new String'("explicit_dereference"),
         new String'("slice"),
         new String'("selected_component"),
         new String'("selector_name"),
         new String'("attribute_reference"),
         new String'("attribute_designator"),
         new String'("range_attribute_reference"),
         new String'("range_attribute_designator"),
         new String'("aggregate"),
         new String'("record_aggregate"),
         new String'("record_component_association_list"),
         new String'("record_component_association"),
         new String'("component_choice_list"),
         new String'("extension_aggregate"),
         new String'("array_aggregate"),
         new String'("expression_list"),
         new String'("positional_array_aggregate"),
         new String'("null_array_aggregate"),
         new String'("named_array_aggregate"),
         new String'("array_component_association_list"),
         new String'("array_component_association"),
         new String'("delta_aggregate"),
         new String'("record_delta_aggregate"),
         new String'("array_delta_aggregate"),
         new String'("iterated_element_association"),
         new String'("AND_relation_list"),
         new String'("AND_THEN_relation_list"),
         new String'("OR_relation_list"),
         new String'("OR_ELSE_relation_list"),
         new String'("XOR_relation_list"),
         new String'("expression"),
         new String'("relation"),
         new String'("membership_choice_list"),
         new String'("membership_choice"),
         new String'("simple_expression"),
         new String'("term"),
         new String'("factor"),
         new String'("primary"),
         new String'("relational_operator"),
         new String'("binary_adding_operator"),
         new String'("unary_adding_operator"),
         new String'("multiplying_operator"),
         new String'("conditional_expression"),
         new String'("elsif_expression_item"),
         new String'("elsif_expression_list"),
         new String'("if_expression"),
         new String'("condition"),
         new String'("case_expression_alternative_list"),
         new String'("case_expression"),
         new String'("case_expression_alternative"),
         new String'("quantified_expression"),
         new String'("quantifier"),
         new String'("declare_expression"),
         new String'("declare_item"),
         new String'("reduction_attribute_reference"),
         new String'("value_sequence"),
         new String'("reduction_attribute_designator"),
         new String'("reduction_specification"),
         new String'("qualified_expression"),
         new String'("allocator"),
         new String'("subtype_indication_paren_constraint"),
         new String'("subpool_specification"),
         new String'("sequence_of_statements"),
         new String'("sequence_of_statements_opt"),
         new String'("statement"),
         new String'("simple_statement"),
         new String'("compound_statement"),
         new String'("null_statement"),
         new String'("label"),
         new String'("statement_identifier"),
         new String'("assignment_statement"),
         new String'("target_name"),
         new String'("elsif_statement_item"),
         new String'("elsif_statement_list"),
         new String'("if_statement"),
         new String'("case_statement_alternative_list"),
         new String'("case_statement"),
         new String'("case_statement_alternative"),
         new String'("loop_statement"),
         new String'("iteration_scheme"),
         new String'("chunk_specification"),
         new String'("loop_parameter_specification"),
         new String'("iterator_filter"),
         new String'("iterator_specification"),
         new String'("loop_parameter_subtype_indication"),
         new String'("procedural_iterator"),
         new String'("iterator_parameter_specification"),
         new String'("identifier_opt"),
         new String'("label_opt"),
         new String'("block_statement"),
         new String'("statement_AND_list"),
         new String'("parallel_block_statement"),
         new String'("exit_statement"),
         new String'("goto_statement"),
         new String'("subprogram_declaration"),
         new String'("subprogram_specification"),
         new String'("procedure_specification"),
         new String'("function_specification"),
         new String'("parameter_profile"),
         new String'("result_profile"),
         new String'("parameter_and_result_profile"),
         new String'("parameter_specification_list"),
         new String'("formal_part"),
         new String'("parameter_specification"),
         new String'("mode"),
         new String'("global_aspect_definition"),
         new String'("global_aspect_element"),
         new String'("global_mode"),
         new String'("basic_global_mode"),
         new String'("global_set"),
         new String'("global_designator"),
         new String'("name_opt"),
         new String'("subprogram_body"),
         new String'("procedure_call_statement"),
         new String'("function_call"),
         new String'("parameter_association_list"),
         new String'("actual_parameter_part"),
         new String'("assoc_expression"),
         new String'("parameter_association"),
         new String'("simple_return_statement"),
         new String'("extended_return_object_declaration"),
         new String'("extended_return_statement"),
         new String'("return_subtype_indication"),
         new String'("null_procedure_declaration"),
         new String'("expression_function_declaration"),
         new String'("package_declaration"),
         new String'("basic_declarative_item_pragma"),
         new String'("basic_declarative_item_list"),
         new String'("package_specification"),
         new String'("package_body"),
         new String'("private_type_declaration"),
         new String'("private_extension_declaration"),
         new String'("overriding_indicator"),
         new String'("use_clause"),
         new String'("name_list"),
         new String'("use_package_clause"),
         new String'("use_type_clause"),
         new String'("renaming_declaration"),
         new String'("object_renaming_declaration"),
         new String'("exception_renaming_declaration"),
         new String'("package_renaming_declaration"),
         new String'("subprogram_renaming_declaration"),
         new String'("generic_renaming_declaration"),
         new String'("task_type_declaration"),
         new String'("single_task_declaration"),
         new String'("task_item_list"),
         new String'("task_definition"),
         new String'("task_item"),
         new String'("task_body"),
         new String'("protected_type_declaration"),
         new String'("single_protected_declaration"),
         new String'("protected_operation_declaration_list"),
         new String'("protected_element_declaration_list"),
         new String'("protected_definition"),
         new String'("protected_operation_declaration"),
         new String'("protected_element_declaration"),
         new String'("protected_operation_item_list"),
         new String'("protected_body"),
         new String'("protected_operation_item"),
         new String'("entry_declaration"),
         new String'("accept_statement"),
         new String'("entry_index"),
         new String'("entry_body"),
         new String'("entry_body_formal_part"),
         new String'("entry_barrier"),
         new String'("entry_index_specification"),
         new String'("requeue_statement"),
         new String'("delay_statement"),
         new String'("delay_until_statement"),
         new String'("delay_relative_statement"),
         new String'("select_statement"),
         new String'("guard_select"),
         new String'("select_alternative_list"),
         new String'("selective_accept"),
         new String'("guard"),
         new String'("select_alternative"),
         new String'("accept_alternative"),
         new String'("delay_alternative"),
         new String'("terminate_alternative"),
         new String'("timed_entry_call"),
         new String'("entry_call_alternative"),
         new String'("conditional_entry_call"),
         new String'("asynchronous_select"),
         new String'("triggering_alternative"),
         new String'("abortable_part"),
         new String'("abort_statement"),
         new String'("compilation"),
         new String'("compilation_unit"),
         new String'("with_clause"),
         new String'("limited_with_clause"),
         new String'("nonlimited_with_clause"),
         new String'("body_stub"),
         new String'("subprogram_body_stub"),
         new String'("package_body_stub"),
         new String'("task_body_stub"),
         new String'("protected_body_stub"),
         new String'("subunit"),
         new String'("exception_declaration"),
         new String'("exception_handler_list"),
         new String'("handled_sequence_of_statements"),
         new String'("exception_choice_list"),
         new String'("exception_handler"),
         new String'("choice_parameter_specification"),
         new String'("exception_choice"),
         new String'("raise_statement"),
         new String'("raise_expression"),
         new String'("generic_declaration"),
         new String'("generic_subprogram_declaration"),
         new String'("generic_package_declaration"),
         new String'("generic_formal_part"),
         new String'("generic_formal_parameter_declaration"),
         new String'("generic_instantiation"),
         new String'("formal_object_declaration"),
         new String'("formal_type_declaration"),
         new String'("formal_complete_type_declaration"),
         new String'("formal_incomplete_type_declaration"),
         new String'("formal_type_definition"),
         new String'("formal_private_type_definition"),
         new String'("formal_derived_type_definition"),
         new String'("formal_discrete_type_definition"),
         new String'("formal_signed_integer_type_definition"),
         new String'("formal_modular_type_definition"),
         new String'("formal_floating_point_definition"),
         new String'("formal_ordinary_fixed_point_definition"),
         new String'("formal_decimal_fixed_point_definition"),
         new String'("formal_array_type_definition"),
         new String'("formal_access_type_definition"),
         new String'("formal_interface_type_definition"),
         new String'("formal_subprogram_declaration"),
         new String'("formal_concrete_subprogram_declaration"),
         new String'("formal_abstract_subprogram_declaration"),
         new String'("subprogram_default"),
         new String'("default_name"),
         new String'("formal_package_declaration"),
         new String'("aspect_clause"),
         new String'("aspect_association"),
         new String'("aspect_mark_list"),
         new String'("aspect_specification"),
         new String'("aspect_mark"),
         new String'("aspect_definition"),
         new String'("attribute_definition_clause"),
         new String'("enumeration_representation_clause"),
         new String'("enumeration_aggregate"),
         new String'("record_representation_clause"),
         new String'("component_clause"),
         new String'("position"),
         new String'("first_bit"),
         new String'("last_bit"),
         new String'("extended_global_aspect_definition"),
         new String'("extended_global_aspect_element"),
         new String'("extended_global_mode"),
         new String'("formal_parameter_designator"),
         new String'("formal_parameter_set"),
         new String'("formal_group_designator"),
         new String'("dispatching_operation_set"),
         new String'("dispatching_operation_specifier"),
         new String'("delta_constraint"),
         new String'("at_clause"),
         new String'("mod_clause"),
         new String'("discrete_range_COMMA_list"),
         new String'("component_item_component_item_list"),
         new String'("declarative_item_pragma_list"),
         new String'("record_component_association_COMMA_list"),
         new String'("declare_item_list"),
         new String'("statement_statement_list"),
         new String'("label_list"),
         new String'("global_aspect_element_COMMA_list"),
         new String'("generic_formal_parameter_declaration_list"),
         new String'("term_binary_adding_operator_list"),
         new String'("component_clause_list"),
         new String'("Wisi_SOI")),
      Terminal_Image_Width => 20,
      Image_Width          => 41,
      Last_Lookahead       => 119);

   type Token_Enum_ID is
     (WHITESPACE_ID,
      NEW_LINE_ID,
      COMMENT_ID,
      GNAT_PREP_IF_ID,
      GNAT_PREP_ELSIF_ID,
      GNAT_PREP_ELSE_ID,
      GNAT_PREP_END_IF_ID,
      CONFLICT_MARK_A_ID,
      CONFLICT_MARK_B_ID,
      CONFLICT_MARK_END_ID,
      PLACEHOLDER_ID,
      AT_ID,
      RAISE_ID,
      SEPARATE_ID,
      TERMINATE_ID,
      SELECT_ID,
      UNTIL_ID,
      DELAY_ID,
      ABORT_ID,
      REQUEUE_ID,
      ACCEPT_ID,
      ENTRY_ID,
      GENERIC_ID,
      EXCEPTION_ID,
      RENAMES_ID,
      OVERRIDING_ID,
      BODY_ID,
      PRIVATE_ID,
      PACKAGE_ID,
      OUT_ID,
      RETURN_ID,
      GOTO_ID,
      EXIT_ID,
      DO_ID,
      REVERSE_ID,
      WHILE_ID,
      LOOP_ID,
      PARALLEL_ID,
      BEGIN_ID,
      DECLARE_ID,
      SOME_ID,
      IF_ID,
      ELSIF_ID,
      REM_ID,
      ABS_ID,
      IN_ID,
      XOR_ID,
      ELSE_ID,
      OR_ID,
      THEN_ID,
      USE_ID,
      FOR_ID,
      NOT_ID,
      FUNCTION_ID,
      PROCEDURE_ID,
      ALL_ID,
      ACCESS_ID,
      INTERFACE_ID,
      SYNCHRONIZED_ID,
      PROTECTED_ID,
      TASK_ID,
      WITH_ID,
      OTHERS_ID,
      WHEN_ID,
      CASE_ID,
      NULL_ID,
      END_ID,
      RECORD_ID,
      TAGGED_ID,
      OF_ID,
      ARRAY_ID,
      DELTA_ID,
      DIGITS_ID,
      MOD_ID,
      RANGE_ID,
      AND_ID,
      NEW_ID,
      LIMITED_ID,
      ABSTRACT_ID,
      CONSTANT_ID,
      ALIASED_ID,
      SUBTYPE_ID,
      IS_ID,
      TYPE_ID,
      PRAGMA_ID,
      LEFT_PAREN_ID,
      LEFT_SQUARE_BRACKET_ID,
      RIGHT_PAREN_ID,
      RIGHT_SQUARE_BRACKET_ID,
      AMPERSAND_ID,
      AT_SIGN_ID,
      BAR_ID,
      BOX_ID,
      COLON_ID,
      COLON_EQUAL_ID,
      COMMA_ID,
      DOT_ID,
      DOT_DOT_ID,
      EQUAL_ID,
      EQUAL_GREATER_ID,
      GREATER_ID,
      GREATER_EQUAL_ID,
      GREATER_GREATER_ID,
      LESS_ID,
      LESS_EQUAL_ID,
      LESS_LESS_ID,
      MINUS_ID,
      PLUS_ID,
      SEMICOLON_ID,
      SLASH_ID,
      SLASH_EQUAL_ID,
      STAR_ID,
      STAR_STAR_ID,
      TICK_1_ID,
      TICK_2_ID,
      NUMERIC_LITERAL_ID,
      IDENTIFIER_ID,
      STRING_LITERAL_ID,
      CHARACTER_LITERAL_ID,
      Wisi_EOI_ID,
      wisitoken_accept_ID,
      tick_ID,
      conditional_quantified_expression_ID,
      pragma_argument_association_list_ID,
      pragma_g_ID,
      pragma_argument_association_ID,
      basic_declaration_ID,
      type_declaration_ID,
      full_type_declaration_ID,
      type_definition_ID,
      subtype_declaration_ID,
      subtype_indication_ID,
      constraint_ID,
      scalar_constraint_ID,
      assign_value_ID,
      object_declaration_ID,
      defining_identifier_list_ID,
      number_declaration_ID,
      derived_type_definition_ID,
      range_constraint_ID,
      range_g_ID,
      enumeration_literal_list_ID,
      enumeration_type_definition_ID,
      enumeration_literal_specification_ID,
      integer_type_definition_ID,
      signed_integer_type_definition_ID,
      modular_type_definition_ID,
      real_type_definition_ID,
      floating_point_definition_ID,
      real_range_specification_ID,
      fixed_point_definition_ID,
      ordinary_fixed_point_definition_ID,
      decimal_fixed_point_definition_ID,
      digits_constraint_ID,
      array_type_definition_ID,
      index_subtype_definition_list_ID,
      unconstrained_array_definition_ID,
      index_subtype_definition_ID,
      discrete_subtype_definition_list_ID,
      constrained_array_definition_ID,
      discrete_subtype_definition_ID,
      component_definition_ID,
      index_constraint_ID,
      discrete_range_ID,
      discriminant_part_ID,
      unknown_discriminant_part_ID,
      discriminant_specification_list_ID,
      known_discriminant_part_ID,
      discriminant_specification_ID,
      record_type_definition_ID,
      record_definition_ID,
      component_list_ID,
      component_item_ID,
      component_declaration_ID,
      variant_list_ID,
      variant_part_ID,
      variant_ID,
      discrete_choice_list_ID,
      discrete_choice_ID,
      record_extension_part_ID,
      abstract_subprogram_declaration_ID,
      interface_type_definition_ID,
      interface_list_ID,
      access_type_definition_ID,
      access_to_object_definition_ID,
      general_access_modifier_ID,
      access_to_subprogram_definition_ID,
      null_exclusion_ID,
      access_definition_ID,
      incomplete_type_declaration_ID,
      declarative_item_ID,
      declarative_item_pragma_ID,
      declarative_part_ID,
      basic_declarative_item_ID,
      proper_body_ID,
      name_ID,
      direct_name_ID,
      explicit_dereference_ID,
      slice_ID,
      selected_component_ID,
      selector_name_ID,
      attribute_reference_ID,
      attribute_designator_ID,
      range_attribute_reference_ID,
      range_attribute_designator_ID,
      aggregate_ID,
      record_aggregate_ID,
      record_component_association_list_ID,
      record_component_association_ID,
      component_choice_list_ID,
      extension_aggregate_ID,
      array_aggregate_ID,
      expression_list_ID,
      positional_array_aggregate_ID,
      null_array_aggregate_ID,
      named_array_aggregate_ID,
      array_component_association_list_ID,
      array_component_association_ID,
      delta_aggregate_ID,
      record_delta_aggregate_ID,
      array_delta_aggregate_ID,
      iterated_element_association_ID,
      AND_relation_list_ID,
      AND_THEN_relation_list_ID,
      OR_relation_list_ID,
      OR_ELSE_relation_list_ID,
      XOR_relation_list_ID,
      expression_ID,
      relation_ID,
      membership_choice_list_ID,
      membership_choice_ID,
      simple_expression_ID,
      term_ID,
      factor_ID,
      primary_ID,
      relational_operator_ID,
      binary_adding_operator_ID,
      unary_adding_operator_ID,
      multiplying_operator_ID,
      conditional_expression_ID,
      elsif_expression_item_ID,
      elsif_expression_list_ID,
      if_expression_ID,
      condition_ID,
      case_expression_alternative_list_ID,
      case_expression_ID,
      case_expression_alternative_ID,
      quantified_expression_ID,
      quantifier_ID,
      declare_expression_ID,
      declare_item_ID,
      reduction_attribute_reference_ID,
      value_sequence_ID,
      reduction_attribute_designator_ID,
      reduction_specification_ID,
      qualified_expression_ID,
      allocator_ID,
      subtype_indication_paren_constraint_ID,
      subpool_specification_ID,
      sequence_of_statements_ID,
      sequence_of_statements_opt_ID,
      statement_ID,
      simple_statement_ID,
      compound_statement_ID,
      null_statement_ID,
      label_ID,
      statement_identifier_ID,
      assignment_statement_ID,
      target_name_ID,
      elsif_statement_item_ID,
      elsif_statement_list_ID,
      if_statement_ID,
      case_statement_alternative_list_ID,
      case_statement_ID,
      case_statement_alternative_ID,
      loop_statement_ID,
      iteration_scheme_ID,
      chunk_specification_ID,
      loop_parameter_specification_ID,
      iterator_filter_ID,
      iterator_specification_ID,
      loop_parameter_subtype_indication_ID,
      procedural_iterator_ID,
      iterator_parameter_specification_ID,
      identifier_opt_ID,
      label_opt_ID,
      block_statement_ID,
      statement_AND_list_ID,
      parallel_block_statement_ID,
      exit_statement_ID,
      goto_statement_ID,
      subprogram_declaration_ID,
      subprogram_specification_ID,
      procedure_specification_ID,
      function_specification_ID,
      parameter_profile_ID,
      result_profile_ID,
      parameter_and_result_profile_ID,
      parameter_specification_list_ID,
      formal_part_ID,
      parameter_specification_ID,
      mode_ID,
      global_aspect_definition_ID,
      global_aspect_element_ID,
      global_mode_ID,
      basic_global_mode_ID,
      global_set_ID,
      global_designator_ID,
      name_opt_ID,
      subprogram_body_ID,
      procedure_call_statement_ID,
      function_call_ID,
      parameter_association_list_ID,
      actual_parameter_part_ID,
      assoc_expression_ID,
      parameter_association_ID,
      simple_return_statement_ID,
      extended_return_object_declaration_ID,
      extended_return_statement_ID,
      return_subtype_indication_ID,
      null_procedure_declaration_ID,
      expression_function_declaration_ID,
      package_declaration_ID,
      basic_declarative_item_pragma_ID,
      basic_declarative_item_list_ID,
      package_specification_ID,
      package_body_ID,
      private_type_declaration_ID,
      private_extension_declaration_ID,
      overriding_indicator_ID,
      use_clause_ID,
      name_list_ID,
      use_package_clause_ID,
      use_type_clause_ID,
      renaming_declaration_ID,
      object_renaming_declaration_ID,
      exception_renaming_declaration_ID,
      package_renaming_declaration_ID,
      subprogram_renaming_declaration_ID,
      generic_renaming_declaration_ID,
      task_type_declaration_ID,
      single_task_declaration_ID,
      task_item_list_ID,
      task_definition_ID,
      task_item_ID,
      task_body_ID,
      protected_type_declaration_ID,
      single_protected_declaration_ID,
      protected_operation_declaration_list_ID,
      protected_element_declaration_list_ID,
      protected_definition_ID,
      protected_operation_declaration_ID,
      protected_element_declaration_ID,
      protected_operation_item_list_ID,
      protected_body_ID,
      protected_operation_item_ID,
      entry_declaration_ID,
      accept_statement_ID,
      entry_index_ID,
      entry_body_ID,
      entry_body_formal_part_ID,
      entry_barrier_ID,
      entry_index_specification_ID,
      requeue_statement_ID,
      delay_statement_ID,
      delay_until_statement_ID,
      delay_relative_statement_ID,
      select_statement_ID,
      guard_select_ID,
      select_alternative_list_ID,
      selective_accept_ID,
      guard_ID,
      select_alternative_ID,
      accept_alternative_ID,
      delay_alternative_ID,
      terminate_alternative_ID,
      timed_entry_call_ID,
      entry_call_alternative_ID,
      conditional_entry_call_ID,
      asynchronous_select_ID,
      triggering_alternative_ID,
      abortable_part_ID,
      abort_statement_ID,
      compilation_ID,
      compilation_unit_ID,
      with_clause_ID,
      limited_with_clause_ID,
      nonlimited_with_clause_ID,
      body_stub_ID,
      subprogram_body_stub_ID,
      package_body_stub_ID,
      task_body_stub_ID,
      protected_body_stub_ID,
      subunit_ID,
      exception_declaration_ID,
      exception_handler_list_ID,
      handled_sequence_of_statements_ID,
      exception_choice_list_ID,
      exception_handler_ID,
      choice_parameter_specification_ID,
      exception_choice_ID,
      raise_statement_ID,
      raise_expression_ID,
      generic_declaration_ID,
      generic_subprogram_declaration_ID,
      generic_package_declaration_ID,
      generic_formal_part_ID,
      generic_formal_parameter_declaration_ID,
      generic_instantiation_ID,
      formal_object_declaration_ID,
      formal_type_declaration_ID,
      formal_complete_type_declaration_ID,
      formal_incomplete_type_declaration_ID,
      formal_type_definition_ID,
      formal_private_type_definition_ID,
      formal_derived_type_definition_ID,
      formal_discrete_type_definition_ID,
      formal_signed_integer_type_definition_ID,
      formal_modular_type_definition_ID,
      formal_floating_point_definition_ID,
      formal_ordinary_fixed_point_definition_ID,
      formal_decimal_fixed_point_definition_ID,
      formal_array_type_definition_ID,
      formal_access_type_definition_ID,
      formal_interface_type_definition_ID,
      formal_subprogram_declaration_ID,
      formal_concrete_subprogram_declaration_ID,
      formal_abstract_subprogram_declaration_ID,
      subprogram_default_ID,
      default_name_ID,
      formal_package_declaration_ID,
      aspect_clause_ID,
      aspect_association_ID,
      aspect_mark_list_ID,
      aspect_specification_ID,
      aspect_mark_ID,
      aspect_definition_ID,
      attribute_definition_clause_ID,
      enumeration_representation_clause_ID,
      enumeration_aggregate_ID,
      record_representation_clause_ID,
      component_clause_ID,
      position_ID,
      first_bit_ID,
      last_bit_ID,
      extended_global_aspect_definition_ID,
      extended_global_aspect_element_ID,
      extended_global_mode_ID,
      formal_parameter_designator_ID,
      formal_parameter_set_ID,
      formal_group_designator_ID,
      dispatching_operation_set_ID,
      dispatching_operation_specifier_ID,
      delta_constraint_ID,
      at_clause_ID,
      mod_clause_ID,
      discrete_range_COMMA_list_ID,
      component_item_component_item_list_ID,
      declarative_item_pragma_list_ID,
      record_component_association_COMMA_list_ID,
      declare_item_list_ID,
      statement_statement_list_ID,
      label_list_ID,
      global_aspect_element_COMMA_list_ID,
      generic_formal_parameter_declaration_list_ID,
      term_binary_adding_operator_list_ID,
      component_clause_list_ID,
      Wisi_SOI_ID);

   type Token_Enum_ID_Array is array (Positive range <>) of Token_Enum_ID;
   use all type WisiToken.Token_ID;
   function "+" (Item : in Token_Enum_ID) return WisiToken.Token_ID
     is (WisiToken.Token_ID'First + Token_Enum_ID'Pos (Item));
   function To_Token_Enum (Item : in WisiToken.Token_ID) return Token_Enum_ID
     is (Token_Enum_ID'Val (Item - WisiToken.Token_ID'First));
   function "-" (Item : in WisiToken.Token_ID) return Token_Enum_ID renames To_Token_Enum;

   procedure pragma_argument_association_list_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure pragma_argument_association_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure pragma_g_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure pragma_g_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure pragma_g_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure pragma_g_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure full_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure full_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure full_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure full_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subtype_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subtype_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_12
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_13
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_14
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_15
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_16
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_17
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_18
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_19
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_20
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_21
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_22
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_23
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_24
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_25
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_26
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_27
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_28
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_29
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_30
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_31
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_32
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_33
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_34
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_35
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_36
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_37
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_38
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_39
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_40
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_41
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_42
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_43
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_44
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_45
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_46
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_declaration_47
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure defining_identifier_list_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure defining_identifier_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure number_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure enumeration_type_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure integer_type_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure integer_type_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure unconstrained_array_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure constrained_array_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure discrete_range_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure discrete_range_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure known_discriminant_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure discriminant_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure discriminant_specification_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure discriminant_specification_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure discriminant_specification_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure discriminant_specification_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure discriminant_specification_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure component_list_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure component_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure component_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure component_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure component_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure variant_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure variant_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure variant_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure discrete_choice_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure discrete_choice_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure discrete_choice_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_extension_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure abstract_subprogram_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure abstract_subprogram_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure abstract_subprogram_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure abstract_subprogram_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure interface_list_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure interface_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_to_subprogram_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_to_subprogram_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_definition_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_definition_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_definition_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_definition_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_definition_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_definition_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_definition_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_definition_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_definition_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure access_definition_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure incomplete_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure incomplete_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure incomplete_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure incomplete_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure direct_name_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure slice_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure selected_component_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure range_attribute_designator_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure range_attribute_designator_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure aggregate_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure aggregate_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure aggregate_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_aggregate_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_component_association_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_component_association_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure component_choice_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure extension_aggregate_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure expression_list_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure expression_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure positional_array_aggregate_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure positional_array_aggregate_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure positional_array_aggregate_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure positional_array_aggregate_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure named_array_aggregate_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure named_array_aggregate_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure array_component_association_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_delta_aggregate_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure array_delta_aggregate_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure array_delta_aggregate_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iterated_element_association_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iterated_element_association_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iterated_element_association_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iterated_element_association_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure membership_choice_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure membership_choice_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure primary_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure primary_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure elsif_expression_item_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure elsif_expression_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure if_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure if_expression_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure if_expression_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure if_expression_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure case_expression_alternative_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure case_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure case_expression_alternative_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure quantified_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure quantified_expression_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure declare_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure declare_expression_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure reduction_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure qualified_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subtype_indication_paren_constraint_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subtype_indication_paren_constraint_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure null_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure label_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure assignment_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure elsif_statement_item_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure if_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure if_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure if_statement_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure if_statement_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure case_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure case_statement_alternative_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure loop_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure loop_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iteration_scheme_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iteration_scheme_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iteration_scheme_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iteration_scheme_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iteration_scheme_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iteration_scheme_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iteration_scheme_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iteration_scheme_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure iteration_scheme_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure chunk_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure chunk_specification_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure block_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure block_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure statement_AND_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parallel_block_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure exit_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure exit_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure exit_statement_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure exit_statement_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure goto_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure procedure_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure function_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure result_profile_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure result_profile_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure result_profile_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_and_result_profile_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_specification_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_specification_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_specification_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_specification_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_specification_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_specification_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_specification_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_specification_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_specification_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_body_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_body_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_body_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_body_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure procedure_call_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure function_call_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure actual_parameter_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure actual_parameter_part_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure actual_parameter_part_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure actual_parameter_part_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure assoc_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_association_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure parameter_association_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure simple_return_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure simple_return_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure extended_return_object_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure extended_return_object_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure extended_return_object_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure extended_return_object_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure extended_return_object_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure extended_return_object_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure extended_return_object_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure extended_return_object_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure extended_return_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure extended_return_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure null_procedure_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure null_procedure_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure null_procedure_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure null_procedure_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure expression_function_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure expression_function_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure expression_function_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure expression_function_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_specification_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_specification_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_specification_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_specification_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_specification_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_specification_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_specification_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_specification_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_specification_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_specification_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_specification_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_body_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_body_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_body_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_body_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_12
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_13
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_14
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_15
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_16
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_17
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_18
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_19
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_20
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_21
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_22
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_type_declaration_23
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_12
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_13
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_14
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_15
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_16
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_17
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_18
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_19
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_20
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_21
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_22
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_23
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_24
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_25
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_26
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_27
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_28
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_29
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_30
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_31
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_32
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_33
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_34
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_35
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_36
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_37
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_38
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_39
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_40
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_41
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_42
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_43
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_44
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_45
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_46
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure private_extension_declaration_47
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure overriding_indicator_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure overriding_indicator_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure use_package_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure use_type_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure use_type_clause_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_renaming_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_renaming_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_renaming_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_renaming_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_renaming_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_renaming_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_renaming_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure object_renaming_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure exception_renaming_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure exception_renaming_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_renaming_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_renaming_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_renaming_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_renaming_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_renaming_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_renaming_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_renaming_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_renaming_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_renaming_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_renaming_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_renaming_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_renaming_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_type_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_type_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_type_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_type_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_type_declaration_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_type_declaration_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_type_declaration_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_type_declaration_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure single_task_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure single_task_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure single_task_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure single_task_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure single_task_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure single_task_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_body_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_body_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_type_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_type_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_type_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_type_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure single_protected_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure single_protected_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure single_protected_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure single_protected_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_definition_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_definition_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_definition_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_definition_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_definition_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_definition_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_definition_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_definition_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_definition_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_definition_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_body_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_body_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_body_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_body_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure accept_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure accept_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure accept_statement_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure accept_statement_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_body_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_body_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_body_formal_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_body_formal_part_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure entry_barrier_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure requeue_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure requeue_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure delay_until_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure delay_relative_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure guard_select_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure select_alternative_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure selective_accept_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure selective_accept_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure guard_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure terminate_alternative_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure timed_entry_call_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure conditional_entry_call_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure asynchronous_select_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure abort_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure compilation_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure compilation_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure compilation_unit_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure compilation_unit_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure limited_with_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure limited_with_clause_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure nonlimited_with_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure nonlimited_with_clause_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_body_stub_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_body_stub_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_body_stub_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subprogram_body_stub_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_body_stub_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure package_body_stub_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_body_stub_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure task_body_stub_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_body_stub_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure protected_body_stub_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure subunit_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure exception_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure exception_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure exception_handler_list_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure handled_sequence_of_statements_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure handled_sequence_of_statements_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure exception_handler_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure exception_handler_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure raise_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure raise_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure raise_statement_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure raise_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure raise_expression_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_subprogram_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_subprogram_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_package_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_formal_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_formal_part_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_instantiation_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_instantiation_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_instantiation_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_instantiation_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_instantiation_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_instantiation_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_instantiation_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_instantiation_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_instantiation_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure generic_instantiation_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_object_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_object_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_object_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_object_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_object_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_object_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_object_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_object_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_object_declaration_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_object_declaration_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_object_declaration_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_object_declaration_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_complete_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_complete_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_complete_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_complete_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_complete_type_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_complete_type_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_complete_type_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_complete_type_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_incomplete_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_incomplete_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_incomplete_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_incomplete_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_incomplete_type_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_incomplete_type_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_incomplete_type_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_incomplete_type_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_12
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_13
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_14
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_15
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_16
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_derived_type_definition_17
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_concrete_subprogram_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_concrete_subprogram_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_concrete_subprogram_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_concrete_subprogram_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_abstract_subprogram_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_abstract_subprogram_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_abstract_subprogram_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_abstract_subprogram_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure default_name_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_package_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure formal_package_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure aspect_association_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure aspect_association_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure aspect_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure attribute_definition_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure enumeration_representation_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_representation_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_representation_clause_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_representation_clause_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_representation_clause_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_representation_clause_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_representation_clause_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_representation_clause_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure record_representation_clause_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure component_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure delta_constraint_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure delta_constraint_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   procedure at_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access);
   function name_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function name_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function direct_name_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function direct_name_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function selected_component_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function loop_statement_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function loop_statement_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function label_opt_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function block_statement_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function block_statement_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function subprogram_specification_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function subprogram_specification_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function procedure_specification_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function function_specification_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function name_opt_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function subprogram_body_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function subprogram_body_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function subprogram_body_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function subprogram_body_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_specification_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_specification_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_specification_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_specification_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_specification_4_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_specification_5_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_specification_6_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_specification_7_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_specification_8_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_specification_9_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_specification_10_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_specification_11_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_body_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_body_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_body_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function package_body_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function task_type_declaration_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function task_type_declaration_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function task_type_declaration_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function task_type_declaration_4_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function task_type_declaration_6_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function task_type_declaration_7_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function task_type_declaration_9_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function task_type_declaration_10_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function single_task_declaration_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function single_task_declaration_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function single_task_declaration_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function single_task_declaration_4_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function task_definition_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function task_definition_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function task_body_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function task_body_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_type_declaration_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_type_declaration_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_type_declaration_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_type_declaration_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_type_declaration_4_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_type_declaration_5_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_type_declaration_6_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_type_declaration_7_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function single_protected_declaration_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function single_protected_declaration_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function single_protected_declaration_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function single_protected_declaration_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_definition_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_definition_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_definition_4_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_definition_6_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_definition_8_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_definition_10_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_body_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_body_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_body_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function protected_body_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function accept_statement_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function accept_statement_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function entry_body_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function entry_body_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   function compilation_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status;
   Partial_Parse_Active    : aliased Boolean := False;
   Partial_Parse_Byte_Goal : aliased WisiToken.Buffer_Pos := WisiToken.Buffer_Pos'Last;
end Ada_Annex_P_Process_Actions;
