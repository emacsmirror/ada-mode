--  Abstract :
--
--  See spec.
--
--  Copyright (C) 2018 Stephen Leake All Rights Reserved.
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
with Ada.Strings.Fixed;
with Ada.Text_IO;
with GNAT.OS_Lib;
with SAL;
with System.Storage_Elements;
package body Emacs_Wisi_Common_Parse is

   procedure Usage (Name : in String)
   is
      use Ada.Text_IO;
   begin
      Put_Line ("usage: " & Name & "[--recover-log <file-name>]");
      Put_Line ("enters a loop waiting for commands:");
      Put_Line ("Prompt is '" & Prompt & "'");
      Put_Line ("commands are case sensitive");
      Put_Line ("each command starts with a two-character decimal count of bytes in command");
      New_Line;
      Put_Line ("Commands: ");
      New_Line;
      Put_Line
        ("NNNparse <action> <source_file_name> <line_count> <parse_verbosity> <mckenzie_verbosity>"  &
           " <action_verbosity> <mckenzie_disable> <mckenzie_cost_limit> <mckenzie_check_limit>" &
           " <mckenzie_enqueue_limit> <source_byte_count> <language-specific params> <source bytes>");
      Put_Line ("  NNN excludes <source bytes>");
      Put_Line ("  <action> is an integer; 0 - navigate, 1 - face, 2 - indent");
      Put_Line ("  <line-count> is integer count of lines in source");
      Put_Line ("  <*verbosity> is an integer; set parse trace output level");
      Put_Line ("  <mckenzie_disable> is 0 | 1; 0 = use default, 1 = disable");
      Put_Line ("  <*_limit> is integer; -1 means use default");
      Put_Line ("  outputs: elisp vectors for set-text-property from parser actions or elisp forms for errors.");
      New_Line;
      Put_Line ("NNNnoop <source_byte_count> <source bytes>");
      Put_Line ("  Just receive source; otherwise no operation. NN excludes <source bytes>");
      New_Line;
      Put_Line ("04quit");
   end Usage;

   procedure Read_Input (A : System.Address; N : Integer)
   is
      use System.Storage_Elements;

      B         : System.Address := A;
      Remaining : Integer        := N;
      Read      : Integer;
   begin
      --  We use GNAT.OS_Lib because it does not buffer input, so it runs
      --  under Emacs nicely; GNAT Text_IO does not return text until
      --  some fairly large buffer is filled.
      --
      --  With GNAT GPL 2016, GNAT.OS_Lib.Read does _not_ wait for all N
      --  bytes or EOF; it returns as soon as it gets some bytes.
      loop
         Read := GNAT.OS_Lib.Read (GNAT.OS_Lib.Standin, B, Remaining);
         if Read = 0 then
            --  Pipe closed; probably parent Emacs crashed. Force exit.
            raise SAL.Programmer_Error with "input pipe closed";
         end if;
         Remaining := Remaining - Read;
         exit when Remaining <= 0;
         B := B + Storage_Offset (Read);
      end loop;
   end Read_Input;

   function Get_Command_Length return Integer
   is
      Temp : aliased String (1 .. 3) := (others => ' '); -- initialize for error message
   begin
      Read_Input (Temp'Address, Temp'Length);
      return Integer'Value (Temp);
   exception
   when Constraint_Error =>
      --  From Integer'Value
      raise Protocol_Error with "invalid command byte count; '" & Temp & "'";
   end Get_Command_Length;

   function Get_String
     (Source : in     String;
      Last   : in out Integer)
     return String
   is
      use Ada.Strings.Fixed;
      First : constant Integer := Index
        (Source  => Source,
         Pattern => """",
         From    => Last + 1);
   begin
      Last := Index
        (Source  => Source,
         Pattern => """",
         From    => First + 1);

      if First = 0 or Last = 0 then
         raise Protocol_Error with "no '""' found for string";
      end if;

      return Source (First + 1 .. Last - 1);
   end Get_String;

   function Get_Integer
     (Source : in     String;
      Last   : in out Integer)
     return Integer
   is
      use Ada.Strings.Fixed;
      First : constant Integer := Last + 2; -- final char of previous item, space
   begin
      Last := Index
        (Source  => Source,
         Pattern => " ",
         From    => First);

      if Last = 0 then
         Last := Source'Last;
      else
         Last := Last - 1;
      end if;

      return Integer'Value (Source (First .. Last));
   exception
   when others =>
      Ada.Text_IO.Put_Line ("bad integer '" & Source (First .. Source'Last) & "'");
      raise;
   end Get_Integer;

   function Get_Process_Start_Params return Process_Start_Params
   is
      use Ada.Command_Line;
      procedure Put_Usage
      is
         use Ada.Text_IO;
      begin
         Put_Line (Standard_Error, "process start args:");
         Put_Line (Standard_Error, "--help : put this help");
         Put_Line (Standard_Error, "--recover-log <file_name> : log recover actions to file");
      end Put_Usage;

      Next_Arg : Integer := 1;
   begin
      return Result : Process_Start_Params do
         loop
            exit when Next_Arg > Argument_Count;

            if Next_Arg <= Argument_Count and then Argument (Next_Arg) = "--help" then
               Put_Usage;
               raise Finish;

            elsif Next_Arg + 1 <= Argument_Count and then Argument (Next_Arg) = "--recover-log" then
               Result.Recover_Log_File_Name := Ada.Strings.Unbounded.To_Unbounded_String (Argument (Next_Arg + 1));
               Next_Arg := Next_Arg + 2;
            end if;
         end loop;
      end return;
   end Get_Process_Start_Params;

   function Get_Parse_Params (Command_Line : in String; Last : in out Integer) return Parse_Params
   is
      use WisiToken;
   begin
      return Result : Parse_Params do

         Result.Post_Parse_Action  := Wisi.Post_Parse_Action_Type'Val (Get_Integer (Command_Line, Last));
         Result.Source_File_Name   := +Get_String (Command_Line, Last);
         Result.Line_Count         := WisiToken.Line_Number_Type (Get_Integer (Command_Line, Last));
         Result.Debug_Mode         := 1 = Get_Integer (Command_Line, Last);
         Result.Parse_Verbosity    := Get_Integer (Command_Line, Last);
         Result.McKenzie_Verbosity := Get_Integer (Command_Line, Last);
         Result.Action_Verbosity   := Get_Integer (Command_Line, Last);
         Result.McKenzie_Disable   := Get_Integer (Command_Line, Last);
         Result.Task_Count         := Get_Integer (Command_Line, Last);
         Result.Cost_Limit         := Get_Integer (Command_Line, Last);
         Result.Check_Limit        := Get_Integer (Command_Line, Last);
         Result.Enqueue_Limit      := Get_Integer (Command_Line, Last);
         Result.Byte_Count         := Get_Integer (Command_Line, Last);
      end return;
   end Get_Parse_Params;

end Emacs_Wisi_Common_Parse;
