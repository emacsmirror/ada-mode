--  generated parser support file. -*- buffer-read-only:t  -*-
--  command line: wisitoken-bnf-generate.exe  --generate LR1 Ada_Emacs re2c PROCESS gpr.wy
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

with Gpr_Process_Actions; use Gpr_Process_Actions;
with SAL;
with WisiToken.Lexer.re2c;
with gpr_re2c_c;
package body Gpr_Process_Main is

   function Is_Block_Delimited (ID : in WisiToken.Token_ID) return Boolean
   is begin
      case To_Token_Enum (ID) is
      when
         COMMENT_ID |
         GNAT_PREP_ID |
         PLACEHOLDER_ID |
         STRING_LITERAL_ID => return True;
      when others => return False;
      end case;
   end Is_Block_Delimited;

   function Same_Block_Delimiters (ID : in WisiToken.Token_ID) return Boolean
   is begin
      case To_Token_Enum (ID) is
      when COMMENT_ID => return False;
      when GNAT_PREP_ID => return False;
      when PLACEHOLDER_ID => return False;
      when STRING_LITERAL_ID => return True;
      when others => return False;
      end case;
   end Same_Block_Delimiters;

   function Escape_Delimiter_Doubled (ID : in WisiToken.Token_ID) return Boolean
   is begin
      case To_Token_Enum (ID) is
      when others => return False;
      end case;
   end Escape_Delimiter_Doubled;

   function Start_Delimiter_Length (ID : in WisiToken.Token_ID) return Integer
   is begin
      case To_Token_Enum (ID) is
      when COMMENT_ID => return 2;
      when GNAT_PREP_ID => return 33;
      when PLACEHOLDER_ID => return 1;
      when STRING_LITERAL_ID => return 1;
      when others => raise SAL.Programmer_Error; return 0;
      end case;
   end Start_Delimiter_Length;

   function End_Delimiter_Length (ID : in WisiToken.Token_ID) return Integer
   is begin
      case To_Token_Enum (ID) is
      when
         COMMENT_ID |
         GNAT_PREP_ID |
         STRING_LITERAL_ID => return 1;
      when PLACEHOLDER_ID => return 1;
      when others => raise SAL.Programmer_Error; return 0;
      end case;
   end End_Delimiter_Length;

   function New_Line_Is_End_Delimiter (ID : in WisiToken.Token_ID) return Boolean
   is begin
      return
        (case To_Token_Enum (ID) is
         when COMMENT_ID => True,
         when GNAT_PREP_ID => True,
         when PLACEHOLDER_ID => True,
         when STRING_LITERAL_ID => True,
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
         when GNAT_PREP_ID => WisiToken.Lexer.Find_New_Line (Source, Token_Start),
         when PLACEHOLDER_ID => WisiToken.Lexer.Find_String (Source, Token_Start, "}"),
         when STRING_LITERAL_ID => WisiToken.Lexer.Find_String_Or_New_Line (Source, Token_Start, """"),
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
         when GNAT_PREP_ID =>
         (if Inserted then Region.Last
          elsif Start then Region.Last
          else Lexer.Find_New_Line (Source, Region.Last)),
         when PLACEHOLDER_ID =>
         (if Inserted then Region.Last
          elsif Start then Region.Last
          else Lexer.Find_String_Or_New_Line (Source, Region.Last, "{")),
         when STRING_LITERAL_ID => Lexer.Find_New_Line (Source, Region.Last),
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
         when GNAT_PREP_ID => Lexer.Find_New_Line (Source, Region),
         when PLACEHOLDER_ID => Lexer.Find_String_Or_New_Line (Source, Region, "}"),
         when STRING_LITERAL_ID => Lexer.Find_String_Or_New_Line (Source, Region, """"),
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
      when GNAT_PREP_ID => return Token.Char_Region.Last + 1;
      when others => raise SAL.Programmer_Error;
      end case;
   end Line_Begin_Char_Pos;

   function Can_Contain_New_Line (ID : in WisiToken.Token_ID) return Boolean
   is begin
      case To_Token_Enum (ID) is
      when NEW_LINE_ID => return True;
      when COMMENT_ID => return True;
      when GNAT_PREP_ID => return True;
      when others => return False;
      end case;
   end Can_Contain_New_Line;

   function Terminated_By_New_Line (ID : in WisiToken.Token_ID) return Boolean
   is begin
      case To_Token_Enum (ID) is
      when NEW_LINE_ID => return True;
      when COMMENT_ID => return True;
      when GNAT_PREP_ID => return True;
      when STRING_LITERAL_ID => return True;
      when others => return False;
      end case;
   end Terminated_By_New_Line;

   package Lexer is new WisiToken.Lexer.re2c
     (gpr_re2c_c.New_Lexer,
      gpr_re2c_c.Free_Lexer,
      gpr_re2c_c.Reset_Lexer,
      gpr_re2c_c.Set_Verbosity,
      gpr_re2c_c.Set_Position,
      gpr_re2c_c.Next_Token,
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
     return WisiToken.Parse.LR.Parse_Table_Ptr
   is
      use WisiToken.Parse.LR;
      McKenzie_Param : constant McKenzie_Param_Type :=
        (First_Terminal    => 5,
         Last_Terminal     => 41,
         First_Nonterminal => 42,
         Last_Nonterminal  => 75,
         Insert =>
           (4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
            4),
         Delete =>
           (4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
            4),
         Push_Back =>
           (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         Undo_Reduce =>
           (2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         Minimal_Complete_Cost_Delta => -1,
         Fast_Forward =>  0,
         Matching_Begin =>  0,
         Ignore_Check_Fail  => 2,
         Check_Limit => 3,
         Zombie_Limit => 4,
         Check_Delta_Limit => 200,
         Enqueue_Limit => 10000);

      Table : constant Parse_Table_Ptr := new Parse_Table
        (State_First       => 0,
         State_Last        => 322,
         First_Terminal    => 5,
         Last_Terminal     => 41,
         First_Nonterminal => 42,
         Last_Nonterminal  => 75);
   begin
      declare
         procedure Subr_1
         is begin
            Table.States (0).Action_List.Set_Capacity (8);
            Add_Action (Table.States (0), 5, Reduce, (52, 0),  0);
            Add_Action (Table.States (0), 7, Reduce, (52, 0),  0);
            Add_Action (Table.States (0), 9, Reduce, (52, 0),  0);
            Add_Action (Table.States (0), 17, Reduce, (52, 0),  0);
            Add_Action (Table.States (0), 21, Reduce, (52, 0),  0);
            Add_Action (Table.States (0), 24, Reduce, (52, 0),  0);
            Add_Action (Table.States (0), 28, (75, 0), 1);
            Add_Action (Table.States (0), 41, Reduce, (52, 0),  0);
            Table.States (0).Goto_List.Set_Capacity (4);
            Add_Goto (Table.States (0), 50, 2);
            Add_Goto (Table.States (0), 51, 3);
            Add_Goto (Table.States (0), 52, 4);
            Add_Goto (Table.States (0), 75, 5);
            Table.States (1).Action_List.Set_Capacity (11);
            Add_Action (Table.States (1), 12, (59, 0), 6);
            Add_Action (Table.States (1), 13, (59, 1), 7);
            Add_Action (Table.States (1), 16, (43, 0), 8);
            Add_Action (Table.States (1), 21, (45, 0), 9);
            Add_Action (Table.States (1), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (1), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (1), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (1), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (1), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (1), 39, (60, 1), 10);
            Add_Action (Table.States (1), 40, (71, 0), 11);
            Table.States (1).Goto_List.Set_Capacity (10);
            Add_Goto (Table.States (1), 43, 12);
            Add_Goto (Table.States (1), 45, 13);
            Add_Goto (Table.States (1), 46, 14);
            Add_Goto (Table.States (1), 58, 15);
            Add_Goto (Table.States (1), 59, 16);
            Add_Goto (Table.States (1), 60, 17);
            Add_Goto (Table.States (1), 61, 18);
            Add_Goto (Table.States (1), 71, 19);
            Add_Goto (Table.States (1), 72, 20);
            Add_Goto (Table.States (1), 73, 21);
            Table.States (1).Kernel := To_Vector ((0 => ((75, 0),  28,  1, (32767, 0),  0)));
            Table.States (1).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (72, 0),  0)));
            Table.States (2).Action_List.Set_Capacity (1);
            Add_Action (Table.States (2), 41, Accept_It, (42, 0),  1);
            Table.States (3).Action_List.Set_Capacity (8);
            Add_Action (Table.States (3), 5, Reduce, (52, 1),  1);
            Add_Action (Table.States (3), 7, Reduce, (52, 1),  1);
            Add_Action (Table.States (3), 9, Reduce, (52, 1),  1);
            Add_Action (Table.States (3), 17, Reduce, (52, 1),  1);
            Add_Action (Table.States (3), 21, Reduce, (52, 1),  1);
            Add_Action (Table.States (3), 24, Reduce, (52, 1),  1);
            Add_Action (Table.States (3), 28, (75, 0), 1);
            Add_Action (Table.States (3), 41, Reduce, (52, 1),  1);
            Table.States (3).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (3), 75, 22);
            Table.States (3).Kernel := To_Vector ((((51, 1),  51,  2, (32767, 0),  0), ((52, 1),  51,  0, (52, 1),
            1)));
            Table.States (3).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (52, 1),  1)));
            Table.States (4).Action_List.Set_Capacity (7);
            Add_Action (Table.States (4), 5, (68, 1), 23);
            Add_Action (Table.States (4), 7, (68, 3), 24);
            Add_Action (Table.States (4), 9, (68, 6), 25);
            Add_Action (Table.States (4), 17, (68, 5), 26);
            Add_Action (Table.States (4), 21, Reduce, (68, 0),  0);
            Add_Action (Table.States (4), 24, (68, 2), 27);
            Add_Action (Table.States (4), 41, Reduce, (68, 0),  0);
            Table.States (4).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (4), 68, 28);
            Table.States (4).Kernel := To_Vector ((0 => ((50, 0),  52,  0, (68, 0),  0)));
            Table.States (4).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (68, 0),  0)));
            Table.States (5).Action_List.Set_Capacity (8);
            Add_Action (Table.States (5), (5, 7, 9, 17, 21, 24, 28, 41), (51, 0),  1);
            Table.States (5).Kernel := To_Vector ((0 => ((51, 0),  75,  0, (51, 0),  1)));
            Table.States (5).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (51, 0),  1)));
            Table.States (6).Action_List.Set_Capacity (1);
            Add_Action (Table.States (6), 16, (43, 0), 29);
            Table.States (6).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (6), 43, 30);
            Table.States (6).Kernel := To_Vector ((0 => ((59, 0),  12,  2, (32767, 0),  0)));
            Table.States (6).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  16, 29)));
            Table.States (7).Action_List.Set_Capacity (1);
            Add_Action (Table.States (7), 16, (43, 0), 29);
            Table.States (7).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (7), 43, 31);
            Table.States (7).Kernel := To_Vector ((0 => ((59, 1),  13,  2, (32767, 0),  0)));
            Table.States (7).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  16, 29)));
            Table.States (8).Action_List.Set_Capacity (11);
            Add_Action (Table.States (8), 12, (59, 0), 32);
            Add_Action (Table.States (8), 13, (59, 1), 33);
            Add_Action (Table.States (8), 16, (43, 0), 34);
            Add_Action (Table.States (8), 21, (45, 0), 9);
            Add_Action (Table.States (8), 23, (73, 1), 35);
            Add_Conflict (Table.States (8), 23, (60, 0),  0);
            Add_Action (Table.States (8), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (8), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (8), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (8), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (8), 39, (60, 1), 36);
            Add_Action (Table.States (8), 40, (71, 0), 37);
            Table.States (8).Goto_List.Set_Capacity (10);
            Add_Goto (Table.States (8), 43, 38);
            Add_Goto (Table.States (8), 45, 39);
            Add_Goto (Table.States (8), 46, 40);
            Add_Goto (Table.States (8), 58, 41);
            Add_Goto (Table.States (8), 59, 42);
            Add_Goto (Table.States (8), 60, 43);
            Add_Goto (Table.States (8), 61, 44);
            Add_Goto (Table.States (8), 71, 45);
            Add_Goto (Table.States (8), 72, 46);
            Add_Goto (Table.States (8), 73, 47);
            Table.States (8).Kernel := To_Vector ((((43, 0),  16,  1, (32767, 0),  0), ((73, 1),  16,  1, (32767, 0),
            0)));
            Table.States (8).Minimal_Complete_Actions := To_Vector (((Reduce, (72, 0),  0), (Shift, (73, 1),  23,
            35)));
            Table.States (9).Action_List.Set_Capacity (1);
            Add_Action (Table.States (9), (1 =>  35), (45, 0),  1);
            Table.States (9).Kernel := To_Vector ((0 => ((45, 0),  21,  0, (45, 0),  1)));
            Table.States (9).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (45, 0),  1)));
            Table.States (10).Action_List.Set_Capacity (5);
            Add_Action (Table.States (10), (29, 32, 33, 35, 36), (60, 1),  1);
            Table.States (10).Kernel := To_Vector ((0 => ((60, 1),  39,  0, (60, 1),  1)));
            Table.States (10).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 1),  1)));
            Table.States (11).Action_List.Set_Capacity (3);
            Add_Action (Table.States (11), (29, 32, 36), (71, 0),  1);
            Table.States (11).Kernel := To_Vector ((0 => ((71, 0),  40,  0, (71, 0),  1)));
            Table.States (11).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (71, 0),  1)));
            Table.States (12).Action_List.Set_Capacity (3);
            Add_Action (Table.States (12), (29, 32, 36), (73, 2),  1);
            Table.States (12).Kernel := To_Vector ((0 => ((73, 2),  43,  0, (73, 2),  1)));
            Table.States (12).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 2),  1)));
            Table.States (13).Action_List.Set_Capacity (1);
            Add_Action (Table.States (13), 35, (46, 0), 48);
            Table.States (13).Kernel := To_Vector ((((46, 0),  45,  2, (32767, 0),  0), ((46, 1),  45,  5, (32767, 0),
            0)));
            Table.States (13).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 0),  35, 48)));
            Table.States (14).Action_List.Set_Capacity (3);
            Add_Action (Table.States (14), (29, 32, 36), (71, 3),  1);
            Table.States (14).Kernel := To_Vector ((0 => ((71, 3),  46,  0, (71, 3),  1)));
            Table.States (14).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (71, 3),  1)));
            Table.States (15).Action_List.Set_Capacity (3);
            Add_Action (Table.States (15), 29, (58, 1), 49);
            Add_Action (Table.States (15), 32, Reduce, (72, 0),  1);
            Add_Action (Table.States (15), 36, Reduce, (72, 0),  1);
            Table.States (15).Kernel := To_Vector ((((58, 1),  58,  1, (32767, 0),  0), ((72, 0),  58,  0, (72, 0),
            1)));
            Table.States (15).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (72, 0),  1)));
            Table.States (16).Action_List.Set_Capacity (3);
            Add_Action (Table.States (16), (29, 32, 36), (71, 2),  1);
            Table.States (16).Kernel := To_Vector ((0 => ((71, 2),  59,  0, (71, 2),  1)));
            Table.States (16).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (71, 2),  1)));
            Table.States (17).Action_List.Set_Capacity (5);
            Add_Action (Table.States (17), (29, 32, 33, 35, 36), (61, 0),  1);
            Table.States (17).Kernel := To_Vector ((0 => ((61, 0),  60,  0, (61, 0),  1)));
            Table.States (17).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 0),  1)));
            Table.States (18).Action_List.Set_Capacity (5);
            Add_Action (Table.States (18), 29, Reduce, (71, 1),  1);
            Add_Action (Table.States (18), 32, Reduce, (71, 1),  1);
            Add_Action (Table.States (18), 33, (61, 1), 50);
            Add_Action (Table.States (18), 35, Reduce, (45, 1),  1);
            Add_Action (Table.States (18), 36, Reduce, (71, 1),  1);
            Table.States (18).Kernel := To_Vector ((((45, 1),  61,  0, (45, 1),  1), ((61, 1),  61,  2, (32767, 0),
            0), ((71, 1),  61,  0, (71, 1),  1)));
            Table.States (18).Minimal_Complete_Actions := To_Vector (((Reduce, (45, 1),  1), (Reduce, (71, 1),  1)));
            Table.States (19).Action_List.Set_Capacity (3);
            Add_Action (Table.States (19), (29, 32, 36), (73, 0),  1);
            Table.States (19).Kernel := To_Vector ((0 => ((73, 0),  71,  0, (73, 0),  1)));
            Table.States (19).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 0),  1)));
            Table.States (20).Action_List.Set_Capacity (2);
            Add_Action (Table.States (20), 32, (72, 1), 51);
            Add_Action (Table.States (20), 36, (75, 0), 52);
            Table.States (20).Kernel := To_Vector ((((72, 1),  72,  1, (32767, 0),  0), ((75, 0),  72,  1, (32767, 0),
            0)));
            Table.States (20).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (75, 0),  36, 52)));
            Table.States (21).Action_List.Set_Capacity (3);
            Add_Action (Table.States (21), (29, 32, 36), (58, 0),  1);
            Table.States (21).Kernel := To_Vector ((0 => ((58, 0),  73,  0, (58, 0),  1)));
            Table.States (21).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  1)));
            Table.States (22).Action_List.Set_Capacity (8);
            Add_Action (Table.States (22), (5, 7, 9, 17, 21, 24, 28, 41), (51, 1),  2);
            Table.States (22).Kernel := To_Vector ((0 => ((51, 1),  75,  0, (51, 1),  2)));
            Table.States (22).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (51, 1),  2)));
            Table.States (23).Action_List.Set_Capacity (2);
            Add_Action (Table.States (23), (21, 41), (68, 1),  1);
            Table.States (23).Kernel := To_Vector ((0 => ((68, 1),  5,  0, (68, 1),  1)));
            Table.States (23).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (68, 1),  1)));
            Table.States (24).Action_List.Set_Capacity (3);
            Add_Action (Table.States (24), 17, (68, 4), 53);
            Add_Action (Table.States (24), 21, Reduce, (68, 3),  1);
            Add_Action (Table.States (24), 41, Reduce, (68, 3),  1);
            Table.States (24).Kernel := To_Vector ((((68, 3),  7,  0, (68, 3),  1), ((68, 4),  7,  1, (32767, 0),
            0)));
            Table.States (24).Minimal_Complete_Actions := To_Vector (((Reduce, (68, 3),  1), (Shift, (68, 4),  17,
            53)));
            Table.States (25).Action_List.Set_Capacity (2);
            Add_Action (Table.States (25), (21, 41), (68, 6),  1);
            Table.States (25).Kernel := To_Vector ((0 => ((68, 6),  9,  0, (68, 6),  1)));
            Table.States (25).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (68, 6),  1)));
            Table.States (26).Action_List.Set_Capacity (2);
            Add_Action (Table.States (26), (21, 41), (68, 5),  1);
            Table.States (26).Kernel := To_Vector ((0 => ((68, 5),  17,  0, (68, 5),  1)));
            Table.States (26).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (68, 5),  1)));
            Table.States (27).Action_List.Set_Capacity (2);
            Add_Action (Table.States (27), (21, 41), (68, 2),  1);
            Table.States (27).Kernel := To_Vector ((0 => ((68, 2),  24,  0, (68, 2),  1)));
            Table.States (27).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (68, 2),  1)));
            Table.States (28).Action_List.Set_Capacity (2);
            Add_Action (Table.States (28), 21, (67, 0), 54);
            Add_Action (Table.States (28), 41, Reduce, (66, 0),  0);
            Table.States (28).Goto_List.Set_Capacity (3);
            Add_Goto (Table.States (28), 66, 55);
            Add_Goto (Table.States (28), 67, 56);
            Add_Goto (Table.States (28), 70, 57);
            Table.States (28).Kernel := To_Vector ((0 => ((50, 0),  68,  0, (66, 0),  0)));
            Table.States (28).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (66, 0),  0)));
            Table.States (29).Action_List.Set_Capacity (11);
            Add_Action (Table.States (29), 12, (59, 0), 32);
            Add_Action (Table.States (29), 13, (59, 1), 33);
            Add_Action (Table.States (29), 16, (43, 0), 34);
            Add_Action (Table.States (29), 21, (45, 0), 9);
            Add_Action (Table.States (29), 23, Reduce, (60, 0),  0);
            Add_Action (Table.States (29), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (29), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (29), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (29), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (29), 39, (60, 1), 36);
            Add_Action (Table.States (29), 40, (71, 0), 37);
            Table.States (29).Goto_List.Set_Capacity (10);
            Add_Goto (Table.States (29), 43, 38);
            Add_Goto (Table.States (29), 45, 39);
            Add_Goto (Table.States (29), 46, 40);
            Add_Goto (Table.States (29), 58, 41);
            Add_Goto (Table.States (29), 59, 42);
            Add_Goto (Table.States (29), 60, 43);
            Add_Goto (Table.States (29), 61, 44);
            Add_Goto (Table.States (29), 71, 45);
            Add_Goto (Table.States (29), 72, 46);
            Add_Goto (Table.States (29), 73, 47);
            Table.States (29).Kernel := To_Vector ((0 => ((43, 0),  16,  1, (32767, 0),  0)));
            Table.States (29).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (72, 0),  0)));
            Table.States (30).Action_List.Set_Capacity (3);
            Add_Action (Table.States (30), (29, 32, 36), (59, 0),  2);
            Table.States (30).Kernel := To_Vector ((0 => ((59, 0),  43,  0, (59, 0),  2)));
            Table.States (30).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (59, 0),  2)));
            Table.States (31).Action_List.Set_Capacity (3);
            Add_Action (Table.States (31), (29, 32, 36), (59, 1),  2);
            Table.States (31).Kernel := To_Vector ((0 => ((59, 1),  43,  0, (59, 1),  2)));
            Table.States (31).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (59, 1),  2)));
            Table.States (32).Action_List.Set_Capacity (1);
            Add_Action (Table.States (32), 16, (43, 0), 58);
            Table.States (32).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (32), 43, 59);
            Table.States (32).Kernel := To_Vector ((0 => ((59, 0),  12,  2, (32767, 0),  0)));
            Table.States (32).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  16, 58)));
            Table.States (33).Action_List.Set_Capacity (1);
            Add_Action (Table.States (33), 16, (43, 0), 58);
            Table.States (33).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (33), 43, 60);
            Table.States (33).Kernel := To_Vector ((0 => ((59, 1),  13,  2, (32767, 0),  0)));
            Table.States (33).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  16, 58)));
            Table.States (34).Action_List.Set_Capacity (11);
            Add_Action (Table.States (34), 12, (59, 0), 32);
            Add_Action (Table.States (34), 13, (59, 1), 33);
            Add_Action (Table.States (34), 16, (43, 0), 34);
            Add_Action (Table.States (34), 21, (45, 0), 9);
            Add_Action (Table.States (34), 23, (73, 1), 61);
            Add_Conflict (Table.States (34), 23, (60, 0),  0);
            Add_Action (Table.States (34), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (34), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (34), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (34), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (34), 39, (60, 1), 36);
            Add_Action (Table.States (34), 40, (71, 0), 37);
            Table.States (34).Goto_List.Set_Capacity (10);
            Add_Goto (Table.States (34), 43, 38);
            Add_Goto (Table.States (34), 45, 39);
            Add_Goto (Table.States (34), 46, 40);
            Add_Goto (Table.States (34), 58, 41);
            Add_Goto (Table.States (34), 59, 42);
            Add_Goto (Table.States (34), 60, 43);
            Add_Goto (Table.States (34), 61, 44);
            Add_Goto (Table.States (34), 71, 45);
            Add_Goto (Table.States (34), 72, 62);
            Add_Goto (Table.States (34), 73, 47);
            Table.States (34).Kernel := To_Vector ((((43, 0),  16,  1, (32767, 0),  0), ((73, 1),  16,  1, (32767, 0),
            0)));
            Table.States (34).Minimal_Complete_Actions := To_Vector (((Reduce, (72, 0),  0), (Shift, (73, 1),  23,
            61)));
            Table.States (35).Action_List.Set_Capacity (3);
            Add_Action (Table.States (35), (29, 32, 36), (73, 1),  2);
            Table.States (35).Kernel := To_Vector ((0 => ((73, 1),  23,  0, (73, 1),  2)));
            Table.States (35).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 1),  2)));
            Table.States (36).Action_List.Set_Capacity (5);
            Add_Action (Table.States (36), (23, 29, 32, 33, 35), (60, 1),  1);
            Table.States (36).Kernel := To_Vector ((0 => ((60, 1),  39,  0, (60, 1),  1)));
            Table.States (36).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 1),  1)));
            Table.States (37).Action_List.Set_Capacity (3);
            Add_Action (Table.States (37), (23, 29, 32), (71, 0),  1);
            Table.States (37).Kernel := To_Vector ((0 => ((71, 0),  40,  0, (71, 0),  1)));
            Table.States (37).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (71, 0),  1)));
            Table.States (38).Action_List.Set_Capacity (3);
            Add_Action (Table.States (38), (23, 29, 32), (73, 2),  1);
            Table.States (38).Kernel := To_Vector ((0 => ((73, 2),  43,  0, (73, 2),  1)));
            Table.States (38).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 2),  1)));
            Table.States (39).Action_List.Set_Capacity (1);
            Add_Action (Table.States (39), 35, (46, 0), 63);
            Table.States (39).Kernel := To_Vector ((((46, 0),  45,  2, (32767, 0),  0), ((46, 1),  45,  5, (32767, 0),
            0)));
            Table.States (39).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 0),  35, 63)));
            Table.States (40).Action_List.Set_Capacity (3);
            Add_Action (Table.States (40), (23, 29, 32), (71, 3),  1);
            Table.States (40).Kernel := To_Vector ((0 => ((71, 3),  46,  0, (71, 3),  1)));
            Table.States (40).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (71, 3),  1)));
            Table.States (41).Action_List.Set_Capacity (3);
            Add_Action (Table.States (41), 23, Reduce, (72, 0),  1);
            Add_Action (Table.States (41), 29, (58, 1), 64);
            Add_Action (Table.States (41), 32, Reduce, (72, 0),  1);
            Table.States (41).Kernel := To_Vector ((((58, 1),  58,  1, (32767, 0),  0), ((72, 0),  58,  0, (72, 0),
            1)));
            Table.States (41).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (72, 0),  1)));
            Table.States (42).Action_List.Set_Capacity (3);
            Add_Action (Table.States (42), (23, 29, 32), (71, 2),  1);
            Table.States (42).Kernel := To_Vector ((0 => ((71, 2),  59,  0, (71, 2),  1)));
            Table.States (42).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (71, 2),  1)));
            Table.States (43).Action_List.Set_Capacity (5);
            Add_Action (Table.States (43), (23, 29, 32, 33, 35), (61, 0),  1);
            Table.States (43).Kernel := To_Vector ((0 => ((61, 0),  60,  0, (61, 0),  1)));
            Table.States (43).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 0),  1)));
            Table.States (44).Action_List.Set_Capacity (5);
            Add_Action (Table.States (44), 23, Reduce, (71, 1),  1);
            Add_Action (Table.States (44), 29, Reduce, (71, 1),  1);
            Add_Action (Table.States (44), 32, Reduce, (71, 1),  1);
            Add_Action (Table.States (44), 33, (61, 1), 65);
            Add_Action (Table.States (44), 35, Reduce, (45, 1),  1);
            Table.States (44).Kernel := To_Vector ((((45, 1),  61,  0, (45, 1),  1), ((61, 1),  61,  2, (32767, 0),
            0), ((71, 1),  61,  0, (71, 1),  1)));
            Table.States (44).Minimal_Complete_Actions := To_Vector (((Reduce, (45, 1),  1), (Reduce, (71, 1),  1)));
            Table.States (45).Action_List.Set_Capacity (3);
            Add_Action (Table.States (45), (23, 29, 32), (73, 0),  1);
            Table.States (45).Kernel := To_Vector ((0 => ((73, 0),  71,  0, (73, 0),  1)));
            Table.States (45).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 0),  1)));
            Table.States (46).Action_List.Set_Capacity (2);
            Add_Action (Table.States (46), 23, (43, 0), 66);
            Add_Action (Table.States (46), 32, (72, 1), 67);
            Table.States (46).Kernel := To_Vector ((((43, 0),  72,  1, (32767, 0),  0), ((72, 1),  72,  1, (32767, 0),
            0)));
            Table.States (46).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  23, 66)));
            Table.States (47).Action_List.Set_Capacity (3);
            Add_Action (Table.States (47), (23, 29, 32), (58, 0),  1);
            Table.States (47).Kernel := To_Vector ((0 => ((58, 0),  73,  0, (58, 0),  1)));
            Table.States (47).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  1)));
            Table.States (48).Action_List.Set_Capacity (1);
            Add_Action (Table.States (48), 39, (46, 0), 68);
            Table.States (48).Kernel := To_Vector ((((46, 0),  35,  1, (32767, 0),  0), ((46, 1),  35,  4, (32767, 0),
            0)));
            Table.States (48).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 0),  39, 68)));
            Table.States (49).Action_List.Set_Capacity (11);
            Add_Action (Table.States (49), 12, (59, 0), 6);
            Add_Action (Table.States (49), 13, (59, 1), 7);
            Add_Action (Table.States (49), 16, (43, 0), 8);
            Add_Action (Table.States (49), 21, (45, 0), 9);
            Add_Action (Table.States (49), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (49), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (49), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (49), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (49), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (49), 39, (60, 1), 10);
            Add_Action (Table.States (49), 40, (71, 0), 11);
            Table.States (49).Goto_List.Set_Capacity (8);
            Add_Goto (Table.States (49), 43, 12);
            Add_Goto (Table.States (49), 45, 13);
            Add_Goto (Table.States (49), 46, 14);
            Add_Goto (Table.States (49), 59, 16);
            Add_Goto (Table.States (49), 60, 17);
            Add_Goto (Table.States (49), 61, 18);
            Add_Goto (Table.States (49), 71, 19);
            Add_Goto (Table.States (49), 73, 69);
            Table.States (49).Kernel := To_Vector ((0 => ((58, 1),  29,  0, (73, 0),  0)));
            Table.States (49).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 0),  0)));
         end Subr_1;
         procedure Subr_2
         is begin
            Table.States (50).Action_List.Set_Capacity (1);
            Add_Action (Table.States (50), 39, (61, 1), 70);
            Table.States (50).Kernel := To_Vector ((0 => ((61, 1),  33,  1, (32767, 0),  0)));
            Table.States (50).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (61, 1),  39, 70)));
            Table.States (51).Action_List.Set_Capacity (11);
            Add_Action (Table.States (51), 12, (59, 0), 6);
            Add_Action (Table.States (51), 13, (59, 1), 7);
            Add_Action (Table.States (51), 16, (43, 0), 8);
            Add_Action (Table.States (51), 21, (45, 0), 9);
            Add_Action (Table.States (51), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (51), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (51), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (51), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (51), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (51), 39, (60, 1), 10);
            Add_Action (Table.States (51), 40, (71, 0), 11);
            Table.States (51).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (51), 43, 12);
            Add_Goto (Table.States (51), 45, 13);
            Add_Goto (Table.States (51), 46, 14);
            Add_Goto (Table.States (51), 58, 71);
            Add_Goto (Table.States (51), 59, 16);
            Add_Goto (Table.States (51), 60, 17);
            Add_Goto (Table.States (51), 61, 18);
            Add_Goto (Table.States (51), 71, 19);
            Add_Goto (Table.States (51), 73, 21);
            Table.States (51).Kernel := To_Vector ((0 => ((72, 1),  32,  0, (58, 1),  0)));
            Table.States (51).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 1),  0)));
            Table.States (52).Action_List.Set_Capacity (8);
            Add_Action (Table.States (52), (5, 7, 9, 17, 21, 24, 28, 41), (75, 0),  3);
            Table.States (52).Kernel := To_Vector ((0 => ((75, 0),  36,  0, (75, 0),  3)));
            Table.States (52).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (75, 0),  3)));
            Table.States (53).Action_List.Set_Capacity (2);
            Add_Action (Table.States (53), (21, 41), (68, 4),  2);
            Table.States (53).Kernel := To_Vector ((0 => ((68, 4),  17,  0, (68, 4),  2)));
            Table.States (53).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (68, 4),  2)));
            Table.States (54).Action_List.Set_Capacity (3);
            Add_Action (Table.States (54), 11, Reduce, (60, 0),  0);
            Add_Action (Table.States (54), 15, Reduce, (60, 0),  0);
            Add_Action (Table.States (54), 39, (60, 1), 72);
            Table.States (54).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (54), 60, 73);
            Table.States (54).Kernel := To_Vector ((((67, 0),  21,  5, (32767, 0),  0), ((70, 0),  21,  3, (32767, 0),
            0)));
            Table.States (54).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 0),  0)));
            Table.States (55).Action_List.Set_Capacity (1);
            Add_Action (Table.States (55), (1 =>  41), (50, 0),  3);
            Table.States (55).Kernel := To_Vector ((0 => ((50, 0),  66,  0, (50, 0),  3)));
            Table.States (55).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (50, 0),  3)));
            Table.States (56).Action_List.Set_Capacity (1);
            Add_Action (Table.States (56), (1 =>  41), (66, 2),  1);
            Table.States (56).Kernel := To_Vector ((0 => ((66, 2),  67,  0, (66, 2),  1)));
            Table.States (56).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (66, 2),  1)));
            Table.States (57).Action_List.Set_Capacity (1);
            Add_Action (Table.States (57), (1 =>  41), (66, 1),  1);
            Table.States (57).Kernel := To_Vector ((0 => ((66, 1),  70,  0, (66, 1),  1)));
            Table.States (57).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (66, 1),  1)));
            Table.States (58).Action_List.Set_Capacity (11);
            Add_Action (Table.States (58), 12, (59, 0), 32);
            Add_Action (Table.States (58), 13, (59, 1), 33);
            Add_Action (Table.States (58), 16, (43, 0), 34);
            Add_Action (Table.States (58), 21, (45, 0), 9);
            Add_Action (Table.States (58), 23, Reduce, (60, 0),  0);
            Add_Action (Table.States (58), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (58), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (58), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (58), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (58), 39, (60, 1), 36);
            Add_Action (Table.States (58), 40, (71, 0), 37);
            Table.States (58).Goto_List.Set_Capacity (10);
            Add_Goto (Table.States (58), 43, 38);
            Add_Goto (Table.States (58), 45, 39);
            Add_Goto (Table.States (58), 46, 40);
            Add_Goto (Table.States (58), 58, 41);
            Add_Goto (Table.States (58), 59, 42);
            Add_Goto (Table.States (58), 60, 43);
            Add_Goto (Table.States (58), 61, 44);
            Add_Goto (Table.States (58), 71, 45);
            Add_Goto (Table.States (58), 72, 62);
            Add_Goto (Table.States (58), 73, 47);
            Table.States (58).Kernel := To_Vector ((0 => ((43, 0),  16,  1, (32767, 0),  0)));
            Table.States (58).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (72, 0),  0)));
            Table.States (59).Action_List.Set_Capacity (3);
            Add_Action (Table.States (59), (23, 29, 32), (59, 0),  2);
            Table.States (59).Kernel := To_Vector ((0 => ((59, 0),  43,  0, (59, 0),  2)));
            Table.States (59).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (59, 0),  2)));
            Table.States (60).Action_List.Set_Capacity (3);
            Add_Action (Table.States (60), (23, 29, 32), (59, 1),  2);
            Table.States (60).Kernel := To_Vector ((0 => ((59, 1),  43,  0, (59, 1),  2)));
            Table.States (60).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (59, 1),  2)));
            Table.States (61).Action_List.Set_Capacity (3);
            Add_Action (Table.States (61), (23, 29, 32), (73, 1),  2);
            Table.States (61).Kernel := To_Vector ((0 => ((73, 1),  23,  0, (73, 1),  2)));
            Table.States (61).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 1),  2)));
            Table.States (62).Action_List.Set_Capacity (2);
            Add_Action (Table.States (62), 23, (43, 0), 74);
            Add_Action (Table.States (62), 32, (72, 1), 67);
            Table.States (62).Kernel := To_Vector ((((43, 0),  72,  1, (32767, 0),  0), ((72, 1),  72,  1, (32767, 0),
            0)));
            Table.States (62).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  23, 74)));
            Table.States (63).Action_List.Set_Capacity (1);
            Add_Action (Table.States (63), 39, (46, 0), 75);
            Table.States (63).Kernel := To_Vector ((((46, 0),  35,  1, (32767, 0),  0), ((46, 1),  35,  4, (32767, 0),
            0)));
            Table.States (63).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 0),  39, 75)));
            Table.States (64).Action_List.Set_Capacity (11);
            Add_Action (Table.States (64), 12, (59, 0), 32);
            Add_Action (Table.States (64), 13, (59, 1), 33);
            Add_Action (Table.States (64), 16, (43, 0), 34);
            Add_Action (Table.States (64), 21, (45, 0), 9);
            Add_Action (Table.States (64), 23, Reduce, (60, 0),  0);
            Add_Action (Table.States (64), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (64), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (64), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (64), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (64), 39, (60, 1), 36);
            Add_Action (Table.States (64), 40, (71, 0), 37);
            Table.States (64).Goto_List.Set_Capacity (8);
            Add_Goto (Table.States (64), 43, 38);
            Add_Goto (Table.States (64), 45, 39);
            Add_Goto (Table.States (64), 46, 40);
            Add_Goto (Table.States (64), 59, 42);
            Add_Goto (Table.States (64), 60, 43);
            Add_Goto (Table.States (64), 61, 44);
            Add_Goto (Table.States (64), 71, 45);
            Add_Goto (Table.States (64), 73, 76);
            Table.States (64).Kernel := To_Vector ((0 => ((58, 1),  29,  0, (73, 0),  0)));
            Table.States (64).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 0),  0)));
            Table.States (65).Action_List.Set_Capacity (1);
            Add_Action (Table.States (65), 39, (61, 1), 77);
            Table.States (65).Kernel := To_Vector ((0 => ((61, 1),  33,  1, (32767, 0),  0)));
            Table.States (65).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (61, 1),  39, 77)));
            Table.States (66).Action_List.Set_Capacity (3);
            Add_Action (Table.States (66), (29, 32, 36), (43, 0),  3);
            Table.States (66).Kernel := To_Vector ((0 => ((43, 0),  23,  0, (43, 0),  3)));
            Table.States (66).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (43, 0),  3)));
            Table.States (67).Action_List.Set_Capacity (11);
            Add_Action (Table.States (67), 12, (59, 0), 32);
            Add_Action (Table.States (67), 13, (59, 1), 33);
            Add_Action (Table.States (67), 16, (43, 0), 34);
            Add_Action (Table.States (67), 21, (45, 0), 9);
            Add_Action (Table.States (67), 23, Reduce, (60, 0),  0);
            Add_Action (Table.States (67), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (67), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (67), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (67), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (67), 39, (60, 1), 36);
            Add_Action (Table.States (67), 40, (71, 0), 37);
            Table.States (67).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (67), 43, 38);
            Add_Goto (Table.States (67), 45, 39);
            Add_Goto (Table.States (67), 46, 40);
            Add_Goto (Table.States (67), 58, 78);
            Add_Goto (Table.States (67), 59, 42);
            Add_Goto (Table.States (67), 60, 43);
            Add_Goto (Table.States (67), 61, 44);
            Add_Goto (Table.States (67), 71, 45);
            Add_Goto (Table.States (67), 73, 47);
            Table.States (67).Kernel := To_Vector ((0 => ((72, 1),  32,  0, (58, 1),  0)));
            Table.States (67).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 1),  0)));
            Table.States (68).Action_List.Set_Capacity (4);
            Add_Action (Table.States (68), 16, (46, 1), 79);
            Add_Action (Table.States (68), 29, Reduce, (46, 0),  3);
            Add_Action (Table.States (68), 32, Reduce, (46, 0),  3);
            Add_Action (Table.States (68), 36, Reduce, (46, 0),  3);
            Table.States (68).Kernel := To_Vector ((((46, 0),  39,  0, (46, 0),  3), ((46, 1),  39,  3, (32767, 0),
            0)));
            Table.States (68).Minimal_Complete_Actions := To_Vector (((Reduce, (46, 0),  3), (Shift, (46, 1),  16,
            79)));
            Table.States (69).Action_List.Set_Capacity (3);
            Add_Action (Table.States (69), (29, 32, 36), (58, 1),  3);
            Table.States (69).Kernel := To_Vector ((0 => ((58, 1),  73,  0, (58, 1),  3)));
            Table.States (69).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 1),  3)));
            Table.States (70).Action_List.Set_Capacity (5);
            Add_Action (Table.States (70), (29, 32, 33, 35, 36), (61, 1),  3);
            Table.States (70).Kernel := To_Vector ((0 => ((61, 1),  39,  0, (61, 1),  3)));
            Table.States (70).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 1),  3)));
            Table.States (71).Action_List.Set_Capacity (3);
            Add_Action (Table.States (71), 29, (58, 1), 49);
            Add_Action (Table.States (71), 32, Reduce, (72, 1),  3);
            Add_Action (Table.States (71), 36, Reduce, (72, 1),  3);
            Table.States (71).Kernel := To_Vector ((((58, 1),  58,  1, (32767, 0),  0), ((72, 1),  58,  0, (72, 1),
            3)));
            Table.States (71).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (72, 1),  3)));
            Table.States (72).Action_List.Set_Capacity (2);
            Add_Action (Table.States (72), (11, 15), (60, 1),  1);
            Table.States (72).Kernel := To_Vector ((0 => ((60, 1),  39,  0, (60, 1),  1)));
            Table.States (72).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 1),  1)));
            Table.States (73).Action_List.Set_Capacity (2);
            Add_Action (Table.States (73), 11, (67, 0), 80);
            Add_Action (Table.States (73), 15, (70, 0), 81);
            Table.States (73).Kernel := To_Vector ((((67, 0),  60,  5, (32767, 0),  0), ((70, 0),  60,  3, (32767, 0),
            0)));
            Table.States (73).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (70, 0),  15, 81)));
            Table.States (74).Action_List.Set_Capacity (3);
            Add_Action (Table.States (74), (23, 29, 32), (43, 0),  3);
            Table.States (74).Kernel := To_Vector ((0 => ((43, 0),  23,  0, (43, 0),  3)));
            Table.States (74).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (43, 0),  3)));
            Table.States (75).Action_List.Set_Capacity (4);
            Add_Action (Table.States (75), 16, (46, 1), 82);
            Add_Action (Table.States (75), 23, Reduce, (46, 0),  3);
            Add_Action (Table.States (75), 29, Reduce, (46, 0),  3);
            Add_Action (Table.States (75), 32, Reduce, (46, 0),  3);
            Table.States (75).Kernel := To_Vector ((((46, 0),  39,  0, (46, 0),  3), ((46, 1),  39,  3, (32767, 0),
            0)));
            Table.States (75).Minimal_Complete_Actions := To_Vector (((Reduce, (46, 0),  3), (Shift, (46, 1),  16,
            82)));
            Table.States (76).Action_List.Set_Capacity (3);
            Add_Action (Table.States (76), (23, 29, 32), (58, 1),  3);
            Table.States (76).Kernel := To_Vector ((0 => ((58, 1),  73,  0, (58, 1),  3)));
            Table.States (76).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 1),  3)));
            Table.States (77).Action_List.Set_Capacity (5);
            Add_Action (Table.States (77), (23, 29, 32, 33, 35), (61, 1),  3);
            Table.States (77).Kernel := To_Vector ((0 => ((61, 1),  39,  0, (61, 1),  3)));
            Table.States (77).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 1),  3)));
            Table.States (78).Action_List.Set_Capacity (3);
            Add_Action (Table.States (78), 23, Reduce, (72, 1),  3);
            Add_Action (Table.States (78), 29, (58, 1), 64);
            Add_Action (Table.States (78), 32, Reduce, (72, 1),  3);
            Table.States (78).Kernel := To_Vector ((((58, 1),  58,  1, (32767, 0),  0), ((72, 1),  58,  0, (72, 1),
            3)));
            Table.States (78).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (72, 1),  3)));
            Table.States (79).Action_List.Set_Capacity (1);
            Add_Action (Table.States (79), 40, (46, 1), 83);
            Table.States (79).Kernel := To_Vector ((0 => ((46, 1),  16,  2, (32767, 0),  0)));
            Table.States (79).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 1),  40, 83)));
            Table.States (80).Action_List.Set_Capacity (1);
            Add_Action (Table.States (80), 40, (67, 0), 84);
            Table.States (80).Kernel := To_Vector ((0 => ((67, 0),  11,  4, (32767, 0),  0)));
            Table.States (80).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (67, 0),  40, 84)));
            Table.States (81).Action_List.Set_Capacity (7);
            Add_Action (Table.States (81), 8, (47, 0), 85);
            Add_Action (Table.States (81), 10, Reduce, (55, 0),  0);
            Add_Action (Table.States (81), 14, (44, 0), 86);
            Add_Action (Table.States (81), 18, (69, 4), 87);
            Add_Action (Table.States (81), 20, (63, 0), 88);
            Add_Action (Table.States (81), 25, (74, 0), 89);
            Add_Action (Table.States (81), 39, (69, 0), 90);
            Table.States (81).Goto_List.Set_Capacity (11);
            Add_Goto (Table.States (81), 44, 91);
            Add_Goto (Table.States (81), 47, 92);
            Add_Goto (Table.States (81), 53, 93);
            Add_Goto (Table.States (81), 54, 94);
            Add_Goto (Table.States (81), 55, 95);
            Add_Goto (Table.States (81), 62, 96);
            Add_Goto (Table.States (81), 63, 97);
            Add_Goto (Table.States (81), 64, 98);
            Add_Goto (Table.States (81), 65, 99);
            Add_Goto (Table.States (81), 69, 100);
            Add_Goto (Table.States (81), 74, 101);
            Table.States (81).Kernel := To_Vector ((0 => ((70, 0),  15,  2, (32767, 0),  0)));
            Table.States (81).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (55, 0),  0)));
            Table.States (82).Action_List.Set_Capacity (1);
            Add_Action (Table.States (82), 40, (46, 1), 102);
            Table.States (82).Kernel := To_Vector ((0 => ((46, 1),  16,  2, (32767, 0),  0)));
            Table.States (82).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 1),  40, 102)));
            Table.States (83).Action_List.Set_Capacity (1);
            Add_Action (Table.States (83), 23, (46, 1), 103);
            Table.States (83).Kernel := To_Vector ((0 => ((46, 1),  40,  1, (32767, 0),  0)));
            Table.States (83).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 1),  23, 103)));
            Table.States (84).Action_List.Set_Capacity (1);
            Add_Action (Table.States (84), 15, (67, 0), 104);
            Table.States (84).Kernel := To_Vector ((0 => ((67, 0),  40,  3, (32767, 0),  0)));
            Table.States (84).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (67, 0),  15, 104)));
            Table.States (85).Action_List.Set_Capacity (3);
            Add_Action (Table.States (85), 15, Reduce, (60, 0),  0);
            Add_Action (Table.States (85), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (85), 39, (60, 1), 105);
            Table.States (85).Goto_List.Set_Capacity (2);
            Add_Goto (Table.States (85), 60, 106);
            Add_Goto (Table.States (85), 61, 107);
            Table.States (85).Kernel := To_Vector ((0 => ((47, 0),  8,  4, (32767, 0),  0)));
            Table.States (85).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 0),  0)));
            Table.States (86).Action_List.Set_Capacity (2);
            Add_Action (Table.States (86), 12, (44, 3), 108);
            Add_Action (Table.States (86), 39, (44, 0), 109);
            Table.States (86).Kernel := To_Vector ((((44, 0),  14,  3, (32767, 0),  0), ((44, 1),  14,  5, (32767, 0),
            0), ((44, 2),  14,  7, (32767, 0),  0), ((44, 3),  14,  6, (32767, 0),  0)));
            Table.States (86).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 0),  39, 109)));
            Table.States (87).Action_List.Set_Capacity (1);
            Add_Action (Table.States (87), 36, (69, 4), 110);
            Table.States (87).Kernel := To_Vector ((0 => ((69, 4),  18,  1, (32767, 0),  0)));
            Table.States (87).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (69, 4),  36, 110)));
            Table.States (88).Action_List.Set_Capacity (4);
            Add_Action (Table.States (88), 11, Reduce, (60, 0),  0);
            Add_Action (Table.States (88), 15, Reduce, (60, 0),  0);
            Add_Action (Table.States (88), 22, Reduce, (60, 0),  0);
            Add_Action (Table.States (88), 39, (60, 1), 111);
            Table.States (88).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (88), 60, 112);
            Table.States (88).Kernel := To_Vector ((((63, 0),  20,  3, (32767, 0),  0), ((64, 0),  20,  4, (32767, 0),
            0), ((65, 0),  20,  2, (32767, 0),  0)));
            Table.States (88).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 0),  0)));
            Table.States (89).Action_List.Set_Capacity (1);
            Add_Action (Table.States (89), 39, (74, 0), 113);
            Table.States (89).Kernel := To_Vector ((0 => ((74, 0),  25,  5, (32767, 0),  0)));
            Table.States (89).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (74, 0),  39, 113)));
            Table.States (90).Action_List.Set_Capacity (2);
            Add_Action (Table.States (90), 30, (69, 1), 114);
            Add_Action (Table.States (90), 31, (69, 0), 115);
            Table.States (90).Kernel := To_Vector ((((69, 0),  39,  2, (32767, 0),  0), ((69, 1),  39,  4, (32767, 0),
            0)));
            Table.States (90).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (69, 0),  31, 115)));
            Table.States (91).Action_List.Set_Capacity (7);
            Add_Action (Table.States (91), (8, 10, 14, 18, 20, 25, 39), (69, 2),  1);
            Table.States (91).Kernel := To_Vector ((0 => ((69, 2),  44,  0, (69, 2),  1)));
            Table.States (91).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (69, 2),  1)));
            Table.States (92).Action_List.Set_Capacity (7);
            Add_Action (Table.States (92), (8, 10, 14, 18, 20, 25, 39), (69, 3),  1);
            Table.States (92).Kernel := To_Vector ((0 => ((69, 3),  47,  0, (69, 3),  1)));
            Table.States (92).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (69, 3),  1)));
            Table.States (93).Action_List.Set_Capacity (7);
            Add_Action (Table.States (93), (8, 10, 14, 18, 20, 25, 39), (54, 0),  1);
            Table.States (93).Kernel := To_Vector ((0 => ((54, 0),  53,  0, (54, 0),  1)));
            Table.States (93).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (54, 0),  1)));
            Table.States (94).Action_List.Set_Capacity (7);
            Add_Action (Table.States (94), 8, (47, 0), 85);
            Add_Action (Table.States (94), 10, Reduce, (55, 1),  1);
            Add_Action (Table.States (94), 14, (44, 0), 86);
            Add_Action (Table.States (94), 18, (69, 4), 87);
            Add_Action (Table.States (94), 20, (63, 0), 88);
            Add_Action (Table.States (94), 25, (74, 0), 89);
            Add_Action (Table.States (94), 39, (69, 0), 90);
            Table.States (94).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (94), 44, 91);
            Add_Goto (Table.States (94), 47, 92);
            Add_Goto (Table.States (94), 53, 116);
            Add_Goto (Table.States (94), 62, 96);
            Add_Goto (Table.States (94), 63, 97);
            Add_Goto (Table.States (94), 64, 98);
            Add_Goto (Table.States (94), 65, 99);
            Add_Goto (Table.States (94), 69, 100);
            Add_Goto (Table.States (94), 74, 101);
            Table.States (94).Kernel := To_Vector ((((54, 1),  54,  2, (32767, 0),  0), ((55, 1),  54,  0, (55, 1),
            1)));
            Table.States (94).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (55, 1),  1)));
            Table.States (95).Action_List.Set_Capacity (1);
            Add_Action (Table.States (95), 10, (70, 0), 117);
            Table.States (95).Kernel := To_Vector ((0 => ((70, 0),  55,  2, (32767, 0),  0)));
            Table.States (95).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (70, 0),  10, 117)));
            Table.States (96).Action_List.Set_Capacity (7);
            Add_Action (Table.States (96), (8, 10, 14, 18, 20, 25, 39), (53, 2),  1);
            Table.States (96).Kernel := To_Vector ((0 => ((53, 2),  62,  0, (53, 2),  1)));
            Table.States (96).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (53, 2),  1)));
            Table.States (97).Action_List.Set_Capacity (7);
            Add_Action (Table.States (97), (8, 10, 14, 18, 20, 25, 39), (62, 0),  1);
            Table.States (97).Kernel := To_Vector ((0 => ((62, 0),  63,  0, (62, 0),  1)));
            Table.States (97).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (62, 0),  1)));
            Table.States (98).Action_List.Set_Capacity (7);
            Add_Action (Table.States (98), (8, 10, 14, 18, 20, 25, 39), (62, 1),  1);
            Table.States (98).Kernel := To_Vector ((0 => ((62, 1),  64,  0, (62, 1),  1)));
            Table.States (98).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (62, 1),  1)));
            Table.States (99).Action_List.Set_Capacity (7);
            Add_Action (Table.States (99), (8, 10, 14, 18, 20, 25, 39), (62, 2),  1);
            Table.States (99).Kernel := To_Vector ((0 => ((62, 2),  65,  0, (62, 2),  1)));
            Table.States (99).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (62, 2),  1)));
            Table.States (100).Action_List.Set_Capacity (7);
            Add_Action (Table.States (100), (8, 10, 14, 18, 20, 25, 39), (53, 0),  1);
            Table.States (100).Kernel := To_Vector ((0 => ((53, 0),  69,  0, (53, 0),  1)));
            Table.States (100).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (53, 0),  1)));
            Table.States (101).Action_List.Set_Capacity (7);
            Add_Action (Table.States (101), (8, 10, 14, 18, 20, 25, 39), (53, 1),  1);
            Table.States (101).Kernel := To_Vector ((0 => ((53, 1),  74,  0, (53, 1),  1)));
            Table.States (101).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (53, 1),  1)));
            Table.States (102).Action_List.Set_Capacity (1);
            Add_Action (Table.States (102), 23, (46, 1), 118);
            Table.States (102).Kernel := To_Vector ((0 => ((46, 1),  40,  1, (32767, 0),  0)));
            Table.States (102).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 1),  23, 118)));
            Table.States (103).Action_List.Set_Capacity (3);
            Add_Action (Table.States (103), (29, 32, 36), (46, 1),  6);
            Table.States (103).Kernel := To_Vector ((0 => ((46, 1),  23,  0, (46, 1),  6)));
            Table.States (103).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (46, 1),  6)));
         end Subr_2;
         procedure Subr_3
         is begin
            Table.States (104).Action_List.Set_Capacity (7);
            Add_Action (Table.States (104), 8, (47, 0), 85);
            Add_Action (Table.States (104), 10, Reduce, (55, 0),  0);
            Add_Action (Table.States (104), 14, (44, 0), 86);
            Add_Action (Table.States (104), 18, (69, 4), 87);
            Add_Action (Table.States (104), 20, (63, 0), 88);
            Add_Action (Table.States (104), 25, (74, 0), 89);
            Add_Action (Table.States (104), 39, (69, 0), 90);
            Table.States (104).Goto_List.Set_Capacity (11);
            Add_Goto (Table.States (104), 44, 91);
            Add_Goto (Table.States (104), 47, 92);
            Add_Goto (Table.States (104), 53, 93);
            Add_Goto (Table.States (104), 54, 94);
            Add_Goto (Table.States (104), 55, 119);
            Add_Goto (Table.States (104), 62, 96);
            Add_Goto (Table.States (104), 63, 97);
            Add_Goto (Table.States (104), 64, 98);
            Add_Goto (Table.States (104), 65, 99);
            Add_Goto (Table.States (104), 69, 100);
            Add_Goto (Table.States (104), 74, 101);
            Table.States (104).Kernel := To_Vector ((0 => ((67, 0),  15,  2, (32767, 0),  0)));
            Table.States (104).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (55, 0),  0)));
            Table.States (105).Action_List.Set_Capacity (2);
            Add_Action (Table.States (105), (15, 33), (60, 1),  1);
            Table.States (105).Kernel := To_Vector ((0 => ((60, 1),  39,  0, (60, 1),  1)));
            Table.States (105).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 1),  1)));
            Table.States (106).Action_List.Set_Capacity (2);
            Add_Action (Table.States (106), (15, 33), (61, 0),  1);
            Table.States (106).Kernel := To_Vector ((0 => ((61, 0),  60,  0, (61, 0),  1)));
            Table.States (106).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 0),  1)));
            Table.States (107).Action_List.Set_Capacity (2);
            Add_Action (Table.States (107), 15, (47, 0), 120);
            Add_Action (Table.States (107), 33, (61, 1), 121);
            Table.States (107).Kernel := To_Vector ((((47, 0),  61,  4, (32767, 0),  0), ((61, 1),  61,  2, (32767, 0),
             0)));
            Table.States (107).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (47, 0),  15, 120)));
            Table.States (108).Action_List.Set_Capacity (1);
            Add_Action (Table.States (108), 16, (44, 3), 122);
            Table.States (108).Kernel := To_Vector ((0 => ((44, 3),  12,  5, (32767, 0),  0)));
            Table.States (108).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 3),  16, 122)));
            Table.States (109).Action_List.Set_Capacity (2);
            Add_Action (Table.States (109), 16, (44, 1), 123);
            Add_Action (Table.States (109), 26, (44, 0), 124);
            Table.States (109).Kernel := To_Vector ((((44, 0),  39,  2, (32767, 0),  0), ((44, 1),  39,  4, (32767, 0),
             0), ((44, 2),  39,  6, (32767, 0),  0)));
            Table.States (109).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 0),  26, 124)));
            Table.States (110).Action_List.Set_Capacity (7);
            Add_Action (Table.States (110), (8, 10, 14, 18, 20, 25, 39), (69, 4),  2);
            Table.States (110).Kernel := To_Vector ((0 => ((69, 4),  36,  0, (69, 4),  2)));
            Table.States (110).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (69, 4),  2)));
            Table.States (111).Action_List.Set_Capacity (3);
            Add_Action (Table.States (111), (11, 15, 22), (60, 1),  1);
            Table.States (111).Kernel := To_Vector ((0 => ((60, 1),  39,  0, (60, 1),  1)));
            Table.States (111).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 1),  1)));
            Table.States (112).Action_List.Set_Capacity (3);
            Add_Action (Table.States (112), 11, (64, 0), 125);
            Add_Action (Table.States (112), 15, (63, 0), 126);
            Add_Action (Table.States (112), 22, (65, 0), 127);
            Table.States (112).Kernel := To_Vector ((((63, 0),  60,  3, (32767, 0),  0), ((64, 0),  60,  4, (32767, 0),
             0), ((65, 0),  60,  2, (32767, 0),  0)));
            Table.States (112).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (65, 0),  22, 127)));
            Table.States (113).Action_List.Set_Capacity (1);
            Add_Action (Table.States (113), 15, (74, 0), 128);
            Table.States (113).Kernel := To_Vector ((0 => ((74, 0),  39,  4, (32767, 0),  0)));
            Table.States (113).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (74, 0),  15, 128)));
            Table.States (114).Action_List.Set_Capacity (1);
            Add_Action (Table.States (114), 39, (69, 1), 129);
            Table.States (114).Kernel := To_Vector ((0 => ((69, 1),  30,  3, (32767, 0),  0)));
            Table.States (114).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (69, 1),  39, 129)));
            Table.States (115).Action_List.Set_Capacity (10);
            Add_Action (Table.States (115), 12, (59, 0), 130);
            Add_Action (Table.States (115), 13, (59, 1), 131);
            Add_Action (Table.States (115), 16, (43, 0), 132);
            Add_Action (Table.States (115), 21, (45, 0), 9);
            Add_Action (Table.States (115), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (115), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (115), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (115), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (115), 39, (60, 1), 133);
            Add_Action (Table.States (115), 40, (71, 0), 134);
            Table.States (115).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (115), 43, 135);
            Add_Goto (Table.States (115), 45, 136);
            Add_Goto (Table.States (115), 46, 137);
            Add_Goto (Table.States (115), 58, 138);
            Add_Goto (Table.States (115), 59, 139);
            Add_Goto (Table.States (115), 60, 140);
            Add_Goto (Table.States (115), 61, 141);
            Add_Goto (Table.States (115), 71, 142);
            Add_Goto (Table.States (115), 73, 143);
            Table.States (115).Kernel := To_Vector ((0 => ((69, 0),  31,  1, (32767, 0),  0)));
            Table.States (115).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  0)));
            Table.States (116).Action_List.Set_Capacity (7);
            Add_Action (Table.States (116), (8, 10, 14, 18, 20, 25, 39), (54, 1),  2);
            Table.States (116).Kernel := To_Vector ((0 => ((54, 1),  53,  0, (54, 1),  2)));
            Table.States (116).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (54, 1),  2)));
            Table.States (117).Action_List.Set_Capacity (2);
            Add_Action (Table.States (117), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (117), 39, (60, 1), 144);
            Table.States (117).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (117), 60, 145);
            Table.States (117).Kernel := To_Vector ((0 => ((70, 0),  10,  1, (32767, 0),  0)));
            Table.States (117).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 0),  0)));
            Table.States (118).Action_List.Set_Capacity (3);
            Add_Action (Table.States (118), (23, 29, 32), (46, 1),  6);
            Table.States (118).Kernel := To_Vector ((0 => ((46, 1),  23,  0, (46, 1),  6)));
            Table.States (118).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (46, 1),  6)));
            Table.States (119).Action_List.Set_Capacity (1);
            Add_Action (Table.States (119), 10, (67, 0), 146);
            Table.States (119).Kernel := To_Vector ((0 => ((67, 0),  55,  2, (32767, 0),  0)));
            Table.States (119).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (67, 0),  10, 146)));
            Table.States (120).Action_List.Set_Capacity (2);
            Add_Action (Table.States (120), 10, Reduce, (49, 0),  0);
            Add_Action (Table.States (120), 27, (48, 0), 147);
            Add_Conflict (Table.States (120), 27, (49, 0),  0);
            Table.States (120).Goto_List.Set_Capacity (2);
            Add_Goto (Table.States (120), 48, 148);
            Add_Goto (Table.States (120), 49, 149);
            Table.States (120).Kernel := To_Vector ((0 => ((47, 0),  15,  3, (32767, 0),  0)));
            Table.States (120).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (49, 0),  0)));
            Table.States (121).Action_List.Set_Capacity (1);
            Add_Action (Table.States (121), 39, (61, 1), 150);
            Table.States (121).Kernel := To_Vector ((0 => ((61, 1),  33,  1, (32767, 0),  0)));
            Table.States (121).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (61, 1),  39, 150)));
            Table.States (122).Action_List.Set_Capacity (1);
            Add_Action (Table.States (122), 40, (44, 3), 151);
            Table.States (122).Kernel := To_Vector ((0 => ((44, 3),  16,  4, (32767, 0),  0)));
            Table.States (122).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 3),  40, 151)));
            Table.States (123).Action_List.Set_Capacity (3);
            Add_Action (Table.States (123), 19, (56, 2), 152);
            Add_Action (Table.States (123), 23, Reduce, (56, 0),  0);
            Add_Action (Table.States (123), 40, (56, 1), 153);
            Table.States (123).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (123), 56, 154);
            Table.States (123).Kernel := To_Vector ((((44, 1),  16,  3, (32767, 0),  0), ((44, 2),  16,  5, (32767, 0),
             0)));
            Table.States (123).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (56, 0),  0)));
            Table.States (124).Action_List.Set_Capacity (10);
            Add_Action (Table.States (124), 12, (59, 0), 130);
            Add_Action (Table.States (124), 13, (59, 1), 131);
            Add_Action (Table.States (124), 16, (43, 0), 132);
            Add_Action (Table.States (124), 21, (45, 0), 9);
            Add_Action (Table.States (124), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (124), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (124), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (124), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (124), 39, (60, 1), 133);
            Add_Action (Table.States (124), 40, (71, 0), 134);
            Table.States (124).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (124), 43, 135);
            Add_Goto (Table.States (124), 45, 136);
            Add_Goto (Table.States (124), 46, 137);
            Add_Goto (Table.States (124), 58, 155);
            Add_Goto (Table.States (124), 59, 139);
            Add_Goto (Table.States (124), 60, 140);
            Add_Goto (Table.States (124), 61, 141);
            Add_Goto (Table.States (124), 71, 142);
            Add_Goto (Table.States (124), 73, 143);
            Table.States (124).Kernel := To_Vector ((0 => ((44, 0),  26,  1, (32767, 0),  0)));
            Table.States (124).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  0)));
            Table.States (125).Action_List.Set_Capacity (3);
            Add_Action (Table.States (125), 15, Reduce, (60, 0),  0);
            Add_Action (Table.States (125), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (125), 39, (60, 1), 105);
            Table.States (125).Goto_List.Set_Capacity (2);
            Add_Goto (Table.States (125), 60, 106);
            Add_Goto (Table.States (125), 61, 156);
            Table.States (125).Kernel := To_Vector ((0 => ((64, 0),  11,  3, (32767, 0),  0)));
            Table.States (125).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 0),  0)));
            Table.States (126).Action_List.Set_Capacity (7);
            Add_Action (Table.States (126), 8, (47, 0), 85);
            Add_Action (Table.States (126), 10, Reduce, (55, 0),  0);
            Add_Action (Table.States (126), 14, (44, 0), 86);
            Add_Action (Table.States (126), 18, (69, 4), 87);
            Add_Action (Table.States (126), 20, (63, 0), 88);
            Add_Action (Table.States (126), 25, (74, 0), 89);
            Add_Action (Table.States (126), 39, (69, 0), 90);
            Table.States (126).Goto_List.Set_Capacity (11);
            Add_Goto (Table.States (126), 44, 91);
            Add_Goto (Table.States (126), 47, 92);
            Add_Goto (Table.States (126), 53, 93);
            Add_Goto (Table.States (126), 54, 94);
            Add_Goto (Table.States (126), 55, 157);
            Add_Goto (Table.States (126), 62, 96);
            Add_Goto (Table.States (126), 63, 97);
            Add_Goto (Table.States (126), 64, 98);
            Add_Goto (Table.States (126), 65, 99);
            Add_Goto (Table.States (126), 69, 100);
            Add_Goto (Table.States (126), 74, 101);
            Table.States (126).Kernel := To_Vector ((0 => ((63, 0),  15,  2, (32767, 0),  0)));
            Table.States (126).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (55, 0),  0)));
            Table.States (127).Action_List.Set_Capacity (3);
            Add_Action (Table.States (127), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (127), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (127), 39, (60, 1), 158);
            Table.States (127).Goto_List.Set_Capacity (2);
            Add_Goto (Table.States (127), 60, 159);
            Add_Goto (Table.States (127), 61, 160);
            Table.States (127).Kernel := To_Vector ((0 => ((65, 0),  22,  1, (32767, 0),  0)));
            Table.States (127).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 0),  0)));
            Table.States (128).Action_List.Set_Capacity (1);
            Add_Action (Table.States (128), 16, (43, 0), 161);
            Table.States (128).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (128), 43, 162);
            Table.States (128).Kernel := To_Vector ((0 => ((74, 0),  15,  3, (32767, 0),  0)));
            Table.States (128).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  16, 161)));
            Table.States (129).Action_List.Set_Capacity (1);
            Add_Action (Table.States (129), 31, (69, 1), 163);
            Table.States (129).Kernel := To_Vector ((0 => ((69, 1),  39,  2, (32767, 0),  0)));
            Table.States (129).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (69, 1),  31, 163)));
            Table.States (130).Action_List.Set_Capacity (1);
            Add_Action (Table.States (130), 16, (43, 0), 164);
            Table.States (130).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (130), 43, 165);
            Table.States (130).Kernel := To_Vector ((0 => ((59, 0),  12,  2, (32767, 0),  0)));
            Table.States (130).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  16, 164)));
            Table.States (131).Action_List.Set_Capacity (1);
            Add_Action (Table.States (131), 16, (43, 0), 164);
            Table.States (131).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (131), 43, 166);
            Table.States (131).Kernel := To_Vector ((0 => ((59, 1),  13,  2, (32767, 0),  0)));
            Table.States (131).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  16, 164)));
            Table.States (132).Action_List.Set_Capacity (11);
            Add_Action (Table.States (132), 12, (59, 0), 32);
            Add_Action (Table.States (132), 13, (59, 1), 33);
            Add_Action (Table.States (132), 16, (43, 0), 34);
            Add_Action (Table.States (132), 21, (45, 0), 9);
            Add_Action (Table.States (132), 23, (73, 1), 167);
            Add_Conflict (Table.States (132), 23, (60, 0),  0);
            Add_Action (Table.States (132), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (132), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (132), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (132), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (132), 39, (60, 1), 36);
            Add_Action (Table.States (132), 40, (71, 0), 37);
            Table.States (132).Goto_List.Set_Capacity (10);
            Add_Goto (Table.States (132), 43, 38);
            Add_Goto (Table.States (132), 45, 39);
            Add_Goto (Table.States (132), 46, 40);
            Add_Goto (Table.States (132), 58, 41);
            Add_Goto (Table.States (132), 59, 42);
            Add_Goto (Table.States (132), 60, 43);
            Add_Goto (Table.States (132), 61, 44);
            Add_Goto (Table.States (132), 71, 45);
            Add_Goto (Table.States (132), 72, 168);
            Add_Goto (Table.States (132), 73, 47);
            Table.States (132).Kernel := To_Vector ((((43, 0),  16,  1, (32767, 0),  0), ((73, 1),  16,  1, (32767, 0),
             0)));
            Table.States (132).Minimal_Complete_Actions := To_Vector (((Reduce, (72, 0),  0), (Shift, (73, 1),  23,
            167)));
            Table.States (133).Action_List.Set_Capacity (4);
            Add_Action (Table.States (133), (29, 33, 35, 36), (60, 1),  1);
            Table.States (133).Kernel := To_Vector ((0 => ((60, 1),  39,  0, (60, 1),  1)));
            Table.States (133).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 1),  1)));
            Table.States (134).Action_List.Set_Capacity (2);
            Add_Action (Table.States (134), (29, 36), (71, 0),  1);
            Table.States (134).Kernel := To_Vector ((0 => ((71, 0),  40,  0, (71, 0),  1)));
            Table.States (134).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (71, 0),  1)));
            Table.States (135).Action_List.Set_Capacity (2);
            Add_Action (Table.States (135), (29, 36), (73, 2),  1);
            Table.States (135).Kernel := To_Vector ((0 => ((73, 2),  43,  0, (73, 2),  1)));
            Table.States (135).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 2),  1)));
            Table.States (136).Action_List.Set_Capacity (1);
            Add_Action (Table.States (136), 35, (46, 0), 169);
            Table.States (136).Kernel := To_Vector ((((46, 0),  45,  2, (32767, 0),  0), ((46, 1),  45,  5, (32767, 0),
             0)));
            Table.States (136).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 0),  35, 169)));
            Table.States (137).Action_List.Set_Capacity (2);
            Add_Action (Table.States (137), (29, 36), (71, 3),  1);
            Table.States (137).Kernel := To_Vector ((0 => ((71, 3),  46,  0, (71, 3),  1)));
            Table.States (137).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (71, 3),  1)));
            Table.States (138).Action_List.Set_Capacity (2);
            Add_Action (Table.States (138), 29, (58, 1), 170);
            Add_Action (Table.States (138), 36, (69, 0), 171);
            Table.States (138).Kernel := To_Vector ((((58, 1),  58,  1, (32767, 0),  0), ((69, 0),  58,  1, (32767, 0),
             0)));
            Table.States (138).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (69, 0),  36, 171)));
            Table.States (139).Action_List.Set_Capacity (2);
            Add_Action (Table.States (139), (29, 36), (71, 2),  1);
            Table.States (139).Kernel := To_Vector ((0 => ((71, 2),  59,  0, (71, 2),  1)));
            Table.States (139).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (71, 2),  1)));
            Table.States (140).Action_List.Set_Capacity (4);
            Add_Action (Table.States (140), (29, 33, 35, 36), (61, 0),  1);
            Table.States (140).Kernel := To_Vector ((0 => ((61, 0),  60,  0, (61, 0),  1)));
            Table.States (140).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 0),  1)));
            Table.States (141).Action_List.Set_Capacity (4);
            Add_Action (Table.States (141), 29, Reduce, (71, 1),  1);
            Add_Action (Table.States (141), 33, (61, 1), 172);
            Add_Action (Table.States (141), 35, Reduce, (45, 1),  1);
            Add_Action (Table.States (141), 36, Reduce, (71, 1),  1);
            Table.States (141).Kernel := To_Vector ((((45, 1),  61,  0, (45, 1),  1), ((61, 1),  61,  2, (32767, 0),
            0), ((71, 1),  61,  0, (71, 1),  1)));
            Table.States (141).Minimal_Complete_Actions := To_Vector (((Reduce, (45, 1),  1), (Reduce, (71, 1),  1)));
            Table.States (142).Action_List.Set_Capacity (2);
            Add_Action (Table.States (142), (29, 36), (73, 0),  1);
            Table.States (142).Kernel := To_Vector ((0 => ((73, 0),  71,  0, (73, 0),  1)));
            Table.States (142).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 0),  1)));
            Table.States (143).Action_List.Set_Capacity (2);
            Add_Action (Table.States (143), (29, 36), (58, 0),  1);
            Table.States (143).Kernel := To_Vector ((0 => ((58, 0),  73,  0, (58, 0),  1)));
            Table.States (143).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  1)));
            Table.States (144).Action_List.Set_Capacity (1);
            Add_Action (Table.States (144), (1 =>  36), (60, 1),  1);
            Table.States (144).Kernel := To_Vector ((0 => ((60, 1),  39,  0, (60, 1),  1)));
            Table.States (144).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 1),  1)));
            Table.States (145).Action_List.Set_Capacity (1);
            Add_Action (Table.States (145), 36, (70, 0), 173);
            Table.States (145).Kernel := To_Vector ((0 => ((70, 0),  60,  1, (32767, 0),  0)));
            Table.States (145).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (70, 0),  36, 173)));
            Table.States (146).Action_List.Set_Capacity (2);
            Add_Action (Table.States (146), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (146), 39, (60, 1), 144);
            Table.States (146).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (146), 60, 174);
            Table.States (146).Kernel := To_Vector ((0 => ((67, 0),  10,  1, (32767, 0),  0)));
            Table.States (146).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 0),  0)));
            Table.States (147).Action_List.Set_Capacity (4);
            Add_Action (Table.States (147), 19, (56, 2), 175);
            Add_Action (Table.States (147), 34, Reduce, (56, 0),  0);
            Add_Action (Table.States (147), 37, Reduce, (56, 0),  0);
            Add_Action (Table.States (147), 40, (56, 1), 176);
            Table.States (147).Goto_List.Set_Capacity (2);
            Add_Goto (Table.States (147), 56, 177);
            Add_Goto (Table.States (147), 57, 178);
            Table.States (147).Kernel := To_Vector ((0 => ((48, 0),  27,  1, (32767, 0),  0)));
            Table.States (147).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (57, 0),  0)));
            Table.States (148).Action_List.Set_Capacity (2);
            Add_Action (Table.States (148), (10, 27), (49, 1),  1);
            Table.States (148).Kernel := To_Vector ((0 => ((49, 1),  48,  0, (49, 1),  1)));
            Table.States (148).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (49, 1),  1)));
            Table.States (149).Action_List.Set_Capacity (2);
            Add_Action (Table.States (149), 10, (47, 0), 179);
            Add_Action (Table.States (149), 27, (48, 0), 147);
            Table.States (149).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (149), 48, 180);
            Table.States (149).Kernel := To_Vector ((((47, 0),  49,  3, (32767, 0),  0), ((49, 2),  49,  2, (32767, 0),
             0)));
            Table.States (149).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (47, 0),  10, 179)));
            Table.States (150).Action_List.Set_Capacity (2);
            Add_Action (Table.States (150), (15, 33), (61, 1),  3);
            Table.States (150).Kernel := To_Vector ((0 => ((61, 1),  39,  0, (61, 1),  3)));
            Table.States (150).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 1),  3)));
            Table.States (151).Action_List.Set_Capacity (1);
            Add_Action (Table.States (151), 23, (44, 3), 181);
            Table.States (151).Kernel := To_Vector ((0 => ((44, 3),  40,  3, (32767, 0),  0)));
            Table.States (151).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 3),  23, 181)));
            Table.States (152).Action_List.Set_Capacity (1);
            Add_Action (Table.States (152), (1 =>  23), (56, 2),  1);
            Table.States (152).Kernel := To_Vector ((0 => ((56, 2),  19,  0, (56, 2),  1)));
            Table.States (152).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (56, 2),  1)));
            Table.States (153).Action_List.Set_Capacity (1);
            Add_Action (Table.States (153), (1 =>  23), (56, 1),  1);
            Table.States (153).Kernel := To_Vector ((0 => ((56, 1),  40,  0, (56, 1),  1)));
            Table.States (153).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (56, 1),  1)));
            Table.States (154).Action_List.Set_Capacity (1);
            Add_Action (Table.States (154), 23, (44, 1), 182);
            Table.States (154).Kernel := To_Vector ((((44, 1),  56,  3, (32767, 0),  0), ((44, 2),  56,  5, (32767, 0),
             0)));
            Table.States (154).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 1),  23, 182)));
            Table.States (155).Action_List.Set_Capacity (2);
            Add_Action (Table.States (155), 29, (58, 1), 170);
            Add_Action (Table.States (155), 36, (44, 0), 183);
            Table.States (155).Kernel := To_Vector ((((44, 0),  58,  1, (32767, 0),  0), ((58, 1),  58,  1, (32767, 0),
             0)));
            Table.States (155).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 0),  36, 183)));
            Table.States (156).Action_List.Set_Capacity (2);
            Add_Action (Table.States (156), 15, (64, 0), 184);
            Add_Action (Table.States (156), 33, (61, 1), 121);
            Table.States (156).Kernel := To_Vector ((((61, 1),  61,  2, (32767, 0),  0), ((64, 0),  61,  3, (32767, 0),
             0)));
            Table.States (156).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (64, 0),  15, 184)));
            Table.States (157).Action_List.Set_Capacity (1);
            Add_Action (Table.States (157), 10, (63, 0), 185);
            Table.States (157).Kernel := To_Vector ((0 => ((63, 0),  55,  2, (32767, 0),  0)));
            Table.States (157).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (63, 0),  10, 185)));
            Table.States (158).Action_List.Set_Capacity (2);
            Add_Action (Table.States (158), (33, 36), (60, 1),  1);
            Table.States (158).Kernel := To_Vector ((0 => ((60, 1),  39,  0, (60, 1),  1)));
            Table.States (158).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 1),  1)));
         end Subr_3;
         procedure Subr_4
         is begin
            Table.States (159).Action_List.Set_Capacity (2);
            Add_Action (Table.States (159), (33, 36), (61, 0),  1);
            Table.States (159).Kernel := To_Vector ((0 => ((61, 0),  60,  0, (61, 0),  1)));
            Table.States (159).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 0),  1)));
            Table.States (160).Action_List.Set_Capacity (2);
            Add_Action (Table.States (160), 33, (61, 1), 186);
            Add_Action (Table.States (160), 36, (65, 0), 187);
            Table.States (160).Kernel := To_Vector ((((61, 1),  61,  2, (32767, 0),  0), ((65, 0),  61,  1, (32767, 0),
             0)));
            Table.States (160).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (65, 0),  36, 187)));
            Table.States (161).Action_List.Set_Capacity (11);
            Add_Action (Table.States (161), 12, (59, 0), 32);
            Add_Action (Table.States (161), 13, (59, 1), 33);
            Add_Action (Table.States (161), 16, (43, 0), 34);
            Add_Action (Table.States (161), 21, (45, 0), 9);
            Add_Action (Table.States (161), 23, Reduce, (60, 0),  0);
            Add_Action (Table.States (161), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (161), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (161), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (161), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (161), 39, (60, 1), 36);
            Add_Action (Table.States (161), 40, (71, 0), 37);
            Table.States (161).Goto_List.Set_Capacity (10);
            Add_Goto (Table.States (161), 43, 38);
            Add_Goto (Table.States (161), 45, 39);
            Add_Goto (Table.States (161), 46, 40);
            Add_Goto (Table.States (161), 58, 41);
            Add_Goto (Table.States (161), 59, 42);
            Add_Goto (Table.States (161), 60, 43);
            Add_Goto (Table.States (161), 61, 44);
            Add_Goto (Table.States (161), 71, 45);
            Add_Goto (Table.States (161), 72, 188);
            Add_Goto (Table.States (161), 73, 47);
            Table.States (161).Kernel := To_Vector ((0 => ((43, 0),  16,  1, (32767, 0),  0)));
            Table.States (161).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (72, 0),  0)));
            Table.States (162).Action_List.Set_Capacity (1);
            Add_Action (Table.States (162), 36, (74, 0), 189);
            Table.States (162).Kernel := To_Vector ((0 => ((74, 0),  43,  1, (32767, 0),  0)));
            Table.States (162).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (74, 0),  36, 189)));
            Table.States (163).Action_List.Set_Capacity (10);
            Add_Action (Table.States (163), 12, (59, 0), 130);
            Add_Action (Table.States (163), 13, (59, 1), 131);
            Add_Action (Table.States (163), 16, (43, 0), 132);
            Add_Action (Table.States (163), 21, (45, 0), 9);
            Add_Action (Table.States (163), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (163), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (163), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (163), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (163), 39, (60, 1), 133);
            Add_Action (Table.States (163), 40, (71, 0), 134);
            Table.States (163).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (163), 43, 135);
            Add_Goto (Table.States (163), 45, 136);
            Add_Goto (Table.States (163), 46, 137);
            Add_Goto (Table.States (163), 58, 190);
            Add_Goto (Table.States (163), 59, 139);
            Add_Goto (Table.States (163), 60, 140);
            Add_Goto (Table.States (163), 61, 141);
            Add_Goto (Table.States (163), 71, 142);
            Add_Goto (Table.States (163), 73, 143);
            Table.States (163).Kernel := To_Vector ((0 => ((69, 1),  31,  1, (32767, 0),  0)));
            Table.States (163).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  0)));
            Table.States (164).Action_List.Set_Capacity (11);
            Add_Action (Table.States (164), 12, (59, 0), 32);
            Add_Action (Table.States (164), 13, (59, 1), 33);
            Add_Action (Table.States (164), 16, (43, 0), 34);
            Add_Action (Table.States (164), 21, (45, 0), 9);
            Add_Action (Table.States (164), 23, Reduce, (60, 0),  0);
            Add_Action (Table.States (164), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (164), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (164), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (164), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (164), 39, (60, 1), 36);
            Add_Action (Table.States (164), 40, (71, 0), 37);
            Table.States (164).Goto_List.Set_Capacity (10);
            Add_Goto (Table.States (164), 43, 38);
            Add_Goto (Table.States (164), 45, 39);
            Add_Goto (Table.States (164), 46, 40);
            Add_Goto (Table.States (164), 58, 41);
            Add_Goto (Table.States (164), 59, 42);
            Add_Goto (Table.States (164), 60, 43);
            Add_Goto (Table.States (164), 61, 44);
            Add_Goto (Table.States (164), 71, 45);
            Add_Goto (Table.States (164), 72, 168);
            Add_Goto (Table.States (164), 73, 47);
            Table.States (164).Kernel := To_Vector ((0 => ((43, 0),  16,  1, (32767, 0),  0)));
            Table.States (164).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (72, 0),  0)));
            Table.States (165).Action_List.Set_Capacity (2);
            Add_Action (Table.States (165), (29, 36), (59, 0),  2);
            Table.States (165).Kernel := To_Vector ((0 => ((59, 0),  43,  0, (59, 0),  2)));
            Table.States (165).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (59, 0),  2)));
            Table.States (166).Action_List.Set_Capacity (2);
            Add_Action (Table.States (166), (29, 36), (59, 1),  2);
            Table.States (166).Kernel := To_Vector ((0 => ((59, 1),  43,  0, (59, 1),  2)));
            Table.States (166).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (59, 1),  2)));
            Table.States (167).Action_List.Set_Capacity (2);
            Add_Action (Table.States (167), (29, 36), (73, 1),  2);
            Table.States (167).Kernel := To_Vector ((0 => ((73, 1),  23,  0, (73, 1),  2)));
            Table.States (167).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 1),  2)));
            Table.States (168).Action_List.Set_Capacity (2);
            Add_Action (Table.States (168), 23, (43, 0), 191);
            Add_Action (Table.States (168), 32, (72, 1), 67);
            Table.States (168).Kernel := To_Vector ((((43, 0),  72,  1, (32767, 0),  0), ((72, 1),  72,  1, (32767, 0),
             0)));
            Table.States (168).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  23, 191)));
            Table.States (169).Action_List.Set_Capacity (1);
            Add_Action (Table.States (169), 39, (46, 0), 192);
            Table.States (169).Kernel := To_Vector ((((46, 0),  35,  1, (32767, 0),  0), ((46, 1),  35,  4, (32767, 0),
             0)));
            Table.States (169).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 0),  39, 192)));
            Table.States (170).Action_List.Set_Capacity (10);
            Add_Action (Table.States (170), 12, (59, 0), 130);
            Add_Action (Table.States (170), 13, (59, 1), 131);
            Add_Action (Table.States (170), 16, (43, 0), 132);
            Add_Action (Table.States (170), 21, (45, 0), 9);
            Add_Action (Table.States (170), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (170), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (170), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (170), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (170), 39, (60, 1), 133);
            Add_Action (Table.States (170), 40, (71, 0), 134);
            Table.States (170).Goto_List.Set_Capacity (8);
            Add_Goto (Table.States (170), 43, 135);
            Add_Goto (Table.States (170), 45, 136);
            Add_Goto (Table.States (170), 46, 137);
            Add_Goto (Table.States (170), 59, 139);
            Add_Goto (Table.States (170), 60, 140);
            Add_Goto (Table.States (170), 61, 141);
            Add_Goto (Table.States (170), 71, 142);
            Add_Goto (Table.States (170), 73, 193);
            Table.States (170).Kernel := To_Vector ((0 => ((58, 1),  29,  0, (73, 0),  0)));
            Table.States (170).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 0),  0)));
            Table.States (171).Action_List.Set_Capacity (7);
            Add_Action (Table.States (171), (8, 10, 14, 18, 20, 25, 39), (69, 0),  4);
            Table.States (171).Kernel := To_Vector ((0 => ((69, 0),  36,  0, (69, 0),  4)));
            Table.States (171).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (69, 0),  4)));
            Table.States (172).Action_List.Set_Capacity (1);
            Add_Action (Table.States (172), 39, (61, 1), 194);
            Table.States (172).Kernel := To_Vector ((0 => ((61, 1),  33,  1, (32767, 0),  0)));
            Table.States (172).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (61, 1),  39, 194)));
            Table.States (173).Action_List.Set_Capacity (1);
            Add_Action (Table.States (173), (1 =>  41), (70, 0),  7);
            Table.States (173).Kernel := To_Vector ((0 => ((70, 0),  36,  0, (70, 0),  7)));
            Table.States (173).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (70, 0),  7)));
            Table.States (174).Action_List.Set_Capacity (1);
            Add_Action (Table.States (174), 36, (67, 0), 195);
            Table.States (174).Kernel := To_Vector ((0 => ((67, 0),  60,  1, (32767, 0),  0)));
            Table.States (174).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (67, 0),  36, 195)));
            Table.States (175).Action_List.Set_Capacity (2);
            Add_Action (Table.States (175), (34, 37), (56, 2),  1);
            Table.States (175).Kernel := To_Vector ((0 => ((56, 2),  19,  0, (56, 2),  1)));
            Table.States (175).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (56, 2),  1)));
            Table.States (176).Action_List.Set_Capacity (2);
            Add_Action (Table.States (176), (34, 37), (56, 1),  1);
            Table.States (176).Kernel := To_Vector ((0 => ((56, 1),  40,  0, (56, 1),  1)));
            Table.States (176).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (56, 1),  1)));
            Table.States (177).Action_List.Set_Capacity (2);
            Add_Action (Table.States (177), (34, 37), (57, 0),  1);
            Table.States (177).Kernel := To_Vector ((0 => ((57, 0),  56,  0, (57, 0),  1)));
            Table.States (177).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (57, 0),  1)));
            Table.States (178).Action_List.Set_Capacity (2);
            Add_Action (Table.States (178), 34, (48, 0), 196);
            Add_Action (Table.States (178), 37, (57, 1), 197);
            Table.States (178).Kernel := To_Vector ((((48, 0),  57,  1, (32767, 0),  0), ((57, 1),  57,  1, (32767, 0),
             0)));
            Table.States (178).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (48, 0),  34, 196)));
            Table.States (179).Action_List.Set_Capacity (1);
            Add_Action (Table.States (179), 8, (47, 0), 198);
            Table.States (179).Kernel := To_Vector ((0 => ((47, 0),  10,  2, (32767, 0),  0)));
            Table.States (179).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (47, 0),  8, 198)));
            Table.States (180).Action_List.Set_Capacity (2);
            Add_Action (Table.States (180), (10, 27), (49, 2),  2);
            Table.States (180).Kernel := To_Vector ((0 => ((49, 2),  48,  0, (49, 2),  2)));
            Table.States (180).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (49, 2),  2)));
            Table.States (181).Action_List.Set_Capacity (1);
            Add_Action (Table.States (181), 26, (44, 3), 199);
            Table.States (181).Kernel := To_Vector ((0 => ((44, 3),  23,  2, (32767, 0),  0)));
            Table.States (181).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 3),  26, 199)));
            Table.States (182).Action_List.Set_Capacity (1);
            Add_Action (Table.States (182), 26, (44, 1), 200);
            Table.States (182).Kernel := To_Vector ((((44, 1),  23,  2, (32767, 0),  0), ((44, 2),  23,  4, (32767, 0),
             0)));
            Table.States (182).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 1),  26, 200)));
            Table.States (183).Action_List.Set_Capacity (7);
            Add_Action (Table.States (183), (8, 10, 14, 18, 20, 25, 39), (44, 0),  5);
            Table.States (183).Kernel := To_Vector ((0 => ((44, 0),  36,  0, (44, 0),  5)));
            Table.States (183).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (44, 0),  5)));
            Table.States (184).Action_List.Set_Capacity (7);
            Add_Action (Table.States (184), 8, (47, 0), 85);
            Add_Action (Table.States (184), 10, Reduce, (55, 0),  0);
            Add_Action (Table.States (184), 14, (44, 0), 86);
            Add_Action (Table.States (184), 18, (69, 4), 87);
            Add_Action (Table.States (184), 20, (63, 0), 88);
            Add_Action (Table.States (184), 25, (74, 0), 89);
            Add_Action (Table.States (184), 39, (69, 0), 90);
            Table.States (184).Goto_List.Set_Capacity (11);
            Add_Goto (Table.States (184), 44, 91);
            Add_Goto (Table.States (184), 47, 92);
            Add_Goto (Table.States (184), 53, 93);
            Add_Goto (Table.States (184), 54, 94);
            Add_Goto (Table.States (184), 55, 201);
            Add_Goto (Table.States (184), 62, 96);
            Add_Goto (Table.States (184), 63, 97);
            Add_Goto (Table.States (184), 64, 98);
            Add_Goto (Table.States (184), 65, 99);
            Add_Goto (Table.States (184), 69, 100);
            Add_Goto (Table.States (184), 74, 101);
            Table.States (184).Kernel := To_Vector ((0 => ((64, 0),  15,  2, (32767, 0),  0)));
            Table.States (184).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (55, 0),  0)));
            Table.States (185).Action_List.Set_Capacity (2);
            Add_Action (Table.States (185), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (185), 39, (60, 1), 144);
            Table.States (185).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (185), 60, 202);
            Table.States (185).Kernel := To_Vector ((0 => ((63, 0),  10,  1, (32767, 0),  0)));
            Table.States (185).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 0),  0)));
            Table.States (186).Action_List.Set_Capacity (1);
            Add_Action (Table.States (186), 39, (61, 1), 203);
            Table.States (186).Kernel := To_Vector ((0 => ((61, 1),  33,  1, (32767, 0),  0)));
            Table.States (186).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (61, 1),  39, 203)));
            Table.States (187).Action_List.Set_Capacity (7);
            Add_Action (Table.States (187), (8, 10, 14, 18, 20, 25, 39), (65, 0),  5);
            Table.States (187).Kernel := To_Vector ((0 => ((65, 0),  36,  0, (65, 0),  5)));
            Table.States (187).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (65, 0),  5)));
            Table.States (188).Action_List.Set_Capacity (2);
            Add_Action (Table.States (188), 23, (43, 0), 204);
            Add_Action (Table.States (188), 32, (72, 1), 67);
            Table.States (188).Kernel := To_Vector ((((43, 0),  72,  1, (32767, 0),  0), ((72, 1),  72,  1, (32767, 0),
             0)));
            Table.States (188).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  23, 204)));
            Table.States (189).Action_List.Set_Capacity (7);
            Add_Action (Table.States (189), (8, 10, 14, 18, 20, 25, 39), (74, 0),  5);
            Table.States (189).Kernel := To_Vector ((0 => ((74, 0),  36,  0, (74, 0),  5)));
            Table.States (189).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (74, 0),  5)));
            Table.States (190).Action_List.Set_Capacity (2);
            Add_Action (Table.States (190), 29, (58, 1), 170);
            Add_Action (Table.States (190), 36, (69, 1), 205);
            Table.States (190).Kernel := To_Vector ((((58, 1),  58,  1, (32767, 0),  0), ((69, 1),  58,  1, (32767, 0),
             0)));
            Table.States (190).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (69, 1),  36, 205)));
            Table.States (191).Action_List.Set_Capacity (2);
            Add_Action (Table.States (191), (29, 36), (43, 0),  3);
            Table.States (191).Kernel := To_Vector ((0 => ((43, 0),  23,  0, (43, 0),  3)));
            Table.States (191).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (43, 0),  3)));
            Table.States (192).Action_List.Set_Capacity (3);
            Add_Action (Table.States (192), 16, (46, 1), 206);
            Add_Action (Table.States (192), 29, Reduce, (46, 0),  3);
            Add_Action (Table.States (192), 36, Reduce, (46, 0),  3);
            Table.States (192).Kernel := To_Vector ((((46, 0),  39,  0, (46, 0),  3), ((46, 1),  39,  3, (32767, 0),
            0)));
            Table.States (192).Minimal_Complete_Actions := To_Vector (((Reduce, (46, 0),  3), (Shift, (46, 1),  16,
            206)));
            Table.States (193).Action_List.Set_Capacity (2);
            Add_Action (Table.States (193), (29, 36), (58, 1),  3);
            Table.States (193).Kernel := To_Vector ((0 => ((58, 1),  73,  0, (58, 1),  3)));
            Table.States (193).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 1),  3)));
            Table.States (194).Action_List.Set_Capacity (4);
            Add_Action (Table.States (194), (29, 33, 35, 36), (61, 1),  3);
            Table.States (194).Kernel := To_Vector ((0 => ((61, 1),  39,  0, (61, 1),  3)));
            Table.States (194).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 1),  3)));
            Table.States (195).Action_List.Set_Capacity (1);
            Add_Action (Table.States (195), (1 =>  41), (67, 0),  9);
            Table.States (195).Kernel := To_Vector ((0 => ((67, 0),  36,  0, (67, 0),  9)));
            Table.States (195).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (67, 0),  9)));
            Table.States (196).Action_List.Set_Capacity (8);
            Add_Action (Table.States (196), 8, (47, 0), 207);
            Add_Action (Table.States (196), 10, Reduce, (55, 0),  0);
            Add_Action (Table.States (196), 14, (44, 0), 208);
            Add_Action (Table.States (196), 18, (69, 4), 209);
            Add_Action (Table.States (196), 20, (63, 0), 210);
            Add_Action (Table.States (196), 25, (74, 0), 211);
            Add_Action (Table.States (196), 27, Reduce, (55, 0),  0);
            Add_Action (Table.States (196), 39, (69, 0), 212);
            Table.States (196).Goto_List.Set_Capacity (11);
            Add_Goto (Table.States (196), 44, 213);
            Add_Goto (Table.States (196), 47, 214);
            Add_Goto (Table.States (196), 53, 215);
            Add_Goto (Table.States (196), 54, 216);
            Add_Goto (Table.States (196), 55, 217);
            Add_Goto (Table.States (196), 62, 218);
            Add_Goto (Table.States (196), 63, 219);
            Add_Goto (Table.States (196), 64, 220);
            Add_Goto (Table.States (196), 65, 221);
            Add_Goto (Table.States (196), 69, 222);
            Add_Goto (Table.States (196), 74, 223);
            Table.States (196).Kernel := To_Vector ((0 => ((48, 0),  34,  0, (55, 0),  0)));
            Table.States (196).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (55, 0),  0)));
            Table.States (197).Action_List.Set_Capacity (4);
            Add_Action (Table.States (197), 19, (56, 2), 175);
            Add_Action (Table.States (197), 34, Reduce, (56, 0),  0);
            Add_Action (Table.States (197), 37, Reduce, (56, 0),  0);
            Add_Action (Table.States (197), 40, (56, 1), 176);
            Table.States (197).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (197), 56, 224);
            Table.States (197).Kernel := To_Vector ((0 => ((57, 1),  37,  0, (56, 0),  0)));
            Table.States (197).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (56, 0),  0)));
            Table.States (198).Action_List.Set_Capacity (1);
            Add_Action (Table.States (198), 36, (47, 0), 225);
            Table.States (198).Kernel := To_Vector ((0 => ((47, 0),  8,  1, (32767, 0),  0)));
            Table.States (198).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (47, 0),  36, 225)));
            Table.States (199).Action_List.Set_Capacity (10);
            Add_Action (Table.States (199), 12, (59, 0), 130);
            Add_Action (Table.States (199), 13, (59, 1), 131);
            Add_Action (Table.States (199), 16, (43, 0), 132);
            Add_Action (Table.States (199), 21, (45, 0), 9);
            Add_Action (Table.States (199), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (199), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (199), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (199), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (199), 39, (60, 1), 133);
            Add_Action (Table.States (199), 40, (71, 0), 134);
            Table.States (199).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (199), 43, 135);
            Add_Goto (Table.States (199), 45, 136);
            Add_Goto (Table.States (199), 46, 137);
            Add_Goto (Table.States (199), 58, 226);
            Add_Goto (Table.States (199), 59, 139);
            Add_Goto (Table.States (199), 60, 140);
            Add_Goto (Table.States (199), 61, 141);
            Add_Goto (Table.States (199), 71, 142);
            Add_Goto (Table.States (199), 73, 143);
            Table.States (199).Kernel := To_Vector ((0 => ((44, 3),  26,  1, (32767, 0),  0)));
            Table.States (199).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  0)));
            Table.States (200).Action_List.Set_Capacity (11);
            Add_Action (Table.States (200), 6, Reduce, (60, 0),  0);
            Add_Action (Table.States (200), 12, (59, 0), 227);
            Add_Action (Table.States (200), 13, (59, 1), 228);
            Add_Action (Table.States (200), 16, (43, 0), 229);
            Add_Action (Table.States (200), 21, (45, 0), 9);
            Add_Action (Table.States (200), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (200), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (200), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (200), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (200), 39, (60, 1), 230);
            Add_Action (Table.States (200), 40, (71, 0), 231);
            Table.States (200).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (200), 43, 232);
            Add_Goto (Table.States (200), 45, 233);
            Add_Goto (Table.States (200), 46, 234);
            Add_Goto (Table.States (200), 58, 235);
            Add_Goto (Table.States (200), 59, 236);
            Add_Goto (Table.States (200), 60, 237);
            Add_Goto (Table.States (200), 61, 238);
            Add_Goto (Table.States (200), 71, 239);
            Add_Goto (Table.States (200), 73, 240);
            Table.States (200).Kernel := To_Vector ((((44, 1),  26,  1, (32767, 0),  0), ((44, 2),  26,  3, (32767, 0),
             0)));
            Table.States (200).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  0)));
            Table.States (201).Action_List.Set_Capacity (1);
            Add_Action (Table.States (201), 10, (64, 0), 241);
            Table.States (201).Kernel := To_Vector ((0 => ((64, 0),  55,  2, (32767, 0),  0)));
            Table.States (201).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (64, 0),  10, 241)));
            Table.States (202).Action_List.Set_Capacity (1);
            Add_Action (Table.States (202), 36, (63, 0), 242);
            Table.States (202).Kernel := To_Vector ((0 => ((63, 0),  60,  1, (32767, 0),  0)));
            Table.States (202).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (63, 0),  36, 242)));
            Table.States (203).Action_List.Set_Capacity (2);
            Add_Action (Table.States (203), (33, 36), (61, 1),  3);
            Table.States (203).Kernel := To_Vector ((0 => ((61, 1),  39,  0, (61, 1),  3)));
            Table.States (203).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 1),  3)));
            Table.States (204).Action_List.Set_Capacity (1);
            Add_Action (Table.States (204), (1 =>  36), (43, 0),  3);
            Table.States (204).Kernel := To_Vector ((0 => ((43, 0),  23,  0, (43, 0),  3)));
            Table.States (204).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (43, 0),  3)));
            Table.States (205).Action_List.Set_Capacity (7);
            Add_Action (Table.States (205), (8, 10, 14, 18, 20, 25, 39), (69, 1),  6);
            Table.States (205).Kernel := To_Vector ((0 => ((69, 1),  36,  0, (69, 1),  6)));
            Table.States (205).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (69, 1),  6)));
            Table.States (206).Action_List.Set_Capacity (1);
            Add_Action (Table.States (206), 40, (46, 1), 243);
            Table.States (206).Kernel := To_Vector ((0 => ((46, 1),  16,  2, (32767, 0),  0)));
            Table.States (206).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 1),  40, 243)));
         end Subr_4;
         procedure Subr_5
         is begin
            Table.States (207).Action_List.Set_Capacity (3);
            Add_Action (Table.States (207), 15, Reduce, (60, 0),  0);
            Add_Action (Table.States (207), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (207), 39, (60, 1), 105);
            Table.States (207).Goto_List.Set_Capacity (2);
            Add_Goto (Table.States (207), 60, 106);
            Add_Goto (Table.States (207), 61, 244);
            Table.States (207).Kernel := To_Vector ((0 => ((47, 0),  8,  4, (32767, 0),  0)));
            Table.States (207).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 0),  0)));
            Table.States (208).Action_List.Set_Capacity (2);
            Add_Action (Table.States (208), 12, (44, 3), 245);
            Add_Action (Table.States (208), 39, (44, 0), 246);
            Table.States (208).Kernel := To_Vector ((((44, 0),  14,  3, (32767, 0),  0), ((44, 1),  14,  5, (32767, 0),
             0), ((44, 2),  14,  7, (32767, 0),  0), ((44, 3),  14,  6, (32767, 0),  0)));
            Table.States (208).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 0),  39, 246)));
            Table.States (209).Action_List.Set_Capacity (1);
            Add_Action (Table.States (209), 36, (69, 4), 247);
            Table.States (209).Kernel := To_Vector ((0 => ((69, 4),  18,  1, (32767, 0),  0)));
            Table.States (209).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (69, 4),  36, 247)));
            Table.States (210).Action_List.Set_Capacity (4);
            Add_Action (Table.States (210), 11, Reduce, (60, 0),  0);
            Add_Action (Table.States (210), 15, Reduce, (60, 0),  0);
            Add_Action (Table.States (210), 22, Reduce, (60, 0),  0);
            Add_Action (Table.States (210), 39, (60, 1), 111);
            Table.States (210).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (210), 60, 248);
            Table.States (210).Kernel := To_Vector ((((63, 0),  20,  3, (32767, 0),  0), ((64, 0),  20,  4, (32767, 0),
             0), ((65, 0),  20,  2, (32767, 0),  0)));
            Table.States (210).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 0),  0)));
            Table.States (211).Action_List.Set_Capacity (1);
            Add_Action (Table.States (211), 39, (74, 0), 249);
            Table.States (211).Kernel := To_Vector ((0 => ((74, 0),  25,  5, (32767, 0),  0)));
            Table.States (211).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (74, 0),  39, 249)));
            Table.States (212).Action_List.Set_Capacity (2);
            Add_Action (Table.States (212), 30, (69, 1), 250);
            Add_Action (Table.States (212), 31, (69, 0), 251);
            Table.States (212).Kernel := To_Vector ((((69, 0),  39,  2, (32767, 0),  0), ((69, 1),  39,  4, (32767, 0),
             0)));
            Table.States (212).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (69, 0),  31, 251)));
            Table.States (213).Action_List.Set_Capacity (8);
            Add_Action (Table.States (213), (8, 10, 14, 18, 20, 25, 27, 39), (69, 2),  1);
            Table.States (213).Kernel := To_Vector ((0 => ((69, 2),  44,  0, (69, 2),  1)));
            Table.States (213).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (69, 2),  1)));
            Table.States (214).Action_List.Set_Capacity (8);
            Add_Action (Table.States (214), (8, 10, 14, 18, 20, 25, 27, 39), (69, 3),  1);
            Table.States (214).Kernel := To_Vector ((0 => ((69, 3),  47,  0, (69, 3),  1)));
            Table.States (214).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (69, 3),  1)));
            Table.States (215).Action_List.Set_Capacity (8);
            Add_Action (Table.States (215), (8, 10, 14, 18, 20, 25, 27, 39), (54, 0),  1);
            Table.States (215).Kernel := To_Vector ((0 => ((54, 0),  53,  0, (54, 0),  1)));
            Table.States (215).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (54, 0),  1)));
            Table.States (216).Action_List.Set_Capacity (8);
            Add_Action (Table.States (216), 8, (47, 0), 207);
            Add_Action (Table.States (216), 10, Reduce, (55, 1),  1);
            Add_Action (Table.States (216), 14, (44, 0), 208);
            Add_Action (Table.States (216), 18, (69, 4), 209);
            Add_Action (Table.States (216), 20, (63, 0), 210);
            Add_Action (Table.States (216), 25, (74, 0), 211);
            Add_Action (Table.States (216), 27, Reduce, (55, 1),  1);
            Add_Action (Table.States (216), 39, (69, 0), 212);
            Table.States (216).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (216), 44, 213);
            Add_Goto (Table.States (216), 47, 214);
            Add_Goto (Table.States (216), 53, 252);
            Add_Goto (Table.States (216), 62, 218);
            Add_Goto (Table.States (216), 63, 219);
            Add_Goto (Table.States (216), 64, 220);
            Add_Goto (Table.States (216), 65, 221);
            Add_Goto (Table.States (216), 69, 222);
            Add_Goto (Table.States (216), 74, 223);
            Table.States (216).Kernel := To_Vector ((((54, 1),  54,  2, (32767, 0),  0), ((55, 1),  54,  0, (55, 1),
            1)));
            Table.States (216).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (55, 1),  1)));
            Table.States (217).Action_List.Set_Capacity (2);
            Add_Action (Table.States (217), (10, 27), (48, 0),  4);
            Table.States (217).Kernel := To_Vector ((0 => ((48, 0),  55,  0, (48, 0),  4)));
            Table.States (217).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (48, 0),  4)));
            Table.States (218).Action_List.Set_Capacity (8);
            Add_Action (Table.States (218), (8, 10, 14, 18, 20, 25, 27, 39), (53, 2),  1);
            Table.States (218).Kernel := To_Vector ((0 => ((53, 2),  62,  0, (53, 2),  1)));
            Table.States (218).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (53, 2),  1)));
            Table.States (219).Action_List.Set_Capacity (8);
            Add_Action (Table.States (219), (8, 10, 14, 18, 20, 25, 27, 39), (62, 0),  1);
            Table.States (219).Kernel := To_Vector ((0 => ((62, 0),  63,  0, (62, 0),  1)));
            Table.States (219).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (62, 0),  1)));
            Table.States (220).Action_List.Set_Capacity (8);
            Add_Action (Table.States (220), (8, 10, 14, 18, 20, 25, 27, 39), (62, 1),  1);
            Table.States (220).Kernel := To_Vector ((0 => ((62, 1),  64,  0, (62, 1),  1)));
            Table.States (220).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (62, 1),  1)));
            Table.States (221).Action_List.Set_Capacity (8);
            Add_Action (Table.States (221), (8, 10, 14, 18, 20, 25, 27, 39), (62, 2),  1);
            Table.States (221).Kernel := To_Vector ((0 => ((62, 2),  65,  0, (62, 2),  1)));
            Table.States (221).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (62, 2),  1)));
            Table.States (222).Action_List.Set_Capacity (8);
            Add_Action (Table.States (222), (8, 10, 14, 18, 20, 25, 27, 39), (53, 0),  1);
            Table.States (222).Kernel := To_Vector ((0 => ((53, 0),  69,  0, (53, 0),  1)));
            Table.States (222).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (53, 0),  1)));
            Table.States (223).Action_List.Set_Capacity (8);
            Add_Action (Table.States (223), (8, 10, 14, 18, 20, 25, 27, 39), (53, 1),  1);
            Table.States (223).Kernel := To_Vector ((0 => ((53, 1),  74,  0, (53, 1),  1)));
            Table.States (223).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (53, 1),  1)));
            Table.States (224).Action_List.Set_Capacity (2);
            Add_Action (Table.States (224), (34, 37), (57, 1),  3);
            Table.States (224).Kernel := To_Vector ((0 => ((57, 1),  56,  0, (57, 1),  3)));
            Table.States (224).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (57, 1),  3)));
            Table.States (225).Action_List.Set_Capacity (7);
            Add_Action (Table.States (225), (8, 10, 14, 18, 20, 25, 39), (47, 0),  7);
            Table.States (225).Kernel := To_Vector ((0 => ((47, 0),  36,  0, (47, 0),  7)));
            Table.States (225).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (47, 0),  7)));
            Table.States (226).Action_List.Set_Capacity (2);
            Add_Action (Table.States (226), 29, (58, 1), 170);
            Add_Action (Table.States (226), 36, (44, 3), 253);
            Table.States (226).Kernel := To_Vector ((((44, 3),  58,  1, (32767, 0),  0), ((58, 1),  58,  1, (32767, 0),
             0)));
            Table.States (226).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 3),  36, 253)));
            Table.States (227).Action_List.Set_Capacity (1);
            Add_Action (Table.States (227), 16, (43, 0), 254);
            Table.States (227).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (227), 43, 255);
            Table.States (227).Kernel := To_Vector ((0 => ((59, 0),  12,  2, (32767, 0),  0)));
            Table.States (227).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  16, 254)));
            Table.States (228).Action_List.Set_Capacity (1);
            Add_Action (Table.States (228), 16, (43, 0), 254);
            Table.States (228).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (228), 43, 256);
            Table.States (228).Kernel := To_Vector ((0 => ((59, 1),  13,  2, (32767, 0),  0)));
            Table.States (228).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  16, 254)));
            Table.States (229).Action_List.Set_Capacity (11);
            Add_Action (Table.States (229), 12, (59, 0), 32);
            Add_Action (Table.States (229), 13, (59, 1), 33);
            Add_Action (Table.States (229), 16, (43, 0), 34);
            Add_Action (Table.States (229), 21, (45, 0), 9);
            Add_Action (Table.States (229), 23, (73, 1), 257);
            Add_Conflict (Table.States (229), 23, (60, 0),  0);
            Add_Action (Table.States (229), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (229), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (229), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (229), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (229), 39, (60, 1), 36);
            Add_Action (Table.States (229), 40, (71, 0), 37);
            Table.States (229).Goto_List.Set_Capacity (10);
            Add_Goto (Table.States (229), 43, 38);
            Add_Goto (Table.States (229), 45, 39);
            Add_Goto (Table.States (229), 46, 40);
            Add_Goto (Table.States (229), 58, 41);
            Add_Goto (Table.States (229), 59, 42);
            Add_Goto (Table.States (229), 60, 43);
            Add_Goto (Table.States (229), 61, 44);
            Add_Goto (Table.States (229), 71, 45);
            Add_Goto (Table.States (229), 72, 258);
            Add_Goto (Table.States (229), 73, 47);
            Table.States (229).Kernel := To_Vector ((((43, 0),  16,  1, (32767, 0),  0), ((73, 1),  16,  1, (32767, 0),
             0)));
            Table.States (229).Minimal_Complete_Actions := To_Vector (((Reduce, (72, 0),  0), (Shift, (73, 1),  23,
            257)));
            Table.States (230).Action_List.Set_Capacity (5);
            Add_Action (Table.States (230), (6, 29, 33, 35, 36), (60, 1),  1);
            Table.States (230).Kernel := To_Vector ((0 => ((60, 1),  39,  0, (60, 1),  1)));
            Table.States (230).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 1),  1)));
            Table.States (231).Action_List.Set_Capacity (3);
            Add_Action (Table.States (231), (6, 29, 36), (71, 0),  1);
            Table.States (231).Kernel := To_Vector ((0 => ((71, 0),  40,  0, (71, 0),  1)));
            Table.States (231).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (71, 0),  1)));
            Table.States (232).Action_List.Set_Capacity (3);
            Add_Action (Table.States (232), (6, 29, 36), (73, 2),  1);
            Table.States (232).Kernel := To_Vector ((0 => ((73, 2),  43,  0, (73, 2),  1)));
            Table.States (232).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 2),  1)));
            Table.States (233).Action_List.Set_Capacity (1);
            Add_Action (Table.States (233), 35, (46, 0), 259);
            Table.States (233).Kernel := To_Vector ((((46, 0),  45,  2, (32767, 0),  0), ((46, 1),  45,  5, (32767, 0),
             0)));
            Table.States (233).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 0),  35, 259)));
            Table.States (234).Action_List.Set_Capacity (3);
            Add_Action (Table.States (234), (6, 29, 36), (71, 3),  1);
            Table.States (234).Kernel := To_Vector ((0 => ((71, 3),  46,  0, (71, 3),  1)));
            Table.States (234).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (71, 3),  1)));
            Table.States (235).Action_List.Set_Capacity (3);
            Add_Action (Table.States (235), 6, (44, 2), 260);
            Add_Action (Table.States (235), 29, (58, 1), 261);
            Add_Action (Table.States (235), 36, (44, 1), 262);
            Table.States (235).Kernel := To_Vector ((((44, 1),  58,  1, (32767, 0),  0), ((44, 2),  58,  3, (32767, 0),
             0), ((58, 1),  58,  1, (32767, 0),  0)));
            Table.States (235).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 1),  36, 262)));
            Table.States (236).Action_List.Set_Capacity (3);
            Add_Action (Table.States (236), (6, 29, 36), (71, 2),  1);
            Table.States (236).Kernel := To_Vector ((0 => ((71, 2),  59,  0, (71, 2),  1)));
            Table.States (236).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (71, 2),  1)));
            Table.States (237).Action_List.Set_Capacity (5);
            Add_Action (Table.States (237), (6, 29, 33, 35, 36), (61, 0),  1);
            Table.States (237).Kernel := To_Vector ((0 => ((61, 0),  60,  0, (61, 0),  1)));
            Table.States (237).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 0),  1)));
            Table.States (238).Action_List.Set_Capacity (5);
            Add_Action (Table.States (238), 6, Reduce, (71, 1),  1);
            Add_Action (Table.States (238), 29, Reduce, (71, 1),  1);
            Add_Action (Table.States (238), 33, (61, 1), 263);
            Add_Action (Table.States (238), 35, Reduce, (45, 1),  1);
            Add_Action (Table.States (238), 36, Reduce, (71, 1),  1);
            Table.States (238).Kernel := To_Vector ((((45, 1),  61,  0, (45, 1),  1), ((61, 1),  61,  2, (32767, 0),
            0), ((71, 1),  61,  0, (71, 1),  1)));
            Table.States (238).Minimal_Complete_Actions := To_Vector (((Reduce, (45, 1),  1), (Reduce, (71, 1),  1)));
            Table.States (239).Action_List.Set_Capacity (3);
            Add_Action (Table.States (239), (6, 29, 36), (73, 0),  1);
            Table.States (239).Kernel := To_Vector ((0 => ((73, 0),  71,  0, (73, 0),  1)));
            Table.States (239).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 0),  1)));
            Table.States (240).Action_List.Set_Capacity (3);
            Add_Action (Table.States (240), (6, 29, 36), (58, 0),  1);
            Table.States (240).Kernel := To_Vector ((0 => ((58, 0),  73,  0, (58, 0),  1)));
            Table.States (240).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  1)));
            Table.States (241).Action_List.Set_Capacity (2);
            Add_Action (Table.States (241), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (241), 39, (60, 1), 144);
            Table.States (241).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (241), 60, 264);
            Table.States (241).Kernel := To_Vector ((0 => ((64, 0),  10,  1, (32767, 0),  0)));
            Table.States (241).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 0),  0)));
            Table.States (242).Action_List.Set_Capacity (7);
            Add_Action (Table.States (242), (8, 10, 14, 18, 20, 25, 39), (63, 0),  7);
            Table.States (242).Kernel := To_Vector ((0 => ((63, 0),  36,  0, (63, 0),  7)));
            Table.States (242).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (63, 0),  7)));
            Table.States (243).Action_List.Set_Capacity (1);
            Add_Action (Table.States (243), 23, (46, 1), 265);
            Table.States (243).Kernel := To_Vector ((0 => ((46, 1),  40,  1, (32767, 0),  0)));
            Table.States (243).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 1),  23, 265)));
            Table.States (244).Action_List.Set_Capacity (2);
            Add_Action (Table.States (244), 15, (47, 0), 266);
            Add_Action (Table.States (244), 33, (61, 1), 121);
            Table.States (244).Kernel := To_Vector ((((47, 0),  61,  4, (32767, 0),  0), ((61, 1),  61,  2, (32767, 0),
             0)));
            Table.States (244).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (47, 0),  15, 266)));
            Table.States (245).Action_List.Set_Capacity (1);
            Add_Action (Table.States (245), 16, (44, 3), 267);
            Table.States (245).Kernel := To_Vector ((0 => ((44, 3),  12,  5, (32767, 0),  0)));
            Table.States (245).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 3),  16, 267)));
            Table.States (246).Action_List.Set_Capacity (2);
            Add_Action (Table.States (246), 16, (44, 1), 268);
            Add_Action (Table.States (246), 26, (44, 0), 269);
            Table.States (246).Kernel := To_Vector ((((44, 0),  39,  2, (32767, 0),  0), ((44, 1),  39,  4, (32767, 0),
             0), ((44, 2),  39,  6, (32767, 0),  0)));
            Table.States (246).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 0),  26, 269)));
            Table.States (247).Action_List.Set_Capacity (8);
            Add_Action (Table.States (247), (8, 10, 14, 18, 20, 25, 27, 39), (69, 4),  2);
            Table.States (247).Kernel := To_Vector ((0 => ((69, 4),  36,  0, (69, 4),  2)));
            Table.States (247).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (69, 4),  2)));
            Table.States (248).Action_List.Set_Capacity (3);
            Add_Action (Table.States (248), 11, (64, 0), 270);
            Add_Action (Table.States (248), 15, (63, 0), 271);
            Add_Action (Table.States (248), 22, (65, 0), 272);
            Table.States (248).Kernel := To_Vector ((((63, 0),  60,  3, (32767, 0),  0), ((64, 0),  60,  4, (32767, 0),
             0), ((65, 0),  60,  2, (32767, 0),  0)));
            Table.States (248).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (65, 0),  22, 272)));
            Table.States (249).Action_List.Set_Capacity (1);
            Add_Action (Table.States (249), 15, (74, 0), 273);
            Table.States (249).Kernel := To_Vector ((0 => ((74, 0),  39,  4, (32767, 0),  0)));
            Table.States (249).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (74, 0),  15, 273)));
            Table.States (250).Action_List.Set_Capacity (1);
            Add_Action (Table.States (250), 39, (69, 1), 274);
            Table.States (250).Kernel := To_Vector ((0 => ((69, 1),  30,  3, (32767, 0),  0)));
            Table.States (250).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (69, 1),  39, 274)));
            Table.States (251).Action_List.Set_Capacity (10);
            Add_Action (Table.States (251), 12, (59, 0), 130);
            Add_Action (Table.States (251), 13, (59, 1), 131);
            Add_Action (Table.States (251), 16, (43, 0), 132);
            Add_Action (Table.States (251), 21, (45, 0), 9);
            Add_Action (Table.States (251), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (251), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (251), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (251), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (251), 39, (60, 1), 133);
            Add_Action (Table.States (251), 40, (71, 0), 134);
            Table.States (251).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (251), 43, 135);
            Add_Goto (Table.States (251), 45, 136);
            Add_Goto (Table.States (251), 46, 137);
            Add_Goto (Table.States (251), 58, 275);
            Add_Goto (Table.States (251), 59, 139);
            Add_Goto (Table.States (251), 60, 140);
            Add_Goto (Table.States (251), 61, 141);
            Add_Goto (Table.States (251), 71, 142);
            Add_Goto (Table.States (251), 73, 143);
            Table.States (251).Kernel := To_Vector ((0 => ((69, 0),  31,  1, (32767, 0),  0)));
            Table.States (251).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  0)));
            Table.States (252).Action_List.Set_Capacity (8);
            Add_Action (Table.States (252), (8, 10, 14, 18, 20, 25, 27, 39), (54, 1),  2);
            Table.States (252).Kernel := To_Vector ((0 => ((54, 1),  53,  0, (54, 1),  2)));
            Table.States (252).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (54, 1),  2)));
            Table.States (253).Action_List.Set_Capacity (7);
            Add_Action (Table.States (253), (8, 10, 14, 18, 20, 25, 39), (44, 3),  8);
            Table.States (253).Kernel := To_Vector ((0 => ((44, 3),  36,  0, (44, 3),  8)));
            Table.States (253).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (44, 3),  8)));
            Table.States (254).Action_List.Set_Capacity (11);
            Add_Action (Table.States (254), 12, (59, 0), 32);
            Add_Action (Table.States (254), 13, (59, 1), 33);
            Add_Action (Table.States (254), 16, (43, 0), 34);
            Add_Action (Table.States (254), 21, (45, 0), 9);
            Add_Action (Table.States (254), 23, Reduce, (60, 0),  0);
            Add_Action (Table.States (254), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (254), 32, Reduce, (60, 0),  0);
            Add_Action (Table.States (254), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (254), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (254), 39, (60, 1), 36);
            Add_Action (Table.States (254), 40, (71, 0), 37);
            Table.States (254).Goto_List.Set_Capacity (10);
            Add_Goto (Table.States (254), 43, 38);
            Add_Goto (Table.States (254), 45, 39);
            Add_Goto (Table.States (254), 46, 40);
            Add_Goto (Table.States (254), 58, 41);
            Add_Goto (Table.States (254), 59, 42);
            Add_Goto (Table.States (254), 60, 43);
            Add_Goto (Table.States (254), 61, 44);
            Add_Goto (Table.States (254), 71, 45);
            Add_Goto (Table.States (254), 72, 258);
            Add_Goto (Table.States (254), 73, 47);
            Table.States (254).Kernel := To_Vector ((0 => ((43, 0),  16,  1, (32767, 0),  0)));
            Table.States (254).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (72, 0),  0)));
            Table.States (255).Action_List.Set_Capacity (3);
            Add_Action (Table.States (255), (6, 29, 36), (59, 0),  2);
            Table.States (255).Kernel := To_Vector ((0 => ((59, 0),  43,  0, (59, 0),  2)));
            Table.States (255).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (59, 0),  2)));
            Table.States (256).Action_List.Set_Capacity (3);
            Add_Action (Table.States (256), (6, 29, 36), (59, 1),  2);
            Table.States (256).Kernel := To_Vector ((0 => ((59, 1),  43,  0, (59, 1),  2)));
            Table.States (256).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (59, 1),  2)));
            Table.States (257).Action_List.Set_Capacity (3);
            Add_Action (Table.States (257), (6, 29, 36), (73, 1),  2);
            Table.States (257).Kernel := To_Vector ((0 => ((73, 1),  23,  0, (73, 1),  2)));
            Table.States (257).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 1),  2)));
            Table.States (258).Action_List.Set_Capacity (2);
            Add_Action (Table.States (258), 23, (43, 0), 276);
            Add_Action (Table.States (258), 32, (72, 1), 67);
            Table.States (258).Kernel := To_Vector ((((43, 0),  72,  1, (32767, 0),  0), ((72, 1),  72,  1, (32767, 0),
             0)));
            Table.States (258).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  23, 276)));
            Table.States (259).Action_List.Set_Capacity (1);
            Add_Action (Table.States (259), 39, (46, 0), 277);
            Table.States (259).Kernel := To_Vector ((((46, 0),  35,  1, (32767, 0),  0), ((46, 1),  35,  4, (32767, 0),
             0)));
            Table.States (259).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 0),  39, 277)));
            Table.States (260).Action_List.Set_Capacity (1);
            Add_Action (Table.States (260), 38, (44, 2), 278);
            Table.States (260).Kernel := To_Vector ((0 => ((44, 2),  6,  2, (32767, 0),  0)));
            Table.States (260).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 2),  38, 278)));
            Table.States (261).Action_List.Set_Capacity (11);
            Add_Action (Table.States (261), 6, Reduce, (60, 0),  0);
            Add_Action (Table.States (261), 12, (59, 0), 227);
            Add_Action (Table.States (261), 13, (59, 1), 228);
            Add_Action (Table.States (261), 16, (43, 0), 229);
            Add_Action (Table.States (261), 21, (45, 0), 9);
            Add_Action (Table.States (261), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (261), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (261), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (261), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (261), 39, (60, 1), 230);
            Add_Action (Table.States (261), 40, (71, 0), 231);
            Table.States (261).Goto_List.Set_Capacity (8);
            Add_Goto (Table.States (261), 43, 232);
            Add_Goto (Table.States (261), 45, 233);
            Add_Goto (Table.States (261), 46, 234);
            Add_Goto (Table.States (261), 59, 236);
            Add_Goto (Table.States (261), 60, 237);
            Add_Goto (Table.States (261), 61, 238);
            Add_Goto (Table.States (261), 71, 239);
            Add_Goto (Table.States (261), 73, 279);
            Table.States (261).Kernel := To_Vector ((0 => ((58, 1),  29,  0, (73, 0),  0)));
            Table.States (261).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (73, 0),  0)));
            Table.States (262).Action_List.Set_Capacity (7);
            Add_Action (Table.States (262), (8, 10, 14, 18, 20, 25, 39), (44, 1),  8);
            Table.States (262).Kernel := To_Vector ((0 => ((44, 1),  36,  0, (44, 1),  8)));
            Table.States (262).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (44, 1),  8)));
            Table.States (263).Action_List.Set_Capacity (1);
            Add_Action (Table.States (263), 39, (61, 1), 280);
            Table.States (263).Kernel := To_Vector ((0 => ((61, 1),  33,  1, (32767, 0),  0)));
            Table.States (263).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (61, 1),  39, 280)));
            Table.States (264).Action_List.Set_Capacity (1);
            Add_Action (Table.States (264), 36, (64, 0), 281);
            Table.States (264).Kernel := To_Vector ((0 => ((64, 0),  60,  1, (32767, 0),  0)));
            Table.States (264).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (64, 0),  36, 281)));
         end Subr_5;
         procedure Subr_6
         is begin
            Table.States (265).Action_List.Set_Capacity (2);
            Add_Action (Table.States (265), (29, 36), (46, 1),  6);
            Table.States (265).Kernel := To_Vector ((0 => ((46, 1),  23,  0, (46, 1),  6)));
            Table.States (265).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (46, 1),  6)));
            Table.States (266).Action_List.Set_Capacity (2);
            Add_Action (Table.States (266), 10, Reduce, (49, 0),  0);
            Add_Action (Table.States (266), 27, (48, 0), 147);
            Add_Conflict (Table.States (266), 27, (49, 0),  0);
            Table.States (266).Goto_List.Set_Capacity (2);
            Add_Goto (Table.States (266), 48, 148);
            Add_Goto (Table.States (266), 49, 282);
            Table.States (266).Kernel := To_Vector ((0 => ((47, 0),  15,  3, (32767, 0),  0)));
            Table.States (266).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (49, 0),  0)));
            Table.States (267).Action_List.Set_Capacity (1);
            Add_Action (Table.States (267), 40, (44, 3), 283);
            Table.States (267).Kernel := To_Vector ((0 => ((44, 3),  16,  4, (32767, 0),  0)));
            Table.States (267).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 3),  40, 283)));
            Table.States (268).Action_List.Set_Capacity (3);
            Add_Action (Table.States (268), 19, (56, 2), 152);
            Add_Action (Table.States (268), 23, Reduce, (56, 0),  0);
            Add_Action (Table.States (268), 40, (56, 1), 153);
            Table.States (268).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (268), 56, 284);
            Table.States (268).Kernel := To_Vector ((((44, 1),  16,  3, (32767, 0),  0), ((44, 2),  16,  5, (32767, 0),
             0)));
            Table.States (268).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (56, 0),  0)));
            Table.States (269).Action_List.Set_Capacity (10);
            Add_Action (Table.States (269), 12, (59, 0), 130);
            Add_Action (Table.States (269), 13, (59, 1), 131);
            Add_Action (Table.States (269), 16, (43, 0), 132);
            Add_Action (Table.States (269), 21, (45, 0), 9);
            Add_Action (Table.States (269), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (269), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (269), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (269), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (269), 39, (60, 1), 133);
            Add_Action (Table.States (269), 40, (71, 0), 134);
            Table.States (269).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (269), 43, 135);
            Add_Goto (Table.States (269), 45, 136);
            Add_Goto (Table.States (269), 46, 137);
            Add_Goto (Table.States (269), 58, 285);
            Add_Goto (Table.States (269), 59, 139);
            Add_Goto (Table.States (269), 60, 140);
            Add_Goto (Table.States (269), 61, 141);
            Add_Goto (Table.States (269), 71, 142);
            Add_Goto (Table.States (269), 73, 143);
            Table.States (269).Kernel := To_Vector ((0 => ((44, 0),  26,  1, (32767, 0),  0)));
            Table.States (269).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  0)));
            Table.States (270).Action_List.Set_Capacity (3);
            Add_Action (Table.States (270), 15, Reduce, (60, 0),  0);
            Add_Action (Table.States (270), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (270), 39, (60, 1), 105);
            Table.States (270).Goto_List.Set_Capacity (2);
            Add_Goto (Table.States (270), 60, 106);
            Add_Goto (Table.States (270), 61, 286);
            Table.States (270).Kernel := To_Vector ((0 => ((64, 0),  11,  3, (32767, 0),  0)));
            Table.States (270).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 0),  0)));
            Table.States (271).Action_List.Set_Capacity (7);
            Add_Action (Table.States (271), 8, (47, 0), 85);
            Add_Action (Table.States (271), 10, Reduce, (55, 0),  0);
            Add_Action (Table.States (271), 14, (44, 0), 86);
            Add_Action (Table.States (271), 18, (69, 4), 87);
            Add_Action (Table.States (271), 20, (63, 0), 88);
            Add_Action (Table.States (271), 25, (74, 0), 89);
            Add_Action (Table.States (271), 39, (69, 0), 90);
            Table.States (271).Goto_List.Set_Capacity (11);
            Add_Goto (Table.States (271), 44, 91);
            Add_Goto (Table.States (271), 47, 92);
            Add_Goto (Table.States (271), 53, 93);
            Add_Goto (Table.States (271), 54, 94);
            Add_Goto (Table.States (271), 55, 287);
            Add_Goto (Table.States (271), 62, 96);
            Add_Goto (Table.States (271), 63, 97);
            Add_Goto (Table.States (271), 64, 98);
            Add_Goto (Table.States (271), 65, 99);
            Add_Goto (Table.States (271), 69, 100);
            Add_Goto (Table.States (271), 74, 101);
            Table.States (271).Kernel := To_Vector ((0 => ((63, 0),  15,  2, (32767, 0),  0)));
            Table.States (271).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (55, 0),  0)));
            Table.States (272).Action_List.Set_Capacity (3);
            Add_Action (Table.States (272), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (272), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (272), 39, (60, 1), 158);
            Table.States (272).Goto_List.Set_Capacity (2);
            Add_Goto (Table.States (272), 60, 159);
            Add_Goto (Table.States (272), 61, 288);
            Table.States (272).Kernel := To_Vector ((0 => ((65, 0),  22,  1, (32767, 0),  0)));
            Table.States (272).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 0),  0)));
            Table.States (273).Action_List.Set_Capacity (1);
            Add_Action (Table.States (273), 16, (43, 0), 161);
            Table.States (273).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (273), 43, 289);
            Table.States (273).Kernel := To_Vector ((0 => ((74, 0),  15,  3, (32767, 0),  0)));
            Table.States (273).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (43, 0),  16, 161)));
            Table.States (274).Action_List.Set_Capacity (1);
            Add_Action (Table.States (274), 31, (69, 1), 290);
            Table.States (274).Kernel := To_Vector ((0 => ((69, 1),  39,  2, (32767, 0),  0)));
            Table.States (274).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (69, 1),  31, 290)));
            Table.States (275).Action_List.Set_Capacity (2);
            Add_Action (Table.States (275), 29, (58, 1), 170);
            Add_Action (Table.States (275), 36, (69, 0), 291);
            Table.States (275).Kernel := To_Vector ((((58, 1),  58,  1, (32767, 0),  0), ((69, 0),  58,  1, (32767, 0),
             0)));
            Table.States (275).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (69, 0),  36, 291)));
            Table.States (276).Action_List.Set_Capacity (3);
            Add_Action (Table.States (276), (6, 29, 36), (43, 0),  3);
            Table.States (276).Kernel := To_Vector ((0 => ((43, 0),  23,  0, (43, 0),  3)));
            Table.States (276).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (43, 0),  3)));
            Table.States (277).Action_List.Set_Capacity (4);
            Add_Action (Table.States (277), 6, Reduce, (46, 0),  3);
            Add_Action (Table.States (277), 16, (46, 1), 292);
            Add_Action (Table.States (277), 29, Reduce, (46, 0),  3);
            Add_Action (Table.States (277), 36, Reduce, (46, 0),  3);
            Table.States (277).Kernel := To_Vector ((((46, 0),  39,  0, (46, 0),  3), ((46, 1),  39,  3, (32767, 0),
            0)));
            Table.States (277).Minimal_Complete_Actions := To_Vector (((Reduce, (46, 0),  3), (Shift, (46, 1),  16,
            292)));
            Table.States (278).Action_List.Set_Capacity (1);
            Add_Action (Table.States (278), 36, (44, 2), 293);
            Table.States (278).Kernel := To_Vector ((0 => ((44, 2),  38,  1, (32767, 0),  0)));
            Table.States (278).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 2),  36, 293)));
            Table.States (279).Action_List.Set_Capacity (3);
            Add_Action (Table.States (279), (6, 29, 36), (58, 1),  3);
            Table.States (279).Kernel := To_Vector ((0 => ((58, 1),  73,  0, (58, 1),  3)));
            Table.States (279).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 1),  3)));
            Table.States (280).Action_List.Set_Capacity (5);
            Add_Action (Table.States (280), (6, 29, 33, 35, 36), (61, 1),  3);
            Table.States (280).Kernel := To_Vector ((0 => ((61, 1),  39,  0, (61, 1),  3)));
            Table.States (280).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (61, 1),  3)));
            Table.States (281).Action_List.Set_Capacity (7);
            Add_Action (Table.States (281), (8, 10, 14, 18, 20, 25, 39), (64, 0),  9);
            Table.States (281).Kernel := To_Vector ((0 => ((64, 0),  36,  0, (64, 0),  9)));
            Table.States (281).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (64, 0),  9)));
            Table.States (282).Action_List.Set_Capacity (2);
            Add_Action (Table.States (282), 10, (47, 0), 294);
            Add_Action (Table.States (282), 27, (48, 0), 147);
            Table.States (282).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (282), 48, 180);
            Table.States (282).Kernel := To_Vector ((((47, 0),  49,  3, (32767, 0),  0), ((49, 2),  49,  2, (32767, 0),
             0)));
            Table.States (282).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (47, 0),  10, 294)));
            Table.States (283).Action_List.Set_Capacity (1);
            Add_Action (Table.States (283), 23, (44, 3), 295);
            Table.States (283).Kernel := To_Vector ((0 => ((44, 3),  40,  3, (32767, 0),  0)));
            Table.States (283).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 3),  23, 295)));
            Table.States (284).Action_List.Set_Capacity (1);
            Add_Action (Table.States (284), 23, (44, 1), 296);
            Table.States (284).Kernel := To_Vector ((((44, 1),  56,  3, (32767, 0),  0), ((44, 2),  56,  5, (32767, 0),
             0)));
            Table.States (284).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 1),  23, 296)));
            Table.States (285).Action_List.Set_Capacity (2);
            Add_Action (Table.States (285), 29, (58, 1), 170);
            Add_Action (Table.States (285), 36, (44, 0), 297);
            Table.States (285).Kernel := To_Vector ((((44, 0),  58,  1, (32767, 0),  0), ((58, 1),  58,  1, (32767, 0),
             0)));
            Table.States (285).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 0),  36, 297)));
            Table.States (286).Action_List.Set_Capacity (2);
            Add_Action (Table.States (286), 15, (64, 0), 298);
            Add_Action (Table.States (286), 33, (61, 1), 121);
            Table.States (286).Kernel := To_Vector ((((61, 1),  61,  2, (32767, 0),  0), ((64, 0),  61,  3, (32767, 0),
             0)));
            Table.States (286).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (64, 0),  15, 298)));
            Table.States (287).Action_List.Set_Capacity (1);
            Add_Action (Table.States (287), 10, (63, 0), 299);
            Table.States (287).Kernel := To_Vector ((0 => ((63, 0),  55,  2, (32767, 0),  0)));
            Table.States (287).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (63, 0),  10, 299)));
            Table.States (288).Action_List.Set_Capacity (2);
            Add_Action (Table.States (288), 33, (61, 1), 186);
            Add_Action (Table.States (288), 36, (65, 0), 300);
            Table.States (288).Kernel := To_Vector ((((61, 1),  61,  2, (32767, 0),  0), ((65, 0),  61,  1, (32767, 0),
             0)));
            Table.States (288).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (65, 0),  36, 300)));
            Table.States (289).Action_List.Set_Capacity (1);
            Add_Action (Table.States (289), 36, (74, 0), 301);
            Table.States (289).Kernel := To_Vector ((0 => ((74, 0),  43,  1, (32767, 0),  0)));
            Table.States (289).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (74, 0),  36, 301)));
            Table.States (290).Action_List.Set_Capacity (10);
            Add_Action (Table.States (290), 12, (59, 0), 130);
            Add_Action (Table.States (290), 13, (59, 1), 131);
            Add_Action (Table.States (290), 16, (43, 0), 132);
            Add_Action (Table.States (290), 21, (45, 0), 9);
            Add_Action (Table.States (290), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (290), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (290), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (290), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (290), 39, (60, 1), 133);
            Add_Action (Table.States (290), 40, (71, 0), 134);
            Table.States (290).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (290), 43, 135);
            Add_Goto (Table.States (290), 45, 136);
            Add_Goto (Table.States (290), 46, 137);
            Add_Goto (Table.States (290), 58, 302);
            Add_Goto (Table.States (290), 59, 139);
            Add_Goto (Table.States (290), 60, 140);
            Add_Goto (Table.States (290), 61, 141);
            Add_Goto (Table.States (290), 71, 142);
            Add_Goto (Table.States (290), 73, 143);
            Table.States (290).Kernel := To_Vector ((0 => ((69, 1),  31,  1, (32767, 0),  0)));
            Table.States (290).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  0)));
            Table.States (291).Action_List.Set_Capacity (8);
            Add_Action (Table.States (291), (8, 10, 14, 18, 20, 25, 27, 39), (69, 0),  4);
            Table.States (291).Kernel := To_Vector ((0 => ((69, 0),  36,  0, (69, 0),  4)));
            Table.States (291).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (69, 0),  4)));
            Table.States (292).Action_List.Set_Capacity (1);
            Add_Action (Table.States (292), 40, (46, 1), 303);
            Table.States (292).Kernel := To_Vector ((0 => ((46, 1),  16,  2, (32767, 0),  0)));
            Table.States (292).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 1),  40, 303)));
            Table.States (293).Action_List.Set_Capacity (7);
            Add_Action (Table.States (293), (8, 10, 14, 18, 20, 25, 39), (44, 2),  10);
            Table.States (293).Kernel := To_Vector ((0 => ((44, 2),  36,  0, (44, 2),  10)));
            Table.States (293).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (44, 2),  10)));
            Table.States (294).Action_List.Set_Capacity (1);
            Add_Action (Table.States (294), 8, (47, 0), 304);
            Table.States (294).Kernel := To_Vector ((0 => ((47, 0),  10,  2, (32767, 0),  0)));
            Table.States (294).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (47, 0),  8, 304)));
            Table.States (295).Action_List.Set_Capacity (1);
            Add_Action (Table.States (295), 26, (44, 3), 305);
            Table.States (295).Kernel := To_Vector ((0 => ((44, 3),  23,  2, (32767, 0),  0)));
            Table.States (295).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 3),  26, 305)));
            Table.States (296).Action_List.Set_Capacity (1);
            Add_Action (Table.States (296), 26, (44, 1), 306);
            Table.States (296).Kernel := To_Vector ((((44, 1),  23,  2, (32767, 0),  0), ((44, 2),  23,  4, (32767, 0),
             0)));
            Table.States (296).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 1),  26, 306)));
            Table.States (297).Action_List.Set_Capacity (8);
            Add_Action (Table.States (297), (8, 10, 14, 18, 20, 25, 27, 39), (44, 0),  5);
            Table.States (297).Kernel := To_Vector ((0 => ((44, 0),  36,  0, (44, 0),  5)));
            Table.States (297).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (44, 0),  5)));
            Table.States (298).Action_List.Set_Capacity (7);
            Add_Action (Table.States (298), 8, (47, 0), 85);
            Add_Action (Table.States (298), 10, Reduce, (55, 0),  0);
            Add_Action (Table.States (298), 14, (44, 0), 86);
            Add_Action (Table.States (298), 18, (69, 4), 87);
            Add_Action (Table.States (298), 20, (63, 0), 88);
            Add_Action (Table.States (298), 25, (74, 0), 89);
            Add_Action (Table.States (298), 39, (69, 0), 90);
            Table.States (298).Goto_List.Set_Capacity (11);
            Add_Goto (Table.States (298), 44, 91);
            Add_Goto (Table.States (298), 47, 92);
            Add_Goto (Table.States (298), 53, 93);
            Add_Goto (Table.States (298), 54, 94);
            Add_Goto (Table.States (298), 55, 307);
            Add_Goto (Table.States (298), 62, 96);
            Add_Goto (Table.States (298), 63, 97);
            Add_Goto (Table.States (298), 64, 98);
            Add_Goto (Table.States (298), 65, 99);
            Add_Goto (Table.States (298), 69, 100);
            Add_Goto (Table.States (298), 74, 101);
            Table.States (298).Kernel := To_Vector ((0 => ((64, 0),  15,  2, (32767, 0),  0)));
            Table.States (298).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (55, 0),  0)));
            Table.States (299).Action_List.Set_Capacity (2);
            Add_Action (Table.States (299), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (299), 39, (60, 1), 144);
            Table.States (299).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (299), 60, 308);
            Table.States (299).Kernel := To_Vector ((0 => ((63, 0),  10,  1, (32767, 0),  0)));
            Table.States (299).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 0),  0)));
            Table.States (300).Action_List.Set_Capacity (8);
            Add_Action (Table.States (300), (8, 10, 14, 18, 20, 25, 27, 39), (65, 0),  5);
            Table.States (300).Kernel := To_Vector ((0 => ((65, 0),  36,  0, (65, 0),  5)));
            Table.States (300).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (65, 0),  5)));
            Table.States (301).Action_List.Set_Capacity (8);
            Add_Action (Table.States (301), (8, 10, 14, 18, 20, 25, 27, 39), (74, 0),  5);
            Table.States (301).Kernel := To_Vector ((0 => ((74, 0),  36,  0, (74, 0),  5)));
            Table.States (301).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (74, 0),  5)));
            Table.States (302).Action_List.Set_Capacity (2);
            Add_Action (Table.States (302), 29, (58, 1), 170);
            Add_Action (Table.States (302), 36, (69, 1), 309);
            Table.States (302).Kernel := To_Vector ((((58, 1),  58,  1, (32767, 0),  0), ((69, 1),  58,  1, (32767, 0),
             0)));
            Table.States (302).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (69, 1),  36, 309)));
            Table.States (303).Action_List.Set_Capacity (1);
            Add_Action (Table.States (303), 23, (46, 1), 310);
            Table.States (303).Kernel := To_Vector ((0 => ((46, 1),  40,  1, (32767, 0),  0)));
            Table.States (303).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (46, 1),  23, 310)));
            Table.States (304).Action_List.Set_Capacity (1);
            Add_Action (Table.States (304), 36, (47, 0), 311);
            Table.States (304).Kernel := To_Vector ((0 => ((47, 0),  8,  1, (32767, 0),  0)));
            Table.States (304).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (47, 0),  36, 311)));
            Table.States (305).Action_List.Set_Capacity (10);
            Add_Action (Table.States (305), 12, (59, 0), 130);
            Add_Action (Table.States (305), 13, (59, 1), 131);
            Add_Action (Table.States (305), 16, (43, 0), 132);
            Add_Action (Table.States (305), 21, (45, 0), 9);
            Add_Action (Table.States (305), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (305), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (305), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (305), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (305), 39, (60, 1), 133);
            Add_Action (Table.States (305), 40, (71, 0), 134);
            Table.States (305).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (305), 43, 135);
            Add_Goto (Table.States (305), 45, 136);
            Add_Goto (Table.States (305), 46, 137);
            Add_Goto (Table.States (305), 58, 312);
            Add_Goto (Table.States (305), 59, 139);
            Add_Goto (Table.States (305), 60, 140);
            Add_Goto (Table.States (305), 61, 141);
            Add_Goto (Table.States (305), 71, 142);
            Add_Goto (Table.States (305), 73, 143);
            Table.States (305).Kernel := To_Vector ((0 => ((44, 3),  26,  1, (32767, 0),  0)));
            Table.States (305).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  0)));
            Table.States (306).Action_List.Set_Capacity (11);
            Add_Action (Table.States (306), 6, Reduce, (60, 0),  0);
            Add_Action (Table.States (306), 12, (59, 0), 227);
            Add_Action (Table.States (306), 13, (59, 1), 228);
            Add_Action (Table.States (306), 16, (43, 0), 229);
            Add_Action (Table.States (306), 21, (45, 0), 9);
            Add_Action (Table.States (306), 29, Reduce, (60, 0),  0);
            Add_Action (Table.States (306), 33, Reduce, (60, 0),  0);
            Add_Action (Table.States (306), 35, Reduce, (60, 0),  0);
            Add_Action (Table.States (306), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (306), 39, (60, 1), 230);
            Add_Action (Table.States (306), 40, (71, 0), 231);
            Table.States (306).Goto_List.Set_Capacity (9);
            Add_Goto (Table.States (306), 43, 232);
            Add_Goto (Table.States (306), 45, 233);
            Add_Goto (Table.States (306), 46, 234);
            Add_Goto (Table.States (306), 58, 313);
            Add_Goto (Table.States (306), 59, 236);
            Add_Goto (Table.States (306), 60, 237);
            Add_Goto (Table.States (306), 61, 238);
            Add_Goto (Table.States (306), 71, 239);
            Add_Goto (Table.States (306), 73, 240);
            Table.States (306).Kernel := To_Vector ((((44, 1),  26,  1, (32767, 0),  0), ((44, 2),  26,  3, (32767, 0),
             0)));
            Table.States (306).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (58, 0),  0)));
            Table.States (307).Action_List.Set_Capacity (1);
            Add_Action (Table.States (307), 10, (64, 0), 314);
            Table.States (307).Kernel := To_Vector ((0 => ((64, 0),  55,  2, (32767, 0),  0)));
            Table.States (307).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (64, 0),  10, 314)));
            Table.States (308).Action_List.Set_Capacity (1);
            Add_Action (Table.States (308), 36, (63, 0), 315);
            Table.States (308).Kernel := To_Vector ((0 => ((63, 0),  60,  1, (32767, 0),  0)));
            Table.States (308).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (63, 0),  36, 315)));
            Table.States (309).Action_List.Set_Capacity (8);
            Add_Action (Table.States (309), (8, 10, 14, 18, 20, 25, 27, 39), (69, 1),  6);
            Table.States (309).Kernel := To_Vector ((0 => ((69, 1),  36,  0, (69, 1),  6)));
            Table.States (309).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (69, 1),  6)));
            Table.States (310).Action_List.Set_Capacity (3);
            Add_Action (Table.States (310), (6, 29, 36), (46, 1),  6);
            Table.States (310).Kernel := To_Vector ((0 => ((46, 1),  23,  0, (46, 1),  6)));
            Table.States (310).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (46, 1),  6)));
            Table.States (311).Action_List.Set_Capacity (8);
            Add_Action (Table.States (311), (8, 10, 14, 18, 20, 25, 27, 39), (47, 0),  7);
            Table.States (311).Kernel := To_Vector ((0 => ((47, 0),  36,  0, (47, 0),  7)));
            Table.States (311).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (47, 0),  7)));
            Table.States (312).Action_List.Set_Capacity (2);
            Add_Action (Table.States (312), 29, (58, 1), 170);
            Add_Action (Table.States (312), 36, (44, 3), 316);
            Table.States (312).Kernel := To_Vector ((((44, 3),  58,  1, (32767, 0),  0), ((58, 1),  58,  1, (32767, 0),
             0)));
            Table.States (312).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 3),  36, 316)));
            Table.States (313).Action_List.Set_Capacity (3);
            Add_Action (Table.States (313), 6, (44, 2), 317);
            Add_Action (Table.States (313), 29, (58, 1), 261);
            Add_Action (Table.States (313), 36, (44, 1), 318);
            Table.States (313).Kernel := To_Vector ((((44, 1),  58,  1, (32767, 0),  0), ((44, 2),  58,  3, (32767, 0),
             0), ((58, 1),  58,  1, (32767, 0),  0)));
            Table.States (313).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 1),  36, 318)));
            Table.States (314).Action_List.Set_Capacity (2);
            Add_Action (Table.States (314), 36, Reduce, (60, 0),  0);
            Add_Action (Table.States (314), 39, (60, 1), 144);
            Table.States (314).Goto_List.Set_Capacity (1);
            Add_Goto (Table.States (314), 60, 319);
            Table.States (314).Kernel := To_Vector ((0 => ((64, 0),  10,  1, (32767, 0),  0)));
            Table.States (314).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (60, 0),  0)));
            Table.States (315).Action_List.Set_Capacity (8);
            Add_Action (Table.States (315), (8, 10, 14, 18, 20, 25, 27, 39), (63, 0),  7);
            Table.States (315).Kernel := To_Vector ((0 => ((63, 0),  36,  0, (63, 0),  7)));
            Table.States (315).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (63, 0),  7)));
            Table.States (316).Action_List.Set_Capacity (8);
            Add_Action (Table.States (316), (8, 10, 14, 18, 20, 25, 27, 39), (44, 3),  8);
            Table.States (316).Kernel := To_Vector ((0 => ((44, 3),  36,  0, (44, 3),  8)));
            Table.States (316).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (44, 3),  8)));
         end Subr_6;
         procedure Subr_7
         is begin
            Table.States (317).Action_List.Set_Capacity (1);
            Add_Action (Table.States (317), 38, (44, 2), 320);
            Table.States (317).Kernel := To_Vector ((0 => ((44, 2),  6,  2, (32767, 0),  0)));
            Table.States (317).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 2),  38, 320)));
            Table.States (318).Action_List.Set_Capacity (8);
            Add_Action (Table.States (318), (8, 10, 14, 18, 20, 25, 27, 39), (44, 1),  8);
            Table.States (318).Kernel := To_Vector ((0 => ((44, 1),  36,  0, (44, 1),  8)));
            Table.States (318).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (44, 1),  8)));
            Table.States (319).Action_List.Set_Capacity (1);
            Add_Action (Table.States (319), 36, (64, 0), 321);
            Table.States (319).Kernel := To_Vector ((0 => ((64, 0),  60,  1, (32767, 0),  0)));
            Table.States (319).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (64, 0),  36, 321)));
            Table.States (320).Action_List.Set_Capacity (1);
            Add_Action (Table.States (320), 36, (44, 2), 322);
            Table.States (320).Kernel := To_Vector ((0 => ((44, 2),  38,  1, (32767, 0),  0)));
            Table.States (320).Minimal_Complete_Actions := To_Vector ((0 => (Shift, (44, 2),  36, 322)));
            Table.States (321).Action_List.Set_Capacity (8);
            Add_Action (Table.States (321), (8, 10, 14, 18, 20, 25, 27, 39), (64, 0),  9);
            Table.States (321).Kernel := To_Vector ((0 => ((64, 0),  36,  0, (64, 0),  9)));
            Table.States (321).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (64, 0),  9)));
            Table.States (322).Action_List.Set_Capacity (8);
            Add_Action (Table.States (322), (8, 10, 14, 18, 20, 25, 27, 39), (44, 2),  10);
            Table.States (322).Kernel := To_Vector ((0 => ((44, 2),  36,  0, (44, 2),  10)));
            Table.States (322).Minimal_Complete_Actions := To_Vector ((0 => (Reduce, (44, 2),  10)));
         end Subr_7;
      begin
         Subr_1;
         Subr_2;
         Subr_3;
         Subr_4;
         Subr_5;
         Subr_6;
         Subr_7;
         Table.Error_Action := new Parse_Action_Node'((Verb => Error, others => <>), null);
      end;

      Table.Error_Recover_Enabled := True;
      Table.McKenzie_Param := McKenzie_Param;
      Table.Max_Parallel := 15;
      return Table;
   end Create_Parse_Table;

   function Create_Lexer (Trace : in WisiToken.Trace_Access) return WisiToken.Lexer.Handle
   is begin
      return Lexer.New_Lexer (Trace, Gpr_Process_Actions.Descriptor'Access);
   end Create_Lexer;

   function Create_Productions return WisiToken.Syntax_Trees.Production_Info_Trees.Vector
   is begin
      return Result : WisiToken.Syntax_Trees.Production_Info_Trees.Vector do
         Result.Set_First_Last (42, 75);
         Result (43).RHSs.Set_First_Last (0, 0);
         Result (43).RHSs (0).In_Parse_Action := null;
         Result (43).RHSs (0).Post_Parse_Action := aggregate_g_0'Access;
         Result (44).RHSs.Set_First_Last (0, 3);
         Result (44).RHSs (0).In_Parse_Action := null;
         Result (44).RHSs (0).Post_Parse_Action := attribute_declaration_0'Access;
         Result (44).RHSs (1).In_Parse_Action := null;
         Result (44).RHSs (1).Post_Parse_Action := attribute_declaration_1'Access;
         Result (44).RHSs (2).In_Parse_Action := null;
         Result (44).RHSs (2).Post_Parse_Action := attribute_declaration_2'Access;
         Result (44).RHSs (3).In_Parse_Action := null;
         Result (44).RHSs (3).Post_Parse_Action := attribute_declaration_3'Access;
         Result (47).RHSs.Set_First_Last (0, 0);
         Result (47).RHSs (0).In_Parse_Action := null;
         Result (47).RHSs (0).Post_Parse_Action := case_statement_0'Access;
         Result (48).RHSs.Set_First_Last (0, 0);
         Result (48).RHSs (0).In_Parse_Action := null;
         Result (48).RHSs (0).Post_Parse_Action := case_item_0'Access;
         Result (50).RHSs.Set_First_Last (0, 0);
         Result (50).RHSs (0).In_Parse_Action := null;
         Result (50).RHSs (0).Post_Parse_Action := compilation_unit_0'Access;
         Result (60).RHSs.Set_First_Last (0, 1);
         Result (60).RHSs (0).In_Parse_Action := null;
         Result (60).RHSs (0).Post_Parse_Action := null;
         Result (60).RHSs (1).In_Parse_Action := identifier_opt_1_check'Access;
         Result (60).RHSs (1).Post_Parse_Action := null;
         Result (63).RHSs.Set_First_Last (0, 0);
         Result (63).RHSs (0).In_Parse_Action := package_spec_0_check'Access;
         Result (63).RHSs (0).Post_Parse_Action := package_spec_0'Access;
         Result (64).RHSs.Set_First_Last (0, 0);
         Result (64).RHSs (0).In_Parse_Action := package_extension_0_check'Access;
         Result (64).RHSs (0).Post_Parse_Action := package_extension_0'Access;
         Result (65).RHSs.Set_First_Last (0, 0);
         Result (65).RHSs (0).In_Parse_Action := null;
         Result (65).RHSs (0).Post_Parse_Action := package_renaming_0'Access;
         Result (67).RHSs.Set_First_Last (0, 0);
         Result (67).RHSs (0).In_Parse_Action := project_extension_0_check'Access;
         Result (67).RHSs (0).Post_Parse_Action := project_extension_0'Access;
         Result (69).RHSs.Set_First_Last (0, 4);
         Result (69).RHSs (0).In_Parse_Action := null;
         Result (69).RHSs (0).Post_Parse_Action := simple_declarative_item_0'Access;
         Result (69).RHSs (1).In_Parse_Action := null;
         Result (69).RHSs (1).Post_Parse_Action := simple_declarative_item_1'Access;
         Result (69).RHSs (2).In_Parse_Action := null;
         Result (69).RHSs (2).Post_Parse_Action := null;
         Result (69).RHSs (3).In_Parse_Action := null;
         Result (69).RHSs (3).Post_Parse_Action := null;
         Result (69).RHSs (4).In_Parse_Action := null;
         Result (69).RHSs (4).Post_Parse_Action := simple_declarative_item_4'Access;
         Result (70).RHSs.Set_First_Last (0, 0);
         Result (70).RHSs (0).In_Parse_Action := simple_project_declaration_0_check'Access;
         Result (70).RHSs (0).Post_Parse_Action := simple_project_declaration_0'Access;
         Result (74).RHSs.Set_First_Last (0, 0);
         Result (74).RHSs (0).In_Parse_Action := null;
         Result (74).RHSs (0).Post_Parse_Action := typed_string_declaration_0'Access;
      end return;
   end Create_Productions;

end Gpr_Process_Main;
