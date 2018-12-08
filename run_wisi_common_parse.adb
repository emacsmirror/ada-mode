--  Abstract :
--
--  See spec.
--
--  Copyright (C) 2018 Free Software Foundation, Inc.
--
--  This program is free software; you can redistribute it and/or
--  modify it under terms of the GNU General Public License as
--  published by the Free Software Foundation; either version 3, or (at
--  your option) any later version. This program is distributed in the
--  hope that it will be useful, but WITHOUT ANY WARRANTY; without even
--  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
--  PURPOSE. See the GNU General Public License for more details. You
--  should have received a copy of the GNU General Public License
--  distributed with this program; see file COPYING. If not, write to
--  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston,
--  MA 02110-1335, USA.

pragma License (GPL);

with Ada.Command_Line;
with Ada.Exceptions;
with Ada.Text_IO;
with SAL;
with System.Multiprocessors;
package body Run_Wisi_Common_Parse is

   procedure Usage (Parser : in out WisiToken.Parse.LR.Parser.Parser)
   is
      use all type WisiToken.Parse.LR.Parse_Table_Ptr;
      use Ada.Text_IO;
   begin
      Put_Line ("usage: <file_name> <parse_action> [options]");
      Put_Line ("parse_action: {Navigate | Face | Indent}");
      Put_Line ("options:");
      Put_Line ("--verbosity n m l:");
      Put_Line ("   n: parser; m: mckenzie; l: action");
      Put_Line ("   0 - only report parse errors");
      Put_Line ("   1 - shows spawn/terminate parallel parsers, error recovery enter/exit");
      Put_Line ("   2 - add each parser cycle, error recovery enqueue/check");
      Put_Line ("   3 - parse stack in each cycle, error recovery parse actions");
      Put_Line ("   4 - add lexer debug");
      Put_Line ("--cost_limit n   : set error recover cost limit" &
                  (if Parser.Table = null then ""
                   else "; default" & Integer'Image (Parser.Table.McKenzie_Param.Cost_Limit)));
      Put_Line ("--check_limit n  : set error recover token check limit" &
                  (if Parser.Table = null then ""
                   else "; default" & WisiToken.Token_Index'Image (Parser.Table.McKenzie_Param.Check_Limit)));
      Put_Line ("--enqueue_limit n  : set error recover token enqueue limit" &
                  (if Parser.Table = null then ""
                   else "; default" & Integer'Image (Parser.Table.McKenzie_Param.Enqueue_Limit)));
      Put_Line ("--max_parallel n  : set maximum count of parallel parsers (default" &
                  Integer'Image (WisiToken.Parse.LR.Parser.Default_Max_Parallel) & ")");
      Put_Line ("--task_count n : worker tasks in error recovery");
      Put_Line ("--disable_recover : disable error recovery; default enabled");
      Put_Line ("--lang_params <language-specific params>");
      Put_Line ("--repeat_count n : repeat parse count times, for profiling; default 1");
      New_Line;
   end Usage;

   function Get_CL_Params (Parser : in out WisiToken.Parse.LR.Parser.Parser) return Command_Line_Params
   is
      use Ada.Command_Line;
      use WisiToken;
      Arg : Integer := 1;
   begin
      return Result : Command_Line_Params do
         if Argument_Count < 1 then
            Usage (Parser);
            Set_Exit_Status (Failure);
            raise Finish;

         elsif Argument (Arg) = "--help" then
            Usage (Parser);
            raise Finish;

         elsif Argument_Count < 2 then
            Usage (Parser);
            Set_Exit_Status (Failure);
            raise Finish;
         end if;

         Result.Source_File_Name  := +Ada.Command_Line.Argument (1);
         Result.Post_Parse_Action := Wisi.Post_Parse_Action_Type'Value (Ada.Command_Line.Argument (2));
         Arg               := 3;

         loop
            exit when Arg > Argument_Count;

            if Argument (Arg) = "--verbosity" then
               WisiToken.Trace_Parse    := Integer'Value (Argument (Arg + 1));
               WisiToken.Trace_McKenzie := Integer'Value (Argument (Arg + 2));
               WisiToken.Trace_Action   := Integer'Value (Argument (Arg + 3));
               Arg                      := Arg + 4;

            elsif Argument (Arg) = "--cost_limit" then
               Parser.Table.McKenzie_Param.Cost_Limit := Integer'Value (Argument (Arg + 1));
               Arg := Arg + 2;

            elsif Argument (Arg) = "--check_limit" then
               Parser.Table.McKenzie_Param.Check_Limit := Token_Index'Value (Argument (Arg + 1));
               Arg := Arg + 2;

            elsif Argument (Arg) = "--debug_mode" then
               WisiToken.Debug_Mode := True;
               Arg := Arg + 1;

            elsif Argument (Arg) = "--disable_recover" then
               Parser.Enable_McKenzie_Recover := False;
               Arg := Arg + 1;

            elsif Argument (Arg) = "--enqueue_limit" then
               Parser.Table.McKenzie_Param.Enqueue_Limit := Integer'Value (Argument (Arg + 1));
               Arg := Arg + 2;

            elsif Argument (Arg) = "--lang_params" then
               Result.Lang_Params := +Argument (Arg + 1);
               Arg := Arg + 2;

            elsif Argument (Arg) = "--max_parallel" then
               Parser.Max_Parallel := SAL.Base_Peek_Type'Value (Argument (Arg + 1));
               Arg := Arg + 2;

            elsif Argument (Arg) = "--repeat_count" then
               Result.Repeat_Count := Integer'Value (Argument (Arg + 1));
               Arg := Arg + 2;

            elsif Argument (Arg) = "--task_count" then
               Parser.Table.McKenzie_Param.Task_Count := System.Multiprocessors.CPU_Range'Value (Argument (Arg + 1));
               Arg := Arg + 2;

            else
               Ada.Text_IO.Put_Line ("unrecognized option: '" & Argument (Arg) & "'");
               Usage (Parser);
               Set_Exit_Status (Failure);
               raise SAL.Parameter_Error;
            end if;
         end loop;
      end return;
   exception
   when Finish =>
      raise;

   when E : others =>
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Name (E) & ": " & Ada.Exceptions.Exception_Message (E));
      Usage (Parser);
      Set_Exit_Status (Failure);
      raise SAL.Parameter_Error;
   end Get_CL_Params;

end Run_Wisi_Common_Parse;
