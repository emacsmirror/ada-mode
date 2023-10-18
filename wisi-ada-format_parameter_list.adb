--  Abstract :
--
--
--
--  Copyright (C) 2019 - 2023 Free Software Foundation, Inc.
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

with WisiToken.Syntax_Trees.LR_Utils; use WisiToken.Syntax_Trees.LR_Utils;
separate (Wisi.Ada)
procedure Format_Parameter_List
  (Tree            : in out WisiToken.Syntax_Trees.Tree;
   Edit_Begin_Char : in     WisiToken.Buffer_Pos)
is
   use Standard.Ada.Containers;
   use Ada_Annex_P_Process_LR1_Actions;
   use Standard.Ada.Text_IO;
   use WisiToken.Syntax_Trees;

   --  First process the syntax tree and produce a list of parameters
   package Region_Lists is new Standard.Ada.Containers.Doubly_Linked_Lists (Buffer_Region);
   type Parameter is record
      Identifiers : Region_Lists.List;
      Aliased_P   : Boolean       := False; -- "_P" for "present"
      In_P        : Boolean       := False;
      Out_P       : Boolean       := False;
      Not_Null_P  : Boolean       := False;
      Access_P    : Boolean       := False;
      Constant_P  : Boolean       := False;
      Protected_P : Boolean       := False;
      Type_Region : Buffer_Region := Null_Buffer_Region;
      Default_Exp : Buffer_Region := Null_Buffer_Region;
   end record;

   Formal_Part : constant Node_Access := Find_ID_Containing (Tree, (1 => +formal_part_ID), Edit_Begin_Char);
   Param_List  : constant Constant_List :=
     (if Formal_Part = Invalid_Node_Access
      then Creators.Invalid_List (Tree)
      else Creators.Create_List
        (Tree,
         Root       => Tree.Child (Formal_Part, 2),
         List_ID    => +parameter_specification_list_ID,
         Element_ID => +parameter_specification_ID));

   Param_Count : Count_Type := 0;

   function Get_Text (Region : in WisiToken.Buffer_Region) return String
   is begin
      return Tree.Lexer.Buffer_Text (Region);
   end Get_Text;

begin
   if Formal_Part = Invalid_Node_Access then
      --  Most likely the edit point is wrong.
      raise SAL.Parameter_Error with "no parameter list found containing byte_pos" & Edit_Begin_Char'Image;
   end if;

   if WisiToken.Trace_Action > Detail then
      Put_Line (";; format parameter list node " & Tree.Image (Formal_Part, Node_Numbers => True));
   end if;

   --  The last parameter might be empty, due to syntax errors.
   for N of Param_List loop
      if not Tree.Is_Empty_Nonterm (N) then
         Param_Count := Param_Count + 1;
      end if;
   end loop;

   declare
      Params           : array (1 .. Param_Count) of Parameter;
      Param_Cur        : Cursor                     := Param_List.First;
      Param_Iter       : constant Constant_Iterator := Param_List.Iterate_Constant;
      First_Param_Node : constant Node_Access       := Element (Param_Cur);
      Last_Param_Node  : Node_Access;
   begin
      for Param of Params loop
         Last_Param_Node := Element (Param_Cur);

         declare
            Children : constant Node_Access_Array := Tree.Children (Element (Param_Cur));
         begin
            for Ident of Creators.Create_List (Tree, Children (1), +defining_identifier_list_ID, +IDENTIFIER_ID) loop
               Param.Identifiers.Append (Tree.Byte_Region (Ident, Trailing_Non_Grammar => False));
            end loop;

            for I in 3 .. Children'Last loop
               case To_Token_Enum (Tree.ID (Children (I))) is
               when ALIASED_ID =>
                  Param.Aliased_P := True;

               when non_empty_mode_ID =>
                  if Tree.Is_Empty_Nonterm (Children (I)) then
                     Param.In_P  := False;
                     Param.Out_P := False;
                  else
                     Param.In_P  := Tree.ID (Tree.Child (Children (I), 1)) = +IN_ID;
                     Param.Out_P := Tree.ID (Tree.Child (Children (I), 1)) = +OUT_ID or
                       Tree.Children (Children (I))'Length > 1; -- 'in out'
                  end if;

               when null_exclusion_ID =>
                  Param.Not_Null_P := True;

               when name_ID =>
                  Param.Type_Region := Tree.Byte_Region (Children (I), Trailing_Non_Grammar => False);

               when access_definition_ID =>
                  declare
                     use all type SAL.Base_Peek_Type;
                     Access_Children : constant Node_Access_Array := Tree.Children (Children (I));
                     Last_Child      : SAL.Base_Peek_Type         := 1;
                  begin
                     if Tree.ID (Access_Children (Last_Child)) = +null_exclusion_ID then
                        Last_Child := @ + 1;
                        Param.Not_Null_P := True;
                     end if;

                     pragma Assert (Tree.ID (Access_Children (Last_Child)) = +ACCESS_ID);
                     Param.Access_P := True;
                     Last_Child := @ + 1;

                     if Tree.ID (Access_Children (Last_Child)) = +CONSTANT_ID then
                        Param.Constant_P := True;
                        Last_Child := @ + 1;
                     elsif Tree.ID (Access_Children (Last_Child)) = +PROTECTED_ID then
                        Param.Protected_P := True;
                        Last_Child := @ + 1;
                     end if;

                     Param.Type_Region :=
                       (Tree.Byte_Region (Access_Children (Last_Child), Trailing_Non_Grammar => False).First,
                        Tree.Byte_Region (Children (I), Trailing_Non_Grammar => False).Last);
                  end;

               when assign_value_ID =>
                  Param.Default_Exp := Tree.Byte_Region (Tree.Child (Children (I), 2), Trailing_Non_Grammar => False);

               when others =>
                  Raise_Programmer_Error ("unknown format_parameter_list token id", Tree, Children (I));
               end case;
            end loop;
         end;
         Param_Cur := Param_Iter.Next (Param_Cur);
      end loop;

      declare
         use Standard.Ada.Strings.Unbounded;
         Result     : Unbounded_String := +"(";
         Line_End   : Integer          := 0;     --  Index of last LF char in Result.
         Multi_Line : constant Boolean :=
           Tree.Line_Region (First_Param_Node, Trailing_Non_Grammar => False).First <
           Tree.Line_Region (Last_Param_Node, Trailing_Non_Grammar => False).First;
         Ident_Len  : Integer          := 0;     -- Maximum over all params, includes commas
         Type_Len   : Integer          := 0;
         Aliased_P  : Boolean          := False; -- "_P" for "present"
         In_P       : Boolean          := False;
         Out_P      : Boolean          := False;
         Not_Null_P : Boolean          := False;
         Access_P   : Boolean          := False;

         Len           : Integer; -- temporary
         Need_Comma    : Boolean;
         Need_New_Line : Boolean := False;
      begin
         if Multi_Line then
            --  Find columns
            for Param of Params loop
               Len := 0;
               for Ident of Param.Identifiers loop
                  Len := Len + Integer (Ident.Last - Ident.First) + 1;
               end loop;
               Len := Len + 2 * (Integer (Param.Identifiers.Length) - 1);
               Ident_Len := Integer'Max (Ident_Len, Len);

               --  We align the default expressions after the types in parameters
               --  that have defaults, not after all types. "constant", "protected"
               --  are treated as part of 'type'
               if Param.Default_Exp /= Null_Buffer_Region then
                  Len := Integer (Param.Type_Region.Last - Param.Type_Region.First) + 1 +
                    (if Param.Constant_P then 10 else 0) + -- "constant "
                    (if Param.Protected_P then 10 else 0); -- "protected"
                  Type_Len := Integer'Max (Type_Len, Len);
               end if;

               Aliased_P  := Aliased_P or Param.Aliased_P;
               In_P       := In_P or Param.In_P;
               Out_P      := Out_P or Param.Out_P;
               Not_Null_P := Not_Null_P or Param.Not_Null_P;
               Access_P   := Access_P or Param.Access_P;
            end loop;
            declare
               subtype Count is Standard.Ada.Text_IO.Count;
               Open_Paren_Col : constant Count := Tree.Column (Formal_Part);
               Ident_Col      : constant Count := Open_Paren_Col + 1;
               Colon_Col      : constant Count := Ident_Col + Count (Ident_Len) + 1;
               In_Col         : constant Count := Colon_Col + (if Aliased_P then 10 else 2);
               Out_Col        : constant Count := In_Col + (if In_P then 3 else 0);
               Type_Col       : constant Count := In_Col +
                 --  'not null' without access is part of the type
                 (if Not_Null_P and Access_P then 16
                  elsif Access_P then 7
                  elsif In_P and Out_P then 7
                  elsif In_P then 3
                  elsif Out_P then 4
                  else 0);
               Default_Col : constant Count := Type_Col + Count (Type_Len) + 1;

               function Indent_To (Col : in Count) return String
               is
                  use Standard.Ada.Strings.Fixed;
               begin
                  return
                    (Integer (Col - (if Need_New_Line then 0 else Open_Paren_Col)) -
                       (Length (Result) - Line_End)) * ' ';
               end Indent_To;
            begin
               if WisiToken.Trace_Action > Detail then
                  Put_Line (";; open_paren_col:" & Open_Paren_Col'Image);
               end if;

               for Param of Params loop
                  if Need_New_Line then
                     Result   := Result & ";" & Emacs_Lisp_New_Line;
                     Line_End := Length (Result);
                  end if;

                  Result := Result & Indent_To (Ident_Col);
                  Need_Comma := False;
                  for Ident of Param.Identifiers loop
                     if Need_Comma then
                        Result := Result & ", ";
                     else
                        Need_Comma := True;
                     end if;
                     Result := Result & Get_Text (Ident);
                  end loop;

                  Result := Result & Indent_To (Colon_Col) & ": ";

                  if Param.Aliased_P then Result := Result & "aliased "; end if;

                  Result := Result & Indent_To (In_Col);

                  if Param.In_P then Result := Result & "in "; end if;

                  if Param.Out_P then Result := Result & Indent_To (Out_Col) & "out "; end if;

                  if Param.Access_P then
                     if Param.Not_Null_P then
                        Result := Result & "not null access";
                     else
                        Result := Result & "access";
                     end if;
                  end if;

                  Result := Result & Indent_To (Type_Col);

                  if Param.Not_Null_P and not Param.Access_P then Result := Result & "not null "; end if;
                  if Param.Constant_P then Result := Result & "constant "; end if;
                  if Param.Protected_P then Result := Result & "protected "; end if;

                  Result := Result & Get_Text (Param.Type_Region);
                  if Param.Default_Exp /= Null_Buffer_Region then
                     Result := Result & Indent_To (Default_Col) & ":= " & Get_Text (Param.Default_Exp);
                  end if;

                  Need_New_Line := True;
               end loop;
               Result := Result & ")";
            end;
         else -- not Multi_Line
            for Param of Params loop
               if Need_New_Line then
                  Result := Result & "; ";
               end if;

               Need_Comma := False;
               for Ident of Param.Identifiers loop
                  if Need_Comma then
                     Result := Result & ", ";
                  else
                     Need_Comma := True;
                  end if;
                  Result := Result & Get_Text (Ident);
               end loop;

               Result := Result & " : ";

               if Param.Aliased_P then Result := Result & "aliased "; end if;
               if Param.In_P then Result := Result & "in "; end if;
               if Param.Out_P then Result := Result & "out "; end if;
               if Param.Not_Null_P then Result := Result & "not null "; end if;
               if Param.Access_P then Result := Result & "access "; end if;
               if Param.Constant_P then Result := Result & "constant "; end if;
               if Param.Protected_P then Result := Result & "protected "; end if;

               Result := Result & Get_Text (Param.Type_Region);
               if Param.Default_Exp /= Null_Buffer_Region then
                  Result := Result & " := " & Get_Text (Param.Default_Exp);
               end if;

               Need_New_Line := True;
            end loop;
            Result := Result & ")";
         end if;
         declare
            Region : constant Buffer_Region := Tree.Char_Region
              (Formal_Part, Trailing_Non_Grammar => False);
         begin
            Put_Line
              ("[" & Edit_Action_Code & Region.First'Image & Region.Last'Image &
                 " """ & Elisp_Escape_Quotes (-Result) & """]");
         end;
      end;
   end;
end Format_Parameter_List;
