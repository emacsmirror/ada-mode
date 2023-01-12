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

with SAL;
with Wisi; use Wisi;
with Wisi.Ada; use Wisi.Ada;
with WisiToken.In_Parse_Actions; use WisiToken.In_Parse_Actions;
package body Ada_Annex_P_Process_Actions is

   use WisiToken.Syntax_Trees.In_Parse_Actions;
   use all type Motion_Param_Array;

   procedure pragma_argument_association_list_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end pragma_argument_association_list_0;

   procedure pragma_argument_association_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Hanging_0, (Label => None), (Int, Ada_Indent_Broken)))));
      end case;
   end pragma_argument_association_list_1;

   procedure pragma_g_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple,
         (Anchored_0, T3, 1))), T5 => (False, (Simple, (Anchored_0, T3, 0))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end pragma_g_0;

   procedure pragma_g_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T6 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end pragma_g_1;

   procedure pragma_g_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple,
         (Anchored_0, T3, 1))), T5 => (False, (Simple, (Anchored_0, T3, 0))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end pragma_g_2;

   procedure pragma_g_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T6 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end pragma_g_3;

   procedure full_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (True, (Simple, (Int,
         Ada_Indent_Broken)), (Simple, (Language, Ada_Indent_Record_1'Access, 83 & Integer (T5) & Ada_Indent_Broken))),
         T5 => (False, (Hanging_1, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), T6 => (False, (Simple,
         (Label => None))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end full_type_declaration_0;

   procedure full_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (True, (Simple, (Int,
         Ada_Indent_Broken)), (Simple, (Language, Ada_Indent_Record_1'Access, 83 & Integer (T5) & Ada_Indent_Broken))),
         T5 => (False, (Hanging_1, (Int, Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), T7 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end full_type_declaration_1;

   procedure full_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (True, (Simple, (Int, Ada_Indent_Broken)), (Simple, (Language,
         Ada_Indent_Record_1'Access, 83 & Integer (T5) & Ada_Indent_Broken))), T5 => (False, (Hanging_1, (Int,
         Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), T6 => (False, (Simple, (Label => None))), T7 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end full_type_declaration_2;

   procedure full_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (True, (Simple, (Int, Ada_Indent_Broken)), (Simple, (Language,
         Ada_Indent_Record_1'Access, 83 & Integer (T5) & Ada_Indent_Broken))), T5 => (False, (Hanging_1, (Int,
         Ada_Indent_Broken), (Int, 2 * Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end full_type_declaration_3;

   procedure subtype_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Label => None))), T6 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end subtype_declaration_0;

   procedure subtype_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end subtype_declaration_1;

   procedure object_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 =>
         (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_0;

   procedure object_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 =>
         (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_1;

   procedure object_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_2;

   procedure object_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_3;

   procedure object_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_4;

   procedure object_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_5;

   procedure object_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_6;

   procedure object_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_7;

   procedure object_declaration_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_8;

   procedure object_declaration_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_9;

   procedure object_declaration_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_10;

   procedure object_declaration_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_11;

   procedure object_declaration_12
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6
         => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_12;

   procedure object_declaration_13
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6
         => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_13;

   procedure object_declaration_14
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T7 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7
         => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_14;

   procedure object_declaration_15
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8
         => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_15;

   procedure object_declaration_16
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 =>
         (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_16;

   procedure object_declaration_17
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 =>
         (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_17;

   procedure object_declaration_18
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_18;

   procedure object_declaration_19
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_19;

   procedure object_declaration_20
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_20;

   procedure object_declaration_21
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_21;

   procedure object_declaration_22
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_22;

   procedure object_declaration_23
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_23;

   procedure object_declaration_24
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_24;

   procedure object_declaration_25
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_25;

   procedure object_declaration_26
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_26;

   procedure object_declaration_27
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_27;

   procedure object_declaration_28
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6
         => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_28;

   procedure object_declaration_29
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6
         => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_29;

   procedure object_declaration_30
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T7 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7
         => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_30;

   procedure object_declaration_31
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8
         => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_31;

   procedure object_declaration_32
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 =>
         (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_32;

   procedure object_declaration_33
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 =>
         (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_33;

   procedure object_declaration_34
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_34;

   procedure object_declaration_35
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_35;

   procedure object_declaration_36
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_36;

   procedure object_declaration_37
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_37;

   procedure object_declaration_38
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_38;

   procedure object_declaration_39
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_39;

   procedure object_declaration_40
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_40;

   procedure object_declaration_41
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_41;

   procedure object_declaration_42
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_42;

   procedure object_declaration_43
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_43;

   procedure object_declaration_44
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6
         => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_44;

   procedure object_declaration_45
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6
         => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_45;

   procedure object_declaration_46
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T7 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7
         => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_46;

   procedure object_declaration_47
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8
         => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_declaration_47;

   procedure defining_identifier_list_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Name_Action (Parse_Data, Tree, Nonterm, 1);
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end defining_identifier_list_0;

   procedure defining_identifier_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end defining_identifier_list_1;

   procedure number_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_1,
         (Anchored_1, T4, Ada_Indent_Broken), (Anchored_1, T4, 2 * Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end number_declaration_0;

   procedure enumeration_type_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end enumeration_type_definition_0;

   procedure integer_type_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end integer_type_definition_0;

   procedure integer_type_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end integer_type_definition_1;

   procedure unconstrained_array_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Anchored_0, T2, 1))), T4 => (False, (Simple, (Anchored_0, T2, 0))),
         T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Label => None)))));
      end case;
   end unconstrained_array_definition_0;

   procedure constrained_array_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Anchored_0, T2, 1))), T4 => (False, (Simple, (Anchored_0, T2, 0))),
         T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Label => None)))));
      end case;
   end constrained_array_definition_0;

   procedure discrete_range_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end discrete_range_0;

   procedure discrete_range_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end discrete_range_1;

   procedure known_discriminant_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end known_discriminant_part_0;

   procedure discriminant_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_1, (Anchored_1, T4, Ada_Indent_Broken), (Anchored_1, T4, 2 *
         Ada_Indent_Broken)))));
      end case;
   end discriminant_specification_0;

   procedure discriminant_specification_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end discriminant_specification_1;

   procedure discriminant_specification_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_1,
         (Anchored_1, T4, Ada_Indent_Broken), (Anchored_1, T4, 2 * Ada_Indent_Broken)))));
      end case;
   end discriminant_specification_2;

   procedure discriminant_specification_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end discriminant_specification_3;

   procedure discriminant_specification_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_1,
         (Anchored_1, T3, Ada_Indent_Broken), (Anchored_1, T3, 2 * Ada_Indent_Broken)))));
      end case;
   end discriminant_specification_4;

   procedure discriminant_specification_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end discriminant_specification_5;

   procedure record_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Language, Ada_Indent_Record_1'Access, 83
         & Integer (T1) & 0))), T2 => (True, (Simple, (Language, Ada_Indent_Record_1'Access, 83 & Integer (T1) &
         Ada_Indent)), (Simple, (Language, Ada_Indent_Record_1'Access, 83 & Integer (T1) & Ada_Indent))), T3 => (False,
         (Simple, (Language, Ada_Indent_Record_1'Access, 83 & Integer (T1) & 0))), T4 => (False, (Simple, (Label =>
         None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end record_definition_0;

   procedure record_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Language, Ada_Indent_Record_1'Access, 83
         & Integer (T1) & 0))), T2 => (True, (Simple, (Language, Ada_Indent_Record_1'Access, 83 & Integer (T1) &
         Ada_Indent)), (Simple, (Language, Ada_Indent_Record_1'Access, 83 & Integer (T1) & Ada_Indent))), T3 => (False,
         (Simple, (Language, Ada_Indent_Record_1'Access, 83 & Integer (T1) & 0))), T4 => (False, (Simple, (Label =>
         None)))));
      end case;
   end record_definition_1;

   procedure component_list_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end component_list_3;

   procedure component_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_1,
         (Anchored_1, T3, Ada_Indent_Broken), (Anchored_1, T3, 2 * Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end component_declaration_0;

   procedure component_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_1,
         (Anchored_1, T3, Ada_Indent_Broken), (Anchored_1, T3, 2 * Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end component_declaration_1;

   procedure component_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end component_declaration_2;

   procedure component_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end component_declaration_3;

   procedure variant_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(1, Invalid_Token_ID) & Index_ID'(2, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end variant_list_1;

   procedure variant_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T7, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4 => (False, (Simple, (Int,
         Ada_Indent_When))), T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end variant_part_0;

   procedure variant_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent))), T4 => (True, (Simple, (Int, Ada_Indent)),
         (Simple, (Int, Ada_Indent)))));
      end case;
   end variant_0;

   procedure discrete_choice_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end discrete_choice_0;

   procedure discrete_choice_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end discrete_choice_1;

   procedure discrete_choice_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end discrete_choice_2;

   procedure record_extension_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Label => None)), (Simple, (Language,
         Ada_Indent_Record_1'Access, 83 & Integer (T2) & 0))), T2 => (False, (Simple, (Label => None)))));
      end case;
   end record_extension_part_0;

   procedure abstract_subprogram_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T6,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Subprogram_Is))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end abstract_subprogram_declaration_0;

   procedure abstract_subprogram_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T6,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Subprogram_Is))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end abstract_subprogram_declaration_1;

   procedure abstract_subprogram_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Subprogram_Is))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple,
         (Label => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end abstract_subprogram_declaration_2;

   procedure abstract_subprogram_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Subprogram_Is))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end abstract_subprogram_declaration_3;

   procedure interface_list_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (1, 1, 2)));
      when Indent =>
         null;
      end case;
   end interface_list_0;

   procedure interface_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 2)));
      when Indent =>
         null;
      end case;
   end interface_list_1;

   procedure access_to_subprogram_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Anchored_1, T1, Ada_Indent_Broken)))));
      end case;
   end access_to_subprogram_definition_0;

   procedure access_to_subprogram_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Anchored_1, T1, Ada_Indent_Broken)))));
      end case;
   end access_to_subprogram_definition_1;

   procedure access_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         null;
      end case;
   end access_definition_0;

   procedure access_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T4 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         null;
      end case;
   end access_definition_1;

   procedure access_definition_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T4 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         null;
      end case;
   end access_definition_2;

   procedure access_definition_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T4 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         null;
      end case;
   end access_definition_3;

   procedure access_definition_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Label => None))), T4 => (False, (Simple, (Label => None))), T5 =>
         (False, (Simple, (Anchored_1, T4, Ada_Indent_Broken)))));
      end case;
   end access_definition_4;

   procedure access_definition_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Anchored_1, T4,
         Ada_Indent_Broken)))));
      end case;
   end access_definition_5;

   procedure access_definition_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Label => None))), T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Anchored_1, T4,
         Ada_Indent_Broken)))));
      end case;
   end access_definition_6;

   procedure access_definition_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T4 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T4 => (False, (Simple,
         (Label => None))), T5 => (False, (Simple, (Anchored_1, T4, Ada_Indent_Broken)))));
      end case;
   end access_definition_7;

   procedure access_definition_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Label => None))), T4 => (False, (Simple, (Label => None))), T5 =>
         (False, (Simple, (Anchored_1, T4, Ada_Indent_Broken)))));
      end case;
   end access_definition_8;

   procedure access_definition_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Anchored_1, T4,
         Ada_Indent_Broken)))));
      end case;
   end access_definition_9;

   procedure access_definition_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Label => None))), T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Anchored_1, T4,
         Ada_Indent_Broken)))));
      end case;
   end access_definition_10;

   procedure access_definition_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T4 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T4 => (False, (Simple,
         (Label => None))), T5 => (False, (Simple, (Anchored_1, T4, Ada_Indent_Broken)))));
      end case;
   end access_definition_11;

   procedure incomplete_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end incomplete_type_declaration_0;

   procedure incomplete_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end incomplete_type_declaration_1;

   procedure incomplete_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end incomplete_type_declaration_2;

   procedure incomplete_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T6 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end incomplete_type_declaration_3;

   function name_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, 1);
   end name_0_check;

   function name_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, 1);
   end name_3_check;

   procedure direct_name_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Mark_Action (Parse_Data, Tree, Nonterm, (1 => (1, Suffix)));
      when Indent =>
         null;
      end case;
   end direct_name_0;

   function direct_name_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, 1);
   end direct_name_0_check;

   function direct_name_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, 1);
   end direct_name_1_check;

   procedure slice_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Anchored_0, T2, 1))), T4 => (False, (Simple, (Anchored_0, T2,
         0)))));
      end case;
   end slice_0;

   procedure selected_component_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Mark_Action (Parse_Data, Tree, Nonterm, ((T1, Prefix), (T3, Suffix)));
      when Indent =>
         null;
      end case;
   end selected_component_0;

   function selected_component_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T1 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 3;
   begin
      return Merge_Names (Tree, Nonterm, Tokens, T1, T3);
   end selected_component_0_check;

   procedure range_attribute_designator_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Hanging_0, (Anchored_0, T2, 1), (Anchored_0, T2, 1 +
         Ada_Indent_Broken))), T4 => (False, (Simple, (Anchored_0, T2, 0)))));
      end case;
   end range_attribute_designator_0;

   procedure range_attribute_designator_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None)))));
      end case;
   end range_attribute_designator_1;

   procedure aggregate_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Anchored_0, T1, 1)), (Simple, (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end aggregate_4;

   procedure aggregate_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Anchored_0, T1, 1)), (Simple, (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end aggregate_5;

   procedure aggregate_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Anchored_0, T1, 1)), (Simple, (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end aggregate_6;

   procedure record_aggregate_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Anchored_0, T1, 1)), (Simple, (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end record_aggregate_0;

   procedure record_component_association_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, ((False, (Simple, (Label => None))), (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end record_component_association_0;

   procedure record_component_association_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end record_component_association_1;

   procedure component_choice_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end component_choice_list_1;

   procedure extension_aggregate_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_0, (Anchored_0, T1, 1), (Anchored_0, T1, 1 + Ada_Indent_Broken))), T3 => (False, (Simple,
         (Anchored_0, T1, 1))), T4 => (True, (Simple, (Anchored_0, T1, 1)), (Simple, (Anchored_0, T1, 1))), T5 =>
         (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end extension_aggregate_0;

   procedure expression_list_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (True, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)), (Hanging_0, (Label => None), (Int, Ada_Indent_Broken)))));
      end case;
   end expression_list_0;

   procedure expression_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (True, (Hanging_0, (Label => None), (Int, Ada_Indent_Broken)), (Hanging_0, (Label =>
         None), (Int, Ada_Indent_Broken)))));
      end case;
   end expression_list_1;

   procedure positional_array_aggregate_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Anchored_0, T1, 1)), (Simple, (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end positional_array_aggregate_0;

   procedure positional_array_aggregate_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Anchored_0, T1, 1))), T3 => (False, (Simple, (Label => None))), T4 => (False, (Simple, (Anchored_0, T1, 1))),
         T5 => (False, (Simple, (Anchored_0, T1, 1 + Ada_Indent_Broken))), T6 => (False, (Simple, (Anchored_0, T1,
         0)))));
      end case;
   end positional_array_aggregate_1;

   procedure positional_array_aggregate_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Anchored_0, T1, 1))), T3 => (False, (Simple, (Label => None))), T4 => (False, (Simple, (Anchored_0, T1, 1))),
         T5 => (False, (Simple, (Anchored_0, T1, 1 + Ada_Indent_Broken))), T6 => (False, (Simple, (Anchored_0, T1,
         0)))));
      end case;
   end positional_array_aggregate_2;

   procedure positional_array_aggregate_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T6 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Anchored_0, T1, 1))), T6 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end positional_array_aggregate_3;

   procedure named_array_aggregate_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Anchored_0, T1, 1)), (Simple, (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end named_array_aggregate_0;

   procedure named_array_aggregate_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Anchored_0, T1, 1)), (Simple, (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end named_array_aggregate_1;

   procedure array_component_association_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, ((False, (Hanging_0, (Label => None), (Int, Ada_Indent_Broken))),
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end array_component_association_0;

   procedure record_delta_aggregate_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_0, (Anchored_0, T1, 1), (Anchored_0, T1, 1 + Ada_Indent_Broken))), T3 => (False, (Simple,
         (Anchored_0, T1, 1))), T4 => (False, (Simple, (Anchored_0, T1, 1))), T5 => (True, (Simple, (Anchored_0, T1,
         1)), (Simple, (Anchored_0, T1, 1))), T6 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end record_delta_aggregate_0;

   procedure array_delta_aggregate_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_0, (Anchored_0, T1, 1), (Anchored_0, T1, 1 + Ada_Indent_Broken))), T3 => (False, (Simple,
         (Anchored_0, T1, 1))), T4 => (False, (Simple, (Anchored_0, T1, 1))), T5 => (True, (Simple, (Anchored_0, T1,
         1)), (Simple, (Anchored_0, T1, 1))), T6 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end array_delta_aggregate_0;

   procedure array_delta_aggregate_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_0, (Anchored_0, T1, 1), (Anchored_0, T1, 1 + Ada_Indent_Broken))), T3 => (False, (Simple,
         (Anchored_0, T1, 1))), T4 => (False, (Simple, (Anchored_0, T1, 1))), T5 => (True, (Simple, (Anchored_0, T1,
         1)), (Simple, (Anchored_0, T1, 1))), T6 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end array_delta_aggregate_1;

   procedure iterated_element_association_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iterated_element_association_0;

   procedure iterated_element_association_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iterated_element_association_1;

   procedure iterated_element_association_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iterated_element_association_2;

   procedure iterated_element_association_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iterated_element_association_3;

   procedure membership_choice_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end membership_choice_0;

   procedure membership_choice_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end membership_choice_1;

   procedure primary_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (1, 3, 0)));
      when Indent =>
         null;
      end case;
   end primary_0;

   procedure primary_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Simple, (Language, Ada_Indent_Aggregate'Access,
         Null_Args)))));
      end case;
   end primary_2;

   procedure elsif_expression_item_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Motion), (T3, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4
         => (False, (Hanging_2, (Int, Ada_Indent), (Int, Ada_Indent_Broken)))));
      end case;
   end elsif_expression_item_0;

   procedure elsif_expression_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(1, Invalid_Token_ID) & Index_ID'(2, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end elsif_expression_list_1;

   procedure if_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Motion), (T3, Motion), (T6, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3, Invalid_Token_ID) &
         Index_ID'(T5, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), T3 =>
         (False, (Simple, (Label => None))), T4 => (False, (Hanging_2, (Int, Ada_Indent), (Int, Ada_Indent_Broken))),
         T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Label => None))), T7 => (False, (Hanging_2,
         (Int, Ada_Indent), (Int, Ada_Indent_Broken)))));
      end case;
   end if_expression_0;

   procedure if_expression_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Motion), (T3, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3, Invalid_Token_ID) &
         Index_ID'(T5, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), T3 =>
         (False, (Simple, (Label => None))), T4 => (False, (Hanging_2, (Int, Ada_Indent), (Int, Ada_Indent_Broken))),
         T5 => (False, (Simple, (Label => None)))));
      end case;
   end if_expression_1;

   procedure if_expression_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Motion), (T3, Motion), (T6, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), T3 =>
         (False, (Simple, (Label => None))), T4 => (False, (Hanging_2, (Int, Ada_Indent), (Int, Ada_Indent_Broken))),
         T6 => (False, (Simple, (Label => None))), T7 => (False, (Hanging_2, (Int, Ada_Indent), (Int,
         Ada_Indent_Broken)))));
      end case;
   end if_expression_2;

   procedure if_expression_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Motion), (T3, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), T3 =>
         (False, (Simple, (Label => None))), T4 => (False, (Hanging_2, (Int, Ada_Indent), (Int, Ada_Indent_Broken)))));
      end case;
   end if_expression_3;

   procedure case_expression_alternative_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end case_expression_alternative_list_1;

   procedure case_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), T3 =>
         (False, (Simple, (Label => None))), T4 => (False, (Simple, (Int, Ada_Indent_When)))));
      end case;
   end case_expression_0;

   procedure case_expression_alternative_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_2, (Int,
         Ada_Indent), (Int, Ada_Indent_Broken)))));
      end case;
   end case_expression_alternative_0;

   procedure quantified_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end quantified_expression_0;

   procedure quantified_expression_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end quantified_expression_1;

   procedure declare_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Block, Ada_Indent))), T3 => (False, (Simple, (Label => None))), T4 => (False, (Hanging_1, (Int, Ada_Indent),
         (Int, Ada_Indent + Ada_Indent_Broken)))));
      end case;
   end declare_expression_0;

   procedure declare_expression_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Label => None))), T4 => (False, (Hanging_1, (Int, Ada_Indent), (Int, Ada_Indent + Ada_Indent_Broken)))));
      end case;
   end declare_expression_1;

   procedure reduction_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken))), T2 => (False, (Simple, (Label => None))), T3 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken)))));
      end case;
   end reduction_specification_0;

   procedure qualified_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (1, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, ((False, (Simple, (Label => None))), (False, (Simple, (Anchored_1,
         1, Ada_Indent_Broken))), (False, (Simple, (Anchored_1, 1, Ada_Indent_Broken)))));
      end case;
   end qualified_expression_0;

   procedure subtype_indication_paren_constraint_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 1, 2)));
      when Indent =>
         null;
      end case;
   end subtype_indication_paren_constraint_2;

   procedure subtype_indication_paren_constraint_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 1, 2)));
      when Indent =>
         null;
      end case;
   end subtype_indication_paren_constraint_3;

   procedure null_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end null_statement_0;

   procedure label_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 0)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Int, Ada_Indent_Label))), T2 => (False,
         (Simple, (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end label_0;

   procedure assignment_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken))), T2 => (False, (Hanging_1, (Anchored_1, T1, Ada_Indent_Broken), (Anchored_1, T1, 2 *
         Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end assignment_statement_0;

   procedure elsif_statement_item_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Motion), (T3, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4
         => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent)))));
      end case;
   end elsif_statement_item_0;

   procedure if_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
      T10 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Motion), (T6, Motion), (T10,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3, Invalid_Token_ID) &
         Index_ID'(T5, 42) & Index_ID'(T6, Invalid_Token_ID) & Index_ID'(T10, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), T3 =>
         (False, (Simple, (Label => None))), T4 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))),
         T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Label => None))), T7 => (True, (Simple,
         (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T8 => (False, (Simple, (Label => None))), T9 => (False,
         (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end if_statement_0;

   procedure if_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Motion), (T10, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3, Invalid_Token_ID) &
         Index_ID'(T5, 42) & Index_ID'(T10, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), T3 =>
         (False, (Simple, (Label => None))), T4 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))),
         T5 => (False, (Simple, (Label => None))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end if_statement_1;

   procedure if_statement_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Motion), (T6, Motion), (T10,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID) & Index_ID'(T10, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), T3 =>
         (False, (Simple, (Label => None))), T4 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))),
         T6 => (False, (Simple, (Label => None))), T7 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))),
         T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end if_statement_2;

   procedure if_statement_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Motion), (T10, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3, Invalid_Token_ID) &
         Index_ID'(T10, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken))), T3 =>
         (False, (Simple, (Label => None))), T4 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))),
         T8 => (False, (Simple, (Label => None))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end if_statement_3;

   procedure case_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, 63) & Index_ID'(T7,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4
         => (True, (Simple, (Int, Ada_Indent_When)), (Simple, (Int, Ada_Indent_When))), T5 => (False, (Simple, (Label
         => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end case_statement_0;

   procedure case_statement_alternative_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (True, (Simple, (Block,
         Ada_Indent)), (Simple, (Int, Ada_Indent)))));
      end case;
   end case_statement_alternative_0;

   procedure loop_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T3, Motion),
         (T8, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T2, Invalid_Token_ID) & Index_ID'(T3, Invalid_Token_ID) &
         Index_ID'(T8, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Int, Ada_Indent_Label))), T2 => (False,
         (Simple, (Label => None))), T3 => (False, (Simple, (Label => None))), T4 => (True, (Simple, (Block,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end loop_statement_0;

   function loop_statement_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T1 : constant SAL.Peek_Type := 1;
      T7 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T1, T7, End_Names_Optional);
   end loop_statement_0_check;

   procedure loop_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Motion), (T8, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T3, Invalid_Token_ID) & Index_ID'(T8,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Int, Ada_Indent_Label))), T3 => (False,
         (Simple, (Label => None))), T4 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T5 =>
         (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end loop_statement_1;

   function loop_statement_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T1 : constant SAL.Peek_Type := 1;
      T7 : constant SAL.Peek_Type := 6;
   begin
      return Match_Names (Tree, Tokens, T1, T7, End_Names_Optional);
   end loop_statement_1_check;

   procedure iteration_scheme_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iteration_scheme_0;

   procedure iteration_scheme_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iteration_scheme_1;

   procedure iteration_scheme_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iteration_scheme_2;

   procedure iteration_scheme_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (True, (Simple, (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iteration_scheme_3;

   procedure iteration_scheme_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (True, (Simple,
         (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iteration_scheme_4;

   procedure iteration_scheme_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Anchored_0, T1, 1))), T4 => (False, (Simple, (Anchored_0, T1, 0))),
         T5 => (False, (Simple, (Label => None))), T6 => (True, (Simple, (Int, Ada_Indent_Broken)), (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end iteration_scheme_5;

   procedure iteration_scheme_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T5 : constant SAL.Peek_Type := 2;
      T6 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T5 => (False, (Simple,
         (Label => None))), T6 => (True, (Simple, (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iteration_scheme_6;

   procedure iteration_scheme_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Anchored_0, T1, 1))), T4 => (False, (Simple, (Anchored_0, T1, 0))),
         T5 => (False, (Simple, (Label => None))), T6 => (True, (Simple, (Int, Ada_Indent_Broken)), (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end iteration_scheme_7;

   procedure iteration_scheme_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T5 : constant SAL.Peek_Type := 2;
      T6 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T5 => (False, (Simple,
         (Label => None))), T6 => (True, (Simple, (Int, Ada_Indent_Broken)), (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end iteration_scheme_8;

   procedure chunk_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end chunk_specification_0;

   procedure chunk_specification_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end chunk_specification_1;

   function label_opt_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T1 : constant SAL.Peek_Type := 1;
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, T1);
   end label_opt_0_check;

   procedure block_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T4,
         Statement_Override), (T8, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T2, Invalid_Token_ID) &
         Index_ID'(T4, Invalid_Token_ID) & Index_ID'(T5, 63) & Index_ID'(T8, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Int, Ada_Indent_Label))), T2 => (False,
         (Simple, (Label => None))), T3 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T4 =>
         (False, (Simple, (Label => None))), T5 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))),
         T6 => (False, (Simple, (Label => None))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end block_statement_0;

   function block_statement_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T1 : constant SAL.Peek_Type := 1;
      T7 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T1, T7, End_Names_Optional);
   end block_statement_0_check;

   procedure block_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T4 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Statement_Override), (T8,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T5, 63) & Index_ID'(T8, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Int, Ada_Indent_Label))), T4 => (False,
         (Simple, (Label => None))), T5 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T6 =>
         (False, (Simple, (Label => None))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end block_statement_1;

   function block_statement_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T1 : constant SAL.Peek_Type := 1;
      T7 : constant SAL.Peek_Type := 5;
   begin
      return Match_Names (Tree, Tokens, T1, T7, End_Names_Optional);
   end block_statement_1_check;

   procedure statement_AND_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, -Ada_Indent))), T3 => (False, (Simple, (Label => None)))));
      end case;
   end statement_AND_list_1;

   procedure parallel_block_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T4 => (False,
         (Simple, (Label => None))), T5 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T6 =>
         (False, (Simple, (Label => None))), T7 => (False, (Simple, (Label => None))), T8 => (False, (Simple, (Label =>
         None)))));
      end case;
   end parallel_block_statement_0;

   procedure exit_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Label => None))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end exit_statement_0;

   procedure exit_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end exit_statement_1;

   procedure exit_statement_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Label => None))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end exit_statement_2;

   procedure exit_statement_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T5 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T5 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end exit_statement_3;

   procedure goto_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 0)));
      when Indent =>
         null;
      end case;
   end goto_statement_0;

   procedure subprogram_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T4,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end subprogram_declaration_0;

   procedure subprogram_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T4,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end subprogram_declaration_1;

   procedure subprogram_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T4 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T4, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end subprogram_declaration_2;

   procedure subprogram_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T4 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T4, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end subprogram_declaration_3;

   function subprogram_specification_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, 1);
   end subprogram_specification_0_check;

   function subprogram_specification_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, 1);
   end subprogram_specification_1_check;

   procedure procedure_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Statement_Start)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)), (Simple, (Label => None))), T3 => (True,
         (Simple, (Int, Ada_Indent_Broken)), (Simple, (Label => None)))));
      end case;
   end procedure_specification_0;

   function procedure_specification_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, T2);
   end procedure_specification_0_check;

   procedure function_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Statement_Start)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end function_specification_0;

   function function_specification_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, T2);
   end function_specification_0_check;

   procedure result_profile_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Anchored_1, T1, Ada_Indent_Broken))), T3 => (False, (Hanging_0, (Anchored_1, T1, Ada_Indent_Broken),
         (Anchored_1, T1, Ada_Indent_Broken)))));
      end case;
   end result_profile_0;

   procedure result_profile_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T3 => (False,
         (Hanging_0, (Anchored_1, T1, Ada_Indent_Broken), (Anchored_1, T1, Ada_Indent_Broken)))));
      end case;
   end result_profile_1;

   procedure result_profile_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Anchored_1, T1, Ada_Indent_Broken)))));
      end case;
   end result_profile_2;

   procedure parameter_and_result_profile_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, ((False, (Simple, (Label => None))), (False, (Simple, (Language,
         Ada_Indent_Return_0'Access, 1 & 0)))));
      end case;
   end parameter_and_result_profile_0;

   procedure formal_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Misc)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end formal_part_0;

   procedure parameter_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T6, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_0,
         (Anchored_1, T2, Ada_Indent_Broken), (Anchored_1, T2, Ada_Indent_Broken))), T7 => (False, (Hanging_1,
         (Anchored_1, T2, Ada_Indent_Broken), (Anchored_1, T2, 2 * Ada_Indent_Broken)))));
      end case;
   end parameter_specification_0;

   procedure parameter_specification_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T6, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_0,
         (Anchored_1, T2, Ada_Indent_Broken), (Anchored_1, T2, Ada_Indent_Broken)))));
      end case;
   end parameter_specification_1;

   procedure parameter_specification_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T6, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Hanging_0, (Anchored_1, T2, Ada_Indent_Broken), (Anchored_1, T2,
         Ada_Indent_Broken))), T7 => (False, (Hanging_1, (Anchored_1, T2, Ada_Indent_Broken), (Anchored_1, T2, 2 *
         Ada_Indent_Broken)))));
      end case;
   end parameter_specification_2;

   procedure parameter_specification_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T6, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Hanging_0, (Anchored_1, T2, Ada_Indent_Broken), (Anchored_1, T2,
         Ada_Indent_Broken)))));
      end case;
   end parameter_specification_3;

   procedure parameter_specification_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T6, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Hanging_0, (Anchored_1, T2, Ada_Indent_Broken), (Anchored_1, T2,
         Ada_Indent_Broken))), T7 => (False, (Hanging_1, (Anchored_1, T2, Ada_Indent_Broken), (Anchored_1, T2, 2 *
         Ada_Indent_Broken)))));
      end case;
   end parameter_specification_4;

   procedure parameter_specification_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T6, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Hanging_0, (Anchored_1, T2, Ada_Indent_Broken), (Anchored_1, T2,
         Ada_Indent_Broken)))));
      end case;
   end parameter_specification_5;

   procedure parameter_specification_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T6, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_0,
         (Anchored_1, T2, Ada_Indent_Broken), (Anchored_1, T2, Ada_Indent_Broken))), T7 => (False, (Hanging_1,
         (Anchored_1, T2, Ada_Indent_Broken), (Anchored_1, T2, 2 * Ada_Indent_Broken)))));
      end case;
   end parameter_specification_6;

   procedure parameter_specification_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T6, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_0,
         (Anchored_1, T2, Ada_Indent_Broken), (Anchored_1, T2, Ada_Indent_Broken)))));
      end case;
   end parameter_specification_7;

   procedure parameter_specification_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end parameter_specification_8;

   procedure parameter_specification_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end parameter_specification_9;

   function name_opt_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T1 : constant SAL.Peek_Type := 1;
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, T1);
   end name_opt_0_check;

   procedure subprogram_body_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
      T10 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T4, Motion),
         (T6, Motion), (T10, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T2, Invalid_Token_ID) &
         Index_ID'(T4, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) & Index_ID'(T7, 63) & Index_ID'(T10,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Label => None))), T4 => (False, (Simple, (Label => None))), T5 =>
         (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T6 => (False, (Simple, (Label => None))),
         T7 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T8 => (False, (Simple, (Label =>
         None))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end subprogram_body_0;

   function subprogram_body_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 9;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end subprogram_body_0_check;

   procedure subprogram_body_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T4, Motion),
         (T6, Motion), (T10, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T2, Invalid_Token_ID) &
         Index_ID'(T4, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) & Index_ID'(T7, 63) & Index_ID'(T10,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T4 => (False, (Simple, (Label => None))), T5 => (True, (Simple, (Block, Ada_Indent)),
         (Simple, (Int, Ada_Indent))), T6 => (False, (Simple, (Label => None))), T7 => (True, (Simple, (Block,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end subprogram_body_1;

   function subprogram_body_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 8;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end subprogram_body_1_check;

   procedure subprogram_body_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T4, Motion), (T6, Motion), (T10,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T2, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID) & Index_ID'(T7, 63) & Index_ID'(T10, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Label => None))), T4 => (False, (Simple, (Label => None))), T5 => (True, (Simple, (Block, Ada_Indent)),
         (Simple, (Int, Ada_Indent))), T6 => (False, (Simple, (Label => None))), T7 => (True, (Simple, (Block,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end subprogram_body_2;

   function subprogram_body_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 1;
      T9 : constant SAL.Peek_Type := 8;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end subprogram_body_2_check;

   procedure subprogram_body_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T4 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T4, Motion), (T6, Motion), (T10,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T2, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID) & Index_ID'(T7, 63) & Index_ID'(T10, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T4 => (False, (Simple,
         (Label => None))), T5 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T6 => (False,
         (Simple, (Label => None))), T7 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T8 =>
         (False, (Simple, (Label => None))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end subprogram_body_3;

   function subprogram_body_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 1;
      T9 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end subprogram_body_3_check;

   procedure procedure_call_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken))), T2 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end procedure_call_statement_0;

   procedure function_call_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, ((False, (Simple, (Label => None))), (False, (Simple, (Anchored_1,
         1, Ada_Indent_Broken)))));
      end case;
   end function_call_0;

   procedure actual_parameter_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Anchored_0, T1, 1)), (Simple, (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end actual_parameter_part_0;

   procedure actual_parameter_part_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Anchored_0, T1, 1)), (Simple, (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end actual_parameter_part_1;

   procedure actual_parameter_part_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Anchored_0, T1, 1)), (Simple, (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end actual_parameter_part_2;

   procedure actual_parameter_part_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Anchored_0, T1, 1)), (Simple, (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0)))));
      end case;
   end actual_parameter_part_3;

   procedure assoc_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_1, (Anchored_1, T1, Ada_Indent_Broken), (Anchored_1, T1, 2 * Ada_Indent_Broken)))));
      end case;
   end assoc_expression_0;

   procedure parameter_association_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, ((False, (Simple, (Label => None))), (False, (Simple, (Int,
         Ada_Indent_Broken))), (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end parameter_association_0;

   procedure parameter_association_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (False, (Hanging_0, (Label => None), (Int,
         Ada_Indent_Broken)))));
      end case;
   end parameter_association_1;

   procedure simple_return_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end simple_return_statement_0;

   procedure simple_return_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end simple_return_statement_1;

   procedure extended_return_object_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1,
         (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken)))));
      end case;
   end extended_return_object_declaration_0;

   procedure extended_return_object_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end extended_return_object_declaration_1;

   procedure extended_return_object_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 *
         Ada_Indent_Broken)))));
      end case;
   end extended_return_object_declaration_2;

   procedure extended_return_object_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end extended_return_object_declaration_3;

   procedure extended_return_object_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 *
         Ada_Indent_Broken)))));
      end case;
   end extended_return_object_declaration_4;

   procedure extended_return_object_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end extended_return_object_declaration_5;

   procedure extended_return_object_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1,
         T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken)))));
      end case;
   end extended_return_object_declaration_6;

   procedure extended_return_object_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end extended_return_object_declaration_7;

   procedure extended_return_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Motion), (T7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3, Invalid_Token_ID) &
         Index_ID'(T4, 63) & Index_ID'(T7, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent))), T2 => (False, (Simple, (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4
         => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T5 => (False, (Simple, (Label =>
         None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end extended_return_statement_0;

   procedure extended_return_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T7 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T7,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent))), T2 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end extended_return_statement_1;

   procedure null_procedure_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T6,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Subprogram_Is))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end null_procedure_declaration_0;

   procedure null_procedure_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T6,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Subprogram_Is))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end null_procedure_declaration_1;

   procedure null_procedure_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Subprogram_Is))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple,
         (Label => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end null_procedure_declaration_2;

   procedure null_procedure_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Subprogram_Is))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end null_procedure_declaration_3;

   procedure expression_function_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T6,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Subprogram_Is))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end expression_function_declaration_0;

   procedure expression_function_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T6,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Subprogram_Is))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end expression_function_declaration_1;

   procedure expression_function_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Subprogram_Is))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple,
         (Label => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end expression_function_declaration_2;

   procedure expression_function_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Subprogram_Is))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end expression_function_declaration_3;

   procedure package_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T2,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end package_declaration_0;

   procedure package_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T6, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4
         => (False, (Simple, (Label => None))), T5 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T6 => (False, (Simple, (Label => None))), T7 => (True, (Simple, (Block, Ada_Indent)), (Simple,
         (Int, Ada_Indent))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken)))));
      end case;
   end package_specification_0;

   function package_specification_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 9;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end package_specification_0_check;

   procedure package_specification_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T6, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4
         => (False, (Simple, (Label => None))), T5 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T6 => (False, (Simple, (Label => None))), T8 => (False, (Simple, (Label => None))), T9 =>
         (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)))));
      end case;
   end package_specification_1;

   function package_specification_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 8;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end package_specification_1_check;

   procedure package_specification_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4
         => (False, (Simple, (Label => None))), T5 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Hanging_2, (Int, Ada_Indent_Broken),
         (Int, Ada_Indent_Broken)))));
      end case;
   end package_specification_2;

   function package_specification_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end package_specification_2_check;

   procedure package_specification_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T6, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4
         => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Label => None))), T7 => (True, (Simple, (Block,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), T8 => (False, (Simple, (Label => None))), T9 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)))));
      end case;
   end package_specification_3;

   function package_specification_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 8;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end package_specification_3_check;

   procedure package_specification_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T6, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4
         => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Label => None))), T8 => (False, (Simple, (Label
         => None))), T9 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)))));
      end case;
   end package_specification_4;

   function package_specification_4_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end package_specification_4_check;

   procedure package_specification_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4
         => (False, (Simple, (Label => None))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Hanging_2,
         (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)))));
      end case;
   end package_specification_5;

   function package_specification_5_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 6;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end package_specification_5_check;

   procedure package_specification_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T6, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T5
         => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T6 => (False, (Simple, (Label =>
         None))), T7 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T8 => (False, (Simple,
         (Label => None))), T9 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)))));
      end case;
   end package_specification_6;

   function package_specification_6_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 8;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end package_specification_6_check;

   procedure package_specification_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T6, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T5
         => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T6 => (False, (Simple, (Label =>
         None))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int,
         Ada_Indent_Broken)))));
      end case;
   end package_specification_7;

   function package_specification_7_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end package_specification_7_check;

   procedure package_specification_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T5
         => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T8 => (False, (Simple, (Label =>
         None))), T9 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)))));
      end case;
   end package_specification_8;

   function package_specification_8_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 6;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end package_specification_8_check;

   procedure package_specification_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T6, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T6
         => (False, (Simple, (Label => None))), T7 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Hanging_2, (Int, Ada_Indent_Broken),
         (Int, Ada_Indent_Broken)))));
      end case;
   end package_specification_9;

   function package_specification_9_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end package_specification_9_check;

   procedure package_specification_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T6, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T6
         => (False, (Simple, (Label => None))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Hanging_2,
         (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)))));
      end case;
   end package_specification_10;

   function package_specification_10_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 6;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end package_specification_10_check;

   procedure package_specification_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
      T9 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T9, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T8
         => (False, (Simple, (Label => None))), T9 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int,
         Ada_Indent_Broken)))));
      end case;
   end package_specification_11;

   function package_specification_11_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 5;
   begin
      return Match_Names (Tree, Tokens, T2, T9, End_Names_Optional);
   end package_specification_11_check;

   procedure package_body_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
      T10 : constant SAL.Peek_Type := 10;
      T11 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Motion), (T7, Motion), (T11,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T5, Invalid_Token_ID) &
         Index_ID'(T7, Invalid_Token_ID) & Index_ID'(T8, 63)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 1, 1), (T10, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4
         => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Label => None))), T6 => (True, (Simple, (Block,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), T7 => (False, (Simple, (Label => None))), T8 => (True, (Simple,
         (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T9 => (False, (Simple, (Label => None))), T10 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end package_body_0;

   function package_body_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 10;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end package_body_0_check;

   procedure package_body_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T5,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 1, 1), (T10, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4
         => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Label => None))), T6 => (True, (Simple, (Block,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), T9 => (False, (Simple, (Label => None))), T10 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end package_body_1;

   function package_body_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 8;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end package_body_1_check;

   procedure package_body_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
      T11 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Motion), (T7, Motion), (T11,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T5, Invalid_Token_ID) &
         Index_ID'(T7, Invalid_Token_ID) & Index_ID'(T8, 63)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 1, 1), (T10, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T5
         => (False, (Simple, (Label => None))), T6 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T7 => (False, (Simple, (Label => None))), T8 => (True, (Simple, (Block, Ada_Indent)), (Simple,
         (Int, Ada_Indent))), T9 => (False, (Simple, (Label => None))), T10 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end package_body_2;

   function package_body_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 9;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end package_body_2_check;

   procedure package_body_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
      T11 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T5,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 1, 1), (T10, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T5
         => (False, (Simple, (Label => None))), T6 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T9 => (False, (Simple, (Label => None))), T10 => (False, (Hanging_2, (Int, Ada_Indent_Broken),
         (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end package_body_3;

   function package_body_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end package_body_3_check;

   procedure private_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
      T10 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Label => None))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_0;

   procedure private_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_1;

   procedure private_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Label =>
         None))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_2;

   procedure private_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_3;

   procedure private_type_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Label =>
         None))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_4;

   procedure private_type_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_5;

   procedure private_type_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Label => None))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_6;

   procedure private_type_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_7;

   procedure private_type_declaration_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Label => None))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_8;

   procedure private_type_declaration_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_9;

   procedure private_type_declaration_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Label => None))), T10
         => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_10;

   procedure private_type_declaration_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T10 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_11;

   procedure private_type_declaration_12
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Label =>
         None))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_12;

   procedure private_type_declaration_13
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_13;

   procedure private_type_declaration_14
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Label => None))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_14;

   procedure private_type_declaration_15
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_15;

   procedure private_type_declaration_16
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Label => None))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_16;

   procedure private_type_declaration_17
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_17;

   procedure private_type_declaration_18
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Label =>
         None))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_18;

   procedure private_type_declaration_19
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T10 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_19;

   procedure private_type_declaration_20
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T7 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Label =>
         None))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_20;

   procedure private_type_declaration_21
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T7 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T10 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_21;

   procedure private_type_declaration_22
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
      T9 : constant SAL.Peek_Type := 5;
      T10 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Label => None))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_22;

   procedure private_type_declaration_23
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
      T10 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label => None))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_type_declaration_23;

   procedure private_extension_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
      T11 : constant SAL.Peek_Type := 10;
      T12 : constant SAL.Peek_Type := 11;
      T13 : constant SAL.Peek_Type := 12;
      T14 : constant SAL.Peek_Type := 13;
      T15 : constant SAL.Peek_Type := 14;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T14 => (False, (Simple, (Label => None))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_0;

   procedure private_extension_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
      T11 : constant SAL.Peek_Type := 10;
      T12 : constant SAL.Peek_Type := 11;
      T13 : constant SAL.Peek_Type := 12;
      T15 : constant SAL.Peek_Type := 13;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_1;

   procedure private_extension_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T12 : constant SAL.Peek_Type := 9;
      T13 : constant SAL.Peek_Type := 10;
      T14 : constant SAL.Peek_Type := 11;
      T15 : constant SAL.Peek_Type := 12;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T14 => (False, (Simple, (Label => None))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_2;

   procedure private_extension_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T12 : constant SAL.Peek_Type := 9;
      T13 : constant SAL.Peek_Type := 10;
      T15 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_3;

   procedure private_extension_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
      T11 : constant SAL.Peek_Type := 10;
      T12 : constant SAL.Peek_Type := 11;
      T13 : constant SAL.Peek_Type := 12;
      T14 : constant SAL.Peek_Type := 13;
      T15 : constant SAL.Peek_Type := 14;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T14 => (False, (Simple, (Label => None))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_4;

   procedure private_extension_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
      T11 : constant SAL.Peek_Type := 10;
      T12 : constant SAL.Peek_Type := 11;
      T13 : constant SAL.Peek_Type := 12;
      T15 : constant SAL.Peek_Type := 13;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_5;

   procedure private_extension_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T12 : constant SAL.Peek_Type := 9;
      T13 : constant SAL.Peek_Type := 10;
      T14 : constant SAL.Peek_Type := 11;
      T15 : constant SAL.Peek_Type := 12;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T14 => (False, (Simple, (Label => None))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_6;

   procedure private_extension_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T12 : constant SAL.Peek_Type := 9;
      T13 : constant SAL.Peek_Type := 10;
      T15 : constant SAL.Peek_Type := 11;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_7;

   procedure private_extension_declaration_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
      T12 : constant SAL.Peek_Type := 10;
      T13 : constant SAL.Peek_Type := 11;
      T14 : constant SAL.Peek_Type := 12;
      T15 : constant SAL.Peek_Type := 13;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T14 => (False, (Simple, (Label =>
         None))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_8;

   procedure private_extension_declaration_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
      T12 : constant SAL.Peek_Type := 10;
      T13 : constant SAL.Peek_Type := 11;
      T15 : constant SAL.Peek_Type := 12;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_9;

   procedure private_extension_declaration_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T12 : constant SAL.Peek_Type := 8;
      T13 : constant SAL.Peek_Type := 9;
      T14 : constant SAL.Peek_Type := 10;
      T15 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T14 => (False, (Simple, (Label =>
         None))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_10;

   procedure private_extension_declaration_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T12 : constant SAL.Peek_Type := 8;
      T13 : constant SAL.Peek_Type := 9;
      T15 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_11;

   procedure private_extension_declaration_12
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
      T12 : constant SAL.Peek_Type := 10;
      T13 : constant SAL.Peek_Type := 11;
      T14 : constant SAL.Peek_Type := 12;
      T15 : constant SAL.Peek_Type := 13;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T14 => (False, (Simple, (Label =>
         None))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_12;

   procedure private_extension_declaration_13
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
      T12 : constant SAL.Peek_Type := 10;
      T13 : constant SAL.Peek_Type := 11;
      T15 : constant SAL.Peek_Type := 12;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_13;

   procedure private_extension_declaration_14
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T12 : constant SAL.Peek_Type := 8;
      T13 : constant SAL.Peek_Type := 9;
      T14 : constant SAL.Peek_Type := 10;
      T15 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T14 => (False, (Simple, (Label =>
         None))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_14;

   procedure private_extension_declaration_15
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T12 : constant SAL.Peek_Type := 8;
      T13 : constant SAL.Peek_Type := 9;
      T15 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_15;

   procedure private_extension_declaration_16
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
      T12 : constant SAL.Peek_Type := 10;
      T13 : constant SAL.Peek_Type := 11;
      T14 : constant SAL.Peek_Type := 12;
      T15 : constant SAL.Peek_Type := 13;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T14 => (False, (Simple, (Label =>
         None))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_16;

   procedure private_extension_declaration_17
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
      T12 : constant SAL.Peek_Type := 10;
      T13 : constant SAL.Peek_Type := 11;
      T15 : constant SAL.Peek_Type := 12;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_17;

   procedure private_extension_declaration_18
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T12 : constant SAL.Peek_Type := 8;
      T13 : constant SAL.Peek_Type := 9;
      T14 : constant SAL.Peek_Type := 10;
      T15 : constant SAL.Peek_Type := 11;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T14 => (False, (Simple, (Label =>
         None))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_18;

   procedure private_extension_declaration_19
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T12 : constant SAL.Peek_Type := 8;
      T13 : constant SAL.Peek_Type := 9;
      T15 : constant SAL.Peek_Type := 10;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_19;

   procedure private_extension_declaration_20
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
      T11 : constant SAL.Peek_Type := 8;
      T12 : constant SAL.Peek_Type := 9;
      T13 : constant SAL.Peek_Type := 10;
      T14 : constant SAL.Peek_Type := 11;
      T15 : constant SAL.Peek_Type := 12;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T14 => (False, (Simple, (Label => None))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_20;

   procedure private_extension_declaration_21
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
      T11 : constant SAL.Peek_Type := 8;
      T12 : constant SAL.Peek_Type := 9;
      T13 : constant SAL.Peek_Type := 10;
      T15 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_21;

   procedure private_extension_declaration_22
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T12 : constant SAL.Peek_Type := 7;
      T13 : constant SAL.Peek_Type := 8;
      T14 : constant SAL.Peek_Type := 9;
      T15 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T14 => (False, (Simple, (Label => None))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_22;

   procedure private_extension_declaration_23
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T12 : constant SAL.Peek_Type := 7;
      T13 : constant SAL.Peek_Type := 8;
      T15 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_23;

   procedure private_extension_declaration_24
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
      T12 : constant SAL.Peek_Type := 10;
      T13 : constant SAL.Peek_Type := 11;
      T14 : constant SAL.Peek_Type := 12;
      T15 : constant SAL.Peek_Type := 13;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T14 => (False, (Simple, (Label =>
         None))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_24;

   procedure private_extension_declaration_25
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
      T12 : constant SAL.Peek_Type := 10;
      T13 : constant SAL.Peek_Type := 11;
      T15 : constant SAL.Peek_Type := 12;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_25;

   procedure private_extension_declaration_26
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T12 : constant SAL.Peek_Type := 8;
      T13 : constant SAL.Peek_Type := 9;
      T14 : constant SAL.Peek_Type := 10;
      T15 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T14 => (False, (Simple, (Label =>
         None))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_26;

   procedure private_extension_declaration_27
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T12 : constant SAL.Peek_Type := 8;
      T13 : constant SAL.Peek_Type := 9;
      T15 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_27;

   procedure private_extension_declaration_28
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
      T12 : constant SAL.Peek_Type := 10;
      T13 : constant SAL.Peek_Type := 11;
      T14 : constant SAL.Peek_Type := 12;
      T15 : constant SAL.Peek_Type := 13;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T14 => (False, (Simple, (Label =>
         None))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_28;

   procedure private_extension_declaration_29
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
      T12 : constant SAL.Peek_Type := 10;
      T13 : constant SAL.Peek_Type := 11;
      T15 : constant SAL.Peek_Type := 12;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_29;

   procedure private_extension_declaration_30
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T12 : constant SAL.Peek_Type := 8;
      T13 : constant SAL.Peek_Type := 9;
      T14 : constant SAL.Peek_Type := 10;
      T15 : constant SAL.Peek_Type := 11;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T14 => (False, (Simple, (Label =>
         None))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_30;

   procedure private_extension_declaration_31
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T12 : constant SAL.Peek_Type := 8;
      T13 : constant SAL.Peek_Type := 9;
      T15 : constant SAL.Peek_Type := 10;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_31;

   procedure private_extension_declaration_32
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
      T11 : constant SAL.Peek_Type := 8;
      T12 : constant SAL.Peek_Type := 9;
      T13 : constant SAL.Peek_Type := 10;
      T14 : constant SAL.Peek_Type := 11;
      T15 : constant SAL.Peek_Type := 12;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T14 => (False, (Simple, (Label => None))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_32;

   procedure private_extension_declaration_33
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
      T11 : constant SAL.Peek_Type := 8;
      T12 : constant SAL.Peek_Type := 9;
      T13 : constant SAL.Peek_Type := 10;
      T15 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_33;

   procedure private_extension_declaration_34
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T12 : constant SAL.Peek_Type := 7;
      T13 : constant SAL.Peek_Type := 8;
      T14 : constant SAL.Peek_Type := 9;
      T15 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T14 => (False, (Simple, (Label => None))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_34;

   procedure private_extension_declaration_35
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T12 : constant SAL.Peek_Type := 7;
      T13 : constant SAL.Peek_Type := 8;
      T15 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_35;

   procedure private_extension_declaration_36
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
      T11 : constant SAL.Peek_Type := 8;
      T12 : constant SAL.Peek_Type := 9;
      T13 : constant SAL.Peek_Type := 10;
      T14 : constant SAL.Peek_Type := 11;
      T15 : constant SAL.Peek_Type := 12;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T14 => (False, (Simple, (Label => None))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_36;

   procedure private_extension_declaration_37
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
      T11 : constant SAL.Peek_Type := 8;
      T12 : constant SAL.Peek_Type := 9;
      T13 : constant SAL.Peek_Type := 10;
      T15 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_37;

   procedure private_extension_declaration_38
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T12 : constant SAL.Peek_Type := 7;
      T13 : constant SAL.Peek_Type := 8;
      T14 : constant SAL.Peek_Type := 9;
      T15 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T14 => (False, (Simple, (Label => None))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_38;

   procedure private_extension_declaration_39
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T12 : constant SAL.Peek_Type := 7;
      T13 : constant SAL.Peek_Type := 8;
      T15 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_39;

   procedure private_extension_declaration_40
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
      T11 : constant SAL.Peek_Type := 8;
      T12 : constant SAL.Peek_Type := 9;
      T13 : constant SAL.Peek_Type := 10;
      T14 : constant SAL.Peek_Type := 11;
      T15 : constant SAL.Peek_Type := 12;
      T7 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T14 => (False, (Simple, (Label => None))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_40;

   procedure private_extension_declaration_41
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
      T11 : constant SAL.Peek_Type := 8;
      T12 : constant SAL.Peek_Type := 9;
      T13 : constant SAL.Peek_Type := 10;
      T15 : constant SAL.Peek_Type := 11;
      T7 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_41;

   procedure private_extension_declaration_42
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T12 : constant SAL.Peek_Type := 7;
      T13 : constant SAL.Peek_Type := 8;
      T14 : constant SAL.Peek_Type := 9;
      T15 : constant SAL.Peek_Type := 10;
      T7 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T14 => (False, (Simple, (Label => None))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_42;

   procedure private_extension_declaration_43
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T12 : constant SAL.Peek_Type := 7;
      T13 : constant SAL.Peek_Type := 8;
      T15 : constant SAL.Peek_Type := 9;
      T7 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken))), T13 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_43;

   procedure private_extension_declaration_44
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
      T9 : constant SAL.Peek_Type := 5;
      T10 : constant SAL.Peek_Type := 6;
      T11 : constant SAL.Peek_Type := 7;
      T12 : constant SAL.Peek_Type := 8;
      T13 : constant SAL.Peek_Type := 9;
      T14 : constant SAL.Peek_Type := 10;
      T15 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T14 => (False, (Simple, (Label =>
         None))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_44;

   procedure private_extension_declaration_45
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
      T9 : constant SAL.Peek_Type := 5;
      T10 : constant SAL.Peek_Type := 6;
      T11 : constant SAL.Peek_Type := 7;
      T12 : constant SAL.Peek_Type := 8;
      T13 : constant SAL.Peek_Type := 9;
      T15 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_45;

   procedure private_extension_declaration_46
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
      T9 : constant SAL.Peek_Type := 5;
      T12 : constant SAL.Peek_Type := 6;
      T13 : constant SAL.Peek_Type := 7;
      T14 : constant SAL.Peek_Type := 8;
      T15 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T14 => (False, (Simple, (Label =>
         None))), T15 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_46;

   procedure private_extension_declaration_47
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
      T9 : constant SAL.Peek_Type := 5;
      T12 : constant SAL.Peek_Type := 6;
      T13 : constant SAL.Peek_Type := 7;
      T15 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T15, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T13 => (False, (Simple, (Int, Ada_Indent_Broken))), T15 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end private_extension_declaration_47;

   procedure overriding_indicator_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end overriding_indicator_0;

   procedure overriding_indicator_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T2, Statement_Override)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end overriding_indicator_1;

   procedure use_package_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Use))), T3 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end use_package_clause_0;

   procedure use_type_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Use))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end use_type_clause_0;

   procedure use_type_clause_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Use))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end use_type_clause_1;

   procedure object_renaming_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T1);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 =>
         (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_renaming_declaration_0;

   procedure object_renaming_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T1);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 =>
         (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end object_renaming_declaration_1;

   procedure object_renaming_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T1);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T5
         => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end object_renaming_declaration_2;

   procedure object_renaming_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T1);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T5
         => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_renaming_declaration_3;

   procedure object_renaming_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T5 : constant SAL.Peek_Type := 2;
      T6 : constant SAL.Peek_Type := 3;
      T7 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T1);
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T5 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7
         => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_renaming_declaration_4;

   procedure object_renaming_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T5 : constant SAL.Peek_Type := 2;
      T6 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T1);
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T5 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8
         => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_renaming_declaration_5;

   procedure object_renaming_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T1);
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_renaming_declaration_6;

   procedure object_renaming_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T1);
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end object_renaming_declaration_7;

   procedure exception_renaming_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T1);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 3)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end exception_renaming_declaration_0;

   procedure exception_renaming_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T1);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 3)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end exception_renaming_declaration_1;

   procedure package_renaming_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T4, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T4 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T5 =>
         (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end package_renaming_declaration_0;

   procedure package_renaming_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 1), (T4, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T4 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end package_renaming_declaration_1;

   procedure subprogram_renaming_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T6,
         Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Language, Ada_Indent_Renames_0'Access, +Integer (T2)))), T4 =>
         (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Label =>
         None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end subprogram_renaming_declaration_0;

   procedure subprogram_renaming_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T6,
         Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Language, Ada_Indent_Renames_0'Access, +Integer (T2)))), T4 =>
         (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end subprogram_renaming_declaration_1;

   procedure subprogram_renaming_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T6, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Language, Ada_Indent_Renames_0'Access, +Integer (T2)))), T4 => (False, (Hanging_2, (Int, Ada_Indent_Broken),
         (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end subprogram_renaming_declaration_2;

   procedure subprogram_renaming_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T6, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Language, Ada_Indent_Renames_0'Access, +Integer (T2)))), T4 => (False, (Hanging_2, (Int, Ada_Indent_Broken),
         (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end subprogram_renaming_declaration_3;

   procedure generic_renaming_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 1, 1), (T5, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end generic_renaming_declaration_0;

   procedure generic_renaming_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 1, 1), (T5, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_renaming_declaration_1;

   procedure generic_renaming_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 1, 1), (T5, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end generic_renaming_declaration_2;

   procedure generic_renaming_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 1, 1), (T5, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_renaming_declaration_3;

   procedure generic_renaming_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 1, 1), (T5, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end generic_renaming_declaration_4;

   procedure generic_renaming_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 1, 1), (T5, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_renaming_declaration_5;

   procedure task_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
      T10 : constant SAL.Peek_Type := 10;
      T11 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T9, Motion), (T11,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T9, Invalid_Token_ID) & Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Label => None))), T6 => (True, (Simple, (Label => None)),
         (Simple, (Int, Ada_Indent))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Label =>
         None))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_0;

   function task_type_declaration_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 10;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end task_type_declaration_0_check;

   procedure task_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
      T11 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Label => None))), T6 => (True, (Simple, (Label => None)),
         (Simple, (Int, Ada_Indent))), T10 => (False, (Simple, (Label => None))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_1;

   function task_type_declaration_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end task_type_declaration_1_check;

   procedure task_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T11 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T11,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Label => None))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_2;

   procedure task_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
      T11 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T9, Motion), (T11,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T9, Invalid_Token_ID) & Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T7 => (False,
         (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Label => None))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_3;

   function task_type_declaration_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 9;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end task_type_declaration_3_check;

   procedure task_type_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T10 : constant SAL.Peek_Type := 6;
      T11 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T10 => (False,
         (Simple, (Label => None))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_4;

   function task_type_declaration_4_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 6;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end task_type_declaration_4_check;

   procedure task_type_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T11 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T11,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_5;

   procedure task_type_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
      T11 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T9, Motion), (T11,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T9, Invalid_Token_ID) & Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Label
         => None))), T6 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Label => None))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_6;

   function task_type_declaration_6_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 9;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end task_type_declaration_6_check;

   procedure task_type_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T10 : constant SAL.Peek_Type := 6;
      T11 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Label
         => None))), T6 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T10 => (False, (Simple,
         (Label => None))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_7;

   function task_type_declaration_7_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 6;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end task_type_declaration_7_check;

   procedure task_type_declaration_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T11 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T11,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Label
         => None))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_8;

   procedure task_type_declaration_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T9, Motion), (T11,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T9, Invalid_Token_ID) & Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (True, (Simple, (Label =>
         None)), (Simple, (Int, Ada_Indent))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False,
         (Simple, (Label => None))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_9;

   function task_type_declaration_9_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 8;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end task_type_declaration_9_check;

   procedure task_type_declaration_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T10 : constant SAL.Peek_Type := 5;
      T11 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (True, (Simple, (Label =>
         None)), (Simple, (Int, Ada_Indent))), T10 => (False, (Simple, (Label => None))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_10;

   function task_type_declaration_10_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 5;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end task_type_declaration_10_check;

   procedure task_type_declaration_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T11 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T11,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end task_type_declaration_11;

   procedure single_task_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T8, 27)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4 => (True, (Simple, (Label => None)),
         (Simple, (Int, Ada_Indent))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Label =>
         None))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end single_task_declaration_0;

   function single_task_declaration_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T8 : constant SAL.Peek_Type := 8;
   begin
      return Match_Names (Tree, Tokens, T2, T8, End_Names_Optional);
   end single_task_declaration_0_check;

   procedure single_task_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T8, 27)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4 => (True, (Simple, (Label => None)),
         (Simple, (Int, Ada_Indent))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end single_task_declaration_1;

   function single_task_declaration_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T8 : constant SAL.Peek_Type := 5;
   begin
      return Match_Names (Tree, Tokens, T2, T8, End_Names_Optional);
   end single_task_declaration_1_check;

   procedure single_task_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T9 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end single_task_declaration_2;

   procedure single_task_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T8, 27)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T5 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False,
         (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end single_task_declaration_3;

   function single_task_declaration_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T8 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T2, T8, End_Names_Optional);
   end single_task_declaration_3_check;

   procedure single_task_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
      T9 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T8, 27)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T8 =>
         (False, (Simple, (Label => None))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end single_task_declaration_4;

   function single_task_declaration_4_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T8 : constant SAL.Peek_Type := 4;
   begin
      return Match_Names (Tree, Tokens, T2, T8, End_Names_Optional);
   end single_task_declaration_4_check;

   procedure single_task_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end single_task_declaration_5;

   procedure task_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T2, Motion)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T2 => (False, (Simple, (Label => None))), T3 => (True, (Simple, (Int, Ada_Indent)), (Simple,
         (Int, Ada_Indent))), T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end task_definition_0;

   function task_definition_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T5 : constant SAL.Peek_Type := 5;
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, T5);
   end task_definition_0_check;

   procedure task_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T4 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 .. 0 => (1, Motion)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end task_definition_1;

   function task_definition_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T5 : constant SAL.Peek_Type := 3;
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, T5);
   end task_definition_1_check;

   procedure task_body_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
      T10 : constant SAL.Peek_Type := 10;
      T11 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Motion), (T7, Motion), (T11,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T5, Invalid_Token_ID) &
         Index_ID'(T7, Invalid_Token_ID) & Index_ID'(T8, 63) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 3, 2), (T10, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label =>
         None))), T5 => (False, (Simple, (Label => None))), T6 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T7 => (False, (Simple, (Label => None))), T8 => (True, (Simple, (Block, Ada_Indent)), (Simple,
         (Int, Ada_Indent))), T9 => (False, (Simple, (Label => None))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end task_body_0;

   function task_body_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 10;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end task_body_0_check;

   procedure task_body_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
      T11 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Motion), (T7, Motion), (T11,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T5, Invalid_Token_ID) &
         Index_ID'(T7, Invalid_Token_ID) & Index_ID'(T8, 63) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 3, 2), (T10, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Label =>
         None))), T6 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T7 => (False, (Simple,
         (Label => None))), T8 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T9 => (False,
         (Simple, (Label => None))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end task_body_1;

   function task_body_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 9;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end task_body_1_check;

   procedure protected_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
      T10 : constant SAL.Peek_Type := 10;
      T11 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Label => None))), T6 => (True, (Simple, (Label => None)),
         (Simple, (Int, Ada_Indent))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (True, (Simple, (Label =>
         None)), (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_type_declaration_0;

   function protected_type_declaration_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 10;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end protected_type_declaration_0_check;

   procedure protected_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
      T11 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Label => None))), T6 => (True, (Simple, (Label => None)),
         (Simple, (Int, Ada_Indent))), T10 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent_Broken))),
         T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_type_declaration_1;

   function protected_type_declaration_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end protected_type_declaration_1_check;

   procedure protected_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
      T11 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T7 => (False,
         (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T10 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent_Broken))), T11
         => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_type_declaration_2;

   function protected_type_declaration_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 9;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end protected_type_declaration_2_check;

   procedure protected_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T10 : constant SAL.Peek_Type := 6;
      T11 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T10 => (True,
         (Simple, (Label => None)), (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end protected_type_declaration_3;

   function protected_type_declaration_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 6;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end protected_type_declaration_3_check;

   procedure protected_type_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
      T11 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Label
         => None))), T6 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent_Broken))), T11 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_type_declaration_4;

   function protected_type_declaration_4_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 9;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end protected_type_declaration_4_check;

   procedure protected_type_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T10 : constant SAL.Peek_Type := 6;
      T11 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Label
         => None))), T6 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T10 => (True, (Simple,
         (Label => None)), (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_type_declaration_5;

   function protected_type_declaration_5_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 6;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end protected_type_declaration_5_check;

   procedure protected_type_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
      T11 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (True, (Simple, (Label =>
         None)), (Simple, (Int, Ada_Indent))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (True, (Simple,
         (Label => None)), (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_type_declaration_6;

   function protected_type_declaration_6_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 8;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end protected_type_declaration_6_check;

   procedure protected_type_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T10 : constant SAL.Peek_Type := 5;
      T11 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Motion), (T11, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T6, Invalid_Token_ID) &
         Index_ID'(T10, 27) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (True, (Simple, (Label =>
         None)), (Simple, (Int, Ada_Indent))), T10 => (True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_type_declaration_7;

   function protected_type_declaration_7_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T10 : constant SAL.Peek_Type := 5;
   begin
      return Match_Names (Tree, Tokens, T3, T10, End_Names_Optional);
   end protected_type_declaration_7_check;

   procedure single_protected_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T7, Motion), (T9,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T7, Invalid_Token_ID) & Index_ID'(T8, 27) & Index_ID'(T9, Invalid_Token_ID)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4 => (True, (Simple, (Label => None)),
         (Simple, (Int, Ada_Indent))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Label =>
         None))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end single_protected_declaration_0;

   function single_protected_declaration_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T8 : constant SAL.Peek_Type := 8;
   begin
      return Match_Names (Tree, Tokens, T2, T8, End_Names_Optional);
   end single_protected_declaration_0_check;

   procedure single_protected_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T9, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T8, 27) & Index_ID'(T9, Invalid_Token_ID)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4 => (True, (Simple, (Label => None)),
         (Simple, (Int, Ada_Indent))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end single_protected_declaration_1;

   function single_protected_declaration_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T8 : constant SAL.Peek_Type := 5;
   begin
      return Match_Names (Tree, Tokens, T2, T8, End_Names_Optional);
   end single_protected_declaration_1_check;

   procedure single_protected_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T7, Motion), (T9,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T7, Invalid_Token_ID) & Index_ID'(T8, 27) & Index_ID'(T9, Invalid_Token_ID)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T5 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False,
         (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end single_protected_declaration_2;

   function single_protected_declaration_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T8 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T2, T8, End_Names_Optional);
   end single_protected_declaration_2_check;

   procedure single_protected_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
      T9 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Motion), (T9, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T4, Invalid_Token_ID) &
         Index_ID'(T8, 27) & Index_ID'(T9, Invalid_Token_ID)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T8 =>
         (False, (Simple, (Label => None))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end single_protected_declaration_3;

   function single_protected_declaration_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T8 : constant SAL.Peek_Type := 4;
   begin
      return Match_Names (Tree, Tokens, T2, T8, End_Names_Optional);
   end single_protected_declaration_3_check;

   procedure protected_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T2, Motion)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T2 => (False, (Simple, (Label => None))), T3 => (True, (Simple, (Int, Ada_Indent)), (Simple,
         (Int, Ada_Indent))), T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end protected_definition_0;

   function protected_definition_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T5 : constant SAL.Peek_Type := 5;
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, T5);
   end protected_definition_0_check;

   procedure protected_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T2, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T2 => (False, (Simple, (Label => None))), T3 => (True, (Simple, (Int, Ada_Indent)), (Simple,
         (Int, Ada_Indent))), T4 => (False, (Simple, (Label => None)))));
      end case;
   end protected_definition_1;

   procedure protected_definition_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T2, Motion)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T2 => (False, (Simple, (Label => None))), T4 => (False, (Simple, (Label => None))), T5 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_definition_2;

   function protected_definition_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T5 : constant SAL.Peek_Type := 4;
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, T5);
   end protected_definition_2_check;

   procedure protected_definition_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T2, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T2 => (False, (Simple, (Label => None))), T4 => (False, (Simple, (Label => None)))));
      end case;
   end protected_definition_3;

   procedure protected_definition_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T4 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 .. 0 => (1, Motion)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_definition_4;

   function protected_definition_4_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T5 : constant SAL.Peek_Type := 3;
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, T5);
   end protected_definition_4_check;

   procedure protected_definition_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T4 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 .. 0 => (1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Int, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T4 => (False, (Simple, (Label => None)))));
      end case;
   end protected_definition_5;

   procedure protected_definition_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T2, Motion)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (True, (Simple,
         (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), T4 => (False, (Simple, (Label => None))), T5 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_definition_6;

   function protected_definition_6_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T5 : constant SAL.Peek_Type := 4;
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, T5);
   end protected_definition_6_check;

   procedure protected_definition_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T2, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (True, (Simple,
         (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), T4 => (False, (Simple, (Label => None)))));
      end case;
   end protected_definition_7;

   procedure protected_definition_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T4 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T2, Motion)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T4 => (False, (Simple,
         (Label => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_definition_8;

   function protected_definition_8_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T5 : constant SAL.Peek_Type := 3;
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, T5);
   end protected_definition_8_check;

   procedure protected_definition_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T4 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T2, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T4 => (False, (Simple,
         (Label => None)))));
      end case;
   end protected_definition_9;

   procedure protected_definition_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T4 : constant SAL.Peek_Type := 1;
      T5 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 .. 0 => (1, Motion)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T4 => (False, (Simple, (Label => None))), T5 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end protected_definition_10;

   function protected_definition_10_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Recover_Active);
      T5 : constant SAL.Peek_Type := 2;
   begin
      return Propagate_Name (Tree, Nonterm, Tokens, T5);
   end protected_definition_10_check;

   procedure protected_definition_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T4 : constant SAL.Peek_Type := 1;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 .. 0 => (1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T4 => (False, (Simple, (Label => None)))));
      end case;
   end protected_definition_11;

   procedure protected_body_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Motion), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T5, Invalid_Token_ID) &
         Index_ID'(T9, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 3, 2), (T8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T5 => (False, (Simple, (Label => None))), T6 => (True, (Simple, (Block, Ada_Indent)), (Simple,
         (Int, Ada_Indent))), T7 => (False, (Simple, (Label => None))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_body_0;

   function protected_body_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 8;
   begin
      return Match_Names (Tree, Tokens, T3, T8, End_Names_Optional);
   end protected_body_0_check;

   procedure protected_body_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Motion), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T5, Invalid_Token_ID) &
         Index_ID'(T9, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 3, 2), (T8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T5 => (False, (Simple, (Label => None))), T7 => (False, (Simple, (Label => None))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_body_1;

   function protected_body_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T3, T8, End_Names_Optional);
   end protected_body_1_check;

   procedure protected_body_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Motion), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T5, Invalid_Token_ID) &
         Index_ID'(T9, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 3, 2), (T8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Label
         => None))), T6 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T7 => (False, (Simple,
         (Label => None))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end protected_body_2;

   function protected_body_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T3, T8, End_Names_Optional);
   end protected_body_2_check;

   procedure protected_body_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Motion), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T5, Invalid_Token_ID) &
         Index_ID'(T9, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 3, 2), (T8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Label
         => None))), T7 => (False, (Simple, (Label => None))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_body_3;

   function protected_body_3_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T3 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 6;
   begin
      return Match_Names (Tree, Tokens, T3, T8, End_Names_Optional);
   end protected_body_3_check;

   procedure entry_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T9,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Anchored_0, T4, 1))), T6 => (False, (Simple, (Anchored_0, T4,
         0))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Label => None))), T9 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end entry_declaration_0;

   procedure entry_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T9,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Anchored_0, T4, 1))), T6 => (False, (Simple, (Anchored_0, T4,
         0))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end entry_declaration_1;

   procedure entry_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T7 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T9,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end entry_declaration_2;

   procedure entry_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T7 : constant SAL.Peek_Type := 4;
      T9 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T9,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end entry_declaration_3;

   procedure entry_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple,
         (Anchored_0, T4, 1))), T6 => (False, (Simple, (Anchored_0, T4, 0))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Label => None))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end entry_declaration_4;

   procedure entry_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple,
         (Anchored_0, T4, 1))), T6 => (False, (Simple, (Anchored_0, T4, 0))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end entry_declaration_5;

   procedure entry_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T7 : constant SAL.Peek_Type := 3;
      T8 : constant SAL.Peek_Type := 4;
      T9 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Label
         => None))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end entry_declaration_6;

   procedure entry_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T7 : constant SAL.Peek_Type := 3;
      T9 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T9, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end entry_declaration_7;

   procedure accept_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
      T10 : constant SAL.Peek_Type := 10;
      T11 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Motion), (T11, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T7, Invalid_Token_ID) &
         Index_ID'(T8, 63) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 3, 1), (T10, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 =>
         (True, (Simple, (Label => None)), (Simple, (Int, Ada_Indent))), T8 => (True, (Simple, (Block, Ada_Indent)),
         (Simple, (Int, Ada_Indent))), T9 => (False, (Simple, (Label => None))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end accept_statement_0;

   function accept_statement_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T10 : constant SAL.Peek_Type := 10;
   begin
      return Match_Names (Tree, Tokens, T2, T10, End_Names_Optional);
   end accept_statement_0_check;

   procedure accept_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T11 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T11, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T11,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T11
         => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end accept_statement_1;

   procedure accept_statement_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T6 : constant SAL.Peek_Type := 3;
      T7 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
      T11 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Motion), (T11, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T7, Invalid_Token_ID) &
         Index_ID'(T8, 63) & Index_ID'(T11, Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 3, 1), (T10, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (True, (Simple, (Label =>
         None)), (Simple, (Int, Ada_Indent))), T8 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int,
         Ada_Indent))), T9 => (False, (Simple, (Label => None))), T10 => (False, (Simple, (Int, Ada_Indent_Broken))),
         T11 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end accept_statement_2;

   function accept_statement_2_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T10 : constant SAL.Peek_Type := 7;
   begin
      return Match_Names (Tree, Tokens, T2, T10, End_Names_Optional);
   end accept_statement_2_check;

   procedure accept_statement_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T6 : constant SAL.Peek_Type := 3;
      T11 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T11, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T11,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T11 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end accept_statement_3;

   procedure entry_body_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
      T10 : constant SAL.Peek_Type := 10;
      T11 : constant SAL.Peek_Type := 11;
      T12 : constant SAL.Peek_Type := 12;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Motion), (T6, Motion), (T8, Motion),
         (T12, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T5, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID) & Index_ID'(T8, Invalid_Token_ID) & Index_ID'(T9, 63) & Index_ID'(T12,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 3, 1), (T11, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Label => None))), T7 =>
         (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), T8 => (False, (Simple, (Label => None))), T9
         => (True, (Simple, (Int, Ada_Indent)), (Simple, (Int, Ada_Indent))), T10 => (False, (Simple, (Label =>
         None))), T11 => (False, (Simple, (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end entry_body_0;

   function entry_body_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T11 : constant SAL.Peek_Type := 11;
   begin
      return Match_Names (Tree, Tokens, T2, T11, End_Names_Optional);
   end entry_body_0_check;

   procedure entry_body_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
      T11 : constant SAL.Peek_Type := 10;
      T12 : constant SAL.Peek_Type := 11;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Motion), (T6, Motion), (T8, Motion),
         (T12, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T5, Invalid_Token_ID) &
         Index_ID'(T6, Invalid_Token_ID) & Index_ID'(T8, Invalid_Token_ID) & Index_ID'(T9, 63) & Index_ID'(T12,
         Invalid_Token_ID)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 3, 1), (T11, 3, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Label => None))), T7 => (True, (Simple, (Int, Ada_Indent)),
         (Simple, (Int, Ada_Indent))), T8 => (False, (Simple, (Label => None))), T9 => (True, (Simple, (Int,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), T10 => (False, (Simple, (Label => None))), T11 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T12 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end entry_body_1;

   function entry_body_1_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Nonterm, Recover_Active);
      T2 : constant SAL.Peek_Type := 2;
      T11 : constant SAL.Peek_Type := 10;
   begin
      return Match_Names (Tree, Tokens, T2, T11, End_Names_Optional);
   end entry_body_1_check;

   procedure entry_body_formal_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Anchored_0, T1, 1))), T3 => (False, (Simple, (Anchored_0, T1, 0))), T4 => (False, (Simple, (Label =>
         None)))));
      end case;
   end entry_body_formal_part_0;

   procedure entry_body_formal_part_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T4 : constant SAL.Peek_Type := 1;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T4 => (False, (Simple, (Label => None)))));
      end case;
   end entry_body_formal_part_1;

   procedure entry_barrier_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken)))));
      end case;
   end entry_barrier_0;

   procedure requeue_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end requeue_statement_0;

   procedure requeue_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end requeue_statement_1;

   procedure delay_until_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T4, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end delay_until_statement_0;

   procedure delay_relative_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end delay_relative_statement_0;

   procedure guard_select_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, ((False, (Simple, (Label => None))), (False, (Simple, (Block,
         Ada_Indent)))));
      end case;
   end guard_select_0;

   procedure select_alternative_list_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T2, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, 48) & Index_ID'(T2, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, -Ada_Indent))), T3 => (False, (Simple, (Label => None)))));
      end case;
   end select_alternative_list_1;

   procedure selective_accept_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Motion), (T7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T2, 48) & Index_ID'(T3,
         Invalid_Token_ID) & Index_ID'(T7, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent))), T2 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T3 => (False,
         (Simple, (Label => None))), T4 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T5 =>
         (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end selective_accept_0;

   procedure selective_accept_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T2, 48) & Index_ID'(T7,
         Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent))), T2 => (True, (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T5 => (False,
         (Simple, (Label => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end selective_accept_1;

   procedure guard_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Anchored_0, T1, Ada_Indent_Broken))), T3 => (False, (Simple, (Anchored_0, T1, Ada_Indent_Broken)))));
      end case;
   end guard_0;

   procedure terminate_alternative_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end terminate_alternative_0;

   procedure timed_entry_call_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Motion), (T6, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3, Invalid_Token_ID) &
         Index_ID'(T7, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T3 => (False, (Simple, (Label => None))), T4 => (True,
         (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T5 => (False, (Simple, (Label => None))), T6 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end timed_entry_call_0;

   procedure conditional_entry_call_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Motion), (T7, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3, Invalid_Token_ID) &
         Index_ID'(T7, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T3 => (False, (Simple, (Label => None))), T4 => (True,
         (Simple, (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T5 => (False, (Simple, (Label => None))), T6 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end conditional_entry_call_0;

   procedure asynchronous_select_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Motion), (T8, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T3, Invalid_Token_ID) &
         Index_ID'(T8, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (True, (Simple,
         (Block, Ada_Indent)), (Simple, (Int, Ada_Indent))), T3 => (True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (True, (Simple, (Block,
         Ada_Indent)), (Simple, (Int, Ada_Indent))), T6 => (False, (Simple, (Label => None))), T7 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end asynchronous_select_0;

   procedure abort_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Statement_Start)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end abort_statement_0;

   procedure compilation_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (1 => (True, (Simple, (Int, 0)), (Simple, (Int, 0)))));
      end case;
   end compilation_0;

   function compilation_0_check
    (Tree           : in     WisiToken.Syntax_Trees.Tree;
     Nonterm        : in out WisiToken.Syntax_Trees.Recover_Token;
     Tokens         : in     WisiToken.Syntax_Trees.Recover_Token_Array;
     Recover_Active : in     Boolean)
    return WisiToken.Syntax_Trees.In_Parse_Actions.Status
   is
      pragma Unreferenced (Tokens);
   begin
      return Terminate_Partial_Parse (Tree, Partial_Parse_Active, Partial_Parse_Byte_Goal, Recover_Active, Nonterm);
   end compilation_0_check;

   procedure compilation_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, ((False, (Simple, (Int, 0))), (True, (Simple, (Int, 0)), (Simple,
         (Int, 0)))));
      end case;
   end compilation_1;

   procedure compilation_unit_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Int, 0))), T2 => (False, (Simple, (Int,
         0)))));
      end case;
   end compilation_unit_1;

   procedure compilation_unit_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Int, 0)))));
      end case;
   end compilation_unit_2;

   procedure limited_with_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_With))), T5 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end limited_with_clause_0;

   procedure limited_with_clause_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, (1 => (T4, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_With))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end limited_with_clause_1;

   procedure nonlimited_with_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T4,
         Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_With))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end nonlimited_with_clause_0;

   procedure nonlimited_with_clause_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T4, Statement_End)));
      when Face =>
         Face_Apply_List_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Int, Ada_Indent_With))), T4 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end nonlimited_with_clause_1;

   procedure subprogram_body_stub_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T6,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Label => None))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Label => None))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end subprogram_body_stub_0;

   procedure subprogram_body_stub_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T6,
         Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Label => None))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end subprogram_body_stub_1;

   procedure subprogram_body_stub_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Label => None))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Label =>
         None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end subprogram_body_stub_2;

   procedure subprogram_body_stub_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple,
         (Label => None))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end subprogram_body_stub_3;

   procedure package_body_stub_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Label => None))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end package_body_stub_0;

   procedure package_body_stub_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label
         => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end package_body_stub_1;

   procedure task_body_stub_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label =>
         None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Label => None))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end task_body_stub_0;

   procedure task_body_stub_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Label =>
         None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end task_body_stub_1;

   procedure protected_body_stub_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Label =>
         None))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end protected_body_stub_0;

   procedure protected_body_stub_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end protected_body_stub_1;

   procedure subunit_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Statement_Start)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Anchored_0, T2, 1))), T4 => (False, (Simple, (Anchored_0,
         T2, 0))), T5 => (False, (Simple, (Label => None)))));
      end case;
   end subunit_0;

   procedure exception_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end exception_declaration_0;

   procedure exception_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end exception_declaration_1;

   procedure exception_handler_list_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((1, Motion), (2, Motion)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(1, Invalid_Token_ID) & Index_ID'(2, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end exception_handler_list_2;

   procedure handled_sequence_of_statements_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Label => None)), (Simple, (Label =>
         None))), T2 => (False, (Simple, (Int, -Ada_Indent))), T3 => (True, (Simple, (Int, Ada_Indent_When -
         Ada_Indent)), (Simple, (Int, Ada_Indent_When - Ada_Indent)))));
      end case;
   end handled_sequence_of_statements_0;

   procedure handled_sequence_of_statements_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Label => None)), (Simple, (Label =>
         None)))));
      end case;
   end handled_sequence_of_statements_1;

   procedure exception_handler_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (True, (Simple, (Block,
         Ada_Indent)), (Simple, (Int, Ada_Indent)))));
      end case;
   end exception_handler_0;

   procedure exception_handler_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T4 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Motion)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T4 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (True, (Simple, (Block,
         Ada_Indent)), (Simple, (Int, Ada_Indent)))));
      end case;
   end exception_handler_1;

   procedure raise_statement_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end raise_statement_0;

   procedure raise_statement_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T4 => (False, (Simple, (Anchored_1, T3, Ada_Indent_Broken))), T5 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end raise_statement_1;

   procedure raise_statement_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end raise_statement_2;

   procedure raise_expression_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end raise_expression_0;

   procedure raise_expression_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end raise_expression_1;

   procedure generic_subprogram_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T4,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T2, Invalid_Token_ID) &
         Index_ID'(T4, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end generic_subprogram_declaration_0;

   procedure generic_subprogram_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T4,
         Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T2, Invalid_Token_ID) &
         Index_ID'(T4, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end generic_subprogram_declaration_1;

   procedure generic_package_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T3, Statement_End)));
         Motion_Action (Parse_Data, Tree, Nonterm, (Index_ID'(T1, Invalid_Token_ID) & Index_ID'(T2, Invalid_Token_ID) &
         Index_ID'(T3, Invalid_Token_ID)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (True, (Simple, (Label => None)), (Simple, (Int,
         Ada_Indent))), T2 => (False, (Simple, (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_package_declaration_0;

   procedure generic_formal_part_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Statement_Start)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Block, Ada_Indent)))));
      end case;
   end generic_formal_part_0;

   procedure generic_formal_part_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, (1 => (T1, Statement_Start)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None)))));
      end case;
   end generic_formal_part_1;

   procedure generic_instantiation_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4
         => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Label => None))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_0;

   procedure generic_instantiation_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T2);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Label => None))), T4
         => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_1;

   procedure generic_instantiation_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T8,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Label => None))), T8
         => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_2;

   procedure generic_instantiation_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T8,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_3;

   procedure generic_instantiation_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Label => None))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_4;

   procedure generic_instantiation_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_5;

   procedure generic_instantiation_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T8,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Label => None))), T8
         => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_6;

   procedure generic_instantiation_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T2, Statement_Override), (T8,
         Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_7;

   procedure generic_instantiation_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Label => None))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_8;

   procedure generic_instantiation_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T2 : constant SAL.Peek_Type := 1;
      T3 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T2, Statement_Override), (T8, Statement_End)));
         Name_Action (Parse_Data, Tree, Nonterm, T3);
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T3, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T2 => (False, (Simple, (Label => None))), T3 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end generic_instantiation_9;

   procedure formal_object_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 =>
         (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_0;

   procedure formal_object_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 =>
         (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken), (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_1;

   procedure formal_object_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 =>
         (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_2;

   procedure formal_object_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_3;

   procedure formal_object_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False,
         (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_4;

   procedure formal_object_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_1, (Anchored_1, T5, Ada_Indent_Broken),
         (Anchored_1, T5, 2 * Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_5;

   procedure formal_object_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_6;

   procedure formal_object_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_7;

   procedure formal_object_declaration_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_1, (Anchored_1, T4, Ada_Indent_Broken), (Anchored_1, T4, 2 *
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_8;

   procedure formal_object_declaration_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Hanging_1, (Anchored_1, T4, Ada_Indent_Broken), (Anchored_1, T4, 2 *
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_9;

   procedure formal_object_declaration_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_10;

   procedure formal_object_declaration_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_object_declaration_11;

   procedure formal_complete_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
      T10 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 3, 2), (T8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_complete_type_declaration_0;

   procedure formal_complete_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 3, 2), (T8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_complete_type_declaration_1;

   procedure formal_complete_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_complete_type_declaration_2;

   procedure formal_complete_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T10 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_complete_type_declaration_3;

   procedure formal_complete_type_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 3, 2), (T8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_complete_type_declaration_4;

   procedure formal_complete_type_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 3, 2), (T8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_complete_type_declaration_5;

   procedure formal_complete_type_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T9 : constant SAL.Peek_Type := 5;
      T10 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_complete_type_declaration_6;

   procedure formal_complete_type_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T10 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_complete_type_declaration_7;

   procedure formal_incomplete_type_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T9, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 3, 2), (T8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_incomplete_type_declaration_0;

   procedure formal_incomplete_type_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T9, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_incomplete_type_declaration_1;

   procedure formal_incomplete_type_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T9, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 3, 2), (T8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_incomplete_type_declaration_2;

   procedure formal_incomplete_type_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T9 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T9, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_incomplete_type_declaration_3;

   procedure formal_incomplete_type_declaration_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T9, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 3, 2), (T8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_incomplete_type_declaration_4;

   procedure formal_incomplete_type_declaration_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T4 : constant SAL.Peek_Type := 3;
      T5 : constant SAL.Peek_Type := 4;
      T9 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T9, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_incomplete_type_declaration_5;

   procedure formal_incomplete_type_declaration_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T6 : constant SAL.Peek_Type := 3;
      T7 : constant SAL.Peek_Type := 4;
      T8 : constant SAL.Peek_Type := 5;
      T9 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T9, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 3, 2), (T8, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_incomplete_type_declaration_6;

   procedure formal_incomplete_type_declaration_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T9 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T9, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 3, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T9 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_incomplete_type_declaration_7;

   procedure formal_derived_type_definition_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_0;

   procedure formal_derived_type_definition_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_1;

   procedure formal_derived_type_definition_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_2;

   procedure formal_derived_type_definition_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_3;

   procedure formal_derived_type_definition_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_4;

   procedure formal_derived_type_definition_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_5;

   procedure formal_derived_type_definition_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_6;

   procedure formal_derived_type_definition_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_7;

   procedure formal_derived_type_definition_8
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_8;

   procedure formal_derived_type_definition_9
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_9;

   procedure formal_derived_type_definition_10
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_10;

   procedure formal_derived_type_definition_11
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_11;

   procedure formal_derived_type_definition_12
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_12;

   procedure formal_derived_type_definition_13
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_13;

   procedure formal_derived_type_definition_14
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_14;

   procedure formal_derived_type_definition_15
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_15;

   procedure formal_derived_type_definition_16
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_16;

   procedure formal_derived_type_definition_17
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T5 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T5, 1, 2)));
      when Indent =>
         null;
      end case;
   end formal_derived_type_definition_17;

   procedure formal_concrete_subprogram_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_concrete_subprogram_declaration_0;

   procedure formal_concrete_subprogram_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_concrete_subprogram_declaration_1;

   procedure formal_concrete_subprogram_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T5 : constant SAL.Peek_Type := 3;
      T6 : constant SAL.Peek_Type := 4;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_concrete_subprogram_declaration_2;

   procedure formal_concrete_subprogram_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T6 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T6 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_concrete_subprogram_declaration_3;

   procedure formal_abstract_subprogram_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_abstract_subprogram_declaration_0;

   procedure formal_abstract_subprogram_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_abstract_subprogram_declaration_1;

   procedure formal_abstract_subprogram_declaration_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T6 => (False, (Simple, (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end formal_abstract_subprogram_declaration_2;

   procedure formal_abstract_subprogram_declaration_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_abstract_subprogram_declaration_3;

   procedure default_name_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (1, 1, 1)));
      when Indent =>
         null;
      end case;
   end default_name_0;

   procedure formal_package_declaration_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 1, 1), (T6, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_package_declaration_0;

   procedure formal_package_declaration_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T3, 1, 1), (T6, 1, 1)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Hanging_2, (Int,
         Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end formal_package_declaration_1;

   procedure aspect_association_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Label => None))), T3 => (False, (Simple, (Language, Ada_Indent_Aspect'Access, Null_Args)))));
      end case;
   end aspect_association_0;

   procedure aspect_association_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None)))));
      end case;
   end aspect_association_1;

   procedure aspect_specification_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end aspect_specification_0;

   procedure attribute_definition_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T7, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Label => None)))));
      end case;
   end attribute_definition_clause_0;

   procedure enumeration_representation_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T5, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T4 => (False, (Simple, (Int, Ada_Indent_Broken))), T5 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end enumeration_representation_clause_0;

   procedure record_representation_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T9 : constant SAL.Peek_Type := 9;
      T10 : constant SAL.Peek_Type := 10;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 2), (T9, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T4 => (True, (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0)),
         (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent))), T5 => (False, (Simple,
         (Language, Ada_Indent_Record_0'Access, Integer (T1) & Integer (T4) & Ada_Indent))), T6 => (True, (Simple,
         (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent)), (Simple, (Language,
         Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent))), T7 => (False, (Simple, (Language,
         Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 =>
         (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end record_representation_clause_0;

   procedure record_representation_clause_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T4 => (True, (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0)),
         (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent))), T5 => (False, (Simple,
         (Language, Ada_Indent_Record_0'Access, Integer (T1) & Integer (T4) & Ada_Indent))), T6 => (True, (Simple,
         (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent)), (Simple, (Language,
         Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent))), T7 => (False, (Simple, (Language,
         Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T10
         => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end record_representation_clause_1;

   procedure record_representation_clause_2
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 2), (T9, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T4 => (True, (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0)),
         (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent))), T5 => (False, (Simple,
         (Language, Ada_Indent_Record_0'Access, Integer (T1) & Integer (T4) & Ada_Indent))), T7 => (False, (Simple,
         (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T10 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end record_representation_clause_2;

   procedure record_representation_clause_3
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T4 => (True, (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0)),
         (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent))), T5 => (False, (Simple,
         (Language, Ada_Indent_Record_0'Access, Integer (T1) & Integer (T4) & Ada_Indent))), T7 => (False, (Simple,
         (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end record_representation_clause_3;

   procedure record_representation_clause_4
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T9 : constant SAL.Peek_Type := 8;
      T10 : constant SAL.Peek_Type := 9;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 2), (T9, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T4 => (True, (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0)),
         (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent))), T6 => (True, (Simple,
         (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent)), (Simple, (Language,
         Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent))), T7 => (False, (Simple, (Language,
         Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T9 =>
         (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T10 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end record_representation_clause_4;

   procedure record_representation_clause_5
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T6 : constant SAL.Peek_Type := 5;
      T7 : constant SAL.Peek_Type := 6;
      T8 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T4 => (True, (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0)),
         (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent))), T6 => (True, (Simple,
         (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent)), (Simple, (Language,
         Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent))), T7 => (False, (Simple, (Language,
         Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0))), T8 => (False, (Simple, (Int, Ada_Indent_Broken))), T10
         => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end record_representation_clause_5;

   procedure record_representation_clause_6
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T9 : constant SAL.Peek_Type := 7;
      T10 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, ((T2, 1, 2), (T9, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T4 => (True, (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0)),
         (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent))), T7 => (False, (Simple,
         (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T9 => (False, (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T10 =>
         (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end record_representation_clause_6;

   procedure record_representation_clause_7
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T7 : constant SAL.Peek_Type := 5;
      T8 : constant SAL.Peek_Type := 6;
      T10 : constant SAL.Peek_Type := 7;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T10, Statement_End)));
      when Face =>
         Face_Apply_Action (Parse_Data, Tree, Nonterm, (1 => (T2, 1, 2)));
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False,
         (Hanging_2, (Int, Ada_Indent_Broken), (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T4 => (True, (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0)),
         (Simple, (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & Ada_Indent))), T7 => (False, (Simple,
         (Language, Ada_Indent_Record_1'Access, 51 & Integer (T4) & 0))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T10 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end record_representation_clause_7;

   procedure component_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
      T4 : constant SAL.Peek_Type := 4;
      T5 : constant SAL.Peek_Type := 5;
      T6 : constant SAL.Peek_Type := 6;
      T7 : constant SAL.Peek_Type := 7;
      T8 : constant SAL.Peek_Type := 8;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T8, Statement_End)));
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken))), T4 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T5 => (False, (Simple, (Int, Ada_Indent_Broken))), T6 => (False, (Simple, (Int,
         Ada_Indent_Broken))), T7 => (False, (Simple, (Int, Ada_Indent_Broken))), T8 => (False, (Simple, (Int,
         Ada_Indent_Broken)))));
      end case;
   end component_clause_0;

   procedure delta_constraint_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
      T3 : constant SAL.Peek_Type := 3;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken))), T3 => (False, (Simple, (Int, Ada_Indent_Broken)))));
      end case;
   end delta_constraint_0;

   procedure delta_constraint_1
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T2 : constant SAL.Peek_Type := 2;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         null;
      when Face =>
         null;
      when Indent =>
         Indent_Action_0 (Parse_Data, Tree, Nonterm, (T1 => (False, (Simple, (Label => None))), T2 => (False, (Simple,
         (Int, Ada_Indent_Broken)))));
      end case;
   end delta_constraint_1;

   procedure at_clause_0
     (User_Data : in out WisiToken.Syntax_Trees.User_Data_Type'Class;
      Tree      : in out WisiToken.Syntax_Trees.Tree;
      Nonterm   : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   is
      Parse_Data : Wisi.Parse_Data_Type renames Wisi.Parse_Data_Type (User_Data);
      T1 : constant SAL.Peek_Type := 1;
      T6 : constant SAL.Peek_Type := 6;
   begin
      case Parse_Data.Post_Parse_Action is
      when Navigate =>
         Statement_Action (Parse_Data, Tree, Nonterm, ((T1, Statement_Start), (T6, Statement_End)));
      when Face =>
         null;
      when Indent =>
         null;
      end case;
   end at_clause_0;

end Ada_Annex_P_Process_Actions;
