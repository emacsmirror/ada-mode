--  Abstract :
--
--  see spec.
--
--  Copyright (C) 2018 Free Software Foundation, Inc.
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

   Begin_Name_IDs : constant Grammar_Token_ID_Set := To_Token_ID_Set
     (Descriptor.First_Terminal, Descriptor.Last_Nonterminal,
      +block_label_opt_ID & (+IDENTIFIER_ID) & (+name_ID) & (+subprogram_specification_ID));

   End_Name_IDs : constant Grammar_Token_ID_Set := To_Token_ID_Set
     (Descriptor.First_Terminal, Descriptor.Last_Nonterminal,
      +identifier_opt_ID & (+name_opt_ID) & (+protected_definition_ID));

   End_Keyword_IDs : constant Terminal_Token_ID_Set := To_Token_ID_Set
     (Descriptor.First_Terminal, Descriptor.Last_Terminal,
      +IF_ID & (+CASE_ID) & (+LOOP_ID) & (+RECORD_ID) & (+RETURN_ID) & (+SELECT_ID));

   Named_Nonterm_IDs : constant Grammar_Token_ID_Set := To_Token_ID_Set
     (Descriptor.First_Terminal, Descriptor.Last_Nonterminal,
      +accept_statement_ID & (+block_statement_ID) & (+entry_body_ID) & (+loop_statement_ID) & (+package_body_ID) &
        (+package_specification_ID) & (+protected_body_ID) & (+protected_type_declaration_ID) &
        (+single_protected_declaration_ID) & (+single_task_declaration_ID) & (+subprogram_body_ID) & (+task_body_ID) &
        (+task_type_declaration_ID));

   No_Statements_Nonterm_IDs : constant Grammar_Token_ID_Set := To_Token_ID_Set
     --  Nonterms that cannot contain a handled_sequence_of_statements
     --  (transitive).
     (Descriptor.First_Terminal, Descriptor.Last_Nonterminal,
      +package_specification_ID  & (+protected_type_declaration_ID) & (+single_protected_declaration_ID) &
        (+single_task_declaration_ID) & (+task_type_declaration_ID));

   Statement_Declaration_Start_IDs : constant Terminal_Token_ID_Set :=
     To_Token_ID_Set
       (Descriptor.First_Terminal, Descriptor.Last_Terminal,
        +ABORT_ID & (+ACCEPT_ID) & (+BEGIN_ID) & (+CASE_ID) & (+DECLARE_ID) & (+DELAY_ID) & (+ELSE_ID) & (+ELSIF_ID) &
          (+END_ID) & (+ENTRY_ID) & (+EXCEPTION_ID) & (+EXIT_ID) & (+FOR_ID) & (+FUNCTION_ID) & (+GENERIC_ID) &
          (+GOTO_ID) & (+IF_ID) & (+LOOP_ID) & (+OVERRIDING_ID) & (+PACKAGE_ID) & (+PRAGMA_ID) & (+PROCEDURE_ID) &
          (+PROTECTED_ID) & (+RAISE_ID) & (+REQUEUE_ID) & (+RETURN_ID) & (+SELECT_ID) & (+SUBTYPE_ID) & (+TASK_ID) &
          (+TYPE_ID) & (+USE_ID) & (+WHEN_ID) & (+WITH_ID));
   --  Terminal tokens that must be preceded by an end of statement/declaration.

   procedure Handle_Check_Fail
     (Trace             : in out WisiToken.Trace'Class;
      Lexer             : access constant WisiToken.Lexer.Instance'Class;
      Parser_Label      : in     Natural;
      Terminals         : in     Base_Token_Arrays.Vector;
      Tree              : in     Syntax_Trees.Tree;
      Local_Config_Heap : in out Config_Heaps.Heap_Type;
      Config            : in     Configuration)
   with Pre => Config.Check_Status.Label /= Ok
   is
      use all type SAL.Base_Peek_Type;
      use all type Syntax_Trees.Node_Index;

      procedure Put (Message : in String; Config : in Configuration)
      is begin
         Put (Message, Trace, Parser_Label, Terminals, Config);
      end Put;

      Begin_Name_Token : Recover_Token renames Config.Check_Status.Begin_Name;
      End_Name_Token   : Recover_Token renames Config.Check_Status.End_Name;
   begin
      --  There is a top level exception handler in McKenzie_Recover; the
      --  user has no way to work around an exception. If we are trying to
      --  fix a particular use case, the trace messages will be enough.

      if not Begin_Name_IDs (Begin_Name_Token.ID) then
         raise SAL.Programmer_Error with "unrecognized begin_name_token id " & Image (Begin_Name_Token.ID, Descriptor);
      end if;

      if not End_Name_IDs (End_Name_Token.ID) then
         raise SAL.Programmer_Error with "unrecognized begin_name_token id " & Image (End_Name_Token.ID, Descriptor);
      end if;

      if not Named_Nonterm_IDs (Config.Error_Token.ID) then
         raise SAL.Programmer_Error with "unrecognized name error token id " &
           Image (Config.Error_Token.ID, Descriptor);
      end if;

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
         --  The fix is to ignore the error.
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
                  New_Config.Cost := New_Config.Cost + 1;

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
                     raise SAL.Programmer_Error with "Match_Names_Error 2 " & Image (Config.Error_Token.ID, Descriptor);
                  end case;

                  if Trace_McKenzie > Detail then
                     Put ("Match_Names_Error 2 " & Image (Config.Error_Token.ID, Descriptor), New_Config);
                     if Trace_McKenzie > Extra then
                        Trace.Put_Line ("config stack: " & Image (New_Config.Stack, Descriptor));
                     end if;
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

                  Push_Back_Check
                    (New_Config,
                     (+SEMICOLON_ID,
                     (case Ada_Process_Actions.Token_Enum_ID'(-Config.Error_Token.ID) is
                       when package_body_ID | package_specification_ID | subprogram_body_ID => +name_opt_ID,
                       when protected_type_declaration_ID | single_protected_declaration_ID => +protected_definition_ID,
                       when others =>  +identifier_opt_ID)));

                  if New_Config.Stack (1).Token.Min_Terminal_Index = Invalid_Token_Index then
                     --  'end' is on top of stack. We want to set Current_Shared_Token to
                     --  'end'; we can't if it has an invalid index (which it has if it was
                     --  pushed after a previous fix).
                     --
                     --  We don't check earlier for Invalid_Indices, because we can handle
                     --  other tokens having invalid indices.

                     return;
                  end if;

                  Push_Back_Check (New_Config, +END_ID);
                  Insert (New_Config, (+END_ID, +SEMICOLON_ID));

                  Local_Config_Heap.Add (New_Config);

                  if Trace_McKenzie > Detail then
                     Put ("Match_Names_Error 1 " & Image (Config.Error_Token.ID, Descriptor),
                          New_Config);
                     if Trace_McKenzie > Extra then
                        Trace.Put_Line ("config stack: " & Image (New_Config.Stack, Descriptor));
                     end if;
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
         --  with that end.
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

         if Syntax_Trees.Invalid_Node_Index = Tree.Find_Child (Config.Stack (4).Tree_Index, +EXCEPTION_ID) then
            --  'exception' not found; case 1a - assume extra 'end [keyword] ;'; delete it.
            declare
               New_Config     : Configuration := Config;
               Ops            : Config_Op_Arrays.Vector renames New_Config.Ops;
               Stack          : Recover_Stacks.Stack renames New_Config.Stack;
               End_Item       : Recover_Stack_Item; -- 'end' keyword; position in stack varies with case
               Keyword_Item   : Recover_Stack_Item; -- keyword after 'end'; may not be present
               Semicolon_Item : Recover_Stack_Item; -- semicolon after 'end'
            begin
               --  This is a guess, but it is equally as likely as 'ignore error', so
               --  it has the same cost.

               New_Config.Error_Token.ID := Invalid_Token_ID;
               New_Config.Check_Status   := (Label => Ok);

               case Ada_Process_Actions.Token_Enum_ID'(-Config.Error_Token.ID) is
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
                  raise SAL.Programmer_Error with "unimplemented nonterm for Missing_Name_Error " &
                    Image (Config.Error_Token, Descriptor);
               end case;

               Ops.Append ((Delete, +END_ID, Token_Index => End_Item.Token.Min_Terminal_Index));
               if Keyword_Item.Token.ID /= Invalid_Token_ID then
                  Ops.Append ((Delete, Keyword_Item.Token.ID, Token_Index => Keyword_Item.Token.Min_Terminal_Index));
               end if;
               --  We don't need to delete the identifier|name ; it is missing and therefore empty.
               Ops.Append ((Delete, +SEMICOLON_ID, Token_Index => Semicolon_Item.Token.Min_Terminal_Index));

               New_Config.Current_Shared_Token := Config.Current_Shared_Token; --  After pushed_back SEMICOLON.

               Local_Config_Heap.Add (New_Config);

               if Trace_McKenzie > Detail then
                  Put ("Missing_Name_Error 1b " & Image (Config.Error_Token.ID, Descriptor), New_Config);
                  if Trace_McKenzie > Extra then
                     Trace.Put_Line ("config stack: " & Image (New_Config.Stack, Descriptor));
                  end if;
               end if;
            exception
            when Bad_Config =>
               null;
            end;

         else
            --  'exception' found; case 1a - assume missing 'begin'; insert it
            --  before 'handled_sequence_of_statements'
            declare
               New_Config : Configuration := Config;
            begin
               --  This is a guess, but it is equally as likely as 'ignore error', so
               --  it has the same cost.
               New_Config.Error_Token.ID := Invalid_Token_ID;
               New_Config.Check_Status   := (Label => Ok);

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
                  Put ("Missing_Name_Error 1a " & Image (Config.Error_Token.ID, Descriptor), New_Config);
                  if Trace_McKenzie > Extra then
                     Trace.Put_Line ("config stack: " & Image (New_Config.Stack, Descriptor));
                  end if;
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
         --  or
         --
         --  "block_label_opt loop ... end loop <end_name_token> ;"
         --
         --  where the extra <end_name_token> is created by an attempted fix.
         --  See test/ada_mode-recover_constant_as_statement.adb,
         --  test/ada_mode-recover_26.adb
         --
         --
         --  0. If a matching <begin_name_token> is found, this is not a
         --  plausible user name error. If it is not found, the user could be
         --  adding/deleting names. In either case, enqueue other solutions.
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
         --  There is no reliable way to distinguish between 1 and 2, so we
         --  enqueue both solutions. See test/ada_mode-recover_exception_1.adb
         --
         --  If there is more than one missing 'end', a later recover operation
         --  will fix the others.

         --  This case can handle Config.Error_Token.Virtual = True, and it doesn't use
         --  Tree.
         begin
            declare
               New_Config : Configuration := Config;
               Ops        : Config_Op_Arrays.Vector renames New_Config.Ops;
            begin
               New_Config.Error_Token.ID := Invalid_Token_ID;
               New_Config.Check_Status   := (Label => Ok);

               --  Push_Back the failed reduce tokens.
               for I in 1 .. New_Config.Check_Token_Count loop
                  declare
                     Item : constant Recover_Stack_Item := New_Config.Stack.Pop;
                  begin
                     if Item.Token.Virtual then
                        raise Bad_Config;
                     end if;
                     Ops.Append ((Push_Back, Item.Token.ID, Item.Token.Min_Terminal_Index));
                  end;
               end loop;
               New_Config.Current_Shared_Token := New_Config.Error_Token.Min_Terminal_Index;

               Insert (New_Config, (+END_ID, +SEMICOLON_ID));

               Local_Config_Heap.Add (New_Config);

               if Trace_McKenzie > Detail then
                  Put ("Extra_Name_Error 1 " & Image (Config.Error_Token.ID, Descriptor), New_Config);
                  if Trace_McKenzie > Extra then
                     Trace.Put_Line ("config stack: " & Image (New_Config.Stack, Descriptor));
                  end if;
               end if;
            exception
            when Bad_Config =>
               null;
            end;

            --  Case 2
            declare
               New_Config : Configuration := Config;
               Matching_Index : SAL.Peek_Type;
            begin
               New_Config.Error_Token.ID := Invalid_Token_ID;
               New_Config.Check_Status   := (Label => Ok);

               case Ada_Process_Actions.Token_Enum_ID'(-Config.Error_Token.ID) is
               when block_statement_ID =>
                  --  There is almost always an open block of some sort; not worth
                  --  checking.
                  Push_Back_Check (New_Config, (+SEMICOLON_ID, +identifier_opt_ID, +END_ID));
                  Insert (New_Config, (+END_ID, +SEMICOLON_ID));

               when loop_statement_ID =>
                  --  Look for an open 'loop', starting before error loop_statement.
                  Matching_Index := SAL.Peek_Type (Config.Check_Token_Count) + 1;
                  Find_ID (Config, +LOOP_ID, Matching_Index);
                  if Matching_Index = Config.Stack.Depth then
                     --  No open 'loop'. The failing loop_statement was created by recover,
                     --  but it was a bad idea. See test/ada_mode-recover_26.adb. Or the
                     --  user is editing; this error will be ignored.
                     raise Bad_Config;
                  end if;

                  Push_Back_Check
                    (New_Config, (+SEMICOLON_ID, +identifier_opt_ID, +LOOP_ID, +END_ID));
                  Insert (New_Config, (+END_ID, +LOOP_ID, +SEMICOLON_ID));

               when others =>
                  raise SAL.Programmer_Error with "Extra_Name_Error 2: unrecognized Error_Token.ID " & Image
                    (Config.Error_Token.ID, Descriptor);
               end case;

               Local_Config_Heap.Add (New_Config);

               if Trace_McKenzie > Detail then
                  Put ("Extra_Name_Error 2 " & Image (Config.Error_Token.ID, Descriptor), New_Config);
                  if Trace_McKenzie > Extra then
                     Trace.Put_Line ("config stack: " & Image (New_Config.Stack, Descriptor));
                  end if;
               end if;
            exception
            when Bad_Config =>
               null;
            end;
         end;
      end case;
   end Handle_Check_Fail;

   procedure Handle_Parse_Error
     (Trace             : in out WisiToken.Trace'Class;
      Parser_Label      : in     Natural;
      Parse_Table       : in     WisiToken.Parse.LR.Parse_Table;
      Terminals         : in     Base_Token_Arrays.Vector;
      Local_Config_Heap : in out Config_Heaps.Heap_Type;
      Config            : in     Configuration)
   with Pre => Config.Check_Status.Label = Ok
   is
      use all type Standard.Ada.Containers.Count_Type;
      use all type SAL.Base_Peek_Type;

      procedure Put (Message : in String; Config : in Configuration)
      is begin
         Put (Message, Trace, Parser_Label, Terminals, Config);
      end Put;
   begin
      --  There is a top level exception handler in McKenzie_Recover; the
      --  user has no way to work around an exception. If we are trying to
      --  fix a particular use case, the trace messages will be enough.

      if Config.Error_Token.ID = +DOT_ID then
         --  We've encountered a Selected_Component when we were expecting a
         --  simple IDENTIFIER or a name. If the name is preceded by 'end', then
         --  this similar to a semantic check Extra_Name_Error, and the
         --  solutions are similar.

         if Config.Stack (1).Token.ID = +IDENTIFIER_ID and
           Config.Stack (2).Token.ID = +END_ID
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
            --  Note that it's _not_ possible the user is just editing names; that
            --  would generate a semantic check fail, not a parse table error,
            --  since a "." would be permitted.

            declare
               Label        : constant String := "selected_component 1";
               New_Config_1 : Configuration   := Config;
               New_Config_2 : Configuration;
            begin
               New_Config_1.Error_Token.ID := Invalid_Token_ID;

               Push_Back_Check (New_Config_1, (+IDENTIFIER_ID, +END_ID));

               case Ada_Process_Actions.Token_Enum_ID'(-New_Config_1.Stack (3).Token.ID) is
               when block_label_opt_ID =>
                  --  no 'declare'; either case 1 or 2

                  New_Config_2 := New_Config_1;
                  Insert (New_Config_2, (+END_ID, +SEMICOLON_ID));

                  Push_Back_Check
                    (New_Config_1,
                     (+handled_sequence_of_statements_ID, +BEGIN_ID, +block_label_opt_ID));
                  Insert (New_Config_1, (+END_ID, +SEMICOLON_ID));

                  Local_Config_Heap.Add (New_Config_1);
                  Local_Config_Heap.Add (New_Config_2);

               when declarative_part_opt_ID =>
                  --  case 2
                  Insert (New_Config_1, (+END_ID, +SEMICOLON_ID));
                  Local_Config_Heap.Add (New_Config_1);

               when others =>
                  if Trace_McKenzie > Outline then
                     Put ("Language_Fixes " & Label & " missing case " & Image
                            (New_Config_1.Stack (3).Token.ID, Descriptor), Config);
                     Trace.Put_Line ("... new_config stack: " & Image (New_Config_1.Stack, Descriptor));
                  end if;
                  return;
               end case;

               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes " & Label & Image (Config.Error_Token.ID, Descriptor),
                       New_Config_1);
                  if Trace_McKenzie > Extra then
                     Trace.Put_Line ("config stack: " & Image (New_Config_1.Stack, Descriptor));
                  end if;

                  if New_Config_2.Ops.Length > 0 then
                     Put ("Language_Fixes " & Label & Image (Config.Error_Token.ID, Descriptor),
                          New_Config_2);
                     if Trace_McKenzie > Extra then
                        Trace.Put_Line ("config stack: " & Image (New_Config_2.Stack, Descriptor));
                     end if;
                  end if;
               end if;
            exception
            when Bad_Config =>
               null;
            end;
         end if;

      elsif -Config.Error_Token.ID in IDENTIFIER_ID | SEMICOLON_ID and Config.Stack (1).Token.ID = +END_ID then
         --  Encountered 'end <name>;' or 'end;' when expecting 'end <keyword>;'
         --
         --  The input looks like
         --
         --  "<begin_name_token> ... <keyword> ... end <end_name_token> ;"
         --
         --  where <keyword> is any of End_Keyword_IDs. 'end <keyword> ;' is
         --  missing before 'end'. See test/ada_mode-recover_18.adb,
         --  test/ada_mode-recover_end_1.adb.
         --
         --  The solution is to insert 'end <keyword>;' before the 'end'. We
         --  can find the keyword on the stack.
         --
         --  Or 'end;' could be in the wrong place; see
         --  test/ada_mode-recover_23.adb. Best solution there is to delete
         --  'end;'; we let normal DFA explore do that, so we give the solution
         --  provided here a cost.
         declare
            Label         : constant String := "end keyword 1";
            New_Config    : Configuration   := Config;
            Keyword_Index : SAL.Peek_Type   := 2;
         begin
            Find_ID (Config, End_Keyword_IDs, Keyword_Index);

            if Keyword_Index = Config.Stack.Depth then
               --  not found
               if Trace_McKenzie > Outline then
                  Put ("Language_Fixes " & Label & " keyword not found " &
                         Image (Config.Error_Token.ID, Descriptor), New_Config);
                  Trace.Put_Line ("config stack: " & Image (New_Config.Stack, Descriptor));
               end if;
               raise Bad_Config;
            end if;

            New_Config.Error_Token.ID := Invalid_Token_ID;
            New_Config.Cost := New_Config.Cost + 2;

            Push_Back_Check (New_Config, +END_ID);

            Insert (New_Config, (+END_ID, Config.Stack (Keyword_Index).Token.ID, +SEMICOLON_ID));

            Local_Config_Heap.Add (New_Config);

            if Trace_McKenzie > Detail then
               Put ("Language_Fixes " & Label & " " & Image (Config.Error_Token.ID, Descriptor), New_Config);
               if Trace_McKenzie > Extra then
                  Trace.Put_Line ("config stack: " & Image (New_Config.Stack, Descriptor));
               end if;
            end if;
         exception
         when Bad_Config =>
            null;
         when System.Assertions.Assert_Failure =>
            --  From *_Check
            if Trace_McKenzie > Outline then
               Put ("Language_Fixes " & Label & " ID mismatch " &
                      Image (Config.Error_Token.ID, Descriptor), Config);
               Trace.Put_Line ("... new_config stack: " & Image (New_Config.Stack, Descriptor));
            end if;
         end;

      elsif End_Keyword_IDs (Config.Error_Token.ID) and Config.Stack (1).Token.ID = +END_ID then
         --  Encountered 'end <keyword>;' when expecting 'end <different keyword>;' or 'end <name>;'
         --
         --  The input looks like one of:
         --
         --  a. <matching_begin_keyword> ... <other_begin_keyword> ... end <keyword> ;
         --
         --     where <begin_keyword> matches the error keyword. The solution
         --     is to insert an 'end <keyword>;' matching <other_begin_keyword>
         --     before the 'end'. See test/ada_mode_recover_12.adb
         --
         --  b. <other_begin> ... end <keyword> ;
         --
         --     where the matching keyword is missing. The solution is to
         --     insert a matching <begin_keyword> before the '...'
         --     sequence_of_statements_opt.
         --
         --  c. 'end <keyword>;' could be in the wrong place;
         --
         --      see test/ada_mode-recover_24.adb. Best solution there is to
         --      replace the wrong keyword with the right one, so we enqueue that
         --      solution also.
         declare
            Label             : constant String := "end keyword 2";
            New_Config        : Configuration   := Config;
            Matching_Index    : SAL.Peek_Type   := 2;
            Other_Begin_Index : SAL.Peek_Type   := 2;
         begin
            Find_ID (Config, Config.Error_Token.ID, Matching_Index);

            New_Config.Error_Token.ID := Invalid_Token_ID;
            New_Config.Cost := New_Config.Cost + 1;

            Push_Back (New_Config); -- end_id

            if Matching_Index = Config.Stack.Depth then
               --  matching keyword not found; case b
               case Ada_Process_Actions.Token_Enum_ID'(-New_Config.Stack (1).Token.ID) is
               when sequence_of_statements_opt_ID | handled_sequence_of_statements_ID =>
                  Push_Back (New_Config);

               when declarative_part_opt_ID =>
                  --  Code looks like:
                  --  package <declaration>... end <keyword> ; ...
                  Insert (New_Config, +BEGIN_ID);

               when others =>
                  if Trace_McKenzie > Outline then
                     Trace.Put_Line
                       ("Language_Fixes " & Label & " unrecognized nonterm " & Image
                          (New_Config.Stack (1).Token.ID, Descriptor));
                  end if;
               end case;

               Insert (New_Config, (1 => Config.Error_Token.ID));

               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes " & Label & "b " & Image (Config.Error_Token.ID, Descriptor), New_Config);
               end if;
            else
               --  Matching keyword found; case a. Look for the <other_begin_keyword>.
               Find_ID (Config, End_Keyword_IDs & (+BEGIN_ID), Other_Begin_Index);

               if Other_Begin_Index = Config.Stack.Depth then
                  if Trace_McKenzie > Outline then
                     Put (Label & " other_begin_keyword not found", Config);
                  end if;
                  return;
               end if;

               if Config.Stack.Peek (Other_Begin_Index).Token.ID = (+BEGIN_ID) then
                  Insert (New_Config, (+END_ID, +SEMICOLON_ID));
               else
                  Insert (New_Config, (+END_ID, Config.Stack.Peek (Other_Begin_Index).Token.ID, +SEMICOLON_ID));
               end if;

               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes " & Label & "a " & Image (Config.Error_Token.ID, Descriptor), New_Config);
               end if;
            end if;

            Local_Config_Heap.Add (New_Config);
         exception
         when Bad_Config =>
            null;
         end;

         declare
            Label      : constant String := "end keyword 2c ";
            New_Config : Configuration   := Config;
         begin
            Delete (New_Config, New_Config.Error_Token.ID); -- wrong keyword

            --  It's not easy to tell what the right keyword to insert is; the
            --  normal explore mechanism will find it.

            New_Config.Error_Token.ID := Invalid_Token_ID;

            --  Inserting the replacement is likely to cost 2, so make this cost 0.
            New_Config.Cost := New_Config.Cost + 0;

            if Trace_McKenzie > Detail then
               Put ("Language_Fixes " & Label & Image (Config.Error_Token.ID, Descriptor), New_Config);
            end if;
            Local_Config_Heap.Add (New_Config);
         exception
         when Bad_Config =>
            null;
         end;

      elsif Config.Error_Token.ID = +WHEN_ID then
         declare
            Label         : constant String := "missing 'case' ";
            New_Config    : Configuration;
            Matching_Index : SAL.Peek_Type := 1;
         begin
            Find_ID (Config, +CASE_ID, Matching_Index);
            if Matching_Index = Config.Stack.Depth then
               --  missing 'case'
               New_Config := Config;
               New_Config.Error_Token.ID := Invalid_Token_ID;
               Push_Back_Check (New_Config, +sequence_of_statements_opt_ID);
               Insert (New_Config, (+CASE_ID, +IS_ID));
               Local_Config_Heap.Add (New_Config);
               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes " & Label & Image (Config.Error_Token.ID, Descriptor), New_Config);
               end if;
            end if;
         exception
         when Bad_Config =>
            null;
         end;

      elsif Ada_Process_Actions.Token_Enum_ID'(-Config.Error_Token.ID) in ELSE_ID | ELSIF_ID then
         declare
            Label         : constant String := "missing 'if then' ";
            New_Config    : Configuration;
            Matching_Index : SAL.Peek_Type := 1;
         begin
            Find_ID (Config, +IF_ID, Matching_Index);
            if Matching_Index = Config.Stack.Depth then
               --  missing 'if .. then'
               --
               --  We don't handle missing 'if' alone; less likely.

               New_Config := Config;
               New_Config.Error_Token.ID := Invalid_Token_ID;

               if New_Config.Stack (1).Token.ID /= Invalid_Token_ID then
                  case Ada_Process_Actions.Token_Enum_ID'(-New_Config.Stack (1).Token.ID) is
                  when sequence_of_statements_opt_ID =>
                     Push_Back_Check (New_Config, +sequence_of_statements_opt_ID);
                     if -New_Config.Stack (1).Token.ID = +block_label_opt_ID then
                        Push_Back_Check (New_Config, +block_label_opt_ID);
                     end if;

                  when others =>
                     if Trace_McKenzie > Outline then
                        Trace.Put_Line
                          ("Language_Fixes " & Label & " unimplemented token_id " &
                             Image (New_Config.Stack (1).Token.ID, Descriptor));
                     end if;
                  end case;
               end if;
               Insert (New_Config, (+IF_ID, +THEN_ID));
               Local_Config_Heap.Add (New_Config);
               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes " & Label & Image (Config.Error_Token.ID, Descriptor), New_Config);
               end if;
            end if;
         exception
         when Bad_Config =>
            null;
         end;

      elsif Ada_Process_Actions.Token_Enum_ID'(-Config.Error_Token.ID) in CONSTANT_ID | IDENTIFIER_ID and
        (for some Prod of Parse_Table.States (Config.Stack.Peek.State).Productions => Prod.LHS = +block_label_ID)
      then
         --  Code looks like:
         --
         --  ... <subprogram|package start> begin ... <variable_name> : [constant] <type_name>;
         --
         --  There is a missing 'end;' before the <variable_name>. See test/ada_mode-recover_25.adb

         declare
            New_Config : Configuration := Config;
         begin
            Push_Back_Check (New_Config, (+COLON_ID, +IDENTIFIER_ID));
            Insert (New_Config, (+END_ID, +SEMICOLON_ID));
            Local_Config_Heap.Add (New_Config);
            if Trace_McKenzie > Detail then
               Put ("Language_Fixes terminate_subprogram" & Image (Config.Error_Token.ID, Descriptor), New_Config);
            end if;
         end;
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
   is
      use all type SAL.Base_Peek_Type;
   begin
      if Trace_McKenzie > Extra then
         Put ("Ada Language_Fixes", Trace, Parser_Label, Terminals, Config);
         Put_Line (Trace, Parser_Label, "config stack: " & Image (Config.Stack, Descriptor));
      end if;

      if Config.Current_Ops /= No_Insert_Delete then
         if Trace_McKenzie > Outline then
            Put_Line (Trace, Parser_Label, "Ada Language_Fixes: Config.Current_Ops /= No_Insert_Delete");
         end if;
         return;
      end if;

      case Config.Check_Status.Label is
      when Ok =>
         Handle_Parse_Error (Trace, Parser_Label, Parse_Table, Terminals, Local_Config_Heap, Config);

      when others =>
         Handle_Check_Fail (Trace, Lexer, Parser_Label, Terminals, Tree, Local_Config_Heap, Config);
      end case;
   end Language_Fixes;

   function Use_Minimal_Complete_Actions
     (Next_Token : in Token_ID;
      Config     : in Configuration)
     return Boolean
   is
      use all type SAL.Base_Peek_Type;
      Matching_Index : SAL.Peek_Type := 1;
   begin
      if Next_Token = Invalid_Token_ID then
         return False;
      end if;

      if Statement_Declaration_Start_IDs (Next_Token) then
         case Ada_Process_Actions.Token_Enum_ID'(-Next_Token) is
         when ELSE_ID | ELSIF_ID =>
            --  Check for missing 'if ... then'
            Find_ID (Config, +IF_ID, Matching_Index);
            return Matching_Index /= Config.Stack.Depth;

         when WHEN_ID =>
            Find_ID (Config, +CASE_ID, Matching_Index);
            return Matching_Index /= Config.Stack.Depth;

         when others =>
            return True;
         end case;
      else
         return False;
      end if;
   end Use_Minimal_Complete_Actions;

   function String_ID_Set
     (Descriptor        : in WisiToken.Descriptor;
      String_Literal_ID : in Token_ID)
     return Token_ID_Set
   is begin
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
