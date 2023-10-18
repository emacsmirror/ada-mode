--  generated parser support file. -*- buffer-read-only:t  -*-
--  command line: wisitoken-bnf-generate.exe  --generate LR1 Ada_Emacs re2c PROCESS text_rep ada_annex_p.wy
--

--  Copyright (C) 2013 - 2023 Free Software Foundation, Inc.

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
with WisiToken.Lexer.re2c;
with ada_annex_p_re2c_c;
with Ada_Annex_P_Process_LR1_Actions; use Ada_Annex_P_Process_LR1_Actions;
package body Ada_Annex_P_Process_LR1_Main is

   function Is_Block_Delimited (ID : in WisiToken.Token_ID) return Boolean
   is begin
      case To_Token_Enum (ID) is
      when
         PLACEHOLDER_ID |
         COMMENT_ID |
         CONFLICT_MARK_A_ID |
         CONFLICT_MARK_B_ID |
         CONFLICT_MARK_END_ID |
         STRING_LITERAL_ID |
         CHARACTER_LITERAL_ID => return True;
      when others => return False;
      end case;
   end Is_Block_Delimited;

   function Same_Block_Delimiters (ID : in WisiToken.Token_ID) return Boolean
   is begin
      case To_Token_Enum (ID) is
      when PLACEHOLDER_ID => return False;
      when COMMENT_ID => return False;
      when CONFLICT_MARK_A_ID => return False;
      when CONFLICT_MARK_B_ID => return False;
      when CONFLICT_MARK_END_ID => return False;
      when STRING_LITERAL_ID => return True;
      when CHARACTER_LITERAL_ID => return True;
      when others => return False;
      end case;
   end Same_Block_Delimiters;

   function Escape_Delimiter_Doubled (ID : in WisiToken.Token_ID) return Boolean
   is begin
      case To_Token_Enum (ID) is
      when STRING_LITERAL_ID => return True;
      when others => return False;
      end case;
   end Escape_Delimiter_Doubled;

   function Start_Delimiter_Length (ID : in WisiToken.Token_ID) return Integer
   is begin
      case To_Token_Enum (ID) is
      when PLACEHOLDER_ID => return 1;
      when COMMENT_ID => return 2;
      when CONFLICT_MARK_A_ID => return 7;
      when CONFLICT_MARK_B_ID => return 7;
      when CONFLICT_MARK_END_ID => return 7;
      when STRING_LITERAL_ID => return 1;
      when CHARACTER_LITERAL_ID => return 1;
      when others => raise SAL.Programmer_Error; return 0;
      end case;
   end Start_Delimiter_Length;

   function End_Delimiter_Length (ID : in WisiToken.Token_ID) return Integer
   is begin
      case To_Token_Enum (ID) is
      when
         COMMENT_ID |
         CONFLICT_MARK_A_ID |
         CONFLICT_MARK_B_ID |
         CONFLICT_MARK_END_ID |
         STRING_LITERAL_ID |
         CHARACTER_LITERAL_ID => return 1;
      when PLACEHOLDER_ID => return 1;
      when others => raise SAL.Programmer_Error; return 0;
      end case;
   end End_Delimiter_Length;

   function New_Line_Is_End_Delimiter (ID : in WisiToken.Token_ID) return Boolean
   is begin
      return
        (case To_Token_Enum (ID) is
         when PLACEHOLDER_ID => True,
         when COMMENT_ID => True,
         when CONFLICT_MARK_A_ID => True,
         when CONFLICT_MARK_B_ID => True,
         when CONFLICT_MARK_END_ID => True,
         when STRING_LITERAL_ID => True,
         when CHARACTER_LITERAL_ID => True,
         when others => raise SAL.Programmer_Error);
   end New_Line_Is_End_Delimiter;

   function Find_End_Delimiter
     (Source      : in WisiToken.Lexer.Source;
      ID          : in WisiToken.Token_ID;
      Token_Start : in WisiToken.Buffer_Pos)
     return WisiToken.Buffer_Pos
   is begin
      return
        (case To_Token_Enum (ID) is
         when PLACEHOLDER_ID => WisiToken.Lexer.Find_String (Source, Token_Start, "}"),
         when COMMENT_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when CONFLICT_MARK_A_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when CONFLICT_MARK_B_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when CONFLICT_MARK_END_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when STRING_LITERAL_ID => WisiToken.Lexer.Find_String_Or_New_Line (Source, Token_Start, """"),
         when CHARACTER_LITERAL_ID => WisiToken.Lexer.Find_String_Or_New_Line (Source, Token_Start, """"),
         when others => raise SAL.Programmer_Error);
   end Find_End_Delimiter;

   function Find_Scan_End
     (Source   : in WisiToken.Lexer.Source;
      ID       : in WisiToken.Token_ID;
      Region   : in WisiToken.Buffer_Region;
      Inserted : in Boolean;
      Start    : in Boolean)
     return WisiToken.Buffer_Pos
   is
      use WisiToken;
   begin
      return
        (case To_Token_Enum (ID) is
         when PLACEHOLDER_ID =>
         (if Inserted then Region.Last
          elsif Start then Region.Last
          else Lexer.Find_String_Or_New_Line (Source, Region.Last, "{")),
         when COMMENT_ID =>
         (if Inserted then Region.Last
          elsif Start then Region.Last
          else Lexer.Find_New_Line (Source, Region.Last)),
         when CONFLICT_MARK_A_ID =>
         (if Inserted then Region.Last
          elsif Start then Region.Last
          else Lexer.Find_New_Line (Source, Region.Last)),
         when CONFLICT_MARK_B_ID =>
         (if Inserted then Region.Last
          elsif Start then Region.Last
          else Lexer.Find_New_Line (Source, Region.Last)),
         when CONFLICT_MARK_END_ID =>
         (if Inserted then Region.Last
          elsif Start then Region.Last
          else Lexer.Find_New_Line (Source, Region.Last)),
         when STRING_LITERAL_ID => Lexer.Find_New_Line (Source, Region.Last),
         when CHARACTER_LITERAL_ID => Lexer.Find_New_Line (Source, Region.Last),
         when others => raise SAL.Programmer_Error);
   end Find_Scan_End;

   function Contains_End_Delimiter
     (Source : in WisiToken.Lexer.Source;
      ID     : in WisiToken.Token_ID;
      Region : in WisiToken.Buffer_Region)
     return WisiToken.Base_Buffer_Pos
   is
      use WisiToken;
   begin
      return
        (case To_Token_Enum (ID) is
         when PLACEHOLDER_ID => Lexer.Find_String_Or_New_Line (Source, Region, "}"),
         when COMMENT_ID => Lexer.Find_New_Line (Source, Region),
         when CONFLICT_MARK_A_ID => Lexer.Find_New_Line (Source, Region),
         when CONFLICT_MARK_B_ID => Lexer.Find_New_Line (Source, Region),
         when CONFLICT_MARK_END_ID => Lexer.Find_New_Line (Source, Region),
         when STRING_LITERAL_ID => Lexer.Find_String_Or_New_Line (Source, Region, """"),
         when CHARACTER_LITERAL_ID => Lexer.Find_String_Or_New_Line (Source, Region, "'"),
         when others => raise SAL.Programmer_Error);
   end Contains_End_Delimiter;

   function Line_Begin_Char_Pos
    (Source : in WisiToken.Lexer.Source;
     Token  : in WisiToken.Lexer.Token;
     Line   : in WisiToken.Line_Number_Type)
   return WisiToken.Buffer_Pos
   is
      pragma Unreferenced (Source, Line);
      use all type WisiToken.Base_Buffer_Pos;
   begin
      case To_Token_Enum (Token.ID) is
      when NEW_LINE_ID => return Token.Char_Region.Last + 1;
      when COMMENT_ID => return Token.Char_Region.Last + 1;
      when CONFLICT_MARK_A_ID => return Token.Char_Region.Last + 1;
      when CONFLICT_MARK_B_ID => return Token.Char_Region.Last + 1;
      when CONFLICT_MARK_END_ID => return Token.Char_Region.Last + 1;
      when others => raise SAL.Programmer_Error;
      end case;
   end Line_Begin_Char_Pos;

   function Can_Contain_New_Line (ID : in WisiToken.Token_ID) return Boolean
   is begin
      case To_Token_Enum (ID) is
      when NEW_LINE_ID => return True;
      when COMMENT_ID => return True;
      when CONFLICT_MARK_A_ID => return True;
      when CONFLICT_MARK_B_ID => return True;
      when CONFLICT_MARK_END_ID => return True;
      when others => return False;
      end case;
   end Can_Contain_New_Line;

   function Terminated_By_New_Line (ID : in WisiToken.Token_ID) return Boolean
   is begin
      case To_Token_Enum (ID) is
      when NEW_LINE_ID => return True;
      when COMMENT_ID => return True;
      when CONFLICT_MARK_A_ID => return True;
      when CONFLICT_MARK_B_ID => return True;
      when CONFLICT_MARK_END_ID => return True;
      when STRING_LITERAL_ID => return True;
      when CHARACTER_LITERAL_ID => return True;
      when others => return False;
      end case;
   end Terminated_By_New_Line;

   package Lexer is new WisiToken.Lexer.re2c
     (ada_annex_p_re2c_c.New_Lexer,
      ada_annex_p_re2c_c.Free_Lexer,
      ada_annex_p_re2c_c.Reset_Lexer,
      ada_annex_p_re2c_c.Set_Verbosity,
      ada_annex_p_re2c_c.Set_Position,
      ada_annex_p_re2c_c.Next_Token,
      Is_Block_Delimited,
      Same_Block_Delimiters,
      Escape_Delimiter_Doubled,
      Start_Delimiter_Length,
      End_Delimiter_Length,
      New_Line_Is_End_Delimiter,
      Find_End_Delimiter,
      Contains_End_Delimiter,
      Find_Scan_End,
      Line_Begin_Char_Pos,
      Can_Contain_New_Line,
      Terminated_By_New_Line);

   function Create_Parse_Table
    (Text_Rep_File_Name : in String)
     return WisiToken.Parse.LR.Parse_Table_Ptr
   is
      use WisiToken.Parse.LR;
      McKenzie_Param : constant McKenzie_Param_Type :=
        (First_Terminal    => 7,
         Last_Terminal     => 119,
         First_Nonterminal => 120,
         Last_Nonterminal  => 444,
         Insert =>
           (4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2, 4, 4, 4, 4, 4, 4, 4, 4, 3, 4, 4, 4, 4, 4, 4, 4, 2, 4, 4, 4, 4, 4, 4,
            4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 7, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
            4, 4, 4, 4, 4, 4, 4, 4, 3, 4, 4, 4, 4, 4, 4, 4, 3, 4, 4, 4, 3, 4, 4, 4, 4, 4, 4, 4, 4, 3, 4, 4, 4, 4, 4, 4,
            4, 2, 4, 4, 4),
         Delete =>
           (3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
            3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
            3, 3, 3, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
            3, 3, 3, 3, 3),
         Push_Back =>
           (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2),
         Undo_Reduce =>
           (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2),
         Minimal_Complete_Cost_Delta => -3,
         Fast_Forward =>  2,
         Matching_Begin =>  1,
         Ignore_Check_Fail  => 2,
         Check_Limit => 4,
         Zombie_Limit => 4,
         Check_Delta_Limit => 100,
         Enqueue_Limit => 58000);

      Table : constant Parse_Table_Ptr := Get_Text_Rep (Text_Rep_File_Name);
   begin
      Table.Error_Recover_Enabled := True;
      Table.McKenzie_Param := McKenzie_Param;
      Table.Max_Parallel := 20;
      return Table;
   end Create_Parse_Table;

   function Create_Productions return WisiToken.Syntax_Trees.Production_Info_Trees.Vector
   is begin
      return Result : WisiToken.Syntax_Trees.Production_Info_Trees.Vector do
         Result.Set_First_Last (120, 444);
         Result (125).RHSs.Set_First_Last (0, 1);
         Result (125).RHSs (0).In_Parse_Action := null;
         Result (125).RHSs (0).Post_Parse_Action := pragma_argument_association_list_0'Access;
         Result (125).RHSs (1).In_Parse_Action := null;
         Result (125).RHSs (1).Post_Parse_Action := pragma_argument_association_list_1'Access;
         Result (126).RHSs.Set_First_Last (0, 3);
         Result (126).RHSs (0).In_Parse_Action := null;
         Result (126).RHSs (0).Post_Parse_Action := pragma_g_0'Access;
         Result (126).RHSs (1).In_Parse_Action := null;
         Result (126).RHSs (1).Post_Parse_Action := pragma_g_1'Access;
         Result (126).RHSs (2).In_Parse_Action := null;
         Result (126).RHSs (2).Post_Parse_Action := pragma_g_2'Access;
         Result (126).RHSs (3).In_Parse_Action := null;
         Result (126).RHSs (3).Post_Parse_Action := pragma_g_3'Access;
         Result (130).RHSs.Set_First_Last (0, 5);
         Result (130).RHSs (0).In_Parse_Action := null;
         Result (130).RHSs (0).Post_Parse_Action := full_type_declaration_0'Access;
         Result (130).RHSs (1).In_Parse_Action := null;
         Result (130).RHSs (1).Post_Parse_Action := full_type_declaration_1'Access;
         Result (130).RHSs (2).In_Parse_Action := null;
         Result (130).RHSs (2).Post_Parse_Action := full_type_declaration_2'Access;
         Result (130).RHSs (3).In_Parse_Action := null;
         Result (130).RHSs (3).Post_Parse_Action := full_type_declaration_3'Access;
         Result (130).RHSs (4).In_Parse_Action := null;
         Result (130).RHSs (4).Post_Parse_Action := null;
         Result (130).RHSs (5).In_Parse_Action := null;
         Result (130).RHSs (5).Post_Parse_Action := null;
         Result (132).RHSs.Set_First_Last (0, 3);
         Result (132).RHSs (0).In_Parse_Action := null;
         Result (132).RHSs (0).Post_Parse_Action := subtype_declaration_0'Access;
         Result (132).RHSs (1).In_Parse_Action := null;
         Result (132).RHSs (1).Post_Parse_Action := subtype_declaration_1'Access;
         Result (132).RHSs (2).In_Parse_Action := null;
         Result (132).RHSs (2).Post_Parse_Action := subtype_declaration_2'Access;
         Result (132).RHSs (3).In_Parse_Action := null;
         Result (132).RHSs (3).Post_Parse_Action := subtype_declaration_3'Access;
         Result (137).RHSs.Set_First_Last (0, 65);
         Result (137).RHSs (0).In_Parse_Action := null;
         Result (137).RHSs (0).Post_Parse_Action := object_declaration_0'Access;
         Result (137).RHSs (1).In_Parse_Action := null;
         Result (137).RHSs (1).Post_Parse_Action := object_declaration_1'Access;
         Result (137).RHSs (2).In_Parse_Action := null;
         Result (137).RHSs (2).Post_Parse_Action := object_declaration_2'Access;
         Result (137).RHSs (3).In_Parse_Action := null;
         Result (137).RHSs (3).Post_Parse_Action := object_declaration_3'Access;
         Result (137).RHSs (4).In_Parse_Action := null;
         Result (137).RHSs (4).Post_Parse_Action := object_declaration_4'Access;
         Result (137).RHSs (5).In_Parse_Action := null;
         Result (137).RHSs (5).Post_Parse_Action := object_declaration_5'Access;
         Result (137).RHSs (6).In_Parse_Action := null;
         Result (137).RHSs (6).Post_Parse_Action := object_declaration_6'Access;
         Result (137).RHSs (7).In_Parse_Action := null;
         Result (137).RHSs (7).Post_Parse_Action := object_declaration_7'Access;
         Result (137).RHSs (8).In_Parse_Action := null;
         Result (137).RHSs (8).Post_Parse_Action := object_declaration_8'Access;
         Result (137).RHSs (9).In_Parse_Action := null;
         Result (137).RHSs (9).Post_Parse_Action := object_declaration_9'Access;
         Result (137).RHSs (10).In_Parse_Action := null;
         Result (137).RHSs (10).Post_Parse_Action := object_declaration_10'Access;
         Result (137).RHSs (11).In_Parse_Action := null;
         Result (137).RHSs (11).Post_Parse_Action := object_declaration_11'Access;
         Result (137).RHSs (12).In_Parse_Action := null;
         Result (137).RHSs (12).Post_Parse_Action := object_declaration_12'Access;
         Result (137).RHSs (13).In_Parse_Action := null;
         Result (137).RHSs (13).Post_Parse_Action := object_declaration_13'Access;
         Result (137).RHSs (14).In_Parse_Action := null;
         Result (137).RHSs (14).Post_Parse_Action := object_declaration_14'Access;
         Result (137).RHSs (15).In_Parse_Action := null;
         Result (137).RHSs (15).Post_Parse_Action := object_declaration_15'Access;
         Result (137).RHSs (16).In_Parse_Action := null;
         Result (137).RHSs (16).Post_Parse_Action := object_declaration_16'Access;
         Result (137).RHSs (17).In_Parse_Action := null;
         Result (137).RHSs (17).Post_Parse_Action := object_declaration_17'Access;
         Result (137).RHSs (18).In_Parse_Action := null;
         Result (137).RHSs (18).Post_Parse_Action := object_declaration_18'Access;
         Result (137).RHSs (19).In_Parse_Action := null;
         Result (137).RHSs (19).Post_Parse_Action := object_declaration_19'Access;
         Result (137).RHSs (20).In_Parse_Action := null;
         Result (137).RHSs (20).Post_Parse_Action := object_declaration_20'Access;
         Result (137).RHSs (21).In_Parse_Action := null;
         Result (137).RHSs (21).Post_Parse_Action := object_declaration_21'Access;
         Result (137).RHSs (22).In_Parse_Action := null;
         Result (137).RHSs (22).Post_Parse_Action := object_declaration_22'Access;
         Result (137).RHSs (23).In_Parse_Action := null;
         Result (137).RHSs (23).Post_Parse_Action := object_declaration_23'Access;
         Result (137).RHSs (24).In_Parse_Action := null;
         Result (137).RHSs (24).Post_Parse_Action := object_declaration_24'Access;
         Result (137).RHSs (25).In_Parse_Action := null;
         Result (137).RHSs (25).Post_Parse_Action := object_declaration_25'Access;
         Result (137).RHSs (26).In_Parse_Action := null;
         Result (137).RHSs (26).Post_Parse_Action := object_declaration_26'Access;
         Result (137).RHSs (27).In_Parse_Action := null;
         Result (137).RHSs (27).Post_Parse_Action := object_declaration_27'Access;
         Result (137).RHSs (28).In_Parse_Action := null;
         Result (137).RHSs (28).Post_Parse_Action := object_declaration_28'Access;
         Result (137).RHSs (29).In_Parse_Action := null;
         Result (137).RHSs (29).Post_Parse_Action := object_declaration_29'Access;
         Result (137).RHSs (30).In_Parse_Action := null;
         Result (137).RHSs (30).Post_Parse_Action := object_declaration_30'Access;
         Result (137).RHSs (31).In_Parse_Action := null;
         Result (137).RHSs (31).Post_Parse_Action := object_declaration_31'Access;
         Result (137).RHSs (32).In_Parse_Action := null;
         Result (137).RHSs (32).Post_Parse_Action := object_declaration_32'Access;
         Result (137).RHSs (33).In_Parse_Action := null;
         Result (137).RHSs (33).Post_Parse_Action := object_declaration_33'Access;
         Result (137).RHSs (34).In_Parse_Action := null;
         Result (137).RHSs (34).Post_Parse_Action := object_declaration_34'Access;
         Result (137).RHSs (35).In_Parse_Action := null;
         Result (137).RHSs (35).Post_Parse_Action := object_declaration_35'Access;
         Result (137).RHSs (36).In_Parse_Action := null;
         Result (137).RHSs (36).Post_Parse_Action := object_declaration_36'Access;
         Result (137).RHSs (37).In_Parse_Action := null;
         Result (137).RHSs (37).Post_Parse_Action := object_declaration_37'Access;
         Result (137).RHSs (38).In_Parse_Action := null;
         Result (137).RHSs (38).Post_Parse_Action := object_declaration_38'Access;
         Result (137).RHSs (39).In_Parse_Action := null;
         Result (137).RHSs (39).Post_Parse_Action := object_declaration_39'Access;
         Result (137).RHSs (40).In_Parse_Action := null;
         Result (137).RHSs (40).Post_Parse_Action := object_declaration_40'Access;
         Result (137).RHSs (41).In_Parse_Action := null;
         Result (137).RHSs (41).Post_Parse_Action := object_declaration_41'Access;
         Result (137).RHSs (42).In_Parse_Action := null;
         Result (137).RHSs (42).Post_Parse_Action := object_declaration_42'Access;
         Result (137).RHSs (43).In_Parse_Action := null;
         Result (137).RHSs (43).Post_Parse_Action := object_declaration_43'Access;
         Result (137).RHSs (44).In_Parse_Action := null;
         Result (137).RHSs (44).Post_Parse_Action := object_declaration_44'Access;
         Result (137).RHSs (45).In_Parse_Action := null;
         Result (137).RHSs (45).Post_Parse_Action := object_declaration_45'Access;
         Result (137).RHSs (46).In_Parse_Action := null;
         Result (137).RHSs (46).Post_Parse_Action := object_declaration_46'Access;
         Result (137).RHSs (47).In_Parse_Action := null;
         Result (137).RHSs (47).Post_Parse_Action := object_declaration_47'Access;
         Result (137).RHSs (48).In_Parse_Action := null;
         Result (137).RHSs (48).Post_Parse_Action := object_declaration_48'Access;
         Result (137).RHSs (49).In_Parse_Action := null;
         Result (137).RHSs (49).Post_Parse_Action := object_declaration_49'Access;
         Result (137).RHSs (50).In_Parse_Action := null;
         Result (137).RHSs (50).Post_Parse_Action := object_declaration_50'Access;
         Result (137).RHSs (51).In_Parse_Action := null;
         Result (137).RHSs (51).Post_Parse_Action := object_declaration_51'Access;
         Result (137).RHSs (52).In_Parse_Action := null;
         Result (137).RHSs (52).Post_Parse_Action := object_declaration_52'Access;
         Result (137).RHSs (53).In_Parse_Action := null;
         Result (137).RHSs (53).Post_Parse_Action := object_declaration_53'Access;
         Result (137).RHSs (54).In_Parse_Action := null;
         Result (137).RHSs (54).Post_Parse_Action := object_declaration_54'Access;
         Result (137).RHSs (55).In_Parse_Action := null;
         Result (137).RHSs (55).Post_Parse_Action := object_declaration_55'Access;
         Result (137).RHSs (56).In_Parse_Action := null;
         Result (137).RHSs (56).Post_Parse_Action := object_declaration_56'Access;
         Result (137).RHSs (57).In_Parse_Action := null;
         Result (137).RHSs (57).Post_Parse_Action := object_declaration_57'Access;
         Result (137).RHSs (58).In_Parse_Action := null;
         Result (137).RHSs (58).Post_Parse_Action := object_declaration_58'Access;
         Result (137).RHSs (59).In_Parse_Action := null;
         Result (137).RHSs (59).Post_Parse_Action := object_declaration_59'Access;
         Result (137).RHSs (60).In_Parse_Action := null;
         Result (137).RHSs (60).Post_Parse_Action := object_declaration_60'Access;
         Result (137).RHSs (61).In_Parse_Action := null;
         Result (137).RHSs (61).Post_Parse_Action := object_declaration_61'Access;
         Result (137).RHSs (62).In_Parse_Action := null;
         Result (137).RHSs (62).Post_Parse_Action := object_declaration_62'Access;
         Result (137).RHSs (63).In_Parse_Action := null;
         Result (137).RHSs (63).Post_Parse_Action := object_declaration_63'Access;
         Result (137).RHSs (64).In_Parse_Action := null;
         Result (137).RHSs (64).Post_Parse_Action := null;
         Result (137).RHSs (65).In_Parse_Action := null;
         Result (137).RHSs (65).Post_Parse_Action := null;
         Result (138).RHSs.Set_First_Last (0, 1);
         Result (138).RHSs (0).In_Parse_Action := null;
         Result (138).RHSs (0).Post_Parse_Action := defining_identifier_list_0'Access;
         Result (138).RHSs (1).In_Parse_Action := null;
         Result (138).RHSs (1).Post_Parse_Action := defining_identifier_list_1'Access;
         Result (139).RHSs.Set_First_Last (0, 0);
         Result (139).RHSs (0).In_Parse_Action := null;
         Result (139).RHSs (0).Post_Parse_Action := number_declaration_0'Access;
         Result (143).Optimized_List := True;
         Result (144).RHSs.Set_First_Last (0, 0);
         Result (144).RHSs (0).In_Parse_Action := null;
         Result (144).RHSs (0).Post_Parse_Action := enumeration_type_definition_0'Access;
         Result (146).RHSs.Set_First_Last (0, 1);
         Result (146).RHSs (0).In_Parse_Action := null;
         Result (146).RHSs (0).Post_Parse_Action := integer_type_definition_0'Access;
         Result (146).RHSs (1).In_Parse_Action := null;
         Result (146).RHSs (1).Post_Parse_Action := integer_type_definition_1'Access;
         Result (156).RHSs.Set_First_Last (0, 1);
         Result (156).RHSs (0).In_Parse_Action := null;
         Result (156).RHSs (0).Post_Parse_Action := array_type_definition_0'Access;
         Result (156).RHSs (1).In_Parse_Action := null;
         Result (156).RHSs (1).Post_Parse_Action := array_type_definition_1'Access;
         Result (157).Optimized_List := True;
         Result (159).Optimized_List := True;
         Result (163).RHSs.Set_First_Last (0, 2);
         Result (163).RHSs (0).In_Parse_Action := null;
         Result (163).RHSs (0).Post_Parse_Action := discrete_range_0'Access;
         Result (163).RHSs (1).In_Parse_Action := null;
         Result (163).RHSs (1).Post_Parse_Action := discrete_range_1'Access;
         Result (163).RHSs (2).In_Parse_Action := null;
         Result (163).RHSs (2).Post_Parse_Action := discrete_range_2'Access;
         Result (166).Optimized_List := True;
         Result (167).RHSs.Set_First_Last (0, 0);
         Result (167).RHSs (0).In_Parse_Action := null;
         Result (167).RHSs (0).Post_Parse_Action := known_discriminant_part_0'Access;
         Result (168).RHSs.Set_First_Last (0, 5);
         Result (168).RHSs (0).In_Parse_Action := null;
         Result (168).RHSs (0).Post_Parse_Action := discriminant_specification_0'Access;
         Result (168).RHSs (1).In_Parse_Action := null;
         Result (168).RHSs (1).Post_Parse_Action := discriminant_specification_1'Access;
         Result (168).RHSs (2).In_Parse_Action := null;
         Result (168).RHSs (2).Post_Parse_Action := discriminant_specification_2'Access;
         Result (168).RHSs (3).In_Parse_Action := null;
         Result (168).RHSs (3).Post_Parse_Action := discriminant_specification_3'Access;
         Result (168).RHSs (4).In_Parse_Action := null;
         Result (168).RHSs (4).Post_Parse_Action := discriminant_specification_4'Access;
         Result (168).RHSs (5).In_Parse_Action := null;
         Result (168).RHSs (5).Post_Parse_Action := discriminant_specification_5'Access;
         Result (170).RHSs.Set_First_Last (0, 2);
         Result (170).RHSs (0).In_Parse_Action := null;
         Result (170).RHSs (0).Post_Parse_Action := record_definition_0'Access;
         Result (170).RHSs (1).In_Parse_Action := null;
         Result (170).RHSs (1).Post_Parse_Action := record_definition_1'Access;
         Result (170).RHSs (2).In_Parse_Action := null;
         Result (170).RHSs (2).Post_Parse_Action := null;
         Result (171).RHSs.Set_First_Last (0, 3);
         Result (171).RHSs (0).In_Parse_Action := null;
         Result (171).RHSs (0).Post_Parse_Action := null;
         Result (171).RHSs (1).In_Parse_Action := null;
         Result (171).RHSs (1).Post_Parse_Action := null;
         Result (171).RHSs (2).In_Parse_Action := null;
         Result (171).RHSs (2).Post_Parse_Action := null;
         Result (171).RHSs (3).In_Parse_Action := null;
         Result (171).RHSs (3).Post_Parse_Action := component_list_3'Access;
         Result (173).RHSs.Set_First_Last (0, 3);
         Result (173).RHSs (0).In_Parse_Action := null;
         Result (173).RHSs (0).Post_Parse_Action := component_declaration_0'Access;
         Result (173).RHSs (1).In_Parse_Action := null;
         Result (173).RHSs (1).Post_Parse_Action := component_declaration_1'Access;
         Result (173).RHSs (2).In_Parse_Action := null;
         Result (173).RHSs (2).Post_Parse_Action := component_declaration_2'Access;
         Result (173).RHSs (3).In_Parse_Action := null;
         Result (173).RHSs (3).Post_Parse_Action := component_declaration_3'Access;
         Result (174).RHSs.Set_First_Last (0, 1);
         Result (174).RHSs (0).In_Parse_Action := null;
         Result (174).RHSs (0).Post_Parse_Action := null;
         Result (174).RHSs (1).In_Parse_Action := null;
         Result (174).RHSs (1).Post_Parse_Action := variant_list_1'Access;
         Result (175).RHSs.Set_First_Last (0, 0);
         Result (175).RHSs (0).In_Parse_Action := null;
         Result (175).RHSs (0).Post_Parse_Action := variant_part_0'Access;
         Result (176).RHSs.Set_First_Last (0, 0);
         Result (176).RHSs (0).In_Parse_Action := null;
         Result (176).RHSs (0).Post_Parse_Action := variant_0'Access;
         Result (178).RHSs.Set_First_Last (0, 3);
         Result (178).RHSs (0).In_Parse_Action := null;
         Result (178).RHSs (0).Post_Parse_Action := discrete_choice_0'Access;
         Result (178).RHSs (1).In_Parse_Action := null;
         Result (178).RHSs (1).Post_Parse_Action := discrete_choice_1'Access;
         Result (178).RHSs (2).In_Parse_Action := null;
         Result (178).RHSs (2).Post_Parse_Action := discrete_choice_2'Access;
         Result (178).RHSs (3).In_Parse_Action := null;
         Result (178).RHSs (3).Post_Parse_Action := null;
         Result (179).RHSs.Set_First_Last (0, 0);
         Result (179).RHSs (0).In_Parse_Action := null;
         Result (179).RHSs (0).Post_Parse_Action := record_extension_part_0'Access;
         Result (180).RHSs.Set_First_Last (0, 3);
         Result (180).RHSs (0).In_Parse_Action := null;
         Result (180).RHSs (0).Post_Parse_Action := abstract_subprogram_declaration_0'Access;
         Result (180).RHSs (1).In_Parse_Action := null;
         Result (180).RHSs (1).Post_Parse_Action := abstract_subprogram_declaration_1'Access;
         Result (180).RHSs (2).In_Parse_Action := null;
         Result (180).RHSs (2).Post_Parse_Action := abstract_subprogram_declaration_2'Access;
         Result (180).RHSs (3).In_Parse_Action := null;
         Result (180).RHSs (3).Post_Parse_Action := abstract_subprogram_declaration_3'Access;
         Result (182).RHSs.Set_First_Last (0, 1);
         Result (182).RHSs (0).In_Parse_Action := null;
         Result (182).RHSs (0).Post_Parse_Action := interface_list_0'Access;
         Result (182).RHSs (1).In_Parse_Action := null;
         Result (182).RHSs (1).Post_Parse_Action := interface_list_1'Access;
         Result (186).RHSs.Set_First_Last (0, 2);
         Result (186).RHSs (0).In_Parse_Action := null;
         Result (186).RHSs (0).Post_Parse_Action := access_to_subprogram_definition_0'Access;
         Result (186).RHSs (1).In_Parse_Action := null;
         Result (186).RHSs (1).Post_Parse_Action := access_to_subprogram_definition_1'Access;
         Result (186).RHSs (2).In_Parse_Action := null;
         Result (186).RHSs (2).Post_Parse_Action := access_to_subprogram_definition_2'Access;
         Result (188).RHSs.Set_First_Last (0, 15);
         Result (188).RHSs (0).In_Parse_Action := null;
         Result (188).RHSs (0).Post_Parse_Action := access_definition_0'Access;
         Result (188).RHSs (1).In_Parse_Action := null;
         Result (188).RHSs (1).Post_Parse_Action := access_definition_1'Access;
         Result (188).RHSs (2).In_Parse_Action := null;
         Result (188).RHSs (2).Post_Parse_Action := access_definition_2'Access;
         Result (188).RHSs (3).In_Parse_Action := null;
         Result (188).RHSs (3).Post_Parse_Action := access_definition_3'Access;
         Result (188).RHSs (4).In_Parse_Action := null;
         Result (188).RHSs (4).Post_Parse_Action := access_definition_4'Access;
         Result (188).RHSs (5).In_Parse_Action := null;
         Result (188).RHSs (5).Post_Parse_Action := access_definition_5'Access;
         Result (188).RHSs (6).In_Parse_Action := null;
         Result (188).RHSs (6).Post_Parse_Action := access_definition_6'Access;
         Result (188).RHSs (7).In_Parse_Action := null;
         Result (188).RHSs (7).Post_Parse_Action := access_definition_7'Access;
         Result (188).RHSs (8).In_Parse_Action := null;
         Result (188).RHSs (8).Post_Parse_Action := access_definition_8'Access;
         Result (188).RHSs (9).In_Parse_Action := null;
         Result (188).RHSs (9).Post_Parse_Action := access_definition_9'Access;
         Result (188).RHSs (10).In_Parse_Action := null;
         Result (188).RHSs (10).Post_Parse_Action := access_definition_10'Access;
         Result (188).RHSs (11).In_Parse_Action := null;
         Result (188).RHSs (11).Post_Parse_Action := access_definition_11'Access;
         Result (188).RHSs (12).In_Parse_Action := null;
         Result (188).RHSs (12).Post_Parse_Action := access_definition_12'Access;
         Result (188).RHSs (13).In_Parse_Action := null;
         Result (188).RHSs (13).Post_Parse_Action := access_definition_13'Access;
         Result (188).RHSs (14).In_Parse_Action := null;
         Result (188).RHSs (14).Post_Parse_Action := access_definition_14'Access;
         Result (188).RHSs (15).In_Parse_Action := null;
         Result (188).RHSs (15).Post_Parse_Action := access_definition_15'Access;
         Result (189).RHSs.Set_First_Last (0, 3);
         Result (189).RHSs (0).In_Parse_Action := null;
         Result (189).RHSs (0).Post_Parse_Action := incomplete_type_declaration_0'Access;
         Result (189).RHSs (1).In_Parse_Action := null;
         Result (189).RHSs (1).Post_Parse_Action := incomplete_type_declaration_1'Access;
         Result (189).RHSs (2).In_Parse_Action := null;
         Result (189).RHSs (2).Post_Parse_Action := incomplete_type_declaration_2'Access;
         Result (189).RHSs (3).In_Parse_Action := null;
         Result (189).RHSs (3).Post_Parse_Action := incomplete_type_declaration_3'Access;
         Result (192).Optimized_List := True;
         Result (195).RHSs.Set_First_Last (0, 2);
         Result (195).RHSs (0).In_Parse_Action := null;
         Result (195).RHSs (0).Post_Parse_Action := null;
         Result (195).RHSs (1).In_Parse_Action := simple_name_1_check'Access;
         Result (195).RHSs (1).Post_Parse_Action := simple_name_1'Access;
         Result (195).RHSs (2).In_Parse_Action := null;
         Result (195).RHSs (2).Post_Parse_Action := null;
         Result (196).RHSs.Set_First_Last (0, 9);
         Result (196).RHSs (0).In_Parse_Action := name_0_check'Access;
         Result (196).RHSs (0).Post_Parse_Action := name_0'Access;
         Result (196).RHSs (1).In_Parse_Action := name_1_check'Access;
         Result (196).RHSs (1).Post_Parse_Action := null;
         Result (196).RHSs (2).In_Parse_Action := null;
         Result (196).RHSs (2).Post_Parse_Action := null;
         Result (196).RHSs (3).In_Parse_Action := null;
         Result (196).RHSs (3).Post_Parse_Action := null;
         Result (196).RHSs (4).In_Parse_Action := name_4_check'Access;
         Result (196).RHSs (4).Post_Parse_Action := null;
         Result (196).RHSs (5).In_Parse_Action := null;
         Result (196).RHSs (5).Post_Parse_Action := null;
         Result (196).RHSs (6).In_Parse_Action := null;
         Result (196).RHSs (6).Post_Parse_Action := null;
         Result (196).RHSs (7).In_Parse_Action := null;
         Result (196).RHSs (7).Post_Parse_Action := null;
         Result (196).RHSs (8).In_Parse_Action := null;
         Result (196).RHSs (8).Post_Parse_Action := null;
         Result (196).RHSs (9).In_Parse_Action := null;
         Result (196).RHSs (9).Post_Parse_Action := null;
         Result (198).RHSs.Set_First_Last (0, 0);
         Result (198).RHSs (0).In_Parse_Action := null;
         Result (198).RHSs (0).Post_Parse_Action := slice_0'Access;
         Result (199).RHSs.Set_First_Last (0, 0);
         Result (199).RHSs (0).In_Parse_Action := selected_component_0_check'Access;
         Result (199).RHSs (0).Post_Parse_Action := selected_component_0'Access;
         Result (203).RHSs.Set_First_Last (0, 1);
         Result (203).RHSs (0).In_Parse_Action := null;
         Result (203).RHSs (0).Post_Parse_Action := range_attribute_designator_0'Access;
         Result (203).RHSs (1).In_Parse_Action := null;
         Result (203).RHSs (1).Post_Parse_Action := range_attribute_designator_1'Access;
         Result (204).RHSs.Set_First_Last (0, 6);
         Result (204).RHSs (0).In_Parse_Action := null;
         Result (204).RHSs (0).Post_Parse_Action := null;
         Result (204).RHSs (1).In_Parse_Action := null;
         Result (204).RHSs (1).Post_Parse_Action := null;
         Result (204).RHSs (2).In_Parse_Action := null;
         Result (204).RHSs (2).Post_Parse_Action := null;
         Result (204).RHSs (3).In_Parse_Action := null;
         Result (204).RHSs (3).Post_Parse_Action := null;
         Result (204).RHSs (4).In_Parse_Action := null;
         Result (204).RHSs (4).Post_Parse_Action := aggregate_4'Access;
         Result (204).RHSs (5).In_Parse_Action := null;
         Result (204).RHSs (5).Post_Parse_Action := aggregate_5'Access;
         Result (204).RHSs (6).In_Parse_Action := null;
         Result (204).RHSs (6).Post_Parse_Action := aggregate_6'Access;
         Result (205).RHSs.Set_First_Last (0, 0);
         Result (205).RHSs (0).In_Parse_Action := null;
         Result (205).RHSs (0).Post_Parse_Action := record_aggregate_0'Access;
         Result (207).RHSs.Set_First_Last (0, 1);
         Result (207).RHSs (0).In_Parse_Action := null;
         Result (207).RHSs (0).Post_Parse_Action := record_component_association_0'Access;
         Result (207).RHSs (1).In_Parse_Action := null;
         Result (207).RHSs (1).Post_Parse_Action := record_component_association_1'Access;
         Result (209).RHSs.Set_First_Last (0, 1);
         Result (209).RHSs (0).In_Parse_Action := null;
         Result (209).RHSs (0).Post_Parse_Action := null;
         Result (209).RHSs (1).In_Parse_Action := null;
         Result (209).RHSs (1).Post_Parse_Action := component_choice_list_1_1'Access;
         Result (210).RHSs.Set_First_Last (0, 0);
         Result (210).RHSs (0).In_Parse_Action := null;
         Result (210).RHSs (0).Post_Parse_Action := extension_aggregate_0'Access;
         Result (212).RHSs.Set_First_Last (0, 1);
         Result (212).RHSs (0).In_Parse_Action := null;
         Result (212).RHSs (0).Post_Parse_Action := expression_list_0'Access;
         Result (212).RHSs (1).In_Parse_Action := null;
         Result (212).RHSs (1).Post_Parse_Action := expression_list_1'Access;
         Result (213).RHSs.Set_First_Last (0, 3);
         Result (213).RHSs (0).In_Parse_Action := null;
         Result (213).RHSs (0).Post_Parse_Action := positional_array_aggregate_0'Access;
         Result (213).RHSs (1).In_Parse_Action := null;
         Result (213).RHSs (1).Post_Parse_Action := positional_array_aggregate_1'Access;
         Result (213).RHSs (2).In_Parse_Action := null;
         Result (213).RHSs (2).Post_Parse_Action := positional_array_aggregate_2'Access;
         Result (213).RHSs (3).In_Parse_Action := null;
         Result (213).RHSs (3).Post_Parse_Action := positional_array_aggregate_3'Access;
         Result (215).RHSs.Set_First_Last (0, 1);
         Result (215).RHSs (0).In_Parse_Action := null;
         Result (215).RHSs (0).Post_Parse_Action := named_array_aggregate_0'Access;
         Result (215).RHSs (1).In_Parse_Action := null;
         Result (215).RHSs (1).Post_Parse_Action := named_array_aggregate_1'Access;
         Result (216).Optimized_List := True;
         Result (217).RHSs.Set_First_Last (0, 1);
         Result (217).RHSs (0).In_Parse_Action := null;
         Result (217).RHSs (0).Post_Parse_Action := array_component_association_0'Access;
         Result (217).RHSs (1).In_Parse_Action := null;
         Result (217).RHSs (1).Post_Parse_Action := null;
         Result (219).RHSs.Set_First_Last (0, 0);
         Result (219).RHSs (0).In_Parse_Action := null;
         Result (219).RHSs (0).Post_Parse_Action := record_delta_aggregate_0'Access;
         Result (220).RHSs.Set_First_Last (0, 1);
         Result (220).RHSs (0).In_Parse_Action := null;
         Result (220).RHSs (0).Post_Parse_Action := array_delta_aggregate_0'Access;
         Result (220).RHSs (1).In_Parse_Action := null;
         Result (220).RHSs (1).Post_Parse_Action := array_delta_aggregate_1'Access;
         Result (221).RHSs.Set_First_Last (0, 1);
         Result (221).RHSs (0).In_Parse_Action := null;
         Result (221).RHSs (0).Post_Parse_Action := iterated_element_association_0'Access;
         Result (221).RHSs (1).In_Parse_Action := null;
         Result (221).RHSs (1).Post_Parse_Action := iterated_element_association_1'Access;
         Result (224).Optimized_List := True;
         Result (225).RHSs.Set_First_Last (0, 1);
         Result (225).RHSs (0).In_Parse_Action := null;
         Result (225).RHSs (0).Post_Parse_Action := membership_choice_0'Access;
         Result (225).RHSs (1).In_Parse_Action := null;
         Result (225).RHSs (1).Post_Parse_Action := membership_choice_1'Access;
         Result (227).Optimized_List := True;
         Result (229).RHSs.Set_First_Last (0, 4);
         Result (229).RHSs (0).In_Parse_Action := null;
         Result (229).RHSs (0).Post_Parse_Action := primary_0'Access;
         Result (229).RHSs (1).In_Parse_Action := null;
         Result (229).RHSs (1).Post_Parse_Action := null;
         Result (229).RHSs (2).In_Parse_Action := null;
         Result (229).RHSs (2).Post_Parse_Action := primary_2'Access;
         Result (229).RHSs (3).In_Parse_Action := null;
         Result (229).RHSs (3).Post_Parse_Action := null;
         Result (229).RHSs (4).In_Parse_Action := null;
         Result (229).RHSs (4).Post_Parse_Action := null;
         Result (235).RHSs.Set_First_Last (0, 0);
         Result (235).RHSs (0).In_Parse_Action := null;
         Result (235).RHSs (0).Post_Parse_Action := elsif_expression_item_0'Access;
         Result (236).RHSs.Set_First_Last (0, 3);
         Result (236).RHSs (0).In_Parse_Action := null;
         Result (236).RHSs (0).Post_Parse_Action := if_expression_0'Access;
         Result (236).RHSs (1).In_Parse_Action := null;
         Result (236).RHSs (1).Post_Parse_Action := if_expression_1'Access;
         Result (236).RHSs (2).In_Parse_Action := null;
         Result (236).RHSs (2).Post_Parse_Action := if_expression_2'Access;
         Result (236).RHSs (3).In_Parse_Action := null;
         Result (236).RHSs (3).Post_Parse_Action := if_expression_3'Access;
         Result (237).RHSs.Set_First_Last (0, 1);
         Result (237).RHSs (0).In_Parse_Action := null;
         Result (237).RHSs (0).Post_Parse_Action := null;
         Result (237).RHSs (1).In_Parse_Action := null;
         Result (237).RHSs (1).Post_Parse_Action := case_expression_alternative_list_1'Access;
         Result (238).RHSs.Set_First_Last (0, 0);
         Result (238).RHSs (0).In_Parse_Action := null;
         Result (238).RHSs (0).Post_Parse_Action := case_expression_0'Access;
         Result (239).RHSs.Set_First_Last (0, 0);
         Result (239).RHSs (0).In_Parse_Action := null;
         Result (239).RHSs (0).Post_Parse_Action := case_expression_alternative_0'Access;
         Result (240).RHSs.Set_First_Last (0, 0);
         Result (240).RHSs (0).In_Parse_Action := null;
         Result (240).RHSs (0).Post_Parse_Action := quantified_expression_0'Access;
         Result (242).RHSs.Set_First_Last (0, 1);
         Result (242).RHSs (0).In_Parse_Action := null;
         Result (242).RHSs (0).Post_Parse_Action := declare_expression_0'Access;
         Result (242).RHSs (1).In_Parse_Action := null;
         Result (242).RHSs (1).Post_Parse_Action := declare_expression_1'Access;
         Result (247).RHSs.Set_First_Last (0, 0);
         Result (247).RHSs (0).In_Parse_Action := null;
         Result (247).RHSs (0).Post_Parse_Action := reduction_specification_0'Access;
         Result (248).RHSs.Set_First_Last (0, 0);
         Result (248).RHSs (0).In_Parse_Action := null;
         Result (248).RHSs (0).Post_Parse_Action := qualified_expression_0'Access;
         Result (250).RHSs.Set_First_Last (0, 3);
         Result (250).RHSs (0).In_Parse_Action := null;
         Result (250).RHSs (0).Post_Parse_Action := null;
         Result (250).RHSs (1).In_Parse_Action := null;
         Result (250).RHSs (1).Post_Parse_Action := null;
         Result (250).RHSs (2).In_Parse_Action := null;
         Result (250).RHSs (2).Post_Parse_Action := subtype_indication_paren_constraint_2'Access;
         Result (250).RHSs (3).In_Parse_Action := null;
         Result (250).RHSs (3).Post_Parse_Action := subtype_indication_paren_constraint_3'Access;
         Result (256).RHSs.Set_First_Last (0, 0);
         Result (256).RHSs (0).In_Parse_Action := null;
         Result (256).RHSs (0).Post_Parse_Action := null_statement_0'Access;
         Result (257).RHSs.Set_First_Last (0, 0);
         Result (257).RHSs (0).In_Parse_Action := null;
         Result (257).RHSs (0).Post_Parse_Action := label_0'Access;
         Result (258).RHSs.Set_First_Last (0, 0);
         Result (258).RHSs (0).In_Parse_Action := null;
         Result (258).RHSs (0).Post_Parse_Action := assignment_statement_0'Access;
         Result (260).RHSs.Set_First_Last (0, 0);
         Result (260).RHSs (0).In_Parse_Action := null;
         Result (260).RHSs (0).Post_Parse_Action := elsif_statement_item_0'Access;
         Result (262).RHSs.Set_First_Last (0, 3);
         Result (262).RHSs (0).In_Parse_Action := null;
         Result (262).RHSs (0).Post_Parse_Action := if_statement_0'Access;
         Result (262).RHSs (1).In_Parse_Action := null;
         Result (262).RHSs (1).Post_Parse_Action := if_statement_1'Access;
         Result (262).RHSs (2).In_Parse_Action := null;
         Result (262).RHSs (2).Post_Parse_Action := if_statement_2'Access;
         Result (262).RHSs (3).In_Parse_Action := null;
         Result (262).RHSs (3).Post_Parse_Action := if_statement_3'Access;
         Result (264).RHSs.Set_First_Last (0, 0);
         Result (264).RHSs (0).In_Parse_Action := null;
         Result (264).RHSs (0).Post_Parse_Action := case_statement_0'Access;
         Result (265).RHSs.Set_First_Last (0, 0);
         Result (265).RHSs (0).In_Parse_Action := null;
         Result (265).RHSs (0).Post_Parse_Action := case_statement_alternative_0'Access;
         Result (266).RHSs.Set_First_Last (0, 7);
         Result (266).RHSs (0).In_Parse_Action := loop_statement_0_check'Access;
         Result (266).RHSs (0).Post_Parse_Action := loop_statement_0'Access;
         Result (266).RHSs (1).In_Parse_Action := loop_statement_1_check'Access;
         Result (266).RHSs (1).Post_Parse_Action := loop_statement_1'Access;
         Result (266).RHSs (2).In_Parse_Action := loop_statement_2_check'Access;
         Result (266).RHSs (2).Post_Parse_Action := loop_statement_2'Access;
         Result (266).RHSs (3).In_Parse_Action := loop_statement_3_check'Access;
         Result (266).RHSs (3).Post_Parse_Action := loop_statement_3'Access;
         Result (266).RHSs (4).In_Parse_Action := loop_statement_4_check'Access;
         Result (266).RHSs (4).Post_Parse_Action := loop_statement_4'Access;
         Result (266).RHSs (5).In_Parse_Action := loop_statement_5_check'Access;
         Result (266).RHSs (5).Post_Parse_Action := loop_statement_5'Access;
         Result (266).RHSs (6).In_Parse_Action := loop_statement_6_check'Access;
         Result (266).RHSs (6).Post_Parse_Action := loop_statement_6'Access;
         Result (266).RHSs (7).In_Parse_Action := loop_statement_7_check'Access;
         Result (266).RHSs (7).Post_Parse_Action := loop_statement_7'Access;
         Result (267).RHSs.Set_First_Last (0, 5);
         Result (267).RHSs (0).In_Parse_Action := null;
         Result (267).RHSs (0).Post_Parse_Action := iteration_scheme_0'Access;
         Result (267).RHSs (1).In_Parse_Action := null;
         Result (267).RHSs (1).Post_Parse_Action := iteration_scheme_1'Access;
         Result (267).RHSs (2).In_Parse_Action := null;
         Result (267).RHSs (2).Post_Parse_Action := iteration_scheme_2'Access;
         Result (267).RHSs (3).In_Parse_Action := null;
         Result (267).RHSs (3).Post_Parse_Action := iteration_scheme_3'Access;
         Result (267).RHSs (4).In_Parse_Action := null;
         Result (267).RHSs (4).Post_Parse_Action := iteration_scheme_4'Access;
         Result (267).RHSs (5).In_Parse_Action := null;
         Result (267).RHSs (5).Post_Parse_Action := iteration_scheme_5'Access;
         Result (268).RHSs.Set_First_Last (0, 1);
         Result (268).RHSs (0).In_Parse_Action := null;
         Result (268).RHSs (0).Post_Parse_Action := chunk_specification_0'Access;
         Result (268).RHSs (1).In_Parse_Action := null;
         Result (268).RHSs (1).Post_Parse_Action := chunk_specification_1'Access;
         Result (274).RHSs.Set_First_Last (0, 11);
         Result (274).RHSs (0).In_Parse_Action := block_statement_0_check'Access;
         Result (274).RHSs (0).Post_Parse_Action := block_statement_0'Access;
         Result (274).RHSs (1).In_Parse_Action := block_statement_1_check'Access;
         Result (274).RHSs (1).Post_Parse_Action := block_statement_1'Access;
         Result (274).RHSs (2).In_Parse_Action := block_statement_2_check'Access;
         Result (274).RHSs (2).Post_Parse_Action := block_statement_2'Access;
         Result (274).RHSs (3).In_Parse_Action := block_statement_3_check'Access;
         Result (274).RHSs (3).Post_Parse_Action := block_statement_3'Access;
         Result (274).RHSs (4).In_Parse_Action := block_statement_4_check'Access;
         Result (274).RHSs (4).Post_Parse_Action := block_statement_4'Access;
         Result (274).RHSs (5).In_Parse_Action := block_statement_5_check'Access;
         Result (274).RHSs (5).Post_Parse_Action := block_statement_5'Access;
         Result (274).RHSs (6).In_Parse_Action := block_statement_6_check'Access;
         Result (274).RHSs (6).Post_Parse_Action := block_statement_6'Access;
         Result (274).RHSs (7).In_Parse_Action := block_statement_7_check'Access;
         Result (274).RHSs (7).Post_Parse_Action := block_statement_7'Access;
         Result (274).RHSs (8).In_Parse_Action := block_statement_8_check'Access;
         Result (274).RHSs (8).Post_Parse_Action := block_statement_8'Access;
         Result (274).RHSs (9).In_Parse_Action := block_statement_9_check'Access;
         Result (274).RHSs (9).Post_Parse_Action := block_statement_9'Access;
         Result (274).RHSs (10).In_Parse_Action := block_statement_10_check'Access;
         Result (274).RHSs (10).Post_Parse_Action := block_statement_10'Access;
         Result (274).RHSs (11).In_Parse_Action := block_statement_11_check'Access;
         Result (274).RHSs (11).Post_Parse_Action := block_statement_11'Access;
         Result (275).RHSs.Set_First_Last (0, 1);
         Result (275).RHSs (0).In_Parse_Action := null;
         Result (275).RHSs (0).Post_Parse_Action := null;
         Result (275).RHSs (1).In_Parse_Action := null;
         Result (275).RHSs (1).Post_Parse_Action := statement_AND_list_1'Access;
         Result (276).RHSs.Set_First_Last (0, 0);
         Result (276).RHSs (0).In_Parse_Action := null;
         Result (276).RHSs (0).Post_Parse_Action := parallel_block_statement_0'Access;
         Result (277).RHSs.Set_First_Last (0, 3);
         Result (277).RHSs (0).In_Parse_Action := null;
         Result (277).RHSs (0).Post_Parse_Action := exit_statement_0'Access;
         Result (277).RHSs (1).In_Parse_Action := null;
         Result (277).RHSs (1).Post_Parse_Action := exit_statement_1'Access;
         Result (277).RHSs (2).In_Parse_Action := null;
         Result (277).RHSs (2).Post_Parse_Action := exit_statement_2'Access;
         Result (277).RHSs (3).In_Parse_Action := null;
         Result (277).RHSs (3).Post_Parse_Action := exit_statement_3'Access;
         Result (278).RHSs.Set_First_Last (0, 0);
         Result (278).RHSs (0).In_Parse_Action := null;
         Result (278).RHSs (0).Post_Parse_Action := goto_statement_0'Access;
         Result (279).RHSs.Set_First_Last (0, 3);
         Result (279).RHSs (0).In_Parse_Action := null;
         Result (279).RHSs (0).Post_Parse_Action := subprogram_declaration_0'Access;
         Result (279).RHSs (1).In_Parse_Action := null;
         Result (279).RHSs (1).Post_Parse_Action := subprogram_declaration_1'Access;
         Result (279).RHSs (2).In_Parse_Action := null;
         Result (279).RHSs (2).Post_Parse_Action := subprogram_declaration_2'Access;
         Result (279).RHSs (3).In_Parse_Action := null;
         Result (279).RHSs (3).Post_Parse_Action := subprogram_declaration_3'Access;
         Result (280).RHSs.Set_First_Last (0, 1);
         Result (280).RHSs (0).In_Parse_Action := subprogram_specification_0_check'Access;
         Result (280).RHSs (0).Post_Parse_Action := null;
         Result (280).RHSs (1).In_Parse_Action := subprogram_specification_1_check'Access;
         Result (280).RHSs (1).Post_Parse_Action := null;
         Result (281).RHSs.Set_First_Last (0, 1);
         Result (281).RHSs (0).In_Parse_Action := procedure_specification_0_check'Access;
         Result (281).RHSs (0).Post_Parse_Action := procedure_specification_0'Access;
         Result (281).RHSs (1).In_Parse_Action := procedure_specification_1_check'Access;
         Result (281).RHSs (1).Post_Parse_Action := procedure_specification_1'Access;
         Result (282).RHSs.Set_First_Last (0, 0);
         Result (282).RHSs (0).In_Parse_Action := function_specification_0_check'Access;
         Result (282).RHSs (0).Post_Parse_Action := function_specification_0'Access;
         Result (283).RHSs.Set_First_Last (0, 2);
         Result (283).RHSs (0).In_Parse_Action := null;
         Result (283).RHSs (0).Post_Parse_Action := result_profile_0'Access;
         Result (283).RHSs (1).In_Parse_Action := null;
         Result (283).RHSs (1).Post_Parse_Action := result_profile_1'Access;
         Result (283).RHSs (2).In_Parse_Action := null;
         Result (283).RHSs (2).Post_Parse_Action := result_profile_2'Access;
         Result (284).RHSs.Set_First_Last (0, 1);
         Result (284).RHSs (0).In_Parse_Action := null;
         Result (284).RHSs (0).Post_Parse_Action := parameter_and_result_profile_0'Access;
         Result (284).RHSs (1).In_Parse_Action := null;
         Result (284).RHSs (1).Post_Parse_Action := null;
         Result (285).Optimized_List := True;
         Result (286).RHSs.Set_First_Last (0, 0);
         Result (286).RHSs (0).In_Parse_Action := null;
         Result (286).RHSs (0).Post_Parse_Action := formal_part_0'Access;
         Result (287).RHSs.Set_First_Last (0, 17);
         Result (287).RHSs (0).In_Parse_Action := null;
         Result (287).RHSs (0).Post_Parse_Action := parameter_specification_0'Access;
         Result (287).RHSs (1).In_Parse_Action := null;
         Result (287).RHSs (1).Post_Parse_Action := parameter_specification_1'Access;
         Result (287).RHSs (2).In_Parse_Action := null;
         Result (287).RHSs (2).Post_Parse_Action := parameter_specification_2'Access;
         Result (287).RHSs (3).In_Parse_Action := null;
         Result (287).RHSs (3).Post_Parse_Action := parameter_specification_3'Access;
         Result (287).RHSs (4).In_Parse_Action := null;
         Result (287).RHSs (4).Post_Parse_Action := parameter_specification_4'Access;
         Result (287).RHSs (5).In_Parse_Action := null;
         Result (287).RHSs (5).Post_Parse_Action := parameter_specification_5'Access;
         Result (287).RHSs (6).In_Parse_Action := null;
         Result (287).RHSs (6).Post_Parse_Action := parameter_specification_6'Access;
         Result (287).RHSs (7).In_Parse_Action := null;
         Result (287).RHSs (7).Post_Parse_Action := parameter_specification_7'Access;
         Result (287).RHSs (8).In_Parse_Action := null;
         Result (287).RHSs (8).Post_Parse_Action := parameter_specification_8'Access;
         Result (287).RHSs (9).In_Parse_Action := null;
         Result (287).RHSs (9).Post_Parse_Action := parameter_specification_9'Access;
         Result (287).RHSs (10).In_Parse_Action := null;
         Result (287).RHSs (10).Post_Parse_Action := parameter_specification_10'Access;
         Result (287).RHSs (11).In_Parse_Action := null;
         Result (287).RHSs (11).Post_Parse_Action := parameter_specification_11'Access;
         Result (287).RHSs (12).In_Parse_Action := null;
         Result (287).RHSs (12).Post_Parse_Action := parameter_specification_12'Access;
         Result (287).RHSs (13).In_Parse_Action := null;
         Result (287).RHSs (13).Post_Parse_Action := parameter_specification_13'Access;
         Result (287).RHSs (14).In_Parse_Action := null;
         Result (287).RHSs (14).Post_Parse_Action := parameter_specification_14'Access;
         Result (287).RHSs (15).In_Parse_Action := null;
         Result (287).RHSs (15).Post_Parse_Action := parameter_specification_15'Access;
         Result (287).RHSs (16).In_Parse_Action := null;
         Result (287).RHSs (16).Post_Parse_Action := parameter_specification_16'Access;
         Result (287).RHSs (17).In_Parse_Action := null;
         Result (287).RHSs (17).Post_Parse_Action := parameter_specification_17'Access;
         Result (293).RHSs.Set_First_Last (0, 15);
         Result (293).RHSs (0).In_Parse_Action := subprogram_body_0_check'Access;
         Result (293).RHSs (0).Post_Parse_Action := subprogram_body_0'Access;
         Result (293).RHSs (1).In_Parse_Action := subprogram_body_1_check'Access;
         Result (293).RHSs (1).Post_Parse_Action := subprogram_body_1'Access;
         Result (293).RHSs (2).In_Parse_Action := subprogram_body_2_check'Access;
         Result (293).RHSs (2).Post_Parse_Action := subprogram_body_2'Access;
         Result (293).RHSs (3).In_Parse_Action := subprogram_body_3_check'Access;
         Result (293).RHSs (3).Post_Parse_Action := subprogram_body_3'Access;
         Result (293).RHSs (4).In_Parse_Action := subprogram_body_4_check'Access;
         Result (293).RHSs (4).Post_Parse_Action := subprogram_body_4'Access;
         Result (293).RHSs (5).In_Parse_Action := subprogram_body_5_check'Access;
         Result (293).RHSs (5).Post_Parse_Action := subprogram_body_5'Access;
         Result (293).RHSs (6).In_Parse_Action := subprogram_body_6_check'Access;
         Result (293).RHSs (6).Post_Parse_Action := subprogram_body_6'Access;
         Result (293).RHSs (7).In_Parse_Action := subprogram_body_7_check'Access;
         Result (293).RHSs (7).Post_Parse_Action := subprogram_body_7'Access;
         Result (293).RHSs (8).In_Parse_Action := subprogram_body_8_check'Access;
         Result (293).RHSs (8).Post_Parse_Action := subprogram_body_8'Access;
         Result (293).RHSs (9).In_Parse_Action := subprogram_body_9_check'Access;
         Result (293).RHSs (9).Post_Parse_Action := subprogram_body_9'Access;
         Result (293).RHSs (10).In_Parse_Action := subprogram_body_10_check'Access;
         Result (293).RHSs (10).Post_Parse_Action := subprogram_body_10'Access;
         Result (293).RHSs (11).In_Parse_Action := subprogram_body_11_check'Access;
         Result (293).RHSs (11).Post_Parse_Action := subprogram_body_11'Access;
         Result (293).RHSs (12).In_Parse_Action := subprogram_body_12_check'Access;
         Result (293).RHSs (12).Post_Parse_Action := subprogram_body_12'Access;
         Result (293).RHSs (13).In_Parse_Action := subprogram_body_13_check'Access;
         Result (293).RHSs (13).Post_Parse_Action := subprogram_body_13'Access;
         Result (293).RHSs (14).In_Parse_Action := subprogram_body_14_check'Access;
         Result (293).RHSs (14).Post_Parse_Action := subprogram_body_14'Access;
         Result (293).RHSs (15).In_Parse_Action := subprogram_body_15_check'Access;
         Result (293).RHSs (15).Post_Parse_Action := subprogram_body_15'Access;
         Result (294).RHSs.Set_First_Last (0, 0);
         Result (294).RHSs (0).In_Parse_Action := null;
         Result (294).RHSs (0).Post_Parse_Action := procedure_call_statement_0'Access;
         Result (295).RHSs.Set_First_Last (0, 0);
         Result (295).RHSs (0).In_Parse_Action := null;
         Result (295).RHSs (0).Post_Parse_Action := function_call_0'Access;
         Result (297).RHSs.Set_First_Last (0, 3);
         Result (297).RHSs (0).In_Parse_Action := null;
         Result (297).RHSs (0).Post_Parse_Action := actual_parameter_part_0'Access;
         Result (297).RHSs (1).In_Parse_Action := null;
         Result (297).RHSs (1).Post_Parse_Action := actual_parameter_part_1'Access;
         Result (297).RHSs (2).In_Parse_Action := null;
         Result (297).RHSs (2).Post_Parse_Action := actual_parameter_part_2'Access;
         Result (297).RHSs (3).In_Parse_Action := null;
         Result (297).RHSs (3).Post_Parse_Action := actual_parameter_part_3'Access;
         Result (298).RHSs.Set_First_Last (0, 1);
         Result (298).RHSs (0).In_Parse_Action := null;
         Result (298).RHSs (0).Post_Parse_Action := assoc_expression_0'Access;
         Result (298).RHSs (1).In_Parse_Action := null;
         Result (298).RHSs (1).Post_Parse_Action := null;
         Result (299).RHSs.Set_First_Last (0, 2);
         Result (299).RHSs (0).In_Parse_Action := null;
         Result (299).RHSs (0).Post_Parse_Action := parameter_association_0'Access;
         Result (299).RHSs (1).In_Parse_Action := null;
         Result (299).RHSs (1).Post_Parse_Action := parameter_association_1'Access;
         Result (299).RHSs (2).In_Parse_Action := null;
         Result (299).RHSs (2).Post_Parse_Action := null;
         Result (300).RHSs.Set_First_Last (0, 1);
         Result (300).RHSs (0).In_Parse_Action := null;
         Result (300).RHSs (0).Post_Parse_Action := simple_return_statement_0'Access;
         Result (300).RHSs (1).In_Parse_Action := null;
         Result (300).RHSs (1).Post_Parse_Action := simple_return_statement_1'Access;
         Result (301).RHSs.Set_First_Last (0, 7);
         Result (301).RHSs (0).In_Parse_Action := null;
         Result (301).RHSs (0).Post_Parse_Action := extended_return_object_declaration_0'Access;
         Result (301).RHSs (1).In_Parse_Action := null;
         Result (301).RHSs (1).Post_Parse_Action := extended_return_object_declaration_1'Access;
         Result (301).RHSs (2).In_Parse_Action := null;
         Result (301).RHSs (2).Post_Parse_Action := extended_return_object_declaration_2'Access;
         Result (301).RHSs (3).In_Parse_Action := null;
         Result (301).RHSs (3).Post_Parse_Action := extended_return_object_declaration_3'Access;
         Result (301).RHSs (4).In_Parse_Action := null;
         Result (301).RHSs (4).Post_Parse_Action := extended_return_object_declaration_4'Access;
         Result (301).RHSs (5).In_Parse_Action := null;
         Result (301).RHSs (5).Post_Parse_Action := extended_return_object_declaration_5'Access;
         Result (301).RHSs (6).In_Parse_Action := null;
         Result (301).RHSs (6).Post_Parse_Action := extended_return_object_declaration_6'Access;
         Result (301).RHSs (7).In_Parse_Action := null;
         Result (301).RHSs (7).Post_Parse_Action := extended_return_object_declaration_7'Access;
         Result (302).RHSs.Set_First_Last (0, 1);
         Result (302).RHSs (0).In_Parse_Action := null;
         Result (302).RHSs (0).Post_Parse_Action := extended_return_statement_0'Access;
         Result (302).RHSs (1).In_Parse_Action := null;
         Result (302).RHSs (1).Post_Parse_Action := extended_return_statement_1'Access;
         Result (304).RHSs.Set_First_Last (0, 3);
         Result (304).RHSs (0).In_Parse_Action := null;
         Result (304).RHSs (0).Post_Parse_Action := null_procedure_declaration_0'Access;
         Result (304).RHSs (1).In_Parse_Action := null;
         Result (304).RHSs (1).Post_Parse_Action := null_procedure_declaration_1'Access;
         Result (304).RHSs (2).In_Parse_Action := null;
         Result (304).RHSs (2).Post_Parse_Action := null_procedure_declaration_2'Access;
         Result (304).RHSs (3).In_Parse_Action := null;
         Result (304).RHSs (3).Post_Parse_Action := null_procedure_declaration_3'Access;
         Result (305).RHSs.Set_First_Last (0, 3);
         Result (305).RHSs (0).In_Parse_Action := null;
         Result (305).RHSs (0).Post_Parse_Action := expression_function_declaration_0'Access;
         Result (305).RHSs (1).In_Parse_Action := null;
         Result (305).RHSs (1).Post_Parse_Action := expression_function_declaration_1'Access;
         Result (305).RHSs (2).In_Parse_Action := null;
         Result (305).RHSs (2).Post_Parse_Action := expression_function_declaration_2'Access;
         Result (305).RHSs (3).In_Parse_Action := null;
         Result (305).RHSs (3).Post_Parse_Action := expression_function_declaration_3'Access;
         Result (306).RHSs.Set_First_Last (0, 0);
         Result (306).RHSs (0).In_Parse_Action := null;
         Result (306).RHSs (0).Post_Parse_Action := package_declaration_0'Access;
         Result (308).RHSs.Set_First_Last (0, 23);
         Result (308).RHSs (0).In_Parse_Action := package_specification_0_check'Access;
         Result (308).RHSs (0).Post_Parse_Action := package_specification_0'Access;
         Result (308).RHSs (1).In_Parse_Action := package_specification_1_check'Access;
         Result (308).RHSs (1).Post_Parse_Action := package_specification_1'Access;
         Result (308).RHSs (2).In_Parse_Action := package_specification_2_check'Access;
         Result (308).RHSs (2).Post_Parse_Action := package_specification_2'Access;
         Result (308).RHSs (3).In_Parse_Action := package_specification_3_check'Access;
         Result (308).RHSs (3).Post_Parse_Action := package_specification_3'Access;
         Result (308).RHSs (4).In_Parse_Action := package_specification_4_check'Access;
         Result (308).RHSs (4).Post_Parse_Action := package_specification_4'Access;
         Result (308).RHSs (5).In_Parse_Action := package_specification_5_check'Access;
         Result (308).RHSs (5).Post_Parse_Action := package_specification_5'Access;
         Result (308).RHSs (6).In_Parse_Action := package_specification_6_check'Access;
         Result (308).RHSs (6).Post_Parse_Action := package_specification_6'Access;
         Result (308).RHSs (7).In_Parse_Action := package_specification_7_check'Access;
         Result (308).RHSs (7).Post_Parse_Action := package_specification_7'Access;
         Result (308).RHSs (8).In_Parse_Action := package_specification_8_check'Access;
         Result (308).RHSs (8).Post_Parse_Action := package_specification_8'Access;
         Result (308).RHSs (9).In_Parse_Action := package_specification_9_check'Access;
         Result (308).RHSs (9).Post_Parse_Action := package_specification_9'Access;
         Result (308).RHSs (10).In_Parse_Action := package_specification_10_check'Access;
         Result (308).RHSs (10).Post_Parse_Action := package_specification_10'Access;
         Result (308).RHSs (11).In_Parse_Action := package_specification_11_check'Access;
         Result (308).RHSs (11).Post_Parse_Action := package_specification_11'Access;
         Result (308).RHSs (12).In_Parse_Action := package_specification_12_check'Access;
         Result (308).RHSs (12).Post_Parse_Action := package_specification_12'Access;
         Result (308).RHSs (13).In_Parse_Action := package_specification_13_check'Access;
         Result (308).RHSs (13).Post_Parse_Action := package_specification_13'Access;
         Result (308).RHSs (14).In_Parse_Action := package_specification_14_check'Access;
         Result (308).RHSs (14).Post_Parse_Action := package_specification_14'Access;
         Result (308).RHSs (15).In_Parse_Action := package_specification_15_check'Access;
         Result (308).RHSs (15).Post_Parse_Action := package_specification_15'Access;
         Result (308).RHSs (16).In_Parse_Action := package_specification_16_check'Access;
         Result (308).RHSs (16).Post_Parse_Action := package_specification_16'Access;
         Result (308).RHSs (17).In_Parse_Action := package_specification_17_check'Access;
         Result (308).RHSs (17).Post_Parse_Action := package_specification_17'Access;
         Result (308).RHSs (18).In_Parse_Action := package_specification_18_check'Access;
         Result (308).RHSs (18).Post_Parse_Action := package_specification_18'Access;
         Result (308).RHSs (19).In_Parse_Action := package_specification_19_check'Access;
         Result (308).RHSs (19).Post_Parse_Action := package_specification_19'Access;
         Result (308).RHSs (20).In_Parse_Action := package_specification_20_check'Access;
         Result (308).RHSs (20).Post_Parse_Action := package_specification_20'Access;
         Result (308).RHSs (21).In_Parse_Action := package_specification_21_check'Access;
         Result (308).RHSs (21).Post_Parse_Action := package_specification_21'Access;
         Result (308).RHSs (22).In_Parse_Action := package_specification_22_check'Access;
         Result (308).RHSs (22).Post_Parse_Action := package_specification_22'Access;
         Result (308).RHSs (23).In_Parse_Action := package_specification_23_check'Access;
         Result (308).RHSs (23).Post_Parse_Action := package_specification_23'Access;
         Result (309).RHSs.Set_First_Last (0, 15);
         Result (309).RHSs (0).In_Parse_Action := package_body_0_check'Access;
         Result (309).RHSs (0).Post_Parse_Action := package_body_0'Access;
         Result (309).RHSs (1).In_Parse_Action := package_body_1_check'Access;
         Result (309).RHSs (1).Post_Parse_Action := package_body_1'Access;
         Result (309).RHSs (2).In_Parse_Action := package_body_2_check'Access;
         Result (309).RHSs (2).Post_Parse_Action := package_body_2'Access;
         Result (309).RHSs (3).In_Parse_Action := package_body_3_check'Access;
         Result (309).RHSs (3).Post_Parse_Action := package_body_3'Access;
         Result (309).RHSs (4).In_Parse_Action := package_body_4_check'Access;
         Result (309).RHSs (4).Post_Parse_Action := package_body_4'Access;
         Result (309).RHSs (5).In_Parse_Action := package_body_5_check'Access;
         Result (309).RHSs (5).Post_Parse_Action := package_body_5'Access;
         Result (309).RHSs (6).In_Parse_Action := package_body_6_check'Access;
         Result (309).RHSs (6).Post_Parse_Action := package_body_6'Access;
         Result (309).RHSs (7).In_Parse_Action := package_body_7_check'Access;
         Result (309).RHSs (7).Post_Parse_Action := package_body_7'Access;
         Result (309).RHSs (8).In_Parse_Action := package_body_8_check'Access;
         Result (309).RHSs (8).Post_Parse_Action := package_body_8'Access;
         Result (309).RHSs (9).In_Parse_Action := package_body_9_check'Access;
         Result (309).RHSs (9).Post_Parse_Action := package_body_9'Access;
         Result (309).RHSs (10).In_Parse_Action := package_body_10_check'Access;
         Result (309).RHSs (10).Post_Parse_Action := package_body_10'Access;
         Result (309).RHSs (11).In_Parse_Action := package_body_11_check'Access;
         Result (309).RHSs (11).Post_Parse_Action := package_body_11'Access;
         Result (309).RHSs (12).In_Parse_Action := package_body_12_check'Access;
         Result (309).RHSs (12).Post_Parse_Action := package_body_12'Access;
         Result (309).RHSs (13).In_Parse_Action := package_body_13_check'Access;
         Result (309).RHSs (13).Post_Parse_Action := package_body_13'Access;
         Result (309).RHSs (14).In_Parse_Action := package_body_14_check'Access;
         Result (309).RHSs (14).Post_Parse_Action := package_body_14'Access;
         Result (309).RHSs (15).In_Parse_Action := package_body_15_check'Access;
         Result (309).RHSs (15).Post_Parse_Action := package_body_15'Access;
         Result (310).RHSs.Set_First_Last (0, 23);
         Result (310).RHSs (0).In_Parse_Action := null;
         Result (310).RHSs (0).Post_Parse_Action := private_type_declaration_0'Access;
         Result (310).RHSs (1).In_Parse_Action := null;
         Result (310).RHSs (1).Post_Parse_Action := private_type_declaration_1'Access;
         Result (310).RHSs (2).In_Parse_Action := null;
         Result (310).RHSs (2).Post_Parse_Action := private_type_declaration_2'Access;
         Result (310).RHSs (3).In_Parse_Action := null;
         Result (310).RHSs (3).Post_Parse_Action := private_type_declaration_3'Access;
         Result (310).RHSs (4).In_Parse_Action := null;
         Result (310).RHSs (4).Post_Parse_Action := private_type_declaration_4'Access;
         Result (310).RHSs (5).In_Parse_Action := null;
         Result (310).RHSs (5).Post_Parse_Action := private_type_declaration_5'Access;
         Result (310).RHSs (6).In_Parse_Action := null;
         Result (310).RHSs (6).Post_Parse_Action := private_type_declaration_6'Access;
         Result (310).RHSs (7).In_Parse_Action := null;
         Result (310).RHSs (7).Post_Parse_Action := private_type_declaration_7'Access;
         Result (310).RHSs (8).In_Parse_Action := null;
         Result (310).RHSs (8).Post_Parse_Action := private_type_declaration_8'Access;
         Result (310).RHSs (9).In_Parse_Action := null;
         Result (310).RHSs (9).Post_Parse_Action := private_type_declaration_9'Access;
         Result (310).RHSs (10).In_Parse_Action := null;
         Result (310).RHSs (10).Post_Parse_Action := private_type_declaration_10'Access;
         Result (310).RHSs (11).In_Parse_Action := null;
         Result (310).RHSs (11).Post_Parse_Action := private_type_declaration_11'Access;
         Result (310).RHSs (12).In_Parse_Action := null;
         Result (310).RHSs (12).Post_Parse_Action := private_type_declaration_12'Access;
         Result (310).RHSs (13).In_Parse_Action := null;
         Result (310).RHSs (13).Post_Parse_Action := private_type_declaration_13'Access;
         Result (310).RHSs (14).In_Parse_Action := null;
         Result (310).RHSs (14).Post_Parse_Action := private_type_declaration_14'Access;
         Result (310).RHSs (15).In_Parse_Action := null;
         Result (310).RHSs (15).Post_Parse_Action := private_type_declaration_15'Access;
         Result (310).RHSs (16).In_Parse_Action := null;
         Result (310).RHSs (16).Post_Parse_Action := private_type_declaration_16'Access;
         Result (310).RHSs (17).In_Parse_Action := null;
         Result (310).RHSs (17).Post_Parse_Action := private_type_declaration_17'Access;
         Result (310).RHSs (18).In_Parse_Action := null;
         Result (310).RHSs (18).Post_Parse_Action := private_type_declaration_18'Access;
         Result (310).RHSs (19).In_Parse_Action := null;
         Result (310).RHSs (19).Post_Parse_Action := private_type_declaration_19'Access;
         Result (310).RHSs (20).In_Parse_Action := null;
         Result (310).RHSs (20).Post_Parse_Action := private_type_declaration_20'Access;
         Result (310).RHSs (21).In_Parse_Action := null;
         Result (310).RHSs (21).Post_Parse_Action := private_type_declaration_21'Access;
         Result (310).RHSs (22).In_Parse_Action := null;
         Result (310).RHSs (22).Post_Parse_Action := private_type_declaration_22'Access;
         Result (310).RHSs (23).In_Parse_Action := null;
         Result (310).RHSs (23).Post_Parse_Action := private_type_declaration_23'Access;
         Result (311).RHSs.Set_First_Last (0, 95);
         Result (311).RHSs (0).In_Parse_Action := null;
         Result (311).RHSs (0).Post_Parse_Action := private_extension_declaration_0'Access;
         Result (311).RHSs (1).In_Parse_Action := null;
         Result (311).RHSs (1).Post_Parse_Action := private_extension_declaration_1'Access;
         Result (311).RHSs (2).In_Parse_Action := null;
         Result (311).RHSs (2).Post_Parse_Action := private_extension_declaration_2'Access;
         Result (311).RHSs (3).In_Parse_Action := null;
         Result (311).RHSs (3).Post_Parse_Action := private_extension_declaration_3'Access;
         Result (311).RHSs (4).In_Parse_Action := null;
         Result (311).RHSs (4).Post_Parse_Action := private_extension_declaration_4'Access;
         Result (311).RHSs (5).In_Parse_Action := null;
         Result (311).RHSs (5).Post_Parse_Action := private_extension_declaration_5'Access;
         Result (311).RHSs (6).In_Parse_Action := null;
         Result (311).RHSs (6).Post_Parse_Action := private_extension_declaration_6'Access;
         Result (311).RHSs (7).In_Parse_Action := null;
         Result (311).RHSs (7).Post_Parse_Action := private_extension_declaration_7'Access;
         Result (311).RHSs (8).In_Parse_Action := null;
         Result (311).RHSs (8).Post_Parse_Action := private_extension_declaration_8'Access;
         Result (311).RHSs (9).In_Parse_Action := null;
         Result (311).RHSs (9).Post_Parse_Action := private_extension_declaration_9'Access;
         Result (311).RHSs (10).In_Parse_Action := null;
         Result (311).RHSs (10).Post_Parse_Action := private_extension_declaration_10'Access;
         Result (311).RHSs (11).In_Parse_Action := null;
         Result (311).RHSs (11).Post_Parse_Action := private_extension_declaration_11'Access;
         Result (311).RHSs (12).In_Parse_Action := null;
         Result (311).RHSs (12).Post_Parse_Action := private_extension_declaration_12'Access;
         Result (311).RHSs (13).In_Parse_Action := null;
         Result (311).RHSs (13).Post_Parse_Action := private_extension_declaration_13'Access;
         Result (311).RHSs (14).In_Parse_Action := null;
         Result (311).RHSs (14).Post_Parse_Action := private_extension_declaration_14'Access;
         Result (311).RHSs (15).In_Parse_Action := null;
         Result (311).RHSs (15).Post_Parse_Action := private_extension_declaration_15'Access;
         Result (311).RHSs (16).In_Parse_Action := null;
         Result (311).RHSs (16).Post_Parse_Action := private_extension_declaration_16'Access;
         Result (311).RHSs (17).In_Parse_Action := null;
         Result (311).RHSs (17).Post_Parse_Action := private_extension_declaration_17'Access;
         Result (311).RHSs (18).In_Parse_Action := null;
         Result (311).RHSs (18).Post_Parse_Action := private_extension_declaration_18'Access;
         Result (311).RHSs (19).In_Parse_Action := null;
         Result (311).RHSs (19).Post_Parse_Action := private_extension_declaration_19'Access;
         Result (311).RHSs (20).In_Parse_Action := null;
         Result (311).RHSs (20).Post_Parse_Action := private_extension_declaration_20'Access;
         Result (311).RHSs (21).In_Parse_Action := null;
         Result (311).RHSs (21).Post_Parse_Action := private_extension_declaration_21'Access;
         Result (311).RHSs (22).In_Parse_Action := null;
         Result (311).RHSs (22).Post_Parse_Action := private_extension_declaration_22'Access;
         Result (311).RHSs (23).In_Parse_Action := null;
         Result (311).RHSs (23).Post_Parse_Action := private_extension_declaration_23'Access;
         Result (311).RHSs (24).In_Parse_Action := null;
         Result (311).RHSs (24).Post_Parse_Action := private_extension_declaration_24'Access;
         Result (311).RHSs (25).In_Parse_Action := null;
         Result (311).RHSs (25).Post_Parse_Action := private_extension_declaration_25'Access;
         Result (311).RHSs (26).In_Parse_Action := null;
         Result (311).RHSs (26).Post_Parse_Action := private_extension_declaration_26'Access;
         Result (311).RHSs (27).In_Parse_Action := null;
         Result (311).RHSs (27).Post_Parse_Action := private_extension_declaration_27'Access;
         Result (311).RHSs (28).In_Parse_Action := null;
         Result (311).RHSs (28).Post_Parse_Action := private_extension_declaration_28'Access;
         Result (311).RHSs (29).In_Parse_Action := null;
         Result (311).RHSs (29).Post_Parse_Action := private_extension_declaration_29'Access;
         Result (311).RHSs (30).In_Parse_Action := null;
         Result (311).RHSs (30).Post_Parse_Action := private_extension_declaration_30'Access;
         Result (311).RHSs (31).In_Parse_Action := null;
         Result (311).RHSs (31).Post_Parse_Action := private_extension_declaration_31'Access;
         Result (311).RHSs (32).In_Parse_Action := null;
         Result (311).RHSs (32).Post_Parse_Action := private_extension_declaration_32'Access;
         Result (311).RHSs (33).In_Parse_Action := null;
         Result (311).RHSs (33).Post_Parse_Action := private_extension_declaration_33'Access;
         Result (311).RHSs (34).In_Parse_Action := null;
         Result (311).RHSs (34).Post_Parse_Action := private_extension_declaration_34'Access;
         Result (311).RHSs (35).In_Parse_Action := null;
         Result (311).RHSs (35).Post_Parse_Action := private_extension_declaration_35'Access;
         Result (311).RHSs (36).In_Parse_Action := null;
         Result (311).RHSs (36).Post_Parse_Action := private_extension_declaration_36'Access;
         Result (311).RHSs (37).In_Parse_Action := null;
         Result (311).RHSs (37).Post_Parse_Action := private_extension_declaration_37'Access;
         Result (311).RHSs (38).In_Parse_Action := null;
         Result (311).RHSs (38).Post_Parse_Action := private_extension_declaration_38'Access;
         Result (311).RHSs (39).In_Parse_Action := null;
         Result (311).RHSs (39).Post_Parse_Action := private_extension_declaration_39'Access;
         Result (311).RHSs (40).In_Parse_Action := null;
         Result (311).RHSs (40).Post_Parse_Action := private_extension_declaration_40'Access;
         Result (311).RHSs (41).In_Parse_Action := null;
         Result (311).RHSs (41).Post_Parse_Action := private_extension_declaration_41'Access;
         Result (311).RHSs (42).In_Parse_Action := null;
         Result (311).RHSs (42).Post_Parse_Action := private_extension_declaration_42'Access;
         Result (311).RHSs (43).In_Parse_Action := null;
         Result (311).RHSs (43).Post_Parse_Action := private_extension_declaration_43'Access;
         Result (311).RHSs (44).In_Parse_Action := null;
         Result (311).RHSs (44).Post_Parse_Action := private_extension_declaration_44'Access;
         Result (311).RHSs (45).In_Parse_Action := null;
         Result (311).RHSs (45).Post_Parse_Action := private_extension_declaration_45'Access;
         Result (311).RHSs (46).In_Parse_Action := null;
         Result (311).RHSs (46).Post_Parse_Action := private_extension_declaration_46'Access;
         Result (311).RHSs (47).In_Parse_Action := null;
         Result (311).RHSs (47).Post_Parse_Action := private_extension_declaration_47'Access;
         Result (311).RHSs (48).In_Parse_Action := null;
         Result (311).RHSs (48).Post_Parse_Action := private_extension_declaration_48'Access;
         Result (311).RHSs (49).In_Parse_Action := null;
         Result (311).RHSs (49).Post_Parse_Action := private_extension_declaration_49'Access;
         Result (311).RHSs (50).In_Parse_Action := null;
         Result (311).RHSs (50).Post_Parse_Action := private_extension_declaration_50'Access;
         Result (311).RHSs (51).In_Parse_Action := null;
         Result (311).RHSs (51).Post_Parse_Action := private_extension_declaration_51'Access;
         Result (311).RHSs (52).In_Parse_Action := null;
         Result (311).RHSs (52).Post_Parse_Action := private_extension_declaration_52'Access;
         Result (311).RHSs (53).In_Parse_Action := null;
         Result (311).RHSs (53).Post_Parse_Action := private_extension_declaration_53'Access;
         Result (311).RHSs (54).In_Parse_Action := null;
         Result (311).RHSs (54).Post_Parse_Action := private_extension_declaration_54'Access;
         Result (311).RHSs (55).In_Parse_Action := null;
         Result (311).RHSs (55).Post_Parse_Action := private_extension_declaration_55'Access;
         Result (311).RHSs (56).In_Parse_Action := null;
         Result (311).RHSs (56).Post_Parse_Action := private_extension_declaration_56'Access;
         Result (311).RHSs (57).In_Parse_Action := null;
         Result (311).RHSs (57).Post_Parse_Action := private_extension_declaration_57'Access;
         Result (311).RHSs (58).In_Parse_Action := null;
         Result (311).RHSs (58).Post_Parse_Action := private_extension_declaration_58'Access;
         Result (311).RHSs (59).In_Parse_Action := null;
         Result (311).RHSs (59).Post_Parse_Action := private_extension_declaration_59'Access;
         Result (311).RHSs (60).In_Parse_Action := null;
         Result (311).RHSs (60).Post_Parse_Action := private_extension_declaration_60'Access;
         Result (311).RHSs (61).In_Parse_Action := null;
         Result (311).RHSs (61).Post_Parse_Action := private_extension_declaration_61'Access;
         Result (311).RHSs (62).In_Parse_Action := null;
         Result (311).RHSs (62).Post_Parse_Action := private_extension_declaration_62'Access;
         Result (311).RHSs (63).In_Parse_Action := null;
         Result (311).RHSs (63).Post_Parse_Action := private_extension_declaration_63'Access;
         Result (311).RHSs (64).In_Parse_Action := null;
         Result (311).RHSs (64).Post_Parse_Action := private_extension_declaration_64'Access;
         Result (311).RHSs (65).In_Parse_Action := null;
         Result (311).RHSs (65).Post_Parse_Action := private_extension_declaration_65'Access;
         Result (311).RHSs (66).In_Parse_Action := null;
         Result (311).RHSs (66).Post_Parse_Action := private_extension_declaration_66'Access;
         Result (311).RHSs (67).In_Parse_Action := null;
         Result (311).RHSs (67).Post_Parse_Action := private_extension_declaration_67'Access;
         Result (311).RHSs (68).In_Parse_Action := null;
         Result (311).RHSs (68).Post_Parse_Action := private_extension_declaration_68'Access;
         Result (311).RHSs (69).In_Parse_Action := null;
         Result (311).RHSs (69).Post_Parse_Action := private_extension_declaration_69'Access;
         Result (311).RHSs (70).In_Parse_Action := null;
         Result (311).RHSs (70).Post_Parse_Action := private_extension_declaration_70'Access;
         Result (311).RHSs (71).In_Parse_Action := null;
         Result (311).RHSs (71).Post_Parse_Action := private_extension_declaration_71'Access;
         Result (311).RHSs (72).In_Parse_Action := null;
         Result (311).RHSs (72).Post_Parse_Action := private_extension_declaration_72'Access;
         Result (311).RHSs (73).In_Parse_Action := null;
         Result (311).RHSs (73).Post_Parse_Action := private_extension_declaration_73'Access;
         Result (311).RHSs (74).In_Parse_Action := null;
         Result (311).RHSs (74).Post_Parse_Action := private_extension_declaration_74'Access;
         Result (311).RHSs (75).In_Parse_Action := null;
         Result (311).RHSs (75).Post_Parse_Action := private_extension_declaration_75'Access;
         Result (311).RHSs (76).In_Parse_Action := null;
         Result (311).RHSs (76).Post_Parse_Action := private_extension_declaration_76'Access;
         Result (311).RHSs (77).In_Parse_Action := null;
         Result (311).RHSs (77).Post_Parse_Action := private_extension_declaration_77'Access;
         Result (311).RHSs (78).In_Parse_Action := null;
         Result (311).RHSs (78).Post_Parse_Action := private_extension_declaration_78'Access;
         Result (311).RHSs (79).In_Parse_Action := null;
         Result (311).RHSs (79).Post_Parse_Action := private_extension_declaration_79'Access;
         Result (311).RHSs (80).In_Parse_Action := null;
         Result (311).RHSs (80).Post_Parse_Action := private_extension_declaration_80'Access;
         Result (311).RHSs (81).In_Parse_Action := null;
         Result (311).RHSs (81).Post_Parse_Action := private_extension_declaration_81'Access;
         Result (311).RHSs (82).In_Parse_Action := null;
         Result (311).RHSs (82).Post_Parse_Action := private_extension_declaration_82'Access;
         Result (311).RHSs (83).In_Parse_Action := null;
         Result (311).RHSs (83).Post_Parse_Action := private_extension_declaration_83'Access;
         Result (311).RHSs (84).In_Parse_Action := null;
         Result (311).RHSs (84).Post_Parse_Action := private_extension_declaration_84'Access;
         Result (311).RHSs (85).In_Parse_Action := null;
         Result (311).RHSs (85).Post_Parse_Action := private_extension_declaration_85'Access;
         Result (311).RHSs (86).In_Parse_Action := null;
         Result (311).RHSs (86).Post_Parse_Action := private_extension_declaration_86'Access;
         Result (311).RHSs (87).In_Parse_Action := null;
         Result (311).RHSs (87).Post_Parse_Action := private_extension_declaration_87'Access;
         Result (311).RHSs (88).In_Parse_Action := null;
         Result (311).RHSs (88).Post_Parse_Action := private_extension_declaration_88'Access;
         Result (311).RHSs (89).In_Parse_Action := null;
         Result (311).RHSs (89).Post_Parse_Action := private_extension_declaration_89'Access;
         Result (311).RHSs (90).In_Parse_Action := null;
         Result (311).RHSs (90).Post_Parse_Action := private_extension_declaration_90'Access;
         Result (311).RHSs (91).In_Parse_Action := null;
         Result (311).RHSs (91).Post_Parse_Action := private_extension_declaration_91'Access;
         Result (311).RHSs (92).In_Parse_Action := null;
         Result (311).RHSs (92).Post_Parse_Action := private_extension_declaration_92'Access;
         Result (311).RHSs (93).In_Parse_Action := null;
         Result (311).RHSs (93).Post_Parse_Action := private_extension_declaration_93'Access;
         Result (311).RHSs (94).In_Parse_Action := null;
         Result (311).RHSs (94).Post_Parse_Action := private_extension_declaration_94'Access;
         Result (311).RHSs (95).In_Parse_Action := null;
         Result (311).RHSs (95).Post_Parse_Action := private_extension_declaration_95'Access;
         Result (312).RHSs.Set_First_Last (0, 1);
         Result (312).RHSs (0).In_Parse_Action := null;
         Result (312).RHSs (0).Post_Parse_Action := overriding_indicator_0'Access;
         Result (312).RHSs (1).In_Parse_Action := null;
         Result (312).RHSs (1).Post_Parse_Action := overriding_indicator_1'Access;
         Result (314).Optimized_List := True;
         Result (315).RHSs.Set_First_Last (0, 0);
         Result (315).RHSs (0).In_Parse_Action := null;
         Result (315).RHSs (0).Post_Parse_Action := use_package_clause_0'Access;
         Result (316).RHSs.Set_First_Last (0, 1);
         Result (316).RHSs (0).In_Parse_Action := null;
         Result (316).RHSs (0).Post_Parse_Action := use_type_clause_0'Access;
         Result (316).RHSs (1).In_Parse_Action := null;
         Result (316).RHSs (1).Post_Parse_Action := use_type_clause_1'Access;
         Result (318).RHSs.Set_First_Last (0, 7);
         Result (318).RHSs (0).In_Parse_Action := null;
         Result (318).RHSs (0).Post_Parse_Action := object_renaming_declaration_0'Access;
         Result (318).RHSs (1).In_Parse_Action := null;
         Result (318).RHSs (1).Post_Parse_Action := object_renaming_declaration_1'Access;
         Result (318).RHSs (2).In_Parse_Action := null;
         Result (318).RHSs (2).Post_Parse_Action := object_renaming_declaration_2'Access;
         Result (318).RHSs (3).In_Parse_Action := null;
         Result (318).RHSs (3).Post_Parse_Action := object_renaming_declaration_3'Access;
         Result (318).RHSs (4).In_Parse_Action := null;
         Result (318).RHSs (4).Post_Parse_Action := object_renaming_declaration_4'Access;
         Result (318).RHSs (5).In_Parse_Action := null;
         Result (318).RHSs (5).Post_Parse_Action := object_renaming_declaration_5'Access;
         Result (318).RHSs (6).In_Parse_Action := null;
         Result (318).RHSs (6).Post_Parse_Action := object_renaming_declaration_6'Access;
         Result (318).RHSs (7).In_Parse_Action := null;
         Result (318).RHSs (7).Post_Parse_Action := object_renaming_declaration_7'Access;
         Result (319).RHSs.Set_First_Last (0, 1);
         Result (319).RHSs (0).In_Parse_Action := null;
         Result (319).RHSs (0).Post_Parse_Action := exception_renaming_declaration_0'Access;
         Result (319).RHSs (1).In_Parse_Action := null;
         Result (319).RHSs (1).Post_Parse_Action := exception_renaming_declaration_1'Access;
         Result (320).RHSs.Set_First_Last (0, 1);
         Result (320).RHSs (0).In_Parse_Action := null;
         Result (320).RHSs (0).Post_Parse_Action := package_renaming_declaration_0'Access;
         Result (320).RHSs (1).In_Parse_Action := null;
         Result (320).RHSs (1).Post_Parse_Action := package_renaming_declaration_1'Access;
         Result (321).RHSs.Set_First_Last (0, 3);
         Result (321).RHSs (0).In_Parse_Action := null;
         Result (321).RHSs (0).Post_Parse_Action := subprogram_renaming_declaration_0'Access;
         Result (321).RHSs (1).In_Parse_Action := null;
         Result (321).RHSs (1).Post_Parse_Action := subprogram_renaming_declaration_1'Access;
         Result (321).RHSs (2).In_Parse_Action := null;
         Result (321).RHSs (2).Post_Parse_Action := subprogram_renaming_declaration_2'Access;
         Result (321).RHSs (3).In_Parse_Action := null;
         Result (321).RHSs (3).Post_Parse_Action := subprogram_renaming_declaration_3'Access;
         Result (322).RHSs.Set_First_Last (0, 5);
         Result (322).RHSs (0).In_Parse_Action := null;
         Result (322).RHSs (0).Post_Parse_Action := generic_renaming_declaration_0'Access;
         Result (322).RHSs (1).In_Parse_Action := null;
         Result (322).RHSs (1).Post_Parse_Action := generic_renaming_declaration_1'Access;
         Result (322).RHSs (2).In_Parse_Action := null;
         Result (322).RHSs (2).Post_Parse_Action := generic_renaming_declaration_2'Access;
         Result (322).RHSs (3).In_Parse_Action := null;
         Result (322).RHSs (3).Post_Parse_Action := generic_renaming_declaration_3'Access;
         Result (322).RHSs (4).In_Parse_Action := null;
         Result (322).RHSs (4).Post_Parse_Action := generic_renaming_declaration_4'Access;
         Result (322).RHSs (5).In_Parse_Action := null;
         Result (322).RHSs (5).Post_Parse_Action := generic_renaming_declaration_5'Access;
         Result (323).RHSs.Set_First_Last (0, 11);
         Result (323).RHSs (0).In_Parse_Action := task_type_declaration_0_check'Access;
         Result (323).RHSs (0).Post_Parse_Action := task_type_declaration_0'Access;
         Result (323).RHSs (1).In_Parse_Action := task_type_declaration_1_check'Access;
         Result (323).RHSs (1).Post_Parse_Action := task_type_declaration_1'Access;
         Result (323).RHSs (2).In_Parse_Action := task_type_declaration_2_check'Access;
         Result (323).RHSs (2).Post_Parse_Action := task_type_declaration_2'Access;
         Result (323).RHSs (3).In_Parse_Action := task_type_declaration_3_check'Access;
         Result (323).RHSs (3).Post_Parse_Action := task_type_declaration_3'Access;
         Result (323).RHSs (4).In_Parse_Action := task_type_declaration_4_check'Access;
         Result (323).RHSs (4).Post_Parse_Action := task_type_declaration_4'Access;
         Result (323).RHSs (5).In_Parse_Action := task_type_declaration_5_check'Access;
         Result (323).RHSs (5).Post_Parse_Action := task_type_declaration_5'Access;
         Result (323).RHSs (6).In_Parse_Action := task_type_declaration_6_check'Access;
         Result (323).RHSs (6).Post_Parse_Action := task_type_declaration_6'Access;
         Result (323).RHSs (7).In_Parse_Action := task_type_declaration_7_check'Access;
         Result (323).RHSs (7).Post_Parse_Action := task_type_declaration_7'Access;
         Result (323).RHSs (8).In_Parse_Action := task_type_declaration_8_check'Access;
         Result (323).RHSs (8).Post_Parse_Action := task_type_declaration_8'Access;
         Result (323).RHSs (9).In_Parse_Action := task_type_declaration_9_check'Access;
         Result (323).RHSs (9).Post_Parse_Action := task_type_declaration_9'Access;
         Result (323).RHSs (10).In_Parse_Action := task_type_declaration_10_check'Access;
         Result (323).RHSs (10).Post_Parse_Action := task_type_declaration_10'Access;
         Result (323).RHSs (11).In_Parse_Action := task_type_declaration_11_check'Access;
         Result (323).RHSs (11).Post_Parse_Action := task_type_declaration_11'Access;
         Result (324).RHSs.Set_First_Last (0, 5);
         Result (324).RHSs (0).In_Parse_Action := single_task_declaration_0_check'Access;
         Result (324).RHSs (0).Post_Parse_Action := single_task_declaration_0'Access;
         Result (324).RHSs (1).In_Parse_Action := single_task_declaration_1_check'Access;
         Result (324).RHSs (1).Post_Parse_Action := single_task_declaration_1'Access;
         Result (324).RHSs (2).In_Parse_Action := single_task_declaration_2_check'Access;
         Result (324).RHSs (2).Post_Parse_Action := single_task_declaration_2'Access;
         Result (324).RHSs (3).In_Parse_Action := single_task_declaration_3_check'Access;
         Result (324).RHSs (3).Post_Parse_Action := single_task_declaration_3'Access;
         Result (324).RHSs (4).In_Parse_Action := single_task_declaration_4_check'Access;
         Result (324).RHSs (4).Post_Parse_Action := single_task_declaration_4'Access;
         Result (324).RHSs (5).In_Parse_Action := single_task_declaration_5_check'Access;
         Result (324).RHSs (5).Post_Parse_Action := single_task_declaration_5'Access;
         Result (325).Optimized_List := True;
         Result (326).RHSs.Set_First_Last (0, 3);
         Result (326).RHSs (0).In_Parse_Action := task_definition_0_check'Access;
         Result (326).RHSs (0).Post_Parse_Action := task_definition_0'Access;
         Result (326).RHSs (1).In_Parse_Action := null;
         Result (326).RHSs (1).Post_Parse_Action := task_definition_1'Access;
         Result (326).RHSs (2).In_Parse_Action := task_definition_2_check'Access;
         Result (326).RHSs (2).Post_Parse_Action := task_definition_2'Access;
         Result (326).RHSs (3).In_Parse_Action := null;
         Result (326).RHSs (3).Post_Parse_Action := task_definition_3'Access;
         Result (328).RHSs.Set_First_Last (0, 7);
         Result (328).RHSs (0).In_Parse_Action := task_body_0_check'Access;
         Result (328).RHSs (0).Post_Parse_Action := task_body_0'Access;
         Result (328).RHSs (1).In_Parse_Action := task_body_1_check'Access;
         Result (328).RHSs (1).Post_Parse_Action := task_body_1'Access;
         Result (328).RHSs (2).In_Parse_Action := task_body_2_check'Access;
         Result (328).RHSs (2).Post_Parse_Action := task_body_2'Access;
         Result (328).RHSs (3).In_Parse_Action := task_body_3_check'Access;
         Result (328).RHSs (3).Post_Parse_Action := task_body_3'Access;
         Result (328).RHSs (4).In_Parse_Action := task_body_4_check'Access;
         Result (328).RHSs (4).Post_Parse_Action := task_body_4'Access;
         Result (328).RHSs (5).In_Parse_Action := task_body_5_check'Access;
         Result (328).RHSs (5).Post_Parse_Action := task_body_5'Access;
         Result (328).RHSs (6).In_Parse_Action := task_body_6_check'Access;
         Result (328).RHSs (6).Post_Parse_Action := task_body_6'Access;
         Result (328).RHSs (7).In_Parse_Action := task_body_7_check'Access;
         Result (328).RHSs (7).Post_Parse_Action := task_body_7'Access;
         Result (329).RHSs.Set_First_Last (0, 7);
         Result (329).RHSs (0).In_Parse_Action := protected_type_declaration_0_check'Access;
         Result (329).RHSs (0).Post_Parse_Action := protected_type_declaration_0'Access;
         Result (329).RHSs (1).In_Parse_Action := protected_type_declaration_1_check'Access;
         Result (329).RHSs (1).Post_Parse_Action := protected_type_declaration_1'Access;
         Result (329).RHSs (2).In_Parse_Action := protected_type_declaration_2_check'Access;
         Result (329).RHSs (2).Post_Parse_Action := protected_type_declaration_2'Access;
         Result (329).RHSs (3).In_Parse_Action := protected_type_declaration_3_check'Access;
         Result (329).RHSs (3).Post_Parse_Action := protected_type_declaration_3'Access;
         Result (329).RHSs (4).In_Parse_Action := protected_type_declaration_4_check'Access;
         Result (329).RHSs (4).Post_Parse_Action := protected_type_declaration_4'Access;
         Result (329).RHSs (5).In_Parse_Action := protected_type_declaration_5_check'Access;
         Result (329).RHSs (5).Post_Parse_Action := protected_type_declaration_5'Access;
         Result (329).RHSs (6).In_Parse_Action := protected_type_declaration_6_check'Access;
         Result (329).RHSs (6).Post_Parse_Action := protected_type_declaration_6'Access;
         Result (329).RHSs (7).In_Parse_Action := protected_type_declaration_7_check'Access;
         Result (329).RHSs (7).Post_Parse_Action := protected_type_declaration_7'Access;
         Result (330).RHSs.Set_First_Last (0, 3);
         Result (330).RHSs (0).In_Parse_Action := single_protected_declaration_0_check'Access;
         Result (330).RHSs (0).Post_Parse_Action := single_protected_declaration_0'Access;
         Result (330).RHSs (1).In_Parse_Action := single_protected_declaration_1_check'Access;
         Result (330).RHSs (1).Post_Parse_Action := single_protected_declaration_1'Access;
         Result (330).RHSs (2).In_Parse_Action := single_protected_declaration_2_check'Access;
         Result (330).RHSs (2).Post_Parse_Action := single_protected_declaration_2'Access;
         Result (330).RHSs (3).In_Parse_Action := single_protected_declaration_3_check'Access;
         Result (330).RHSs (3).Post_Parse_Action := single_protected_declaration_3'Access;
         Result (331).Optimized_List := True;
         Result (332).Optimized_List := True;
         Result (333).RHSs.Set_First_Last (0, 11);
         Result (333).RHSs (0).In_Parse_Action := protected_definition_0_check'Access;
         Result (333).RHSs (0).Post_Parse_Action := protected_definition_0'Access;
         Result (333).RHSs (1).In_Parse_Action := null;
         Result (333).RHSs (1).Post_Parse_Action := protected_definition_1'Access;
         Result (333).RHSs (2).In_Parse_Action := protected_definition_2_check'Access;
         Result (333).RHSs (2).Post_Parse_Action := protected_definition_2'Access;
         Result (333).RHSs (3).In_Parse_Action := null;
         Result (333).RHSs (3).Post_Parse_Action := protected_definition_3'Access;
         Result (333).RHSs (4).In_Parse_Action := protected_definition_4_check'Access;
         Result (333).RHSs (4).Post_Parse_Action := protected_definition_4'Access;
         Result (333).RHSs (5).In_Parse_Action := null;
         Result (333).RHSs (5).Post_Parse_Action := protected_definition_5'Access;
         Result (333).RHSs (6).In_Parse_Action := protected_definition_6_check'Access;
         Result (333).RHSs (6).Post_Parse_Action := protected_definition_6'Access;
         Result (333).RHSs (7).In_Parse_Action := null;
         Result (333).RHSs (7).Post_Parse_Action := protected_definition_7'Access;
         Result (333).RHSs (8).In_Parse_Action := protected_definition_8_check'Access;
         Result (333).RHSs (8).Post_Parse_Action := protected_definition_8'Access;
         Result (333).RHSs (9).In_Parse_Action := null;
         Result (333).RHSs (9).Post_Parse_Action := protected_definition_9'Access;
         Result (333).RHSs (10).In_Parse_Action := protected_definition_10_check'Access;
         Result (333).RHSs (10).Post_Parse_Action := protected_definition_10'Access;
         Result (333).RHSs (11).In_Parse_Action := null;
         Result (333).RHSs (11).Post_Parse_Action := protected_definition_11'Access;
         Result (336).Optimized_List := True;
         Result (337).RHSs.Set_First_Last (0, 7);
         Result (337).RHSs (0).In_Parse_Action := protected_body_0_check'Access;
         Result (337).RHSs (0).Post_Parse_Action := protected_body_0'Access;
         Result (337).RHSs (1).In_Parse_Action := protected_body_1_check'Access;
         Result (337).RHSs (1).Post_Parse_Action := protected_body_1'Access;
         Result (337).RHSs (2).In_Parse_Action := protected_body_2_check'Access;
         Result (337).RHSs (2).Post_Parse_Action := protected_body_2'Access;
         Result (337).RHSs (3).In_Parse_Action := protected_body_3_check'Access;
         Result (337).RHSs (3).Post_Parse_Action := protected_body_3'Access;
         Result (337).RHSs (4).In_Parse_Action := protected_body_4_check'Access;
         Result (337).RHSs (4).Post_Parse_Action := protected_body_4'Access;
         Result (337).RHSs (5).In_Parse_Action := protected_body_5_check'Access;
         Result (337).RHSs (5).Post_Parse_Action := protected_body_5'Access;
         Result (337).RHSs (6).In_Parse_Action := protected_body_6_check'Access;
         Result (337).RHSs (6).Post_Parse_Action := protected_body_6'Access;
         Result (337).RHSs (7).In_Parse_Action := protected_body_7_check'Access;
         Result (337).RHSs (7).Post_Parse_Action := protected_body_7'Access;
         Result (339).RHSs.Set_First_Last (0, 15);
         Result (339).RHSs (0).In_Parse_Action := null;
         Result (339).RHSs (0).Post_Parse_Action := entry_declaration_0'Access;
         Result (339).RHSs (1).In_Parse_Action := null;
         Result (339).RHSs (1).Post_Parse_Action := entry_declaration_1'Access;
         Result (339).RHSs (2).In_Parse_Action := null;
         Result (339).RHSs (2).Post_Parse_Action := entry_declaration_2'Access;
         Result (339).RHSs (3).In_Parse_Action := null;
         Result (339).RHSs (3).Post_Parse_Action := entry_declaration_3'Access;
         Result (339).RHSs (4).In_Parse_Action := null;
         Result (339).RHSs (4).Post_Parse_Action := entry_declaration_4'Access;
         Result (339).RHSs (5).In_Parse_Action := null;
         Result (339).RHSs (5).Post_Parse_Action := entry_declaration_5'Access;
         Result (339).RHSs (6).In_Parse_Action := null;
         Result (339).RHSs (6).Post_Parse_Action := entry_declaration_6'Access;
         Result (339).RHSs (7).In_Parse_Action := null;
         Result (339).RHSs (7).Post_Parse_Action := entry_declaration_7'Access;
         Result (339).RHSs (8).In_Parse_Action := null;
         Result (339).RHSs (8).Post_Parse_Action := entry_declaration_8'Access;
         Result (339).RHSs (9).In_Parse_Action := null;
         Result (339).RHSs (9).Post_Parse_Action := entry_declaration_9'Access;
         Result (339).RHSs (10).In_Parse_Action := null;
         Result (339).RHSs (10).Post_Parse_Action := entry_declaration_10'Access;
         Result (339).RHSs (11).In_Parse_Action := null;
         Result (339).RHSs (11).Post_Parse_Action := entry_declaration_11'Access;
         Result (339).RHSs (12).In_Parse_Action := null;
         Result (339).RHSs (12).Post_Parse_Action := entry_declaration_12'Access;
         Result (339).RHSs (13).In_Parse_Action := null;
         Result (339).RHSs (13).Post_Parse_Action := entry_declaration_13'Access;
         Result (339).RHSs (14).In_Parse_Action := null;
         Result (339).RHSs (14).Post_Parse_Action := entry_declaration_14'Access;
         Result (339).RHSs (15).In_Parse_Action := null;
         Result (339).RHSs (15).Post_Parse_Action := entry_declaration_15'Access;
         Result (340).RHSs.Set_First_Last (0, 11);
         Result (340).RHSs (0).In_Parse_Action := accept_statement_0_check'Access;
         Result (340).RHSs (0).Post_Parse_Action := accept_statement_0'Access;
         Result (340).RHSs (1).In_Parse_Action := accept_statement_1_check'Access;
         Result (340).RHSs (1).Post_Parse_Action := accept_statement_1'Access;
         Result (340).RHSs (2).In_Parse_Action := accept_statement_2_check'Access;
         Result (340).RHSs (2).Post_Parse_Action := accept_statement_2'Access;
         Result (340).RHSs (3).In_Parse_Action := accept_statement_3_check'Access;
         Result (340).RHSs (3).Post_Parse_Action := accept_statement_3'Access;
         Result (340).RHSs (4).In_Parse_Action := accept_statement_4_check'Access;
         Result (340).RHSs (4).Post_Parse_Action := accept_statement_4'Access;
         Result (340).RHSs (5).In_Parse_Action := accept_statement_5_check'Access;
         Result (340).RHSs (5).Post_Parse_Action := accept_statement_5'Access;
         Result (340).RHSs (6).In_Parse_Action := accept_statement_6_check'Access;
         Result (340).RHSs (6).Post_Parse_Action := accept_statement_6'Access;
         Result (340).RHSs (7).In_Parse_Action := accept_statement_7_check'Access;
         Result (340).RHSs (7).Post_Parse_Action := accept_statement_7'Access;
         Result (340).RHSs (8).In_Parse_Action := accept_statement_8_check'Access;
         Result (340).RHSs (8).Post_Parse_Action := accept_statement_8'Access;
         Result (340).RHSs (9).In_Parse_Action := accept_statement_9_check'Access;
         Result (340).RHSs (9).Post_Parse_Action := accept_statement_9'Access;
         Result (340).RHSs (10).In_Parse_Action := accept_statement_10_check'Access;
         Result (340).RHSs (10).Post_Parse_Action := accept_statement_10'Access;
         Result (340).RHSs (11).In_Parse_Action := accept_statement_11_check'Access;
         Result (340).RHSs (11).Post_Parse_Action := accept_statement_11'Access;
         Result (341).RHSs.Set_First_Last (0, 15);
         Result (341).RHSs (0).In_Parse_Action := entry_body_0_check'Access;
         Result (341).RHSs (0).Post_Parse_Action := entry_body_0'Access;
         Result (341).RHSs (1).In_Parse_Action := entry_body_1_check'Access;
         Result (341).RHSs (1).Post_Parse_Action := entry_body_1'Access;
         Result (341).RHSs (2).In_Parse_Action := entry_body_2_check'Access;
         Result (341).RHSs (2).Post_Parse_Action := entry_body_2'Access;
         Result (341).RHSs (3).In_Parse_Action := entry_body_3_check'Access;
         Result (341).RHSs (3).Post_Parse_Action := entry_body_3'Access;
         Result (341).RHSs (4).In_Parse_Action := entry_body_4_check'Access;
         Result (341).RHSs (4).Post_Parse_Action := entry_body_4'Access;
         Result (341).RHSs (5).In_Parse_Action := entry_body_5_check'Access;
         Result (341).RHSs (5).Post_Parse_Action := entry_body_5'Access;
         Result (341).RHSs (6).In_Parse_Action := entry_body_6_check'Access;
         Result (341).RHSs (6).Post_Parse_Action := entry_body_6'Access;
         Result (341).RHSs (7).In_Parse_Action := entry_body_7_check'Access;
         Result (341).RHSs (7).Post_Parse_Action := entry_body_7'Access;
         Result (341).RHSs (8).In_Parse_Action := entry_body_8_check'Access;
         Result (341).RHSs (8).Post_Parse_Action := entry_body_8'Access;
         Result (341).RHSs (9).In_Parse_Action := entry_body_9_check'Access;
         Result (341).RHSs (9).Post_Parse_Action := entry_body_9'Access;
         Result (341).RHSs (10).In_Parse_Action := entry_body_10_check'Access;
         Result (341).RHSs (10).Post_Parse_Action := entry_body_10'Access;
         Result (341).RHSs (11).In_Parse_Action := entry_body_11_check'Access;
         Result (341).RHSs (11).Post_Parse_Action := entry_body_11'Access;
         Result (341).RHSs (12).In_Parse_Action := entry_body_12_check'Access;
         Result (341).RHSs (12).Post_Parse_Action := entry_body_12'Access;
         Result (341).RHSs (13).In_Parse_Action := entry_body_13_check'Access;
         Result (341).RHSs (13).Post_Parse_Action := entry_body_13'Access;
         Result (341).RHSs (14).In_Parse_Action := entry_body_14_check'Access;
         Result (341).RHSs (14).Post_Parse_Action := entry_body_14'Access;
         Result (341).RHSs (15).In_Parse_Action := entry_body_15_check'Access;
         Result (341).RHSs (15).Post_Parse_Action := entry_body_15'Access;
         Result (342).RHSs.Set_First_Last (0, 1);
         Result (342).RHSs (0).In_Parse_Action := null;
         Result (342).RHSs (0).Post_Parse_Action := non_empty_entry_body_formal_part_0'Access;
         Result (342).RHSs (1).In_Parse_Action := null;
         Result (342).RHSs (1).Post_Parse_Action := non_empty_entry_body_formal_part_1'Access;
         Result (343).RHSs.Set_First_Last (0, 0);
         Result (343).RHSs (0).In_Parse_Action := null;
         Result (343).RHSs (0).Post_Parse_Action := entry_barrier_0'Access;
         Result (345).RHSs.Set_First_Last (0, 1);
         Result (345).RHSs (0).In_Parse_Action := null;
         Result (345).RHSs (0).Post_Parse_Action := requeue_statement_0'Access;
         Result (345).RHSs (1).In_Parse_Action := null;
         Result (345).RHSs (1).Post_Parse_Action := requeue_statement_1'Access;
         Result (347).RHSs.Set_First_Last (0, 0);
         Result (347).RHSs (0).In_Parse_Action := null;
         Result (347).RHSs (0).Post_Parse_Action := delay_until_statement_0'Access;
         Result (348).RHSs.Set_First_Last (0, 0);
         Result (348).RHSs (0).In_Parse_Action := null;
         Result (348).RHSs (0).Post_Parse_Action := delay_relative_statement_0'Access;
         Result (350).RHSs.Set_First_Last (0, 1);
         Result (350).RHSs (0).In_Parse_Action := null;
         Result (350).RHSs (0).Post_Parse_Action := guard_select_0'Access;
         Result (350).RHSs (1).In_Parse_Action := null;
         Result (350).RHSs (1).Post_Parse_Action := null;
         Result (351).RHSs.Set_First_Last (0, 1);
         Result (351).RHSs (0).In_Parse_Action := null;
         Result (351).RHSs (0).Post_Parse_Action := null;
         Result (351).RHSs (1).In_Parse_Action := null;
         Result (351).RHSs (1).Post_Parse_Action := select_alternative_list_1'Access;
         Result (352).RHSs.Set_First_Last (0, 1);
         Result (352).RHSs (0).In_Parse_Action := null;
         Result (352).RHSs (0).Post_Parse_Action := selective_accept_0'Access;
         Result (352).RHSs (1).In_Parse_Action := null;
         Result (352).RHSs (1).Post_Parse_Action := selective_accept_1'Access;
         Result (353).RHSs.Set_First_Last (0, 0);
         Result (353).RHSs (0).In_Parse_Action := null;
         Result (353).RHSs (0).Post_Parse_Action := guard_0'Access;
         Result (357).RHSs.Set_First_Last (0, 0);
         Result (357).RHSs (0).In_Parse_Action := null;
         Result (357).RHSs (0).Post_Parse_Action := terminate_alternative_0'Access;
         Result (358).RHSs.Set_First_Last (0, 0);
         Result (358).RHSs (0).In_Parse_Action := null;
         Result (358).RHSs (0).Post_Parse_Action := timed_entry_call_0'Access;
         Result (360).RHSs.Set_First_Last (0, 0);
         Result (360).RHSs (0).In_Parse_Action := null;
         Result (360).RHSs (0).Post_Parse_Action := conditional_entry_call_0'Access;
         Result (361).RHSs.Set_First_Last (0, 0);
         Result (361).RHSs (0).In_Parse_Action := null;
         Result (361).RHSs (0).Post_Parse_Action := asynchronous_select_0'Access;
         Result (363).RHSs.Set_First_Last (0, 0);
         Result (363).RHSs (0).In_Parse_Action := null;
         Result (363).RHSs (0).Post_Parse_Action := abort_statement_0'Access;
         Result (364).RHSs.Set_First_Last (0, 1);
         Result (364).RHSs (0).In_Parse_Action := compilation_0_check'Access;
         Result (364).RHSs (0).Post_Parse_Action := compilation_0'Access;
         Result (364).RHSs (1).In_Parse_Action := null;
         Result (364).RHSs (1).Post_Parse_Action := compilation_1'Access;
         Result (365).RHSs.Set_First_Last (0, 5);
         Result (365).RHSs (0).In_Parse_Action := null;
         Result (365).RHSs (0).Post_Parse_Action := null;
         Result (365).RHSs (1).In_Parse_Action := null;
         Result (365).RHSs (1).Post_Parse_Action := compilation_unit_1'Access;
         Result (365).RHSs (2).In_Parse_Action := null;
         Result (365).RHSs (2).Post_Parse_Action := compilation_unit_2'Access;
         Result (365).RHSs (3).In_Parse_Action := null;
         Result (365).RHSs (3).Post_Parse_Action := null;
         Result (365).RHSs (4).In_Parse_Action := null;
         Result (365).RHSs (4).Post_Parse_Action := null;
         Result (365).RHSs (5).In_Parse_Action := null;
         Result (365).RHSs (5).Post_Parse_Action := null;
         Result (366).RHSs.Set_First_Last (0, 3);
         Result (366).RHSs (0).In_Parse_Action := null;
         Result (366).RHSs (0).Post_Parse_Action := with_clause_0'Access;
         Result (366).RHSs (1).In_Parse_Action := null;
         Result (366).RHSs (1).Post_Parse_Action := with_clause_1'Access;
         Result (366).RHSs (2).In_Parse_Action := null;
         Result (366).RHSs (2).Post_Parse_Action := with_clause_2'Access;
         Result (366).RHSs (3).In_Parse_Action := null;
         Result (366).RHSs (3).Post_Parse_Action := with_clause_3'Access;
         Result (368).RHSs.Set_First_Last (0, 3);
         Result (368).RHSs (0).In_Parse_Action := null;
         Result (368).RHSs (0).Post_Parse_Action := subprogram_body_stub_0'Access;
         Result (368).RHSs (1).In_Parse_Action := null;
         Result (368).RHSs (1).Post_Parse_Action := subprogram_body_stub_1'Access;
         Result (368).RHSs (2).In_Parse_Action := null;
         Result (368).RHSs (2).Post_Parse_Action := subprogram_body_stub_2'Access;
         Result (368).RHSs (3).In_Parse_Action := null;
         Result (368).RHSs (3).Post_Parse_Action := subprogram_body_stub_3'Access;
         Result (369).RHSs.Set_First_Last (0, 1);
         Result (369).RHSs (0).In_Parse_Action := null;
         Result (369).RHSs (0).Post_Parse_Action := package_body_stub_0'Access;
         Result (369).RHSs (1).In_Parse_Action := null;
         Result (369).RHSs (1).Post_Parse_Action := package_body_stub_1'Access;
         Result (370).RHSs.Set_First_Last (0, 1);
         Result (370).RHSs (0).In_Parse_Action := null;
         Result (370).RHSs (0).Post_Parse_Action := task_body_stub_0'Access;
         Result (370).RHSs (1).In_Parse_Action := null;
         Result (370).RHSs (1).Post_Parse_Action := task_body_stub_1'Access;
         Result (371).RHSs.Set_First_Last (0, 1);
         Result (371).RHSs (0).In_Parse_Action := null;
         Result (371).RHSs (0).Post_Parse_Action := protected_body_stub_0'Access;
         Result (371).RHSs (1).In_Parse_Action := null;
         Result (371).RHSs (1).Post_Parse_Action := protected_body_stub_1'Access;
         Result (372).RHSs.Set_First_Last (0, 0);
         Result (372).RHSs (0).In_Parse_Action := null;
         Result (372).RHSs (0).Post_Parse_Action := subunit_0'Access;
         Result (373).RHSs.Set_First_Last (0, 1);
         Result (373).RHSs (0).In_Parse_Action := null;
         Result (373).RHSs (0).Post_Parse_Action := exception_declaration_0'Access;
         Result (373).RHSs (1).In_Parse_Action := null;
         Result (373).RHSs (1).Post_Parse_Action := exception_declaration_1'Access;
         Result (374).RHSs.Set_First_Last (0, 1);
         Result (374).RHSs (0).In_Parse_Action := null;
         Result (374).RHSs (0).Post_Parse_Action := handled_sequence_of_statements_0'Access;
         Result (374).RHSs (1).In_Parse_Action := null;
         Result (374).RHSs (1).Post_Parse_Action := handled_sequence_of_statements_1'Access;
         Result (375).Optimized_List := True;
         Result (376).RHSs.Set_First_Last (0, 2);
         Result (376).RHSs (0).In_Parse_Action := null;
         Result (376).RHSs (0).Post_Parse_Action := exception_handler_0'Access;
         Result (376).RHSs (1).In_Parse_Action := null;
         Result (376).RHSs (1).Post_Parse_Action := exception_handler_1'Access;
         Result (376).RHSs (2).In_Parse_Action := null;
         Result (376).RHSs (2).Post_Parse_Action := null;
         Result (378).RHSs.Set_First_Last (0, 2);
         Result (378).RHSs (0).In_Parse_Action := null;
         Result (378).RHSs (0).Post_Parse_Action := raise_statement_0'Access;
         Result (378).RHSs (1).In_Parse_Action := null;
         Result (378).RHSs (1).Post_Parse_Action := raise_statement_1'Access;
         Result (378).RHSs (2).In_Parse_Action := null;
         Result (378).RHSs (2).Post_Parse_Action := raise_statement_2'Access;
         Result (379).RHSs.Set_First_Last (0, 1);
         Result (379).RHSs (0).In_Parse_Action := null;
         Result (379).RHSs (0).Post_Parse_Action := raise_expression_0'Access;
         Result (379).RHSs (1).In_Parse_Action := null;
         Result (379).RHSs (1).Post_Parse_Action := raise_expression_1'Access;
         Result (381).RHSs.Set_First_Last (0, 1);
         Result (381).RHSs (0).In_Parse_Action := null;
         Result (381).RHSs (0).Post_Parse_Action := generic_subprogram_declaration_0'Access;
         Result (381).RHSs (1).In_Parse_Action := null;
         Result (381).RHSs (1).Post_Parse_Action := generic_subprogram_declaration_1'Access;
         Result (382).RHSs.Set_First_Last (0, 0);
         Result (382).RHSs (0).In_Parse_Action := null;
         Result (382).RHSs (0).Post_Parse_Action := generic_package_declaration_0'Access;
         Result (383).RHSs.Set_First_Last (0, 1);
         Result (383).RHSs (0).In_Parse_Action := null;
         Result (383).RHSs (0).Post_Parse_Action := generic_formal_part_0'Access;
         Result (383).RHSs (1).In_Parse_Action := null;
         Result (383).RHSs (1).Post_Parse_Action := generic_formal_part_1'Access;
         Result (385).RHSs.Set_First_Last (0, 9);
         Result (385).RHSs (0).In_Parse_Action := null;
         Result (385).RHSs (0).Post_Parse_Action := generic_instantiation_0'Access;
         Result (385).RHSs (1).In_Parse_Action := null;
         Result (385).RHSs (1).Post_Parse_Action := generic_instantiation_1'Access;
         Result (385).RHSs (2).In_Parse_Action := null;
         Result (385).RHSs (2).Post_Parse_Action := generic_instantiation_2'Access;
         Result (385).RHSs (3).In_Parse_Action := null;
         Result (385).RHSs (3).Post_Parse_Action := generic_instantiation_3'Access;
         Result (385).RHSs (4).In_Parse_Action := null;
         Result (385).RHSs (4).Post_Parse_Action := generic_instantiation_4'Access;
         Result (385).RHSs (5).In_Parse_Action := null;
         Result (385).RHSs (5).Post_Parse_Action := generic_instantiation_5'Access;
         Result (385).RHSs (6).In_Parse_Action := null;
         Result (385).RHSs (6).Post_Parse_Action := generic_instantiation_6'Access;
         Result (385).RHSs (7).In_Parse_Action := null;
         Result (385).RHSs (7).Post_Parse_Action := generic_instantiation_7'Access;
         Result (385).RHSs (8).In_Parse_Action := null;
         Result (385).RHSs (8).Post_Parse_Action := generic_instantiation_8'Access;
         Result (385).RHSs (9).In_Parse_Action := null;
         Result (385).RHSs (9).Post_Parse_Action := generic_instantiation_9'Access;
         Result (386).RHSs.Set_First_Last (0, 23);
         Result (386).RHSs (0).In_Parse_Action := null;
         Result (386).RHSs (0).Post_Parse_Action := formal_object_declaration_0'Access;
         Result (386).RHSs (1).In_Parse_Action := null;
         Result (386).RHSs (1).Post_Parse_Action := formal_object_declaration_1'Access;
         Result (386).RHSs (2).In_Parse_Action := null;
         Result (386).RHSs (2).Post_Parse_Action := formal_object_declaration_2'Access;
         Result (386).RHSs (3).In_Parse_Action := null;
         Result (386).RHSs (3).Post_Parse_Action := formal_object_declaration_3'Access;
         Result (386).RHSs (4).In_Parse_Action := null;
         Result (386).RHSs (4).Post_Parse_Action := formal_object_declaration_4'Access;
         Result (386).RHSs (5).In_Parse_Action := null;
         Result (386).RHSs (5).Post_Parse_Action := formal_object_declaration_5'Access;
         Result (386).RHSs (6).In_Parse_Action := null;
         Result (386).RHSs (6).Post_Parse_Action := formal_object_declaration_6'Access;
         Result (386).RHSs (7).In_Parse_Action := null;
         Result (386).RHSs (7).Post_Parse_Action := formal_object_declaration_7'Access;
         Result (386).RHSs (8).In_Parse_Action := null;
         Result (386).RHSs (8).Post_Parse_Action := formal_object_declaration_8'Access;
         Result (386).RHSs (9).In_Parse_Action := null;
         Result (386).RHSs (9).Post_Parse_Action := formal_object_declaration_9'Access;
         Result (386).RHSs (10).In_Parse_Action := null;
         Result (386).RHSs (10).Post_Parse_Action := formal_object_declaration_10'Access;
         Result (386).RHSs (11).In_Parse_Action := null;
         Result (386).RHSs (11).Post_Parse_Action := formal_object_declaration_11'Access;
         Result (386).RHSs (12).In_Parse_Action := null;
         Result (386).RHSs (12).Post_Parse_Action := formal_object_declaration_12'Access;
         Result (386).RHSs (13).In_Parse_Action := null;
         Result (386).RHSs (13).Post_Parse_Action := formal_object_declaration_13'Access;
         Result (386).RHSs (14).In_Parse_Action := null;
         Result (386).RHSs (14).Post_Parse_Action := formal_object_declaration_14'Access;
         Result (386).RHSs (15).In_Parse_Action := null;
         Result (386).RHSs (15).Post_Parse_Action := formal_object_declaration_15'Access;
         Result (386).RHSs (16).In_Parse_Action := null;
         Result (386).RHSs (16).Post_Parse_Action := formal_object_declaration_16'Access;
         Result (386).RHSs (17).In_Parse_Action := null;
         Result (386).RHSs (17).Post_Parse_Action := formal_object_declaration_17'Access;
         Result (386).RHSs (18).In_Parse_Action := null;
         Result (386).RHSs (18).Post_Parse_Action := formal_object_declaration_18'Access;
         Result (386).RHSs (19).In_Parse_Action := null;
         Result (386).RHSs (19).Post_Parse_Action := formal_object_declaration_19'Access;
         Result (386).RHSs (20).In_Parse_Action := null;
         Result (386).RHSs (20).Post_Parse_Action := formal_object_declaration_20'Access;
         Result (386).RHSs (21).In_Parse_Action := null;
         Result (386).RHSs (21).Post_Parse_Action := formal_object_declaration_21'Access;
         Result (386).RHSs (22).In_Parse_Action := null;
         Result (386).RHSs (22).Post_Parse_Action := formal_object_declaration_22'Access;
         Result (386).RHSs (23).In_Parse_Action := null;
         Result (386).RHSs (23).Post_Parse_Action := formal_object_declaration_23'Access;
         Result (388).RHSs.Set_First_Last (0, 7);
         Result (388).RHSs (0).In_Parse_Action := null;
         Result (388).RHSs (0).Post_Parse_Action := formal_complete_type_declaration_0'Access;
         Result (388).RHSs (1).In_Parse_Action := null;
         Result (388).RHSs (1).Post_Parse_Action := formal_complete_type_declaration_1'Access;
         Result (388).RHSs (2).In_Parse_Action := null;
         Result (388).RHSs (2).Post_Parse_Action := formal_complete_type_declaration_2'Access;
         Result (388).RHSs (3).In_Parse_Action := null;
         Result (388).RHSs (3).Post_Parse_Action := formal_complete_type_declaration_3'Access;
         Result (388).RHSs (4).In_Parse_Action := null;
         Result (388).RHSs (4).Post_Parse_Action := formal_complete_type_declaration_4'Access;
         Result (388).RHSs (5).In_Parse_Action := null;
         Result (388).RHSs (5).Post_Parse_Action := formal_complete_type_declaration_5'Access;
         Result (388).RHSs (6).In_Parse_Action := null;
         Result (388).RHSs (6).Post_Parse_Action := formal_complete_type_declaration_6'Access;
         Result (388).RHSs (7).In_Parse_Action := null;
         Result (388).RHSs (7).Post_Parse_Action := formal_complete_type_declaration_7'Access;
         Result (389).RHSs.Set_First_Last (0, 7);
         Result (389).RHSs (0).In_Parse_Action := null;
         Result (389).RHSs (0).Post_Parse_Action := formal_incomplete_type_declaration_0'Access;
         Result (389).RHSs (1).In_Parse_Action := null;
         Result (389).RHSs (1).Post_Parse_Action := formal_incomplete_type_declaration_1'Access;
         Result (389).RHSs (2).In_Parse_Action := null;
         Result (389).RHSs (2).Post_Parse_Action := formal_incomplete_type_declaration_2'Access;
         Result (389).RHSs (3).In_Parse_Action := null;
         Result (389).RHSs (3).Post_Parse_Action := formal_incomplete_type_declaration_3'Access;
         Result (389).RHSs (4).In_Parse_Action := null;
         Result (389).RHSs (4).Post_Parse_Action := formal_incomplete_type_declaration_4'Access;
         Result (389).RHSs (5).In_Parse_Action := null;
         Result (389).RHSs (5).Post_Parse_Action := formal_incomplete_type_declaration_5'Access;
         Result (389).RHSs (6).In_Parse_Action := null;
         Result (389).RHSs (6).Post_Parse_Action := formal_incomplete_type_declaration_6'Access;
         Result (389).RHSs (7).In_Parse_Action := null;
         Result (389).RHSs (7).Post_Parse_Action := formal_incomplete_type_declaration_7'Access;
         Result (392).RHSs.Set_First_Last (0, 17);
         Result (392).RHSs (0).In_Parse_Action := null;
         Result (392).RHSs (0).Post_Parse_Action := formal_derived_type_definition_0'Access;
         Result (392).RHSs (1).In_Parse_Action := null;
         Result (392).RHSs (1).Post_Parse_Action := formal_derived_type_definition_1'Access;
         Result (392).RHSs (2).In_Parse_Action := null;
         Result (392).RHSs (2).Post_Parse_Action := formal_derived_type_definition_2'Access;
         Result (392).RHSs (3).In_Parse_Action := null;
         Result (392).RHSs (3).Post_Parse_Action := formal_derived_type_definition_3'Access;
         Result (392).RHSs (4).In_Parse_Action := null;
         Result (392).RHSs (4).Post_Parse_Action := formal_derived_type_definition_4'Access;
         Result (392).RHSs (5).In_Parse_Action := null;
         Result (392).RHSs (5).Post_Parse_Action := formal_derived_type_definition_5'Access;
         Result (392).RHSs (6).In_Parse_Action := null;
         Result (392).RHSs (6).Post_Parse_Action := formal_derived_type_definition_6'Access;
         Result (392).RHSs (7).In_Parse_Action := null;
         Result (392).RHSs (7).Post_Parse_Action := formal_derived_type_definition_7'Access;
         Result (392).RHSs (8).In_Parse_Action := null;
         Result (392).RHSs (8).Post_Parse_Action := formal_derived_type_definition_8'Access;
         Result (392).RHSs (9).In_Parse_Action := null;
         Result (392).RHSs (9).Post_Parse_Action := formal_derived_type_definition_9'Access;
         Result (392).RHSs (10).In_Parse_Action := null;
         Result (392).RHSs (10).Post_Parse_Action := formal_derived_type_definition_10'Access;
         Result (392).RHSs (11).In_Parse_Action := null;
         Result (392).RHSs (11).Post_Parse_Action := formal_derived_type_definition_11'Access;
         Result (392).RHSs (12).In_Parse_Action := null;
         Result (392).RHSs (12).Post_Parse_Action := formal_derived_type_definition_12'Access;
         Result (392).RHSs (13).In_Parse_Action := null;
         Result (392).RHSs (13).Post_Parse_Action := formal_derived_type_definition_13'Access;
         Result (392).RHSs (14).In_Parse_Action := null;
         Result (392).RHSs (14).Post_Parse_Action := formal_derived_type_definition_14'Access;
         Result (392).RHSs (15).In_Parse_Action := null;
         Result (392).RHSs (15).Post_Parse_Action := formal_derived_type_definition_15'Access;
         Result (392).RHSs (16).In_Parse_Action := null;
         Result (392).RHSs (16).Post_Parse_Action := formal_derived_type_definition_16'Access;
         Result (392).RHSs (17).In_Parse_Action := null;
         Result (392).RHSs (17).Post_Parse_Action := formal_derived_type_definition_17'Access;
         Result (403).RHSs.Set_First_Last (0, 3);
         Result (403).RHSs (0).In_Parse_Action := null;
         Result (403).RHSs (0).Post_Parse_Action := formal_concrete_subprogram_declaration_0'Access;
         Result (403).RHSs (1).In_Parse_Action := null;
         Result (403).RHSs (1).Post_Parse_Action := formal_concrete_subprogram_declaration_1'Access;
         Result (403).RHSs (2).In_Parse_Action := null;
         Result (403).RHSs (2).Post_Parse_Action := formal_concrete_subprogram_declaration_2'Access;
         Result (403).RHSs (3).In_Parse_Action := null;
         Result (403).RHSs (3).Post_Parse_Action := formal_concrete_subprogram_declaration_3'Access;
         Result (404).RHSs.Set_First_Last (0, 3);
         Result (404).RHSs (0).In_Parse_Action := null;
         Result (404).RHSs (0).Post_Parse_Action := formal_abstract_subprogram_declaration_0'Access;
         Result (404).RHSs (1).In_Parse_Action := null;
         Result (404).RHSs (1).Post_Parse_Action := formal_abstract_subprogram_declaration_1'Access;
         Result (404).RHSs (2).In_Parse_Action := null;
         Result (404).RHSs (2).Post_Parse_Action := formal_abstract_subprogram_declaration_2'Access;
         Result (404).RHSs (3).In_Parse_Action := null;
         Result (404).RHSs (3).Post_Parse_Action := formal_abstract_subprogram_declaration_3'Access;
         Result (405).RHSs.Set_First_Last (0, 2);
         Result (405).RHSs (0).In_Parse_Action := null;
         Result (405).RHSs (0).Post_Parse_Action := subprogram_default_0'Access;
         Result (405).RHSs (1).In_Parse_Action := null;
         Result (405).RHSs (1).Post_Parse_Action := null;
         Result (405).RHSs (2).In_Parse_Action := null;
         Result (405).RHSs (2).Post_Parse_Action := null;
         Result (406).RHSs.Set_First_Last (0, 1);
         Result (406).RHSs (0).In_Parse_Action := null;
         Result (406).RHSs (0).Post_Parse_Action := formal_package_declaration_0'Access;
         Result (406).RHSs (1).In_Parse_Action := null;
         Result (406).RHSs (1).Post_Parse_Action := formal_package_declaration_1'Access;
         Result (408).RHSs.Set_First_Last (0, 1);
         Result (408).RHSs (0).In_Parse_Action := null;
         Result (408).RHSs (0).Post_Parse_Action := aspect_association_0'Access;
         Result (408).RHSs (1).In_Parse_Action := null;
         Result (408).RHSs (1).Post_Parse_Action := aspect_association_1'Access;
         Result (409).Optimized_List := True;
         Result (410).RHSs.Set_First_Last (0, 0);
         Result (410).RHSs (0).In_Parse_Action := null;
         Result (410).RHSs (0).Post_Parse_Action := aspect_specification_0'Access;
         Result (413).RHSs.Set_First_Last (0, 0);
         Result (413).RHSs (0).In_Parse_Action := null;
         Result (413).RHSs (0).Post_Parse_Action := attribute_definition_clause_0'Access;
         Result (414).RHSs.Set_First_Last (0, 0);
         Result (414).RHSs (0).In_Parse_Action := null;
         Result (414).RHSs (0).Post_Parse_Action := enumeration_representation_clause_0'Access;
         Result (415).RHSs.Set_First_Last (0, 7);
         Result (415).RHSs (0).In_Parse_Action := null;
         Result (415).RHSs (0).Post_Parse_Action := record_representation_clause_0'Access;
         Result (415).RHSs (1).In_Parse_Action := null;
         Result (415).RHSs (1).Post_Parse_Action := record_representation_clause_1'Access;
         Result (415).RHSs (2).In_Parse_Action := null;
         Result (415).RHSs (2).Post_Parse_Action := record_representation_clause_2'Access;
         Result (415).RHSs (3).In_Parse_Action := null;
         Result (415).RHSs (3).Post_Parse_Action := record_representation_clause_3'Access;
         Result (415).RHSs (4).In_Parse_Action := null;
         Result (415).RHSs (4).Post_Parse_Action := record_representation_clause_4'Access;
         Result (415).RHSs (5).In_Parse_Action := null;
         Result (415).RHSs (5).Post_Parse_Action := record_representation_clause_5'Access;
         Result (415).RHSs (6).In_Parse_Action := null;
         Result (415).RHSs (6).Post_Parse_Action := record_representation_clause_6'Access;
         Result (415).RHSs (7).In_Parse_Action := null;
         Result (415).RHSs (7).Post_Parse_Action := record_representation_clause_7'Access;
         Result (416).RHSs.Set_First_Last (0, 0);
         Result (416).RHSs (0).In_Parse_Action := null;
         Result (416).RHSs (0).Post_Parse_Action := component_clause_0'Access;
         Result (422).RHSs.Set_First_Last (0, 1);
         Result (422).RHSs (0).In_Parse_Action := null;
         Result (422).RHSs (0).Post_Parse_Action := delta_constraint_0'Access;
         Result (422).RHSs (1).In_Parse_Action := null;
         Result (422).RHSs (1).Post_Parse_Action := delta_constraint_1'Access;
         Result (423).RHSs.Set_First_Last (0, 0);
         Result (423).RHSs (0).In_Parse_Action := null;
         Result (423).RHSs (0).Post_Parse_Action := at_clause_0'Access;
         Result (425).Optimized_List := True;
         Result (426).Optimized_List := True;
         Result (427).Optimized_List := True;
         Result (428).Optimized_List := True;
         Result (429).Optimized_List := True;
         Result (431).Optimized_List := True;
         Result (433).Optimized_List := True;
         Result (434).Optimized_List := True;
         Result (435).Optimized_List := True;
         Result (436).Optimized_List := True;
         Result (437).Optimized_List := True;
         Result (438).Optimized_List := True;
         Result (439).Optimized_List := True;
         Result (440).Optimized_List := True;
         Result (441).Optimized_List := True;
         Result (442).Optimized_List := True;
         Result (443).Optimized_List := True;
         Result (444).Optimized_List := True;
      end return;
   end Create_Productions;

   function Create_Parser
     (Trace      : in WisiToken.Trace_Access;
      User_Data  : in WisiToken.Syntax_Trees.User_Data_Access;
      Language_Fixes                 : in WisiToken.Parse.LR.Parser.Language_Fixes_Access;
      Language_Matching_Begin_Tokens : in WisiToken.Parse.LR.Parser.Language_Matching_Begin_Tokens_Access;
      Language_String_ID_Set         : in WisiToken.Parse.LR.Parser.Language_String_ID_Set_Access;
      Text_Rep_File_Name : in String)
     return WisiToken.Parse.LR.Parser.Parser
   is begin
      return Parser : WisiToken.Parse.LR.Parser.Parser do
         Parser.Tree.Lexer := Lexer.New_Lexer (Trace, Ada_Annex_P_Process_LR1_Actions.Descriptor'Access);
         Parser.Productions := Create_Productions;
         Parser.User_Data := User_Data;
         Parser.Partial_Parse_Active := Ada_Annex_P_Process_LR1_Actions.Partial_Parse_Active'Access;
         Parser.Partial_Parse_Byte_Goal := Ada_Annex_P_Process_LR1_Actions.Partial_Parse_Byte_Goal'Access;
         Parser.Table := Create_Parse_Table (Text_Rep_File_Name);
         Parser.Language_Fixes                 := Language_Fixes;
         Parser.Language_Matching_Begin_Tokens := Language_Matching_Begin_Tokens;
         Parser.Language_String_ID_Set         := Language_String_ID_Set;
      end return;
   end Create_Parser;
end Ada_Annex_P_Process_LR1_Main;
