--  Abstract :
--
--  See spec.
--
--  Copyright (C) 2018 - 2019 Free Software Foundation, Inc.
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
with Ada.IO_Exceptions;
with Ada.Real_Time;
with Ada.Text_IO;
with GNAT.Traceback.Symbolic;
with SAL;
with System.Multiprocessors;
package body Run_Wisi_Common_Parse is

   procedure Usage (Parser : in out WisiToken.Parse.LR.Parser.Parser)
   is
      use all type WisiToken.Parse.LR.Parse_Table_Ptr;
      use Ada.Text_IO;
   begin
      Put_Line
        ("usage: <file_name> <parse_action> [partial parse params]" &
           "[options]");
      Put_Line ("parse_action: {Navigate | Face | Indent}");
      Put_Line ("partial parse params: begin_byte_pos end_byte_pos goal_byte_pos begin_char_pos begin_line" &
                  " end_line begin_indent");
      Put_Line ("options:");
      Put_Line ("--verbosity n m l:");
      Put_Line ("   n: parser; m: mckenzie; l: action");
      Put_Line ("   0 - only report parse errors");
      Put_Line ("   1 - shows spawn/terminate parallel parsers, error recovery enter/exit");
      Put_Line ("   2 - add each parser cycle, error recovery enqueue/check");
      Put_Line ("   3 - parse stack in each cycle, error recovery parse actions");
      Put_Line ("   4 - add lexer debug");
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
      Put_Line ("--debug_mode : tracebacks from unhandled exceptions; default disabled");
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

         if Argument_Count >= 3 and then Argument (3)(1) /= '-' then
            Result.Begin_Byte_Pos := WisiToken.Buffer_Pos'Value (Argument (3));
            Result.End_Byte_Pos   := WisiToken.Buffer_Pos'Value (Argument (4)) - 1; -- match emacs region
            Result.Goal_Byte_Pos  := WisiToken.Buffer_Pos'Value (Argument (5));
            Result.Begin_Char_Pos := WisiToken.Buffer_Pos'Value (Argument (6));
            Result.Begin_Line     := WisiToken.Line_Number_Type'Value (Argument (7));
            Result.End_Line       := WisiToken.Line_Number_Type'Value (Argument (8));
            Result.Begin_Indent   := Integer'Value (Argument (9));
            Arg                   := 10;
         else
            Result.Begin_Byte_Pos := WisiToken.Invalid_Buffer_Pos;
            Result.End_Byte_Pos   := WisiToken.Invalid_Buffer_Pos;
            Result.Begin_Char_Pos := WisiToken.Buffer_Pos'First;
            Result.Begin_Line     := WisiToken.Line_Number_Type'First;
            Arg                   := 3;
         end if;

         loop
            exit when Arg > Argument_Count;

            if Argument (Arg) = "--verbosity" then
               WisiToken.Trace_Parse    := Integer'Value (Argument (Arg + 1));
               WisiToken.Trace_McKenzie := Integer'Value (Argument (Arg + 2));
               WisiToken.Trace_Action   := Integer'Value (Argument (Arg + 3));
               Arg                      := Arg + 4;

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

   procedure Parse_File
     (Parser     : in out WisiToken.Parse.LR.Parser.Parser;
      Parse_Data : in out Wisi.Parse_Data_Type'Class;
      Descriptor : in     WisiToken.Descriptor)
   is
      use Ada.Text_IO;
      use WisiToken;

      Cl_Params : Command_Line_Params; -- not initialized for exception handler
      Start     : Ada.Real_Time.Time;
   begin
      Cl_Params := Get_CL_Params (Parser);

      --  Do this after setting Trace_Parse so lexer verbosity is set
      begin
         Parser.Lexer.Reset_With_File
           (-Cl_Params.Source_File_Name, Cl_Params.Begin_Byte_Pos, Cl_Params.End_Byte_Pos, Cl_Params.Begin_Char_Pos,
            Cl_Params.Begin_Line);
      exception
      when Ada.IO_Exceptions.Name_Error =>
         Put_Line (Standard_Error, "'" & (-Cl_Params.Source_File_Name) & "' cannot be opened");
         return;
      end;

      if Cl_Params.End_Line = Invalid_Line_Number then
         --  User did not provide; run lexer to get end line.
         declare
            Token : Base_Token;
            Lexer_Error : Boolean;
            pragma Unreferenced (Lexer_Error);
         begin
            loop
               Lexer_Error := Parser.Lexer.Find_Next (Token);
               exit when Token.ID = Descriptor.EOI_ID;
            end loop;
            Cl_Params.End_Line := Token.Line;
         end;
      end if;

      Parse_Data.Initialize
        (Post_Parse_Action => Cl_Params.Post_Parse_Action,
         Descriptor        => Descriptor'Unrestricted_Access,
         Source_File_Name  => -Cl_Params.Source_File_Name,
         Begin_Line        => Cl_Params.Begin_Line,
         End_Line          => Cl_Params.End_Line,
         Begin_Indent      => Cl_Params.Begin_Indent,
         Params            => -Cl_Params.Lang_Params);

      if Cl_Params.Repeat_Count > 1 then
         Start := Ada.Real_Time.Clock;
      end if;

      for I in 1 .. Cl_Params.Repeat_Count loop
         declare
            procedure Clean_Up
            is
               use all type SAL.Base_Peek_Type;
            begin
               Parser.Lexer.Discard_Rest_Of_Input;
               if Cl_Params.Repeat_Count = 1 and Parser.Parsers.Count > 0 then
                  Parse_Data.Put
                    (Parser.Lexer.Errors,
                     Parser.Parsers.First.State_Ref.Errors,
                     Parser.Parsers.First.State_Ref.Tree);
               end if;
            end Clean_Up;

         begin
            Parse_Data.Reset;
            Parser.Lexer.Reset;

            begin
               Parser.Parse;
            exception
            when WisiToken.Partial_Parse =>
               null;
            end;
            Parser.Execute_Actions;

            if Cl_Params.Repeat_Count = 1 then
               Parse_Data.Put (Parser);
               Parse_Data.Put
                 (Parser.Lexer.Errors,
                  Parser.Parsers.First.State_Ref.Errors,
                  Parser.Parsers.First.State_Ref.Tree);
            end if;
         exception
         when WisiToken.Syntax_Error =>
            Clean_Up;
            Put_Line ("(parse_error)");

         when E : WisiToken.Parse_Error =>
            Clean_Up;
            Put_Line ("(parse_error """ & Ada.Exceptions.Exception_Message (E) & """)");

         when E : WisiToken.Fatal_Error =>
            Clean_Up;
            Put_Line ("(error """ & Ada.Exceptions.Exception_Message (E) & """)");
         end;
      end loop;

      if Cl_Params.Repeat_Count > 1 then
         declare
            use Ada.Real_Time;
            Finish : constant Time := Clock;
         begin
            Put_Line ("Total time:" & Duration'Image (To_Duration (Finish - Start)));
            Put_Line ("per iteration:" & Duration'Image (To_Duration ((Finish - Start) / Cl_Params.Repeat_Count)));
         end;
      end if;

   exception
   when SAL.Parameter_Error | Finish =>
      --  From Get_CL_Params; already handled.
      null;

   when E : others =>
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
      New_Line (2);
      Put_Line
        ("(error ""unhandled exception: " & Ada.Exceptions.Exception_Name (E) & ": " &
           Ada.Exceptions.Exception_Message (E) & """)");
      Put_Line (GNAT.Traceback.Symbolic.Symbolic_Traceback (E));
   end Parse_File;

end Run_Wisi_Common_Parse;
