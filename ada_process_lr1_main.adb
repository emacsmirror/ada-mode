--  generated parser support file.
--  command line: wisitoken-bnf-generate.exe  --generate LR1 Ada_Emacs re2c PROCESS text_rep ada.wy
--

--  Copyright (C) 2013 - 2018 Free Software Foundation, Inc.

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

with Ada_Process_Actions; use Ada_Process_Actions;
with WisiToken.Lexer.re2c;
with ada_re2c_c;
with WisiToken.Productions;
package body Ada_Process_LR1_Main is

   package Lexer is new WisiToken.Lexer.re2c
     (ada_re2c_c.New_Lexer,
      ada_re2c_c.Free_Lexer,
      ada_re2c_c.Reset_Lexer,
      ada_re2c_c.Next_Token);

   procedure Create_Parser
     (Parser                       :    out WisiToken.Parse.LR.Parser.Parser;
      Language_Fixes               : in     WisiToken.Parse.LR.Parser.Language_Fixes_Access;
      Language_Use_Minimal_Complete_Actions : in
     WisiToken.Parse.LR.Parser.Language_Use_Minimal_Complete_Actions_Access;
      Language_String_ID_Set       : in     WisiToken.Parse.LR.Parser.Language_String_ID_Set_Access;
      Trace                        : not null access WisiToken.Trace'Class;
      User_Data                    : in     WisiToken.Syntax_Trees.User_Data_Access;
      Text_Rep_File_Name : in String)
   is
      use WisiToken.Parse.LR;
      McKenzie_Param : constant McKenzie_Param_Type :=
        (First_Terminal    => 3,
         Last_Terminal     => 107,
         First_Nonterminal => 108,
         Last_Nonterminal  => 332,
         Insert =>
           (3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 3, 2, 3, 2, 3, 3, 3, 3, 2, 3, 1, 3, 3, 2, 3, 3, 3, 3, 2, 3, 3, 2, 3, 2, 3,
            3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3, 2, 3, 3, 2, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3, 2, 3, 3,
            3, 2, 1, 3, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3),
         Delete =>
           (3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 3, 2, 3, 1, 3, 3, 3, 3, 1, 3, 1, 3, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3, 3, 2, 3,
            3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
            3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3),
         Push_Back =>
           (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2),
         Ignore_Check_Fail  => 0,
         Task_Count  => 0,
         Cost_Limit  => 20,
         Check_Limit => 4,
         Check_Delta_Limit => 200,
         Enqueue_Limit => 15000);

      function Productions return WisiToken.Productions.Prod_Arrays.Vector
      is begin
         return Prods : WisiToken.Productions.Prod_Arrays.Vector do
            Prods.Set_First (108);
            Prods.Set_Last (332);
            Set_Production (Prods (108), 108, 0);
            Set_RHS (Prods (108), 0, (143, 107), null, null);
            Set_Production (Prods (109), 109, 5);
            Set_RHS (Prods (109), 0, (6, 36), null, null);
            Set_RHS (Prods (109), 1, (6, 64), null, null);
            Set_RHS (Prods (109), 2, (1 => 6), null, null);
            Set_RHS (Prods (109), 3, (1 => 36), null, null);
            Set_RHS (Prods (109), 4, (1 => 64), null, null);
            Set_RHS (Prods (109), 5, (1 .. 0 => <>), null, null);
            Set_Production (Prods (110), 110, 3);
            Set_RHS (Prods (110), 0, (6, 36), null, null);
            Set_RHS (Prods (110), 1, (1 => 36), null, null);
            Set_RHS (Prods (110), 2, (1 => 6), null, null);
            Set_RHS (Prods (110), 3, (1 .. 0 => <>), null, null);
            Set_Production (Prods (111), 111, 5);
            Set_RHS (Prods (111), 0, (6, 65, 36), null, null);
            Set_RHS (Prods (111), 1, (6, 65), null, null);
            Set_RHS (Prods (111), 2, (65, 36), null, null);
            Set_RHS (Prods (111), 3, (1 => 65), null, null);
            Set_RHS (Prods (111), 4, (1 => 36), null, null);
            Set_RHS (Prods (111), 5, (1 .. 0 => <>), null, null);
            Set_Production (Prods (112), 112, 0);
            Set_RHS (Prods (112), 0, (246, 312, 35, 6, 122, 96), abstract_subprogram_declaration_0'Access, null);
            Set_Production (Prods (113), 113, 1);
            Set_RHS (Prods (113), 0, (4, 104, 116, 253, 21, 218, 24, 220, 96), accept_statement_0'Access,
            accept_statement_0_check'Access);
            Set_RHS (Prods (113), 1, (4, 104, 116, 253, 96), accept_statement_1'Access, null);
            Set_Production (Prods (114), 114, 2);
            Set_RHS (Prods (114), 0, (241, 7, 270, 50, 253), access_definition_0'Access, null);
            Set_RHS (Prods (114), 1, (241, 7, 270, 29, 252), access_definition_1'Access, null);
            Set_RHS (Prods (114), 2, (241, 7, 208, 239), access_definition_2'Access, null);
            Set_Production (Prods (115), 115, 1);
            Set_RHS (Prods (115), 0, (76, 125, 77), actual_parameter_part_0'Access, null);
            Set_RHS (Prods (115), 1, (76, 153, 77), actual_parameter_part_1'Access, null);
            Set_Production (Prods (116), 116, 1);
            Set_RHS (Prods (116), 0, (1 => 115), null, null);
            Set_RHS (Prods (116), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (117), 117, 4);
            Set_RHS (Prods (117), 0, (76, 192, 74, 41, 54, 77), aggregate_0'Access, null);
            Set_RHS (Prods (117), 1, (76, 192, 74, 125, 77), aggregate_1'Access, null);
            Set_RHS (Prods (117), 2, (76, 41, 54, 77), null, null);
            Set_RHS (Prods (117), 3, (76, 153, 77), aggregate_3'Access, null);
            Set_RHS (Prods (117), 4, (76, 125, 77), aggregate_4'Access, null);
            Set_Production (Prods (118), 118, 1);
            Set_RHS (Prods (118), 0, (1 => 8), null, null);
            Set_RHS (Prods (118), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (119), 119, 1);
            Set_RHS (Prods (119), 0, (10, 227), null, null);
            Set_RHS (Prods (119), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (120), 120, 1);
            Set_RHS (Prods (120), 0, (11, 76, 226, 77, 42, 147), array_type_definition_0'Access, null);
            Set_RHS (Prods (120), 1, (11, 76, 168, 77, 42, 147), array_type_definition_1'Access, null);
            Set_Production (Prods (121), 121, 3);
            Set_RHS (Prods (121), 0, (28, 128, 71, 192, 96), aspect_clause_0'Access, null);
            Set_RHS (Prods (121), 1, (1 => 182), null, null);
            Set_RHS (Prods (121), 2, (1 => 281), null, null);
            Set_RHS (Prods (121), 3, (1 => 127), null, null);
            Set_Production (Prods (122), 122, 1);
            Set_RHS (Prods (122), 0, (74, 125), aspect_specification_opt_0'Access, null);
            Set_RHS (Prods (122), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (123), 123, 0);
            Set_RHS (Prods (123), 0, (239, 82, 192, 96), assignment_statement_0'Access, null);
            Set_Production (Prods (124), 124, 5);
            Set_RHS (Prods (124), 0, (106, 87, 192), association_opt_0'Access, null);
            Set_RHS (Prods (124), 1, (106, 87, 80), null, null);
            Set_RHS (Prods (124), 2, (166, 87, 192), association_opt_2'Access, null);
            Set_RHS (Prods (124), 3, (166, 87, 80), association_opt_3'Access, null);
            Set_RHS (Prods (124), 4, (1 => 191), association_opt_4'Access, null);
            Set_RHS (Prods (124), 5, (1 .. 0 => <>), null, null);
            Set_Production (Prods (125), 125, 1);
            Set_RHS (Prods (125), 0, (125, 83, 124), null, null);
            Set_RHS (Prods (125), 1, (1 => 124), null, null);
            Set_Production (Prods (126), 126, 0);
            Set_RHS (Prods (126), 0, (61, 324, 68, 5, 300, 24, 61, 96), asynchronous_select_0'Access, null);
            Set_Production (Prods (127), 127, 0);
            Set_RHS (Prods (127), 0, (28, 163, 71, 12, 192, 96), at_clause_0'Access, null);
            Set_Production (Prods (128), 128, 0);
            Set_RHS (Prods (128), 0, (239, 322, 129), null, null);
            Set_Production (Prods (129), 129, 4);
            Set_RHS (Prods (129), 0, (1 => 239), null, null);
            Set_RHS (Prods (129), 1, (1 => 7), null, null);
            Set_RHS (Prods (129), 2, (1 => 19), null, null);
            Set_RHS (Prods (129), 3, (1 => 20), null, null);
            Set_RHS (Prods (129), 4, (1 => 38), null, null);
            Set_Production (Prods (130), 130, 2);
            Set_RHS (Prods (130), 0, (1 => 95), null, null);
            Set_RHS (Prods (130), 1, (1 => 94), null, null);
            Set_RHS (Prods (130), 2, (1 => 78), null, null);
            Set_Production (Prods (131), 131, 0);
            Set_RHS (Prods (131), 0, (104, 81), block_label_0'Access, block_label_0_check'Access);
            Set_Production (Prods (132), 132, 1);
            Set_RHS (Prods (132), 0, (1 => 131), null, block_label_opt_0_check'Access);
            Set_RHS (Prods (132), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (133), 133, 1);
            Set_RHS (Prods (133), 0, (132, 17, 159, 13, 218, 24, 220, 96), block_statement_0'Access,
            block_statement_0_check'Access);
            Set_RHS (Prods (133), 1, (132, 13, 218, 24, 220, 96), block_statement_1'Access,
            block_statement_1_check'Access);
            Set_Production (Prods (134), 134, 1);
            Set_RHS (Prods (134), 0, (1 => 263), null, null);
            Set_RHS (Prods (134), 1, (1 => 135), null, null);
            Set_Production (Prods (135), 135, 3);
            Set_RHS (Prods (135), 0, (1 => 308), null, null);
            Set_RHS (Prods (135), 1, (1 => 248), null, null);
            Set_RHS (Prods (135), 2, (1 => 317), null, null);
            Set_RHS (Prods (135), 3, (1 => 265), null, null);
            Set_Production (Prods (136), 136, 0);
            Set_RHS (Prods (136), 0, (15, 192, 35, 138), case_expression_0'Access, null);
            Set_Production (Prods (137), 137, 0);
            Set_RHS (Prods (137), 0, (72, 166, 87, 192), case_expression_alternative_0'Access, null);
            Set_Production (Prods (138), 138, 1);
            Set_RHS (Prods (138), 0, (138, 83, 137), case_expression_alternative_list_0'Access, null);
            Set_RHS (Prods (138), 1, (1 => 137), null, null);
            Set_Production (Prods (139), 139, 0);
            Set_RHS (Prods (139), 0, (15, 192, 35, 141, 24, 15, 96), case_statement_0'Access, null);
            Set_Production (Prods (140), 140, 0);
            Set_RHS (Prods (140), 0, (72, 166, 87, 300), case_statement_alternative_0'Access, null);
            Set_Production (Prods (141), 141, 1);
            Set_RHS (Prods (141), 0, (141, 140), null, null);
            Set_RHS (Prods (141), 1, (1 => 140), null, null);
            Set_Production (Prods (142), 142, 4);
            Set_RHS (Prods (142), 0, (1 => 332), null, null);
            Set_RHS (Prods (142), 1, (1 => 315), null, null);
            Set_RHS (Prods (142), 2, (49, 157), null, null);
            Set_RHS (Prods (142), 3, (1 => 157), null, null);
            Set_RHS (Prods (142), 4, (1 => 306), null, null);
            Set_Production (Prods (143), 143, 1);
            Set_RHS (Prods (143), 0, (143, 142), null, null);
            Set_RHS (Prods (143), 1, (1 => 142), null, null);
            Set_Production (Prods (144), 144, 0);
            Set_RHS (Prods (144), 0, (104, 12, 301, 53, 301, 85, 301, 96), component_clause_0'Access, null);
            Set_Production (Prods (145), 145, 1);
            Set_RHS (Prods (145), 0, (145, 144), null, null);
            Set_RHS (Prods (145), 1, (1 => 144), null, null);
            Set_Production (Prods (146), 146, 1);
            Set_RHS (Prods (146), 0, (219, 81, 147, 82, 192, 122, 96), component_declaration_0'Access, null);
            Set_RHS (Prods (146), 1, (219, 81, 147, 122, 96), component_declaration_1'Access, null);
            Set_Production (Prods (147), 147, 3);
            Set_RHS (Prods (147), 0, (8, 314), null, null);
            Set_RHS (Prods (147), 1, (1 => 314), null, null);
            Set_RHS (Prods (147), 2, (8, 114), null, null);
            Set_RHS (Prods (147), 3, (1 => 114), null, null);
            Set_Production (Prods (148), 148, 1);
            Set_RHS (Prods (148), 0, (1 => 146), null, null);
            Set_RHS (Prods (148), 1, (1 => 121), null, null);
            Set_Production (Prods (149), 149, 4);
            Set_RHS (Prods (149), 0, (149, 148), null, null);
            Set_RHS (Prods (149), 1, (149, 327), null, null);
            Set_RHS (Prods (149), 2, (1 => 148), null, null);
            Set_RHS (Prods (149), 3, (1 => 327), null, null);
            Set_RHS (Prods (149), 4, (41, 96), component_list_4'Access, null);
            Set_Production (Prods (150), 150, 1);
            Set_RHS (Prods (150), 0, (1 => 149), null, null);
            Set_RHS (Prods (150), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (151), 151, 6);
            Set_RHS (Prods (151), 0, (1 => 222), null, null);
            Set_RHS (Prods (151), 1, (1 => 139), null, null);
            Set_RHS (Prods (151), 2, (1 => 232), null, null);
            Set_RHS (Prods (151), 3, (1 => 133), null, null);
            Set_RHS (Prods (151), 4, (1 => 196), null, null);
            Set_RHS (Prods (151), 5, (1 => 113), null, null);
            Set_RHS (Prods (151), 6, (1 => 298), null, null);
            Set_Production (Prods (152), 152, 0);
            Set_RHS (Prods (152), 0, (61, 178, 22, 300, 24, 61, 96), conditional_entry_call_0'Access, null);
            Set_Production (Prods (153), 153, 2);
            Set_RHS (Prods (153), 0, (1 => 221), null, null);
            Set_RHS (Prods (153), 1, (1 => 136), null, null);
            Set_RHS (Prods (153), 2, (1 => 273), null, null);
            Set_Production (Prods (154), 154, 1);
            Set_RHS (Prods (154), 0, (1 => 16), null, null);
            Set_RHS (Prods (154), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (155), 155, 1);
            Set_RHS (Prods (155), 0, (53, 277), null, null);
            Set_RHS (Prods (155), 1, (1 => 224), null, null);
            Set_Production (Prods (156), 156, 1);
            Set_RHS (Prods (156), 0, (1 => 155), null, null);
            Set_RHS (Prods (156), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (157), 157, 16);
            Set_RHS (Prods (157), 0, (1 => 112), null, null);
            Set_RHS (Prods (157), 1, (1 => 121), null, null);
            Set_RHS (Prods (157), 2, (1 => 134), null, null);
            Set_RHS (Prods (157), 3, (1 => 179), null, null);
            Set_RHS (Prods (157), 4, (1 => 186), null, null);
            Set_RHS (Prods (157), 5, (1 => 193), null, null);
            Set_RHS (Prods (157), 6, (1 => 209), null, null);
            Set_RHS (Prods (157), 7, (1 => 213), null, null);
            Set_RHS (Prods (157), 8, (1 => 243), null, null);
            Set_RHS (Prods (157), 9, (219, 81, 16, 82, 192, 96), declaration_9'Access, null);
            Set_RHS (Prods (157), 10, (1 => 244), null, null);
            Set_RHS (Prods (157), 11, (1 => 249), null, null);
            Set_RHS (Prods (157), 12, (1 => 289), null, null);
            Set_RHS (Prods (157), 13, (1 => 309), null, null);
            Set_RHS (Prods (157), 14, (1 => 313), null, null);
            Set_RHS (Prods (157), 15, (1 => 325), null, null);
            Set_RHS (Prods (157), 16, (1 => 331), null, null);
            Set_Production (Prods (158), 158, 3);
            Set_RHS (Prods (158), 0, (158, 157), null, null);
            Set_RHS (Prods (158), 1, (158, 257), null, null);
            Set_RHS (Prods (158), 2, (1 => 157), null, null);
            Set_RHS (Prods (158), 3, (1 => 257), null, null);
            Set_Production (Prods (159), 159, 1);
            Set_RHS (Prods (159), 0, (1 => 158), null, null);
            Set_RHS (Prods (159), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (160), 160, 0);
            Set_RHS (Prods (160), 0, (161, 300), null, null);
            Set_Production (Prods (161), 161, 1);
            Set_RHS (Prods (161), 0, (18, 70, 192, 96), delay_statement_0'Access, null);
            Set_RHS (Prods (161), 1, (18, 192, 96), delay_statement_1'Access, null);
            Set_Production (Prods (162), 162, 1);
            Set_RHS (Prods (162), 0, (110, 39, 239, 119, 74, 280), derived_type_definition_0'Access, null);
            Set_RHS (Prods (162), 1, (110, 39, 239, 156), derived_type_definition_1'Access, null);
            Set_Production (Prods (163), 163, 1);
            Set_RHS (Prods (163), 0, (1 => 104), null, null);
            Set_RHS (Prods (163), 1, (1 => 105), null, null);
            Set_Production (Prods (164), 164, 1);
            Set_RHS (Prods (164), 0, (1 => 163), null, null);
            Set_RHS (Prods (164), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (165), 165, 3);
            Set_RHS (Prods (165), 0, (1 => 191), null, null);
            Set_RHS (Prods (165), 1, (40, 41, 239), null, null);
            Set_RHS (Prods (165), 2, (1 => 277), null, null);
            Set_RHS (Prods (165), 3, (1 => 44), null, null);
            Set_Production (Prods (166), 166, 2);
            Set_RHS (Prods (166), 0, (166, 79, 165), null, null);
            Set_RHS (Prods (166), 1, (1 => 165), null, null);
            Set_RHS (Prods (166), 2, (1 .. 0 => <>), null, null);
            Set_Production (Prods (167), 167, 1);
            Set_RHS (Prods (167), 0, (1 => 314), null, null);
            Set_RHS (Prods (167), 1, (1 => 277), null, null);
            Set_Production (Prods (168), 168, 1);
            Set_RHS (Prods (168), 0, (168, 83, 167), null, null);
            Set_RHS (Prods (168), 1, (1 => 167), null, null);
            Set_Production (Prods (169), 169, 2);
            Set_RHS (Prods (169), 0, (76, 80, 77), null, null);
            Set_RHS (Prods (169), 1, (76, 171, 77), discriminant_part_opt_1'Access, null);
            Set_RHS (Prods (169), 2, (1 .. 0 => <>), null, null);
            Set_Production (Prods (170), 170, 4);
            Set_RHS (Prods (170), 0, (219, 81, 242, 82, 192), null, null);
            Set_RHS (Prods (170), 1, (219, 81, 114, 82, 192), null, null);
            Set_RHS (Prods (170), 2, (219, 81, 242), null, null);
            Set_RHS (Prods (170), 3, (219, 81, 114), null, null);
            Set_RHS (Prods (170), 4, (1 .. 0 => <>), null, null);
            Set_Production (Prods (171), 171, 1);
            Set_RHS (Prods (171), 0, (171, 96, 170), null, null);
            Set_RHS (Prods (171), 1, (1 => 170), null, null);
            Set_Production (Prods (172), 172, 0);
            Set_RHS (Prods (172), 0, (23, 192, 68, 192), elsif_expression_item_0'Access, null);
            Set_Production (Prods (173), 173, 1);
            Set_RHS (Prods (173), 0, (173, 172), null, null);
            Set_RHS (Prods (173), 1, (1 => 172), null, null);
            Set_Production (Prods (174), 174, 0);
            Set_RHS (Prods (174), 0, (23, 192, 68, 300), elsif_statement_item_0'Access, null);
            Set_Production (Prods (175), 175, 1);
            Set_RHS (Prods (175), 0, (175, 174), null, null);
            Set_RHS (Prods (175), 1, (1 => 174), null, null);
            Set_Production (Prods (176), 176, 0);
            Set_RHS (Prods (176), 0, (25, 104, 177, 72, 192, 35, 159, 13, 218, 24, 220, 96), entry_body_0'Access,
            entry_body_0_check'Access);
            Set_Production (Prods (177), 177, 1);
            Set_RHS (Prods (177), 0, (76, 28, 104, 33, 167, 77, 253), entry_body_formal_part_0'Access, null);
            Set_RHS (Prods (177), 1, (1 => 253), null, null);
            Set_Production (Prods (178), 178, 1);
            Set_RHS (Prods (178), 0, (261, 300), null, null);
            Set_RHS (Prods (178), 1, (239, 300), null, null);
            Set_Production (Prods (179), 179, 1);
            Set_RHS (Prods (179), 0, (246, 25, 104, 76, 167, 77, 253, 122, 96), entry_declaration_0'Access, null);
            Set_RHS (Prods (179), 1, (246, 25, 104, 253, 122, 96), entry_declaration_1'Access, null);
            Set_Production (Prods (180), 180, 1);
            Set_RHS (Prods (180), 0, (1 => 104), null, null);
            Set_RHS (Prods (180), 1, (1 => 106), null, null);
            Set_Production (Prods (181), 181, 1);
            Set_RHS (Prods (181), 0, (181, 83, 180), null, null);
            Set_RHS (Prods (181), 1, (1 => 180), null, null);
            Set_Production (Prods (182), 182, 0);
            Set_RHS (Prods (182), 0, (28, 239, 71, 117, 96), enumeration_representation_clause_0'Access, null);
            Set_Production (Prods (183), 183, 0);
            Set_RHS (Prods (183), 0, (76, 181, 77), enumeration_type_definition_0'Access, null);
            Set_Production (Prods (184), 184, 1);
            Set_RHS (Prods (184), 0, (1 => 239), null, null);
            Set_RHS (Prods (184), 1, (1 => 44), null, null);
            Set_Production (Prods (185), 185, 1);
            Set_RHS (Prods (185), 0, (185, 79, 184), null, null);
            Set_RHS (Prods (185), 1, (1 => 184), null, null);
            Set_Production (Prods (186), 186, 0);
            Set_RHS (Prods (186), 0, (219, 81, 26, 96), exception_declaration_0'Access, null);
            Set_Production (Prods (187), 187, 1);
            Set_RHS (Prods (187), 0, (72, 104, 81, 185, 87, 300), exception_handler_0'Access, null);
            Set_RHS (Prods (187), 1, (72, 185, 87, 300), exception_handler_1'Access, null);
            Set_Production (Prods (188), 188, 2);
            Set_RHS (Prods (188), 0, (188, 187), null, null);
            Set_RHS (Prods (188), 1, (1 => 187), null, null);
            Set_RHS (Prods (188), 2, (1 => 257), null, null);
            Set_Production (Prods (189), 189, 1);
            Set_RHS (Prods (189), 0, (1 => 188), null, null);
            Set_RHS (Prods (189), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (190), 190, 1);
            Set_RHS (Prods (190), 0, (27, 220, 72, 192, 96), exit_statement_0'Access, null);
            Set_RHS (Prods (190), 1, (27, 220, 96), exit_statement_1'Access, null);
            Set_Production (Prods (191), 191, 5);
            Set_RHS (Prods (191), 0, (1 => 287), null, null);
            Set_RHS (Prods (191), 1, (1 => 282), null, null);
            Set_RHS (Prods (191), 2, (1 => 283), null, null);
            Set_RHS (Prods (191), 3, (1 => 284), null, null);
            Set_RHS (Prods (191), 4, (1 => 285), null, null);
            Set_RHS (Prods (191), 5, (1 => 286), null, null);
            Set_Production (Prods (192), 192, 1);
            Set_RHS (Prods (192), 0, (1 => 191), null, null);
            Set_RHS (Prods (192), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (193), 193, 0);
            Set_RHS (Prods (193), 0, (246, 207, 35, 256, 122, 96), expression_function_declaration_0'Access, null);
            Set_Production (Prods (194), 194, 1);
            Set_RHS (Prods (194), 0, (104, 81, 118, 154, 292, 82, 192), extended_return_object_declaration_0'Access,
            null);
            Set_RHS (Prods (194), 1, (104, 81, 118, 154, 292), extended_return_object_declaration_1'Access, null);
            Set_Production (Prods (195), 195, 1);
            Set_RHS (Prods (195), 0, (1 => 194), null, null);
            Set_RHS (Prods (195), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (196), 196, 1);
            Set_RHS (Prods (196), 0, (58, 195, 21, 218, 24, 58, 96), extended_return_statement_0'Access, null);
            Set_RHS (Prods (196), 1, (58, 194, 96), extended_return_statement_1'Access, null);
            Set_Production (Prods (197), 197, 3);
            Set_RHS (Prods (197), 0, (258, 100, 258), null, null);
            Set_RHS (Prods (197), 1, (1 => 258), null, null);
            Set_RHS (Prods (197), 2, (3, 258), null, null);
            Set_RHS (Prods (197), 3, (40, 258), null, null);
            Set_Production (Prods (198), 198, 3);
            Set_RHS (Prods (198), 0, (219, 81, 236, 241, 239, 82, 192, 122, 96), formal_object_declaration_0'Access,
            null);
            Set_RHS (Prods (198), 1, (219, 81, 236, 114, 82, 192, 122, 96), formal_object_declaration_1'Access, null);
            Set_RHS (Prods (198), 2, (219, 81, 236, 241, 239, 122, 96), formal_object_declaration_2'Access, null);
            Set_RHS (Prods (198), 3, (219, 81, 236, 114, 122, 96), formal_object_declaration_3'Access, null);
            Set_Production (Prods (199), 199, 0);
            Set_RHS (Prods (199), 0, (76, 255, 77), formal_part_0'Access, null);
            Set_Production (Prods (200), 200, 3);
            Set_RHS (Prods (200), 0, (74, 312, 35, 6, 310, 122, 96), formal_subprogram_declaration_0'Access, null);
            Set_RHS (Prods (200), 1, (74, 312, 35, 310, 122, 96), formal_subprogram_declaration_1'Access, null);
            Set_RHS (Prods (200), 2, (74, 312, 35, 6, 122, 96), formal_subprogram_declaration_2'Access, null);
            Set_RHS (Prods (200), 3, (74, 312, 122, 96), formal_subprogram_declaration_3'Access, null);
            Set_Production (Prods (201), 201, 2);
            Set_RHS (Prods (201), 0, (69, 104, 169, 35, 202, 122, 96), formal_type_declaration_0'Access, null);
            Set_RHS (Prods (201), 1, (69, 104, 169, 35, 65, 122, 96), formal_type_declaration_1'Access, null);
            Set_RHS (Prods (201), 2, (69, 104, 169, 122, 96), formal_type_declaration_2'Access, null);
            Set_Production (Prods (202), 202, 10);
            Set_RHS (Prods (202), 0, (111, 49), null, null);
            Set_RHS (Prods (202), 1, (1 => 203), null, null);
            Set_RHS (Prods (202), 2, (76, 80, 77), null, null);
            Set_RHS (Prods (202), 3, (53, 80), null, null);
            Set_RHS (Prods (202), 4, (38, 80), null, null);
            Set_RHS (Prods (202), 5, (20, 80), null, null);
            Set_RHS (Prods (202), 6, (19, 80, 20, 80), null, null);
            Set_RHS (Prods (202), 7, (19, 80), null, null);
            Set_RHS (Prods (202), 8, (1 => 120), null, null);
            Set_RHS (Prods (202), 9, (1 => 114), null, null);
            Set_RHS (Prods (202), 10, (1 => 228), null, null);
            Set_Production (Prods (203), 203, 1);
            Set_RHS (Prods (203), 0, (109, 39, 239, 119, 74, 49), formal_derived_type_definition_0'Access, null);
            Set_RHS (Prods (203), 1, (109, 39, 239, 119), formal_derived_type_definition_1'Access, null);
            Set_Production (Prods (204), 204, 0);
            Set_RHS (Prods (204), 0, (74, 47, 239, 35, 39, 239, 205, 122, 96), formal_package_declaration_0'Access,
            null);
            Set_Production (Prods (205), 205, 1);
            Set_RHS (Prods (205), 0, (76, 80, 77), null, null);
            Set_RHS (Prods (205), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (206), 206, 2);
            Set_RHS (Prods (206), 0, (69, 104, 169, 35, 326, 122, 96), full_type_declaration_0'Access, null);
            Set_RHS (Prods (206), 1, (1 => 319), null, null);
            Set_RHS (Prods (206), 2, (1 => 271), null, null);
            Set_Production (Prods (207), 207, 0);
            Set_RHS (Prods (207), 0, (29, 239, 252), function_specification_0'Access,
            function_specification_0_check'Access);
            Set_Production (Prods (208), 208, 2);
            Set_RHS (Prods (208), 0, (1 => 9), null, null);
            Set_RHS (Prods (208), 1, (1 => 16), null, null);
            Set_RHS (Prods (208), 2, (1 .. 0 => <>), null, null);
            Set_Production (Prods (209), 209, 1);
            Set_RHS (Prods (209), 0, (1 => 216), null, null);
            Set_RHS (Prods (209), 1, (1 => 214), null, null);
            Set_Production (Prods (210), 210, 1);
            Set_RHS (Prods (210), 0, (30, 211), generic_formal_part_0'Access, null);
            Set_RHS (Prods (210), 1, (1 => 30), generic_formal_part_1'Access, null);
            Set_Production (Prods (211), 211, 1);
            Set_RHS (Prods (211), 0, (211, 212), null, null);
            Set_RHS (Prods (211), 1, (1 => 212), null, null);
            Set_Production (Prods (212), 212, 5);
            Set_RHS (Prods (212), 0, (1 => 198), null, null);
            Set_RHS (Prods (212), 1, (1 => 201), null, null);
            Set_RHS (Prods (212), 2, (1 => 200), null, null);
            Set_RHS (Prods (212), 3, (1 => 204), null, null);
            Set_RHS (Prods (212), 4, (1 => 257), null, null);
            Set_RHS (Prods (212), 5, (1 => 331), null, null);
            Set_Production (Prods (213), 213, 2);
            Set_RHS (Prods (213), 0, (47, 239, 35, 39, 239, 122, 96), generic_instantiation_0'Access, null);
            Set_RHS (Prods (213), 1, (246, 50, 239, 35, 39, 239, 122, 96), generic_instantiation_1'Access, null);
            Set_RHS (Prods (213), 2, (246, 29, 239, 35, 39, 239, 122, 96), generic_instantiation_2'Access, null);
            Set_Production (Prods (214), 214, 0);
            Set_RHS (Prods (214), 0, (210, 251, 96), generic_package_declaration_0'Access, null);
            Set_Production (Prods (215), 215, 2);
            Set_RHS (Prods (215), 0, (30, 47, 239, 56, 239, 122, 96), generic_renaming_declaration_0'Access, null);
            Set_RHS (Prods (215), 1, (30, 50, 239, 56, 239, 122, 96), generic_renaming_declaration_1'Access, null);
            Set_RHS (Prods (215), 2, (30, 29, 239, 56, 239, 122, 96), generic_renaming_declaration_2'Access, null);
            Set_Production (Prods (216), 216, 0);
            Set_RHS (Prods (216), 0, (210, 312, 122, 96), generic_subprogram_declaration_0'Access, null);
            Set_Production (Prods (217), 217, 0);
            Set_RHS (Prods (217), 0, (93, 104, 90), goto_label_0'Access, null);
            Set_Production (Prods (218), 218, 1);
            Set_RHS (Prods (218), 0, (300, 26, 189), handled_sequence_of_statements_0'Access, null);
            Set_RHS (Prods (218), 1, (1 => 300), null, null);
            Set_Production (Prods (219), 219, 1);
            Set_RHS (Prods (219), 0, (219, 83, 104), identifier_list_0'Access, null);
            Set_RHS (Prods (219), 1, (1 => 104), null, null);
            Set_Production (Prods (220), 220, 1);
            Set_RHS (Prods (220), 0, (1 => 104), null, identifier_opt_0_check'Access);
            Set_RHS (Prods (220), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (221), 221, 3);
            Set_RHS (Prods (221), 0, (32, 192, 68, 192, 173, 22, 192), if_expression_0'Access, null);
            Set_RHS (Prods (221), 1, (32, 192, 68, 192, 22, 192), if_expression_1'Access, null);
            Set_RHS (Prods (221), 2, (32, 192, 68, 192, 173), if_expression_2'Access, null);
            Set_RHS (Prods (221), 3, (32, 192, 68, 192), if_expression_3'Access, null);
            Set_Production (Prods (222), 222, 3);
            Set_RHS (Prods (222), 0, (32, 192, 68, 300, 175, 22, 300, 24, 32, 96), if_statement_0'Access, null);
            Set_RHS (Prods (222), 1, (32, 192, 68, 300, 22, 300, 24, 32, 96), if_statement_1'Access, null);
            Set_RHS (Prods (222), 2, (32, 192, 68, 300, 175, 24, 32, 96), if_statement_2'Access, null);
            Set_RHS (Prods (222), 3, (32, 192, 68, 300, 24, 32, 96), if_statement_3'Access, null);
            Set_Production (Prods (223), 223, 1);
            Set_RHS (Prods (223), 0, (69, 104, 169, 35, 65, 96), incomplete_type_declaration_0'Access, null);
            Set_RHS (Prods (223), 1, (69, 104, 169, 96), incomplete_type_declaration_1'Access, null);
            Set_Production (Prods (224), 224, 0);
            Set_RHS (Prods (224), 0, (76, 168, 77), index_constraint_0'Access, null);
            Set_Production (Prods (225), 225, 0);
            Set_RHS (Prods (225), 0, (239, 53, 80), null, null);
            Set_Production (Prods (226), 226, 1);
            Set_RHS (Prods (226), 0, (226, 83, 225), null, null);
            Set_RHS (Prods (226), 1, (1 => 225), null, null);
            Set_Production (Prods (227), 227, 1);
            Set_RHS (Prods (227), 0, (227, 10, 239), interface_list_0'Access, null);
            Set_RHS (Prods (227), 1, (1 => 239), interface_list_1'Access, null);
            Set_Production (Prods (228), 228, 8);
            Set_RHS (Prods (228), 0, (36, 34, 10, 227), null, null);
            Set_RHS (Prods (228), 1, (66, 34, 10, 227), null, null);
            Set_RHS (Prods (228), 2, (51, 34, 10, 227), null, null);
            Set_RHS (Prods (228), 3, (64, 34, 10, 227), null, null);
            Set_RHS (Prods (228), 4, (36, 34), null, null);
            Set_RHS (Prods (228), 5, (66, 34), null, null);
            Set_RHS (Prods (228), 6, (51, 34), null, null);
            Set_RHS (Prods (228), 7, (64, 34), null, null);
            Set_RHS (Prods (228), 8, (1 => 34), null, null);
            Set_Production (Prods (229), 229, 1);
            Set_RHS (Prods (229), 0, (73, 192), iteration_scheme_0'Access, null);
            Set_RHS (Prods (229), 1, (28, 231), iteration_scheme_1'Access, null);
            Set_Production (Prods (230), 230, 5);
            Set_RHS (Prods (230), 0, (104, 81, 314, 42, 59, 239), null, null);
            Set_RHS (Prods (230), 1, (104, 81, 314, 42, 239), null, null);
            Set_RHS (Prods (230), 2, (104, 33, 59, 167), iterator_specification_2'Access, null);
            Set_RHS (Prods (230), 3, (104, 42, 59, 239), null, null);
            Set_RHS (Prods (230), 4, (104, 42, 239), null, null);
            Set_RHS (Prods (230), 5, (104, 33, 167), iterator_specification_5'Access, null);
            Set_Production (Prods (231), 231, 1);
            Set_RHS (Prods (231), 0, (1 => 230), null, null);
            Set_RHS (Prods (231), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (232), 232, 1);
            Set_RHS (Prods (232), 0, (132, 229, 37, 300, 24, 37, 220, 96), loop_statement_0'Access,
            loop_statement_0_check'Access);
            Set_RHS (Prods (232), 1, (132, 37, 300, 24, 37, 220, 96), loop_statement_1'Access,
            loop_statement_1_check'Access);
            Set_Production (Prods (233), 233, 1);
            Set_RHS (Prods (233), 0, (233, 79, 234), null, null);
            Set_RHS (Prods (233), 1, (1 => 234), null, null);
            Set_Production (Prods (234), 234, 1);
            Set_RHS (Prods (234), 0, (1 => 301), null, null);
            Set_RHS (Prods (234), 1, (1 => 277), null, null);
            Set_Production (Prods (235), 235, 1);
            Set_RHS (Prods (235), 0, (12, 38, 192, 96), null, null);
            Set_RHS (Prods (235), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (236), 236, 3);
            Set_RHS (Prods (236), 0, (1 => 33), null, null);
            Set_RHS (Prods (236), 1, (33, 45), null, null);
            Set_RHS (Prods (236), 2, (1 => 45), null, null);
            Set_RHS (Prods (236), 3, (1 .. 0 => <>), null, null);
            Set_Production (Prods (237), 237, 3);
            Set_RHS (Prods (237), 0, (1 => 99), null, null);
            Set_RHS (Prods (237), 1, (1 => 97), null, null);
            Set_RHS (Prods (237), 2, (1 => 38), null, null);
            Set_RHS (Prods (237), 3, (1 => 55), null, null);
            Set_Production (Prods (238), 238, 1);
            Set_RHS (Prods (238), 0, (238, 83, 239), null, null);
            Set_RHS (Prods (238), 1, (1 => 239), null, null);
            Set_Production (Prods (239), 239, 7);
            Set_RHS (Prods (239), 0, (239, 76, 278, 77), name_0'Access, null);
            Set_RHS (Prods (239), 1, (239, 115), name_1'Access, null);
            Set_RHS (Prods (239), 2, (1 => 293), null, name_2_check'Access);
            Set_RHS (Prods (239), 3, (1 => 128), null, null);
            Set_RHS (Prods (239), 4, (1 => 272), null, null);
            Set_RHS (Prods (239), 5, (1 => 104), name_5'Access, name_5_check'Access);
            Set_RHS (Prods (239), 6, (1 => 106), null, null);
            Set_RHS (Prods (239), 7, (1 => 105), null, name_7_check'Access);
            Set_Production (Prods (240), 240, 1);
            Set_RHS (Prods (240), 0, (1 => 239), null, name_opt_0_check'Access);
            Set_RHS (Prods (240), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (241), 241, 1);
            Set_RHS (Prods (241), 0, (40, 41), null, null);
            Set_RHS (Prods (241), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (242), 242, 3);
            Set_RHS (Prods (242), 0, (1 => 104), null_exclusion_opt_name_type_0'Access, null);
            Set_RHS (Prods (242), 1, (1 => 293), null_exclusion_opt_name_type_1'Access, null);
            Set_RHS (Prods (242), 2, (40, 41, 104), null_exclusion_opt_name_type_2'Access, null);
            Set_RHS (Prods (242), 3, (40, 41, 293), null_exclusion_opt_name_type_3'Access, null);
            Set_Production (Prods (243), 243, 0);
            Set_RHS (Prods (243), 0, (246, 262, 35, 41, 122, 96), null_procedure_declaration_0'Access, null);
            Set_Production (Prods (244), 244, 7);
            Set_RHS (Prods (244), 0, (219, 81, 118, 154, 314, 82, 192, 122, 96), object_declaration_0'Access, null);
            Set_RHS (Prods (244), 1, (219, 81, 118, 154, 114, 82, 192, 122, 96), object_declaration_1'Access, null);
            Set_RHS (Prods (244), 2, (219, 81, 118, 154, 120, 82, 192, 122, 96), object_declaration_2'Access, null);
            Set_RHS (Prods (244), 3, (219, 81, 118, 154, 314, 122, 96), object_declaration_3'Access, null);
            Set_RHS (Prods (244), 4, (219, 81, 118, 154, 114, 122, 96), object_declaration_4'Access, null);
            Set_RHS (Prods (244), 5, (219, 81, 118, 154, 120, 122, 96), object_declaration_5'Access, null);
            Set_RHS (Prods (244), 6, (1 => 305), null, null);
            Set_RHS (Prods (244), 7, (1 => 304), null, null);
            Set_Production (Prods (245), 245, 2);
            Set_RHS (Prods (245), 0, (104, 81, 241, 239, 56, 239, 122, 96), object_renaming_declaration_0'Access,
            null);
            Set_RHS (Prods (245), 1, (104, 81, 114, 56, 239, 122, 96), object_renaming_declaration_1'Access, null);
            Set_RHS (Prods (245), 2, (104, 81, 26, 56, 239, 122, 96), object_renaming_declaration_2'Access, null);
            Set_Production (Prods (246), 246, 2);
            Set_RHS (Prods (246), 0, (40, 46), overriding_indicator_opt_0'Access, null);
            Set_RHS (Prods (246), 1, (1 => 46), overriding_indicator_opt_1'Access, null);
            Set_RHS (Prods (246), 2, (1 .. 0 => <>), null, null);
            Set_Production (Prods (247), 247, 1);
            Set_RHS (Prods (247), 0, (47, 14, 239, 122, 35, 159, 13, 218, 24, 240, 96), package_body_0'Access,
            package_body_0_check'Access);
            Set_RHS (Prods (247), 1, (47, 14, 239, 122, 35, 159, 24, 240, 96), package_body_1'Access,
            package_body_1_check'Access);
            Set_Production (Prods (248), 248, 0);
            Set_RHS (Prods (248), 0, (47, 14, 239, 35, 60, 122, 96), package_body_stub_0'Access, null);
            Set_Production (Prods (249), 249, 0);
            Set_RHS (Prods (249), 0, (251, 96), package_declaration_0'Access, null);
            Set_Production (Prods (250), 250, 0);
            Set_RHS (Prods (250), 0, (47, 239, 56, 239, 122, 96), package_renaming_declaration_0'Access, null);
            Set_Production (Prods (251), 251, 1);
            Set_RHS (Prods (251), 0, (47, 239, 122, 35, 159, 49, 159, 24, 240), package_specification_0'Access,
            package_specification_0_check'Access);
            Set_RHS (Prods (251), 1, (47, 239, 122, 35, 159, 24, 240), package_specification_1'Access,
            package_specification_1_check'Access);
            Set_Production (Prods (252), 252, 1);
            Set_RHS (Prods (252), 0, (199, 291), parameter_and_result_profile_0'Access, null);
            Set_RHS (Prods (252), 1, (1 => 291), null, null);
            Set_Production (Prods (253), 253, 1);
            Set_RHS (Prods (253), 0, (1 => 199), null, null);
            Set_RHS (Prods (253), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (254), 254, 4);
            Set_RHS (Prods (254), 0, (219, 81, 118, 236, 241, 239, 82, 192), parameter_specification_0'Access, null);
            Set_RHS (Prods (254), 1, (219, 81, 118, 236, 241, 239), parameter_specification_1'Access, null);
            Set_RHS (Prods (254), 2, (219, 81, 118, 114, 82, 192), parameter_specification_2'Access, null);
            Set_RHS (Prods (254), 3, (219, 81, 118, 114), parameter_specification_3'Access, null);
            Set_RHS (Prods (254), 4, (1 .. 0 => <>), null, null);
            Set_Production (Prods (255), 255, 1);
            Set_RHS (Prods (255), 0, (255, 96, 254), parameter_specification_list_0'Access, null);
            Set_RHS (Prods (255), 1, (1 => 254), null, null);
            Set_Production (Prods (256), 256, 2);
            Set_RHS (Prods (256), 0, (76, 192, 77), paren_expression_0'Access, null);
            Set_RHS (Prods (256), 1, (76, 125, 77), paren_expression_1'Access, null);
            Set_RHS (Prods (256), 2, (76, 153, 77), paren_expression_2'Access, null);
            Set_Production (Prods (257), 257, 2);
            Set_RHS (Prods (257), 0, (48, 104, 76, 125, 77, 96), pragma_g_0'Access, null);
            Set_RHS (Prods (257), 1, (48, 104, 76, 153, 77, 96), pragma_g_1'Access, null);
            Set_RHS (Prods (257), 2, (48, 104, 96), pragma_g_2'Access, null);
            Set_Production (Prods (258), 258, 4);
            Set_RHS (Prods (258), 0, (1 => 103), primary_0'Access, null);
            Set_RHS (Prods (258), 1, (1 => 41), null, null);
            Set_RHS (Prods (258), 2, (1 => 117), primary_2'Access, null);
            Set_RHS (Prods (258), 3, (1 => 239), null, null);
            Set_RHS (Prods (258), 4, (39, 239), primary_4'Access, null);
            Set_Production (Prods (259), 259, 0);
            Set_RHS (Prods (259), 0, (69, 104, 169, 35, 109, 39, 314, 119, 74, 49, 122, 96),
            private_extension_declaration_0'Access, null);
            Set_Production (Prods (260), 260, 0);
            Set_RHS (Prods (260), 0, (69, 104, 169, 35, 111, 49, 122, 96), private_type_declaration_0'Access, null);
            Set_Production (Prods (261), 261, 0);
            Set_RHS (Prods (261), 0, (239, 96), procedure_call_statement_0'Access, null);
            Set_Production (Prods (262), 262, 0);
            Set_RHS (Prods (262), 0, (50, 239, 253), procedure_specification_0'Access,
            procedure_specification_0_check'Access);
            Set_Production (Prods (263), 263, 3);
            Set_RHS (Prods (263), 0, (1 => 307), null, null);
            Set_RHS (Prods (263), 1, (1 => 247), null, null);
            Set_RHS (Prods (263), 2, (1 => 316), null, null);
            Set_RHS (Prods (263), 3, (1 => 264), null, null);
            Set_Production (Prods (264), 264, 0);
            Set_RHS (Prods (264), 0, (51, 14, 104, 122, 35, 269, 24, 220, 96), protected_body_0'Access,
            protected_body_0_check'Access);
            Set_Production (Prods (265), 265, 0);
            Set_RHS (Prods (265), 0, (51, 14, 104, 35, 60, 122, 96), protected_body_stub_0'Access, null);
            Set_Production (Prods (266), 266, 1);
            Set_RHS (Prods (266), 0, (159, 49, 159, 24, 220), protected_definition_0'Access,
            protected_definition_0_check'Access);
            Set_RHS (Prods (266), 1, (159, 24, 220), protected_definition_1'Access,
            protected_definition_1_check'Access);
            Set_Production (Prods (267), 267, 5);
            Set_RHS (Prods (267), 0, (1 => 309), null, null);
            Set_RHS (Prods (267), 1, (1 => 307), null, null);
            Set_RHS (Prods (267), 2, (1 => 176), null, null);
            Set_RHS (Prods (267), 3, (1 => 193), null, null);
            Set_RHS (Prods (267), 4, (1 => 243), null, null);
            Set_RHS (Prods (267), 5, (1 => 121), null, null);
            Set_Production (Prods (268), 268, 1);
            Set_RHS (Prods (268), 0, (268, 267), null, null);
            Set_RHS (Prods (268), 1, (1 => 267), null, null);
            Set_Production (Prods (269), 269, 1);
            Set_RHS (Prods (269), 0, (1 => 268), null, null);
            Set_RHS (Prods (269), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (270), 270, 1);
            Set_RHS (Prods (270), 0, (1 => 51), null, null);
            Set_RHS (Prods (270), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (271), 271, 1);
            Set_RHS (Prods (271), 0, (51, 69, 104, 169, 122, 35, 39, 227, 74, 266, 96),
            protected_type_declaration_0'Access, protected_type_declaration_0_check'Access);
            Set_RHS (Prods (271), 1, (51, 69, 104, 169, 122, 35, 266, 96), protected_type_declaration_1'Access,
            protected_type_declaration_1_check'Access);
            Set_Production (Prods (272), 272, 0);
            Set_RHS (Prods (272), 0, (239, 322, 117), qualified_expression_0'Access, null);
            Set_Production (Prods (273), 273, 0);
            Set_RHS (Prods (273), 0, (28, 274, 230, 87, 192), quantified_expression_0'Access, null);
            Set_Production (Prods (274), 274, 1);
            Set_RHS (Prods (274), 0, (1 => 9), null, null);
            Set_RHS (Prods (274), 1, (1 => 62), null, null);
            Set_Production (Prods (275), 275, 1);
            Set_RHS (Prods (275), 0, (52, 239, 74, 192), raise_expression_0'Access, null);
            Set_RHS (Prods (275), 1, (52, 239), null, null);
            Set_Production (Prods (276), 276, 2);
            Set_RHS (Prods (276), 0, (52, 239, 74, 192, 96), raise_statement_0'Access, null);
            Set_RHS (Prods (276), 1, (52, 239, 96), raise_statement_1'Access, null);
            Set_RHS (Prods (276), 2, (52, 96), raise_statement_2'Access, null);
            Set_Production (Prods (277), 277, 2);
            Set_RHS (Prods (277), 0, (239, 322, 53, 76, 192, 77), range_g_0'Access, null);
            Set_RHS (Prods (277), 1, (239, 322, 53), null, null);
            Set_RHS (Prods (277), 2, (301, 85, 301), null, null);
            Set_Production (Prods (278), 278, 1);
            Set_RHS (Prods (278), 0, (278, 83, 277), null, null);
            Set_RHS (Prods (278), 1, (1 => 277), null, null);
            Set_Production (Prods (279), 279, 1);
            Set_RHS (Prods (279), 0, (53, 301, 85, 301), null, null);
            Set_RHS (Prods (279), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (280), 280, 1);
            Set_RHS (Prods (280), 0, (54, 150, 24, 54), record_definition_0'Access, null);
            Set_RHS (Prods (280), 1, (41, 54), null, null);
            Set_Production (Prods (281), 281, 0);
            Set_RHS (Prods (281), 0, (28, 239, 71, 54, 235, 145, 24, 54, 96), record_representation_clause_0'Access,
            null);
            Set_Production (Prods (282), 282, 1);
            Set_RHS (Prods (282), 0, (282, 10, 287), null, null);
            Set_RHS (Prods (282), 1, (287, 10, 287), null, null);
            Set_Production (Prods (283), 283, 1);
            Set_RHS (Prods (283), 0, (283, 10, 68, 287), null, null);
            Set_RHS (Prods (283), 1, (287, 10, 68, 287), null, null);
            Set_Production (Prods (284), 284, 1);
            Set_RHS (Prods (284), 0, (284, 43, 287), null, null);
            Set_RHS (Prods (284), 1, (287, 43, 287), null, null);
            Set_Production (Prods (285), 285, 1);
            Set_RHS (Prods (285), 0, (285, 43, 22, 287), null, null);
            Set_RHS (Prods (285), 1, (287, 43, 22, 287), null, null);
            Set_Production (Prods (286), 286, 1);
            Set_RHS (Prods (286), 0, (286, 75, 287), null, null);
            Set_RHS (Prods (286), 1, (287, 75, 287), null, null);
            Set_Production (Prods (287), 287, 4);
            Set_RHS (Prods (287), 0, (301, 40, 33, 233), null, null);
            Set_RHS (Prods (287), 1, (301, 33, 233), null, null);
            Set_RHS (Prods (287), 2, (301, 288, 301), null, null);
            Set_RHS (Prods (287), 3, (1 => 301), null, null);
            Set_RHS (Prods (287), 4, (1 => 275), null, null);
            Set_Production (Prods (288), 288, 5);
            Set_RHS (Prods (288), 0, (1 => 86), null, null);
            Set_RHS (Prods (288), 1, (1 => 98), null, null);
            Set_RHS (Prods (288), 2, (1 => 91), null, null);
            Set_RHS (Prods (288), 3, (1 => 92), null, null);
            Set_RHS (Prods (288), 4, (1 => 88), null, null);
            Set_RHS (Prods (288), 5, (1 => 89), null, null);
            Set_Production (Prods (289), 289, 3);
            Set_RHS (Prods (289), 0, (1 => 245), null, null);
            Set_RHS (Prods (289), 1, (1 => 250), null, null);
            Set_RHS (Prods (289), 2, (1 => 311), null, null);
            Set_RHS (Prods (289), 3, (1 => 215), null, null);
            Set_Production (Prods (290), 290, 1);
            Set_RHS (Prods (290), 0, (57, 239, 74, 5, 96), requeue_statement_0'Access, null);
            Set_RHS (Prods (290), 1, (57, 239, 96), requeue_statement_1'Access, null);
            Set_Production (Prods (291), 291, 1);
            Set_RHS (Prods (291), 0, (58, 241, 240), result_profile_0'Access, null);
            Set_RHS (Prods (291), 1, (58, 114), result_profile_1'Access, null);
            Set_Production (Prods (292), 292, 1);
            Set_RHS (Prods (292), 0, (1 => 314), null, null);
            Set_RHS (Prods (292), 1, (1 => 114), null, null);
            Set_Production (Prods (293), 293, 3);
            Set_RHS (Prods (293), 0, (239, 84, 104), selected_component_0'Access, selected_component_0_check'Access);
            Set_RHS (Prods (293), 1, (239, 84, 106), selected_component_1'Access, null);
            Set_RHS (Prods (293), 2, (239, 84, 105), selected_component_2'Access, selected_component_2_check'Access);
            Set_RHS (Prods (293), 3, (239, 84, 9), selected_component_3'Access, null);
            Set_Production (Prods (294), 294, 1);
            Set_RHS (Prods (294), 0, (61, 297, 22, 300, 24, 61, 96), selective_accept_0'Access, null);
            Set_RHS (Prods (294), 1, (61, 297, 24, 61, 96), selective_accept_1'Access, null);
            Set_Production (Prods (295), 295, 5);
            Set_RHS (Prods (295), 0, (72, 192, 87, 113, 300), select_alternative_0'Access, null);
            Set_RHS (Prods (295), 1, (72, 192, 87, 67, 96), select_alternative_1'Access, null);
            Set_RHS (Prods (295), 2, (72, 192, 87, 160), select_alternative_2'Access, null);
            Set_RHS (Prods (295), 3, (113, 300), null, null);
            Set_RHS (Prods (295), 4, (67, 96), select_alternative_4'Access, null);
            Set_RHS (Prods (295), 5, (1 => 160), null, null);
            Set_Production (Prods (296), 296, 1);
            Set_RHS (Prods (296), 0, (296, 43, 295), select_alternative_list_0'Access, null);
            Set_RHS (Prods (296), 1, (1 => 295), select_alternative_list_1'Access, null);
            Set_Production (Prods (297), 297, 1);
            Set_RHS (Prods (297), 0, (1 => 296), null, null);
            Set_RHS (Prods (297), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (298), 298, 3);
            Set_RHS (Prods (298), 0, (1 => 294), null, null);
            Set_RHS (Prods (298), 1, (1 => 323), null, null);
            Set_RHS (Prods (298), 2, (1 => 152), null, null);
            Set_RHS (Prods (298), 3, (1 => 126), null, null);
            Set_Production (Prods (299), 299, 1);
            Set_RHS (Prods (299), 0, (299, 306), null, null);
            Set_RHS (Prods (299), 1, (1 => 306), null, null);
            Set_Production (Prods (300), 300, 1);
            Set_RHS (Prods (300), 0, (1 => 299), null, null);
            Set_RHS (Prods (300), 1, (1 .. 0 => <>), null, null);
            Set_Production (Prods (301), 301, 1);
            Set_RHS (Prods (301), 0, (330, 321), null, null);
            Set_RHS (Prods (301), 1, (1 => 321), null, null);
            Set_Production (Prods (302), 302, 0);
            Set_RHS (Prods (302), 0, (58, 192, 96), simple_return_statement_0'Access, null);
            Set_Production (Prods (303), 303, 10);
            Set_RHS (Prods (303), 0, (41, 96), simple_statement_0'Access, null);
            Set_RHS (Prods (303), 1, (1 => 123), null, null);
            Set_RHS (Prods (303), 2, (1 => 190), null, null);
            Set_RHS (Prods (303), 3, (31, 104, 96), simple_statement_3'Access, null);
            Set_RHS (Prods (303), 4, (1 => 261), null, null);
            Set_RHS (Prods (303), 5, (1 => 302), null, null);
            Set_RHS (Prods (303), 6, (1 => 290), null, null);
            Set_RHS (Prods (303), 7, (1 => 161), null, null);
            Set_RHS (Prods (303), 8, (5, 239, 96), simple_statement_8'Access, null);
            Set_RHS (Prods (303), 9, (1 => 276), null, null);
            Set_RHS (Prods (303), 10, (1 => 257), null, null);
            Set_Production (Prods (304), 304, 1);
            Set_RHS (Prods (304), 0, (51, 104, 122, 35, 39, 227, 74, 266, 96), single_protected_declaration_0'Access,
            single_protected_declaration_0_check'Access);
            Set_RHS (Prods (304), 1, (51, 104, 122, 35, 266, 96), single_protected_declaration_1'Access,
            single_protected_declaration_1_check'Access);
            Set_Production (Prods (305), 305, 2);
            Set_RHS (Prods (305), 0, (66, 104, 122, 35, 39, 227, 74, 318, 24, 220, 96),
            single_task_declaration_0'Access, single_task_declaration_0_check'Access);
            Set_RHS (Prods (305), 1, (66, 104, 122, 35, 318, 24, 220, 96), single_task_declaration_1'Access,
            single_task_declaration_1_check'Access);
            Set_RHS (Prods (305), 2, (66, 104, 122, 96), single_task_declaration_2'Access, null);
            Set_Production (Prods (306), 306, 2);
            Set_RHS (Prods (306), 0, (1 => 217), null, null);
            Set_RHS (Prods (306), 1, (1 => 303), null, null);
            Set_RHS (Prods (306), 2, (1 => 151), null, null);
            Set_Production (Prods (307), 307, 0);
            Set_RHS (Prods (307), 0, (246, 312, 122, 35, 159, 13, 218, 24, 240, 96), subprogram_body_0'Access,
            subprogram_body_0_check'Access);
            Set_Production (Prods (308), 308, 0);
            Set_RHS (Prods (308), 0, (246, 312, 35, 60, 122, 96), subprogram_body_stub_0'Access, null);
            Set_Production (Prods (309), 309, 0);
            Set_RHS (Prods (309), 0, (246, 312, 122, 96), subprogram_declaration_0'Access, null);
            Set_Production (Prods (310), 310, 2);
            Set_RHS (Prods (310), 0, (1 => 239), subprogram_default_0'Access, null);
            Set_RHS (Prods (310), 1, (1 => 80), null, null);
            Set_RHS (Prods (310), 2, (1 => 41), null, null);
            Set_Production (Prods (311), 311, 0);
            Set_RHS (Prods (311), 0, (246, 312, 56, 239, 122, 96), subprogram_renaming_declaration_0'Access, null);
            Set_Production (Prods (312), 312, 1);
            Set_RHS (Prods (312), 0, (1 => 262), null, subprogram_specification_0_check'Access);
            Set_RHS (Prods (312), 1, (1 => 207), null, subprogram_specification_1_check'Access);
            Set_Production (Prods (313), 313, 0);
            Set_RHS (Prods (313), 0, (63, 104, 35, 314, 122, 96), subtype_declaration_0'Access, null);
            Set_Production (Prods (314), 314, 3);
            Set_RHS (Prods (314), 0, (40, 41, 239, 155), subtype_indication_0'Access, null);
            Set_RHS (Prods (314), 1, (40, 41, 239), subtype_indication_1'Access, null);
            Set_RHS (Prods (314), 2, (239, 155), subtype_indication_2'Access, null);
            Set_RHS (Prods (314), 3, (1 => 239), subtype_indication_3'Access, null);
            Set_Production (Prods (315), 315, 0);
            Set_RHS (Prods (315), 0, (60, 76, 239, 77, 263), subunit_0'Access, null);
            Set_Production (Prods (316), 316, 0);
            Set_RHS (Prods (316), 0, (66, 14, 104, 122, 35, 159, 13, 218, 24, 220, 96), task_body_0'Access,
            task_body_0_check'Access);
            Set_Production (Prods (317), 317, 0);
            Set_RHS (Prods (317), 0, (66, 14, 104, 35, 60, 122, 96), task_body_stub_0'Access, null);
            Set_Production (Prods (318), 318, 1);
            Set_RHS (Prods (318), 0, (159, 49, 159), task_definition_0'Access, null);
            Set_RHS (Prods (318), 1, (1 => 159), task_definition_1'Access, null);
            Set_Production (Prods (319), 319, 2);
            Set_RHS (Prods (319), 0, (66, 69, 104, 169, 122, 35, 39, 227, 74, 318, 24, 220, 96),
            task_type_declaration_0'Access, task_type_declaration_0_check'Access);
            Set_RHS (Prods (319), 1, (66, 69, 104, 169, 122, 35, 318, 24, 220, 96), task_type_declaration_1'Access,
            task_type_declaration_1_check'Access);
            Set_RHS (Prods (319), 2, (66, 69, 104, 169, 122, 96), task_type_declaration_2'Access, null);
            Set_Production (Prods (320), 320, 1);
            Set_RHS (Prods (320), 0, (320, 237, 197), null, null);
            Set_RHS (Prods (320), 1, (1 => 197), null, null);
            Set_Production (Prods (321), 321, 1);
            Set_RHS (Prods (321), 0, (321, 130, 320), null, null);
            Set_RHS (Prods (321), 1, (1 => 320), null, null);
            Set_Production (Prods (322), 322, 1);
            Set_RHS (Prods (322), 0, (1 => 101), null, null);
            Set_RHS (Prods (322), 1, (1 => 102), null, null);
            Set_Production (Prods (323), 323, 0);
            Set_RHS (Prods (323), 0, (61, 178, 43, 160, 24, 61, 96), timed_entry_call_0'Access, null);
            Set_Production (Prods (324), 324, 2);
            Set_RHS (Prods (324), 0, (261, 300), null, null);
            Set_RHS (Prods (324), 1, (239, 300), null, null);
            Set_RHS (Prods (324), 2, (161, 300), null, null);
            Set_Production (Prods (325), 325, 3);
            Set_RHS (Prods (325), 0, (1 => 206), null, null);
            Set_RHS (Prods (325), 1, (1 => 223), null, null);
            Set_RHS (Prods (325), 2, (1 => 260), null, null);
            Set_RHS (Prods (325), 3, (1 => 259), null, null);
            Set_Production (Prods (326), 326, 10);
            Set_RHS (Prods (326), 0, (1 => 183), null, null);
            Set_RHS (Prods (326), 1, (53, 301, 85, 301), null, null);
            Set_RHS (Prods (326), 2, (38, 192), null, null);
            Set_RHS (Prods (326), 3, (20, 192, 279), null, null);
            Set_RHS (Prods (326), 4, (19, 192, 20, 192, 279), null, null);
            Set_RHS (Prods (326), 5, (19, 192, 279), null, null);
            Set_RHS (Prods (326), 6, (1 => 120), null, null);
            Set_RHS (Prods (326), 7, (111, 280), null, null);
            Set_RHS (Prods (326), 8, (1 => 114), null, null);
            Set_RHS (Prods (326), 9, (1 => 162), null, null);
            Set_RHS (Prods (326), 10, (1 => 228), null, null);
            Set_Production (Prods (327), 327, 0);
            Set_RHS (Prods (327), 0, (15, 164, 35, 328, 24, 15, 96), variant_part_0'Access, null);
            Set_Production (Prods (328), 328, 1);
            Set_RHS (Prods (328), 0, (328, 329), null, null);
            Set_RHS (Prods (328), 1, (1 => 329), null, null);
            Set_Production (Prods (329), 329, 0);
            Set_RHS (Prods (329), 0, (72, 166, 87, 150), variant_0'Access, null);
            Set_Production (Prods (330), 330, 1);
            Set_RHS (Prods (330), 0, (1 => 95), null, null);
            Set_RHS (Prods (330), 1, (1 => 94), null, null);
            Set_Production (Prods (331), 331, 2);
            Set_RHS (Prods (331), 0, (71, 9, 69, 238, 96), use_clause_0'Access, null);
            Set_RHS (Prods (331), 1, (71, 69, 238, 96), use_clause_1'Access, null);
            Set_RHS (Prods (331), 2, (71, 238, 96), use_clause_2'Access, null);
            Set_Production (Prods (332), 332, 3);
            Set_RHS (Prods (332), 0, (36, 49, 74, 238, 96), with_clause_0'Access, null);
            Set_RHS (Prods (332), 1, (36, 74, 238, 96), with_clause_1'Access, null);
            Set_RHS (Prods (332), 2, (49, 74, 238, 96), with_clause_2'Access, null);
            Set_RHS (Prods (332), 3, (74, 238, 96), with_clause_3'Access, null);
         end return;
      end Productions;

      Table : constant Parse_Table_Ptr := Get_Text_Rep
        (Text_Rep_File_Name, McKenzie_Param, Productions);
   begin
      WisiToken.Parse.LR.Parser.New_Parser
        (Parser,
         Trace,
         Lexer.New_Lexer (Trace),
         Table,
         Language_Fixes,
         Language_Use_Minimal_Complete_Actions,
         Language_String_ID_Set,
         User_Data,
         Max_Parallel         => 15,
         Terminate_Same_State => True);
   end Create_Parser;
end Ada_Process_LR1_Main;
