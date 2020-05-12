--  Abstract :
--
--  see spec.
--
--  Copyright (C) 2017 - 2020 Free Software Foundation, Inc.
--
--  This library is free software;  you can redistribute it and/or modify it
--  under terms of the  GNU General Public License  as published by the Free
--  Software  Foundation;  either version 3,  or (at your  option) any later
--  version. This library is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN-
--  TABILITY or FITNESS FOR A PARTICULAR PURPOSE.

pragma License (GPL);

with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Ada_Process_Actions; --  token_enum_id
package body Wisi.Ada is
   use WisiToken;

   ----------
   --  body local subprograms

   function Indent_Record
     (Data              : in out Parse_Data_Type;
      Tree              : in     Syntax_Trees.Tree;
      Anchor_Token      : in     Augmented_Token;
      Record_Token      : in     Augmented_Token;
      Indenting_Token   : in     Augmented_Token;
      Indenting_Comment : in     Boolean;
      Offset            : in     Integer)
     return Wisi.Delta_Type
   is
      use Ada_Process_Actions;
   begin
      if not Indenting_Comment and Indenting_Token.ID = +RECORD_ID then
         --  Indenting 'record'
         return Indent_Anchored_2
           (Data, Anchor_Token.Line, Record_Token.Last_Line (Indenting_Comment), Ada_Indent_Record_Rel_Type,
            Accumulate => True);

      elsif Indenting_Comment and Indenting_Token.ID = +WITH_ID then
         --  comment before 'record'. test/ada_mode-nominal-child.ads Child_Type_1
         return Indent_Anchored_2
           (Data, Anchor_Token.Line, Indenting_Token.Last_Line (Indenting_Comment), Ada_Indent_Record_Rel_Type,
            Accumulate => True);

      elsif Indenting_Comment and Indenting_Token.ID = +IS_ID then
         --  comment after 'is'
         if Record_Token.ID = +RECORD_ID then
            --  before 'record'. test/ada_mode-nominal.ads Record_Type_1
            return Indent_Anchored_2
              (Data, Anchor_Token.Line, Indenting_Token.Last_Line (Indenting_Comment), Ada_Indent_Record_Rel_Type,
               Accumulate => True);
         else
            --  not before 'record'. test/ada_mode-nominal-child.ads Child_Type_1
            return (Simple, (Int, Offset));
         end if;

      else
         --  Indenting comment after 'record', other comment, component or 'end'
         --
         --  Ensure 'record' line is anchored to Anchor_Token.
         if not (Data.Indents (Record_Token.Line).Label = Anchored or
                   Data.Indents (Record_Token.Line).Label = Anchor_Anchored)
         then
            if Anchor_Token.Line /= Record_Token.Line then
               --  We don't pass Indenting_Comment here, because 'record' is code.
               Indent_Token_1
                 (Data,
                  Tree,
                  Indenting_Token         => Record_Token,
                  Delta_Indent            => Indent_Anchored_2
                    (Data,
                     Anchor_Token.Line,
                     Record_Token.Last_Line
                       (Indenting_Comment => False),
                     Ada_Indent_Record_Rel_Type,
                     Accumulate           => True),
                  Indenting_Comment       => False);
            end if;
         end if;

         return Indent_Anchored_2
           (Data,
            Anchor_Line => Anchor_Token.Line,
            Last_Line   => Indenting_Token.Last_Line (Indenting_Comment),
            Offset      => Current_Indent_Offset
              (Data, Anchor_Token,
               Offset   =>
                 (if Anchor_Token.Line = Record_Token.Line
                  then Offset
                  else Offset + Ada_Indent_Record_Rel_Type)),
            Accumulate => True);
      end if;
   end Indent_Record;

   ----------
   --  Refactor body subprograms

   function Find_ID_At
     (Tree       : in WisiToken.Syntax_Trees.Tree;
      ID         : in Token_ID;
      Edit_Begin : in WisiToken.Buffer_Pos)
     return WisiToken.Node_Index
   is
      function Match (Tree : in Syntax_Trees.Tree; Node : in Valid_Node_Index) return Boolean
        is (Tree.ID (Node) = ID and then Get_Aug_Token_Const_1 (Tree, Node).Byte_Region.First = Edit_Begin);
   begin
      return Tree.Find_Descendant (Tree.Root, Predicate => Match'Access);
   end Find_ID_At;

   procedure Unrecognized
     (Expecting  : in String;
      Found      : in WisiToken.Valid_Node_Index;
      Edit_Begin : in WisiToken.Buffer_Pos)
   with No_Return
   is begin
      raise SAL.Parameter_Error with "unrecognized subprogram call at byte_pos" & Edit_Begin'Image &
        "; expecting " & Expecting & " found node" & Found'Image;
   end Unrecognized;

   procedure Method_Object_To_Object_Method
     (Tree       : in     WisiToken.Syntax_Trees.Tree;
      Data       : in out Parse_Data_Type;
      Edit_Begin : in     WisiToken.Buffer_Pos)
   is
      --  Data.Tree contains one statement or declaration; Edit_Begin is at
      --  start of a subprogram call. Convert the subprogram call from
      --  Prefix.Method (Object, ...) to Object.Method (...).

      use Ada_Process_Actions;
      use Standard.Ada.Strings.Unbounded;
      use Standard.Ada.Text_IO;
      use WisiToken.Syntax_Trees;

      Call             : Node_Index := Find_ID_At (Tree, +name_ID, Edit_Begin);
      Edit_End         : WisiToken.Buffer_Pos;
      Method           : Valid_Node_Index;
      Temp             : Node_Index;
      Association_List : Node_Index;
      Object           : Valid_Node_Index;
      Result           : Unbounded_String;
   begin
      if Call = Invalid_Node_Index then
         --  Most likely the edit point is wrong.
         raise SAL.Parameter_Error with "no 'name' found at byte_pos" & Edit_Begin'Image;
      elsif not (Tree.RHS_Index (Call) in 1 | 3) then
         raise SAL.Parameter_Error with "no subprogram call found at byte_pos" & Edit_Begin'Image &
           " (found node" & Call'Image & ")";
      end if;

      if WisiToken.Trace_Action > Detail then
         Put_Line (";; refactoring node" & Call'Image & " '" & Data.Get_Text (Tree, Call) & "'");
      end if;

      if Tree.RHS_Index (Call) = 3 then
         --  Code looks like: Length (Container)'Old. We only want to edit
         --  'Length (Container)', keeping the trailing 'Old.
         Call := Tree.Child (Tree.Child (Call, 1), 1);
      end if;

      Association_List := Tree.Child (Tree.Child (Call, 2), 2);
      Edit_End         := Tree.Byte_Region (Call).Last;
      Method           := Tree.Child (Tree.Child (Call, 1), 1);
      loop
         case To_Token_Enum (Tree.ID (Method)) is
         when selected_component_ID | attribute_reference_ID =>
            Method := Tree.Child (Method, 3);

         when qualified_expression_ID =>
            Method := Tree.Child (Method, 3); -- aggregate
            if Tree.ID (Tree.Child (Method, 2)) = +association_list_ID then
               Method := Tree.Child (Method, 2);
               if Tree.RHS_Index (Method) = 1 then
                  Temp := Tree.Find_Descendant (Tree.Child (Method, 1), +expression_ID);
                  if Temp = Invalid_Node_Index then
                     Unrecognized ("expression", Tree.Child (Method, 1), Edit_Begin);
                  else
                     Method := Temp;
                     exit;
                  end if;
               else
                  Unrecognized ("association", Method, Edit_Begin);
               end if;
            else
               Unrecognized ("association_list", Method, Edit_Begin);
            end if;

         when IDENTIFIER_ID | STRING_LITERAL_ID =>
            exit;
         when others =>
            Unrecognized ("supported token", Method, Edit_Begin);
         end case;
      end loop;

      Temp := Tree.Find_Descendant (Association_List, +expression_ID);
      if Temp = Invalid_Node_Index then
         Unrecognized ("expression", Association_List, Edit_Begin);
      else
         Object := Temp;
      end if;

      --  Build remaining arg list in Result.
      loop
         if Tree.RHS_Index (Association_List) = 0 then
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
      Put_Line ("[" & Edit_Action_Code & Edit_Begin'Image & Edit_End'Image & " """ &
                  Elisp_Escape_Quotes (To_String (Result)) & """]");
   end Method_Object_To_Object_Method;

   procedure Object_Method_To_Method_Object
     (Tree       : in     WisiToken.Syntax_Trees.Tree;
      Data       : in out Parse_Data_Type;
      Edit_Begin : in     WisiToken.Buffer_Pos)
   is
      --  Data.Tree contains one statement or declaration; Edit_Begin is at
      --  start of a subprogram call. Convert the subprogram call from
      --  Object.Method (...) to Method (Object, ...).
      use Ada_Process_Actions;
      use Standard.Ada.Strings.Unbounded;
      use Standard.Ada.Text_IO;
      use WisiToken.Syntax_Trees;

      Call          : Node_Index := Find_ID_At (Tree, +name_ID, Edit_Begin);
      Edit_End      : WisiToken.Buffer_Pos;
      Object_Method : Valid_Node_Index;
      Method        : Unbounded_String;
      Object        : Unbounded_String;
      Result        : Unbounded_String;
   begin
      if Call = Invalid_Node_Index then
         --  Most likely the edit point is wrong.
         raise SAL.Parameter_Error with "no 'name' at byte_pos" & Edit_Begin'Image;
      elsif not (Tree.RHS_Index (Call) in 1 | 2 | 3) then
         raise SAL.Parameter_Error with "no subprogram call found at byte_pos" & Edit_Begin'Image &
           " (found node" & Call'Image & ")";
      end if;

      if WisiToken.Trace_Action > Detail then
         Put_Line (";; refactoring node" & Call'Image & " '" & Data.Get_Text (Tree, Call) & "'");
      end if;

      if Tree.RHS_Index (Call) = 3 then
         --  Code looks like: Container.Length'Old. We only want to edit
         --  'Container.Length', keeping the trailing 'Old.
         Call := Tree.Child (Tree.Child (Call, 1), 1);
      end if;

      Edit_End      := Tree.Byte_Region (Call).Last;
      Object_Method := Tree.Child (Call, 1);
         loop
            case To_Token_Enum (Tree.ID (Object_Method)) is
            when name_ID =>
               Object_Method := Tree.Child (Object_Method, 1);

            when selected_component_ID =>
               Object := +Get_Text (Data, Tree, Tree.Child (Object_Method, 1));
               Method := +Get_Text (Data, Tree, Tree.Child (Object_Method, 3));
               exit;

            when others =>
               Unrecognized ("supported token", Object_Method, Edit_Begin);
            end case;
         end loop;

         Result := Method & " (" & Object;
         if Tree.RHS_Index (Call) = 1 then
            Result := Result & ", " & Get_Text (Data, Tree, Tree.Child (Tree.Child (Call, 2), 2));
         end if;
         Result := Result & ")";
         Put_Line ("[" & Edit_Action_Code & Edit_Begin'Image & Edit_End'Image & " """ &
                     Elisp_Escape_Quotes (To_String (Result)) & """]");
   end Object_Method_To_Method_Object;

   procedure Element_Object_To_Object_Index
     (Tree       : in     WisiToken.Syntax_Trees.Tree;
      Data       : in out Parse_Data_Type;
      Edit_Begin : in     WisiToken.Buffer_Pos)
   is
      --  Data.Tree contains one statement or declaration; Edit_Begin is at
      --  start of a subprogram call. Convert the subprogram call from
      --  Prefix.Element (Object, Index) to Object (Index).

      use Ada_Process_Actions;
      use Standard.Ada.Text_IO;
      use WisiToken.Syntax_Trees;

      Call             : Node_Index := Find_ID_At (Tree, +name_ID, Edit_Begin);
      Edit_End         : WisiToken.Buffer_Pos;
      Temp             : Node_Index;
      Association_List : Node_Index;
      Object           : Valid_Node_Index;
      Index            : Valid_Node_Index;
   begin
      if Call = Invalid_Node_Index then
         --  Most likely the edit point is wrong.
         raise SAL.Parameter_Error with "no 'name' found at byte_pos" & Edit_Begin'Image;
      elsif not (Tree.RHS_Index (Call) in 1 | 2 | 3) then
         raise SAL.Parameter_Error with "no subprogram call found at byte_pos" & Edit_Begin'Image &
           " (found node" & Call'Image & ")";
      end if;

      if WisiToken.Trace_Action > Detail then
         Put_Line (";; refactoring node" & Call'Image & " '" & Data.Get_Text (Tree, Call) & "'");
      end if;

      if Tree.RHS_Index (Call) = 2 then
         --  Code looks like: Element (Container, I).Op. We only want to edit
         --  the subprogram call, keeping the trailing .Op.
         Call := Tree.Child (Tree.Child (Call, 1), 1);

      elsif Tree.RHS_Index (Call) = 3 then
         --  Code looks like: Element (Container, I)'Old. We only want to edit
         --  the subprogram call, keeping the trailing 'Old.
         Call := Tree.Child (Tree.Child (Call, 1), 1);
      end if;

      Association_List := Tree.Child (Tree.Child (Call, 2), 2);
      Edit_End         := Tree.Byte_Region (Call).Last;

      if Tree.RHS_Index (Association_List) /= 0 then
         Unrecognized ("two args", Association_List, Edit_Begin);
      end if;

      Temp := Tree.Find_Descendant (Association_List, +expression_ID);
      if Temp = Invalid_Node_Index then
         Unrecognized ("expression", Association_List, Edit_Begin);
      else
         Object := Temp;
      end if;

      Temp := Tree.Find_Descendant (Tree.Child (Association_List, 3), +expression_ID);
      if Temp = Invalid_Node_Index then
         Unrecognized ("expression", Association_List, Edit_Begin);
      else
         Index := Temp;
      end if;

      Put_Line
        ("[" & Edit_Action_Code & Edit_Begin'Image & Edit_End'Image & " """ &
           Elisp_Escape_Quotes (Get_Text (Data, Tree, Object) & " (" & Get_Text (Data, Tree, Index) & ")") &
           """]");
   end Element_Object_To_Object_Index;

   procedure Object_Index_To_Element_Object
     (Tree       : in     WisiToken.Syntax_Trees.Tree;
      Data       : in out Parse_Data_Type;
      Edit_Begin : in     WisiToken.Buffer_Pos)
   is
      --  Data.Tree contains one statement or declaration; Edit_Begin is at
      --  start of a subprogram call. Convert the subprogram call from
      --  Object (Index) to Element (Object, Index).

      use Ada_Process_Actions;
      use Standard.Ada.Text_IO;
      use WisiToken.Syntax_Trees;

      Call             : Node_Index := Find_ID_At (Tree, +name_ID, Edit_Begin);
      Edit_End         : WisiToken.Buffer_Pos;
      Temp             : Node_Index;
      Association_List : Node_Index;
      Object           : Valid_Node_Index;
      Index            : Valid_Node_Index;
   begin
      if Call = Invalid_Node_Index then
         --  Most likely the edit point is wrong.
         raise SAL.Parameter_Error with "no 'name' found at byte_pos" & Edit_Begin'Image;
      elsif not (Tree.RHS_Index (Call) in 1 | 2 | 3) then
         raise SAL.Parameter_Error with "no subprogram call found at byte_pos" & Edit_Begin'Image &
           " (found node" & Call'Image & ")";
      end if;

      if WisiToken.Trace_Action > Detail then
         Put_Line (";; refactoring node" & Call'Image & " '" & Data.Get_Text (Tree, Call) & "'");
      end if;

      if Tree.RHS_Index (Call) = 2 then
         --  Code looks like: Object (I).Component. We only want to edit
         --  the subprogram call, keeping the trailing .Component.
         Call := Tree.Child (Tree.Child (Call, 1), 1);

      elsif Tree.RHS_Index (Call) = 3 then
         --  Code looks like: Container (I)'Old. We only want to edit
         --  the subprogram call, keeping the trailing 'Old.
         Call := Tree.Child (Tree.Child (Call, 1), 1);
      end if;

      Object           := Tree.Child (Tree.Child (Call, 1), 1);
      Association_List := Tree.Child (Tree.Child (Call, 2), 2);
      Edit_End         := Tree.Byte_Region (Call).Last;

      if Tree.RHS_Index (Association_List) /= 1 then
         Unrecognized ("one args", Association_List, Edit_Begin);
      end if;

      Temp := Tree.Find_Descendant (Tree.Child (Association_List, 1), +expression_ID);
      if Temp = Invalid_Node_Index then
         Unrecognized ("expression", Association_List, Edit_Begin);
      else
         Index := Temp;
      end if;

      Put_Line
        ("[" & Edit_Action_Code & Edit_Begin'Image & Edit_End'Image & " """ &
           Elisp_Escape_Quotes
             ("Element (" & Get_Text (Data, Tree, Object) & ", " & Get_Text (Data, Tree, Index) & ")") &
           """]");
   end Object_Index_To_Element_Object;

   procedure Format_Parameter_List
     (Tree       : in     WisiToken.Syntax_Trees.Tree;
      Data       : in out Parse_Data_Type;
      Edit_Begin : in     WisiToken.Buffer_Pos)
   is separate;
   --  Data.Tree contains a subprogram declaration or body; Edit_Begin is
   --  at the start of a parameter list. Format the parameter list.
   --
   --  Handle virtual tokens as much as possible; at least closing paren.

   ----------
   --  Public subprograms, declaration order

   overriding
   procedure Initialize
     (Data              : in out Parse_Data_Type;
      Lexer             : in     WisiToken.Lexer.Handle;
      Descriptor        : access constant WisiToken.Descriptor;
      Base_Terminals    : in     WisiToken.Base_Token_Array_Access;
      Post_Parse_Action : in     Post_Parse_Action_Type;
      Begin_Line        : in     WisiToken.Line_Number_Type;
      End_Line          : in     WisiToken.Line_Number_Type;
      Begin_Indent      : in     Integer;
      Params            : in     String)
   is
      use Standard.Ada.Strings.Fixed;
      use all type Ada_Process_Actions.Token_Enum_ID;
      First : Integer := Params'First;
      Last  : Integer := Index (Params, " ");
   begin
      Wisi.Initialize
        (Wisi.Parse_Data_Type (Data), Lexer, Descriptor, Base_Terminals, Post_Parse_Action, Begin_Line, End_Line,
         Begin_Indent, "");

      Data.First_Comment_ID := +COMMENT_ID;
      Data.Last_Comment_ID  := WisiToken.Invalid_Token_ID;
      Data.Left_Paren_ID    := +LEFT_PAREN_ID;
      Data.Right_Paren_ID   := +RIGHT_PAREN_ID;

      Data.Embedded_Quote_Escape_Doubled := True;

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
         Last := First + 1;
         Ada_Indent_Hanging_Rel_Exp := Params (First) = '1';

         First := Last + 1;
         Last := First + 1;
         End_Names_Optional := Params (First) = '1';
      end if;

      Data.Indent_Comment_Col_0 := Ada_Indent_Comment_Col_0;
   end Initialize;

   overriding function Insert_After
     (User_Data            : in out Parse_Data_Type;
      Tree                 : in     WisiToken.Syntax_Trees.Tree'Class;
      Token                : in     WisiToken.Valid_Node_Index;
      Insert_On_Blank_Line : in     Boolean)
     return Boolean
   is
      pragma Unreferenced (User_Data);
      use Ada_Process_Actions;

      --  We return True if Token affects indent (ie it is a block boundary)
      --  and normally has no code following it on the same line.
      --
      --  'end' is not really an exception, it is normally followed by
      --  <name> and ';', but no more code. Except when indenting a blank
      --  line; see test/ada_mode-interactive_2.adb Record_1.
      --
      --  RIGHT_PAREN is an exception; it is often followed by more code,
      --  but clearly belongs on the same line as the preceding token (often
      --  other ')').
      --
      --  COLON is similar to RIGHT_PAREN.

      ID : constant Token_ID := Tree.ID (Token);

      Result : constant array (Ada_Process_Actions.Token_Enum_ID) of Boolean :=
        (BEGIN_ID |         -- test/ada_mode-recover_exception_1.adb, test/ada_mode-recover_extra_declare.adb
           COLON_ID |       -- test/ada_mode-recover_partial_22.adb
           DECLARE_ID |
           RIGHT_PAREN_ID | -- test/ada_mode-recover_20.adb
           SEMICOLON_ID |   -- test/ada_mode-recover_13.adb
           THEN_ID          -- test/ada_mode-recover_19
                => True,
         others => False);
   begin
      case To_Token_Enum (ID) is
      when CASE_ID | IF_ID | LOOP_ID | RECORD_ID | RETURN_ID | SELECT_ID =>
         return -Tree.ID (Tree.Prev_Terminal (Token)) = END_ID;

      when END_ID =>
         --  test/ada_mode-recover_20.adb, test/ada_mode-interactive_2.adb Record_1.
         return not Insert_On_Blank_Line;

      when IDENTIFIER_ID =>
         return -Tree.ID (Tree.Prev_Terminal (Token)) in END_ID | COLON_ID;

      when others =>
         return Result (-ID);
      end case;
   end Insert_After;

   overriding
   function Indent_Hanging_1
     (Data              : in out Parse_Data_Type;
      Tree              : in     Syntax_Trees.Tree;
      Tokens            : in     Valid_Node_Index_Array;
      Tree_Indenting    : in     Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Delta_1           : in     Simple_Indent_Param;
      Delta_2           : in     Simple_Indent_Param;
      Option            : in     Boolean;
      Accumulate        : in     Boolean)
     return Delta_Type
   is
      Indenting_Token : Aug_Token_Const_Ref renames Get_Aug_Token_Const_1 (Tree, Tree_Indenting);

      function Result (Delta_1 : in Simple_Indent_Param; Delta_2 : in Simple_Delta_Type) return Delta_Type
      is begin
         return
           (Hanging,
            Hanging_First_Line  => Indenting_Token.Line,
            Hanging_Paren_State => Indenting_Token.Paren_State,
            Hanging_Delta_1     => Indent_Compute_Delta
              (Data, Tree, Tokens, (Simple, Delta_1), Tree_Indenting, Indenting_Comment).Simple_Delta,
            Hanging_Delta_2     => Delta_2,
            Hanging_Accumulate => Accumulate);
      end Result;

      function Result (Delta_1 : in Simple_Delta_Type) return Delta_Type
      is begin
         return
           (Hanging,
            Hanging_First_Line  => Indenting_Token.Line,
            Hanging_Paren_State => Indenting_Token.Paren_State,
            Hanging_Delta_1     => Delta_1,
            Hanging_Delta_2     => Delta_1,
            Hanging_Accumulate => Accumulate);
      end Result;

      function Comment_Result (D : in Simple_Indent_Param) return Delta_Type
      is begin
         return Indent_Compute_Delta
           (Data, Tree, Tokens, (Simple, D), Tree_Indenting, Indenting_Comment => False);
      end Comment_Result;

      use Ada_Process_Actions;
   begin
      if Tree.ID (Tree.Parent (Tree_Indenting)) = +association_opt_ID and then
        Invalid_Node_Index /= Tree.Find_Ancestor (Tree_Indenting, +aspect_specification_opt_ID)
      then
         --  In aspect_specification_opt
         --  See ada.wy association_opt for test cases
         if not Indenting_Comment then
            return Result
              (Delta_1,
               Indent_Anchored_2
                 (Data, Indenting_Token.Line, Indenting_Token.Last_Indent_Line,
                  Current_Indent_Offset (Data, Indenting_Token, 0),
                  Accumulate => False).Simple_Delta);
         else
            --  Test case in test/aspects.ads
            return Result
              (Indent_Compute_Delta
                 (Data, Tree, Tokens, (Simple, Delta_1), Tree_Indenting, Indenting_Comment).Simple_Delta);
         end if;

      elsif Ada_Indent_Hanging_Rel_Exp then
         declare
            New_Delta_2 : constant Simple_Delta_Type := Indent_Anchored_2
              (Data, Indenting_Token.Line, Indenting_Token.Last_Indent_Line,
               Current_Indent_Offset (Data, Indenting_Token, Ada_Indent_Broken),
               Accumulate => False).Simple_Delta;
         begin
            if not Option or Indenting_Token.Line = Indenting_Token.First_Indent_Line then
               return Result (Delta_1, New_Delta_2);
            else
               return Result (New_Delta_2);
            end if;
         end;

      elsif Indenting_Comment then
         --  Use delta for last line of Indenting_Token.
         --  Test cases in test/ada_mode-parens.adb Hello
         declare
            First_Terminal : Aug_Token_Const_Ref renames Get_Aug_Token_Const_1
              (Tree, Tree.First_Terminal (Tree_Indenting));
         begin
            if Option then
               --  Test cases with "Item => ..."
               if First_Terminal.First then
                  if Indenting_Token.First_Indent_Line = Indenting_Token.Last_Indent_Line then
                     return Comment_Result (Delta_1);
                  else
                     return Comment_Result (Delta_2);
                  end if;
               else
                  if Indenting_Token.First_Indent_Line = Invalid_Line_Number then
                     return Comment_Result ((Int, 0));
                  else
                     return Comment_Result (Delta_1);
                  end if;
               end if;

            else
               if First_Terminal.First then
                  if Indenting_Token.First_Indent_Line = Indenting_Token.Last_Indent_Line then
                     return Comment_Result (Delta_1);
                  else
                     return Comment_Result (Delta_2);
                  end if;
               else
                  if Indenting_Token.First_Indent_Line = Invalid_Line_Number then
                     --  Comment is after first line in token
                     return Comment_Result (Delta_1);
                  else
                     return Comment_Result (Delta_2);
                  end if;
               end if;
            end if;
         end;

      elsif not Option or Indenting_Token.Line = Indenting_Token.First_Indent_Line then
         return Result
           (Delta_1,
            Indent_Compute_Delta
              (Data, Tree, Tokens, (Simple, Delta_2), Tree_Indenting, Indenting_Comment).Simple_Delta);

      else
         return Result
           (Indent_Compute_Delta
              (Data, Tree, Tokens, (Simple, Delta_1), Tree_Indenting, Indenting_Comment).Simple_Delta);
      end if;
   end Indent_Hanging_1;

   overriding
   procedure Refactor
     (Data       : in out Parse_Data_Type;
      Tree       : in     WisiToken.Syntax_Trees.Tree;
      Action     : in     Positive;
      Edit_Begin : in     WisiToken.Buffer_Pos)
   is
      --  Must match "ada-refactor-*" in ada-wisi.el
      Method_Object_To_Object_Method : constant Positive := 1;
      Object_Method_To_Method_Object : constant Positive := 2;
      Element_Object_To_Object_Index : constant Positive := 3;
      Object_Index_To_Element_Object : constant Positive := 4;
      Format_Parameter_List          : constant Positive := 5;

   begin
      if WisiToken.Trace_Action > Detail then
         Tree.Print_Tree (Data.Descriptor.all);
      end if;
      case Action is
      when Method_Object_To_Object_Method =>
         Wisi.Ada.Method_Object_To_Object_Method (Tree, Data, Edit_Begin);
      when Object_Method_To_Method_Object =>
         Wisi.Ada.Object_Method_To_Method_Object (Tree, Data, Edit_Begin);
      when Element_Object_To_Object_Index =>
         Wisi.Ada.Element_Object_To_Object_Index (Tree, Data, Edit_Begin);
      when Object_Index_To_Element_Object =>
         Wisi.Ada.Object_Index_To_Element_Object (Tree, Data, Edit_Begin);
      when Format_Parameter_List =>
         Wisi.Ada.Format_Parameter_List (Tree, Data, Edit_Begin);

      when others =>
         Standard.Ada.Text_IO.Put_Line ("(error ""unrecognized refactor action " & Action'Image & """)");
      end case;
   end Refactor;

   function Ada_Indent_Aggregate
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Tokens            : in     Valid_Node_Index_Array;
      Tree_Indenting    : in     Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is
      pragma Unreferenced (Data);
      pragma Unreferenced (Indenting_Comment);
      pragma Unreferenced (Args);
      pragma Unreferenced (Tokens);

      use Ada_Process_Actions;

      --  In our grammar, 'aggregate' can be an Ada aggregate, or a
      --  parenthesized expression.
      --
      --  We always want an 'aggregate' to be indented by ada-indent-broken.
      --  However, in some places in the grammar, 'aggregate' is indented by
      --  ada-indent. The following checks for those places, and returns a
      --  correction value. The aggregate may be nested inside a conidtional
      --  expression, so we search for 'name' as well; see
      --  test/ada_mode-conditional_expressions-more_1.adb.

      Expression : constant Node_Index := Tree.Find_Ancestor (Tree_Indenting, (+expression_opt_ID, +name_ID));
   begin
      if Expression = Invalid_Node_Index or else
        Tree.Parent (Expression) = Invalid_Node_Index
      then
         return Null_Delta;
      elsif Tree.ID (Tree.Parent (Expression)) in +if_expression_ID | +elsif_expression_item_ID |
        +case_expression_alternative_ID
      then
         --  The controlling boolean expression in 'if_expression' and
         --  'elsif_expression_item' cannot be an aggregate in legal Ada
         --  syntax.
         return (Simple, (Int, Ada_Indent_Broken - Ada_Indent));
      else
         return Null_Delta;
      end if;
   end Ada_Indent_Aggregate;

   function Ada_Indent_Renames_0
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Tokens            : in     Valid_Node_Index_Array;
      Tree_Indenting    : in     Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is
      Subp_Node   : constant Valid_Node_Index := Tokens (Positive_Index_Type (Integer'(Args (1))));
      Subp_Tok    : Aug_Token_Const_Ref renames Get_Aug_Token_Const_1 (Tree, Subp_Node);
      Renames_Tok : Aug_Token_Const_Ref renames Get_Aug_Token_Const_1 (Tree, Tree_Indenting);
      Paren_I     : Node_Index;
   begin
      Paren_I := Tree.Find_Descendant (Subp_Node, Data.Left_Paren_ID);

      if Paren_I /= Invalid_Node_Index then
         --  paren is present
         if Ada_Indent_Renames > 0 then
            return Indent_Anchored_2
              (Data,
               Anchor_Line => Subp_Tok.Line,
               Last_Line   => Renames_Tok.Last_Line (Indenting_Comment),
               Offset      => Ada_Indent_Renames,
               Accumulate  => True);
         else
            declare
               Paren_Tok : Aug_Token_Const_Ref renames Get_Aug_Token_Const_1 (Tree, Paren_I);
            begin
               return Indent_Anchored_2
                 (Data,
                  Anchor_Line => Paren_Tok.Line,
                  Last_Line   => Renames_Tok.Last_Line (Indenting_Comment),
                  Offset      => Current_Indent_Offset (Data, Paren_Tok, abs Ada_Indent_Renames),
                  Accumulate  => True);
            end;
         end if;
      else
         return Indent_Anchored_2
           (Data,
            Anchor_Line => Subp_Tok.Line,
            Last_Line   => Renames_Tok.Last_Line (Indenting_Comment),
            Offset      => Ada_Indent_Broken,
            Accumulate  => True);
      end if;
   end Ada_Indent_Renames_0;

   function Ada_Indent_Return_0
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Tokens            : in     Valid_Node_Index_Array;
      Tree_Indenting    : in     Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is
      use all type Ada_Process_Actions.Token_Enum_ID;
      --  Tokens (Args (1)) = 'formal_part'
      --  Indenting = 'result_profile'
      --  Args (2) = delta (= 0!)
      --
      --  We are indenting 'result_profile' in
      --  'parameter_and_result_profile'. The indent depends on whether the
      --  'formal_part' is present, and the location of 'FUNCTION'.

      Parameter_And_Result_Profile : constant Valid_Node_Index := Tree.Parent (Tree_Indenting);

      Indenting : Aug_Token_Const_Ref renames Get_Aug_Token_Const_1 (Tree, Tree_Indenting);
   begin
      if Indenting.Line = Indenting.First_Indent_Line then
         if Ada_Indent_Return <= 0 then
            declare
               Anchor_Token : Aug_Token_Const_Ref renames Get_Aug_Token_Const_1
                 (Tree, Tokens (Positive_Index_Type (Integer'(Args (1)))));
            begin
               return Indent_Anchored_2
                 (Data,
                  Anchor_Line => Anchor_Token.Line,
                  Last_Line   => Indenting.Last_Line (Indenting_Comment),
                  Offset      => Current_Indent_Offset (Data, Anchor_Token, Args (2) + abs Ada_Indent_Return),
                  Accumulate  => True);
            end;
         else
            declare
               Function_N   : constant Valid_Node_Index := Tree.Find_Sibling
                 (Parameter_And_Result_Profile, +FUNCTION_ID);
               Anchor_Token : Aug_Token_Const_Ref renames Get_Aug_Token_Const_1 (Tree, Function_N);
            begin
               return Indent_Anchored_2
                 (Data,
                  Anchor_Line => Anchor_Token.Line,
                  Last_Line   => Indenting.Last_Line (Indenting_Comment),
                  Offset      => Current_Indent_Offset (Data, Anchor_Token, Args (2) + abs Ada_Indent_Return),
                  Accumulate  => True);
            end;
         end if;

      else
         return Null_Delta;
      end if;
   end Ada_Indent_Return_0;

   function Ada_Indent_Record_0
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Tokens            : in     Valid_Node_Index_Array;
      Tree_Indenting    : in     Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is begin
      return Indent_Record
        (Parse_Data_Type (Data),
         Tree,
         Anchor_Token      => Get_Aug_Token_Const_1 (Tree, Tokens (Positive_Index_Type (Integer'(Args (1))))),
         Record_Token      => Get_Aug_Token_Const_1 (Tree, Tokens (Positive_Index_Type (Integer'(Args (2))))),
         Offset            => Args (3),
         Indenting_Token   => Get_Aug_Token_Const_1 (Tree, Tree_Indenting),
         Indenting_Comment => Indenting_Comment);
   end Ada_Indent_Record_0;

   function Ada_Indent_Record_1
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Tokens            : in     Valid_Node_Index_Array;
      Tree_Indenting    : in     Valid_Node_Index;
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

      use Ada_Process_Actions;

      Anchor : constant Token_ID := Token_ID (Integer'(Args (1)));

      Declaration : constant Valid_Node_Index := Tree.Find_Ancestor
        (Tree_Indenting,
         (if To_Token_Enum (Anchor) = TYPE_ID
          then +full_type_declaration_ID
          else +record_representation_clause_ID));

      Tree_Anchor : constant Valid_Node_Index := Tree.Find_Child (Declaration, Anchor);

      --  Args (2) is the index of RECORD (or a nonterminal possibly
      --  starting with RECORD) in Tokens
      Record_Token_Tree_Index : constant Node_Index := Tokens (Positive_Index_Type (Integer'(Args (2))));
   begin
      --  Args (3) is the offset
      return Indent_Record
        (Parse_Data_Type (Data),
         Tree,
         Anchor_Token      => Get_Aug_Token_Const_1 (Tree, Tree_Anchor),
         Record_Token      => Get_Aug_Token_Const_1 (Tree, Tree.First_Terminal (Record_Token_Tree_Index)),
         Indenting_Token   => Get_Aug_Token_Const_1 (Tree, Tree_Indenting),
         Indenting_Comment => Indenting_Comment,
         Offset            => Args (3));
   end Ada_Indent_Record_1;

end Wisi.Ada;
--  Local Variables:
--  ada-case-strict: nil
--  End:
