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

with Wisi; use Wisi;
with Wisi.Ada; use Wisi.Ada;
package body Ada_Process_Actions is

   use WisiToken.Semantic_Checks;
   use all type Motion_Param_Array;

   procedure abstract_subprogram_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (6,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end abstract_subprogram_declaration_0;

   procedure accept_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Motion), (9, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (5, Invalid_Token_ID) & (6, 72) &
         (9, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((2, 3, 1), (8, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), (True, (Simple, (Int,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end accept_statement_0;

   function accept_statement_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 2, 8, End_Names_Optional);
   end accept_statement_0_check;

   procedure accept_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end accept_statement_1;

   procedure access_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_2, 4, Ada_Indent_Broken)))));
      end case;
   end access_definition_0;

   procedure access_definition_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_2, 4, Ada_Indent_Broken)))));
      end case;
   end access_definition_1;

   procedure access_definition_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (4, 1, 2)));
      when Indent =>
         null;
      end case;
   end access_definition_2;

   procedure actual_parameter_part_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple,
         (Anchored_0, 1, 1)), (Simple, (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end actual_parameter_part_0;

   procedure actual_parameter_part_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple,
         (Anchored_0, 1, 1)), (Simple, (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end actual_parameter_part_1;

   procedure aggregate_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple,
         (Anchored_0, 1, 1)), (Simple, (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end aggregate_0;

   procedure aggregate_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 1))), (False, (Simple, (Label => None))), (False,
         (Simple, (Label => None))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end aggregate_2;

   procedure aggregate_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 1))), (True, (Simple, (Anchored_0, 1, 1)), (Simple,
         (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end aggregate_3;

   procedure aggregate_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 1))), (True,
         (Simple, (Anchored_0, 1, 1)), (Simple, (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end aggregate_4;

   procedure aggregate_5
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 1))), (True,
         (Simple, (Anchored_0, 1, 1)), (Simple, (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end aggregate_5;

   procedure aggregate_6
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple,
         (Anchored_0, 1, 1)), (Simple, (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end aggregate_6;

   procedure array_type_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Anchored_0, 2, 1))), (False, (Simple, (Anchored_0, 2, 0))), (False,
         (Simple, (Label => None))), (False, (Simple, (Label => None)))));
      end case;
   end array_type_definition_0;

   procedure array_type_definition_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Anchored_0, 2, 1))), (False, (Simple, (Anchored_0, 2, 0))), (False,
         (Simple, (Label => None))), (False, (Simple, (Label => None)))));
      end case;
   end array_type_definition_1;

   procedure aspect_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end aspect_clause_0;

   procedure aspect_specification_opt_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end aspect_specification_opt_0;

   procedure assignment_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Hanging_0, (Anchored_1, 2, Ada_Indent_Broken), (Anchored_1, 3,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end assignment_statement_0;

   procedure association_opt_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (True, (Hanging_3, (Anchored_1, 2, Ada_Indent_Broken), (Anchored_1, 2, 2 *
         Ada_Indent_Broken)), (Hanging_3, (Anchored_1, 2, Ada_Indent_Broken), (Anchored_1, 2, 2 *
         Ada_Indent_Broken)))));
      end case;
   end association_opt_0;

   procedure association_opt_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (True, (Hanging_3, (Anchored_1, 2,
         Ada_Indent_Broken), (Anchored_1, 2, 2 * Ada_Indent_Broken)), (Hanging_3, (Anchored_1, 2, Ada_Indent_Broken),
         (Anchored_1, 2, 2 * Ada_Indent_Broken)))));
      end case;
   end association_opt_2;

   procedure association_opt_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None)))));
      end case;
   end association_opt_3;

   procedure association_opt_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, (1 => (True, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)), (Hanging_0, (Label => None), (Int, Ada_Indent_Broken)))));
      end case;
   end association_opt_4;

   procedure association_opt_6
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Label => None))), (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (True, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)), (Hanging_0, (Label => None), (Int, Ada_Indent_Broken)))));
      end case;
   end association_opt_6;

   procedure association_opt_7
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_0,
         (Label => None), (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (True, (Hanging_0,
         (Label => None), (Int, Ada_Indent_Broken)), (Hanging_0, (Label => None), (Int, Ada_Indent_Broken)))));
      end case;
   end association_opt_7;

   procedure asynchronous_select_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Motion), (8, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID) & (8,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), (True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (True, (Simple, (Int, Ada_Indent)),
         (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end asynchronous_select_0;

   procedure at_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end at_clause_0;

   procedure block_label_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Int, Ada_Indent_Label))), (False,
         (Simple, (Label => None)))));
      end case;
   end block_label_0;

   function block_label_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 1);
   end block_label_0_check;

   function block_label_opt_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 1);
   end block_label_opt_0_check;

   procedure block_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Motion), (4, Motion), (8,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((2, Invalid_Token_ID) & (4, Invalid_Token_ID) & (5, 72) &
         (8, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label
         => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label =>
         None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end block_statement_0;

   function block_statement_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 1, 7, End_Names_Optional);
   end block_statement_0_check;

   procedure block_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Motion), (6, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((2, Invalid_Token_ID) & (3, 72) & (6, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label
         => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end block_statement_1;

   function block_statement_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 1, 5, End_Names_Optional);
   end block_statement_1_check;

   procedure case_expression_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (4, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_When)))));
      end case;
   end case_expression_0;

   procedure case_expression_alternative_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Hanging_0, (Anchored_1, 1,
         Ada_Indent), (Anchored_1, 1, Ada_Indent + Ada_Indent_Broken)))));
      end case;
   end case_expression_alternative_0;

   procedure case_expression_alternative_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end case_expression_alternative_list_0;

   procedure case_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (4, Invalid_Token_ID) & (7,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (True, (Simple, (Int, Ada_Indent_When)),
         (Simple, (Int, Ada_Indent_When))), (False, (Simple, (Label => None))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end case_statement_0;

   procedure case_statement_alternative_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (True, (Simple, (Int, Ada_Indent)),
         (Simple, (Int, Ada_Indent)))));
      end case;
   end case_statement_alternative_0;

   procedure case_statement_alternative_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (2, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end case_statement_alternative_list_0;

   procedure compilation_unit_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Int, 0))), (False, (Simple, (Int,
         0)))));
      end case;
   end compilation_unit_2;

   procedure compilation_unit_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Int, 0))), (True, (Simple, (Int, 0)),
         (Simple, (Int, 0)))));
      end case;
   end compilation_unit_list_0;

   procedure compilation_unit_list_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, (1 => (True, (Simple, (Int, 0)), (Simple, (Int, 0)))));
      end case;
   end compilation_unit_list_1;

   function compilation_unit_list_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Tokens);
   begin
      return Terminate_Partial_Parse (Partial_Parse_Active, Partial_Parse_Byte_Goal, Recover_Active, Nonterm);
   end compilation_unit_list_1_check;

   procedure component_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end component_clause_0;

   procedure component_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Anchored_1, 4, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end component_declaration_0;

   procedure component_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end component_declaration_1;

   procedure component_list_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end component_list_4;

   procedure conditional_entry_call_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Motion), (7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID) & (7,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end conditional_entry_call_0;

   procedure declaration_9
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Anchored_1, 4,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end declaration_9;

   procedure delay_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end delay_statement_0;

   procedure delay_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end delay_statement_1;

   procedure derived_type_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (True, (Simple,
         (Label => None)), (Simple, (Language, Ada_Indent_Record_1'Access, 69 & 6 & 0))), (False, (Simple, (Label =>
         None)))));
      end case;
   end derived_type_definition_0;

   procedure derived_type_definition_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 2)));
      when Indent =>
         null;
      end case;
   end derived_type_definition_1;

   procedure discriminant_part_opt_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end discriminant_part_opt_1;

   procedure elsif_expression_item_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Motion), (3, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent)))));
      end case;
   end elsif_expression_item_0;

   procedure elsif_expression_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (2, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end elsif_expression_list_0;

   procedure elsif_statement_item_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Motion), (3, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (True, (Simple,
         (Int, Ada_Indent)), (Simple, (Int, Ada_Indent)))));
      end case;
   end elsif_statement_item_0;

   procedure elsif_statement_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (2, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end elsif_statement_list_0;

   procedure entry_body_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Motion), (6, Motion), (8,
         Motion), (12, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (4, Invalid_Token_ID) & (6,
         Invalid_Token_ID) & (8, Invalid_Token_ID) & (9, 72) & (12, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((2, 3, 1), (11, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Anchored_1, 4, Ada_Indent_Broken))), (False, (Simple, (Label =>
         None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))),
         (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end entry_body_0;

   function entry_body_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 2, 11, End_Names_Optional);
   end entry_body_0_check;

   procedure entry_body_formal_part_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 1))), (False,
         (Simple, (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 0))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end entry_body_formal_part_0;

   procedure entry_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (8,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))),
         (False, (Simple, (Anchored_0, 4, 1))), (False, (Simple, (Anchored_0, 4, 0))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end entry_declaration_0;

   procedure entry_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (6,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end entry_declaration_1;

   procedure enumeration_representation_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_3,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end enumeration_representation_clause_0;

   procedure enumeration_type_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end enumeration_type_definition_0;

   procedure exception_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end exception_declaration_0;

   procedure exception_handler_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (True, (Simple, (Int, Ada_Indent)),
         (Simple, (Int, Ada_Indent)))));
      end case;
   end exception_handler_0;

   procedure exception_handler_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (True, (Simple, (Int, Ada_Indent)),
         (Simple, (Int, Ada_Indent)))));
      end case;
   end exception_handler_1;

   procedure exception_handler_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (2, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end exception_handler_list_0;

   procedure exit_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end exit_statement_0;

   procedure exit_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end exit_statement_1;

   procedure expression_function_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (6,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end expression_function_declaration_0;

   procedure extended_return_object_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple,
         (Anchored_1, 6, Ada_Indent_Broken)))));
      end case;
   end extended_return_object_declaration_0;

   procedure extended_return_object_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end extended_return_object_declaration_1;

   procedure extended_return_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Motion), (7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID) & (4, 72) &
         (7, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (True,
         (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end extended_return_statement_0;

   procedure extended_return_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end extended_return_statement_1;

   procedure formal_object_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (9, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (5, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Anchored_1, 6, Ada_Indent_Broken))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_0;

   procedure formal_object_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Anchored_1, 5,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_1;

   procedure formal_object_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (5, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_2;

   procedure formal_object_declaration_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_3;

   procedure formal_part_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Misc)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end formal_part_0;

   procedure formal_subprogram_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end formal_subprogram_declaration_0;

   procedure formal_subprogram_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_subprogram_declaration_1;

   procedure formal_subprogram_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_subprogram_declaration_2;

   procedure formal_subprogram_declaration_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_subprogram_declaration_3;

   procedure formal_type_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_type_declaration_0;

   procedure formal_type_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_type_declaration_1;

   procedure formal_type_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_type_declaration_2;

   procedure formal_derived_type_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_0;

   procedure formal_derived_type_definition_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_1;

   procedure formal_package_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (9, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((3, 1, 1), (6, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Hanging_3,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_package_declaration_0;

   procedure full_type_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (True, (Simple, (Int,
         Ada_Indent_Broken)), (Simple, (Language, Ada_Indent_Record_1'Access, 69 & 5 & Ada_Indent_Broken))), (False,
         (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Label => None))),
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end full_type_declaration_0;

   procedure function_specification_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Statement_Start)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_3,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end function_specification_0;

   function function_specification_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 2);
   end function_specification_0_check;

   procedure generic_formal_part_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Statement_Start)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent)))));
      end case;
   end generic_formal_part_0;

   procedure generic_formal_part_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Statement_Start)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end generic_formal_part_1;

   procedure generic_instantiation_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((2, 1, 1), (5, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_3,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_0;

   procedure generic_instantiation_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (8,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((3, 1, 1), (6, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Hanging_3, (Int,
         Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_1;

   procedure generic_instantiation_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (8,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((3, 1, 1), (6, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False,
         (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Hanging_3, (Int,
         Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_2;

   procedure generic_package_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (2, Invalid_Token_ID) & (3,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_package_declaration_0;

   procedure generic_renaming_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((3, 1, 1), (5, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 *
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end generic_renaming_declaration_0;

   procedure generic_renaming_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((3, 1, 1), (5, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False,
         (Simple, (Language, Ada_Indent_Renames_0'Access, +3))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2
         * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end generic_renaming_declaration_1;

   procedure generic_renaming_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((3, 1, 1), (5, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False,
         (Simple, (Language, Ada_Indent_Renames_0'Access, +3))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2
         * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end generic_renaming_declaration_2;

   procedure generic_subprogram_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (4,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (2, Invalid_Token_ID) & (4,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end generic_subprogram_declaration_0;

   procedure goto_label_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 0)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Int, Ada_Indent_Label))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end goto_label_0;

   procedure handled_sequence_of_statements_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((True, (Simple, (Label => None)), (Simple, (Label =>
         None))), (False, (Simple, (Int, -Ada_Indent))), (True, (Simple, (Int, Ada_Indent_When - Ada_Indent)), (Simple,
         (Int, Ada_Indent_When - Ada_Indent)))));
      end case;
   end handled_sequence_of_statements_0;

   procedure identifier_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end identifier_list_0;

   procedure identifier_list_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 1);
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end identifier_list_1;

   function identifier_opt_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 1);
   end identifier_opt_0_check;

   procedure if_expression_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Motion), (3, Motion), (6, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID) & (5,
         Invalid_Token_ID) & (6, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent)))));
      end case;
   end if_expression_0;

   procedure if_expression_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Motion), (3, Motion), (5, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID) & (5,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent)))));
      end case;
   end if_expression_1;

   procedure if_expression_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Motion), (3, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID) & (5,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent))), (False, (Simple, (Label => None)))));
      end case;
   end if_expression_2;

   procedure if_expression_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Motion), (3, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent)))));
      end case;
   end if_expression_3;

   procedure if_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Motion), (6, Motion), (10,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID) & (5,
         Invalid_Token_ID) & (6, Invalid_Token_ID) & (10, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Hanging_2,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), (False, (Simple,
         (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label
         => None))), (False, (Simple, (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end if_statement_0;

   procedure if_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Motion), (5, Motion), (9,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID) & (5,
         Invalid_Token_ID) & (9, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Hanging_2,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), (False, (Simple,
         (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label
         => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label =>
         None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end if_statement_1;

   procedure if_statement_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Motion), (8, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID) & (5,
         Invalid_Token_ID) & (8, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Hanging_2,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), (False, (Simple,
         (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label
         => None))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end if_statement_2;

   procedure if_statement_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Motion), (7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID) & (7,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Hanging_2,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), (False, (Simple,
         (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label
         => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end if_statement_3;

   procedure incomplete_type_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end incomplete_type_declaration_0;

   procedure incomplete_type_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end incomplete_type_declaration_1;

   procedure index_constraint_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_0, 1, 1))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end index_constraint_0;

   procedure interface_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 2)));
      when Indent =>
         null;
      end case;
   end interface_list_0;

   procedure interface_list_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, 1, 2)));
      when Indent =>
         null;
      end case;
   end interface_list_1;

   procedure iteration_scheme_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iteration_scheme_0;

   procedure iteration_scheme_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iteration_scheme_1;

   procedure iterator_specification_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Remove_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => 4));
      when Indent =>
         null;
      end case;
   end iterator_specification_2;

   procedure iterator_specification_5
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Remove_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => 3));
      when Indent =>
         null;
      end case;
   end iterator_specification_5;

   procedure loop_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (3,
         Motion), (8, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((2, Invalid_Token_ID) & (3, Invalid_Token_ID) & (8,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end loop_statement_0;

   function loop_statement_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 1, 7, End_Names_Optional);
   end loop_statement_0_check;

   procedure loop_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (4,
         Motion), (7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((2, Invalid_Token_ID) & (4, Invalid_Token_ID) & (7,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label
         => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end loop_statement_1;

   function loop_statement_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 1, 6, End_Names_Optional);
   end loop_statement_1_check;

   procedure name_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_1, 1, Ada_Indent_Broken))), (False, (Hanging_0, (Anchored_0, 2, 1), (Anchored_0, 2, 1 +
         Ada_Indent_Broken))), (False, (Simple, (Anchored_0, 2, 0)))));
      end case;
   end name_0;

   procedure name_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple, (if
         Ada_Indent_Hanging_Rel_Exp then (Anchored_0, 1, Ada_Indent_Broken) else (Anchored_1, 1,
         Ada_Indent_Broken))))));
      end case;
   end name_1;

   function name_2_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 1);
   end name_2_check;

   procedure name_5
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Mark_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Suffix)));
      when Indent =>
         null;
      end case;
   end name_5;

   function name_5_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 1);
   end name_5_check;

   function name_7_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 1);
   end name_7_check;

   function name_opt_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 1);
   end name_opt_0_check;

   procedure null_exclusion_opt_name_type_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, 3, 2)));
      when Indent =>
         null;
      end case;
   end null_exclusion_opt_name_type_0;

   procedure null_exclusion_opt_name_type_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, 1, 2)));
      when Indent =>
         null;
      end case;
   end null_exclusion_opt_name_type_1;

   procedure null_exclusion_opt_name_type_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 3, 2)));
      when Indent =>
         null;
      end case;
   end null_exclusion_opt_name_type_2;

   procedure null_exclusion_opt_name_type_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 2)));
      when Indent =>
         null;
      end case;
   end null_exclusion_opt_name_type_3;

   procedure null_procedure_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (6,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end null_procedure_declaration_0;

   procedure object_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (9, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Anchored_2, 6, Ada_Indent_Broken))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_0;

   procedure object_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (9, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Anchored_1, 6, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_1;

   procedure object_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (9, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Anchored_1, 6, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_2;

   procedure object_declaration_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_3;

   procedure object_declaration_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_4;

   procedure object_declaration_5
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_5;

   procedure object_renaming_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 1);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (4, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Hanging_3, (Int,
         Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_renaming_declaration_0;

   procedure object_renaming_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 1);
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_renaming_declaration_1;

   procedure object_renaming_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 1);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (5, 1, 3)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_renaming_declaration_2;

   procedure overriding_indicator_opt_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end overriding_indicator_opt_0;

   procedure overriding_indicator_opt_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Statement_Start)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end overriding_indicator_opt_1;

   procedure package_body_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Motion), (7, Motion), (11,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (5, Invalid_Token_ID) & (7,
         Invalid_Token_ID) & (8, 72) & (11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((3, 1, 1), (10, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))),
         (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (True, (Simple, (Int, Ada_Indent)),
         (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple,
         (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2
         * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end package_body_0;

   function package_body_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 3, 10, End_Names_Optional);
   end package_body_0_check;

   procedure package_body_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Motion), (9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (5, Invalid_Token_ID) & (9,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((3, 1, 1), (8, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False, (Hanging_3, (Int,
         Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end package_body_1;

   function package_body_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 3, 8, End_Names_Optional);
   end package_body_1_check;

   procedure package_body_stub_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))),
         (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end package_body_stub_0;

   procedure package_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (2, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end package_declaration_0;

   procedure package_renaming_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((2, 1, 1), (4, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_3,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end package_renaming_declaration_0;

   procedure package_specification_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Motion), (6, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (4, Invalid_Token_ID) & (6,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((2, 1, 1), (9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_3,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple,
         (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label
         => None))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken)))));
      end case;
   end package_specification_0;

   function package_specification_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 2, 9, End_Names_Optional);
   end package_specification_0_check;

   procedure package_specification_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (4, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((2, 1, 1), (7, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_3,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple,
         (Label => None))), (False, (Hanging_3, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken)))));
      end case;
   end package_specification_1;

   function package_specification_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 2, 7, End_Names_Optional);
   end package_specification_1_check;

   procedure parameter_and_result_profile_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Language, Ada_Indent_Return_0'Access, 1 & 0)))));
      end case;
   end parameter_and_result_profile_0;

   procedure parameter_specification_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (6, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Hanging_3, (Int,
         Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Anchored_1, 7, Ada_Indent_Broken)))));
      end case;
   end parameter_specification_0;

   procedure parameter_specification_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (6, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Hanging_3, (Int,
         Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken)))));
      end case;
   end parameter_specification_1;

   procedure parameter_specification_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Anchored_1, 5,
         Ada_Indent_Broken)))));
      end case;
   end parameter_specification_2;

   procedure parameter_specification_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end parameter_specification_3;

   procedure paren_expression_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_0,
         (Anchored_0, 1, 1), (Anchored_0, 1, 1 + Ada_Indent_Broken))), (False, (Simple, (Anchored_0, 1, 0)))));
      end case;
   end paren_expression_0;

   procedure pragma_g_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Anchored_0, 3,
         1))), (False, (Simple, (Anchored_0, 3, 0))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end pragma_g_0;

   procedure pragma_g_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Anchored_0, 3,
         1))), (False, (Simple, (Anchored_0, 3, 0))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end pragma_g_1;

   procedure pragma_g_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end pragma_g_2;

   procedure primary_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, 3, 0)));
      when Indent =>
         null;
      end case;
   end primary_0;

   procedure primary_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, (1 => (False, (Simple, (Language,
         Ada_Indent_Aggregate'Access, Null_Args)))));
      end case;
   end primary_2;

   procedure primary_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 1, 2)));
      when Indent =>
         null;
      end case;
   end primary_4;

   procedure private_extension_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (12, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_0;

   procedure private_type_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_0;

   procedure procedure_call_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Hanging_1, (Label => None), (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end procedure_call_statement_0;

   procedure procedure_specification_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Statement_Start)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_3,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end procedure_specification_0;

   function procedure_specification_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 2);
   end procedure_specification_0_check;

   procedure protected_body_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Motion), (9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (5, Invalid_Token_ID) & (9,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((3, 3, 2), (8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))),
         (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_body_0;

   function protected_body_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 3, 8, End_Names_Optional);
   end protected_body_0_check;

   procedure protected_body_stub_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_body_stub_0;

   procedure protected_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, Motion)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (5, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), (False, (Simple, (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None)))));
      end case;
   end protected_definition_0;

   function protected_definition_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 5);
   end protected_definition_0_check;

   procedure protected_definition_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None)))));
      end case;
   end protected_definition_1;

   function protected_definition_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 3);
   end protected_definition_1_check;

   procedure protected_type_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Motion), (11,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (6, Invalid_Token_ID) & (10, 49) &
         (11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_type_declaration_0;

   function protected_type_declaration_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 3, 10, End_Names_Optional);
   end protected_type_declaration_0_check;

   procedure protected_type_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Motion), (8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (6, Invalid_Token_ID) & (7, 49) &
         (8, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Label => None))), (True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_type_declaration_1;

   function protected_type_declaration_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 3, 7, End_Names_Optional);
   end protected_type_declaration_1_check;

   procedure qualified_expression_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (if Ada_Indent_Hanging_Rel_Exp then (Anchored_0, 1, Ada_Indent_Broken)
         else (Anchored_1, 1, Ada_Indent_Broken))))));
      end case;
   end qualified_expression_0;

   procedure quantified_expression_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Anchored_1, 4, Ada_Indent_Broken)))));
      end case;
   end quantified_expression_0;

   procedure raise_expression_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Anchored_1, 3,
         Ada_Indent_Broken)))));
      end case;
   end raise_expression_0;

   procedure raise_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_3,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Anchored_1, 3, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end raise_statement_0;

   procedure raise_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_3,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end raise_statement_1;

   procedure raise_statement_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end raise_statement_2;

   procedure range_g_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Anchored_0, 4, 1))), (False, (Simple, (Anchored_0, 4, 0)))));
      end case;
   end range_g_0;

   procedure record_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((True, (Simple, (Language, Ada_Indent_Record_1'Access, 69
         & 1 & 0)), (Simple, (Language, Ada_Indent_Record_1'Access, 69 & 1 & Ada_Indent))), (True, (Simple, (Language,
         Ada_Indent_Record_1'Access, 69 & 1 & Ada_Indent)), (Simple, (Language, Ada_Indent_Record_1'Access, 69 & 1 &
         Ada_Indent))), (False, (Simple, (Language, Ada_Indent_Record_1'Access, 69 & 1 & 0))), (False, (Simple, (Label
         => None)))));
      end case;
   end record_definition_0;

   procedure record_representation_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_3,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (True,
         (Simple, (Language, Ada_Indent_Record_1'Access, 28 & 4 & 0)), (Simple, (Language, Ada_Indent_Record_1'Access,
         28 & 4 & Ada_Indent))), (False, (Simple, (Language, Ada_Indent_Record_0'Access, 1 & 4 & Ada_Indent))), (True,
         (Simple, (Language, Ada_Indent_Record_1'Access, 28 & 4 & Ada_Indent)), (Simple, (Language,
         Ada_Indent_Record_1'Access, 28 & 4 & Ada_Indent))), (False, (Simple, (Language, Ada_Indent_Record_1'Access, 28
         & 4 & 0))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end record_representation_clause_0;

   procedure requeue_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end requeue_statement_0;

   procedure requeue_statement_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end requeue_statement_1;

   procedure result_profile_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 2)));
      when Indent =>
         Indent_Action_1 (Parse_Data, Tree, Nonterm, Tokens, 1, ((False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_3, 1, Ada_Indent_Broken))), (False, (Simple, (Anchored_4, 1, Ada_Indent_Broken)))));
      end case;
   end result_profile_0;

   procedure result_profile_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_1 (Parse_Data, Tree, Nonterm, Tokens, 1, ((False, (Simple, (Label => None))), (False, (Simple,
         (Anchored_4, 1, Ada_Indent_Broken)))));
      end case;
   end result_profile_1;

   procedure selected_component_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Mark_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Prefix), (3, Suffix)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end selected_component_0;

   function selected_component_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Merge_Names (Nonterm, Tokens, 1, 3);
   end selected_component_0_check;

   procedure selected_component_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Mark_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Prefix)));
      when Indent =>
         null;
      end case;
   end selected_component_1;

   procedure selected_component_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Mark_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Prefix)));
      when Indent =>
         null;
      end case;
   end selected_component_2;

   function selected_component_2_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Merge_Names (Nonterm, Tokens, 1, 3);
   end selected_component_2_check;

   procedure selected_component_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Mark_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Prefix)));
      when Indent =>
         null;
      end case;
   end selected_component_3;

   procedure selective_accept_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Motion), (7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (2, 43) & (3, Invalid_Token_ID) &
         (7, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent))), (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label =>
         None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))),
         (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end selective_accept_0;

   procedure selective_accept_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (2, 43) & (5, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent))), (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label =>
         None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end selective_accept_1;

   procedure select_alternative_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent))),
         (False, (Simple, (Int, Ada_Indent)))));
      end case;
   end select_alternative_0;

   procedure select_alternative_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Motion), (4, Statement_Start), (5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent))),
         (False, (Simple, (Label => None)))));
      end case;
   end select_alternative_1;

   procedure select_alternative_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent)))));
      end case;
   end select_alternative_2;

   procedure select_alternative_4
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end select_alternative_4;

   procedure select_alternative_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, 43) & (2, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent)))));
      end case;
   end select_alternative_list_0;

   procedure select_alternative_list_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, (1 => (False, (Simple, (Int, Ada_Indent)))));
      end case;
   end select_alternative_list_1;

   procedure simple_return_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end simple_return_statement_0;

   procedure simple_statement_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end simple_statement_0;

   procedure simple_statement_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 0)));
      when Indent =>
         null;
      end case;
   end simple_statement_3;

   procedure simple_statement_8
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end simple_statement_8;

   procedure single_protected_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Motion), (7, Motion), (9,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (4, Invalid_Token_ID) & (7,
         Invalid_Token_ID) & (8, 49) & (9, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end single_protected_declaration_0;

   function single_protected_declaration_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 2, 8, End_Names_Optional);
   end single_protected_declaration_0_check;

   procedure single_protected_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Motion), (6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (4, Invalid_Token_ID) & (5, 49) &
         (6, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (True, (Simple, (Label => None)), (Simple,
         (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end single_protected_declaration_1;

   function single_protected_declaration_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 2, 5, End_Names_Optional);
   end single_protected_declaration_1_check;

   procedure single_task_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Motion), (11,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (4, Invalid_Token_ID) & (8, 49) &
         (11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((2, 3, 2), (9, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end single_task_declaration_0;

   function single_task_declaration_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 2, 10, End_Names_Optional);
   end single_task_declaration_0_check;

   procedure single_task_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Motion), (8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (4, Invalid_Token_ID) & (5, 49) &
         (8, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((2, 3, 2), (6, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (True, (Simple, (Label => None)), (Simple,
         (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end single_task_declaration_1;

   function single_task_declaration_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 2, 7, End_Names_Optional);
   end single_task_declaration_1_check;

   procedure single_task_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end single_task_declaration_2;

   procedure subprogram_body_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (4,
         Motion), (6, Motion), (10, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (2, Invalid_Token_ID) & (4,
         Invalid_Token_ID) & (6, Invalid_Token_ID) & (7, 72) & (10, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple,
         (Label => None)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Label =>
         None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))),
         (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end subprogram_body_0;

   function subprogram_body_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 2, 9, End_Names_Optional);
   end subprogram_body_0_check;

   procedure subprogram_body_stub_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (6,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end subprogram_body_stub_0;

   procedure subprogram_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (4,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end subprogram_declaration_0;

   procedure subprogram_default_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, 1, 1)));
      when Indent =>
         null;
      end case;
   end subprogram_default_0;

   procedure subprogram_renaming_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (2, Statement_Override), (6,
         Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (4, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Language, Ada_Indent_Renames_0'Access, +2))), (False, (Hanging_3, (Int,
         Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end subprogram_renaming_declaration_0;

   function subprogram_specification_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 1);
   end subprogram_specification_0_check;

   function subprogram_specification_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Lexer, Recover_Active);
   begin
      return Propagate_Name (Nonterm, Tokens, 1);
   end subprogram_specification_1_check;

   procedure subtype_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end subtype_declaration_0;

   procedure subtype_indication_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 2)));
      when Indent =>
         null;
      end case;
   end subtype_indication_0;

   procedure subtype_indication_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 2)));
      when Indent =>
         null;
      end case;
   end subtype_indication_1;

   procedure subtype_indication_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, 1, 2)));
      when Indent =>
         null;
      end case;
   end subtype_indication_2;

   procedure subtype_indication_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, 1, 2)));
      when Indent =>
         null;
      end case;
   end subtype_indication_3;

   procedure subunit_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_Override)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_3,
         (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), (False, (Simple, (Anchored_0, 2, 1))), (False,
         (Simple, (Anchored_0, 2, 0))), (False, (Simple, (Label => None)))));
      end case;
   end subunit_0;

   procedure task_body_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Motion), (7, Motion), (11,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (5, Invalid_Token_ID) & (7,
         Invalid_Token_ID) & (8, 72) & (11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((3, 3, 2), (10, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False,
         (Simple, (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple,
         (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label
         => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end task_body_0;

   function task_body_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 3, 10, End_Names_Optional);
   end task_body_0_check;

   procedure task_body_stub_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False,
         (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end task_body_stub_0;

   procedure task_definition_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), (False, (Simple, (Label => None))), (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent)))));
      end case;
   end task_definition_0;

   procedure task_definition_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, (1 => (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent)))));
      end case;
   end task_definition_1;

   procedure task_type_declaration_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Motion), (9, Motion), (13,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (6, Invalid_Token_ID) & (9,
         Invalid_Token_ID) & (10, 49) & (13, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((3, 3, 2), (12, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_0;

   function task_type_declaration_0_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 3, 12, End_Names_Optional);
   end task_type_declaration_0_check;

   procedure task_type_declaration_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Motion), (10,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (6, Invalid_Token_ID) & (7, 49) &
         (10, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, ((3, 3, 2), (9, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Label => None))), (True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Label => None))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_1;

   function task_type_declaration_1_check
    (Lexer          : access constant WisiToken.Lexer.Instance'Class;
     Nonterm        : in out WisiToken.Recover_Token;
     Tokens         : in     WisiToken.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Semantic_Checks.Check_Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
   begin
      return Match_Names (Lexer, Descriptor, Tokens, 3, 9, End_Names_Optional);
   end task_type_declaration_1_check;

   procedure task_type_declaration_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, Tokens, 3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_2;

   procedure timed_entry_call_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Motion), (6, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (3, Invalid_Token_ID) & (6,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))), (True, (Simple, (Int,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), (False, (Simple, (Label => None))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end timed_entry_call_0;

   procedure variant_part_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (4, Invalid_Token_ID) & (7,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_When))),
         (False, (Simple, (Label => None))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end variant_part_0;

   procedure variant_list_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Motion_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Invalid_Token_ID) & (2, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end variant_list_0;

   procedure variant_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Hanging_0,
         (Label => None), (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent))), (True, (Simple, (Int,
         Ada_Indent)), (Simple, (Int, Ada_Indent)))));
      end case;
   end variant_0;

   procedure use_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (4, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_Use))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end use_clause_0;

   procedure use_clause_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Use))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end use_clause_1;

   procedure use_clause_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Use))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end use_clause_2;

   procedure with_clause_0
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (5, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (4, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken))), (False, (Simple, (Int,
         Ada_Indent_With))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end with_clause_0;

   procedure with_clause_1
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_With))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end with_clause_1;

   procedure with_clause_2
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (4, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_With))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end with_clause_2;

   procedure with_clause_3
    (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
     Tree      : in out WisiToken.Syntax_Trees.Tree;
     Nonterm   : in     WisiToken.Valid_Node_Index;
     Tokens    : in     WisiToken.Valid_Node_Index_Array)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, Tokens, ((1, Statement_Start), (3, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, Tokens, (1 => (2, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, Tokens, ((False, (Simple, (Label => None))), (False, (Simple,
         (Int, Ada_Indent_With))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end with_clause_3;

end Ada_Process_Actions;
