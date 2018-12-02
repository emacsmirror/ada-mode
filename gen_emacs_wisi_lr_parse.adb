--  Abstract :
--
--  See spec.
--
--  Copyright (C) 2014, 2017, 2018 All Rights Reserved.
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
with Ada.Directories;
with Ada.Exceptions;
with Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Emacs_Wisi_Common_Parse; use Emacs_Wisi_Common_Parse;
with GNAT.Traceback.Symbolic;
with System.Multiprocessors;
with WisiToken.Lexer;
with WisiToken.Parse.LR.Parser;
with WisiToken.Text_IO_Trace;
procedure Gen_Emacs_Wisi_LR_Parse
is
   use WisiToken; -- "+", "-" Unbounded_string

   Trace      : aliased WisiToken.Text_IO_Trace.Trace (Descriptor'Unrestricted_Access);
   Parser     : WisiToken.Parse.LR.Parser.Parser;
   Parse_Data : aliased Parse_Data_Type (Parser.Line_Begin_Token'Access);

   procedure Cleanup
   is begin
      if Is_Open (Parser.Recover_Log_File) then
         Close (Parser.Recover_Log_File);
      end if;
   end Cleanup;

begin
   declare
      use Ada.Directories;
      use Ada.Strings.Unbounded;
      Params : constant Process_Start_Params := Get_Process_Start_Params;
   begin
      Create_Parser
        (Parser, Language_Fixes, Language_Use_Minimal_Complete_Actions, Language_String_ID_Set,
         Trace'Unrestricted_Access,
         Parse_Data'Unchecked_Access);

      if Length (Params.Recover_Log_File_Name) > 0 then
         Put_Line (";; logging to '" & (-Params.Recover_Log_File_Name) & "'"); --  to Current_Output, visible from Emacs
         if Exists (-Params.Recover_Log_File_Name) then
            Open (Parser.Recover_Log_File, Append_File, -Params.Recover_Log_File_Name);
         else
            Create (Parser.Recover_Log_File, Out_File, -Params.Recover_Log_File_Name);
         end if;
      end if;
   end;

   Put_Line (Name & " " & Version & ", protocol version " & Protocol_Version);

   --  Read commands and tokens from standard_input via GNAT.OS_Lib,
   --  send results to standard_output.
   loop
      Put (Prompt); Flush;
      declare
         Command_Length : constant Integer := Get_Command_Length;
         Command_Line   : aliased String (1 .. Command_Length);
         Last           : Integer;

         function Match (Target : in String) return Boolean
         is begin
            Last := Command_Line'First + Target'Length - 1;
            return Last <= Command_Line'Last and then Command_Line (Command_Line'First .. Last) = Target;
         end Match;
      begin
         Read_Input (Command_Line'Address, Command_Length);

         Put_Line (";; " & Command_Line);

         if Match ("parse") then
            --  Args: see Usage
            --  Input: <source text>
            --  Response:
            --  [response elisp vector]...
            --  [elisp error form]...
            --  prompt
            declare
               Params : constant Parse_Params := Get_Parse_Params (Command_Line, Last);
               Buffer : Ada.Strings.Unbounded.String_Access;

               procedure Clean_Up
               is begin
                  Parser.Lexer.Discard_Rest_Of_Input;
                  Parse_Data.Put
                    (Parser.Lexer.Errors,
                     Parser.Parsers.First.State_Ref.Errors,
                     Parser.Parsers.First.State_Ref.Tree);
                  Ada.Strings.Unbounded.Free (Buffer);
               end Clean_Up;

            begin
               --  Computing Line_Count in elisp allows parsing in parallel with
               --  sending source text.

               Trace_Parse    := Params.Parse_Verbosity;
               Trace_McKenzie := Params.McKenzie_Verbosity;
               Trace_Action   := Params.Action_Verbosity;
               Debug_Mode     := Params.Debug_Mode;

               --  Default Enable_McKenzie_Recover is False if there is no McKenzie
               --  information; don't override that.
               Parser.Enable_McKenzie_Recover :=
                 (if Params.McKenzie_Disable = 0
                  then Parser.Enable_McKenzie_Recover
                  else False);

               Parse_Data.Initialize
                 (Post_Parse_Action => Params.Post_Parse_Action,
                  Descriptor        => Descriptor'Unrestricted_Access,
                  Source_File_Name  => -Params.Source_File_Name,
                  Line_Count        => Params.Line_Count,
                  Params            => Command_Line (Last + 2 .. Command_Line'Last));

               if Params.Task_Count > 0 then
                  Parser.Table.McKenzie_Param.Task_Count := System.Multiprocessors.CPU_Range (Params.Task_Count);
               end if;
               if Params.Cost_Limit > 0 then
                  Parser.Table.McKenzie_Param.Cost_Limit := Params.Cost_Limit;
               end if;
               if Params.Check_Limit > 0 then
                  Parser.Table.McKenzie_Param.Check_Limit := Base_Token_Index (Params.Check_Limit);
               end if;
               if Params.Enqueue_Limit > 0 then
                  Parser.Table.McKenzie_Param.Enqueue_Limit := Params.Enqueue_Limit;
               end if;

               Buffer := new String (1 .. Params.Byte_Count);
               Read_Input (Buffer (1)'Address, Params.Byte_Count);

               Parser.Lexer.Reset_With_String_Access (Buffer, Params.Source_File_Name);
               Parser.Parse;
               Parser.Execute_Actions;
               Put (Parse_Data);
               Clean_Up;

            exception
            when Syntax_Error =>
               Clean_Up;
               Put_Line ("(parse_error)");

            when E : Parse_Error =>
               Clean_Up;
               Put_Line ("(parse_error """ & Ada.Exceptions.Exception_Message (E) & """)");

            when E : Fatal_Error =>
               Clean_Up;
               Put_Line ("(error """ & Ada.Exceptions.Exception_Message (E) & """)");
            end;

         elsif Match ("noop") then
            --  Args: <source byte count>
            --  Input: <source text>
            --  Response: prompt
            declare
               Byte_Count  : constant Integer                             := Get_Integer (Command_Line, Last);
               Buffer      : constant Ada.Strings.Unbounded.String_Access := new String (1 .. Byte_Count);
               Token       : Base_Token;
               Lexer_Error : Boolean;
               pragma Unreferenced (Lexer_Error);
            begin
               Token.ID := Invalid_Token_ID;
               Read_Input (Buffer (1)'Address, Byte_Count);

               Parser.Lexer.Reset_With_String_Access (Buffer, +"");
               loop
                  exit when Token.ID = Parser.Trace.Descriptor.EOF_ID;
                  Lexer_Error := Parser.Lexer.Find_Next (Token);
               end loop;
            exception
            when Syntax_Error =>
               Parser.Lexer.Discard_Rest_Of_Input;
            end;

         elsif Match ("quit") then
            exit;

         else
            Put_Line ("(error ""bad command: '" & Command_Line & "'"")");
         end if;
      exception
      when E : Protocol_Error =>
         --  don't exit the loop; allow debugging bad elisp
         Put_Line ("(error ""protocol error "": " & Ada.Exceptions.Exception_Message (E) & """)");
      end;
   end loop;
   Cleanup;
exception
when Finish =>
   null;

when E : others =>
   Cleanup;
   Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   New_Line (2);
   Put_Line
     ("(error ""unhandled exception: " & Ada.Exceptions.Exception_Name (E) & ": " &
        Ada.Exceptions.Exception_Message (E) & """)");
   Put_Line (GNAT.Traceback.Symbolic.Symbolic_Traceback (E));
end Gen_Emacs_Wisi_LR_Parse;
