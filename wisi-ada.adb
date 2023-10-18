--  Abstract :
--
--  see spec.
--
--  Copyright (C) 2017 - 2023 Free Software Foundation, Inc.
--
--  This library is free software;  you can redistribute it and/or modify it
--  under terms of the  GNU General Public License  as published by the Free
--  Software  Foundation;  either version 3,  or (at your  option) any later
--  version. This library is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN-
--  TABILITY or FITNESS FOR A PARTICULAR PURPOSE.

pragma License (GPL);

with Ada.Exceptions;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Ada_Annex_P_Process_LR1_Actions; --  token_enum_id
with GNAT.Traceback.Symbolic;
package body Wisi.Ada is
   use WisiToken;

   ----------
   --  body local subprograms

   function Indent_Record
     (Data                   : in out Parse_Data_Type;
      Tree                   : in     Syntax_Trees.Tree;
      Controlling_Token_Line : in     Line_Number_Type;
      Anchor_Token           : in     Syntax_Trees.Valid_Node_Access;
      Record_Token           : in     Syntax_Trees.Valid_Node_Access;
      Indenting_Token        : in     Syntax_Trees.Valid_Node_Access;
      Indenting_Comment      : in     Boolean;
      Offset                 : in     Integer)
     return Wisi.Delta_Type
   is
      use Ada_Annex_P_Process_LR1_Actions;
   begin
      if not Indenting_Comment and Tree.ID (Indenting_Token) = +RECORD_ID then
         --  Indenting 'record'
         return Indent_Anchored_2
           (Data, Tree, Anchor_Token, Indenting_Token, Indenting_Comment, Ada_Indent_Record_Rel_Type);

      elsif Indenting_Comment and Tree.ID (Indenting_Token) = +WITH_ID then
         --  comment before 'record'. test/ada_mode-nominal-child.ads Child_Type_1
         return Indent_Anchored_2
           (Data, Tree, Anchor_Token, Indenting_Token, Indenting_Comment, Ada_Indent_Record_Rel_Type);

      elsif Indenting_Comment and Tree.ID (Indenting_Token) = +IS_ID then
         --  comment after 'is'
         if Tree.ID (Record_Token) = +RECORD_ID then
            --  before 'record'. test/ada_mode-nominal.ads Record_Type_1
            return Indent_Anchored_2
              (Data, Tree, Anchor_Token, Indenting_Token, Indenting_Comment, Ada_Indent_Record_Rel_Type);
         else
            --  not before 'record'. test/ada_mode-nominal-child.ads Child_Type_1
            return (Simple, (Int, Controlling_Token_Line, Offset));
         end if;

      else
         --  Indenting comment after 'record', other comment, component or 'end'
         --
         --  Ensure line containing 'record' is anchored to Anchor_Token.
         if Data.Indents (Tree.Line_Region (Record_Token, Trailing_Non_Grammar => True).First).Label /= Anchored then
            if Tree.Line_Region (Anchor_Token, Trailing_Non_Grammar => True).First /=
              Tree.Line_Region (Record_Token, Trailing_Non_Grammar => True).First
            then
               --  We don't pass Indenting_Comment here, because 'record' is code.
               Indent_Token_1
                 (Data,
                  Tree,
                  Line_Region          => Tree.Line_Region (Record_Token, Trailing_Non_Grammar => False),
                  Delta_Indent         => Indent_Anchored_2
                    (Data, Tree, Anchor_Token, Record_Token,
                     Indenting_Comment => False,
                     Offset            => Ada_Indent_Record_Rel_Type),
                  Indenting_Comment    => None);
            end if;
         end if;

         return Indent_Anchored_2
           (Data, Tree, Anchor_Token, Indenting_Token, Indenting_Comment, Current_Indent_Offset
              (Tree, Anchor_Token,
               (if Tree.Line_Region (Anchor_Token, Trailing_Non_Grammar => True).First =
                  Tree.Line_Region (Record_Token, Trailing_Non_Grammar => True).First
                then Offset
                else Offset + Ada_Indent_Record_Rel_Type)));
      end if;
   end Indent_Record;

   ----------
   --  Refactor body subprograms

   function Find_ID_Containing
     (Tree            : in WisiToken.Syntax_Trees.Tree;
      IDs             : in Token_ID_Array;
      Edit_Begin_Char : in WisiToken.Buffer_Pos)
     return WisiToken.Syntax_Trees.Node_Access
   is
      use Syntax_Trees;
      Terminal : constant Node_Access := Tree.Find_Char_Pos
        (Edit_Begin_Char, After => True, Trailing_Non_Grammar => True);
   begin
      return Tree.Find_Ancestor (Terminal, IDs);
   end Find_ID_Containing;

   procedure Unrecognized
     (Expecting : in     String;
      Tree      : in     WisiToken.Syntax_Trees.Tree;
      Data      : in out Parse_Data_Type;
      Found     : in     WisiToken.Syntax_Trees.Valid_Node_Access)
   with No_Return
   is begin
      raise SAL.Parameter_Error with "expecting '" & Expecting & "'; found " &
        Tree.Image (Found, Node_Numbers => True) & " '" & Elisp_Escape_Quotes (Data.Get_Text (Tree, Found)) & "'";
   end Unrecognized;

   procedure No_Call_Found (Edit_Begin_Char : in WisiToken.Buffer_Pos)
   is begin
      raise SAL.Parameter_Error with "no subprogram call found at byte_pos" & Edit_Begin_Char'Image;
   end No_Call_Found;

   procedure Method_Object_To_Object_Method
     (Tree            : in     WisiToken.Syntax_Trees.Tree;
      Data            : in out Parse_Data_Type;
      Edit_Begin_Char : in     WisiToken.Buffer_Pos)
   --  Convert a subprogram call from Prefix.Method (Object, ...) to
   --  Object.Method (...). Edit_Begin_Char is in Prefix.Method.
   is
      use Ada_Annex_P_Process_LR1_Actions;
      use Standard.Ada.Strings.Unbounded;
      use Standard.Ada.Text_IO;
      use WisiToken.Syntax_Trees;

      Call : constant Node_Access := Find_ID_Containing (Tree, (1 => +function_call_ID), Edit_Begin_Char);

      Edit_End              : WisiToken.Buffer_Pos;
      Actual_Parameter_Part : Node_Access;
      Association_List      : Node_Access;
      Method                : Node_Access;
   begin
      if Call = Invalid_Node_Access then
         --  Most likely the edit point is wrong.
         No_Call_Found (Edit_Begin_Char);
      end if;

      if Trace_Action > Detail then
         Tree.Lexer.Trace.Put_Line
           ("refactoring node " & Tree.Image (Call, Node_Numbers => True) & " '" & Data.Get_Text (Tree, Call) & "'");
      end if;

      Actual_Parameter_Part := Tree.Child (Call, 2);
      pragma Assert (Tree.ID (Actual_Parameter_Part) = +actual_parameter_part_ID);

      Association_List := Tree.Child (Actual_Parameter_Part, 2);
      pragma Assert (Tree.ID (Association_List) = +parameter_association_list_ID);

      Edit_End := Tree.Byte_Region (Call, Trailing_Non_Grammar => False).Last;

      Method := Tree.Child (Tree.Child (Call, 1), 1);

      case To_Token_Enum (Tree.ID (Method)) is
      when selected_component_ID =>
         Method := Tree.Child (Method, 3);
         pragma Assert (Tree.ID (Method) = +selector_name_ID);

         Method := Tree.Child (Method, 1);

      when attribute_reference_ID =>
         case To_Token_Enum (Tree.ID (Tree.Child (Method, 1))) is
         when name_ID =>
            Method := Tree.Child (Method, 3);
            pragma Assert (Tree.ID (Method) = +attribute_designator_ID);

            Method := Tree.Child (Method, 1);

         when reduction_attribute_reference_ID =>
            Unrecognized ("subprogram call", Tree, Data, Method);

         when others =>
            raise SAL.Programmer_Error with "code does not match grammar";
         end case;

      when qualified_expression_ID =>
         raise SAL.Not_Implemented; -- need use case

      when IDENTIFIER_ID =>
         null;

      when others =>
         Unrecognized ("supported token", Tree, Data, Method);
      end case;

      pragma Assert (To_Token_Enum (Tree.ID (Method)) in IDENTIFIER_ID | STRING_LITERAL_ID);

      declare
         Object : constant Node_Access := Tree.Find_Descendant (Association_List, +expression_ID);
         Result : Unbounded_String;
      begin
         if Object = Invalid_Node_Access then
            Unrecognized ("expression", Tree, Data, Association_List);
         end if;

         --  Build remaining arg list in Result.
         loop
            if Tree.RHS_Index (Association_List) = 1 then
               Result := Get_Text (Data, Tree, Tree.Child (Association_List, 3)) &
                 (if Length (Result) = 0 then "" else ", ") &
                 Result;
               Association_List := Tree.Child (Association_List, 1);
            else
               --  The remaining element in Association_List is the first one, which is Object.
               if Length (Result) > 0 then
                  Result := " (" & Result & ")";
               end if;
               exit;
            end if;
         end loop;
         Result := (Get_Text (Data, Tree, Object) & "." & Get_Text (Data, Tree, Method)) & Result;
         Put_Line ("[" & Edit_Action_Code & Edit_Begin_Char'Image & Edit_End'Image & " """ &
                     Elisp_Escape_Quotes (To_String (Result)) & """]");
      end;
   end Method_Object_To_Object_Method;

   procedure Object_Method_To_Method_Object
     (Tree       : in     WisiToken.Syntax_Trees.Tree;
      Data       : in out Parse_Data_Type;
      Edit_Begin_Char : in     WisiToken.Buffer_Pos)
   --  Convert a subprogram call from Object.Method (...) to
   --  Method (Object, ...). Edit_Begin_Char is in Object.Method.
   is
      use Ada_Annex_P_Process_LR1_Actions;
      use Standard.Ada.Strings.Unbounded;
      use WisiToken.Syntax_Trees;

      --  ada_mode-refactor_object_method_to_method_object.adb
      Call          : Node_Access := Find_ID_Containing
        (Tree, (+primary_ID, +procedure_call_statement_ID), Edit_Begin_Char);
      Edit_End      : WisiToken.Buffer_Pos;
      Object_Method : Node_Access;
      Args          : Node_Access := Invalid_Node_Access;
      Method        : Unbounded_String;
      Object        : Unbounded_String;
      Result        : Unbounded_String;
   begin
      if Call = Invalid_Node_Access then
         --  Most likely the edit point is wrong.
         No_Call_Found  (Edit_Begin_Char);
      end if;

      if Trace_Action > Detail then
         Tree.Lexer.Trace.Put_Line
           ("refactoring node " & Tree.Image (Call, Node_Numbers => True) & " '" & Data.Get_Text (Tree, Call) & "'");
      end if;

      Call := Tree.Child (Call, 1);
      pragma Assert (Tree.ID (Call) = +name_ID);

      if Tree.ID (Tree.Child (Call, 1)) = +attribute_reference_ID then
         --  Code looks like: Container.Length'Old. We only want to edit
         --  'Container.Length', keeping the trailing 'Old.
         Call := Tree.Child (Tree.Child (Call, 1), 1);
      end if;

      Edit_End      := Tree.Byte_Region (Call, Trailing_Non_Grammar => False).Last;
      Object_Method := Tree.Child (Call, 1);
      loop
         case To_Token_Enum (Tree.ID (Object_Method)) is
         when function_call_ID =>
            --  Object_Method looks like:
            --  Object.Method (Args)
            --  test/ada_mode-refactor_object_method_to_method_object.adb
            Args := Tree.Child (Tree.Child (Object_Method, 2), 2);
            pragma Assert (Tree.ID (Args) = +parameter_association_list_ID);

            Object_Method := Tree.Child (Object_Method, 1);

         when name_ID =>
            Object_Method := Tree.Child (Object_Method, 1);

         when selected_component_ID =>
            Object := +Get_Text (Data, Tree, Tree.Child (Object_Method, 1));
            Method := +Get_Text (Data, Tree, Tree.Child (Object_Method, 3));
            exit;

         when others =>
            Unrecognized ("supported token", Tree, Data, Object_Method);
         end case;
      end loop;

      Result := Method & " (" & Object;
      if Args /= Invalid_Node_Access then
         Result := Result & ", " & Get_Text (Data, Tree, Args);
      end if;
      Result := Result & ")";
      Standard.Ada.Text_IO.Put_Line
        ("[" & Edit_Action_Code & Edit_Begin_Char'Image & Edit_End'Image & " """ &
           Elisp_Escape_Quotes (To_String (Result)) & """]");
   end Object_Method_To_Method_Object;

   procedure Element_Object_To_Object_Index
     (Tree       : in     WisiToken.Syntax_Trees.Tree;
      Data       : in out Parse_Data_Type;
      Edit_Begin_Char : in     WisiToken.Buffer_Pos)
   --  Convert a function call from Prefix.Element (Object, Index) to
   --  Object (Index). Edit_Begin_Char is in Prefix.Element.
   is
      use Ada_Annex_P_Process_LR1_Actions;
      use Standard.Ada.Text_IO;
      use WisiToken.Syntax_Trees;

      Call             : constant Node_Access := Find_ID_Containing (Tree, (1 => +function_call_ID), Edit_Begin_Char);
      Edit_End         : WisiToken.Buffer_Pos;
      Temp             : Node_Access;
      Association_List : Node_Access;
      Object           : Node_Access;
      Index            : Node_Access;
   begin
      if Call = Invalid_Node_Access then
         --  Most likely the edit point is wrong.
         No_Call_Found (Edit_Begin_Char);
      end if;

      if Trace_Action > Detail then
         Tree.Lexer.Trace.Put_Line
           ("refactoring node " & Tree.Image (Call, Node_Numbers => True) & " '" & Data.Get_Text (Tree, Call) & "'");
      end if;

      Association_List := Tree.Child (Tree.Child (Call, 2), 2);
      pragma Assert (Tree.ID (Association_List) = +parameter_association_list_ID);

      Edit_End := Tree.Byte_Region (Call, Trailing_Non_Grammar => False).Last;

      if Tree.RHS_Index (Association_List) /= 1 then
         Unrecognized ("two args", Tree, Data, Association_List);
      end if;

      Temp := Tree.Find_Descendant (Association_List, +expression_ID);
      if Temp = Invalid_Node_Access then
         Unrecognized ("expression", Tree, Data, Association_List);
      else
         Object := Temp;
      end if;

      Temp := Tree.Find_Descendant (Tree.Child (Association_List, 3), +expression_ID);
      if Temp = Invalid_Node_Access then
         Unrecognized ("expression", Tree, Data, Association_List);
      else
         Index := Temp;
      end if;

      Put_Line
        ("[" & Edit_Action_Code & Edit_Begin_Char'Image & Edit_End'Image & " """ &
           Elisp_Escape_Quotes (Get_Text (Data, Tree, Object) & " (" & Get_Text (Data, Tree, Index) & ")") &
           """]");
   end Element_Object_To_Object_Index;

   procedure Object_Index_To_Element_Object
     (Tree       : in     WisiToken.Syntax_Trees.Tree;
      Data       : in out Parse_Data_Type;
      Edit_Begin_Char : in     WisiToken.Buffer_Pos)
   --  Convert a primary expression from Object (Index) to Element
   --  (Object, Index). Edit_Begin_Char is in Object. The expression
   --  parses as a subprogram call.
   is
      use Ada_Annex_P_Process_LR1_Actions;
      use Standard.Ada.Text_IO;
      use WisiToken.Syntax_Trees;

      Call             : constant Node_Access := Find_ID_Containing (Tree, (1 => +function_call_ID), Edit_Begin_Char);
      Edit_End         : WisiToken.Buffer_Pos;
      Temp             : Node_Access;
      Association_List : Node_Access;
      Object           : Node_Access;
      Index            : Node_Access;
   begin
      if Call = Invalid_Node_Access then
         --  Most likely the edit point is wrong.
         No_Call_Found (Edit_Begin_Char);
      end if;

      if Trace_Action > Detail then
         Tree.Lexer.Trace.Put_Line
           ("refactoring node " & Tree.Image (Call, Node_Numbers => True) & " '" & Data.Get_Text (Tree, Call) & "'");
      end if;

      Object := Tree.Child (Call, 1);
      pragma Assert (Tree.ID (Object) = +name_ID);

      Association_List := Tree.Child (Tree.Child (Call, 2), 2);
      pragma Assert (Tree.ID (Association_List) = +parameter_association_list_ID);

      Edit_End := Tree.Byte_Region (Call, Trailing_Non_Grammar => False).Last;

      if Tree.RHS_Index (Association_List) /= 0 then
         Unrecognized ("one arg", Tree, Data, Association_List);
      end if;

      Temp := Tree.Find_Descendant (Tree.Child (Association_List, 1), +expression_ID);
      if Temp = Invalid_Node_Access then
         Unrecognized ("expression", Tree, Data, Association_List);
      else
         Index := Temp;
      end if;

      Put_Line
        ("[" & Edit_Action_Code & Edit_Begin_Char'Image & Edit_End'Image & " """ &
           Elisp_Escape_Quotes
             ("Element (" & Get_Text (Data, Tree, Object) & ", " & Get_Text (Data, Tree, Index) & ")") &
           """]");
   end Object_Index_To_Element_Object;

   procedure Format_Parameter_List
     (Tree            : in out WisiToken.Syntax_Trees.Tree;
      Edit_Begin_Char : in     WisiToken.Buffer_Pos)
   is separate;
   --  Tree contains a subprogram declaration or body; Edit_Begin_Char is
   --  the character position at the start of the parameter list. Format
   --  the parameter list.
   --
   --  Handle virtual tokens as much as possible; at least closing paren.

   ----------
   --  Public subprograms, declaration order

   overriding
   procedure Initialize (Data  : in out Parse_Data_Type)
   is
      use all type Ada_Annex_P_Process_LR1_Actions.Token_Enum_ID;
   begin
      Data.First_Comment_ID := +COMMENT_ID;
      Data.Last_Comment_ID  := WisiToken.Invalid_Token_ID;
      Data.Left_Paren_ID    := +LEFT_PAREN_ID;
      Data.Right_Paren_ID   := +RIGHT_PAREN_ID;

      --  All nonterms in compilation_unit, basic_declarative_item for
      --  package specs, wisitoken_accept for point in leading/trailing
      --  comments.
      Data.Statement_IDs.Append (+compilation_unit_ID);
      Data.Statement_IDs.Append (+with_clause_ID);
      Data.Statement_IDs.Append (+declarative_item_ID);
      Data.Statement_IDs.Append (+statement_ID);
      Data.Statement_IDs.Append (+subunit_ID);
      Data.Statement_IDs.Append (+basic_declarative_item_ID);
      Data.Statement_IDs.Append (+wisitoken_accept_ID);
      --  not entry_declaration; only needed with partial parse
   end Initialize;

   overriding
   procedure Parse_Language_Params
     (Data   : in out Parse_Data_Type;
      Params : in     String)
   is
      use Standard.Ada.Strings.Fixed;
      First : Integer := Params'First;
      Last  : Integer := Index (Params, " ");
   begin
      if Params /= "" then
         Ada_Indent := Integer'Value (Params (First .. Last - 1));

         First := Last + 1;
         Last := Index (Params, " ", First);
         Ada_Indent_Broken := Integer'Value (Params (First .. Last - 1));

         First := Last + 1;
         Last := First + 1;
         Ada_Indent_Comment_Col_0 := Params (First) = '1';

         First := Last + 1;
         Last := First + 1;
         Ada_Indent_Comment_GNAT := Params (First) = '1';

         First := Last + 1;
         Last := Index (Params, " ", First);
         Ada_Indent_Label := Integer'Value (Params (First .. Last - 1));

         First := Last + 1;
         Last := Index (Params, " ", First);
         Ada_Indent_Record_Rel_Type := Integer'Value (Params (First .. Last - 1));

         First := Last + 1;
         Last := Index (Params, " ", First);
         Ada_Indent_Renames := Integer'Value (Params (First .. Last - 1));

         First := Last + 1;
         Last := Index (Params, " ", First);
         Ada_Indent_Return := Integer'Value (Params (First .. Last - 1));

         First := Last + 1;
         Last := Index (Params, " ", First);
         Ada_Indent_Use := Integer'Value (Params (First .. Last - 1));

         First := Last + 1;
         Last := Index (Params, " ", First);
         Ada_Indent_When := Integer'Value (Params (First .. Last - 1));

         First := Last + 1;
         Last := Index (Params, " ", First);
         Ada_Indent_With := Integer'Value (Params (First .. Last - 1));

         First := Last + 1;
         Last := Index (Params, " ", First);
         Ada_Indent_Subprogram_Is := Integer'Value (Params (First .. Last - 1));

         First := Last + 1;
         Last := First + 1;
         End_Names_Optional := Params (First) = '1';
      else
         Ada_Indent                 := Ada_Indent_Default;
         Ada_Indent_Broken          := Ada_Indent_Broken_Default;
         Ada_Indent_Comment_Col_0   := Ada_Indent_Comment_Col_0_Default;
         Ada_Indent_Comment_GNAT    := Ada_Indent_Comment_GNAT_Default;
         Ada_Indent_Label           := Ada_Indent_Label_Default;
         Ada_Indent_Record_Rel_Type := Ada_Indent_Record_Rel_Type_Default;
         Ada_Indent_Renames         := Ada_Indent_Renames_Default;
         Ada_Indent_Return          := Ada_Indent_Return_Default;
         Ada_Indent_Use             := Ada_Indent_Use_Default;
         Ada_Indent_When            := Ada_Indent_When_Default;
         Ada_Indent_With            := Ada_Indent_With_Default;
         Ada_Indent_Subprogram_Is   := Ada_Indent_Subprogram_Is_Default;
         End_Names_Optional         := End_Names_Optional_Default;
      end if;

      Data.Indent_Comment_Col_0 := Ada_Indent_Comment_Col_0;
   end Parse_Language_Params;

   overriding
   function Get_Token_IDs
     (User_Data    : in     Parse_Data_Type;
      Command_Line : in     String;
      Last         : in out Integer)
     return WisiToken.Token_ID_Arrays.Vector
   is
      pragma Unreferenced (User_Data);
      use Ada_Annex_P_Process_LR1_Actions;
   begin
      return IDs : WisiToken.Token_ID_Arrays.Vector do
         Wisi.Skip (Command_Line, Last, '(');
         loop
            IDs.Append (+Token_Enum_ID'Value (Wisi.Get_Enum (Command_Line, Last)));
            Wisi.Skip (Command_Line, Last, ' ');
            exit when Command_Line (Last + 1) = ')';
         end loop;
         Last := Last + 1;
      end return;
   end Get_Token_IDs;

   overriding function Insert_After
     (User_Data           : in out Parse_Data_Type;
      Tree                : in     WisiToken.Syntax_Trees.Tree'Class;
      Insert_Token        : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Insert_Before_Token : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Comment_Present     : in     Boolean;
      Blank_Line_Present  : in     Boolean)
     return WisiToken.Insert_Location
   is
      pragma Unreferenced (User_Data);
      use Ada_Annex_P_Process_LR1_Actions;

      Insert_ID        : constant Token_Enum_ID := To_Token_Enum (Tree.ID (Insert_Token));
      Insert_Before_ID : constant Token_Enum_ID := To_Token_Enum (Tree.ID (Insert_Before_Token));

      After_End : constant array (Token_Enum_ID) of Boolean :=
        --  Terminals that appear after 'end', other than ';'.
        (
           CASE_ID |
           DO_ID |
           IDENTIFIER_ID |
           IF_ID |
           LOOP_ID |
           RECORD_ID |
           RETURN_ID |
           SELECT_ID => True,
         others => False);

      After_Comment : constant array (Token_Enum_ID) of Insert_Location :=
        (
         ABORT_ID |
           ACCEPT_ID |
           BEGIN_ID |
           CASE_ID |
           DECLARE_ID |
           DELAY_ID |
           ELSE_ID |
           ELSIF_ID |
           ENTRY_ID |
           EXCEPTION_ID |
           EXIT_ID |
           FOR_ID |
           FUNCTION_ID |
           GENERIC_ID |
           GOTO_ID |
           IF_ID |
           LOOP_ID |
           OVERRIDING_ID |
           PRAGMA_ID |
           PROCEDURE_ID |
           RAISE_ID |
           REQUEUE_ID |
           SELECT_ID |
           TYPE_ID |
           WHILE_ID => After_Prev,
         others => Before_Next);
   begin
      if After_End (Insert_ID) and then -Tree.ID (Tree.Prev_Terminal (Insert_Token)) = END_ID then
         return After_Prev;
      end if;

      case Insert_Before_ID is
      when ELSE_ID | END_ID | IS_ID | WHEN_ID =>
         case Insert_ID is
         when END_ID =>
            --  Ending a block of statements. The desired result depends on what
            --  the user is doing, and what indent is begin computed (if any).
            --
            --  If continuing the block of statements and indenting a blank line,
            --  the 'end' should be placed after the indent line; before_next.
            --
            --  If indenting a block of code, keep the indent of the existing
            --  'end'; between or after_prev.
            --
            --  We don't know why the parse is being done, nor what lines are
            --  being indented; we use the presence of a blank line and comment to
            --  hint at that, and we bias towards continuing a block of
            --  statements, not inserting 'end'.
            --
            --  If there is a blank line followed by comments, we assume that
            --  means we are not adding code on the blank line.
            --
            --  If there is a blank line not followed by comments, we assume that
            --  means we are adding code on the blank line.

            --  Before ELSE_ID:
            --     test/ada_mode-recover_27.adb
            --     first 'else'
            --
            --  Before END_ID:
            --     test/ada_mode-interactive_02 New_Line_2,
            --     actually inserting 'end if;' before 'end case;'
            --     blank line present => assume continuing code for 'if' body
            --     => insert before 'end case;' => before_next.
            --
            --     test/ada_mode-recover_06.adb
            --     actually inserting 'end;'
            --     blank line and comment present; assume extending code for block body
            --     => insert on blank line => between
            --
            --     test/ada_mode-recover_08.adb
            --     no blank line or comment; keep correct indent for existing 'end' => after_prev.
            --
            --     test/ada_mode-recover_17.adb
            --     inserting missing 'end if;', but assume extending code
            --     comment present, no blank line; keep correct indent for existing 'end' => between
            --
            --     test/ada_mode-recover_repair_1.adb
            --     deleted 'end if;', inserting 'end loop;'
            --     comment followed by blank line; between.
            --
            --  Before IS_ID : test/ada_mode-recover_incremental_01.adb insert "Float"
            --     no blank line or comment
            --     'is' should be first. => after_prev
            --
            --  Before WHEN_ID : test/ada_mode-recover_34.adb
            --     completing 'if'; keep existing indent of 'when' => after_prev
            if Comment_Present then
               return Between;
            else
               if Blank_Line_Present then
                  return Before_Next;
               else
                  return After_Prev;
               end if;
            end if;

         when others =>
            --  Before END_ID :
            --     test/ada_mode-recover_10.adb,
            --     test/ada_mode-recover_37.adb,
            --     put trailing 'end' in correct column
            --
            --     test/ada_mode-recover_41.adb
            --     insert on blank line; continue previous code
            if Blank_Line_Present then
               return Between;
            else
               return After_Prev;
            end if;
         end case;

      when RETURN_ID =>
         --  Before RETURN_ID : test/ada_mode-recover_16.adb
         --     There is never code before 'return'. => after_prev
         return After_Prev;

      when others =>
         case Insert_ID is
         when BEGIN_ID | DO_ID | ELSE_ID | GREATER_EQUAL_ID | LOOP_ID | IS_ID | THEN_ID =>
            --  Starting a block of statements
            if Blank_Line_Present then
               --  Assume editing; this and next token should start new line.
               return Between;
            else
               --  Next token should start new line.
               return After_Prev;
            end if;

         when SEMICOLON_ID =>
            --  test/ada_mode-interactive_2.adb A := B \n+C; on blank line: extending code => between | before_next
            --  test/ada_mode-recover_03.adb after 'renames', _13.adb not on blank line: after_prev
            --  test/ada_mode-recover_30.adb before 'if', blank line present: between
            --  test/ada_mode-recover_36.adb after 'function Update\n comments': before_next
            --
            --  test/ada_mode-recover_07.adb after 'loop' on blank line: after_prev | Between,
            if Blank_Line_Present then
               return Between;
            else
               return After_Prev;
            end if;

         when others =>
            if Blank_Line_Present then
               --  Assume editing; continue previous code
               return Before_Next;

            elsif Comment_Present then
               --  Don't continue previous code
               return After_Comment (Insert_ID);

            else
               case Insert_ID is
               when END_ID =>
                  --  test/ada_mode-recover_20.adb,
                  --  test/ada_mode-interactive_2.adb Record_1.
                  return Before_Next;

               when IDENTIFIER_ID | NUMERIC_LITERAL_ID =>
                  --  test/ada_mode-recover_03.adb after 'renames'; completing an expression: true.
                  --  Starting a procedure call or assignment statement: false
                  return
                    (if -Tree.ID (Tree.Prev_Terminal (Insert_Token)) /= SEMICOLON_ID
                     then After_Prev
                     else Before_Next);

               when BEGIN_ID |    -- test/ada_mode-recover_exception_1.adb, test/ada_mode-recover_extra_declare.adb
                 COLON_ID |       -- test/ada_mode-recover_partial_22.adb
                 DECLARE_ID |
                 RIGHT_PAREN_ID | -- test/ada_mode-recover_20.adb
                 THEN_ID          -- test/ada_mode-recover_19
                 =>
                  return After_Prev;

               when others =>
                  return Before_Next;

               end case;
            end if;
         end case;
      end case;
   end Insert_After;

   overriding
   procedure Refactor_Help (Data : in Parse_Data_Type)
   is
      use Standard.Ada.Text_IO;
   begin
      --  Must match "ada-refactor-*" in ada-core.el, Refactor_Label position number
      Put ("0 Method_Object_To_Object_Method");
      Put ("1 Object_Method_To_Method_Object");
      Put ("2 Element_Object_To_Object_Index");
      Put ("3 Object_Index_To_Element_Object");
      Put ("4 Format_Parameter_List         ");
   end Refactor_Help;

   overriding
   procedure Refactor
     (Data            : in out Parse_Data_Type;
      Tree            : in out WisiToken.Syntax_Trees.Tree;
      Action          : in     Refactor_Action;
      Edit_Begin_Char : in     WisiToken.Buffer_Pos)
   is
      Enum_Action : Refactor_Label;
   begin
      begin
         Enum_Action := Refactor_Label'Val (Action);
      exception
      when Constraint_Error =>
         Standard.Ada.Text_IO.Put_Line ("(error ""unrecognized refactor action '" & Action'Image & "'"")");
         return;
      end;

      if Trace_Action > Detail then
         Tree.Lexer.Trace.Put_Line (Tree.Image (Children => True));
      end if;
      case Enum_Action is
      when Method_Object_To_Object_Method =>
         Wisi.Ada.Method_Object_To_Object_Method (Tree, Data, Edit_Begin_Char);
      when Object_Method_To_Method_Object =>
         Wisi.Ada.Object_Method_To_Method_Object (Tree, Data, Edit_Begin_Char);
      when Element_Object_To_Object_Index =>
         Wisi.Ada.Element_Object_To_Object_Index (Tree, Data, Edit_Begin_Char);
      when Object_Index_To_Element_Object =>
         Wisi.Ada.Object_Index_To_Element_Object (Tree, Data, Edit_Begin_Char);
      when Format_Parameter_List =>
         Wisi.Ada.Format_Parameter_List (Tree, Edit_Begin_Char);
      end case;
   exception
   when E : others =>
      if Debug_Mode then
         Tree.Lexer.Trace.Put_Line
           (Standard.Ada.Exceptions.Exception_Name (E) & ": " & Standard.Ada.Exceptions.Exception_Message (E));
         Tree.Lexer.Trace.Put_Line (GNAT.Traceback.Symbolic.Symbolic_Traceback (E));
         Tree.Lexer.Trace.New_Line;
      end if;
      raise;
   end Refactor;

   function Ada_Indent_Aggregate
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Nonterm           : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Token   : in     Syntax_Trees.Valid_Node_Access;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is
      pragma Unreferenced (Nonterm);
      pragma Unreferenced (Data);
      pragma Unreferenced (Indenting_Comment);
      pragma Unreferenced (Args);

      use Ada_Annex_P_Process_LR1_Actions;
      use Syntax_Trees;

      --  In our grammar, 'aggregate' can be an Ada aggregate, or a
      --  parenthesized expression.
      --
      --  We always want an 'aggregate' that begins an expression to be
      --  indented by ada-indent-broken. However, in some places in the
      --  grammar, 'aggregate' is indented by ada-indent. The following
      --  checks for those places, and returns a correction value. The
      --  aggregate may be nested inside a conditional expression, so we
      --  search for 'name' as well; see
      --  test/ada_mode-conditional_expressions-more_1.adb.

      pragma Assert (Tree.ID (Indenting_Token) = +aggregate_ID);

      Expression : constant Node_Access := Tree.Find_Ancestor (Indenting_Token, (+expression_ID, +name_ID));
   begin
      if Expression = Invalid_Node_Access or else
        Tree.Parent (Expression) = Invalid_Node_Access
      then
         return Null_Delta;
      elsif Tree.ID (Tree.Parent (Expression)) in +if_expression_ID | +elsif_expression_item_ID |
        +case_expression_alternative_ID
      then
         --  test/ada_mode-conditional_expressions.adb K; value expression in
         --  if_expression is indented by ada-indent.
         --
         --  test/ada_mode-conditional_expressions.adb M1 nested "(case C";
         --  value expression in case_expression-alternative is indented by
         --  ada-indent. But this aggregate does not start the value expression.
         declare
            List : constant Node_Access := Tree.Find_Ancestor (Indenting_Token, +term_binary_adding_operator_list_ID);
         begin
            if Tree.RHS_Index (List) = 0 then
               --  Aggregate starts expression
               return (Simple, (Int, Invalid_Line_Number, Ada_Indent_Broken - Ada_Indent));
            else
               return Null_Delta;
            end if;
         end;

      else
         return Null_Delta;
      end if;
   end Ada_Indent_Aggregate;

   function Ada_Indent_Aspect
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Nonterm           : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Token   : in     Syntax_Trees.Valid_Node_Access;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Delta_Type
   is
      pragma Unreferenced (Nonterm, Args);

      use Ada_Annex_P_Process_LR1_Actions;

      pragma Assert (Tree.ID (Indenting_Token) = +aspect_definition_ID);

      Indenting    : constant Wisi.Indenting                 := Compute_Indenting (Data, Tree, Indenting_Token);
      Anchor_Token : constant Syntax_Trees.Valid_Node_Access := Tree.Child (Tree.Parent (Indenting_Token), 2);
   begin
      if Tree.Line_Region (Indenting_Token, Trailing_Non_Grammar => True).First = Indenting.Code.First then
         --  aspect_definition starts a line; anchor the aspect_definition to
         --  the line containing '=>' with offset ada_indent_broken.
         return Indent_Anchored_2 (Data, Tree, Anchor_Token, Indenting_Token, Indenting_Comment, Ada_Indent_Broken);
      else
         --  aspect_definition starts on same line as '=>'; anchor the aspect_definition to '=>' with offset 3
         return Indent_Anchored_2
           (Data, Tree, Anchor_Token, Indenting_Token, Indenting_Comment,
            Current_Indent_Offset (Tree, Anchor_Token, 3));
      end if;
   end Ada_Indent_Aspect;

   function Ada_Indent_Renames_0
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Nonterm           : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Token   : in     Syntax_Trees.Valid_Node_Access;
      Indenting_Comment : in     Boolean;
      Args              : in     Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is
      Subp_Node : constant Syntax_Trees.Valid_Node_Access := Tree.Child
        (Nonterm, Positive_Index_Type (Integer'(Args (1))));

      Paren_I : constant Syntax_Trees.Node_Access := Tree.Find_Descendant (Subp_Node, Data.Left_Paren_ID);
   begin
      if Paren_I /= Syntax_Trees.Invalid_Node_Access then
         --  paren is present
         if Ada_Indent_Renames > 0 then
            return Indent_Anchored_2 (Data, Tree, Subp_Node, Indenting_Token, Indenting_Comment, Ada_Indent_Renames);
         else
            return Indent_Anchored_2
              (Data, Tree, Paren_I, Indenting_Token, Indenting_Comment, Current_Indent_Offset
                 (Tree, Paren_I, abs Ada_Indent_Renames));
         end if;
      else
         return Indent_Anchored_2 (Data, Tree, Subp_Node, Indenting_Token, Indenting_Comment, Ada_Indent_Broken);
      end if;
   end Ada_Indent_Renames_0;

   function Ada_Indent_Return_0
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Nonterm           : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Token   : in     Syntax_Trees.Valid_Node_Access;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is
      use all type Ada_Annex_P_Process_LR1_Actions.Token_Enum_ID;
      --  tree.child (Nonterm, Args (1)) = 'formal_part'
      --  Indenting_Token = 'result_profile'
      --  Args (2) = delta (= 0!)
      --
      --  We are indenting 'result_profile' in
      --  'parameter_and_result_profile'. The indent depends on whether the
      --  'formal_part' is present, and the location of 'FUNCTION'.

      Parameter_And_Result_Profile : constant Syntax_Trees.Valid_Node_Access := Tree.Parent (Indenting_Token);

      Indenting : constant Wisi.Indenting := Compute_Indenting (Data, Tree, Indenting_Token);
   begin
      if Tree.Line_Region (Indenting_Token, Trailing_Non_Grammar => True).First = Indenting.Code.First then
         if Ada_Indent_Return <= 0 then
            declare
               Anchor_Token : constant Syntax_Trees.Valid_Node_Access :=
                 Tree.Child (Nonterm, Positive_Index_Type (Integer'(Args (1))));
            begin
               return Indent_Anchored_2
                 (Data, Tree, Anchor_Token, Indenting_Token, Indenting_Comment,
                  Current_Indent_Offset (Tree, Anchor_Token, Args (2) + abs Ada_Indent_Return));
            end;
         else
            declare
               Anchor_Token : constant Syntax_Trees.Valid_Node_Access := Tree.Find_Sibling
                 (Parameter_And_Result_Profile, +FUNCTION_ID);
            begin
               return Indent_Anchored_2
                 (Data, Tree, Anchor_Token, Indenting_Token, Indenting_Comment,
                  Current_Indent_Offset (Tree, Anchor_Token, Args (2) + abs Ada_Indent_Return));
            end;
         end if;

      else
         return Null_Delta;
      end if;
   end Ada_Indent_Return_0;

   function Ada_Indent_Record_0
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Nonterm           : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Token   : in     Syntax_Trees.Valid_Node_Access;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is begin
      return Indent_Record
        (Parse_Data_Type (Data),
         Tree,
         Tree.Line_Region (Nonterm, Trailing_Non_Grammar => True).First,
         Anchor_Token      => Tree.Child (Nonterm, Positive_Index_Type (Integer'(Args (1)))),
         Record_Token      => Tree.Child (Nonterm, Positive_Index_Type (Integer'(Args (2)))),
         Indenting_Token   => Indenting_Token,
         Indenting_Comment => Indenting_Comment,
         Offset            => Args (3));
   end Ada_Indent_Record_0;

   function Ada_Indent_Record_1
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Nonterm           : in     WisiToken.Syntax_Trees.Valid_Node_Access;
      Indenting_Token   : in     Syntax_Trees.Valid_Node_Access;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is
      --  We are indenting a token in record_definition or
      --  record_representation_clause, or a comment before 'record'.
      --
      --  Args (1) is the token ID of the anchor. If record_definition, this
      --  is TYPE; it appears as a direct child in an ancestor
      --  full_type_declaration. If record_representation_clause, args (1)
      --  is FOR, child of record_representation_clause.

      use Ada_Annex_P_Process_LR1_Actions;

      Anchor : constant Token_ID := Token_ID (Integer'(Args (1)));

      Declaration : constant Syntax_Trees.Valid_Node_Access := Tree.Find_Ancestor
        (Indenting_Token,
         (if To_Token_Enum (Anchor) = TYPE_ID
          then +full_type_declaration_ID
          else +record_representation_clause_ID));

      Tree_Anchor : constant Syntax_Trees.Valid_Node_Access := Tree.Find_Child (Declaration, Anchor);

      --  Args (2) is the child index of RECORD (or a nonterminal possibly
      --  starting with RECORD) in Nonterm
      Record_Token : constant Syntax_Trees.Node_Access := Tree.Child
        (Nonterm, Positive_Index_Type (Integer'(Args (2))));
   begin
      --  Args (3) is the offset
      return Indent_Record
        (Parse_Data_Type (Data),
         Tree,
         Controlling_Token_Line => Tree.Line_Region (Nonterm, Trailing_Non_Grammar => True).First,
         Anchor_Token           => Tree_Anchor,
         Record_Token           => Tree.First_Terminal (Record_Token),
         Indenting_Token        => Indenting_Token,
         Indenting_Comment      => Indenting_Comment,
         Offset                 => Args (3));
   end Ada_Indent_Record_1;

end Wisi.Ada;
--  Local Variables:
--  ada-case-strict: nil
--  End:
