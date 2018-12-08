--  Abstract :
--
--  see spec.
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

with Ada.Strings.Fixed;
with Ada_Process_Actions; --  token_enum_id
package body Wisi.Ada is
   use WisiToken;

   function Indent_Record
     (Data              : in out Parse_Data_Type;
      Anchor_Token      : in     Augmented_Token;
      Record_Token      : in     Augmented_Token;
      Indenting_Token   : in     Augmented_Token;
      Indenting_Comment : in     Boolean;
      Offset            : in     Integer)
     return Wisi.Delta_Type
   is
      use Ada_Process_Actions;
   begin
      --  [1] ada-wisi-elisp-parse--indent-record-1.

      if Anchor_Token.Byte_Region = Null_Buffer_Region or
        Record_Token.Byte_Region = Null_Buffer_Region or
        Indenting_Token.Byte_Region = Null_Buffer_Region
      then
         return Null_Delta;
      end if;

      if not Indenting_Comment and Indenting_Token.ID = +RECORD_ID then
         --  Indenting 'record'
         return Indent_Anchored_2
           (Data, Anchor_Token.Line, Record_Token.Last_Line (Indenting_Comment), Ada_Indent_Record_Rel_Type,
            Accumulate => True);

      else
         --  Indenting comment, component or 'end'
         --
         --  Ensure 'record' line is anchored.
         if not (Data.Indents (Record_Token.Line).Label = Anchored or
                   Data.Indents (Record_Token.Line).Label = Anchor_Anchored)
         then
            if Anchor_Token.Line /= Record_Token.Line then
               --  We don't pass Indenting_Comment here, because 'record' is code.
               Indent_Token_1
                 (Data,
                  Record_Token,
                  Indent_Anchored_2
                    (Data, Anchor_Token.Line,
                     Record_Token.Last_Line (Indenting_Comment => False),
                     Ada_Indent_Record_Rel_Type,
                     Accumulate => True),
                  Indenting_Comment => False);
            end if;
         end if;

         --  from [2] wisi-elisp-parse--anchored-1
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
   --  Public subprograms

   overriding
   procedure Initialize
     (Data              : in out Parse_Data_Type;
      Descriptor        : access constant WisiToken.Descriptor;
      Source_File_Name  : in     String;
      Post_Parse_Action : in     Post_Parse_Action_Type;
      Line_Count        : in     Line_Number_Type;
      Params            : in     String)
   is
      use Standard.Ada.Strings.Fixed;
      First : Integer := Params'First;
      Last  : Integer := Index (Params, " ");
   begin
      Wisi.Initialize
        (Wisi.Parse_Data_Type (Data), Descriptor, Source_File_Name, Post_Parse_Action, Line_Count, "");

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

   overriding
   function Indent_Hanging_1
     (Data              : in out Parse_Data_Type;
      Tree              : in     Syntax_Trees.Tree;
      Tokens            : in     Syntax_Trees.Valid_Node_Index_Array;
      Tree_Indenting    : in     Syntax_Trees.Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Delta_1           : in     Simple_Indent_Param;
      Delta_2           : in     Simple_Indent_Param;
      Option            : in     Boolean;
      Accumulate        : in     Boolean)
     return Delta_Type
   is
      use all type Syntax_Trees.Node_Index;
      Indenting_Token : constant Aug_Token_Ref := Get_Aug_Token (Data, Tree, Tree_Indenting);

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
        Syntax_Trees.Invalid_Node_Index /= Tree.Find_Ancestor (Tree_Indenting, +aspect_specification_opt_ID)
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
            First_Terminal : Augmented_Token renames
              Data.Terminals (Indenting_Token.First_Terminals_Index);

            First_Terminal_First_On_Line : constant Boolean := First_Terminal.First and
              First_Terminal.First_Indent_Line /= Invalid_Line_Number;
         begin
            if Option then
               --  Test cases with "Item => ..."
               if First_Terminal_First_On_Line then
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
               if First_Terminal_First_On_Line then
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

   function Ada_Indent_Aggregate
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Tokens            : in     Syntax_Trees.Valid_Node_Index_Array;
      Tree_Indenting    : in     Syntax_Trees.Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is
      pragma Unreferenced (Data);
      pragma Unreferenced (Indenting_Comment);
      pragma Unreferenced (Args);
      pragma Unreferenced (Tokens);

      use all type Syntax_Trees.Node_Index;
      use Ada_Process_Actions;

      --  In our grammar, 'aggregate' can be an Ada aggregate, or a
      --  parenthesized expression.
      --
      --  We always want an 'aggregate' to be indented by
      --  ada-indent-broken. However, in some places in the grammar,
      --  'aggregate' is indented by ada-indent. The following checks for
      --  those places, and returns a correction value.

      Expression : constant Syntax_Trees.Node_Index := Tree.Find_Ancestor (Tree_Indenting, +expression_opt_ID);
   begin
      if Expression = Syntax_Trees.Invalid_Node_Index or else
        Tree.Parent (Expression) = Syntax_Trees.Invalid_Node_Index
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
      Tokens            : in     Syntax_Trees.Valid_Node_Index_Array;
      Tree_Indenting    : in     Syntax_Trees.Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is
      Subp_Tok    : constant Aug_Token_Ref := Get_Aug_Token
        (Data, Tree, Tokens (Positive_Index_Type (Integer'(Args (1)))));
      Renames_Tok : constant Aug_Token_Ref := Get_Aug_Token (Data, Tree, Tree_Indenting);
      Paren_I     : Base_Token_Index;
   begin
      if Subp_Tok.Char_Region = Null_Buffer_Region then
         --  built from entirely virtual tokens
         return Null_Delta;
      end if;

      Paren_I := Data.Find (Data.Descriptor.Left_Paren_ID, Subp_Tok);

      if Paren_I /= Augmented_Token_Arrays.No_Index then
         --  paren is present
         declare
            Paren_Tok : Augmented_Token renames Data.Terminals (Paren_I);
         begin
            if Ada_Indent_Renames > 0 then
               return Indent_Anchored_2
                 (Data,
                  Anchor_Line => Subp_Tok.Line,
                  Last_Line   => Renames_Tok.Last_Line (Indenting_Comment),
                  Offset      => Ada_Indent_Renames,
                  Accumulate  => True);
            else
               return Indent_Anchored_2
                 (Data,
                  Anchor_Line => Paren_Tok.Line,
                  Last_Line   => Renames_Tok.Last_Line (Indenting_Comment),
                  Offset      => Current_Indent_Offset (Data, Paren_Tok, abs Ada_Indent_Renames),
                  Accumulate  => True);
            end if;
         end;
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
      Tokens            : in     Syntax_Trees.Valid_Node_Index_Array;
      Tree_Indenting    : in     Syntax_Trees.Valid_Node_Index;
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

      Parameter_And_Result_Profile : constant Syntax_Trees.Valid_Node_Index := Tree.Parent (Tree_Indenting);

      Indenting : constant Aug_Token_Ref := Get_Aug_Token (Data, Tree, Tree_Indenting);
   begin
      if Indenting.Line = Indenting.First_Indent_Line then
         if Ada_Indent_Return <= 0 then
            declare
               Anchor_Token : constant Aug_Token_Ref := Get_Aug_Token
                 (Data, Tree, Tokens (Positive_Index_Type (Integer'(Args (1)))));
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
               Function_N   : constant Syntax_Trees.Valid_Node_Index := Tree.Find_Sibling
                 (Parameter_And_Result_Profile, +FUNCTION_ID);
               Anchor_Token : constant Aug_Token_Ref := Get_Aug_Token (Data, Tree, Function_N);
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
      Tokens            : in     Syntax_Trees.Valid_Node_Index_Array;
      Tree_Indenting    : in     Syntax_Trees.Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is begin
      return Indent_Record
        (Parse_Data_Type (Data),
         Anchor_Token      => Get_Aug_Token (Data, Tree, Tokens (Positive_Index_Type (Integer'(Args (1))))),
         Record_Token      => Get_Aug_Token (Data, Tree, Tokens (Positive_Index_Type (Integer'(Args (2))))),
         Offset            => Args (3),
         Indenting_Token   => Get_Aug_Token (Data, Tree, Tree_Indenting),
         Indenting_Comment => Indenting_Comment);
   end Ada_Indent_Record_0;

   function Ada_Indent_Record_1
     (Data              : in out Wisi.Parse_Data_Type'Class;
      Tree              : in     Syntax_Trees.Tree;
      Tokens            : in     Syntax_Trees.Valid_Node_Index_Array;
      Tree_Indenting    : in     Syntax_Trees.Valid_Node_Index;
      Indenting_Comment : in     Boolean;
      Args              : in     Wisi.Indent_Arg_Arrays.Vector)
     return Wisi.Delta_Type
   is
      --  We are indenting a token in 'record_definition'.
      --
      --  Args (1) is the token ID of the anchor (= TYPE); it appears as a
      --  direct child in an ancestor 'full_type_declaration'.
      use Ada_Process_Actions;

      Full_Type_Declaration : constant Syntax_Trees.Valid_Node_Index := Tree.Find_Ancestor
        (Tree_Indenting, +full_type_declaration_ID);

      Tree_Anchor : constant Syntax_Trees.Valid_Node_Index := Tree.Find_Child
        (Full_Type_Declaration, Token_ID (Integer'(Args (1))));

      Anchor_Token : constant Aug_Token_Ref := Get_Aug_Token (Data, Tree, Tree_Anchor);

      --  Args (2) is the index of RECORD in Tokens
      Record_Token : constant Aug_Token_Ref := Get_Aug_Token
        (Data, Tree, Tokens (Positive_Index_Type (Integer'(Args (2)))));

      Indenting_Token : constant Aug_Token_Ref := Get_Aug_Token (Data, Tree, Tree_Indenting);
   begin
      --  Args (3) is the offset
      return Indent_Record
        (Parse_Data_Type (Data), Anchor_Token, Record_Token, Indenting_Token, Indenting_Comment, Args (3));
   end Ada_Indent_Record_1;

end Wisi.Ada;
