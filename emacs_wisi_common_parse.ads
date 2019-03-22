--  Abstract :
--
--  Common utilities for Gen_Emacs_Wisi_*_Parse
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

with Ada.Strings.Unbounded;
with System;
with Wisi;
with WisiToken.Parse.LR.Parser;
package Emacs_Wisi_Common_Parse is

   Protocol_Version : constant String := "2";
   Version          : constant String := "2.0";

   Prompt : constant String := ";;> ";

   Protocol_Error : exception;
   Finish         : exception;

   procedure Usage (Name : in String);

   procedure Read_Input (A : System.Address; N : Integer);

   function Get_Command_Length return Integer;

   function Get_String
     (Source : in     String;
      Last   : in out Integer)
     return String;

   function Get_Integer
     (Source : in     String;
      Last   : in out Integer)
     return Integer;

   type Process_Start_Params is record
      Recover_Log_File_Name : Ada.Strings.Unbounded.Unbounded_String;
      --  log enabled if non-empty.
   end record;

   function Get_Process_Start_Params return Process_Start_Params;
   --  Get from Ada.Command_Line. Handles --help by outputing help,
   --  raising Finish.

   type Parse_Params is record
      Post_Parse_Action : Wisi.Post_Parse_Action_Type;
      Source_File_Name  : Ada.Strings.Unbounded.Unbounded_String;

      Begin_Byte_Pos : Integer;
      --  Source file byte position of first char sent; start parse here.

      End_Byte_Pos : Integer;
      --  Byte position of last char sent.

      Goal_Byte_Pos : Integer;
      --  Byte position of end of desired parse region; terminate parse at
      --  or after here.

      Begin_Char_Pos : WisiToken.Buffer_Pos;
      --  Char position of first char sent.

      Begin_Line : WisiToken.Line_Number_Type;
      End_Line   : WisiToken.Line_Number_Type;
      --  Line number of line containing Begin_Byte_Pos, End_Byte_Pos

      Begin_Indent : Integer;
      --  Indentation of Line_Begin

      Partial_Parse_Active : Boolean;
      Debug_Mode           : Boolean;
      Parse_Verbosity      : Integer;
      McKenzie_Verbosity   : Integer;
      Action_Verbosity     : Integer;
      McKenzie_Disable     : Integer;
      Task_Count           : Integer;
      Cost_Limit           : Integer;
      Check_Limit          : Integer;
      Enqueue_Limit        : Integer;
      Byte_Count           : Integer;
      --  Count of bytes of source file sent.
   end record;

   function Get_Parse_Params (Command_Line : in String; Last : in out Integer) return Parse_Params;

   procedure Parse_Stream
     (Name                 : in     String;
      Partial_Parse_Active : in out Boolean;
      Params               : in     Process_Start_Params;
      Parser               : in out WisiToken.Parse.LR.Parser.Parser;
      Parse_Data           : in out Wisi.Parse_Data_Type'Class;
      Descriptor           : in     WisiToken.Descriptor);

end Emacs_Wisi_Common_Parse;
