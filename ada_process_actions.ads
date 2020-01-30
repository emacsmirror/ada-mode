--  generated parser support file.
--  command line: wisitoken-bnf-generate.exe  --generate LR1 Ada_Emacs re2c PROCESS text_rep ada.wy
--

--  Copyright (C) 2013 - 2019 Free Software Foundation, Inc.

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
--  along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

with WisiToken.Syntax_Trees;
with WisiToken.Lexer;
with WisiToken.Semantic_Checks;
package Ada_Process_Actions is

   Descriptor : aliased WisiToken.Descriptor :=
     (First_Terminal    => 3,
      Last_Terminal     => 108,
      First_Nonterminal => 109,
      Last_Nonterminal  => 333,
      EOI_ID            => 108,
      Accept_ID         => 109,
      Case_Insensitive  => True,
      New_Line_ID       => 1,
      String_1_ID       => 107,
      String_2_ID       => 106,
      Image             =>
        (new String'("WHITESPACE"),
         new String'("NEW_LINE"),
         new String'("COMMENT"),
         new String'("ABS"),
         new String'("ACCEPT"),
         new String'("ABORT"),
         new String'("ABSTRACT"),
         new String'("ACCESS"),
         new String'("ALIASED"),
         new String'("ALL"),
         new String'("AND"),
         new String'("ARRAY"),
         new String'("AT"),
         new String'("BEGIN"),
         new String'("BODY"),
         new String'("CASE"),
         new String'("CONSTANT"),
         new String'("DECLARE"),
         new String'("DELAY"),
         new String'("DELTA"),
         new String'("DIGITS"),
         new String'("DO"),
         new String'("ELSE"),
         new String'("ELSIF"),
         new String'("END"),
         new String'("ENTRY"),
         new String'("EXCEPTION"),
         new String'("EXIT"),
         new String'("FOR"),
         new String'("FUNCTION"),
         new String'("GENERIC"),
         new String'("GOTO"),
         new String'("IF"),
         new String'("IN"),
         new String'("INTERFACE"),
         new String'("IS"),
         new String'("LIMITED"),
         new String'("LOOP"),
         new String'("MOD"),
         new String'("NEW"),
         new String'("NOT"),
         new String'("NULL"),
         new String'("OF"),
         new String'("OR"),
         new String'("OTHERS"),
         new String'("OUT"),
         new String'("OVERRIDING"),
         new String'("PACKAGE"),
         new String'("PRAGMA"),
         new String'("PRIVATE"),
         new String'("PROCEDURE"),
         new String'("PROTECTED"),
         new String'("RAISE"),
         new String'("RANGE"),
         new String'("RECORD"),
         new String'("REM"),
         new String'("RENAMES"),
         new String'("REQUEUE"),
         new String'("RETURN"),
         new String'("REVERSE"),
         new String'("SEPARATE"),
         new String'("SELECT"),
         new String'("SOME"),
         new String'("SUBTYPE"),
         new String'("SYNCHRONIZED"),
         new String'("TAGGED"),
         new String'("TASK"),
         new String'("TERMINATE"),
         new String'("THEN"),
         new String'("TYPE"),
         new String'("UNTIL"),
         new String'("USE"),
         new String'("WHEN"),
         new String'("WHILE"),
         new String'("WITH"),
         new String'("XOR"),
         new String'("LEFT_PAREN"),
         new String'("RIGHT_PAREN"),
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
         new String'("abstract_limited_synchronized_opt"),
         new String'("abstract_limited_opt"),
         new String'("abstract_tagged_limited_opt"),
         new String'("abstract_subprogram_declaration"),
         new String'("accept_statement"),
         new String'("access_definition"),
         new String'("actual_parameter_part"),
         new String'("actual_parameter_part_opt"),
         new String'("aggregate"),
         new String'("aliased_opt"),
         new String'("and_interface_list_opt"),
         new String'("array_type_definition"),
         new String'("aspect_clause"),
         new String'("aspect_specification_opt"),
         new String'("assignment_statement"),
         new String'("association_opt"),
         new String'("association_list"),
         new String'("asynchronous_select"),
         new String'("at_clause"),
         new String'("attribute_reference"),
         new String'("attribute_designator"),
         new String'("binary_adding_operator"),
         new String'("block_label"),
         new String'("block_label_opt"),
         new String'("block_statement"),
         new String'("body_g"),
         new String'("body_stub"),
         new String'("case_expression"),
         new String'("case_expression_alternative"),
         new String'("case_expression_alternative_list"),
         new String'("case_statement"),
         new String'("case_statement_alternative"),
         new String'("case_statement_alternative_list"),
         new String'("compilation_unit"),
         new String'("compilation_unit_list"),
         new String'("component_clause"),
         new String'("component_clause_list"),
         new String'("component_declaration"),
         new String'("component_definition"),
         new String'("component_item"),
         new String'("component_list"),
         new String'("component_list_opt"),
         new String'("compound_statement"),
         new String'("conditional_entry_call"),
         new String'("conditional_quantified_expression"),
         new String'("constant_opt"),
         new String'("constraint"),
         new String'("constraint_opt"),
         new String'("declaration"),
         new String'("declarations"),
         new String'("declarative_part_opt"),
         new String'("delay_alternative"),
         new String'("delay_statement"),
         new String'("derived_type_definition"),
         new String'("direct_name"),
         new String'("direct_name_opt"),
         new String'("discrete_choice"),
         new String'("discrete_choice_list"),
         new String'("discrete_subtype_definition"),
         new String'("discrete_subtype_definition_list"),
         new String'("discriminant_part_opt"),
         new String'("discriminant_specification_opt"),
         new String'("discriminant_specification_list"),
         new String'("elsif_expression_item"),
         new String'("elsif_expression_list"),
         new String'("elsif_statement_item"),
         new String'("elsif_statement_list"),
         new String'("entry_body"),
         new String'("entry_body_formal_part"),
         new String'("entry_call_alternative"),
         new String'("entry_declaration"),
         new String'("enumeration_literal"),
         new String'("enumeration_literal_list"),
         new String'("enumeration_representation_clause"),
         new String'("enumeration_type_definition"),
         new String'("exception_choice"),
         new String'("exception_choice_list"),
         new String'("exception_declaration"),
         new String'("exception_handler"),
         new String'("exception_handler_list"),
         new String'("exception_handler_list_opt"),
         new String'("exit_statement"),
         new String'("expression"),
         new String'("expression_opt"),
         new String'("expression_function_declaration"),
         new String'("extended_return_object_declaration"),
         new String'("extended_return_object_declaration_opt"),
         new String'("extended_return_statement"),
         new String'("factor"),
         new String'("formal_object_declaration"),
         new String'("formal_part"),
         new String'("formal_subprogram_declaration"),
         new String'("formal_type_declaration"),
         new String'("formal_type_definition"),
         new String'("formal_derived_type_definition"),
         new String'("formal_package_declaration"),
         new String'("formal_package_actual_part"),
         new String'("full_type_declaration"),
         new String'("function_specification"),
         new String'("general_access_modifier_opt"),
         new String'("generic_declaration"),
         new String'("generic_formal_part"),
         new String'("generic_formal_parameter_declarations"),
         new String'("generic_formal_parameter_declaration"),
         new String'("generic_instantiation"),
         new String'("generic_package_declaration"),
         new String'("generic_renaming_declaration"),
         new String'("generic_subprogram_declaration"),
         new String'("goto_label"),
         new String'("handled_sequence_of_statements"),
         new String'("identifier_list"),
         new String'("identifier_opt"),
         new String'("if_expression"),
         new String'("if_statement"),
         new String'("incomplete_type_declaration"),
         new String'("index_constraint"),
         new String'("index_subtype_definition"),
         new String'("index_subtype_definition_list"),
         new String'("interface_list"),
         new String'("interface_type_definition"),
         new String'("iteration_scheme"),
         new String'("iterator_specification"),
         new String'("iterator_specification_opt"),
         new String'("loop_statement"),
         new String'("membership_choice_list"),
         new String'("membership_choice"),
         new String'("mod_clause_opt"),
         new String'("mode_opt"),
         new String'("multiplying_operator"),
         new String'("name_list"),
         new String'("name"),
         new String'("name_opt"),
         new String'("null_exclusion_opt"),
         new String'("null_exclusion_opt_name_type"),
         new String'("null_procedure_declaration"),
         new String'("object_declaration"),
         new String'("object_renaming_declaration"),
         new String'("overriding_indicator_opt"),
         new String'("package_body"),
         new String'("package_body_stub"),
         new String'("package_declaration"),
         new String'("package_renaming_declaration"),
         new String'("package_specification"),
         new String'("parameter_and_result_profile"),
         new String'("parameter_profile_opt"),
         new String'("parameter_specification"),
         new String'("parameter_specification_list"),
         new String'("paren_expression"),
         new String'("pragma_g"),
         new String'("primary"),
         new String'("private_extension_declaration"),
         new String'("private_type_declaration"),
         new String'("procedure_call_statement"),
         new String'("procedure_specification"),
         new String'("proper_body"),
         new String'("protected_body"),
         new String'("protected_body_stub"),
         new String'("protected_definition"),
         new String'("protected_operation_item"),
         new String'("protected_operation_item_list"),
         new String'("protected_operation_item_list_opt"),
         new String'("protected_opt"),
         new String'("protected_type_declaration"),
         new String'("qualified_expression"),
         new String'("quantified_expression"),
         new String'("quantifier"),
         new String'("raise_expression"),
         new String'("raise_statement"),
         new String'("range_g"),
         new String'("range_list"),
         new String'("real_range_specification_opt"),
         new String'("record_definition"),
         new String'("record_representation_clause"),
         new String'("relation_and_list"),
         new String'("relation_and_then_list"),
         new String'("relation_or_list"),
         new String'("relation_or_else_list"),
         new String'("relation_xor_list"),
         new String'("relation"),
         new String'("relational_operator"),
         new String'("renaming_declaration"),
         new String'("requeue_statement"),
         new String'("result_profile"),
         new String'("return_subtype_indication"),
         new String'("selected_component"),
         new String'("selective_accept"),
         new String'("select_alternative"),
         new String'("select_alternative_list"),
         new String'("select_alternative_list_opt"),
         new String'("select_statement"),
         new String'("sequence_of_statements"),
         new String'("sequence_of_statements_opt"),
         new String'("simple_expression"),
         new String'("simple_return_statement"),
         new String'("simple_statement"),
         new String'("single_protected_declaration"),
         new String'("single_task_declaration"),
         new String'("statement"),
         new String'("subprogram_body"),
         new String'("subprogram_body_stub"),
         new String'("subprogram_declaration"),
         new String'("subprogram_default"),
         new String'("subprogram_renaming_declaration"),
         new String'("subprogram_specification"),
         new String'("subtype_declaration"),
         new String'("subtype_indication"),
         new String'("subunit"),
         new String'("task_body"),
         new String'("task_body_stub"),
         new String'("task_definition"),
         new String'("task_type_declaration"),
         new String'("term"),
         new String'("term_list"),
         new String'("tick"),
         new String'("timed_entry_call"),
         new String'("triggering_alternative"),
         new String'("type_declaration"),
         new String'("type_definition"),
         new String'("variant_part"),
         new String'("variant_list"),
         new String'("variant"),
         new String'("unary_adding_operator"),
         new String'("use_clause"),
         new String'("with_clause")),
      Terminal_Image_Width => 17,
      Image_Width          => 38,
      Last_Lookahead       => 108);

   type Token_Enum_ID is
     (WHITESPACE_ID,
      NEW_LINE_ID,
      COMMENT_ID,
      ABS_ID,
      ACCEPT_ID,
      ABORT_ID,
      ABSTRACT_ID,
      ACCESS_ID,
      ALIASED_ID,
      ALL_ID,
      AND_ID,
      ARRAY_ID,
      AT_ID,
      BEGIN_ID,
      BODY_ID,
      CASE_ID,
      CONSTANT_ID,
      DECLARE_ID,
      DELAY_ID,
      DELTA_ID,
      DIGITS_ID,
      DO_ID,
      ELSE_ID,
      ELSIF_ID,
      END_ID,
      ENTRY_ID,
      EXCEPTION_ID,
      EXIT_ID,
      FOR_ID,
      FUNCTION_ID,
      GENERIC_ID,
      GOTO_ID,
      IF_ID,
      IN_ID,
      INTERFACE_ID,
      IS_ID,
      LIMITED_ID,
      LOOP_ID,
      MOD_ID,
      NEW_ID,
      NOT_ID,
      NULL_ID,
      OF_ID,
      OR_ID,
      OTHERS_ID,
      OUT_ID,
      OVERRIDING_ID,
      PACKAGE_ID,
      PRAGMA_ID,
      PRIVATE_ID,
      PROCEDURE_ID,
      PROTECTED_ID,
      RAISE_ID,
      RANGE_ID,
      RECORD_ID,
      REM_ID,
      RENAMES_ID,
      REQUEUE_ID,
      RETURN_ID,
      REVERSE_ID,
      SEPARATE_ID,
      SELECT_ID,
      SOME_ID,
      SUBTYPE_ID,
      SYNCHRONIZED_ID,
      TAGGED_ID,
      TASK_ID,
      TERMINATE_ID,
      THEN_ID,
      TYPE_ID,
      UNTIL_ID,
      USE_ID,
      WHEN_ID,
      WHILE_ID,
      WITH_ID,
      XOR_ID,
      LEFT_PAREN_ID,
      RIGHT_PAREN_ID,
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
      abstract_limited_synchronized_opt_ID,
      abstract_limited_opt_ID,
      abstract_tagged_limited_opt_ID,
      abstract_subprogram_declaration_ID,
      accept_statement_ID,
      access_definition_ID,
      actual_parameter_part_ID,
      actual_parameter_part_opt_ID,
      aggregate_ID,
      aliased_opt_ID,
      and_interface_list_opt_ID,
      array_type_definition_ID,
      aspect_clause_ID,
      aspect_specification_opt_ID,
      assignment_statement_ID,
      association_opt_ID,
      association_list_ID,
      asynchronous_select_ID,
      at_clause_ID,
      attribute_reference_ID,
      attribute_designator_ID,
      binary_adding_operator_ID,
      block_label_ID,
      block_label_opt_ID,
      block_statement_ID,
      body_g_ID,
      body_stub_ID,
      case_expression_ID,
      case_expression_alternative_ID,
      case_expression_alternative_list_ID,
      case_statement_ID,
      case_statement_alternative_ID,
      case_statement_alternative_list_ID,
      compilation_unit_ID,
      compilation_unit_list_ID,
      component_clause_ID,
      component_clause_list_ID,
      component_declaration_ID,
      component_definition_ID,
      component_item_ID,
      component_list_ID,
      component_list_opt_ID,
      compound_statement_ID,
      conditional_entry_call_ID,
      conditional_quantified_expression_ID,
      constant_opt_ID,
      constraint_ID,
      constraint_opt_ID,
      declaration_ID,
      declarations_ID,
      declarative_part_opt_ID,
      delay_alternative_ID,
      delay_statement_ID,
      derived_type_definition_ID,
      direct_name_ID,
      direct_name_opt_ID,
      discrete_choice_ID,
      discrete_choice_list_ID,
      discrete_subtype_definition_ID,
      discrete_subtype_definition_list_ID,
      discriminant_part_opt_ID,
      discriminant_specification_opt_ID,
      discriminant_specification_list_ID,
      elsif_expression_item_ID,
      elsif_expression_list_ID,
      elsif_statement_item_ID,
      elsif_statement_list_ID,
      entry_body_ID,
      entry_body_formal_part_ID,
      entry_call_alternative_ID,
      entry_declaration_ID,
      enumeration_literal_ID,
      enumeration_literal_list_ID,
      enumeration_representation_clause_ID,
      enumeration_type_definition_ID,
      exception_choice_ID,
      exception_choice_list_ID,
      exception_declaration_ID,
      exception_handler_ID,
      exception_handler_list_ID,
      exception_handler_list_opt_ID,
      exit_statement_ID,
      expression_ID,
      expression_opt_ID,
      expression_function_declaration_ID,
      extended_return_object_declaration_ID,
      extended_return_object_declaration_opt_ID,
      extended_return_statement_ID,
      factor_ID,
      formal_object_declaration_ID,
      formal_part_ID,
      formal_subprogram_declaration_ID,
      formal_type_declaration_ID,
      formal_type_definition_ID,
      formal_derived_type_definition_ID,
      formal_package_declaration_ID,
      formal_package_actual_part_ID,
      full_type_declaration_ID,
      function_specification_ID,
      general_access_modifier_opt_ID,
      generic_declaration_ID,
      generic_formal_part_ID,
      generic_formal_parameter_declarations_ID,
      generic_formal_parameter_declaration_ID,
      generic_instantiation_ID,
      generic_package_declaration_ID,
      generic_renaming_declaration_ID,
      generic_subprogram_declaration_ID,
      goto_label_ID,
      handled_sequence_of_statements_ID,
      identifier_list_ID,
      identifier_opt_ID,
      if_expression_ID,
      if_statement_ID,
      incomplete_type_declaration_ID,
      index_constraint_ID,
      index_subtype_definition_ID,
      index_subtype_definition_list_ID,
      interface_list_ID,
      interface_type_definition_ID,
      iteration_scheme_ID,
      iterator_specification_ID,
      iterator_specification_opt_ID,
      loop_statement_ID,
      membership_choice_list_ID,
      membership_choice_ID,
      mod_clause_opt_ID,
      mode_opt_ID,
      multiplying_operator_ID,
      name_list_ID,
      name_ID,
      name_opt_ID,
      null_exclusion_opt_ID,
      null_exclusion_opt_name_type_ID,
      null_procedure_declaration_ID,
      object_declaration_ID,
      object_renaming_declaration_ID,
      overriding_indicator_opt_ID,
      package_body_ID,
      package_body_stub_ID,
      package_declaration_ID,
      package_renaming_declaration_ID,
      package_specification_ID,
      parameter_and_result_profile_ID,
      parameter_profile_opt_ID,
      parameter_specification_ID,
      parameter_specification_list_ID,
      paren_expression_ID,
      pragma_g_ID,
      primary_ID,
      private_extension_declaration_ID,
      private_type_declaration_ID,
      procedure_call_statement_ID,
      procedure_specification_ID,
      proper_body_ID,
      protected_body_ID,
      protected_body_stub_ID,
      protected_definition_ID,
      protected_operation_item_ID,
      protected_operation_item_list_ID,
      protected_operation_item_list_opt_ID,
      protected_opt_ID,
      protected_type_declaration_ID,
      qualified_expression_ID,
      quantified_expression_ID,
      quantifier_ID,
      raise_expression_ID,
      raise_statement_ID,
      range_g_ID,
      range_list_ID,
      real_range_specification_opt_ID,
      record_definition_ID,
      record_representation_clause_ID,
      relation_and_list_ID,
      relation_and_then_list_ID,
      relation_or_list_ID,
      relation_or_else_list_ID,
      relation_xor_list_ID,
      relation_ID,
      relational_operator_ID,
      renaming_declaration_ID,
      requeue_statement_ID,
      result_profile_ID,
      return_subtype_indication_ID,
      selected_component_ID,
      selective_accept_ID,
      select_alternative_ID,
      select_alternative_list_ID,
      select_alternative_list_opt_ID,
      select_statement_ID,
      sequence_of_statements_ID,
      sequence_of_statements_opt_ID,
      simple_expression_ID,
      simple_return_statement_ID,
      simple_statement_ID,
      single_protected_declaration_ID,
      single_task_declaration_ID,
      statement_ID,
      subprogram_body_ID,
      subprogram_body_stub_ID,
      subprogram_declaration_ID,
      subprogram_default_ID,
      subprogram_renaming_declaration_ID,
      subprogram_specification_ID,
      subtype_declaration_ID,
      subtype_indication_ID,
      subunit_ID,
      task_body_ID,
      task_body_stub_ID,
      task_definition_ID,
      task_type_declaration_ID,
      term_ID,
      term_list_ID,
      tick_ID,
      timed_entry_call_ID,
      triggering_alternative_ID,
      type_declaration_ID,
      type_definition_ID,
      variant_part_ID,
      variant_list_ID,
      variant_ID,
      unary_adding_operator_ID,
      use_clause_ID,
      with_clause_ID);

   type Token_Enum_ID_Array is array (Positive range <>) of Token_Enum_ID;
   use all type WisiToken.Token_ID;
   function "+" (Item : in Token_Enum_ID) return WisiToken.Token_ID
     is (WisiToken.Token_ID'First + Token_Enum_ID'Pos (Item));
   function To_Token_Enum (Item : in WisiToken.Token_ID) return Token_Enum_ID
     is (Token_Enum_ID'Val (Item - WisiToken.Token_ID'First));
   function "-" (Item : in WisiToken.Token_ID) return Token_Enum_ID renames To_Token_Enum;

   procedure abstract_subprogram_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure accept_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure accept_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure access_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure access_definition_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure access_definition_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure actual_parameter_part_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure actual_parameter_part_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure aggregate_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure aggregate_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure aggregate_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure aggregate_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure aggregate_5
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure array_type_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure array_type_definition_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure aspect_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure aspect_specification_opt_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure assignment_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure association_opt_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure association_opt_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure association_opt_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure association_opt_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure association_opt_5
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure asynchronous_select_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure at_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure block_label_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure block_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure block_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure case_expression_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure case_expression_alternative_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure case_expression_alternative_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure case_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure case_statement_alternative_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure case_statement_alternative_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure compilation_unit_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure compilation_unit_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure compilation_unit_list_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure component_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure component_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure component_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure component_list_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure conditional_entry_call_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure declaration_9
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure delay_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure delay_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure derived_type_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure derived_type_definition_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure discriminant_part_opt_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure elsif_expression_item_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure elsif_expression_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure elsif_statement_item_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure elsif_statement_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure entry_body_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure entry_body_formal_part_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure entry_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure entry_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure enumeration_representation_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure enumeration_type_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure exception_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure exception_handler_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure exception_handler_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure exception_handler_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure exit_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure exit_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure expression_function_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure extended_return_object_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure extended_return_object_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure extended_return_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure extended_return_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_object_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_object_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_object_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_object_declaration_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_part_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_subprogram_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_subprogram_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_subprogram_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_subprogram_declaration_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_type_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_type_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_type_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_derived_type_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_derived_type_definition_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure formal_package_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure full_type_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure function_specification_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure generic_formal_part_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure generic_formal_part_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure generic_instantiation_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure generic_instantiation_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure generic_instantiation_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure generic_package_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure generic_renaming_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure generic_renaming_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure generic_renaming_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure generic_subprogram_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure goto_label_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure handled_sequence_of_statements_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure identifier_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure identifier_list_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure if_expression_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure if_expression_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure if_expression_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure if_expression_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure if_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure if_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure if_statement_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure if_statement_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure incomplete_type_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure incomplete_type_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure index_constraint_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure interface_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure interface_list_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure iteration_scheme_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure iteration_scheme_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure iterator_specification_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure iterator_specification_5
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure loop_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure loop_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure name_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure name_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure name_5
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure null_exclusion_opt_name_type_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure null_exclusion_opt_name_type_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure null_exclusion_opt_name_type_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure null_exclusion_opt_name_type_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure null_procedure_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure object_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure object_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure object_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure object_declaration_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure object_declaration_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure object_declaration_5
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure object_renaming_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure object_renaming_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure object_renaming_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure overriding_indicator_opt_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure overriding_indicator_opt_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure package_body_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure package_body_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure package_body_stub_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure package_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure package_renaming_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure package_specification_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure package_specification_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure parameter_and_result_profile_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure parameter_specification_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure parameter_specification_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure parameter_specification_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure parameter_specification_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure paren_expression_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure pragma_g_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure pragma_g_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure pragma_g_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure primary_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure primary_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure primary_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure private_extension_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure private_type_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure procedure_call_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure procedure_specification_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure protected_body_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure protected_body_stub_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure protected_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure protected_definition_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure protected_type_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure protected_type_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure qualified_expression_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure quantified_expression_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure raise_expression_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure raise_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure raise_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure raise_statement_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure range_g_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure record_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure record_representation_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure requeue_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure requeue_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure result_profile_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure result_profile_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure selected_component_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure selected_component_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure selected_component_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure selected_component_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure selective_accept_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure selective_accept_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure select_alternative_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure select_alternative_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure select_alternative_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure select_alternative_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure select_alternative_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure select_alternative_list_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure simple_return_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure simple_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure simple_statement_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure simple_statement_8
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure single_protected_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure single_protected_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure single_task_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure single_task_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure single_task_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure subprogram_body_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure subprogram_body_stub_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure subprogram_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure subprogram_default_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure subprogram_renaming_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure subtype_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure subtype_indication_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure subtype_indication_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure subtype_indication_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure subtype_indication_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure subunit_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure task_body_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure task_body_stub_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure task_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure task_definition_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure task_type_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure task_type_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure task_type_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure timed_entry_call_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure variant_part_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure variant_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure variant_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure use_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure use_clause_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure use_clause_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure with_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure with_clause_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure with_clause_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   procedure with_clause_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Index;
     Tokens    : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array);
   function accept_statement_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function block_label_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function block_label_opt_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function block_statement_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function block_statement_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function compilation_unit_list_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function entry_body_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function function_specification_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function identifier_opt_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function loop_statement_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function loop_statement_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function name_2_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function name_5_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function name_7_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function name_opt_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function package_body_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function package_body_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function package_specification_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function package_specification_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function procedure_specification_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function protected_body_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function protected_definition_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function protected_definition_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function protected_type_declaration_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function protected_type_declaration_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function selected_component_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function selected_component_2_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function single_protected_declaration_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function single_protected_declaration_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function single_task_declaration_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function single_task_declaration_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function subprogram_body_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function subprogram_specification_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function subprogram_specification_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function task_body_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function task_type_declaration_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function task_type_declaration_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;

   Partial_Parse_Active    : Boolean := False;
   Partial_Parse_Byte_Goal : WisiToken.Buffer_Pos := WisiToken.Buffer_Pos'Last;
end Ada_Process_Actions;
