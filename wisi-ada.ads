--  Abstract :
--
--  Ada language specific indent options and functions
--
--  [2] ada-indent-user-options.el
--
--  Copyright (C) 2017 - 2023 Free Software Foundation, Inc.
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

   Language_Protocol_Version : constant String := "5";
   --  Defines the data passed between elisp and Ada.
   --
   --  This value must match ada-mode.el
   --  ada-wisi-language-protocol-version.
   --
   --  Only changes once per ada-mode release. Increment as soon as
   --  required, record new version in NEWS.

   --  Indent parameters from [2]
   Ada_Indent_Default : constant Integer := 3;
   Ada_Indent         : Integer          := Ada_Indent_Default;

   Ada_Indent_Broken_Default : constant Integer := 2;
   Ada_Indent_Broken         : Integer          := Ada_Indent_Broken_Default;

   Ada_Indent_Comment_Col_0_Default : constant Boolean := False;
   Ada_Indent_Comment_Col_0         : Boolean          := Ada_Indent_Comment_Col_0_Default;

   Ada_Indent_Comment_GNAT_Default : constant Boolean := False;
   Ada_Indent_Comment_GNAT         : Boolean          := Ada_Indent_Comment_GNAT_Default;

   Ada_Indent_Label_Default : constant Integer := -3;
   Ada_Indent_Label         : Integer          := Ada_Indent_Label_Default;

   Ada_Indent_Record_Rel_Type_Default : constant Integer := 3;
   Ada_Indent_Record_Rel_Type         : Integer          := Ada_Indent_Record_Rel_Type_Default;

   Ada_Indent_Renames_Default : constant Integer := 2;
   Ada_Indent_Renames         : Integer          := Ada_Indent_Renames_Default;

   Ada_Indent_Return_Default : constant Integer := 0;
   Ada_Indent_Return         : Integer          := Ada_Indent_Return_Default;

   Ada_Indent_Use_Default : constant Integer := 2;
   Ada_Indent_Use         : Integer          := Ada_Indent_Use_Default;

   Ada_Indent_When_Default : constant Integer := 3;
   Ada_Indent_When         : Integer          := Ada_Indent_When_Default;

   Ada_Indent_With_Default : constant Integer := 2;
   Ada_Indent_With         : Integer          := Ada_Indent_With_Default;

   --  ada-indent-after-trailing-comment is implemented in elisp

   Ada_Indent_Subprogram_Is_Default : constant Integer := 2;
   Ada_Indent_Subprogram_Is         : Integer          := Ada_Indent_Subprogram_Is_Default;

   --  Other parameters
   End_Names_Optional_Default : constant Boolean := True;
   End_Names_Optional         : Boolean          := End_Names_Optional_Default;

   type Parse_Data_Type is new Wisi.Parse_Data_Type with null record;

   overriding
   procedure Initialize (Data : in out Parse_Data_Type);

   overriding
   procedure Parse_Language_Params
     (Data   : in out Parse_Data_Type;
      Params : in     String);

   overriding
   function Insert_After
     (User_Data           : in out Parse_Data_Type;
      Tree                : in     WisiToken.Syntax_Trees.Tree'Class;
      Insert_Token        : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Insert_Before_Token : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Comment_Present     : in     Boolean;
      Blank_Line_Present  : in     Boolean)
     return WisiToken.Insert_Location;

   --  Must match "ada-refactor-*" in ada-core.el
   type Refactor_Label is
     (Method_Object_To_Object_Method, -- 0
      Object_Method_To_Method_Object, -- 1
      Element_Object_To_Object_Index, -- 2
      Object_Index_To_Element_Object, -- 3
      Format_Parameter_List);         -- 4

   overriding
   function Refactor_Parse  (Data : in Parse_Data_Type; Item : in String) return Refactor_Action
   is (Refactor_Action (Refactor_Label'Pos (Refactor_Label'Value (Item))));

   overriding
   procedure Refactor_Help (Data : in Parse_Data_Type);

   overriding
   procedure Refactor
     (Data            : in out Parse_Data_Type;
      Tree            : in out WisiToken.Syntax_Trees.Tree;
      Action          : in     Refactor_Action;
      Edit_Begin_Char : in     WisiToken.Buffer_Pos);

   overriding
   function Get_Token_IDs
     (User_Data    : in     Parse_Data_Type;
      Command_Line : in     String;
      Last         : in out Integer)
     return WisiToken.Token_ID_Arrays.Vector;

   ----------
   --  The following are declared in ada.wy %elisp_indent, and must match
   --  Wisi.Language_Indent_Function.

   function Ada_Indent_Aggregate
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     WisiToken.Syntax_Trees.Tree;
      Nonterm           : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Token   : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type;
   --  ada-indent-aggregate
   --  Args: none

   function Ada_Indent_Aspect
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     WisiToken.Syntax_Trees.Tree;
      Nonterm           : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Token   : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Delta_Type;
   --  ada-indent-aspect
   --  Args: none

   function Ada_Indent_Renames_0
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     WisiToken.Syntax_Trees.Tree;
      Nonterm           : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Token   : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type;
   --  ada-indent-renames
   --  Args: subprogram_token_index

   function Ada_Indent_Return_0
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     WisiToken.Syntax_Trees.Tree;
      Nonterm           : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Token   : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type;
   --  ada-indent-return
   --  Args: formal_part_token_index, offset

   function Ada_Indent_Record_0
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     WisiToken.Syntax_Trees.Tree;
      Nonterm           : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Token   : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type;
   --  ada-indent-record
   --  Args: anchor_token_index, record_token_index, offset

   function Ada_Indent_Record_1
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     WisiToken.Syntax_Trees.Tree;
      Nonterm           : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Token   : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type;
   --  ada-indent-record*
   --  Args: anchor_token_ID, record_token_index, offset

end Wisi.Ada;
