--  Abstract :
--
--  Common utilities for Gen_Emacs_Wisi_*_Parse
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

with Ada.Strings.Unbounded;
with System;
with Wisi;
with WisiToken;
package Emacs_Wisi_Common_Parse is

   Protocol_Version : constant String := "1";
   Version          : constant String := "1.0";

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
      Post_Parse_Action  : Wisi.Post_Parse_Action_Type;
      Source_File_Name   : Ada.Strings.Unbounded.Unbounded_String;
      Line_Count         : WisiToken.Line_Number_Type;
      Debug_Mode         : Boolean;
      Parse_Verbosity    : Integer;
      McKenzie_Verbosity : Integer;
      Action_Verbosity   : Integer;
      McKenzie_Disable   : Integer;
      Task_Count         : Integer;
      Cost_Limit         : Integer;
      Check_Limit        : Integer;
      Enqueue_Limit      : Integer;
      Byte_Count         : Integer;
   end record;

   function Get_Parse_Params (Command_Line : in String; Last : in out Integer) return Parse_Params;

end Emacs_Wisi_Common_Parse;
