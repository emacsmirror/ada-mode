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
--  along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

with Ada_Annex_P_Process_Actions; use Ada_Annex_P_Process_Actions;
with SAL;
with WisiToken.Lexer.re2c;
with ada_annex_p_re2c_c;
package body Ada_Annex_P_Process_LR1_Main is

   function Is_Block_Delimited (ID : in WisiToken.Token_ID) return Boolean
   is begin
      case To_Token_Enum (ID) is
      when
         COMMENT_ID |
         GNAT_PREP_IF_ID |
         GNAT_PREP_ELSIF_ID |
         GNAT_PREP_ELSE_ID |
         GNAT_PREP_END_IF_ID |
         CONFLICT_MARK_A_ID |
         CONFLICT_MARK_B_ID |
         CONFLICT_MARK_END_ID |
         PLACEHOLDER_ID |
         STRING_LITERAL_ID |
         CHARACTER_LITERAL_ID => return True;
      when others => return False;
      end case;
   end Is_Block_Delimited;

   function Same_Block_Delimiters (ID : in WisiToken.Token_ID) return Boolean
   is begin
      case To_Token_Enum (ID) is
      when COMMENT_ID => return False;
      when GNAT_PREP_IF_ID => return False;
      when GNAT_PREP_ELSIF_ID => return False;
      when GNAT_PREP_ELSE_ID => return False;
      when GNAT_PREP_END_IF_ID => return False;
      when CONFLICT_MARK_A_ID => return False;
      when CONFLICT_MARK_B_ID => return False;
      when CONFLICT_MARK_END_ID => return False;
      when PLACEHOLDER_ID => return False;
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
      when COMMENT_ID => return 2;
      when GNAT_PREP_IF_ID => return 3;
      when GNAT_PREP_ELSIF_ID => return 6;
      when GNAT_PREP_ELSE_ID => return 5;
      when GNAT_PREP_END_IF_ID => return 7;
      when CONFLICT_MARK_A_ID => return 7;
      when CONFLICT_MARK_B_ID => return 7;
      when CONFLICT_MARK_END_ID => return 7;
      when PLACEHOLDER_ID => return 1;
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
         GNAT_PREP_IF_ID |
         GNAT_PREP_ELSIF_ID |
         GNAT_PREP_ELSE_ID |
         GNAT_PREP_END_IF_ID |
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
         when COMMENT_ID => True,
         when GNAT_PREP_IF_ID => True,
         when GNAT_PREP_ELSIF_ID => True,
         when GNAT_PREP_ELSE_ID => True,
         when GNAT_PREP_END_IF_ID => True,
         when CONFLICT_MARK_A_ID => True,
         when CONFLICT_MARK_B_ID => True,
         when CONFLICT_MARK_END_ID => True,
         when PLACEHOLDER_ID => True,
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
         when COMMENT_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when GNAT_PREP_IF_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when GNAT_PREP_ELSIF_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when GNAT_PREP_ELSE_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when GNAT_PREP_END_IF_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when CONFLICT_MARK_A_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when CONFLICT_MARK_B_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when CONFLICT_MARK_END_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when PLACEHOLDER_ID => WisiToken.Lexer.Find_String (Source, Token_Start, "}"),
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
         when COMMENT_ID =>
         (if Inserted then Region.Last
          elsif Start then Region.Last
          else Lexer.Find_New_Line (Source, Region.Last)),
         when GNAT_PREP_IF_ID =>
         (if Inserted then Region.Last
          elsif Start then Region.Last
          else Lexer.Find_New_Line (Source, Region.Last)),
         when GNAT_PREP_ELSIF_ID =>
         (if Inserted then Region.Last
          elsif Start then Region.Last
          else Lexer.Find_New_Line (Source, Region.Last)),
         when GNAT_PREP_ELSE_ID =>
         (if Inserted then Region.Last
          elsif Start then Region.Last
          else Lexer.Find_New_Line (Source, Region.Last)),
         when GNAT_PREP_END_IF_ID =>
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
         when PLACEHOLDER_ID =>
         (if Inserted then Region.Last
          elsif Start then Region.Last
          else Lexer.Find_String_Or_New_Line (Source, Region.Last, "{")),
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
         when COMMENT_ID => Lexer.Find_New_Line (Source, Region),
         when GNAT_PREP_IF_ID => Lexer.Find_New_Line (Source, Region),
         when GNAT_PREP_ELSIF_ID => Lexer.Find_New_Line (Source, Region),
         when GNAT_PREP_ELSE_ID => Lexer.Find_New_Line (Source, Region),
         when GNAT_PREP_END_IF_ID => Lexer.Find_New_Line (Source, Region),
         when CONFLICT_MARK_A_ID => Lexer.Find_New_Line (Source, Region),
         when CONFLICT_MARK_B_ID => Lexer.Find_New_Line (Source, Region),
         when CONFLICT_MARK_END_ID => Lexer.Find_New_Line (Source, Region),
         when PLACEHOLDER_ID => Lexer.Find_String_Or_New_Line (Source, Region, "}"),
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
      when GNAT_PREP_IF_ID => return Token.Char_Region.Last + 1;
      when GNAT_PREP_ELSIF_ID => return Token.Char_Region.Last + 1;
      when GNAT_PREP_ELSE_ID => return Token.Char_Region.Last + 1;
      when GNAT_PREP_END_IF_ID => return Token.Char_Region.Last + 1;
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
      when GNAT_PREP_IF_ID => return True;
      when GNAT_PREP_ELSIF_ID => return True;
      when GNAT_PREP_ELSE_ID => return True;
      when GNAT_PREP_END_IF_ID => return True;
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
      when GNAT_PREP_IF_ID => return True;
      when GNAT_PREP_ELSIF_ID => return True;
      when GNAT_PREP_ELSE_ID => return True;
      when GNAT_PREP_END_IF_ID => return True;
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
        (First_Terminal    => 11,
         Last_Terminal     => 119,
         First_Nonterminal => 120,
         Last_Nonterminal  => 466,
         Insert =>
           (4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 7, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2, 4, 4, 4, 4,
            4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2, 4, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
            4, 4, 4, 4, 3, 4, 4, 4, 4, 4, 4, 4, 3, 4, 4, 4, 3, 4, 4, 4, 4, 4, 4, 4, 4, 3, 4, 4, 4, 4, 4, 4, 4, 2, 4, 4,
            4),
         Delete =>
           (3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
            3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
            3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
            3),
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
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         Undo_Reduce =>
           (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
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

   function Create_Lexer (Trace : in WisiToken.Trace_Access) return WisiToken.Lexer.Handle
   is begin
      return Lexer.New_Lexer (Trace, Ada_Annex_P_Process_Actions.Descriptor'Access);
   end Create_Lexer;

   function Create_Productions return WisiToken.Syntax_Trees.Production_Info_Trees.Vector
   is begin
      return Result : WisiToken.Syntax_Trees.Production_Info_Trees.Vector do
         Result.Set_First_Last (120, 466);
         Result (123).RHSs.Set_First_Last (0, 1);
         Result (123).RHSs (0).In_Parse_Action := null;
         Result (123).RHSs (0).Post_Parse_Action := pragma_argument_association_list_0'Access;
         Result (123).RHSs (1).In_Parse_Action := null;
         Result (123).RHSs (1).Post_Parse_Action := pragma_argument_association_list_1'Access;
         Result (124).RHSs.Set_First_Last (0, 3);
         Result (124).RHSs (0).In_Parse_Action := null;
         Result (124).RHSs (0).Post_Parse_Action := pragma_g_0'Access;
         Result (124).RHSs (1).In_Parse_Action := null;
         Result (124).RHSs (1).Post_Parse_Action := pragma_g_1'Access;
         Result (124).RHSs (2).In_Parse_Action := null;
         Result (124).RHSs (2).Post_Parse_Action := pragma_g_2'Access;
         Result (124).RHSs (3).In_Parse_Action := null;
         Result (124).RHSs (3).Post_Parse_Action := pragma_g_3'Access;
         Result (128).RHSs.Set_First_Last (0, 5);
         Result (128).RHSs (0).In_Parse_Action := null;
         Result (128).RHSs (0).Post_Parse_Action := full_type_declaration_0'Access;
         Result (128).RHSs (1).In_Parse_Action := null;
         Result (128).RHSs (1).Post_Parse_Action := full_type_declaration_1'Access;
         Result (128).RHSs (2).In_Parse_Action := null;
         Result (128).RHSs (2).Post_Parse_Action := full_type_declaration_2'Access;
         Result (128).RHSs (3).In_Parse_Action := null;
         Result (128).RHSs (3).Post_Parse_Action := full_type_declaration_3'Access;
         Result (128).RHSs (4).In_Parse_Action := null;
         Result (128).RHSs (4).Post_Parse_Action := null;
         Result (128).RHSs (5).In_Parse_Action := null;
         Result (128).RHSs (5).Post_Parse_Action := null;
         Result (130).RHSs.Set_First_Last (0, 1);
         Result (130).RHSs (0).In_Parse_Action := null;
         Result (130).RHSs (0).Post_Parse_Action := subtype_declaration_0'Access;
         Result (130).RHSs (1).In_Parse_Action := null;
         Result (130).RHSs (1).Post_Parse_Action := subtype_declaration_1'Access;
         Result (135).RHSs.Set_First_Last (0, 49);
         Result (135).RHSs (0).In_Parse_Action := null;
         Result (135).RHSs (0).Post_Parse_Action := object_declaration_0'Access;
         Result (135).RHSs (1).In_Parse_Action := null;
         Result (135).RHSs (1).Post_Parse_Action := object_declaration_1'Access;
         Result (135).RHSs (2).In_Parse_Action := null;
         Result (135).RHSs (2).Post_Parse_Action := object_declaration_2'Access;
         Result (135).RHSs (3).In_Parse_Action := null;
         Result (135).RHSs (3).Post_Parse_Action := object_declaration_3'Access;
         Result (135).RHSs (4).In_Parse_Action := null;
         Result (135).RHSs (4).Post_Parse_Action := object_declaration_4'Access;
         Result (135).RHSs (5).In_Parse_Action := null;
         Result (135).RHSs (5).Post_Parse_Action := object_declaration_5'Access;
         Result (135).RHSs (6).In_Parse_Action := null;
         Result (135).RHSs (6).Post_Parse_Action := object_declaration_6'Access;
         Result (135).RHSs (7).In_Parse_Action := null;
         Result (135).RHSs (7).Post_Parse_Action := object_declaration_7'Access;
         Result (135).RHSs (8).In_Parse_Action := null;
         Result (135).RHSs (8).Post_Parse_Action := object_declaration_8'Access;
         Result (135).RHSs (9).In_Parse_Action := null;
         Result (135).RHSs (9).Post_Parse_Action := object_declaration_9'Access;
         Result (135).RHSs (10).In_Parse_Action := null;
         Result (135).RHSs (10).Post_Parse_Action := object_declaration_10'Access;
         Result (135).RHSs (11).In_Parse_Action := null;
         Result (135).RHSs (11).Post_Parse_Action := object_declaration_11'Access;
         Result (135).RHSs (12).In_Parse_Action := null;
         Result (135).RHSs (12).Post_Parse_Action := object_declaration_12'Access;
         Result (135).RHSs (13).In_Parse_Action := null;
         Result (135).RHSs (13).Post_Parse_Action := object_declaration_13'Access;
         Result (135).RHSs (14).In_Parse_Action := null;
         Result (135).RHSs (14).Post_Parse_Action := object_declaration_14'Access;
         Result (135).RHSs (15).In_Parse_Action := null;
         Result (135).RHSs (15).Post_Parse_Action := object_declaration_15'Access;
         Result (135).RHSs (16).In_Parse_Action := null;
         Result (135).RHSs (16).Post_Parse_Action := object_declaration_16'Access;
         Result (135).RHSs (17).In_Parse_Action := null;
         Result (135).RHSs (17).Post_Parse_Action := object_declaration_17'Access;
         Result (135).RHSs (18).In_Parse_Action := null;
         Result (135).RHSs (18).Post_Parse_Action := object_declaration_18'Access;
         Result (135).RHSs (19).In_Parse_Action := null;
         Result (135).RHSs (19).Post_Parse_Action := object_declaration_19'Access;
         Result (135).RHSs (20).In_Parse_Action := null;
         Result (135).RHSs (20).Post_Parse_Action := object_declaration_20'Access;
         Result (135).RHSs (21).In_Parse_Action := null;
         Result (135).RHSs (21).Post_Parse_Action := object_declaration_21'Access;
         Result (135).RHSs (22).In_Parse_Action := null;
         Result (135).RHSs (22).Post_Parse_Action := object_declaration_22'Access;
         Result (135).RHSs (23).In_Parse_Action := null;
         Result (135).RHSs (23).Post_Parse_Action := object_declaration_23'Access;
         Result (135).RHSs (24).In_Parse_Action := null;
         Result (135).RHSs (24).Post_Parse_Action := object_declaration_24'Access;
         Result (135).RHSs (25).In_Parse_Action := null;
         Result (135).RHSs (25).Post_Parse_Action := object_declaration_25'Access;
         Result (135).RHSs (26).In_Parse_Action := null;
         Result (135).RHSs (26).Post_Parse_Action := object_declaration_26'Access;
         Result (135).RHSs (27).In_Parse_Action := null;
         Result (135).RHSs (27).Post_Parse_Action := object_declaration_27'Access;
         Result (135).RHSs (28).In_Parse_Action := null;
         Result (135).RHSs (28).Post_Parse_Action := object_declaration_28'Access;
         Result (135).RHSs (29).In_Parse_Action := null;
         Result (135).RHSs (29).Post_Parse_Action := object_declaration_29'Access;
         Result (135).RHSs (30).In_Parse_Action := null;
         Result (135).RHSs (30).Post_Parse_Action := object_declaration_30'Access;
         Result (135).RHSs (31).In_Parse_Action := null;
         Result (135).RHSs (31).Post_Parse_Action := object_declaration_31'Access;
         Result (135).RHSs (32).In_Parse_Action := null;
         Result (135).RHSs (32).Post_Parse_Action := object_declaration_32'Access;
         Result (135).RHSs (33).In_Parse_Action := null;
         Result (135).RHSs (33).Post_Parse_Action := object_declaration_33'Access;
         Result (135).RHSs (34).In_Parse_Action := null;
         Result (135).RHSs (34).Post_Parse_Action := object_declaration_34'Access;
         Result (135).RHSs (35).In_Parse_Action := null;
         Result (135).RHSs (35).Post_Parse_Action := object_declaration_35'Access;
         Result (135).RHSs (36).In_Parse_Action := null;
         Result (135).RHSs (36).Post_Parse_Action := object_declaration_36'Access;
         Result (135).RHSs (37).In_Parse_Action := null;
         Result (135).RHSs (37).Post_Parse_Action := object_declaration_37'Access;
         Result (135).RHSs (38).In_Parse_Action := null;
         Result (135).RHSs (38).Post_Parse_Action := object_declaration_38'Access;
         Result (135).RHSs (39).In_Parse_Action := null;
         Result (135).RHSs (39).Post_Parse_Action := object_declaration_39'Access;
         Result (135).RHSs (40).In_Parse_Action := null;
         Result (135).RHSs (40).Post_Parse_Action := object_declaration_40'Access;
         Result (135).RHSs (41).In_Parse_Action := null;
         Result (135).RHSs (41).Post_Parse_Action := object_declaration_41'Access;
         Result (135).RHSs (42).In_Parse_Action := null;
         Result (135).RHSs (42).Post_Parse_Action := object_declaration_42'Access;
         Result (135).RHSs (43).In_Parse_Action := null;
         Result (135).RHSs (43).Post_Parse_Action := object_declaration_43'Access;
         Result (135).RHSs (44).In_Parse_Action := null;
         Result (135).RHSs (44).Post_Parse_Action := object_declaration_44'Access;
         Result (135).RHSs (45).In_Parse_Action := null;
         Result (135).RHSs (45).Post_Parse_Action := object_declaration_45'Access;
         Result (135).RHSs (46).In_Parse_Action := null;
         Result (135).RHSs (46).Post_Parse_Action := object_declaration_46'Access;
         Result (135).RHSs (47).In_Parse_Action := null;
         Result (135).RHSs (47).Post_Parse_Action := object_declaration_47'Access;
         Result (135).RHSs (48).In_Parse_Action := null;
         Result (135).RHSs (48).Post_Parse_Action := null;
         Result (135).RHSs (49).In_Parse_Action := null;
         Result (135).RHSs (49).Post_Parse_Action := null;
         Result (136).RHSs.Set_First_Last (0, 1);
         Result (136).RHSs (0).In_Parse_Action := null;
         Result (136).RHSs (0).Post_Parse_Action := defining_identifier_list_0'Access;
         Result (136).RHSs (1).In_Parse_Action := null;
         Result (136).RHSs (1).Post_Parse_Action := defining_identifier_list_1'Access;
         Result (137).RHSs.Set_First_Last (0, 0);
         Result (137).RHSs (0).In_Parse_Action := null;
         Result (137).RHSs (0).Post_Parse_Action := number_declaration_0'Access;
         Result (141).Optimized_List := True;
         Result (142).RHSs.Set_First_Last (0, 0);
         Result (142).RHSs (0).In_Parse_Action := null;
         Result (142).RHSs (0).Post_Parse_Action := enumeration_type_definition_0'Access;
         Result (144).RHSs.Set_First_Last (0, 1);
         Result (144).RHSs (0).In_Parse_Action := null;
         Result (144).RHSs (0).Post_Parse_Action := integer_type_definition_0'Access;
         Result (144).RHSs (1).In_Parse_Action := null;
         Result (144).RHSs (1).Post_Parse_Action := integer_type_definition_1'Access;
         Result (155).Optimized_List := True;
         Result (156).RHSs.Set_First_Last (0, 0);
         Result (156).RHSs (0).In_Parse_Action := null;
         Result (156).RHSs (0).Post_Parse_Action := unconstrained_array_definition_0'Access;
         Result (158).Optimized_List := True;
         Result (159).RHSs.Set_First_Last (0, 0);
         Result (159).RHSs (0).In_Parse_Action := null;
         Result (159).RHSs (0).Post_Parse_Action := constrained_array_definition_0'Access;
         Result (163).RHSs.Set_First_Last (0, 1);
         Result (163).RHSs (0).In_Parse_Action := null;
         Result (163).RHSs (0).Post_Parse_Action := discrete_range_0'Access;
         Result (163).RHSs (1).In_Parse_Action := null;
         Result (163).RHSs (1).Post_Parse_Action := discrete_range_1'Access;
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
         Result (186).RHSs.Set_First_Last (0, 1);
         Result (186).RHSs (0).In_Parse_Action := null;
         Result (186).RHSs (0).Post_Parse_Action := access_to_subprogram_definition_0'Access;
         Result (186).RHSs (1).In_Parse_Action := null;
         Result (186).RHSs (1).Post_Parse_Action := access_to_subprogram_definition_1'Access;
         Result (188).RHSs.Set_First_Last (0, 11);
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
         Result (189).RHSs.Set_First_Last (0, 3);
         Result (189).RHSs (0).In_Parse_Action := null;
         Result (189).RHSs (0).Post_Parse_Action := incomplete_type_declaration_0'Access;
         Result (189).RHSs (1).In_Parse_Action := null;
         Result (189).RHSs (1).Post_Parse_Action := incomplete_type_declaration_1'Access;
         Result (189).RHSs (2).In_Parse_Action := null;
         Result (189).RHSs (2).Post_Parse_Action := incomplete_type_declaration_2'Access;
         Result (189).RHSs (3).In_Parse_Action := null;
         Result (189).RHSs (3).Post_Parse_Action := incomplete_type_declaration_3'Access;
         Result (195).RHSs.Set_First_Last (0, 8);
         Result (195).RHSs (0).In_Parse_Action := name_0_check'Access;
         Result (195).RHSs (0).Post_Parse_Action := null;
         Result (195).RHSs (1).In_Parse_Action := null;
         Result (195).RHSs (1).Post_Parse_Action := null;
         Result (195).RHSs (2).In_Parse_Action := null;
         Result (195).RHSs (2).Post_Parse_Action := null;
         Result (195).RHSs (3).In_Parse_Action := name_3_check'Access;
         Result (195).RHSs (3).Post_Parse_Action := null;
         Result (195).RHSs (4).In_Parse_Action := null;
         Result (195).RHSs (4).Post_Parse_Action := null;
         Result (195).RHSs (5).In_Parse_Action := null;
         Result (195).RHSs (5).Post_Parse_Action := null;
         Result (195).RHSs (6).In_Parse_Action := null;
         Result (195).RHSs (6).Post_Parse_Action := null;
         Result (195).RHSs (7).In_Parse_Action := null;
         Result (195).RHSs (7).Post_Parse_Action := null;
         Result (195).RHSs (8).In_Parse_Action := null;
         Result (195).RHSs (8).Post_Parse_Action := null;
         Result (196).RHSs.Set_First_Last (0, 1);
         Result (196).RHSs (0).In_Parse_Action := direct_name_0_check'Access;
         Result (196).RHSs (0).Post_Parse_Action := direct_name_0'Access;
         Result (196).RHSs (1).In_Parse_Action := direct_name_1_check'Access;
         Result (196).RHSs (1).Post_Parse_Action := null;
         Result (198).RHSs.Set_First_Last (0, 0);
         Result (198).RHSs (0).In_Parse_Action := null;
         Result (198).RHSs (0).Post_Parse_Action := slice_0'Access;
         Result (199).RHSs.Set_First_Last (0, 0);
         Result (199).RHSs (0).In_Parse_Action := selected_component_0_check'Access;
         Result (199).RHSs (0).Post_Parse_Action := selected_component_0'Access;
         Result (204).RHSs.Set_First_Last (0, 1);
         Result (204).RHSs (0).In_Parse_Action := null;
         Result (204).RHSs (0).Post_Parse_Action := range_attribute_designator_0'Access;
         Result (204).RHSs (1).In_Parse_Action := null;
         Result (204).RHSs (1).Post_Parse_Action := range_attribute_designator_1'Access;
         Result (205).RHSs.Set_First_Last (0, 6);
         Result (205).RHSs (0).In_Parse_Action := null;
         Result (205).RHSs (0).Post_Parse_Action := null;
         Result (205).RHSs (1).In_Parse_Action := null;
         Result (205).RHSs (1).Post_Parse_Action := null;
         Result (205).RHSs (2).In_Parse_Action := null;
         Result (205).RHSs (2).Post_Parse_Action := null;
         Result (205).RHSs (3).In_Parse_Action := null;
         Result (205).RHSs (3).Post_Parse_Action := null;
         Result (205).RHSs (4).In_Parse_Action := null;
         Result (205).RHSs (4).Post_Parse_Action := aggregate_4'Access;
         Result (205).RHSs (5).In_Parse_Action := null;
         Result (205).RHSs (5).Post_Parse_Action := aggregate_5'Access;
         Result (205).RHSs (6).In_Parse_Action := null;
         Result (205).RHSs (6).Post_Parse_Action := aggregate_6'Access;
         Result (206).RHSs.Set_First_Last (0, 0);
         Result (206).RHSs (0).In_Parse_Action := null;
         Result (206).RHSs (0).Post_Parse_Action := record_aggregate_0'Access;
         Result (208).RHSs.Set_First_Last (0, 1);
         Result (208).RHSs (0).In_Parse_Action := null;
         Result (208).RHSs (0).Post_Parse_Action := record_component_association_0'Access;
         Result (208).RHSs (1).In_Parse_Action := null;
         Result (208).RHSs (1).Post_Parse_Action := record_component_association_1'Access;
         Result (209).RHSs.Set_First_Last (0, 1);
         Result (209).RHSs (0).In_Parse_Action := null;
         Result (209).RHSs (0).Post_Parse_Action := null;
         Result (209).RHSs (1).In_Parse_Action := null;
         Result (209).RHSs (1).Post_Parse_Action := component_choice_list_1'Access;
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
         Result (221).RHSs.Set_First_Last (0, 3);
         Result (221).RHSs (0).In_Parse_Action := null;
         Result (221).RHSs (0).Post_Parse_Action := iterated_element_association_0'Access;
         Result (221).RHSs (1).In_Parse_Action := null;
         Result (221).RHSs (1).Post_Parse_Action := iterated_element_association_1'Access;
         Result (221).RHSs (2).In_Parse_Action := null;
         Result (221).RHSs (2).Post_Parse_Action := iterated_element_association_2'Access;
         Result (221).RHSs (3).In_Parse_Action := null;
         Result (221).RHSs (3).Post_Parse_Action := iterated_element_association_3'Access;
         Result (229).Optimized_List := True;
         Result (230).RHSs.Set_First_Last (0, 1);
         Result (230).RHSs (0).In_Parse_Action := null;
         Result (230).RHSs (0).Post_Parse_Action := membership_choice_0'Access;
         Result (230).RHSs (1).In_Parse_Action := null;
         Result (230).RHSs (1).Post_Parse_Action := membership_choice_1'Access;
         Result (232).Optimized_List := True;
         Result (234).RHSs.Set_First_Last (0, 4);
         Result (234).RHSs (0).In_Parse_Action := null;
         Result (234).RHSs (0).Post_Parse_Action := primary_0'Access;
         Result (234).RHSs (1).In_Parse_Action := null;
         Result (234).RHSs (1).Post_Parse_Action := null;
         Result (234).RHSs (2).In_Parse_Action := null;
         Result (234).RHSs (2).Post_Parse_Action := primary_2'Access;
         Result (234).RHSs (3).In_Parse_Action := null;
         Result (234).RHSs (3).Post_Parse_Action := null;
         Result (234).RHSs (4).In_Parse_Action := null;
         Result (234).RHSs (4).Post_Parse_Action := null;
         Result (240).RHSs.Set_First_Last (0, 0);
         Result (240).RHSs (0).In_Parse_Action := null;
         Result (240).RHSs (0).Post_Parse_Action := elsif_expression_item_0'Access;
         Result (241).RHSs.Set_First_Last (0, 1);
         Result (241).RHSs (0).In_Parse_Action := null;
         Result (241).RHSs (0).Post_Parse_Action := null;
         Result (241).RHSs (1).In_Parse_Action := null;
         Result (241).RHSs (1).Post_Parse_Action := elsif_expression_list_1'Access;
         Result (242).RHSs.Set_First_Last (0, 3);
         Result (242).RHSs (0).In_Parse_Action := null;
         Result (242).RHSs (0).Post_Parse_Action := if_expression_0'Access;
         Result (242).RHSs (1).In_Parse_Action := null;
         Result (242).RHSs (1).Post_Parse_Action := if_expression_1'Access;
         Result (242).RHSs (2).In_Parse_Action := null;
         Result (242).RHSs (2).Post_Parse_Action := if_expression_2'Access;
         Result (242).RHSs (3).In_Parse_Action := null;
         Result (242).RHSs (3).Post_Parse_Action := if_expression_3'Access;
         Result (244).RHSs.Set_First_Last (0, 1);
         Result (244).RHSs (0).In_Parse_Action := null;
         Result (244).RHSs (0).Post_Parse_Action := null;
         Result (244).RHSs (1).In_Parse_Action := null;
         Result (244).RHSs (1).Post_Parse_Action := case_expression_alternative_list_1'Access;
         Result (245).RHSs.Set_First_Last (0, 0);
         Result (245).RHSs (0).In_Parse_Action := null;
         Result (245).RHSs (0).Post_Parse_Action := case_expression_0'Access;
         Result (246).RHSs.Set_First_Last (0, 0);
         Result (246).RHSs (0).In_Parse_Action := null;
         Result (246).RHSs (0).Post_Parse_Action := case_expression_alternative_0'Access;
         Result (247).RHSs.Set_First_Last (0, 1);
         Result (247).RHSs (0).In_Parse_Action := null;
         Result (247).RHSs (0).Post_Parse_Action := quantified_expression_0'Access;
         Result (247).RHSs (1).In_Parse_Action := null;
         Result (247).RHSs (1).Post_Parse_Action := quantified_expression_1'Access;
         Result (249).RHSs.Set_First_Last (0, 1);
         Result (249).RHSs (0).In_Parse_Action := null;
         Result (249).RHSs (0).Post_Parse_Action := declare_expression_0'Access;
         Result (249).RHSs (1).In_Parse_Action := null;
         Result (249).RHSs (1).Post_Parse_Action := declare_expression_1'Access;
         Result (254).RHSs.Set_First_Last (0, 0);
         Result (254).RHSs (0).In_Parse_Action := null;
         Result (254).RHSs (0).Post_Parse_Action := reduction_specification_0'Access;
         Result (255).RHSs.Set_First_Last (0, 0);
         Result (255).RHSs (0).In_Parse_Action := null;
         Result (255).RHSs (0).Post_Parse_Action := qualified_expression_0'Access;
         Result (257).RHSs.Set_First_Last (0, 3);
         Result (257).RHSs (0).In_Parse_Action := null;
         Result (257).RHSs (0).Post_Parse_Action := null;
         Result (257).RHSs (1).In_Parse_Action := null;
         Result (257).RHSs (1).Post_Parse_Action := null;
         Result (257).RHSs (2).In_Parse_Action := null;
         Result (257).RHSs (2).Post_Parse_Action := subtype_indication_paren_constraint_2'Access;
         Result (257).RHSs (3).In_Parse_Action := null;
         Result (257).RHSs (3).Post_Parse_Action := subtype_indication_paren_constraint_3'Access;
         Result (264).RHSs.Set_First_Last (0, 0);
         Result (264).RHSs (0).In_Parse_Action := null;
         Result (264).RHSs (0).Post_Parse_Action := null_statement_0'Access;
         Result (265).RHSs.Set_First_Last (0, 0);
         Result (265).RHSs (0).In_Parse_Action := null;
         Result (265).RHSs (0).Post_Parse_Action := label_0'Access;
         Result (267).RHSs.Set_First_Last (0, 0);
         Result (267).RHSs (0).In_Parse_Action := null;
         Result (267).RHSs (0).Post_Parse_Action := assignment_statement_0'Access;
         Result (269).RHSs.Set_First_Last (0, 0);
         Result (269).RHSs (0).In_Parse_Action := null;
         Result (269).RHSs (0).Post_Parse_Action := elsif_statement_item_0'Access;
         Result (271).RHSs.Set_First_Last (0, 3);
         Result (271).RHSs (0).In_Parse_Action := null;
         Result (271).RHSs (0).Post_Parse_Action := if_statement_0'Access;
         Result (271).RHSs (1).In_Parse_Action := null;
         Result (271).RHSs (1).Post_Parse_Action := if_statement_1'Access;
         Result (271).RHSs (2).In_Parse_Action := null;
         Result (271).RHSs (2).Post_Parse_Action := if_statement_2'Access;
         Result (271).RHSs (3).In_Parse_Action := null;
         Result (271).RHSs (3).Post_Parse_Action := if_statement_3'Access;
         Result (273).RHSs.Set_First_Last (0, 0);
         Result (273).RHSs (0).In_Parse_Action := null;
         Result (273).RHSs (0).Post_Parse_Action := case_statement_0'Access;
         Result (274).RHSs.Set_First_Last (0, 0);
         Result (274).RHSs (0).In_Parse_Action := null;
         Result (274).RHSs (0).Post_Parse_Action := case_statement_alternative_0'Access;
         Result (275).RHSs.Set_First_Last (0, 1);
         Result (275).RHSs (0).In_Parse_Action := loop_statement_0_check'Access;
         Result (275).RHSs (0).Post_Parse_Action := loop_statement_0'Access;
         Result (275).RHSs (1).In_Parse_Action := loop_statement_1_check'Access;
         Result (275).RHSs (1).Post_Parse_Action := loop_statement_1'Access;
         Result (276).RHSs.Set_First_Last (0, 8);
         Result (276).RHSs (0).In_Parse_Action := null;
         Result (276).RHSs (0).Post_Parse_Action := iteration_scheme_0'Access;
         Result (276).RHSs (1).In_Parse_Action := null;
         Result (276).RHSs (1).Post_Parse_Action := iteration_scheme_1'Access;
         Result (276).RHSs (2).In_Parse_Action := null;
         Result (276).RHSs (2).Post_Parse_Action := iteration_scheme_2'Access;
         Result (276).RHSs (3).In_Parse_Action := null;
         Result (276).RHSs (3).Post_Parse_Action := iteration_scheme_3'Access;
         Result (276).RHSs (4).In_Parse_Action := null;
         Result (276).RHSs (4).Post_Parse_Action := iteration_scheme_4'Access;
         Result (276).RHSs (5).In_Parse_Action := null;
         Result (276).RHSs (5).Post_Parse_Action := iteration_scheme_5'Access;
         Result (276).RHSs (6).In_Parse_Action := null;
         Result (276).RHSs (6).Post_Parse_Action := iteration_scheme_6'Access;
         Result (276).RHSs (7).In_Parse_Action := null;
         Result (276).RHSs (7).Post_Parse_Action := iteration_scheme_7'Access;
         Result (276).RHSs (8).In_Parse_Action := null;
         Result (276).RHSs (8).Post_Parse_Action := iteration_scheme_8'Access;
         Result (277).RHSs.Set_First_Last (0, 1);
         Result (277).RHSs (0).In_Parse_Action := null;
         Result (277).RHSs (0).Post_Parse_Action := chunk_specification_0'Access;
         Result (277).RHSs (1).In_Parse_Action := null;
         Result (277).RHSs (1).Post_Parse_Action := chunk_specification_1'Access;
         Result (285).RHSs.Set_First_Last (0, 1);
         Result (285).RHSs (0).In_Parse_Action := label_opt_0_check'Access;
         Result (285).RHSs (0).Post_Parse_Action := null;
         Result (285).RHSs (1).In_Parse_Action := null;
         Result (285).RHSs (1).Post_Parse_Action := null;
         Result (286).RHSs.Set_First_Last (0, 1);
         Result (286).RHSs (0).In_Parse_Action := block_statement_0_check'Access;
         Result (286).RHSs (0).Post_Parse_Action := block_statement_0'Access;
         Result (286).RHSs (1).In_Parse_Action := block_statement_1_check'Access;
         Result (286).RHSs (1).Post_Parse_Action := block_statement_1'Access;
         Result (287).RHSs.Set_First_Last (0, 1);
         Result (287).RHSs (0).In_Parse_Action := null;
         Result (287).RHSs (0).Post_Parse_Action := null;
         Result (287).RHSs (1).In_Parse_Action := null;
         Result (287).RHSs (1).Post_Parse_Action := statement_AND_list_1'Access;
         Result (288).RHSs.Set_First_Last (0, 0);
         Result (288).RHSs (0).In_Parse_Action := null;
         Result (288).RHSs (0).Post_Parse_Action := parallel_block_statement_0'Access;
         Result (289).RHSs.Set_First_Last (0, 3);
         Result (289).RHSs (0).In_Parse_Action := null;
         Result (289).RHSs (0).Post_Parse_Action := exit_statement_0'Access;
         Result (289).RHSs (1).In_Parse_Action := null;
         Result (289).RHSs (1).Post_Parse_Action := exit_statement_1'Access;
         Result (289).RHSs (2).In_Parse_Action := null;
         Result (289).RHSs (2).Post_Parse_Action := exit_statement_2'Access;
         Result (289).RHSs (3).In_Parse_Action := null;
         Result (289).RHSs (3).Post_Parse_Action := exit_statement_3'Access;
         Result (290).RHSs.Set_First_Last (0, 0);
         Result (290).RHSs (0).In_Parse_Action := null;
         Result (290).RHSs (0).Post_Parse_Action := goto_statement_0'Access;
         Result (291).RHSs.Set_First_Last (0, 3);
         Result (291).RHSs (0).In_Parse_Action := null;
         Result (291).RHSs (0).Post_Parse_Action := subprogram_declaration_0'Access;
         Result (291).RHSs (1).In_Parse_Action := null;
         Result (291).RHSs (1).Post_Parse_Action := subprogram_declaration_1'Access;
         Result (291).RHSs (2).In_Parse_Action := null;
         Result (291).RHSs (2).Post_Parse_Action := subprogram_declaration_2'Access;
         Result (291).RHSs (3).In_Parse_Action := null;
         Result (291).RHSs (3).Post_Parse_Action := subprogram_declaration_3'Access;
         Result (292).RHSs.Set_First_Last (0, 1);
         Result (292).RHSs (0).In_Parse_Action := subprogram_specification_0_check'Access;
         Result (292).RHSs (0).Post_Parse_Action := null;
         Result (292).RHSs (1).In_Parse_Action := subprogram_specification_1_check'Access;
         Result (292).RHSs (1).Post_Parse_Action := null;
         Result (293).RHSs.Set_First_Last (0, 0);
         Result (293).RHSs (0).In_Parse_Action := procedure_specification_0_check'Access;
         Result (293).RHSs (0).Post_Parse_Action := procedure_specification_0'Access;
         Result (294).RHSs.Set_First_Last (0, 0);
         Result (294).RHSs (0).In_Parse_Action := function_specification_0_check'Access;
         Result (294).RHSs (0).Post_Parse_Action := function_specification_0'Access;
         Result (296).RHSs.Set_First_Last (0, 2);
         Result (296).RHSs (0).In_Parse_Action := null;
         Result (296).RHSs (0).Post_Parse_Action := result_profile_0'Access;
         Result (296).RHSs (1).In_Parse_Action := null;
         Result (296).RHSs (1).Post_Parse_Action := result_profile_1'Access;
         Result (296).RHSs (2).In_Parse_Action := null;
         Result (296).RHSs (2).Post_Parse_Action := result_profile_2'Access;
         Result (297).RHSs.Set_First_Last (0, 1);
         Result (297).RHSs (0).In_Parse_Action := null;
         Result (297).RHSs (0).Post_Parse_Action := parameter_and_result_profile_0'Access;
         Result (297).RHSs (1).In_Parse_Action := null;
         Result (297).RHSs (1).Post_Parse_Action := null;
         Result (298).Optimized_List := True;
         Result (299).RHSs.Set_First_Last (0, 0);
         Result (299).RHSs (0).In_Parse_Action := null;
         Result (299).RHSs (0).Post_Parse_Action := formal_part_0'Access;
         Result (300).RHSs.Set_First_Last (0, 9);
         Result (300).RHSs (0).In_Parse_Action := null;
         Result (300).RHSs (0).Post_Parse_Action := parameter_specification_0'Access;
         Result (300).RHSs (1).In_Parse_Action := null;
         Result (300).RHSs (1).Post_Parse_Action := parameter_specification_1'Access;
         Result (300).RHSs (2).In_Parse_Action := null;
         Result (300).RHSs (2).Post_Parse_Action := parameter_specification_2'Access;
         Result (300).RHSs (3).In_Parse_Action := null;
         Result (300).RHSs (3).Post_Parse_Action := parameter_specification_3'Access;
         Result (300).RHSs (4).In_Parse_Action := null;
         Result (300).RHSs (4).Post_Parse_Action := parameter_specification_4'Access;
         Result (300).RHSs (5).In_Parse_Action := null;
         Result (300).RHSs (5).Post_Parse_Action := parameter_specification_5'Access;
         Result (300).RHSs (6).In_Parse_Action := null;
         Result (300).RHSs (6).Post_Parse_Action := parameter_specification_6'Access;
         Result (300).RHSs (7).In_Parse_Action := null;
         Result (300).RHSs (7).Post_Parse_Action := parameter_specification_7'Access;
         Result (300).RHSs (8).In_Parse_Action := null;
         Result (300).RHSs (8).Post_Parse_Action := parameter_specification_8'Access;
         Result (300).RHSs (9).In_Parse_Action := null;
         Result (300).RHSs (9).Post_Parse_Action := parameter_specification_9'Access;
         Result (306).Optimized_List := True;
         Result (308).RHSs.Set_First_Last (0, 1);
         Result (308).RHSs (0).In_Parse_Action := name_opt_0_check'Access;
         Result (308).RHSs (0).Post_Parse_Action := null;
         Result (308).RHSs (1).In_Parse_Action := null;
         Result (308).RHSs (1).Post_Parse_Action := null;
         Result (309).RHSs.Set_First_Last (0, 3);
         Result (309).RHSs (0).In_Parse_Action := subprogram_body_0_check'Access;
         Result (309).RHSs (0).Post_Parse_Action := subprogram_body_0'Access;
         Result (309).RHSs (1).In_Parse_Action := subprogram_body_1_check'Access;
         Result (309).RHSs (1).Post_Parse_Action := subprogram_body_1'Access;
         Result (309).RHSs (2).In_Parse_Action := subprogram_body_2_check'Access;
         Result (309).RHSs (2).Post_Parse_Action := subprogram_body_2'Access;
         Result (309).RHSs (3).In_Parse_Action := subprogram_body_3_check'Access;
         Result (309).RHSs (3).Post_Parse_Action := subprogram_body_3'Access;
         Result (310).RHSs.Set_First_Last (0, 0);
         Result (310).RHSs (0).In_Parse_Action := null;
         Result (310).RHSs (0).Post_Parse_Action := procedure_call_statement_0'Access;
         Result (311).RHSs.Set_First_Last (0, 0);
         Result (311).RHSs (0).In_Parse_Action := null;
         Result (311).RHSs (0).Post_Parse_Action := function_call_0'Access;
         Result (313).RHSs.Set_First_Last (0, 3);
         Result (313).RHSs (0).In_Parse_Action := null;
         Result (313).RHSs (0).Post_Parse_Action := actual_parameter_part_0'Access;
         Result (313).RHSs (1).In_Parse_Action := null;
         Result (313).RHSs (1).Post_Parse_Action := actual_parameter_part_1'Access;
         Result (313).RHSs (2).In_Parse_Action := null;
         Result (313).RHSs (2).Post_Parse_Action := actual_parameter_part_2'Access;
         Result (313).RHSs (3).In_Parse_Action := null;
         Result (313).RHSs (3).Post_Parse_Action := actual_parameter_part_3'Access;
         Result (314).RHSs.Set_First_Last (0, 1);
         Result (314).RHSs (0).In_Parse_Action := null;
         Result (314).RHSs (0).Post_Parse_Action := assoc_expression_0'Access;
         Result (314).RHSs (1).In_Parse_Action := null;
         Result (314).RHSs (1).Post_Parse_Action := null;
         Result (315).RHSs.Set_First_Last (0, 2);
         Result (315).RHSs (0).In_Parse_Action := null;
         Result (315).RHSs (0).Post_Parse_Action := parameter_association_0'Access;
         Result (315).RHSs (1).In_Parse_Action := null;
         Result (315).RHSs (1).Post_Parse_Action := parameter_association_1'Access;
         Result (315).RHSs (2).In_Parse_Action := null;
         Result (315).RHSs (2).Post_Parse_Action := null;
         Result (316).RHSs.Set_First_Last (0, 1);
         Result (316).RHSs (0).In_Parse_Action := null;
         Result (316).RHSs (0).Post_Parse_Action := simple_return_statement_0'Access;
         Result (316).RHSs (1).In_Parse_Action := null;
         Result (316).RHSs (1).Post_Parse_Action := simple_return_statement_1'Access;
         Result (317).RHSs.Set_First_Last (0, 7);
         Result (317).RHSs (0).In_Parse_Action := null;
         Result (317).RHSs (0).Post_Parse_Action := extended_return_object_declaration_0'Access;
         Result (317).RHSs (1).In_Parse_Action := null;
         Result (317).RHSs (1).Post_Parse_Action := extended_return_object_declaration_1'Access;
         Result (317).RHSs (2).In_Parse_Action := null;
         Result (317).RHSs (2).Post_Parse_Action := extended_return_object_declaration_2'Access;
         Result (317).RHSs (3).In_Parse_Action := null;
         Result (317).RHSs (3).Post_Parse_Action := extended_return_object_declaration_3'Access;
         Result (317).RHSs (4).In_Parse_Action := null;
         Result (317).RHSs (4).Post_Parse_Action := extended_return_object_declaration_4'Access;
         Result (317).RHSs (5).In_Parse_Action := null;
         Result (317).RHSs (5).Post_Parse_Action := extended_return_object_declaration_5'Access;
         Result (317).RHSs (6).In_Parse_Action := null;
         Result (317).RHSs (6).Post_Parse_Action := extended_return_object_declaration_6'Access;
         Result (317).RHSs (7).In_Parse_Action := null;
         Result (317).RHSs (7).Post_Parse_Action := extended_return_object_declaration_7'Access;
         Result (318).RHSs.Set_First_Last (0, 1);
         Result (318).RHSs (0).In_Parse_Action := null;
         Result (318).RHSs (0).Post_Parse_Action := extended_return_statement_0'Access;
         Result (318).RHSs (1).In_Parse_Action := null;
         Result (318).RHSs (1).Post_Parse_Action := extended_return_statement_1'Access;
         Result (320).RHSs.Set_First_Last (0, 3);
         Result (320).RHSs (0).In_Parse_Action := null;
         Result (320).RHSs (0).Post_Parse_Action := null_procedure_declaration_0'Access;
         Result (320).RHSs (1).In_Parse_Action := null;
         Result (320).RHSs (1).Post_Parse_Action := null_procedure_declaration_1'Access;
         Result (320).RHSs (2).In_Parse_Action := null;
         Result (320).RHSs (2).Post_Parse_Action := null_procedure_declaration_2'Access;
         Result (320).RHSs (3).In_Parse_Action := null;
         Result (320).RHSs (3).Post_Parse_Action := null_procedure_declaration_3'Access;
         Result (321).RHSs.Set_First_Last (0, 3);
         Result (321).RHSs (0).In_Parse_Action := null;
         Result (321).RHSs (0).Post_Parse_Action := expression_function_declaration_0'Access;
         Result (321).RHSs (1).In_Parse_Action := null;
         Result (321).RHSs (1).Post_Parse_Action := expression_function_declaration_1'Access;
         Result (321).RHSs (2).In_Parse_Action := null;
         Result (321).RHSs (2).Post_Parse_Action := expression_function_declaration_2'Access;
         Result (321).RHSs (3).In_Parse_Action := null;
         Result (321).RHSs (3).Post_Parse_Action := expression_function_declaration_3'Access;
         Result (322).RHSs.Set_First_Last (0, 0);
         Result (322).RHSs (0).In_Parse_Action := null;
         Result (322).RHSs (0).Post_Parse_Action := package_declaration_0'Access;
         Result (324).Optimized_List := True;
         Result (325).RHSs.Set_First_Last (0, 11);
         Result (325).RHSs (0).In_Parse_Action := package_specification_0_check'Access;
         Result (325).RHSs (0).Post_Parse_Action := package_specification_0'Access;
         Result (325).RHSs (1).In_Parse_Action := package_specification_1_check'Access;
         Result (325).RHSs (1).Post_Parse_Action := package_specification_1'Access;
         Result (325).RHSs (2).In_Parse_Action := package_specification_2_check'Access;
         Result (325).RHSs (2).Post_Parse_Action := package_specification_2'Access;
         Result (325).RHSs (3).In_Parse_Action := package_specification_3_check'Access;
         Result (325).RHSs (3).Post_Parse_Action := package_specification_3'Access;
         Result (325).RHSs (4).In_Parse_Action := package_specification_4_check'Access;
         Result (325).RHSs (4).Post_Parse_Action := package_specification_4'Access;
         Result (325).RHSs (5).In_Parse_Action := package_specification_5_check'Access;
         Result (325).RHSs (5).Post_Parse_Action := package_specification_5'Access;
         Result (325).RHSs (6).In_Parse_Action := package_specification_6_check'Access;
         Result (325).RHSs (6).Post_Parse_Action := package_specification_6'Access;
         Result (325).RHSs (7).In_Parse_Action := package_specification_7_check'Access;
         Result (325).RHSs (7).Post_Parse_Action := package_specification_7'Access;
         Result (325).RHSs (8).In_Parse_Action := package_specification_8_check'Access;
         Result (325).RHSs (8).Post_Parse_Action := package_specification_8'Access;
         Result (325).RHSs (9).In_Parse_Action := package_specification_9_check'Access;
         Result (325).RHSs (9).Post_Parse_Action := package_specification_9'Access;
         Result (325).RHSs (10).In_Parse_Action := package_specification_10_check'Access;
         Result (325).RHSs (10).Post_Parse_Action := package_specification_10'Access;
         Result (325).RHSs (11).In_Parse_Action := package_specification_11_check'Access;
         Result (325).RHSs (11).Post_Parse_Action := package_specification_11'Access;
         Result (326).RHSs.Set_First_Last (0, 3);
         Result (326).RHSs (0).In_Parse_Action := package_body_0_check'Access;
         Result (326).RHSs (0).Post_Parse_Action := package_body_0'Access;
         Result (326).RHSs (1).In_Parse_Action := package_body_1_check'Access;
         Result (326).RHSs (1).Post_Parse_Action := package_body_1'Access;
         Result (326).RHSs (2).In_Parse_Action := package_body_2_check'Access;
         Result (326).RHSs (2).Post_Parse_Action := package_body_2'Access;
         Result (326).RHSs (3).In_Parse_Action := package_body_3_check'Access;
         Result (326).RHSs (3).Post_Parse_Action := package_body_3'Access;
         Result (327).RHSs.Set_First_Last (0, 23);
         Result (327).RHSs (0).In_Parse_Action := null;
         Result (327).RHSs (0).Post_Parse_Action := private_type_declaration_0'Access;
         Result (327).RHSs (1).In_Parse_Action := null;
         Result (327).RHSs (1).Post_Parse_Action := private_type_declaration_1'Access;
         Result (327).RHSs (2).In_Parse_Action := null;
         Result (327).RHSs (2).Post_Parse_Action := private_type_declaration_2'Access;
         Result (327).RHSs (3).In_Parse_Action := null;
         Result (327).RHSs (3).Post_Parse_Action := private_type_declaration_3'Access;
         Result (327).RHSs (4).In_Parse_Action := null;
         Result (327).RHSs (4).Post_Parse_Action := private_type_declaration_4'Access;
         Result (327).RHSs (5).In_Parse_Action := null;
         Result (327).RHSs (5).Post_Parse_Action := private_type_declaration_5'Access;
         Result (327).RHSs (6).In_Parse_Action := null;
         Result (327).RHSs (6).Post_Parse_Action := private_type_declaration_6'Access;
         Result (327).RHSs (7).In_Parse_Action := null;
         Result (327).RHSs (7).Post_Parse_Action := private_type_declaration_7'Access;
         Result (327).RHSs (8).In_Parse_Action := null;
         Result (327).RHSs (8).Post_Parse_Action := private_type_declaration_8'Access;
         Result (327).RHSs (9).In_Parse_Action := null;
         Result (327).RHSs (9).Post_Parse_Action := private_type_declaration_9'Access;
         Result (327).RHSs (10).In_Parse_Action := null;
         Result (327).RHSs (10).Post_Parse_Action := private_type_declaration_10'Access;
         Result (327).RHSs (11).In_Parse_Action := null;
         Result (327).RHSs (11).Post_Parse_Action := private_type_declaration_11'Access;
         Result (327).RHSs (12).In_Parse_Action := null;
         Result (327).RHSs (12).Post_Parse_Action := private_type_declaration_12'Access;
         Result (327).RHSs (13).In_Parse_Action := null;
         Result (327).RHSs (13).Post_Parse_Action := private_type_declaration_13'Access;
         Result (327).RHSs (14).In_Parse_Action := null;
         Result (327).RHSs (14).Post_Parse_Action := private_type_declaration_14'Access;
         Result (327).RHSs (15).In_Parse_Action := null;
         Result (327).RHSs (15).Post_Parse_Action := private_type_declaration_15'Access;
         Result (327).RHSs (16).In_Parse_Action := null;
         Result (327).RHSs (16).Post_Parse_Action := private_type_declaration_16'Access;
         Result (327).RHSs (17).In_Parse_Action := null;
         Result (327).RHSs (17).Post_Parse_Action := private_type_declaration_17'Access;
         Result (327).RHSs (18).In_Parse_Action := null;
         Result (327).RHSs (18).Post_Parse_Action := private_type_declaration_18'Access;
         Result (327).RHSs (19).In_Parse_Action := null;
         Result (327).RHSs (19).Post_Parse_Action := private_type_declaration_19'Access;
         Result (327).RHSs (20).In_Parse_Action := null;
         Result (327).RHSs (20).Post_Parse_Action := private_type_declaration_20'Access;
         Result (327).RHSs (21).In_Parse_Action := null;
         Result (327).RHSs (21).Post_Parse_Action := private_type_declaration_21'Access;
         Result (327).RHSs (22).In_Parse_Action := null;
         Result (327).RHSs (22).Post_Parse_Action := private_type_declaration_22'Access;
         Result (327).RHSs (23).In_Parse_Action := null;
         Result (327).RHSs (23).Post_Parse_Action := private_type_declaration_23'Access;
         Result (328).RHSs.Set_First_Last (0, 47);
         Result (328).RHSs (0).In_Parse_Action := null;
         Result (328).RHSs (0).Post_Parse_Action := private_extension_declaration_0'Access;
         Result (328).RHSs (1).In_Parse_Action := null;
         Result (328).RHSs (1).Post_Parse_Action := private_extension_declaration_1'Access;
         Result (328).RHSs (2).In_Parse_Action := null;
         Result (328).RHSs (2).Post_Parse_Action := private_extension_declaration_2'Access;
         Result (328).RHSs (3).In_Parse_Action := null;
         Result (328).RHSs (3).Post_Parse_Action := private_extension_declaration_3'Access;
         Result (328).RHSs (4).In_Parse_Action := null;
         Result (328).RHSs (4).Post_Parse_Action := private_extension_declaration_4'Access;
         Result (328).RHSs (5).In_Parse_Action := null;
         Result (328).RHSs (5).Post_Parse_Action := private_extension_declaration_5'Access;
         Result (328).RHSs (6).In_Parse_Action := null;
         Result (328).RHSs (6).Post_Parse_Action := private_extension_declaration_6'Access;
         Result (328).RHSs (7).In_Parse_Action := null;
         Result (328).RHSs (7).Post_Parse_Action := private_extension_declaration_7'Access;
         Result (328).RHSs (8).In_Parse_Action := null;
         Result (328).RHSs (8).Post_Parse_Action := private_extension_declaration_8'Access;
         Result (328).RHSs (9).In_Parse_Action := null;
         Result (328).RHSs (9).Post_Parse_Action := private_extension_declaration_9'Access;
         Result (328).RHSs (10).In_Parse_Action := null;
         Result (328).RHSs (10).Post_Parse_Action := private_extension_declaration_10'Access;
         Result (328).RHSs (11).In_Parse_Action := null;
         Result (328).RHSs (11).Post_Parse_Action := private_extension_declaration_11'Access;
         Result (328).RHSs (12).In_Parse_Action := null;
         Result (328).RHSs (12).Post_Parse_Action := private_extension_declaration_12'Access;
         Result (328).RHSs (13).In_Parse_Action := null;
         Result (328).RHSs (13).Post_Parse_Action := private_extension_declaration_13'Access;
         Result (328).RHSs (14).In_Parse_Action := null;
         Result (328).RHSs (14).Post_Parse_Action := private_extension_declaration_14'Access;
         Result (328).RHSs (15).In_Parse_Action := null;
         Result (328).RHSs (15).Post_Parse_Action := private_extension_declaration_15'Access;
         Result (328).RHSs (16).In_Parse_Action := null;
         Result (328).RHSs (16).Post_Parse_Action := private_extension_declaration_16'Access;
         Result (328).RHSs (17).In_Parse_Action := null;
         Result (328).RHSs (17).Post_Parse_Action := private_extension_declaration_17'Access;
         Result (328).RHSs (18).In_Parse_Action := null;
         Result (328).RHSs (18).Post_Parse_Action := private_extension_declaration_18'Access;
         Result (328).RHSs (19).In_Parse_Action := null;
         Result (328).RHSs (19).Post_Parse_Action := private_extension_declaration_19'Access;
         Result (328).RHSs (20).In_Parse_Action := null;
         Result (328).RHSs (20).Post_Parse_Action := private_extension_declaration_20'Access;
         Result (328).RHSs (21).In_Parse_Action := null;
         Result (328).RHSs (21).Post_Parse_Action := private_extension_declaration_21'Access;
         Result (328).RHSs (22).In_Parse_Action := null;
         Result (328).RHSs (22).Post_Parse_Action := private_extension_declaration_22'Access;
         Result (328).RHSs (23).In_Parse_Action := null;
         Result (328).RHSs (23).Post_Parse_Action := private_extension_declaration_23'Access;
         Result (328).RHSs (24).In_Parse_Action := null;
         Result (328).RHSs (24).Post_Parse_Action := private_extension_declaration_24'Access;
         Result (328).RHSs (25).In_Parse_Action := null;
         Result (328).RHSs (25).Post_Parse_Action := private_extension_declaration_25'Access;
         Result (328).RHSs (26).In_Parse_Action := null;
         Result (328).RHSs (26).Post_Parse_Action := private_extension_declaration_26'Access;
         Result (328).RHSs (27).In_Parse_Action := null;
         Result (328).RHSs (27).Post_Parse_Action := private_extension_declaration_27'Access;
         Result (328).RHSs (28).In_Parse_Action := null;
         Result (328).RHSs (28).Post_Parse_Action := private_extension_declaration_28'Access;
         Result (328).RHSs (29).In_Parse_Action := null;
         Result (328).RHSs (29).Post_Parse_Action := private_extension_declaration_29'Access;
         Result (328).RHSs (30).In_Parse_Action := null;
         Result (328).RHSs (30).Post_Parse_Action := private_extension_declaration_30'Access;
         Result (328).RHSs (31).In_Parse_Action := null;
         Result (328).RHSs (31).Post_Parse_Action := private_extension_declaration_31'Access;
         Result (328).RHSs (32).In_Parse_Action := null;
         Result (328).RHSs (32).Post_Parse_Action := private_extension_declaration_32'Access;
         Result (328).RHSs (33).In_Parse_Action := null;
         Result (328).RHSs (33).Post_Parse_Action := private_extension_declaration_33'Access;
         Result (328).RHSs (34).In_Parse_Action := null;
         Result (328).RHSs (34).Post_Parse_Action := private_extension_declaration_34'Access;
         Result (328).RHSs (35).In_Parse_Action := null;
         Result (328).RHSs (35).Post_Parse_Action := private_extension_declaration_35'Access;
         Result (328).RHSs (36).In_Parse_Action := null;
         Result (328).RHSs (36).Post_Parse_Action := private_extension_declaration_36'Access;
         Result (328).RHSs (37).In_Parse_Action := null;
         Result (328).RHSs (37).Post_Parse_Action := private_extension_declaration_37'Access;
         Result (328).RHSs (38).In_Parse_Action := null;
         Result (328).RHSs (38).Post_Parse_Action := private_extension_declaration_38'Access;
         Result (328).RHSs (39).In_Parse_Action := null;
         Result (328).RHSs (39).Post_Parse_Action := private_extension_declaration_39'Access;
         Result (328).RHSs (40).In_Parse_Action := null;
         Result (328).RHSs (40).Post_Parse_Action := private_extension_declaration_40'Access;
         Result (328).RHSs (41).In_Parse_Action := null;
         Result (328).RHSs (41).Post_Parse_Action := private_extension_declaration_41'Access;
         Result (328).RHSs (42).In_Parse_Action := null;
         Result (328).RHSs (42).Post_Parse_Action := private_extension_declaration_42'Access;
         Result (328).RHSs (43).In_Parse_Action := null;
         Result (328).RHSs (43).Post_Parse_Action := private_extension_declaration_43'Access;
         Result (328).RHSs (44).In_Parse_Action := null;
         Result (328).RHSs (44).Post_Parse_Action := private_extension_declaration_44'Access;
         Result (328).RHSs (45).In_Parse_Action := null;
         Result (328).RHSs (45).Post_Parse_Action := private_extension_declaration_45'Access;
         Result (328).RHSs (46).In_Parse_Action := null;
         Result (328).RHSs (46).Post_Parse_Action := private_extension_declaration_46'Access;
         Result (328).RHSs (47).In_Parse_Action := null;
         Result (328).RHSs (47).Post_Parse_Action := private_extension_declaration_47'Access;
         Result (329).RHSs.Set_First_Last (0, 1);
         Result (329).RHSs (0).In_Parse_Action := null;
         Result (329).RHSs (0).Post_Parse_Action := overriding_indicator_0'Access;
         Result (329).RHSs (1).In_Parse_Action := null;
         Result (329).RHSs (1).Post_Parse_Action := overriding_indicator_1'Access;
         Result (332).RHSs.Set_First_Last (0, 0);
         Result (332).RHSs (0).In_Parse_Action := null;
         Result (332).RHSs (0).Post_Parse_Action := use_package_clause_0'Access;
         Result (333).RHSs.Set_First_Last (0, 1);
         Result (333).RHSs (0).In_Parse_Action := null;
         Result (333).RHSs (0).Post_Parse_Action := use_type_clause_0'Access;
         Result (333).RHSs (1).In_Parse_Action := null;
         Result (333).RHSs (1).Post_Parse_Action := use_type_clause_1'Access;
         Result (335).RHSs.Set_First_Last (0, 7);
         Result (335).RHSs (0).In_Parse_Action := null;
         Result (335).RHSs (0).Post_Parse_Action := object_renaming_declaration_0'Access;
         Result (335).RHSs (1).In_Parse_Action := null;
         Result (335).RHSs (1).Post_Parse_Action := object_renaming_declaration_1'Access;
         Result (335).RHSs (2).In_Parse_Action := null;
         Result (335).RHSs (2).Post_Parse_Action := object_renaming_declaration_2'Access;
         Result (335).RHSs (3).In_Parse_Action := null;
         Result (335).RHSs (3).Post_Parse_Action := object_renaming_declaration_3'Access;
         Result (335).RHSs (4).In_Parse_Action := null;
         Result (335).RHSs (4).Post_Parse_Action := object_renaming_declaration_4'Access;
         Result (335).RHSs (5).In_Parse_Action := null;
         Result (335).RHSs (5).Post_Parse_Action := object_renaming_declaration_5'Access;
         Result (335).RHSs (6).In_Parse_Action := null;
         Result (335).RHSs (6).Post_Parse_Action := object_renaming_declaration_6'Access;
         Result (335).RHSs (7).In_Parse_Action := null;
         Result (335).RHSs (7).Post_Parse_Action := object_renaming_declaration_7'Access;
         Result (336).RHSs.Set_First_Last (0, 1);
         Result (336).RHSs (0).In_Parse_Action := null;
         Result (336).RHSs (0).Post_Parse_Action := exception_renaming_declaration_0'Access;
         Result (336).RHSs (1).In_Parse_Action := null;
         Result (336).RHSs (1).Post_Parse_Action := exception_renaming_declaration_1'Access;
         Result (337).RHSs.Set_First_Last (0, 1);
         Result (337).RHSs (0).In_Parse_Action := null;
         Result (337).RHSs (0).Post_Parse_Action := package_renaming_declaration_0'Access;
         Result (337).RHSs (1).In_Parse_Action := null;
         Result (337).RHSs (1).Post_Parse_Action := package_renaming_declaration_1'Access;
         Result (338).RHSs.Set_First_Last (0, 3);
         Result (338).RHSs (0).In_Parse_Action := null;
         Result (338).RHSs (0).Post_Parse_Action := subprogram_renaming_declaration_0'Access;
         Result (338).RHSs (1).In_Parse_Action := null;
         Result (338).RHSs (1).Post_Parse_Action := subprogram_renaming_declaration_1'Access;
         Result (338).RHSs (2).In_Parse_Action := null;
         Result (338).RHSs (2).Post_Parse_Action := subprogram_renaming_declaration_2'Access;
         Result (338).RHSs (3).In_Parse_Action := null;
         Result (338).RHSs (3).Post_Parse_Action := subprogram_renaming_declaration_3'Access;
         Result (339).RHSs.Set_First_Last (0, 5);
         Result (339).RHSs (0).In_Parse_Action := null;
         Result (339).RHSs (0).Post_Parse_Action := generic_renaming_declaration_0'Access;
         Result (339).RHSs (1).In_Parse_Action := null;
         Result (339).RHSs (1).Post_Parse_Action := generic_renaming_declaration_1'Access;
         Result (339).RHSs (2).In_Parse_Action := null;
         Result (339).RHSs (2).Post_Parse_Action := generic_renaming_declaration_2'Access;
         Result (339).RHSs (3).In_Parse_Action := null;
         Result (339).RHSs (3).Post_Parse_Action := generic_renaming_declaration_3'Access;
         Result (339).RHSs (4).In_Parse_Action := null;
         Result (339).RHSs (4).Post_Parse_Action := generic_renaming_declaration_4'Access;
         Result (339).RHSs (5).In_Parse_Action := null;
         Result (339).RHSs (5).Post_Parse_Action := generic_renaming_declaration_5'Access;
         Result (340).RHSs.Set_First_Last (0, 11);
         Result (340).RHSs (0).In_Parse_Action := task_type_declaration_0_check'Access;
         Result (340).RHSs (0).Post_Parse_Action := task_type_declaration_0'Access;
         Result (340).RHSs (1).In_Parse_Action := task_type_declaration_1_check'Access;
         Result (340).RHSs (1).Post_Parse_Action := task_type_declaration_1'Access;
         Result (340).RHSs (2).In_Parse_Action := null;
         Result (340).RHSs (2).Post_Parse_Action := task_type_declaration_2'Access;
         Result (340).RHSs (3).In_Parse_Action := task_type_declaration_3_check'Access;
         Result (340).RHSs (3).Post_Parse_Action := task_type_declaration_3'Access;
         Result (340).RHSs (4).In_Parse_Action := task_type_declaration_4_check'Access;
         Result (340).RHSs (4).Post_Parse_Action := task_type_declaration_4'Access;
         Result (340).RHSs (5).In_Parse_Action := null;
         Result (340).RHSs (5).Post_Parse_Action := task_type_declaration_5'Access;
         Result (340).RHSs (6).In_Parse_Action := task_type_declaration_6_check'Access;
         Result (340).RHSs (6).Post_Parse_Action := task_type_declaration_6'Access;
         Result (340).RHSs (7).In_Parse_Action := task_type_declaration_7_check'Access;
         Result (340).RHSs (7).Post_Parse_Action := task_type_declaration_7'Access;
         Result (340).RHSs (8).In_Parse_Action := null;
         Result (340).RHSs (8).Post_Parse_Action := task_type_declaration_8'Access;
         Result (340).RHSs (9).In_Parse_Action := task_type_declaration_9_check'Access;
         Result (340).RHSs (9).Post_Parse_Action := task_type_declaration_9'Access;
         Result (340).RHSs (10).In_Parse_Action := task_type_declaration_10_check'Access;
         Result (340).RHSs (10).Post_Parse_Action := task_type_declaration_10'Access;
         Result (340).RHSs (11).In_Parse_Action := null;
         Result (340).RHSs (11).Post_Parse_Action := task_type_declaration_11'Access;
         Result (341).RHSs.Set_First_Last (0, 5);
         Result (341).RHSs (0).In_Parse_Action := single_task_declaration_0_check'Access;
         Result (341).RHSs (0).Post_Parse_Action := single_task_declaration_0'Access;
         Result (341).RHSs (1).In_Parse_Action := single_task_declaration_1_check'Access;
         Result (341).RHSs (1).Post_Parse_Action := single_task_declaration_1'Access;
         Result (341).RHSs (2).In_Parse_Action := null;
         Result (341).RHSs (2).Post_Parse_Action := single_task_declaration_2'Access;
         Result (341).RHSs (3).In_Parse_Action := single_task_declaration_3_check'Access;
         Result (341).RHSs (3).Post_Parse_Action := single_task_declaration_3'Access;
         Result (341).RHSs (4).In_Parse_Action := single_task_declaration_4_check'Access;
         Result (341).RHSs (4).Post_Parse_Action := single_task_declaration_4'Access;
         Result (341).RHSs (5).In_Parse_Action := null;
         Result (341).RHSs (5).Post_Parse_Action := single_task_declaration_5'Access;
         Result (343).RHSs.Set_First_Last (0, 1);
         Result (343).RHSs (0).In_Parse_Action := task_definition_0_check'Access;
         Result (343).RHSs (0).Post_Parse_Action := task_definition_0'Access;
         Result (343).RHSs (1).In_Parse_Action := task_definition_1_check'Access;
         Result (343).RHSs (1).Post_Parse_Action := task_definition_1'Access;
         Result (345).RHSs.Set_First_Last (0, 1);
         Result (345).RHSs (0).In_Parse_Action := task_body_0_check'Access;
         Result (345).RHSs (0).Post_Parse_Action := task_body_0'Access;
         Result (345).RHSs (1).In_Parse_Action := task_body_1_check'Access;
         Result (345).RHSs (1).Post_Parse_Action := task_body_1'Access;
         Result (346).RHSs.Set_First_Last (0, 7);
         Result (346).RHSs (0).In_Parse_Action := protected_type_declaration_0_check'Access;
         Result (346).RHSs (0).Post_Parse_Action := protected_type_declaration_0'Access;
         Result (346).RHSs (1).In_Parse_Action := protected_type_declaration_1_check'Access;
         Result (346).RHSs (1).Post_Parse_Action := protected_type_declaration_1'Access;
         Result (346).RHSs (2).In_Parse_Action := protected_type_declaration_2_check'Access;
         Result (346).RHSs (2).Post_Parse_Action := protected_type_declaration_2'Access;
         Result (346).RHSs (3).In_Parse_Action := protected_type_declaration_3_check'Access;
         Result (346).RHSs (3).Post_Parse_Action := protected_type_declaration_3'Access;
         Result (346).RHSs (4).In_Parse_Action := protected_type_declaration_4_check'Access;
         Result (346).RHSs (4).Post_Parse_Action := protected_type_declaration_4'Access;
         Result (346).RHSs (5).In_Parse_Action := protected_type_declaration_5_check'Access;
         Result (346).RHSs (5).Post_Parse_Action := protected_type_declaration_5'Access;
         Result (346).RHSs (6).In_Parse_Action := protected_type_declaration_6_check'Access;
         Result (346).RHSs (6).Post_Parse_Action := protected_type_declaration_6'Access;
         Result (346).RHSs (7).In_Parse_Action := protected_type_declaration_7_check'Access;
         Result (346).RHSs (7).Post_Parse_Action := protected_type_declaration_7'Access;
         Result (347).RHSs.Set_First_Last (0, 3);
         Result (347).RHSs (0).In_Parse_Action := single_protected_declaration_0_check'Access;
         Result (347).RHSs (0).Post_Parse_Action := single_protected_declaration_0'Access;
         Result (347).RHSs (1).In_Parse_Action := single_protected_declaration_1_check'Access;
         Result (347).RHSs (1).Post_Parse_Action := single_protected_declaration_1'Access;
         Result (347).RHSs (2).In_Parse_Action := single_protected_declaration_2_check'Access;
         Result (347).RHSs (2).Post_Parse_Action := single_protected_declaration_2'Access;
         Result (347).RHSs (3).In_Parse_Action := single_protected_declaration_3_check'Access;
         Result (347).RHSs (3).Post_Parse_Action := single_protected_declaration_3'Access;
         Result (350).RHSs.Set_First_Last (0, 11);
         Result (350).RHSs (0).In_Parse_Action := protected_definition_0_check'Access;
         Result (350).RHSs (0).Post_Parse_Action := protected_definition_0'Access;
         Result (350).RHSs (1).In_Parse_Action := null;
         Result (350).RHSs (1).Post_Parse_Action := protected_definition_1'Access;
         Result (350).RHSs (2).In_Parse_Action := protected_definition_2_check'Access;
         Result (350).RHSs (2).Post_Parse_Action := protected_definition_2'Access;
         Result (350).RHSs (3).In_Parse_Action := null;
         Result (350).RHSs (3).Post_Parse_Action := protected_definition_3'Access;
         Result (350).RHSs (4).In_Parse_Action := protected_definition_4_check'Access;
         Result (350).RHSs (4).Post_Parse_Action := protected_definition_4'Access;
         Result (350).RHSs (5).In_Parse_Action := null;
         Result (350).RHSs (5).Post_Parse_Action := protected_definition_5'Access;
         Result (350).RHSs (6).In_Parse_Action := protected_definition_6_check'Access;
         Result (350).RHSs (6).Post_Parse_Action := protected_definition_6'Access;
         Result (350).RHSs (7).In_Parse_Action := null;
         Result (350).RHSs (7).Post_Parse_Action := protected_definition_7'Access;
         Result (350).RHSs (8).In_Parse_Action := protected_definition_8_check'Access;
         Result (350).RHSs (8).Post_Parse_Action := protected_definition_8'Access;
         Result (350).RHSs (9).In_Parse_Action := null;
         Result (350).RHSs (9).Post_Parse_Action := protected_definition_9'Access;
         Result (350).RHSs (10).In_Parse_Action := protected_definition_10_check'Access;
         Result (350).RHSs (10).Post_Parse_Action := protected_definition_10'Access;
         Result (350).RHSs (11).In_Parse_Action := null;
         Result (350).RHSs (11).Post_Parse_Action := protected_definition_11'Access;
         Result (354).RHSs.Set_First_Last (0, 3);
         Result (354).RHSs (0).In_Parse_Action := protected_body_0_check'Access;
         Result (354).RHSs (0).Post_Parse_Action := protected_body_0'Access;
         Result (354).RHSs (1).In_Parse_Action := protected_body_1_check'Access;
         Result (354).RHSs (1).Post_Parse_Action := protected_body_1'Access;
         Result (354).RHSs (2).In_Parse_Action := protected_body_2_check'Access;
         Result (354).RHSs (2).Post_Parse_Action := protected_body_2'Access;
         Result (354).RHSs (3).In_Parse_Action := protected_body_3_check'Access;
         Result (354).RHSs (3).Post_Parse_Action := protected_body_3'Access;
         Result (356).RHSs.Set_First_Last (0, 7);
         Result (356).RHSs (0).In_Parse_Action := null;
         Result (356).RHSs (0).Post_Parse_Action := entry_declaration_0'Access;
         Result (356).RHSs (1).In_Parse_Action := null;
         Result (356).RHSs (1).Post_Parse_Action := entry_declaration_1'Access;
         Result (356).RHSs (2).In_Parse_Action := null;
         Result (356).RHSs (2).Post_Parse_Action := entry_declaration_2'Access;
         Result (356).RHSs (3).In_Parse_Action := null;
         Result (356).RHSs (3).Post_Parse_Action := entry_declaration_3'Access;
         Result (356).RHSs (4).In_Parse_Action := null;
         Result (356).RHSs (4).Post_Parse_Action := entry_declaration_4'Access;
         Result (356).RHSs (5).In_Parse_Action := null;
         Result (356).RHSs (5).Post_Parse_Action := entry_declaration_5'Access;
         Result (356).RHSs (6).In_Parse_Action := null;
         Result (356).RHSs (6).Post_Parse_Action := entry_declaration_6'Access;
         Result (356).RHSs (7).In_Parse_Action := null;
         Result (356).RHSs (7).Post_Parse_Action := entry_declaration_7'Access;
         Result (357).RHSs.Set_First_Last (0, 3);
         Result (357).RHSs (0).In_Parse_Action := accept_statement_0_check'Access;
         Result (357).RHSs (0).Post_Parse_Action := accept_statement_0'Access;
         Result (357).RHSs (1).In_Parse_Action := null;
         Result (357).RHSs (1).Post_Parse_Action := accept_statement_1'Access;
         Result (357).RHSs (2).In_Parse_Action := accept_statement_2_check'Access;
         Result (357).RHSs (2).Post_Parse_Action := accept_statement_2'Access;
         Result (357).RHSs (3).In_Parse_Action := null;
         Result (357).RHSs (3).Post_Parse_Action := accept_statement_3'Access;
         Result (359).RHSs.Set_First_Last (0, 1);
         Result (359).RHSs (0).In_Parse_Action := entry_body_0_check'Access;
         Result (359).RHSs (0).Post_Parse_Action := entry_body_0'Access;
         Result (359).RHSs (1).In_Parse_Action := entry_body_1_check'Access;
         Result (359).RHSs (1).Post_Parse_Action := entry_body_1'Access;
         Result (360).RHSs.Set_First_Last (0, 1);
         Result (360).RHSs (0).In_Parse_Action := null;
         Result (360).RHSs (0).Post_Parse_Action := entry_body_formal_part_0'Access;
         Result (360).RHSs (1).In_Parse_Action := null;
         Result (360).RHSs (1).Post_Parse_Action := entry_body_formal_part_1'Access;
         Result (361).RHSs.Set_First_Last (0, 0);
         Result (361).RHSs (0).In_Parse_Action := null;
         Result (361).RHSs (0).Post_Parse_Action := entry_barrier_0'Access;
         Result (363).RHSs.Set_First_Last (0, 1);
         Result (363).RHSs (0).In_Parse_Action := null;
         Result (363).RHSs (0).Post_Parse_Action := requeue_statement_0'Access;
         Result (363).RHSs (1).In_Parse_Action := null;
         Result (363).RHSs (1).Post_Parse_Action := requeue_statement_1'Access;
         Result (365).RHSs.Set_First_Last (0, 0);
         Result (365).RHSs (0).In_Parse_Action := null;
         Result (365).RHSs (0).Post_Parse_Action := delay_until_statement_0'Access;
         Result (366).RHSs.Set_First_Last (0, 0);
         Result (366).RHSs (0).In_Parse_Action := null;
         Result (366).RHSs (0).Post_Parse_Action := delay_relative_statement_0'Access;
         Result (368).RHSs.Set_First_Last (0, 1);
         Result (368).RHSs (0).In_Parse_Action := null;
         Result (368).RHSs (0).Post_Parse_Action := guard_select_0'Access;
         Result (368).RHSs (1).In_Parse_Action := null;
         Result (368).RHSs (1).Post_Parse_Action := null;
         Result (369).RHSs.Set_First_Last (0, 1);
         Result (369).RHSs (0).In_Parse_Action := null;
         Result (369).RHSs (0).Post_Parse_Action := null;
         Result (369).RHSs (1).In_Parse_Action := null;
         Result (369).RHSs (1).Post_Parse_Action := select_alternative_list_1'Access;
         Result (370).RHSs.Set_First_Last (0, 1);
         Result (370).RHSs (0).In_Parse_Action := null;
         Result (370).RHSs (0).Post_Parse_Action := selective_accept_0'Access;
         Result (370).RHSs (1).In_Parse_Action := null;
         Result (370).RHSs (1).Post_Parse_Action := selective_accept_1'Access;
         Result (371).RHSs.Set_First_Last (0, 0);
         Result (371).RHSs (0).In_Parse_Action := null;
         Result (371).RHSs (0).Post_Parse_Action := guard_0'Access;
         Result (375).RHSs.Set_First_Last (0, 0);
         Result (375).RHSs (0).In_Parse_Action := null;
         Result (375).RHSs (0).Post_Parse_Action := terminate_alternative_0'Access;
         Result (376).RHSs.Set_First_Last (0, 0);
         Result (376).RHSs (0).In_Parse_Action := null;
         Result (376).RHSs (0).Post_Parse_Action := timed_entry_call_0'Access;
         Result (378).RHSs.Set_First_Last (0, 0);
         Result (378).RHSs (0).In_Parse_Action := null;
         Result (378).RHSs (0).Post_Parse_Action := conditional_entry_call_0'Access;
         Result (379).RHSs.Set_First_Last (0, 0);
         Result (379).RHSs (0).In_Parse_Action := null;
         Result (379).RHSs (0).Post_Parse_Action := asynchronous_select_0'Access;
         Result (382).RHSs.Set_First_Last (0, 0);
         Result (382).RHSs (0).In_Parse_Action := null;
         Result (382).RHSs (0).Post_Parse_Action := abort_statement_0'Access;
         Result (383).RHSs.Set_First_Last (0, 1);
         Result (383).RHSs (0).In_Parse_Action := compilation_0_check'Access;
         Result (383).RHSs (0).Post_Parse_Action := compilation_0'Access;
         Result (383).RHSs (1).In_Parse_Action := null;
         Result (383).RHSs (1).Post_Parse_Action := compilation_1'Access;
         Result (384).RHSs.Set_First_Last (0, 5);
         Result (384).RHSs (0).In_Parse_Action := null;
         Result (384).RHSs (0).Post_Parse_Action := null;
         Result (384).RHSs (1).In_Parse_Action := null;
         Result (384).RHSs (1).Post_Parse_Action := compilation_unit_1'Access;
         Result (384).RHSs (2).In_Parse_Action := null;
         Result (384).RHSs (2).Post_Parse_Action := compilation_unit_2'Access;
         Result (384).RHSs (3).In_Parse_Action := null;
         Result (384).RHSs (3).Post_Parse_Action := null;
         Result (384).RHSs (4).In_Parse_Action := null;
         Result (384).RHSs (4).Post_Parse_Action := null;
         Result (384).RHSs (5).In_Parse_Action := null;
         Result (384).RHSs (5).Post_Parse_Action := null;
         Result (386).RHSs.Set_First_Last (0, 1);
         Result (386).RHSs (0).In_Parse_Action := null;
         Result (386).RHSs (0).Post_Parse_Action := limited_with_clause_0'Access;
         Result (386).RHSs (1).In_Parse_Action := null;
         Result (386).RHSs (1).Post_Parse_Action := limited_with_clause_1'Access;
         Result (387).RHSs.Set_First_Last (0, 1);
         Result (387).RHSs (0).In_Parse_Action := null;
         Result (387).RHSs (0).Post_Parse_Action := nonlimited_with_clause_0'Access;
         Result (387).RHSs (1).In_Parse_Action := null;
         Result (387).RHSs (1).Post_Parse_Action := nonlimited_with_clause_1'Access;
         Result (389).RHSs.Set_First_Last (0, 3);
         Result (389).RHSs (0).In_Parse_Action := null;
         Result (389).RHSs (0).Post_Parse_Action := subprogram_body_stub_0'Access;
         Result (389).RHSs (1).In_Parse_Action := null;
         Result (389).RHSs (1).Post_Parse_Action := subprogram_body_stub_1'Access;
         Result (389).RHSs (2).In_Parse_Action := null;
         Result (389).RHSs (2).Post_Parse_Action := subprogram_body_stub_2'Access;
         Result (389).RHSs (3).In_Parse_Action := null;
         Result (389).RHSs (3).Post_Parse_Action := subprogram_body_stub_3'Access;
         Result (390).RHSs.Set_First_Last (0, 1);
         Result (390).RHSs (0).In_Parse_Action := null;
         Result (390).RHSs (0).Post_Parse_Action := package_body_stub_0'Access;
         Result (390).RHSs (1).In_Parse_Action := null;
         Result (390).RHSs (1).Post_Parse_Action := package_body_stub_1'Access;
         Result (391).RHSs.Set_First_Last (0, 1);
         Result (391).RHSs (0).In_Parse_Action := null;
         Result (391).RHSs (0).Post_Parse_Action := task_body_stub_0'Access;
         Result (391).RHSs (1).In_Parse_Action := null;
         Result (391).RHSs (1).Post_Parse_Action := task_body_stub_1'Access;
         Result (392).RHSs.Set_First_Last (0, 1);
         Result (392).RHSs (0).In_Parse_Action := null;
         Result (392).RHSs (0).Post_Parse_Action := protected_body_stub_0'Access;
         Result (392).RHSs (1).In_Parse_Action := null;
         Result (392).RHSs (1).Post_Parse_Action := protected_body_stub_1'Access;
         Result (393).RHSs.Set_First_Last (0, 0);
         Result (393).RHSs (0).In_Parse_Action := null;
         Result (393).RHSs (0).Post_Parse_Action := subunit_0'Access;
         Result (394).RHSs.Set_First_Last (0, 1);
         Result (394).RHSs (0).In_Parse_Action := null;
         Result (394).RHSs (0).Post_Parse_Action := exception_declaration_0'Access;
         Result (394).RHSs (1).In_Parse_Action := null;
         Result (394).RHSs (1).Post_Parse_Action := exception_declaration_1'Access;
         Result (395).RHSs.Set_First_Last (0, 2);
         Result (395).RHSs (0).In_Parse_Action := null;
         Result (395).RHSs (0).Post_Parse_Action := null;
         Result (395).RHSs (1).In_Parse_Action := null;
         Result (395).RHSs (1).Post_Parse_Action := null;
         Result (395).RHSs (2).In_Parse_Action := null;
         Result (395).RHSs (2).Post_Parse_Action := exception_handler_list_2'Access;
         Result (396).RHSs.Set_First_Last (0, 1);
         Result (396).RHSs (0).In_Parse_Action := null;
         Result (396).RHSs (0).Post_Parse_Action := handled_sequence_of_statements_0'Access;
         Result (396).RHSs (1).In_Parse_Action := null;
         Result (396).RHSs (1).Post_Parse_Action := handled_sequence_of_statements_1'Access;
         Result (397).Optimized_List := True;
         Result (398).RHSs.Set_First_Last (0, 1);
         Result (398).RHSs (0).In_Parse_Action := null;
         Result (398).RHSs (0).Post_Parse_Action := exception_handler_0'Access;
         Result (398).RHSs (1).In_Parse_Action := null;
         Result (398).RHSs (1).Post_Parse_Action := exception_handler_1'Access;
         Result (401).RHSs.Set_First_Last (0, 2);
         Result (401).RHSs (0).In_Parse_Action := null;
         Result (401).RHSs (0).Post_Parse_Action := raise_statement_0'Access;
         Result (401).RHSs (1).In_Parse_Action := null;
         Result (401).RHSs (1).Post_Parse_Action := raise_statement_1'Access;
         Result (401).RHSs (2).In_Parse_Action := null;
         Result (401).RHSs (2).Post_Parse_Action := raise_statement_2'Access;
         Result (402).RHSs.Set_First_Last (0, 1);
         Result (402).RHSs (0).In_Parse_Action := null;
         Result (402).RHSs (0).Post_Parse_Action := raise_expression_0'Access;
         Result (402).RHSs (1).In_Parse_Action := null;
         Result (402).RHSs (1).Post_Parse_Action := raise_expression_1'Access;
         Result (404).RHSs.Set_First_Last (0, 1);
         Result (404).RHSs (0).In_Parse_Action := null;
         Result (404).RHSs (0).Post_Parse_Action := generic_subprogram_declaration_0'Access;
         Result (404).RHSs (1).In_Parse_Action := null;
         Result (404).RHSs (1).Post_Parse_Action := generic_subprogram_declaration_1'Access;
         Result (405).RHSs.Set_First_Last (0, 0);
         Result (405).RHSs (0).In_Parse_Action := null;
         Result (405).RHSs (0).Post_Parse_Action := generic_package_declaration_0'Access;
         Result (406).RHSs.Set_First_Last (0, 1);
         Result (406).RHSs (0).In_Parse_Action := null;
         Result (406).RHSs (0).Post_Parse_Action := generic_formal_part_0'Access;
         Result (406).RHSs (1).In_Parse_Action := null;
         Result (406).RHSs (1).Post_Parse_Action := generic_formal_part_1'Access;
         Result (408).RHSs.Set_First_Last (0, 9);
         Result (408).RHSs (0).In_Parse_Action := null;
         Result (408).RHSs (0).Post_Parse_Action := generic_instantiation_0'Access;
         Result (408).RHSs (1).In_Parse_Action := null;
         Result (408).RHSs (1).Post_Parse_Action := generic_instantiation_1'Access;
         Result (408).RHSs (2).In_Parse_Action := null;
         Result (408).RHSs (2).Post_Parse_Action := generic_instantiation_2'Access;
         Result (408).RHSs (3).In_Parse_Action := null;
         Result (408).RHSs (3).Post_Parse_Action := generic_instantiation_3'Access;
         Result (408).RHSs (4).In_Parse_Action := null;
         Result (408).RHSs (4).Post_Parse_Action := generic_instantiation_4'Access;
         Result (408).RHSs (5).In_Parse_Action := null;
         Result (408).RHSs (5).Post_Parse_Action := generic_instantiation_5'Access;
         Result (408).RHSs (6).In_Parse_Action := null;
         Result (408).RHSs (6).Post_Parse_Action := generic_instantiation_6'Access;
         Result (408).RHSs (7).In_Parse_Action := null;
         Result (408).RHSs (7).Post_Parse_Action := generic_instantiation_7'Access;
         Result (408).RHSs (8).In_Parse_Action := null;
         Result (408).RHSs (8).Post_Parse_Action := generic_instantiation_8'Access;
         Result (408).RHSs (9).In_Parse_Action := null;
         Result (408).RHSs (9).Post_Parse_Action := generic_instantiation_9'Access;
         Result (409).RHSs.Set_First_Last (0, 11);
         Result (409).RHSs (0).In_Parse_Action := null;
         Result (409).RHSs (0).Post_Parse_Action := formal_object_declaration_0'Access;
         Result (409).RHSs (1).In_Parse_Action := null;
         Result (409).RHSs (1).Post_Parse_Action := formal_object_declaration_1'Access;
         Result (409).RHSs (2).In_Parse_Action := null;
         Result (409).RHSs (2).Post_Parse_Action := formal_object_declaration_2'Access;
         Result (409).RHSs (3).In_Parse_Action := null;
         Result (409).RHSs (3).Post_Parse_Action := formal_object_declaration_3'Access;
         Result (409).RHSs (4).In_Parse_Action := null;
         Result (409).RHSs (4).Post_Parse_Action := formal_object_declaration_4'Access;
         Result (409).RHSs (5).In_Parse_Action := null;
         Result (409).RHSs (5).Post_Parse_Action := formal_object_declaration_5'Access;
         Result (409).RHSs (6).In_Parse_Action := null;
         Result (409).RHSs (6).Post_Parse_Action := formal_object_declaration_6'Access;
         Result (409).RHSs (7).In_Parse_Action := null;
         Result (409).RHSs (7).Post_Parse_Action := formal_object_declaration_7'Access;
         Result (409).RHSs (8).In_Parse_Action := null;
         Result (409).RHSs (8).Post_Parse_Action := formal_object_declaration_8'Access;
         Result (409).RHSs (9).In_Parse_Action := null;
         Result (409).RHSs (9).Post_Parse_Action := formal_object_declaration_9'Access;
         Result (409).RHSs (10).In_Parse_Action := null;
         Result (409).RHSs (10).Post_Parse_Action := formal_object_declaration_10'Access;
         Result (409).RHSs (11).In_Parse_Action := null;
         Result (409).RHSs (11).Post_Parse_Action := formal_object_declaration_11'Access;
         Result (411).RHSs.Set_First_Last (0, 7);
         Result (411).RHSs (0).In_Parse_Action := null;
         Result (411).RHSs (0).Post_Parse_Action := formal_complete_type_declaration_0'Access;
         Result (411).RHSs (1).In_Parse_Action := null;
         Result (411).RHSs (1).Post_Parse_Action := formal_complete_type_declaration_1'Access;
         Result (411).RHSs (2).In_Parse_Action := null;
         Result (411).RHSs (2).Post_Parse_Action := formal_complete_type_declaration_2'Access;
         Result (411).RHSs (3).In_Parse_Action := null;
         Result (411).RHSs (3).Post_Parse_Action := formal_complete_type_declaration_3'Access;
         Result (411).RHSs (4).In_Parse_Action := null;
         Result (411).RHSs (4).Post_Parse_Action := formal_complete_type_declaration_4'Access;
         Result (411).RHSs (5).In_Parse_Action := null;
         Result (411).RHSs (5).Post_Parse_Action := formal_complete_type_declaration_5'Access;
         Result (411).RHSs (6).In_Parse_Action := null;
         Result (411).RHSs (6).Post_Parse_Action := formal_complete_type_declaration_6'Access;
         Result (411).RHSs (7).In_Parse_Action := null;
         Result (411).RHSs (7).Post_Parse_Action := formal_complete_type_declaration_7'Access;
         Result (412).RHSs.Set_First_Last (0, 7);
         Result (412).RHSs (0).In_Parse_Action := null;
         Result (412).RHSs (0).Post_Parse_Action := formal_incomplete_type_declaration_0'Access;
         Result (412).RHSs (1).In_Parse_Action := null;
         Result (412).RHSs (1).Post_Parse_Action := formal_incomplete_type_declaration_1'Access;
         Result (412).RHSs (2).In_Parse_Action := null;
         Result (412).RHSs (2).Post_Parse_Action := formal_incomplete_type_declaration_2'Access;
         Result (412).RHSs (3).In_Parse_Action := null;
         Result (412).RHSs (3).Post_Parse_Action := formal_incomplete_type_declaration_3'Access;
         Result (412).RHSs (4).In_Parse_Action := null;
         Result (412).RHSs (4).Post_Parse_Action := formal_incomplete_type_declaration_4'Access;
         Result (412).RHSs (5).In_Parse_Action := null;
         Result (412).RHSs (5).Post_Parse_Action := formal_incomplete_type_declaration_5'Access;
         Result (412).RHSs (6).In_Parse_Action := null;
         Result (412).RHSs (6).Post_Parse_Action := formal_incomplete_type_declaration_6'Access;
         Result (412).RHSs (7).In_Parse_Action := null;
         Result (412).RHSs (7).Post_Parse_Action := formal_incomplete_type_declaration_7'Access;
         Result (415).RHSs.Set_First_Last (0, 17);
         Result (415).RHSs (0).In_Parse_Action := null;
         Result (415).RHSs (0).Post_Parse_Action := formal_derived_type_definition_0'Access;
         Result (415).RHSs (1).In_Parse_Action := null;
         Result (415).RHSs (1).Post_Parse_Action := formal_derived_type_definition_1'Access;
         Result (415).RHSs (2).In_Parse_Action := null;
         Result (415).RHSs (2).Post_Parse_Action := formal_derived_type_definition_2'Access;
         Result (415).RHSs (3).In_Parse_Action := null;
         Result (415).RHSs (3).Post_Parse_Action := formal_derived_type_definition_3'Access;
         Result (415).RHSs (4).In_Parse_Action := null;
         Result (415).RHSs (4).Post_Parse_Action := formal_derived_type_definition_4'Access;
         Result (415).RHSs (5).In_Parse_Action := null;
         Result (415).RHSs (5).Post_Parse_Action := formal_derived_type_definition_5'Access;
         Result (415).RHSs (6).In_Parse_Action := null;
         Result (415).RHSs (6).Post_Parse_Action := formal_derived_type_definition_6'Access;
         Result (415).RHSs (7).In_Parse_Action := null;
         Result (415).RHSs (7).Post_Parse_Action := formal_derived_type_definition_7'Access;
         Result (415).RHSs (8).In_Parse_Action := null;
         Result (415).RHSs (8).Post_Parse_Action := formal_derived_type_definition_8'Access;
         Result (415).RHSs (9).In_Parse_Action := null;
         Result (415).RHSs (9).Post_Parse_Action := formal_derived_type_definition_9'Access;
         Result (415).RHSs (10).In_Parse_Action := null;
         Result (415).RHSs (10).Post_Parse_Action := formal_derived_type_definition_10'Access;
         Result (415).RHSs (11).In_Parse_Action := null;
         Result (415).RHSs (11).Post_Parse_Action := formal_derived_type_definition_11'Access;
         Result (415).RHSs (12).In_Parse_Action := null;
         Result (415).RHSs (12).Post_Parse_Action := formal_derived_type_definition_12'Access;
         Result (415).RHSs (13).In_Parse_Action := null;
         Result (415).RHSs (13).Post_Parse_Action := formal_derived_type_definition_13'Access;
         Result (415).RHSs (14).In_Parse_Action := null;
         Result (415).RHSs (14).Post_Parse_Action := formal_derived_type_definition_14'Access;
         Result (415).RHSs (15).In_Parse_Action := null;
         Result (415).RHSs (15).Post_Parse_Action := formal_derived_type_definition_15'Access;
         Result (415).RHSs (16).In_Parse_Action := null;
         Result (415).RHSs (16).Post_Parse_Action := formal_derived_type_definition_16'Access;
         Result (415).RHSs (17).In_Parse_Action := null;
         Result (415).RHSs (17).Post_Parse_Action := formal_derived_type_definition_17'Access;
         Result (426).RHSs.Set_First_Last (0, 3);
         Result (426).RHSs (0).In_Parse_Action := null;
         Result (426).RHSs (0).Post_Parse_Action := formal_concrete_subprogram_declaration_0'Access;
         Result (426).RHSs (1).In_Parse_Action := null;
         Result (426).RHSs (1).Post_Parse_Action := formal_concrete_subprogram_declaration_1'Access;
         Result (426).RHSs (2).In_Parse_Action := null;
         Result (426).RHSs (2).Post_Parse_Action := formal_concrete_subprogram_declaration_2'Access;
         Result (426).RHSs (3).In_Parse_Action := null;
         Result (426).RHSs (3).Post_Parse_Action := formal_concrete_subprogram_declaration_3'Access;
         Result (427).RHSs.Set_First_Last (0, 3);
         Result (427).RHSs (0).In_Parse_Action := null;
         Result (427).RHSs (0).Post_Parse_Action := formal_abstract_subprogram_declaration_0'Access;
         Result (427).RHSs (1).In_Parse_Action := null;
         Result (427).RHSs (1).Post_Parse_Action := formal_abstract_subprogram_declaration_1'Access;
         Result (427).RHSs (2).In_Parse_Action := null;
         Result (427).RHSs (2).Post_Parse_Action := formal_abstract_subprogram_declaration_2'Access;
         Result (427).RHSs (3).In_Parse_Action := null;
         Result (427).RHSs (3).Post_Parse_Action := formal_abstract_subprogram_declaration_3'Access;
         Result (429).RHSs.Set_First_Last (0, 0);
         Result (429).RHSs (0).In_Parse_Action := null;
         Result (429).RHSs (0).Post_Parse_Action := default_name_0'Access;
         Result (430).RHSs.Set_First_Last (0, 1);
         Result (430).RHSs (0).In_Parse_Action := null;
         Result (430).RHSs (0).Post_Parse_Action := formal_package_declaration_0'Access;
         Result (430).RHSs (1).In_Parse_Action := null;
         Result (430).RHSs (1).Post_Parse_Action := formal_package_declaration_1'Access;
         Result (432).RHSs.Set_First_Last (0, 1);
         Result (432).RHSs (0).In_Parse_Action := null;
         Result (432).RHSs (0).Post_Parse_Action := aspect_association_0'Access;
         Result (432).RHSs (1).In_Parse_Action := null;
         Result (432).RHSs (1).Post_Parse_Action := aspect_association_1'Access;
         Result (434).RHSs.Set_First_Last (0, 0);
         Result (434).RHSs (0).In_Parse_Action := null;
         Result (434).RHSs (0).Post_Parse_Action := aspect_specification_0'Access;
         Result (437).RHSs.Set_First_Last (0, 0);
         Result (437).RHSs (0).In_Parse_Action := null;
         Result (437).RHSs (0).Post_Parse_Action := attribute_definition_clause_0'Access;
         Result (438).RHSs.Set_First_Last (0, 0);
         Result (438).RHSs (0).In_Parse_Action := null;
         Result (438).RHSs (0).Post_Parse_Action := enumeration_representation_clause_0'Access;
         Result (440).RHSs.Set_First_Last (0, 7);
         Result (440).RHSs (0).In_Parse_Action := null;
         Result (440).RHSs (0).Post_Parse_Action := record_representation_clause_0'Access;
         Result (440).RHSs (1).In_Parse_Action := null;
         Result (440).RHSs (1).Post_Parse_Action := record_representation_clause_1'Access;
         Result (440).RHSs (2).In_Parse_Action := null;
         Result (440).RHSs (2).Post_Parse_Action := record_representation_clause_2'Access;
         Result (440).RHSs (3).In_Parse_Action := null;
         Result (440).RHSs (3).Post_Parse_Action := record_representation_clause_3'Access;
         Result (440).RHSs (4).In_Parse_Action := null;
         Result (440).RHSs (4).Post_Parse_Action := record_representation_clause_4'Access;
         Result (440).RHSs (5).In_Parse_Action := null;
         Result (440).RHSs (5).Post_Parse_Action := record_representation_clause_5'Access;
         Result (440).RHSs (6).In_Parse_Action := null;
         Result (440).RHSs (6).Post_Parse_Action := record_representation_clause_6'Access;
         Result (440).RHSs (7).In_Parse_Action := null;
         Result (440).RHSs (7).Post_Parse_Action := record_representation_clause_7'Access;
         Result (441).RHSs.Set_First_Last (0, 0);
         Result (441).RHSs (0).In_Parse_Action := null;
         Result (441).RHSs (0).Post_Parse_Action := component_clause_0'Access;
         Result (451).Optimized_List := True;
         Result (453).RHSs.Set_First_Last (0, 1);
         Result (453).RHSs (0).In_Parse_Action := null;
         Result (453).RHSs (0).Post_Parse_Action := delta_constraint_0'Access;
         Result (453).RHSs (1).In_Parse_Action := null;
         Result (453).RHSs (1).Post_Parse_Action := delta_constraint_1'Access;
         Result (454).RHSs.Set_First_Last (0, 0);
         Result (454).RHSs (0).In_Parse_Action := null;
         Result (454).RHSs (0).Post_Parse_Action := at_clause_0'Access;
         Result (456).Optimized_List := True;
         Result (457).Optimized_List := True;
         Result (458).Optimized_List := True;
         Result (459).Optimized_List := True;
         Result (460).Optimized_List := True;
         Result (461).Optimized_List := True;
         Result (462).Optimized_List := True;
         Result (463).Optimized_List := True;
         Result (464).Optimized_List := True;
         Result (465).Optimized_List := True;
         Result (466).Optimized_List := True;
      end return;
   end Create_Productions;

end Ada_Annex_P_Process_LR1_Main;
