--  Abstract :
--
--  see spec.
--
--  Copyright (C) 2018 - 2019 Free Software Foundation, Inc.
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

with Ada.Containers;
with Ada.Exceptions;
with Ada_Process_Actions;
with System.Assertions;
package body WisiToken.Parse.LR.McKenzie_Recover.Ada is

   use all type Ada_Process_Actions.Token_Enum_ID; -- token names
   use all type Semantic_Checks.Check_Status_Label;

   Descriptor : WisiToken.Descriptor renames Ada_Process_Actions.Descriptor;

   subtype Grammar_Token_ID_Set is WisiToken.Token_ID_Set (Descriptor.First_Terminal .. Descriptor.Last_Nonterminal);
   subtype Terminal_Token_ID_Set is WisiToken.Token_ID_Set (Descriptor.First_Terminal .. Descriptor.Last_Terminal);

   --  From ada.wy, all nonterms with a Match_Names check:
   --
   --  nonterm                       <begin_name_token>        <end_name_token>
   --  |-----------------------------|-------------------------|-------------
   --  accept_statement              IDENTIFIER                identifier_opt
   --  block_statement               block_label_opt           identifier_opt
   --  entry_body                    IDENTIFIER                identifier_opt
   --  loop_statement                block_label_opt           identifier_opt
   --  package_body                  name                      name_opt
   --  package_specification         name                      name_opt
   --  protected_body                IDENTIFIER                identifier_opt
   --  protected_type_declaration    IDENTIFIER                protected_definition
   --  single_protected_declaration  IDENTIFIER                protected_definition
   --  single_task_declaration       IDENTIFIER                identifier_opt
   --  subprogram_body               subprogram_specification  name_opt
   --  task_body                     IDENTIFIER                identifier_opt
   --  task_type_declaration         IDENTIFIER                identifier_opt

   No_Statements_Nonterm_IDs : constant Grammar_Token_ID_Set := To_Token_ID_Set
     --  Nonterms that cannot contain a handled_sequence_of_statements
     --  (transitive).
     (Descriptor.First_Terminal, Descriptor.Last_Nonterminal,
      +package_specification_ID  & (+protected_type_declaration_ID) & (+single_protected_declaration_ID) &
        (+single_task_declaration_ID) & (+task_type_declaration_ID));

   End_Keyword_IDs : constant Terminal_Token_ID_Set :=
     To_Token_ID_Set
       (Descriptor.First_Terminal, Descriptor.Last_Terminal,
        +CASE_ID & (+IF_ID) & (+LOOP_ID) & (+RECORD_ID) & (+RETURN_ID) & (+SELECT_ID));

   procedure Handle_Check_Fail
     (Trace             : in out WisiToken.Trace'Class;
      Lexer             : access constant WisiToken.Lexer.Instance'Class;
      Parser_Label      : in     Natural;
      Parse_Table       : in     WisiToken.Parse.LR.Parse_Table;
      Terminals         : in     Base_Token_Arrays.Vector;
      Tree              : in     Syntax_Trees.Tree;
      Local_Config_Heap : in out Config_Heaps.Heap_Type;
      Config            : in     Configuration)
   with Pre => Config.Check_Status.Label /= Ok
   is
      procedure Put (Message : in String; Config : in Configuration)
      is begin
         Put (Message, Trace, Parser_Label, Terminals, Config);
      end Put;

      End_Name_Token : Recover_Token renames Config.Check_Status.End_Name;
   begin
      --  There is a top level exception handler in McKenzie_Recover; the
      --  user has no way to work around an exception. If we are trying to
      --  fix a particular use case, the trace messages will be enough.

      case Config.Check_Status.Label is
      when Ok =>
         raise SAL.Programmer_Error;

      when Match_Names_Error =>
         --  There are several cases:
         --
         --  0. User name error. The input looks like:
         --
         --  "<begin_name_token> ... <end_name_token> ;"
         --
         --  where the names do not match, because the user is changing them.
         --
         --  The fix is to ignore the error. See
         --  test/ada_mode-recover_change_name.adb.
         --
         --  1. The mismatch indicates one or more missing 'end's. The input
         --  looks like:
         --
         --  "<correct_begin_name_token> ... <bad_begin_name_token> ... <end_name_token> ;"
         --
         --  where <correct_begin_name_token> matches <end_name_token>, but
         --  <bad_begin_name_token> does not, and the erroneous reduce has
         --  matched <bad_begin_name_token> with <end_name_token>.
         --
         --  The fix is to insert one or more 'end ;' before <end_name_token>.
         --  See test_mckenzie_recover.adb Block_Match_Names_1, Extra_Name_2.
         --
         --  2. The mismatch indicates a missing block start. The input looks like:
         --
         --  "<bad_begin_name_token> ... begin ... end <end_name_token> ;"
         --
         --  where the matching begin name token has been deleted.
         --
         --  The fix is to insert a matching block start before the 'begin'.
         --  See test/ada_mode-recover_deleted_procedure_1.adb
         --
         --
         --  It is not possible for the mismatch to indicate an extra 'end';
         --  that would generate either a Missing_Name_Error, or a syntax
         --  error.
         --
         --  To distinguish between case 0 and 1, we search the stack for
         --  <correct_begin_name_token>. If found, it's case 1, otherwise case
         --  0 or 2. We cannot distinguish between 0 and 2 (without parsing
         --  ahead).
         --
         --  If there is more than one missing 'end', a later recover operation
         --  will fix the others. For example, in test_mckenzie_recover
         --  Extra_Name_2, we get here on a second semantic check error.

         --  This case doesn't use Tree, and it can handle some virtual tokens.

         declare
            End_Name : constant String := Lexer.Buffer_Text (End_Name_Token.Name);

            Matching_Name_Index : SAL.Peek_Type := 3; -- start search before <end_name_token>
         begin
            Find_Matching_Name (Config, Lexer, End_Name, Matching_Name_Index, Case_Insensitive => True);

            if Matching_Name_Index = Config.Stack.Depth then
               --  case 0 or 2.

               if Ada_Process_Actions.Token_Enum_ID'(-Config.Error_Token.ID) in
                 protected_body_ID | protected_type_declaration_ID |
                 single_protected_declaration_ID | single_task_declaration_ID
               then
                  --  Not case 2
                  return;
               end if;

               declare
                  New_Config : Configuration := Config;
               begin
                  --  These solutions must compete with 'ignore check fail', so give them the same cost.
                  New_Config.Cost := New_Config.Cost + Parse_Table.McKenzie_Param.Ignore_Check_Fail;

                  New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

                  New_Config.Error_Token.ID := Invalid_Token_ID;
                  New_Config.Check_Status   := (Label => Ok);

                  case Ada_Process_Actions.Token_Enum_ID'(-Config.Error_Token.ID) is
                  when block_statement_ID =>
                     Push_Back_Check (New_Config, (+SEMICOLON_ID, +identifier_opt_ID, +END_ID));
                     Insert (New_Config, +BEGIN_ID);

                  when entry_body_ID =>
                     Push_Back_Check
                       (New_Config,
                        (+SEMICOLON_ID, +name_opt_ID, +END_ID, +handled_sequence_of_statements_ID));
                     Insert (New_Config, +BEGIN_ID);

                  when loop_statement_ID =>
                     Push_Back_Check
                       (New_Config,
                        (+SEMICOLON_ID, +identifier_opt_ID, +LOOP_ID, +END_ID));
                     Insert (New_Config, +LOOP_ID);

                  when package_body_ID =>
                     Push_Back_Check (New_Config, (+SEMICOLON_ID, +name_opt_ID, +END_ID));
                     if New_Config.Stack.Peek (1).Token.ID = +handled_sequence_of_statements_ID then
                        Push_Back_Check
                          (New_Config,
                           (+handled_sequence_of_statements_ID, +BEGIN_ID));
                     end if;
                     Push_Back_Check (New_Config, (1 => +declarative_part_opt_ID));
                     Insert (New_Config, (+PACKAGE_ID, +BODY_ID, +IDENTIFIER_ID, +IS_ID));

                  when package_specification_ID =>
                     Push_Back_Check (New_Config, (+name_opt_ID, +END_ID, +declarative_part_opt_ID));
                     if New_Config.Stack.Peek (1).Token.ID = +PRIVATE_ID then
                        Push_Back_Check (New_Config, (+PRIVATE_ID, +declarative_part_opt_ID));
                     end if;
                     Insert (New_Config, (+PACKAGE_ID, +IDENTIFIER_ID, +IS_ID));

                  when subprogram_body_ID =>
                     Push_Back_Check
                       (New_Config,
                        (+SEMICOLON_ID, +name_opt_ID, +END_ID, +handled_sequence_of_statements_ID, +BEGIN_ID,
                         +declarative_part_opt_ID));
                     Insert (New_Config, (+PROCEDURE_ID, +IDENTIFIER_ID, +IS_ID));

                  when task_body_ID =>
                     Push_Back_Check
                       (New_Config,
                        (+SEMICOLON_ID, +name_opt_ID, +END_ID, +handled_sequence_of_statements_ID));
                     Insert (New_Config, +BEGIN_ID);

                  when others =>
                     if Trace_McKenzie > Outline then
                        Put ("Language_Fixes Match_Names_Error 2: unknown error token", Config);
                     end if;
                     return;
                  end case;

                  if Trace_McKenzie > Detail then
                     Put ("Language_Fixes Match_Names_Error 2 " &
                            Image (Config.Error_Token.ID, Descriptor), New_Config);
                  end if;
                  Local_Config_Heap.Add (New_Config);
               exception
               when Bad_Config =>
                  null;
               end;

            else
               --  Case 1.
               declare
                  New_Config : Configuration := Config;
               begin
                  New_Config.Error_Token.ID := Invalid_Token_ID;
                  New_Config.Check_Status   := (Label => Ok);

                  New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

                  Push_Back_Check
                    (New_Config,
                     (+SEMICOLON_ID,
                      (case Ada_Process_Actions.Token_Enum_ID'(-Config.Error_Token.ID) is
                       when package_body_ID | package_specification_ID | subprogram_body_ID => +name_opt_ID,
                       when protected_type_declaration_ID | single_protected_declaration_ID => +protected_definition_ID,
                       when others =>  +identifier_opt_ID)));

                  if New_Config.Stack.Peek.Token.Min_Terminal_Index = Invalid_Token_Index then
                     --  'end' is on top of stack. We want to set Current_Shared_Token to
                     --  'end'; we can't if it has an invalid index (which it has if it was
                     --  pushed after a previous fix).
                     --
                     --  We don't check earlier for Invalid_Indices, because we can handle
                     --  other tokens having invalid indices.

                     return;
                  end if;

                  Push_Back_Check (New_Config, +END_ID);

                  --  We don't insert ';' here, because we may need to insert other
                  --  stuff first; let Minimal_Complete_Actions handle it.
                  Insert (New_Config, +END_ID);

                  Local_Config_Heap.Add (New_Config);

                  if Trace_McKenzie > Detail then
                     Put ("Language_Fixes Match_Names_Error 1 " & Image (Config.Error_Token.ID, Descriptor),
                          New_Config);
                  end if;
               exception
               when Bad_Config =>
                  null;

               when E : System.Assertions.Assert_Failure =>
                  if Trace_McKenzie > Outline then
                     Trace.Put_Line
                       ("Match_Names_Error 1 " & Standard.Ada.Exceptions.Exception_Message (E) & " " &
                          Image (Config.Error_Token.ID, Descriptor));
                  end if;
               end;
            end if;
         end;

      when Missing_Name_Error =>
         --  0. User name error. The input looks like:
         --
         --  "<begin_name_token> ... <end_name_token> ;"
         --
         --  where <end_name_token> is empty, because the user is changing it.
         --
         --  There are two cases:
         --
         --  0a. The nonterm can contain a handled_sequence_of_statements; ie a subprogram or named block
         --
         --  0b. The nonterm cannot contain a handled_sequence_of_statements;
         --  ie a protected object or type declaration.
         --
         --  The fix is to ignore the error.
         --
         --  1. missing 'begin' or extra 'end'. The stack looks like:
         --
         --   "<begin_named_token> ... begin handled_sequence_of_statements end <end_name_token> ;"
         --
         --  where the <end_name_token> is empty. See test_mckenzie_recover.adb
         --  Missing_Name_*, ada_mode-recover_15.adb.
         --
         --  There are two subcases:
         --
         --  1a. The 'end <end_name_token> ;' is left over from editing, and
         --  should be deleted. Note that there could be an End_Keyword_IDs
         --  with that end instead of a name.
         --
         --  1b. There is a missing 'begin'.
         --
         --  We can distinguish between 1a and 1b by looking for 'exception';
         --  if it is present, it is more likely there is a missing 'begin'.
         --  However, 'exception' is contained by
         --  'handled_sequence_of_statements' on the stack, so we have to look
         --  inside that using the syntax tree.
         --
         --  We cannot distinguish between cases 0 and 1, other than by parsing
         --  ahead, except in case 0b. So we enqueue two solutions; 'ignore
         --  error' and either 'insert begin' or 'delete end;'.

         if not Valid_Tree_Indices (Config.Stack, SAL.Base_Peek_Type (Config.Check_Token_Count)) then
            --  Invalid tree indices happens when recover enqueues a config that
            --  contains tokens pushed during recover. The logic below depends on
            --  valid tree indices.

            return;
         end if;

         if No_Statements_Nonterm_IDs (Config.Error_Token.ID) then
            --  case 0b.
            --  test/ada_mode.ads
            return;
         end if;

         if Syntax_Trees.Invalid_Node_Index = Tree.Find_Child (Config.Stack.Peek (4).Tree_Index, +EXCEPTION_ID) then
            --  'exception' not found; case 1a - assume extra 'end [keyword] ;'; delete it.
            declare
               use Config_Op_Arrays;
               New_Config     : Configuration := Config;
               Ops            : Config_Op_Arrays.Vector renames New_Config.Ops;
               Stack          : Recover_Stacks.Stack renames New_Config.Stack;
               End_Item       : Recover_Stack_Item; -- 'end' keyword; position in stack varies with case
               Keyword_Item   : Recover_Stack_Item; -- keyword after 'end'; may not be present
               Semicolon_Item : Recover_Stack_Item; -- semicolon after 'end'
            begin
               New_Config.Error_Token.ID := Invalid_Token_ID;
               New_Config.Check_Status   := (Label => Ok);

               --  This is a guess, and sometimes deleting the error keyword is better, so
               --  give it a cost.
               New_Config.Cost := New_Config.Cost + 1;

               New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

               case To_Token_Enum (Config.Error_Token.ID) is
               when block_statement_ID | package_body_ID | subprogram_body_ID | task_body_ID =>
                  Semicolon_Item := Stack.Peek (1);
                  End_Item       := Stack.Peek (3);

                  Push_Back_Check
                    (New_Config,
                     (+SEMICOLON_ID,
                      (if Config.Error_Token.ID in +block_statement_ID | +task_body_ID
                       then +identifier_opt_ID
                       else +name_opt_ID),
                      +END_ID));

                  if New_Config.Stack.Peek (1).Token.ID = +handled_sequence_of_statements_ID then
                     Undo_Reduce_Check
                       (New_Config, Tree,
                        (+handled_sequence_of_statements_ID,
                         +sequence_of_statements_opt_ID));
                  end if;

               when package_specification_ID =>
                  Semicolon_Item := Stack.Peek (1);
                  End_Item       := Stack.Peek (3);

                  Push_Back_Check (New_Config, (+SEMICOLON_ID, +name_opt_ID, +END_ID));
                  Undo_Reduce_Check (New_Config, Tree, +declarative_part_opt_ID);

               when loop_statement_ID =>
                  Semicolon_Item := Stack.Peek (1);
                  Keyword_Item   := Stack.Peek (3);
                  End_Item       := Stack.Peek (4);

                  Push_Back_Check
                    (New_Config, (+SEMICOLON_ID, +identifier_opt_ID, +LOOP_ID, +END_ID));

                  if New_Config.Stack.Peek (1).Token.ID = +handled_sequence_of_statements_ID then
                     Undo_Reduce_Check
                       (New_Config, Tree,
                        (+handled_sequence_of_statements_ID,
                         +sequence_of_statements_opt_ID));
                  end if;
               when others =>
                  if Trace_McKenzie > Outline then
                     Put ("Language_Fixes unimplemented nonterm for Missing_Name_Error.", Config);
                  end if;
                  raise Bad_Config;
               end case;

               if not Has_Space (Ops, 3) then
                  raise Bad_Config;
               end if;
               Append (Ops, (Delete, +END_ID, End_Item.Token.Min_Terminal_Index));
               if Keyword_Item.Token.ID /= Invalid_Token_ID then
                  Append (Ops, (Delete, Keyword_Item.Token.ID, Keyword_Item.Token.Min_Terminal_Index));
               end if;
               --  We don't need to delete the identifier|name ; it is missing and therefor empty.
               Append (Ops, (Delete, +SEMICOLON_ID, Semicolon_Item.Token.Min_Terminal_Index));

               New_Config.Current_Shared_Token := Config.Current_Shared_Token; --  After pushed_back SEMICOLON.

               Local_Config_Heap.Add (New_Config);

               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes Missing_Name_Error 1a " & Image (Config.Error_Token.ID, Descriptor), New_Config);
               end if;
            exception
            when Bad_Config =>
               null;
            end;

         else
            --  'exception' found; case 1b - assume missing 'begin'; insert it
            --  before 'handled_sequence_of_statements'
            declare
               New_Config : Configuration := Config;
            begin
               New_Config.Error_Token.ID := Invalid_Token_ID;
               New_Config.Check_Status   := (Label => Ok);

               New_Config.Cost := New_Config.Cost + 1;

               New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

               Push_Back_Check
                 (New_Config,
                  (+SEMICOLON_ID,
                   (if Config.Error_Token.ID = +block_statement_ID
                    then +identifier_opt_ID
                    else +name_opt_ID),
                   +END_ID, +handled_sequence_of_statements_ID));

               Insert (New_Config, +BEGIN_ID);

               Local_Config_Heap.Add (New_Config);

               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes Missing_Name_Error 1b " & Image (Config.Error_Token.ID, Descriptor), New_Config);
               end if;
            exception
            when Bad_Config =>
               null;
            end;
         end if;

      when Extra_Name_Error =>
         --  The input looks like
         --
         --  "<begin_name_token> ... block_label_opt begin ... end <end_name_token> ;"
         --
         --  where the erroneous reduce matches the empty 'block_label_opt'
         --  with '<end_name_Token>'.
         --
         --  0. If a matching <begin_name_token> is found, this is not a
         --  plausible user name error (but we always allow 'ignore error'). If
         --  it is not found, the user could be adding/deleting names; ignore
         --  error is appropriate. In either case, enqueue other solutions.
         --
         --  1. There is at least one missing 'end' before 'begin'. See
         --  test_mckenzie_recover.adb Extra_Name_1, Extra_Name_2,
         --  Two_Missing_Ends. The solution is to insert 'end ;' before the
         --  'begin'.
         --
         --  2. There is at least one missing 'end' after 'begin'. See
         --  test_mckenzie_recover.adb Extra_Name_3, Block_Match_Names_1. The
         --  solution is to insert 'end ;' before the 'end'.
         --
         --  3. There is an extra 'begin', before the 'begin'. See
         --  test/ada_mode-recover_block_name_mismatch.adb
         --
         --  There is no reliable way to distinguish between 1 and 2, so we
         --  enqueue both solutions. See test/ada_mode-recover_exception_1.adb
         --
         --  If there is more than one missing 'end', a later recover operation
         --  will fix the others.

         --  This case can handle Config.Error_Token.Virtual = True, and it doesn't use
         --  Tree.

         declare
            End_Name : constant String := Lexer.Buffer_Text (End_Name_Token.Name);

            Matching_Name_Index : SAL.Peek_Type := 3; -- start search before <end_name_token>
            Begin_Count         : Integer;
         begin
            Find_Matching_Name
              (Config, Lexer, End_Name, Matching_Name_Index,
               Other_ID => +BEGIN_ID, Other_Count => Begin_Count, Case_Insensitive => True);

            if Matching_Name_Index = Config.Stack.Depth then
               --  No matching name found; ignore error is the only fix.
               return;
            end if;

            if Begin_Count = 1 then
               --  Case 1 or 2.
               declare
                  New_Config : Configuration := Config;
               begin
                  New_Config.Error_Token.ID := Invalid_Token_ID;
                  New_Config.Check_Status   := (Label => Ok);

                  New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

                  --  Push_Back the failed reduce tokens.
                  for I in 1 .. New_Config.Check_Token_Count loop
                     Push_Back (New_Config);
                  end loop;

                  Insert (New_Config, +END_ID);
                  --  Let Minimal_Complete_Actions handle (insert ';').

                  Local_Config_Heap.Add (New_Config);

                  if Trace_McKenzie > Detail then
                     Put ("Language_Fixes Extra_Name_Error 1 " & Image (Config.Error_Token.ID, Descriptor), New_Config);
                  end if;

               exception
               when Bad_Config =>
                  null;
               end;

               --  Case 2
               declare
                  New_Config : Configuration := Config;
               begin
                  New_Config.Error_Token.ID := Invalid_Token_ID;
                  New_Config.Check_Status   := (Label => Ok);

                  New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

                  case Ada_Process_Actions.Token_Enum_ID'(-Config.Error_Token.ID) is
                  when block_statement_ID =>
                     --  There is almost always an open block of some sort; not worth
                     --  checking.
                     Push_Back_Check (New_Config, (+SEMICOLON_ID, +identifier_opt_ID, +END_ID));

                  when loop_statement_ID =>
                     Push_Back_Check
                       (New_Config, (+SEMICOLON_ID, +identifier_opt_ID, +LOOP_ID, +END_ID));

                  when others =>
                     if Trace_McKenzie > Outline then
                        Put ("Language_Fixes Extra_Name_Error 2: unrecognized Error_Token", Config);
                     end if;
                     raise Bad_Config;
                  end case;

                  --  Let Minimal_Complete_Actions finish insert
                  Insert (New_Config, +END_ID);

                  Local_Config_Heap.Add (New_Config);

                  if Trace_McKenzie > Detail then
                     Put ("Language_Fixes Extra_Name_Error 2 " & Image (Config.Error_Token.ID, Descriptor), New_Config);
                  end if;
               exception
               when Bad_Config =>
                  null;
               end;

            else
               --  Case 3. Delete the extra begin
               --
               --  If the first begin was inserted by recovery; we actually want to
               --  delete the second begin. see test/ada_mode-recover_indent_4.adb
               declare
                  New_Config     : Configuration := Config;
                  I              : SAL.Peek_Type := 1;
                  First_Begin_I  : SAL.Peek_Type;
                  Second_Begin_I : SAL.Peek_Type;
               begin
                  loop
                     if New_Config.Stack.Peek (I).Token.ID = +BEGIN_ID then
                        Second_Begin_I := I;
                        exit;
                     end if;
                     I := I + 1;
                  end loop;

                  loop
                     I := I + 1;
                     if New_Config.Stack.Peek (I).Token.ID = +BEGIN_ID then
                        First_Begin_I := I;
                        exit;
                     end if;
                  end loop;

                  if New_Config.Stack.Peek (First_Begin_I).Token.Virtual then
                     if New_Config.Stack.Peek (Second_Begin_I).Token.Virtual then
                        --  nothing we can do.
                        return;
                     end if;

                     --  Delete the second begin
                     for I in 1 .. Second_Begin_I loop
                        Push_Back (New_Config);
                     end loop;
                     pragma Assert (New_Config.Stack.Peek.Token.ID = +block_label_opt_ID);

                     if New_Config.Stack.Peek.Token.Byte_Region = Null_Buffer_Region then
                        --  block label is empty
                        Push_Back (New_Config);
                        Delete_Check (Terminals, New_Config, +BEGIN_ID);
                     else
                        Push_Back (New_Config);

                        declare
                           Index : WisiToken.Token_Index := New_Config.Current_Shared_Token;
                        begin
                           Delete_Check (Terminals, New_Config, Index, +IDENTIFIER_ID);
                           Delete_Check (Terminals, New_Config, Index, +COLON_ID);
                           Delete_Check (Terminals, New_Config, Index, +BEGIN_ID);
                        end;
                     end if;

                     if Undo_Reduce_Valid (New_Config.Stack, Tree) then
                        Undo_Reduce_Check (New_Config, Tree, +sequence_of_statements_ID);
                     else
                        Push_Back_Check (New_Config, +sequence_of_statements_ID);
                     end if;
                     Local_Config_Heap.Add (New_Config);

                     if Trace_McKenzie > Detail then
                        Put ("Language_Fixes Extra_Name_Error 3a " &
                               Image (Config.Error_Token.ID, Descriptor), New_Config);
                     end if;
                  else
                     --  Delete the first begin. We assume it is in a subprogram body, so
                     --  we don't need to adjust anything else.
                     for I in 1 .. First_Begin_I loop
                        Push_Back (New_Config);
                     end loop;

                     Delete_Check (Terminals, New_Config, +BEGIN_ID);
                     Local_Config_Heap.Add (New_Config);

                     if Trace_McKenzie > Detail then
                        Put ("Language_Fixes Extra_Name_Error 3b " &
                               Image (Config.Error_Token.ID, Descriptor), New_Config);
                     end if;
                  end if;
               end;
            end if;
         end;
      end case;
   exception
   when Bad_Config =>
      null;

   when System.Assertions.Assert_Failure =>
      if Trace_McKenzie > Outline then
         Trace.Put_Line ("Language_Fixes Handle_Check_Fail Assert fail");
      end if;
   end Handle_Check_Fail;

   procedure Handle_Parse_Error
     (Trace             : in out WisiToken.Trace'Class;
      Lexer             : access constant WisiToken.Lexer.Instance'Class;
      Parser_Label      : in     Natural;
      Parse_Table       : in     WisiToken.Parse.LR.Parse_Table;
      Terminals         : in     Base_Token_Arrays.Vector;
      Tree              : in     Syntax_Trees.Tree;
      Local_Config_Heap : in out Config_Heaps.Heap_Type;
      Config            : in     Configuration)
   with Pre => Config.Check_Status.Label = Ok
   is
      use Config_Op_Arrays;
      use Sorted_Insert_Delete_Arrays, Insert_Delete_Array_Refs;
      use all type Standard.Ada.Containers.Count_Type;

      procedure Put (Message : in String; Config : in Configuration)
      is begin
         Put (Message, Trace, Parser_Label, Terminals, Config);
      end Put;
   begin
      if Config.Error_Token.ID = +COLON_ID and
        Config.Stack.Peek.Token.ID = +IDENTIFIER_ID
      then
         --  Code looks like:
         --
         --  begin ... <variable_identifier> : [aliased constant] <subtype_indication> ...
         --
         --  compare to "missing begin"/"extra begin" case below.
         --
         --  Assume the user copied a declaration with an initializer, and is
         --  converting it to a subprogram parameter; see
         --  ada_mode-recover_02.adb). Delete the ': [aliased constant]
         --  <subtype_indication>'.
         --
         --  Note that if the user was converting to an assignment, the error
         --  would be on 'constant', not ':'.

         if Length (Config.Insert_Delete) > 0 and then
           Token_Index (Constant_Ref (Config.Insert_Delete, Last_Index (Config.Insert_Delete))) >=
           Config.Current_Shared_Token
         then
            --  Can't delete tokens from here
            return;
         end if;

         declare
            New_Config : Configuration := Config;
            Delete_Index : WisiToken.Token_Index := Config.Current_Shared_Token;
         begin
            Delete_Check (Terminals, New_Config, Delete_Index, +COLON_ID);
            if Terminals (Delete_Index).ID = +ALIASED_ID then
               Delete_Check (Terminals, New_Config, Delete_Index, +ALIASED_ID);
            end if;
            if Terminals (Delete_Index).ID = +CONSTANT_ID then
               Delete_Check (Terminals, New_Config, Delete_Index, +CONSTANT_ID);
            end if;
            if Terminals (Delete_Index).ID = +NOT_ID then
               Delete_Check (Terminals, New_Config, Delete_Index, +NOT_ID);
            end if;
            if Terminals (Delete_Index).ID = +NULL_ID then
               Delete_Check (Terminals, New_Config, Delete_Index, +NULL_ID);
            end if;
            if Terminals (Delete_Index).ID = +IDENTIFIER_ID then
               Delete_Check (Terminals, New_Config, Delete_Index, +IDENTIFIER_ID);

               --  There might be more to the subtype_indication; we'll let explore sort that out.
               Local_Config_Heap.Add (New_Config);
               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes variable decl as param", New_Config);
               end if;
            else
               --  Something else is going on, abandon this
               return;
            end if;
         end;

      elsif Config.Error_Token.ID = +DOT_ID then
         --  We've encountered a Selected_Component when we were expecting a
         --  simple IDENTIFIER or a name. If the name is preceded by 'end', then
         --  this similar to a semantic check Extra_Name_Error, and the
         --  solutions are similar.

         if Config.Stack.Peek.Token.ID = +IDENTIFIER_ID and
           Config.Stack.Peek (2).Token.ID = +END_ID
         then
            --  The input looks like one of:
            --
            --  1) "<begin_name_token_1> ... <begin_name_token_2> ... begin ... begin ... end <end_name_token_1> ;"
            --
            --  2) "<begin_name_token_1> ... begin ... declare ... begin ... end <end_name_token_1> ;"
            --
            --  Case 1) is missing 'end <end_name_token_2> ;' between the
            --  'begin's, so parsing expects <end_name_token_1> to match the
            --  second 'begin', which looks like an unnamed block. See
            --  test_mckenzie_recover Match_Selected_Component_1. 'declare ...'
            --  may _not_ be present on the second begin. The solution is to
            --  insert 'end ;' before the second 'begin'.
            --
            --  Case 2) is missing 'end;' after the second 'begin'. See
            --  test_mckenzie_recover Match_Selected_Component_2. 'declare ...'
            --  may be absent on the second begin, or a name may be present. The
            --  solution is to insert 'end;' after the second 'begin' (ie before
            --  the last 'end').
            --
            --  Minimal_Complete_Actions does not handle this case well.
            --
            --  Note that it's _not_ possible the user is just editing names; that
            --  would generate a semantic check fail, not a parse table error,
            --  since a "." would be permitted.

            declare
               Label        : constant String := "selected_component 1";
               New_Config_1 : Configuration   := Config;
               New_Config_2 : Configuration;
            begin
               New_Config_1.Error_Token.ID := Invalid_Token_ID;

               New_Config_1.Strategy_Counts (Language_Fix) := New_Config_1.Strategy_Counts (Language_Fix) + 1;

               Push_Back_Check (New_Config_1, (+IDENTIFIER_ID, +END_ID));
               if New_Config_1.Stack.Peek (1).Token.ID = +handled_sequence_of_statements_ID then
                  Undo_Reduce_Check
                    (New_Config_1, Tree,
                     (+handled_sequence_of_statements_ID,
                      +sequence_of_statements_opt_ID));
               end if;

               case To_Token_Enum (New_Config_1.Stack.Peek (3).Token.ID) is
               when block_label_opt_ID =>
                  --  no 'declare'; either case 1 or 2

                  New_Config_2 := New_Config_1;
                  New_Config_2.Strategy_Counts (Language_Fix) := New_Config_2.Strategy_Counts (Language_Fix) + 1;

                  Insert (New_Config_2, +END_ID);
                  --  Let Minimal_Complete_Actions finish insert.

                  Push_Back_Check
                    (New_Config_1,
                     (+handled_sequence_of_statements_ID, +BEGIN_ID, +block_label_opt_ID));

                  Insert (New_Config_1, +END_ID);
                  --  Let Minimal_Complete_Actions finish insert.

                  Local_Config_Heap.Add (New_Config_1);
                  Local_Config_Heap.Add (New_Config_2);

               when declarative_part_opt_ID =>
                  --  case 2
                  Insert (New_Config_1, +END_ID);
                  Local_Config_Heap.Add (New_Config_1);

               when others =>
                  if Trace_McKenzie > Outline then
                     Put ("Language_Fixes " & Label & " missing case " & Image
                            (New_Config_1.Stack.Peek (3).Token.ID, Descriptor), Config);
                     Trace.Put_Line ("... new_config stack: " & Image (New_Config_1.Stack, Descriptor));
                  end if;
                  return;
               end case;

               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes " & Label, New_Config_1);

                  if Length (New_Config_2.Ops) > 0 then
                     Put ("Language_Fixes " & Label, New_Config_2);
                  end if;
               end if;
            exception
            when Bad_Config =>
               null;
            end;
         end if;

      elsif Config.Error_Token.ID = +IDENTIFIER_ID and
        Config.Stack.Peek.Token.ID = +END_ID
      then
         --  We've encountered an identifier after 'end' when expecting a
         --  keyword. See test/ada_mode-recover_26.adb.
         --
         --  If a matching 'begin name' is found on the stack, the input looks like:
         --
         --  1) "<begin_name_token> ... begin ... <compound_statement_begin> ... end <end_name_token> ;"
         --
         --  There is a missing 'end <compound_statement_id> ;' before the
         --  'end'. We can get the ID to insert from Parse_Table
         --  Minimal_Complete_Actions.
         --
         --  Minimal_Complete_Actions does not handle this case well; it
         --  ignores the name.
         declare
            End_ID_Actions : constant Minimal_Action_Arrays.Vector := Parse_Table.States
              (Config.Stack.Peek.State).Minimal_Complete_Actions;
            End_Name       : constant String := Lexer.Buffer_Text (Config.Error_Token.Byte_Region);

            Matching_Name_Index : SAL.Peek_Type := 2; -- start search before 'end'
         begin
            Find_Matching_Name (Config, Lexer, End_Name, Matching_Name_Index, Case_Insensitive => True);

            if Matching_Name_Index < Config.Stack.Depth and then
              End_ID_Actions.Length = 1 and then
              End_ID_Actions (End_ID_Actions.First_Index).Verb = Shift
            then
               declare
                  Label      : constant String := "missing end keyword";
                  New_Config : Configuration   := Config;
               begin
                  New_Config.Error_Token.ID := Invalid_Token_ID;

                  New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

                  Push_Back_Check (New_Config, +END_ID);

                  --  Inserting the end keyword and semicolon here avoids the costs added by
                  --  Insert_Minimal_Complete_Actions.
                  Insert (New_Config, (+END_ID, End_ID_Actions (End_ID_Actions.First_Index).ID, +SEMICOLON_ID));

                  Local_Config_Heap.Add (New_Config);
                  if Trace_McKenzie > Detail then
                     Put ("Language_Fixes " & Label, New_Config);
                  end if;
               exception
               when Bad_Config =>
                  null;
               end;
            end if;
         end;

      elsif To_Token_Enum (Config.Error_Token.ID) in CONSTANT_ID | IDENTIFIER_ID and
        Config.Stack.Peek.Token.ID = +COLON_ID
      then
         --  Code looks like:
         --
         --  ... <subprogram|package start> begin ... <variable_name> : [constant] <type_name>;
         --
         --  The variable_name looks like a block_label. compare to "variable decl as
         --  param" case above.
         --
         --  1) There is a missing 'end;' before the <variable_name>. See
         --  test/ada_mode-recover_25.adb. Minimal_Complete now handles this
         --  case, but we enqueue the same solution here at lower cost, so it
         --  can compete with the solution for case 2..
         --
         --  2) There is an extra 'begin' before the <variable_name>. See
         --  test/ada_mode-recover_27.adb.
         --
         --  FIXME: if there is a sequence_of_statements between the 'begin'
         --  and the error point, or declarations before the 'begin', this is
         --  either a copied variable declaration that the user is converting
         --  to an assignment (solution: delete ': type'), or a subprogram
         --  begin split in two (solution: insert 'declare' or 'end; procedure
         --  name'). Need test cases.

         declare
            New_Config_1 : Configuration := Config;
            New_Config_2 : Configuration;
         begin
            New_Config_1.Strategy_Counts (Language_Fix) := New_Config_1.Strategy_Counts (Language_Fix) + 1;

            Push_Back_Check (New_Config_1, (+COLON_ID, +IDENTIFIER_ID));
            New_Config_2 := New_Config_1;

            Insert (New_Config_1, +END_ID);
            --  Let Minimal_Complete finish insert; that will add cost, so no cost here.
            Local_Config_Heap.Add (New_Config_1);

            if Trace_McKenzie > Detail then
               Put ("Language_Fixes missing begin", New_Config_1);
            end if;

            --  Case 2.
            Push_Back_Check (New_Config_2, +BEGIN_ID);
            if Undo_Reduce_Valid (New_Config_2.Stack, Tree) then
               Undo_Reduce_Check (New_Config_2, Tree, +declarative_part_opt_ID);
            else
               return;
            end if;
            Delete_Check (Terminals, New_Config_2, +BEGIN_ID);

            --  This is a guess, so add a cost.
            New_Config_2.Cost := New_Config_2.Cost + 1;
            Local_Config_Heap.Add (New_Config_2);

            if Trace_McKenzie > Detail then
               Put ("Language_Fixes extra begin", New_Config_2);
            end if;
         end;

      elsif Config.Error_Token.ID = +OR_ID and then
        Config.Stack.Peek.Token.ID = +expression_opt_ID
      then
         --  Code looks like:
         --
         --  expr1 and expr2 or expr3
         --
         --  where 'expr1 and expr2' is in the expression on the stack. Missing
         --  left paren before expr1. See test/ada_mode-recover_20.adb.
         --
         --  We could check for the presence of 'and' in expression_opt, but
         --  that requires a syntax tree. If the left paren doesn't help, this
         --  config will be dropped.

         declare
            New_Config : Configuration := Config;
         begin
            New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

            Push_Back_Check (New_Config, +expression_opt_ID);
            Insert (New_Config, +LEFT_PAREN_ID);
            --  Minimal_Complete will add the matching right paren.

            Local_Config_Heap.Add (New_Config);
            if Trace_McKenzie > Detail then
               Put ("Language_Fixes and/or", New_Config);
            end if;
         end;

      end if;
   exception
   when Bad_Config =>
      null;

   when System.Assertions.Assert_Failure =>
      if Trace_McKenzie > Outline then
         Trace.Put_Line ("Language_Fixes Handle_Parse_Error assert fail");
      end if;
   end Handle_Parse_Error;

   ----------
   --  Public subprograms

   procedure Language_Fixes
     (Trace             : in out WisiToken.Trace'Class;
      Lexer             : access constant WisiToken.Lexer.Instance'Class;
      Parser_Label      : in     Natural;
      Parse_Table       : in     WisiToken.Parse.LR.Parse_Table;
      Terminals         : in     Base_Token_Arrays.Vector;
      Tree              : in     Syntax_Trees.Tree;
      Local_Config_Heap : in out Config_Heaps.Heap_Type;
      Config            : in     Configuration)
   is begin
      if Trace_McKenzie > Extra then
         Put ("Language_Fixes", Trace, Parser_Label, Terminals, Config);
         Put_Line (Trace, Parser_Label, "config stack: " & Image (Config.Stack, Descriptor));
      end if;

      case Config.Check_Status.Label is
      when Ok =>
         Handle_Parse_Error (Trace, Lexer, Parser_Label, Parse_Table, Terminals, Tree, Local_Config_Heap, Config);

      when others =>
         Handle_Check_Fail (Trace, Lexer, Parser_Label, Parse_Table, Terminals, Tree, Local_Config_Heap, Config);
      end case;
   end Language_Fixes;

   procedure Matching_Begin_Tokens
     (Tokens                  : in     Token_ID_Array_1_3;
      Config                  : in     Configuration;
      Matching_Tokens         :    out Token_ID_Arrays.Vector;
      Forbid_Minimal_Complete :    out Boolean)
   is
      use Ada_Process_Actions;
      use Token_ID_Arrays;

      function Matching_Begin_For_End (Next_Index : in Positive) return Token_ID_Arrays.Vector
      is begin
         return Result : Token_ID_Arrays.Vector do
            if Tokens (Next_Index) = Invalid_Token_ID then
               --  Better to delete 'end'
               Result := Empty_Vector;
            else
               case To_Token_Enum (Tokens (Next_Index)) is
               when CASE_ID | IF_ID | LOOP_ID | RETURN_ID | SELECT_ID =>
                  Result := To_Vector (Tokens (Next_Index));

               when IDENTIFIER_ID =>
                  if Tokens (Next_Index + 1) /= Invalid_Token_ID and then
                    To_Token_Enum (Tokens (Next_Index + 1)) = DOT_ID
                  then
                     Result := To_Vector ((+PACKAGE_ID, +BODY_ID, +IDENTIFIER_ID, +IS_ID)); --  package body
                  else
                     Result := To_Vector ((+IDENTIFIER_ID, +COLON_ID, +BEGIN_ID)); -- named block begin
                  end if;

               when SEMICOLON_ID =>
                  Result := To_Vector (+BEGIN_ID);

               when others =>
                  null;
               end case;
            end if;
         end return;
      end Matching_Begin_For_End;

   begin
      if Config.Stack.Depth > 0 and then Config.Stack.Peek.Token.ID = +END_ID then
         Matching_Tokens := Matching_Begin_For_End (1);

      else
         case To_Token_Enum (Tokens (1)) is
         when END_ID =>
            Matching_Tokens := Matching_Begin_For_End (2);

         when ELSE_ID | ELSIF_ID | THEN_ID =>
            Matching_Tokens := To_Vector (+IF_ID);

         when EXCEPTION_ID =>
            Matching_Tokens := To_Vector (+BEGIN_ID);

            --  We don't return LEFT_PAREN for RIGHT_PAREN; better to delete it.

         when WHEN_ID =>
            Matching_Tokens := To_Vector ((+CASE_ID, +IDENTIFIER_ID, +IS_ID));

         when others =>
            null;
         end case;
      end if;

      if Config.Stack.Peek.Token.ID = +END_ID and
        ((Tokens (1) = +IDENTIFIER_ID and
            (Tokens (2) /= Invalid_Token_ID and then
               -Tokens (2) in DOT_ID | SEMICOLON_ID)) or
           End_Keyword_IDs (Tokens (1)))
      then
         Forbid_Minimal_Complete := True;
      else
         Forbid_Minimal_Complete := False;
      end if;
   end Matching_Begin_Tokens;

   function String_ID_Set
     (Descriptor        : in WisiToken.Descriptor;
      String_Literal_ID : in Token_ID)
     return Token_ID_Set
   is
      use Ada_Process_Actions;
   begin
      --  Character literal can be part of a string primary, so the nonterms
      --  are independent of String_Literal_ID.

      return Result : Token_ID_Set (Descriptor.First_Terminal .. Descriptor.Last_Nonterminal) := (others => False) do

         Result (String_Literal_ID)     := True;
         Result (+name_ID)              := True;
         Result (+primary_ID)           := True;
         Result (+factor_ID)            := True;
         Result (+term_ID)              := True;
         Result (+term_list_ID)         := True;
         Result (+simple_expression_ID) := True;
         Result (+relation_ID)          := True;
         Result (+expression_ID)        := True;
      end return;
   end String_ID_Set;

end WisiToken.Parse.LR.McKenzie_Recover.Ada;
--  Local Variables:
--  ada-auto-case: not-upper-case
--  End:
