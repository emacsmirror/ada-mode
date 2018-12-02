--  Abstract :
--
--  See spec.
--
--  Copyright (C) 2017, 2018 All Rights Reserved.
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
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.Traceback.Symbolic;
with Run_Wisi_Common_Parse; use Run_Wisi_Common_Parse;
with SAL;
with WisiToken.Lexer;
with WisiToken.Parse.LR.Parser;
with WisiToken.Text_IO_Trace;
procedure Gen_Run_Wisi_LR_Parse
is
   use WisiToken; -- Token_ID, "+", "-" Unbounded_string

   Trace      : aliased WisiToken.Text_IO_Trace.Trace (Descriptor'Unrestricted_Access);
   Parser     : WisiToken.Parse.LR.Parser.Parser;
   Parse_Data : aliased Parse_Data_Type (Parser.Line_Begin_Token'Access);

   Cl_Params  : Command_Line_Params;
   Line_Count : WisiToken.Line_Number_Type := 1;
   Start      : Ada.Real_Time.Time;
begin
   --  Create parser first so Put_Usage has defaults from Parser.Table,
   --  and Get_CL_Params can override them.
   Create_Parser
     (Parser, Language_Fixes, Language_Use_Minimal_Complete_Actions, Language_String_ID_Set,
      Trace'Unrestricted_Access, Parse_Data'Unchecked_Access);

   Cl_Params := Get_CL_Params (Parser);

   --  Do this after setting Trace_Parse so lexer verbosity is set
   begin
      Parser.Lexer.Reset_With_File (-Cl_Params.Source_File_Name);
   exception
   when Ada.IO_Exceptions.Name_Error =>
      Put_Line (Standard_Error, "'" & (-Cl_Params.Source_File_Name) & "' cannot be opened");
      return;
   end;

   --  See comment in wisi.ads for why we still need this.
   declare
      Token : Base_Token;
      Lexer_Error : Boolean;
      pragma Unreferenced (Lexer_Error);
   begin
      loop
         begin
            Lexer_Error := Parser.Lexer.Find_Next (Token);
            exit when Token.ID = Descriptor.EOF_ID;
         exception
         when WisiToken.Syntax_Error =>
            Parser.Lexer.Discard_Rest_Of_Input;
            Parse_Data.Put
              (Parser.Lexer.Errors,
               Parser.Parsers.First.State_Ref.Errors,
               Parser.Parsers.First.State_Ref.Tree);
            Put_Line ("(lexer_error)");
         end;
      end loop;
      Line_Count := Token.Line;
   end;

   if WisiToken.Trace_Action > WisiToken.Outline then
      Put_Line ("line_count:" & Line_Number_Type'Image (Line_Count));
   end if;

   Parse_Data.Initialize
     (Post_Parse_Action => Cl_Params.Post_Parse_Action,
      Descriptor        => Descriptor'Unrestricted_Access,
      Source_File_Name  => -Cl_Params.Source_File_Name,
      Line_Count        => Line_Count,
      Params            => -Cl_Params.Lang_Params);

   if Cl_Params.Repeat_Count > 1 then
      Start := Ada.Real_Time.Clock;
   end if;

   for I in 1 .. Cl_Params.Repeat_Count loop
      declare
         procedure Clean_Up
         is begin
            Parser.Lexer.Discard_Rest_Of_Input;
            if Cl_Params.Repeat_Count = 1 then
               Parse_Data.Put
                 (Parser.Lexer.Errors,
                  Parser.Parsers.First.State_Ref.Errors,
                  Parser.Parsers.First.State_Ref.Tree);
            end if;
         end Clean_Up;

      begin
         Parse_Data.Reset;
         Parser.Lexer.Reset;

         Parser.Parse;
         Parser.Execute_Actions;

         if Cl_Params.Repeat_Count = 1 then
            Parse_Data.Put;
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
end Gen_Run_Wisi_LR_Parse;
