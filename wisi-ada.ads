--  Abstract :
--
--  Ada implementation of:
--
--  [1] ada-wisi-elisp-parse.el
--  [2] ada-indent-user-options.el
--
--  Copyright (C) 2017, 2018 Free Software Foundation, Inc.
--
--  This library is free software;  you can redistribute it and/or modify it
--  under terms of the  GNU General Public License  as published by the Free
--  Software  Foundation;  either version 3,  or (at your  option) any later
--  version. This library is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN-
--  TABILITY or FITNESS FOR A PARTICULAR PURPOSE.

--  As a special exception under Section 7 of GPL version 3, you are granted
--  additional permissions described in the GCC Runtime Library Exception,
--  version 3.1, as published by the Free Software Foundation.

pragma License (Modified_GPL);

package Wisi.Ada is

   --  Indent parameters from [2]
   Ada_Indent                 : Integer := 3;
   Ada_Indent_Broken          : Integer := 2;
   Ada_Indent_Comment_Col_0   : Boolean := False;
   Ada_Indent_Comment_GNAT    : Boolean := False;
   Ada_Indent_Label           : Integer := -3;
   Ada_Indent_Record_Rel_Type : Integer := 3;
   Ada_Indent_Renames         : Integer := 2;
   Ada_Indent_Return          : Integer := 0;
   Ada_Indent_Use             : Integer := 2;
   Ada_Indent_When            : Integer := 3;
   Ada_Indent_With            : Integer := 2;
   Ada_Indent_Hanging_Rel_Exp : Boolean := False;

   --  Other parameters
   End_Names_Optional : Boolean := False;

   type Parse_Data_Type is new Wisi.Parse_Data_Type with null record;

   overriding
   procedure Initialize
     (Data              : in out Parse_Data_Type;
      Descriptor        : access constant WisiToken.Descriptor;
      Source_File_Name  : in     String;
      Post_Parse_Action : in     Post_Parse_Action_Type;
      Line_Count        : in     WisiToken.Line_Number_Type;
      Params            : in     String);
   --  Call Wisi_Runtime.Initialize, then:
   --
   --  If Params /= "", set all language-specific parameters from Params,
   --  in declaration order; otherwise keep default values. Boolean is
   --  represented by 0 | 1. Parameter values are space delimited.
   --
   --  Also do any other initialization that Data needs.

   overriding
   function Indent_Hanging_1
     (Data              : in out Parse_Data_Type;
      Tree              : in     WisiToken.Syntax_Trees.Tree;
      Tokens            : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array;
      Tree_Indenting    : in     WisiToken.Syntax_Trees.Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Delta_1           : in     Simple_Indent_Param;
      Delta_2           : in     Simple_Indent_Param;
      Option            : in     Boolean;
      Accumulate        : in     Boolean)
     return Delta_Type;
   --  [1] ada-wisi-elisp-parse--indent-hanging

   ----------
   --  The following are declared in ada.wy %elisp_indent, and must match
   --  Language_Indent_Function.

   function Ada_Indent_Aggregate
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     WisiToken.Syntax_Trees.Tree;
      Tokens            : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array;
      Tree_Indenting    : in     WisiToken.Syntax_Trees.Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type;
   --  [1] ada-indent-aggregate

   function Ada_Indent_Renames_0
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     WisiToken.Syntax_Trees.Tree;
      Tokens            : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array;
      Tree_Indenting    : in     WisiToken.Syntax_Trees.Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type;
   --  [1] ada-indent-renames

   function Ada_Indent_Return_0
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     WisiToken.Syntax_Trees.Tree;
      Tokens            : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array;
      Tree_Indenting    : in     WisiToken.Syntax_Trees.Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type;
   --  [1] ada-indent-return

   function Ada_Indent_Record_0
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     WisiToken.Syntax_Trees.Tree;
      Tokens            : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array;
      Tree_Indenting    : in     WisiToken.Syntax_Trees.Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type;
   --  [1] ada-indent-record

   function Ada_Indent_Record_1
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     WisiToken.Syntax_Trees.Tree;
      Tokens            : in     WisiToken.Syntax_Trees.Valid_Node_Index_Array;
      Tree_Indenting    : in     WisiToken.Syntax_Trees.Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type;
   --  [1] ada-indent-record*

end Wisi.Ada;
