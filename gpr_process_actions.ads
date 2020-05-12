--  generated parser support file.
--  command line: wisitoken-bnf-generate.exe  --generate LR1 Ada_Emacs re2c PROCESS gpr.wy
--

--  Copyright (C) 2013 - 2020 Free Software Foundation, Inc.

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
package Gpr_Process_Actions is

   Descriptor : aliased WisiToken.Descriptor :=
     (First_Terminal    => 3,
      Last_Terminal     => 39,
      First_Nonterminal => 40,
      Last_Nonterminal  => 73,
      EOI_ID            => 39,
      Accept_ID         => 40,
      Case_Insensitive  => True,
      New_Line_ID       => 1,
      String_1_ID       => 2147483647,
      String_2_ID       => 38,
      Image             =>
        (new String'("WHITESPACE"),
         new String'("NEW_LINE"),
         new String'("COMMENT"),
         new String'("ABSTRACT"),
         new String'("AT"),
         new String'("AGGREGATE"),
         new String'("CASE"),
         new String'("CONFIGURATION"),
         new String'("END"),
         new String'("EXTENDS"),
         new String'("EXTERNAL"),
         new String'("EXTERNAL_AS_LIST"),
         new String'("FOR"),
         new String'("IS"),
         new String'("LEFT_PAREN"),
         new String'("LIBRARY"),
         new String'("NULL"),
         new String'("OTHERS"),
         new String'("PACKAGE"),
         new String'("PROJECT"),
         new String'("RENAMES"),
         new String'("RIGHT_PAREN"),
         new String'("STANDARD"),
         new String'("TYPE"),
         new String'("USE"),
         new String'("WHEN"),
         new String'("WITH"),
         new String'("AMPERSAND"),
         new String'("COLON"),
         new String'("COLON_EQUALS"),
         new String'("COMMA"),
         new String'("DOT"),
         new String'("EQUAL_GREATER"),
         new String'("QUOTE"),
         new String'("SEMICOLON"),
         new String'("VERTICAL_BAR"),
         new String'("NUMERIC_LITERAL"),
         new String'("IDENTIFIER"),
         new String'("STRING_LITERAL"),
         new String'("Wisi_EOI"),
         new String'("wisitoken_accept"),
         new String'("aggregate_g"),
         new String'("attribute_declaration"),
         new String'("attribute_prefix"),
         new String'("attribute_reference"),
         new String'("case_statement"),
         new String'("case_item"),
         new String'("case_items"),
         new String'("compilation_unit"),
         new String'("context_clause"),
         new String'("context_clause_opt"),
         new String'("declarative_item"),
         new String'("declarative_items"),
         new String'("declarative_items_opt"),
         new String'("discrete_choice"),
         new String'("discrete_choice_list"),
         new String'("expression"),
         new String'("external_value"),
         new String'("identifier_opt"),
         new String'("name"),
         new String'("package_declaration"),
         new String'("package_spec"),
         new String'("package_extension"),
         new String'("package_renaming"),
         new String'("project_declaration_opt"),
         new String'("project_extension"),
         new String'("project_qualifier_opt"),
         new String'("simple_declarative_item"),
         new String'("simple_project_declaration"),
         new String'("string_primary"),
         new String'("string_list"),
         new String'("term"),
         new String'("typed_string_declaration"),
         new String'("with_clause")),
      Terminal_Image_Width => 16,
      Image_Width          => 26,
      Last_Lookahead       => 39);

   type Token_Enum_ID is
     (WHITESPACE_ID,
      NEW_LINE_ID,
      COMMENT_ID,
      ABSTRACT_ID,
      AT_ID,
      AGGREGATE_ID,
      CASE_ID,
      CONFIGURATION_ID,
      END_ID,
      EXTENDS_ID,
      EXTERNAL_ID,
      EXTERNAL_AS_LIST_ID,
      FOR_ID,
      IS_ID,
      LEFT_PAREN_ID,
      LIBRARY_ID,
      NULL_ID,
      OTHERS_ID,
      PACKAGE_ID,
      PROJECT_ID,
      RENAMES_ID,
      RIGHT_PAREN_ID,
      STANDARD_ID,
      TYPE_ID,
      USE_ID,
      WHEN_ID,
      WITH_ID,
      AMPERSAND_ID,
      COLON_ID,
      COLON_EQUALS_ID,
      COMMA_ID,
      DOT_ID,
      EQUAL_GREATER_ID,
      QUOTE_ID,
      SEMICOLON_ID,
      VERTICAL_BAR_ID,
      NUMERIC_LITERAL_ID,
      IDENTIFIER_ID,
      STRING_LITERAL_ID,
      Wisi_EOI_ID,
      wisitoken_accept_ID,
      aggregate_g_ID,
      attribute_declaration_ID,
      attribute_prefix_ID,
      attribute_reference_ID,
      case_statement_ID,
      case_item_ID,
      case_items_ID,
      compilation_unit_ID,
      context_clause_ID,
      context_clause_opt_ID,
      declarative_item_ID,
      declarative_items_ID,
      declarative_items_opt_ID,
      discrete_choice_ID,
      discrete_choice_list_ID,
      expression_ID,
      external_value_ID,
      identifier_opt_ID,
      name_ID,
      package_declaration_ID,
      package_spec_ID,
      package_extension_ID,
      package_renaming_ID,
      project_declaration_opt_ID,
      project_extension_ID,
      project_qualifier_opt_ID,
      simple_declarative_item_ID,
      simple_project_declaration_ID,
      string_primary_ID,
      string_list_ID,
      term_ID,
      typed_string_declaration_ID,
      with_clause_ID);

   type Token_Enum_ID_Array is array (Positive range <>) of Token_Enum_ID;
   use all type WisiToken.Token_ID;
   function "+" (Item : in Token_Enum_ID) return WisiToken.Token_ID
     is (WisiToken.Token_ID'First + Token_Enum_ID'Pos (Item));
   function To_Token_Enum (Item : in WisiToken.Token_ID) return Token_Enum_ID
     is (Token_Enum_ID'Val (Item - WisiToken.Token_ID'First));
   function "-" (Item : in WisiToken.Token_ID) return Token_Enum_ID renames To_Token_Enum;

   procedure aggregate_g_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure attribute_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure attribute_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure attribute_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure attribute_declaration_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure case_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure case_item_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure compilation_unit_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure package_spec_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure package_extension_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure package_renaming_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure project_extension_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure simple_declarative_item_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure simple_declarative_item_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure simple_declarative_item_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure simple_project_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   procedure typed_string_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array);
   function identifier_opt_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function package_spec_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function package_extension_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function project_extension_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;
   function simple_project_declaration_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status;

   Partial_Parse_Active : Boolean := False;
end Gpr_Process_Actions;
