--  Abstract :
--
--  see spec.
--
--  Copyright (C) 2018 - 2022 Free Software Foundation, Inc.
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

with Ada_Annex_P_Process_Actions;
with WisiToken.Parse.LR.McKenzie_Recover.Base;
with WisiToken.Parse.LR.McKenzie_Recover.Parse;
package body WisiToken.Parse.LR.McKenzie_Recover.Ada is

   use Ada_Annex_P_Process_Actions; -- token names, To_Token_Enum
   use all type Syntax_Trees.In_Parse_Actions.Status_Label;

   Descriptor : WisiToken.Descriptor renames Ada_Annex_P_Process_Actions.Descriptor;

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
   --  single_task_declaration       IDENTIFIER                task_definition
   --  subprogram_body               subprogram_specification  name_opt
   --  task_body                     IDENTIFIER                identifier_opt
   --  task_type_declaration         IDENTIFIER                task_definition

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

   procedure Handle_In_Parse_Action_Fail
     (Super             : in out WisiToken.Parse.LR.McKenzie_Recover.Base.Supervisor;
      Shared_Parser     : in out Parser.Parser;
      Parser_Index      : in     SAL.Peek_Type;
      Local_Config_Heap : in out Config_Heaps.Heap_Type;
      Config            : in     Configuration)
   with Pre => Config.In_Parse_Action_Status.Label /= Ok
   is
      use Syntax_Trees;

      Tree         : Syntax_Trees.Tree renames Shared_Parser.Tree;
      Parse_Table  : WisiToken.Parse.LR.Parse_Table  renames Shared_Parser.Table.all;
      Parser_Label : constant Syntax_Trees.Stream_ID := Super.Stream (Parser_Index);

      procedure Put (Message : in String; Config : in Configuration)
      is begin
         Put (Message, Tree, Parser_Label, Config);
      end Put;

      End_Name_Token   : constant Recover_Token := Recover_Stacks.Peek
        (Config.Stack, Config.In_Parse_Action_Token_Count - Config.In_Parse_Action_Status.End_Name + 1).Token;
   begin
      --  There is a top level exception handler in McKenzie_Recover; the
      --  user has no way to work around an exception. If we are trying to
      --  fix a particular use case, the trace messages will be enough.

      case Config.In_Parse_Action_Status.Label is
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
         --  See test/ada_mode-recover_match_names.adb Package_Body_1 procedure A.
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
            End_Name : constant String := Tree.Lexer.Buffer_Text (Tree.Name (End_Name_Token));

            Matching_Name_Index : SAL.Peek_Type := 3; -- start search before <end_name_token>
         begin
            Find_Matching_Name (Config, Tree, End_Name, Matching_Name_Index, Case_Insensitive => True);

            if Matching_Name_Index = Config.Stack.Depth then
               --  case 0 or 2.

               if To_Token_Enum (Tree.Element_ID (Config.Error_Token)) in
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

                  New_Config.Error_Token := (True, Invalid_Token_ID, others => <>);

                  New_Config.In_Parse_Action_Status := (Label => Ok);

                  case To_Token_Enum (Tree.Element_ID (Config.Error_Token)) is
                  when block_statement_ID =>
                     Push_Back_Check
                       (Super, Shared_Parser, New_Config,
                        (+SEMICOLON_ID, +identifier_opt_ID, +END_ID),
                        Push_Back_Undo_Reduce => True);
                     Insert (Super, Shared_Parser, New_Config, +BEGIN_ID);

                  when entry_body_ID =>
                     Push_Back_Check
                       (Super, Shared_Parser, New_Config,
                        (+SEMICOLON_ID, +name_opt_ID, +END_ID, +handled_sequence_of_statements_ID),
                        Push_Back_Undo_Reduce => True);
                     Insert (Super, Shared_Parser, New_Config, +BEGIN_ID);

                  when loop_statement_ID =>
                     Push_Back_Check
                       (Super, Shared_Parser, New_Config,
                        (+SEMICOLON_ID, +identifier_opt_ID, +LOOP_ID, +END_ID),
                        Push_Back_Undo_Reduce => True);
                     Insert (Super, Shared_Parser, New_Config, +LOOP_ID);

                  when package_body_ID =>
                     Push_Back_Check
                       (Super, Shared_Parser, New_Config,
                        (+SEMICOLON_ID, +name_opt_ID, +END_ID),
                        Push_Back_Undo_Reduce => True);
                     if Tree.Element_ID (New_Config.Stack.Peek (1).Token) = +handled_sequence_of_statements_ID then
                        Push_Back_Check
                          (Super, Shared_Parser, New_Config,
                           (+handled_sequence_of_statements_ID, +BEGIN_ID),
                           Push_Back_Undo_Reduce => True);
                     end if;
                     Push_Back_Check
                       (Super, Shared_Parser, New_Config,
                        (1 => +declarative_part_ID),
                        Push_Back_Undo_Reduce => True);
                     Insert (Super, Shared_Parser, New_Config, (+PACKAGE_ID, +BODY_ID, +IDENTIFIER_ID, +IS_ID));

                  when package_specification_ID =>
                     --  ada_mode-recover_bad_char.adb
                     Push_Back_Check
                       (Super, Shared_Parser, New_Config,
                        (+name_opt_ID, +END_ID, +basic_declarative_item_list_ID),
                        Push_Back_Undo_Reduce => True);
                     if Tree.Element_ID (New_Config.Stack.Peek (1).Token) = +PRIVATE_ID then
                        Push_Back_Check
                          (Super, Shared_Parser, New_Config,
                           (+PRIVATE_ID, +basic_declarative_item_list_ID),
                           Push_Back_Undo_Reduce => True);
                     end if;
                     Insert (Super, Shared_Parser, New_Config, (+PACKAGE_ID, +IDENTIFIER_ID, +IS_ID));

                  when subprogram_body_ID =>
                     Push_Back_Check
                       (Super, Shared_Parser, New_Config,
                        (+SEMICOLON_ID, +name_opt_ID, +END_ID, +handled_sequence_of_statements_ID, +BEGIN_ID,
                         +declarative_part_ID),
                        Push_Back_Undo_Reduce => True);
                     Insert (Super, Shared_Parser, New_Config, (+PROCEDURE_ID, +IDENTIFIER_ID, +IS_ID));

                  when task_body_ID =>
                     Push_Back_Check
                       (Super, Shared_Parser, New_Config,
                        (+SEMICOLON_ID, +name_opt_ID, +END_ID, +handled_sequence_of_statements_ID),
                        Push_Back_Undo_Reduce => True);
                     Insert (Super, Shared_Parser, New_Config, +BEGIN_ID);

                  when others =>
                     if Trace_McKenzie > Outline then
                        Put ("Language_Fixes Match_Names_Error 2: unknown error token", Config);
                     end if;
                     return;
                  end case;

                  if Trace_McKenzie > Detail then
                     Put ("Language_Fixes Match_Names_Error 2 " &
                            Image (Tree.Element_ID (Config.Error_Token), Descriptor), New_Config);
                  end if;
                  Local_Config_Heap.Add (New_Config);
               exception
               when Invalid_Case =>
                  null;
               end;

            else
               --  Case 1.
               declare
                  New_Config : Configuration := Config;
               begin
                  New_Config.Error_Token := (True, Invalid_Token_ID, others => <>);
                  New_Config.In_Parse_Action_Status := (Label => Ok);

                  New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

                  Push_Back_Check
                    (Super, Shared_Parser, New_Config,
                     (+SEMICOLON_ID,
                      (case To_Token_Enum (Tree.Element_ID (Config.Error_Token)) is
                       when package_body_ID | package_specification_ID | subprogram_body_ID => +name_opt_ID,
                       when protected_type_declaration_ID | single_protected_declaration_ID => +protected_definition_ID,
                       when others =>  +identifier_opt_ID)),
                     Push_Back_Undo_Reduce => True);

                  if New_Config.Stack.Peek.Token.Virtual then
                     --  'end' is on top of stack, and is from a previous fix; don't mess
                     --  with that.
                     return;
                  end if;

                  Push_Back_Check (Super, Shared_Parser, New_Config, +END_ID, Push_Back_Undo_Reduce => True);

                  --  Minimal_Complete_Actions does not insert an optional name, but we
                  --  know we need one here.
                  Insert (Super, Shared_Parser, New_Config, (+END_ID, +IDENTIFIER_ID, +SEMICOLON_ID));

                  Local_Config_Heap.Add (New_Config);

                  if Trace_McKenzie > Detail then
                     Put
                       ("Language_Fixes Match_Names_Error 1 " & Image
                          (Tree.Element_ID (Config.Error_Token), Descriptor),
                        New_Config);
                  end if;
               exception
               when Invalid_Case =>
                  null;
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
         --  Missing_Name_*, ada_mode-recover_15.adb, ada_mode-recover_42.adb.
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

         if not Valid_Tree_Indices (Config.Stack, Config.In_Parse_Action_Token_Count) then
            --  The logic below depends on valid tree refs, not virtual tokens.

            return;
         end if;

         if No_Statements_Nonterm_IDs (Tree.Element_ID (Config.Error_Token)) then
            --  case 0b.
            --  test/ada_mode.ads
            return;
         end if;

         if Config.Stack.Depth < 4 or else
           Config.Stack.Peek (4).Token.Virtual or else
           not Is_Nonterminal (Tree.Element_ID (Config.Stack.Peek (4).Token), Tree.Lexer.Descriptor.all)
         then
            return;
         end if;

         if Invalid_Node_Access = Tree.Find_Child (Config.Stack.Peek (4).Token.Node, +EXCEPTION_ID) then
            --  'exception' not found; case 1a - assume extra 'end [keyword] ;'; delete it.
            declare
               use Recover_Op_Arrays;
               New_Config   : aliased Configuration := Config;
               Ops          : Recover_Op_Arrays.Vector renames New_Config.Ops;
               Stack        : Recover_Stacks.Stack renames New_Config.Stack;
               Keyword_Item : Recover_Stack_Item; -- keyword after 'end'; may not be present
            begin
               New_Config.Error_Token := (True, Invalid_Token_ID, others => <>);
               New_Config.In_Parse_Action_Status := (Label => Ok);

               --  This is a guess, and sometimes deleting the error keyword is better, so
               --  give it a cost.
               New_Config.Cost := New_Config.Cost + 1;

               New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

               case To_Token_Enum (Tree.Element_ID (Config.Error_Token)) is
               when block_statement_ID | package_body_ID | subprogram_body_ID | task_body_ID =>

                  Push_Back_Check
                    (Super, Shared_Parser, New_Config,
                     (+SEMICOLON_ID,
                      (if Tree.Element_ID (Config.Error_Token) in +block_statement_ID | +task_body_ID
                       then +identifier_opt_ID
                       else +name_opt_ID),
                      +END_ID),
                     Push_Back_Undo_Reduce => True);

                  if Undo_Reduce_Valid (Super, Shared_Parser, New_Config) then
                     if Tree.Element_ID (New_Config.Stack.Peek.Token) = +handled_sequence_of_statements_ID then
                        Undo_Reduce_Check
                          (Super, Shared_Parser, New_Config,
                           (+handled_sequence_of_statements_ID,
                            +sequence_of_statements_ID));
                     else
                        if Debug_Mode then
                           raise Bad_Config with "Language_Fixes unimplemented nonterm for Missing_Name_Error " &
                             Image (Tree.Element_ID (Config.Error_Token), Descriptor);
                        else
                           raise Invalid_Case;
                        end if;
                     end if;
                  else
                     raise Invalid_Case;
                  end if;

               when package_specification_ID =>
                  Push_Back_Check
                    (Super, Shared_Parser, New_Config,
                     (+SEMICOLON_ID, +name_opt_ID, +END_ID),
                     Push_Back_Undo_Reduce => True);
                  Undo_Reduce_Check
                    (Super, Shared_Parser, New_Config, +basic_declarative_item_list_ID);

               when loop_statement_ID =>
                  Keyword_Item := Stack.Peek (3);

                  Push_Back_Check
                    (Super, Shared_Parser, New_Config,
                     (+SEMICOLON_ID, +identifier_opt_ID, +LOOP_ID, +END_ID),
                        Push_Back_Undo_Reduce => True);

                  if Undo_Reduce_Valid (Super, Shared_Parser, New_Config) and then
                    Tree.Element_ID (New_Config.Stack.Peek.Token) = +handled_sequence_of_statements_ID
                  then
                     Undo_Reduce_Check
                       (Super, Shared_Parser, New_Config,
                        (+handled_sequence_of_statements_ID,
                         +sequence_of_statements_ID));
                  end if;
               when others =>
                  raise Bad_Config with "Language_Fixes unimplemented nonterm for Missing_Name_Error " &
                    Image (Tree.Element_ID (Config.Error_Token), Descriptor);
               end case;

               if not Has_Space (Ops, 3) then
                  raise Invalid_Case;
               end if;

               if Tree.Element_ID (Keyword_Item.Token) /= Invalid_Token_ID then
                  Delete_Check
                    (Super, Shared_Parser, New_Config, (+END_ID, Tree.Element_ID (Keyword_Item.Token), +SEMICOLON_ID));
               else
                  --  We don't need to delete the identifier|name ; it is missing and therefore empty.
                  Delete_Check (Super, Shared_Parser, New_Config, (+END_ID, +SEMICOLON_ID));
               end if;

               Local_Config_Heap.Add (New_Config);

               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes Missing_Name_Error 1a " & Image
                         (Tree.Element_ID (Config.Error_Token), Descriptor), New_Config);
               end if;
            exception
            when Invalid_Case =>
               null;
            end;

         else
            --  'exception' found; case 1b - assume missing 'begin'; insert it
            --  before 'handled_sequence_of_statements'
            declare
               New_Config : Configuration := Config;
            begin
               New_Config.Error_Token := (True, Invalid_Token_ID, others => <>);
               New_Config.In_Parse_Action_Status   := (Label => Ok);

               New_Config.Cost := New_Config.Cost + 1;

               New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

               Push_Back_Check
                 (Super, Shared_Parser, New_Config,
                  (+SEMICOLON_ID,
                   (if Tree.Element_ID (Config.Error_Token) = +block_statement_ID
                    then +identifier_opt_ID
                    else +name_opt_ID),
                   +END_ID, +handled_sequence_of_statements_ID),
                  Push_Back_Undo_Reduce => True);

               Insert (Super, Shared_Parser, New_Config, +BEGIN_ID);

               Local_Config_Heap.Add (New_Config);

               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes Missing_Name_Error 1b " & Image
                         (Tree.Element_ID (Config.Error_Token), Descriptor), New_Config);
               end if;
            exception
            when Invalid_Case =>
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
         --  test/ada_mode-recover_exception_1.adb. The solution is to insert
         --  'end' before the 'end', and let Minimal_Complete finish the block.
         --
         --  3. There is an extra 'begin', before the 'begin'. See
         --  test/ada_mode-recover_block_name_mismatch.adb
         --
         --  There is no reliable way to distinguish between the three cases, so we
         --  enqueue all solutions.
         --
         --  If there is more than one missing 'end', a later recover operation
         --  will fix the others.

         --  This case can handle Config.Error_Token.Virtual = True, and it
         --  doesn't use Tree.

         --  Case 1
         declare
            New_Config : Configuration := Config;
         begin
            New_Config.Error_Token := (True, Invalid_Token_ID, others => <>);
            New_Config.In_Parse_Action_Status   := (Label => Ok);

            New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

            --  Push_Back the failed reduce tokens.
            for I in 1 .. New_Config.In_Parse_Action_Token_Count loop
               Push_Back (Super, Shared_Parser, New_Config, Push_Back_Undo_Reduce => True);
            end loop;

            if New_Config.Stack.Depth <= 1 then
               --  ada_mode-partial_parse_indent_begin.adb
               raise Invalid_Case;
            end if;

            if To_Token_Enum (Tree.Element_ID (New_Config.Stack.Peek.Token)) /= sequence_of_statements_ID then
               Insert (Super, Shared_Parser, New_Config, (+NULL_ID, +SEMICOLON_ID));
               --  We don't need Undo_Reduce if sequence_of_statements is present;
               --  parser will handle that.
            end if;

            --  We know there is no name here.
            Insert (Super, Shared_Parser, New_Config, (+END_ID, +SEMICOLON_ID));

            Local_Config_Heap.Add (New_Config);

            if Trace_McKenzie > Detail then
               Put
                 ("Language_Fixes Extra_Name_Error 1 " & Image
                    (Tree.Element_ID (Config.Error_Token), Descriptor), New_Config);
            end if;
         exception
         when Invalid_Case =>
            null;
         end;

         --  Case 2
         declare
            New_Config : Configuration := Config;
         begin
            New_Config.Error_Token            := (True, Invalid_Token_ID, others => <>);
            New_Config.In_Parse_Action_Status := (Label                          => Ok);

            New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

            case To_Token_Enum (Tree.Element_ID (Config.Error_Token)) is
            when accept_statement_ID =>
               Push_Back_Check
                 (Super, Shared_Parser, New_Config,
                  (+SEMICOLON_ID, +identifier_opt_ID, +END_ID),
                  Push_Back_Undo_Reduce => True);

            when block_statement_ID =>
               Push_Back_Check
                 (Super, Shared_Parser, New_Config,
                  (+SEMICOLON_ID, +identifier_opt_ID, +END_ID),
                  Push_Back_Undo_Reduce => True);

            when loop_statement_ID =>
               Push_Back_Check
                 (Super, Shared_Parser, New_Config,
                  (+SEMICOLON_ID, +identifier_opt_ID, +LOOP_ID, +END_ID),
                  Push_Back_Undo_Reduce => True);

            when package_specification_ID | package_body_ID =>
               --  ada_mode-recover_string_quote_1.adb
               if Tree.Element_ID (New_Config.Stack.Peek.Token) = +SEMICOLON_ID then
                  --  ada_mode-recover_50.adb
                  Push_Back
                    (Super, Shared_Parser, New_Config,
                     Push_Back_Undo_Reduce => True);
               end if;

               Push_Back_Check
                 (Super, Shared_Parser, New_Config,
                  (+name_opt_ID, +END_ID),
                  Push_Back_Undo_Reduce => True);

            when protected_body_ID =>
               --  ada_mode-recover_50.adb
               if Tree.Element_ID (New_Config.Stack.Peek.Token) = +SEMICOLON_ID then
                  Push_Back
                    (Super, Shared_Parser, New_Config,
                     Push_Back_Undo_Reduce => True);
               end if;

               Push_Back_Check
                 (Super, Shared_Parser, New_Config,
                  (+identifier_opt_ID, +END_ID),
                  Push_Back_Undo_Reduce => True);

            when protected_type_declaration_ID | single_protected_declaration_ID | single_task_declaration_ID =>
               --  ada_mode-recover_50.adb
               Push_Back_Check (Super, Shared_Parser, New_Config, +SEMICOLON_ID, Push_Back_Undo_Reduce => True);

               case To_Token_Enum (Tree.Element_ID (New_Config.Stack.Peek.Token)) is
               when protected_definition_ID | task_definition_ID =>
                  raise Invalid_Case;

               when identifier_opt_ID =>
                  Push_Back_Check
                    (Super, Shared_Parser, New_Config,
                     (+identifier_opt_ID, +END_ID),
                     Push_Back_Undo_Reduce => True);

               when others =>
                  raise SAL.Programmer_Error with "code does not match grammar";
               end case;

            when subprogram_body_ID =>
               Push_Back_Check
                 (Super, Shared_Parser, New_Config,
                  (+SEMICOLON_ID, +name_opt_ID, +END_ID),
                  Push_Back_Undo_Reduce => True);

            when others =>
               raise Bad_Config with "Language_Fixes Extra_Name_Error 2: unrecognized Error_Token " &
                 Image (Tree.Element_ID (Config.Error_Token), Tree.Lexer.Descriptor.all);
            end case;

            --  We know there is no name here.
            Insert (Super, Shared_Parser, New_Config, (+END_ID, +SEMICOLON_ID));

            Local_Config_Heap.Add (New_Config);

            if Trace_McKenzie > Detail then
               Put
                 ("Language_Fixes Extra_Name_Error 2 " & Image
                    (Tree.Element_ID (Config.Error_Token), Descriptor), New_Config);
            end if;
         exception
         when Invalid_Case =>
            null;
         end;

         --  Case 3. Delete the extra begin
         --
         --  If the first begin was inserted by recovery, we actually want to
         --  delete the second begin. see test/ada_mode-recover_indent_4.adb
         declare
            New_Config     : aliased Configuration := Config;
            I              : SAL.Peek_Type := 1;
            First_Begin_I  : SAL.Peek_Type;
            Second_Begin_I : SAL.Peek_Type;
         begin
            loop
               if Tree.Element_ID (New_Config.Stack.Peek (I).Token) = +BEGIN_ID then
                  Second_Begin_I := I;
                  exit;
               end if;
               I := I + 1;
               if I >= New_Config.Stack.Depth then
                  raise Invalid_Case;
               end if;
            end loop;

            loop
               I := I + 1;
               if I >= New_Config.Stack.Depth then
                  raise Invalid_Case;
               end if;
               if Tree.Element_ID (New_Config.Stack.Peek (I).Token) = +BEGIN_ID then
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
                  Push_Back (Super, Shared_Parser, New_Config, Push_Back_Undo_Reduce => True);
               end loop;

               case To_Token_Enum (Tree.Element_ID (New_Config.Stack.Peek.Token)) is
               when COLON_ID =>
                  --  block label is present
                  Push_Back_Check
                    (Super, Shared_Parser, New_Config, (+COLON_ID, +statement_identifier_ID),
                     Push_Back_Undo_Reduce => True);

                  Delete_Check (Super, Shared_Parser, New_Config, (+IDENTIFIER_ID, +COLON_ID, +BEGIN_ID));

               when label_opt_ID =>
                  if Tree.Is_Empty_Nonterm (New_Config.Stack.Peek.Token) then
                     Undo_Reduce_Check (Super, Shared_Parser, New_Config, +label_opt_ID);
                  else
                     Undo_Reduce_Check (Super, Shared_Parser, New_Config, +label_opt_ID);
                     Push_Back_Check
                       (Super, Shared_Parser, New_Config, (+COLON_ID, +statement_identifier_ID),
                        Push_Back_Undo_Reduce => True);
                     Delete_Check (Super, Shared_Parser, New_Config, (+IDENTIFIER_ID, +COLON_ID, +BEGIN_ID));
                  end if;

               when others =>
                  Delete_Check (Super, Shared_Parser, New_Config, +BEGIN_ID);
               end case;

               if Undo_Reduce_Valid (Super, Shared_Parser, New_Config) then
                  Undo_Reduce_Check (Super, Shared_Parser, New_Config, +statement_statement_list_ID);
               elsif Push_Back_Valid (Super, Shared_Parser, New_Config, Push_Back_Undo_Reduce => True) then
                  Push_Back_Check (Super, Shared_Parser, New_Config, +statement_statement_list_ID,
                                   Push_Back_Undo_Reduce => True);
               else
                  raise Invalid_Case;
               end if;
               Local_Config_Heap.Add (New_Config);

               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes Extra_Name_Error 3a " &
                         Image (Tree.Element_ID (Config.Error_Token), Descriptor), New_Config);
               end if;
            else
               --  Delete the first begin. We assume it is in a subprogram body, so
               --  we don't need to adjust anything else.
               for I in 1 .. First_Begin_I loop
                  Push_Back (Super, Shared_Parser, New_Config, Push_Back_Undo_Reduce => True);
               end loop;

               Delete_Check (Super, Shared_Parser, New_Config, +BEGIN_ID);
               Local_Config_Heap.Add (New_Config);

               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes Extra_Name_Error 3b " &
                         Image (Tree.Element_ID (Config.Error_Token), Descriptor), New_Config);
               end if;
            end if;
         exception
         when Invalid_Case =>
            null;
         end;
      end case;
   exception
   when Bad_Config =>
      if Debug_Mode then
         raise;
      elsif Trace_McKenzie > Outline then
         Tree.Lexer.Trace.Put_Line ("Language_Fixes Handle_In_Parse_Action_Fail Bad_Config");
      end if;
   end Handle_In_Parse_Action_Fail;

   procedure Handle_Parse_Error
     (Super             : in out WisiToken.Parse.LR.McKenzie_Recover.Base.Supervisor;
      Shared_Parser     : in out Parser.Parser;
      Parser_Index      : in     SAL.Peek_Type;
      Local_Config_Heap : in out Config_Heaps.Heap_Type;
      Config            : in     Configuration)
   with Pre => Config.In_Parse_Action_Status.Label = Ok
   is
      use Syntax_Trees;

      Tree         : Syntax_Trees.Tree renames Shared_Parser.Tree;
      Parser_Label : constant Syntax_Trees.Stream_ID := Super.Stream (Parser_Index);

      procedure Put (Message : in String; Config : in Configuration)
      is begin
         Put (Message, Tree, Parser_Label, Config);
      end Put;
   begin
      if (Tree.Element_ID (Config.Error_Token) = +COLON_ID and
            (Tree.Element_ID (Config.Stack.Peek.Token) /= Invalid_Token_ID and then
               -Tree.Element_ID (Config.Stack.Peek.Token) in direct_name_ID | IDENTIFIER_ID)) and then
        Push_Back_Valid (Super, Shared_Parser, Config, Push_Back_Undo_Reduce => True)
      then
         --  Code looks like:
         --
         --  ... <variable_name> : [aliased constant] <subtype_indication> := <expression> ...
         --
         --  Assume the user copied a declaration with an initializer, and is
         --  converting it to an expression; see ada_mode-recover_02.adb,
         --  test/ada_mode-recover_constant_as_expression_1.adb. Delete
         --  '<variable_identifier> : [aliased constant] <subtype_indication>
         --  :='.
         --
         --  We cannot reliably search ahead in the unparsed tokens for ':=";
         --  <subtype_indication> can include a constraint with an arbitrarily
         --  complex expression. So we only handle the common case where the
         --  <subtype_indication> is a simple identifier or selected_component.
         --
         --  Note that if the user was converting to an assignment, there would
         --  not be a partial statement in progress before the <variable
         --  identifier>, and the error would be on 'constant', not ':'.
         --
         --  compare to "decl as statement"/"missing end"/"extra begin" case below.

         declare
            New_Config : aliased Configuration := Config;
            Peek_State : Peek_Sequential_State (New_Config.Input_Stream'Access);
         begin
            Push_Back (Super, Shared_Parser, New_Config, Push_Back_Undo_Reduce => True); -- variable_name

            Peek_State := Peek_Sequential_Start (Super, Shared_Parser, New_Config);

            Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +IDENTIFIER_ID);
            Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +COLON_ID);

            if Tree.ID (Peek_Sequential_Terminal (Peek_State)) = +ALIASED_ID then
               Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +ALIASED_ID);
            end if;

            if Tree.ID (Peek_Sequential_Terminal (Peek_State)) = +CONSTANT_ID then
               Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +CONSTANT_ID);
            end if;

            if Tree.ID (Peek_Sequential_Terminal (Peek_State)) = +NOT_ID then
               Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +NOT_ID);
            end if;

            if Tree.ID (Peek_Sequential_Terminal (Peek_State)) = +NULL_ID then
               Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +NULL_ID);
            end if;

            --  look for ':='
            loop
               exit when Peek_Sequential_Terminal (Peek_State) = Invalid_Node_Access;
               case To_Token_Enum (Tree.ID (Peek_Sequential_Terminal (Peek_State))) is
               when IDENTIFIER_ID =>
                  Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +IDENTIFIER_ID);

               when DOT_ID =>
                  Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +DOT_ID);

               when COLON_EQUAL_ID =>
                  Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +COLON_EQUAL_ID);
                  exit;

               when Wisi_EOI_ID =>
                  exit;

               when others =>
                  raise Invalid_Case;

               end case;
            end loop;

            New_Config.Cost := New_Config.Cost + 1;
            New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;
            Local_Config_Heap.Add (New_Config);
            if Trace_McKenzie > Detail then
               Put ("Language_Fixes variable decl as expression", New_Config);
            end if;
         exception
         when Invalid_Case =>
            null;
         end;

      elsif (To_Token_Enum (Tree.Element_ID (Config.Error_Token)) in ALIASED_ID | CONSTANT_ID | IDENTIFIER_ID and
               Tree.Element_ID (Config.Stack.Peek.Token) = +COLON_ID) and then
        Push_Back_Valid (Super, Shared_Parser, Config, Push_Back_Undo_Reduce => True)
      then
         --  Code looks like:
         --
         --  <statement> <variable_identifier> : [aliased constant] <subtype_indication> <expression> ...
         --
         --  The variable_name looks like a statement_identifier (ie block
         --  name). compare to "variable decl as expression" case above.
         --
         --  1) This is a copied variable declaration that the user is converting
         --  to an assignment. See
         --  test/ada_mode-recover_constant_as_statement_1.adb. Delete
         --  ': [aliased constant] <subtype_indication>'
         --
         --  We cannot reliably search ahead in the unparsed tokens for ':=";
         --  <subtype_indication> can include a constraint with an arbitrarily
         --  complex expression. So we only handle the common case where the
         --  <subtype_indication> is a simple identifier or selected_component.
         --
         --  2) There is a missing 'end;' before <variable_name>. See
         --  test/ada_mode-recover_25.adb. Push_Back + Minimal_Complete also
         --  handles this case, but we enqueue the same solution here at lower
         --  cost, so it can compete with the solution for cases 1 and 3.
         --
         --  3) There is an extra 'begin' before the <variable_name>. See
         --  test/ada_mode-recover_27.adb. Delete the 'begin'.
         --
         --  4) This is an incomplete object_declaration; let minimal_complete
         --  handle it. test/ada_mode-recover_38.adb.

         --  case 1
         declare
            New_Config : aliased Configuration := Config;
            Peek_State : Peek_Sequential_State (New_Config.Input_Stream'Access);
         begin
            Push_Back_Check (Super, Shared_Parser, New_Config, +COLON_ID, Push_Back_Undo_Reduce => True);

            Peek_State := Peek_Sequential_Start (Super, Shared_Parser, New_Config);

            Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +COLON_ID);

            if Tree.ID (Peek_Sequential_Terminal (Peek_State)) = +ALIASED_ID then
               Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +ALIASED_ID);
            end if;
            if Tree.ID (Peek_Sequential_Terminal (Peek_State)) = +CONSTANT_ID then
               Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +CONSTANT_ID);
            end if;
            if Tree.ID (Peek_Sequential_Terminal (Peek_State)) = +NOT_ID then
               Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +NOT_ID);
            end if;
            if Tree.ID (Peek_Sequential_Terminal (Peek_State)) = +NULL_ID then
               Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +NULL_ID);
            end if;

            --  look for and keep ':='
            loop
               exit when Peek_Sequential_Terminal (Peek_State) = Invalid_Node_Access;
               case To_Token_Enum (Tree.ID (Peek_Sequential_Terminal (Peek_State))) is
               when IDENTIFIER_ID =>
                  Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +IDENTIFIER_ID);

               when DOT_ID =>
                  Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +DOT_ID);

               when COLON_EQUAL_ID | Wisi_EOI_ID =>
                  exit;

               when others =>
                  raise Invalid_Case;

               end case;
            end loop;

            New_Config.Cost := New_Config.Cost + 1;
            New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;
            Local_Config_Heap.Add (New_Config);
            if Trace_McKenzie > Detail then
               Put ("Language_Fixes constant decl as statement 1", New_Config);
            end if;
         exception
         when Invalid_Case =>
            null;
         end;

         declare
            New_Config_1 : Configuration := Config;
         begin
            --  ada_mode-recover_38.adb, ada_mode-recover_46.adb
            Push_Back_Check (Super, Shared_Parser, New_Config_1, +COLON_ID, Push_Back_Undo_Reduce => True);
            Push_Back_Check
              (Super, Shared_Parser, New_Config_1,
               Tree.Element_ID (New_Config_1.Stack.Peek.Token),
               Push_Back_Undo_Reduce => True);

            if Tree.Element_ID (New_Config_1.Stack.Peek.Token) = +sequence_of_statements_ID then
               --  Case 2
               null;

            elsif Tree.Element_ID (New_Config_1.Stack.Peek.Token) = +BEGIN_ID then
               --  Case 2 or 3
               declare
                  New_Config_2 : Configuration := New_Config_1;
               begin
                  if Push_Back_Valid (Super, Shared_Parser, New_Config_1, Push_Back_Undo_Reduce => True) then
                     Push_Back_Check (Super, Shared_Parser, New_Config_2, +BEGIN_ID, Push_Back_Undo_Reduce => True);
                     Delete_Check (Super, Shared_Parser, New_Config_2, +BEGIN_ID);
                     if Undo_Reduce_Valid (Super, Shared_Parser, New_Config_2) then
                        if Tree.Element_ID (New_Config_2.Stack.Peek.Token) = +declarative_part_ID then
                           Undo_Reduce_Check (Super, Shared_Parser, New_Config_2, +declarative_part_ID);
                        end if;
                     end if;

                     --  This is a guess, so add a cost, equal to case 1, 2.
                     New_Config_2.Cost := New_Config_2.Cost + 1;
                     New_Config_2.Strategy_Counts (Language_Fix) := New_Config_2.Strategy_Counts (Language_Fix) + 1;
                     Local_Config_Heap.Add (New_Config_2);

                     if Trace_McKenzie > Detail then
                        Put ("Language_Fixes constant decl as statement 3", New_Config_2);
                     end if;
                  end if;
               end;

               Insert (Super, Shared_Parser, New_Config_1, (+NULL_ID, +SEMICOLON_ID));
            end if;

            --  If we don't insert the ';' here, <variable_name> looks like a
            --  block end name.
            Insert (Super, Shared_Parser, New_Config_1, (+END_ID, +SEMICOLON_ID));

            --  This is a guess, so add a cost, equal to case 1.
            New_Config_1.Cost := New_Config_1.Cost + 1;
            New_Config_1.Strategy_Counts (Language_Fix) := New_Config_1.Strategy_Counts (Language_Fix) + 1;
            Local_Config_Heap.Add (New_Config_1);

            if Trace_McKenzie > Detail then
               Put ("Language_Fixes constant decl as statement 2", New_Config_1);
            end if;
         exception
         when Invalid_Case =>
            null;
         end;

      elsif Tree.Element_ID (Config.Error_Token) = +DOT_ID then
         --  We've encountered a selected_component when we were expecting a
         --  simple IDENTIFIER. If the selected_component is preceded by 'end',
         --  then this is similar to a semantic check Extra_Name_Error, and the
         --  solutions are similar.

         if To_Token_Enum (Tree.Element_ID (Config.Stack.Peek.Token)) in IDENTIFIER_ID | identifier_opt_ID and
           Tree.Element_ID (Config.Stack.Peek (2).Token) = +END_ID
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
            --  test_mckenzie_recover Match_Selected_Component_1. 'declare ...' is
            --  _not_ present on the second begin (because it is part of the
            --  syntax for <begin_name_token_1>). The solution is to insert 'end
            --  ;' before the second 'begin'.
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
            begin
               New_Config_1.Error_Token := (True, Invalid_Token_ID, others => <>);

               New_Config_1.Strategy_Counts (Language_Fix) := New_Config_1.Strategy_Counts (Language_Fix) + 1;

               Push_Back_Check
                 (Super, Shared_Parser, New_Config_1, (Tree.Element_ID (Config.Stack.Peek.Token), +END_ID),
                  Push_Back_Undo_Reduce => True);

               if New_Config_1.Stack.Depth <= 3 then
                  raise Invalid_Case;
               end if;

               if Tree.Element_ID (New_Config_1.Stack.Peek (3).Token) = +declarative_part_ID then
                  --  'declare' is present; case 2
                  Insert (Super, Shared_Parser, New_Config_1, (+END_ID, +IDENTIFIER_ID, +SEMICOLON_ID));
                  Local_Config_Heap.Add (New_Config_1);
               else
                  --  no 'declare'; either case 1 or 2, so enqueue both

                  declare
                     New_Config_2 : Configuration := New_Config_1;
                  begin
                     case To_Token_Enum (Tree.Element_ID (New_Config_2.Stack.Peek.Token)) is
                     when handled_sequence_of_statements_ID |
                       sequence_of_statements_ID => --  see test/ada_mode-recover_partial_24.adb
                        Push_Back_Check
                          (Super, Shared_Parser, New_Config_2,
                           (+handled_sequence_of_statements_ID, +BEGIN_ID, +label_opt_ID),
                           Push_Back_Undo_Reduce => True);

                     when protected_operation_item_list_ID =>
                        --  ada_mode-recover_protected_01.adb
                        --  Can't be case 2.
                        raise Invalid_Case;

                     when others =>
                        raise Bad_Config with "Language_Fixes " & Label & " unimplemented case " & Image
                          (Tree.Element_ID (New_Config_2.Stack.Peek.Token), Descriptor);
                     end case;

                     Insert (Super, Shared_Parser, New_Config_2, (+END_ID, +IDENTIFIER_ID, +SEMICOLON_ID));

                     Local_Config_Heap.Add (New_Config_2);
                     if Trace_McKenzie > Detail then
                        Put ("Language_Fixes " & Label, New_Config_2);
                     end if;
                  exception
                  when Invalid_Case =>
                     null;
                  end;

                  Insert (Super, Shared_Parser, New_Config_1, (+END_ID, +IDENTIFIER_ID, +SEMICOLON_ID));

                  Local_Config_Heap.Add (New_Config_1);
               end if;

               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes " & Label, New_Config_1);

               end if;
            exception
            when Invalid_Case =>
               null;
            end;
         end if;

      elsif To_Token_Enum (Tree.Element_ID (Config.Error_Token)) in
        IDENTIFIER_ID | CASE_ID | IF_ID | LOOP_ID | RECORD_ID | RETURN_ID | SELECT_ID | name_opt_ID and
        Tree.Element_ID (Config.Stack.Peek.Token) = +END_ID
      then
         --  We've encountered a token after 'end' when expecting a
         --  different token. See test/ada_mode-recover_17, _20, _24, _26, _39.adb.
         --
         --  There are several cases:
         --
         --  a: There is a missing 'end <compound_statement_id> ;' before the
         --  'end'. We can get the ID to insert from Parse_Table
         --  Minimal_Complete_Actions.
         --
         --  b: If the error token is IDENTIFIER or name_opt, and there is not
         --  a matching name, the error token should be something else; delete
         --  it.
         --
         --  If there is a matching name, Minimal_Complete_Actions inserts
         --  '<compound_statement_id> ;'. We want to insert 'end
         --  <id> ;' before the existing 'end', so Insert_After places the
         --  tokens better; see test/ada_mode-recover_17, _20.adb.
         --
         --  c: There is a missing 'end <name>;' before the 'end'
         --
         --  d: There is a missing matching component_statement start
         --
         --  We can't reliably distinguish between a: and b:, so we do both. c:
         --  is distinguished by the minimal action being 'reduce to name'. d:
         --  is distinguished by searching for an open matching
         --  component_statement start.

         declare
            procedure Insert_End_Token_Semi (Label : in String; New_Config : in out Configuration)
            is
               End_ID_Actions : constant Minimal_Action_Arrays.Vector := Shared_Parser.Table.States
                 (Config.Stack.Peek.State).Minimal_Complete_Actions;
            begin
               if End_ID_Actions.Length /= 1 then
                  --  FIXME: do all actions? need a test case
                  raise Bad_Config with "Language_Fixes Insert_End_Token_Semi multiple actions";

               else
                  New_Config.Error_Token := (True, Invalid_Token_ID, others => <>);

                  New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

                  Push_Back_Check (Super, Shared_Parser, New_Config, +END_ID, Push_Back_Undo_Reduce => True);

                  case End_ID_Actions (End_ID_Actions.First_Index).Verb is
                  when Shift =>
                     --  case a or b

                     --  Inserting the end keyword and semicolon here avoids the costs added by
                     --  Insert_Minimal_Complete_Actions.
                     Insert
                       (Super, Shared_Parser, New_Config,
                        (+END_ID, End_ID_Actions (End_ID_Actions.First_Index).ID, +SEMICOLON_ID));

                     Local_Config_Heap.Add (New_Config);
                     if Trace_McKenzie > Detail then
                        Put ("Language_Fixes " & "wrong end keyword a", New_Config);
                     end if;

                  when Reduce =>
                     --  case c: ada_mode-recover_39.adb.
                     Insert (Super, Shared_Parser, New_Config, (+END_ID, +IDENTIFIER_ID, +SEMICOLON_ID));

                     Local_Config_Heap.Add (New_Config);
                     if Trace_McKenzie > Detail then
                        Put ("Language_Fixes " & Label, New_Config);
                     end if;
                  end case;
               end if;
            end Insert_End_Token_Semi;
         begin
            if not (To_Token_Enum (Tree.Element_ID (Config.Error_Token)) in IDENTIFIER_ID | name_opt_ID) then
               --  First exclude case b
               declare
                  New_Config     : aliased Configuration := Config;
                  Error_Token_ID : constant Token_ID     := Tree.Element_ID (New_Config.Error_Token);
                  Found          : constant Boolean      := Find_ID (Tree, New_Config, Error_Token_ID);
               begin
                  if not Found then
                     --  case d. ada_mode-recover_extra_end_loop.adb
                     New_Config.Error_Token := (True, Invalid_Token_ID, others => <>);

                     New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

                     --  We could push_back 'end' and insert a matching start, but it's
                     --  simpler to delete 'end <keyword> ;'
                     Push_Back (Super, Shared_Parser, New_Config, Push_Back_Undo_Reduce => True); -- END_ID
                     declare
                        Peek_State : Peek_Sequential_State := Peek_Sequential_Start (Super, Shared_Parser, New_Config);
                     begin
                        Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +END_ID);
                        Delete_Check (Super, Shared_Parser, New_Config, Peek_State, Error_Token_ID);
                        if +SEMICOLON_ID = Tree.ID
                          (WisiToken.Parse.LR.McKenzie_Recover.Parse.Peek_Current_First_Sequential_Terminal
                             (Super, Shared_Parser, Config))
                        then
                           --  Might not be there while typing code; ada_mode-interactive_09.adb
                           Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +SEMICOLON_ID);
                        end if;
                     end;
                     Local_Config_Heap.Add (New_Config);
                     if Trace_McKenzie > Detail then
                        Put ("Language_Fixes wrong end name", New_Config);
                     end if;

                  else
                     Insert_End_Token_Semi ("wrong end keyword c", New_Config);

                  end if;
               exception
               when Invalid_Case =>
                  null;
               end;
            end if;

            --  Now try case b.
            if Tree.Element_ID (Config.Error_Token) in +IDENTIFIER_ID | +name_opt_ID then
               declare
                  New_Config : aliased Configuration := Config;

                  function Get_End_Name return String
                  is
                     use Standard.Ada.Strings.Unbounded;
                     Result : Unbounded_String := +Tree.Lexer.Buffer_Text
                       (Tree.Byte_Region (New_Config.Error_Token));
                  begin
                     if Tree.Element_Is_Terminal (New_Config.Error_Token) then
                        declare
                           Peek_State : Peek_Sequential_State := Peek_Sequential_Start
                             (Super, Shared_Parser, New_Config);
                        begin
                           loop
                              Peek_Next_Sequential_Terminal (Tree, Peek_State);
                              exit when Peek_Sequential_Terminal (Peek_State) = Invalid_Node_Access;
                              exit when -Tree.ID (Peek_Sequential_Terminal (Peek_State)) not in
                                IDENTIFIER_ID | DOT_ID;
                              Result := Result & Tree.Lexer.Buffer_Text
                                (Tree.Byte_Region
                                   (Peek_Sequential_Terminal (Peek_State), Trailing_Non_Grammar => False));
                           end loop;
                        end;
                     end if;
                     return -Result;
                  end Get_End_Name;

                  End_Name            : constant String := Get_End_Name;
                  Matching_Name_Index : SAL.Peek_Type   := 2; -- start search before 'end'

               begin
                  Find_Matching_Name
                    (New_Config, Tree, End_Name, Matching_Name_Index, Case_Insensitive => True);

                  if Matching_Name_Index < New_Config.Stack.Depth then
                     --  Matching name found; insert 'end ... ;' before the
                     --  existing 'end'.
                     Insert_End_Token_Semi ("wrong end keyword b 1", New_Config);

                  else
                     declare
                        Label : constant String := "wrong end keyword b 2";
                     begin
                        --  Matching name not found: delete Error_Token
                        New_Config.Strategy_Counts (Language_Fix) := @ + 1;

                        Delete_Check (Super, Shared_Parser, New_Config, Invalid_Token_ID);

                        New_Config.Error_Token := (True, Invalid_Token_ID, others => <>);

                        Local_Config_Heap.Add (New_Config);
                        if Trace_McKenzie > Detail then
                           Put ("Language_Fixes " & Label, New_Config);
                        end if;
                     end;
                  end if;
               exception
               when Invalid_Case =>
                  null;
               end;
            end if;
         end;

      elsif To_Token_Enum (Tree.Element_ID (Config.Error_Token)) in PRAGMA_ID | USE_ID and
        Tree.Element_ID (Config.Stack.Peek.Token) = +BEGIN_ID
      then
         --  Code looks like:
         --
         --  a) <subprogram|package start> is ... begin use <name>;
         --  b) <subprogram|package start> is ... begin pragma ...
         --
         --  There is an extra 'begin' before 'use' or 'pragma'. See
         --  test/ada_mode-recover_14.adb. Delete the 'begin'.

         if Push_Back_Valid (Super, Shared_Parser, Config, Push_Back_Undo_Reduce => True) then
            declare
               New_Config : Configuration := Config;
            begin
               New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

               Push_Back_Check (Super, Shared_Parser, New_Config, +BEGIN_ID, Push_Back_Undo_Reduce => True);

               if Tree.Element_ID (New_Config.Stack.Peek.Token) = +declarative_part_ID then
                  if Undo_Reduce_Valid (Super, Shared_Parser, New_Config) then
                     Undo_Reduce_Check (Super, Shared_Parser, New_Config, +declarative_part_ID);
                  else
                     raise Invalid_Case;
                  end if;
               end if;
               Delete_Check (Super, Shared_Parser, New_Config, +BEGIN_ID);

               Local_Config_Heap.Add (New_Config);

               if Trace_McKenzie > Detail then
                  Put ("Language_Fixes extra begin 2", New_Config);
               end if;
            exception
            when Invalid_Case =>
               null;
            end;
         end if;

      elsif Tree.Element_ID (Config.Error_Token) = +OR_ID and then
        Tree.Element_ID (Config.Stack.Peek.Token) = +expression_ID
      then
         --  Code looks like:
         --
         --  expr1 and expr2 or expr3
         --
         --  where 'expr1 and expr2' is in the expression on the stack. Missing
         --  left paren before expr1. See test/ada_mode-recover_20.adb.
         --
         --  We could check for the presence of 'and' in expression, but
         --  that requires a syntax tree. If the left paren doesn't help, this
         --  config will be dropped.

         declare
            New_Config : Configuration := Config;
         begin
            New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

            Push_Back_Check (Super, Shared_Parser, New_Config, +expression_ID, Push_Back_Undo_Reduce => True);

            Insert (Super, Shared_Parser, New_Config, +LEFT_PAREN_ID);
            --  Minimal_Complete will add the matching right paren.

            Local_Config_Heap.Add (New_Config);
            if Trace_McKenzie > Detail then
               Put ("Language_Fixes and/or", New_Config);
            end if;
         exception
         when Invalid_Case =>
            null;
         end;

      elsif Tree.Element_ID (Config.Error_Token) = +TICK_1_ID and Config.Error_Token.Virtual = False then
         --  Maybe editing "Put ('|');" => "Put ('|-');"; need to change ' to ".
         --  ada_mode-recover_string_quote_6.adb is not doing this.

         declare
            New_Config : aliased Configuration := Config;
            Token_Count : Integer := 0;
         begin
            New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

            declare
               Peek_State : Peek_Sequential_State := Peek_Sequential_Start (Super, Shared_Parser, New_Config);
               pragma Assert
                 (Tree.Element_ID (New_Config.Error_Token) = Tree.ID (Peek_Sequential_Terminal (Peek_State)));
            begin
               Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +TICK_1_ID); -- increments Peek_State
               loop
                  Delete_Check (Super, Shared_Parser, New_Config, Peek_State, Invalid_Token_ID);
                  Token_Count := @ + 1;
                  if Peek_Sequential_Terminal (Peek_State) = Invalid_Node_Access or
                     --  ada_mode-interactive_01.adb, ada_mode-recover_string_quote_6.adb
                    Token_Count > 9
                  then
                     raise Invalid_Case;
                  end if;
                  exit when Tree.ID (Peek_Sequential_Terminal (Peek_State)) = +TICK_1_ID;
               end loop;
               Delete_Check (Super, Shared_Parser, New_Config, Peek_State, +TICK_1_ID);
               Insert (Super, Shared_Parser, New_Config, Peek_Sequential_Terminal (Peek_State), +STRING_LITERAL_ID);
            end;
            Local_Config_Heap.Add (New_Config);
            if Trace_McKenzie > Detail then
               Put ("Language_Fixes char_literal to string", New_Config);
            end if;
         exception
         when Invalid_Case =>
            null;
         end;

      elsif Tree.Element_ID (Config.Error_Token) = +IN_ID and then
        (Tree.Element_ID (Config.Stack.Peek.Token) = +COLON_ID and
           Tree.Element_ID (Config.Stack.Peek (2).Token) = +defining_identifier_list_ID)
      then
         --  See test/ada_mode-recover_partial_03.adb.
         --  Code looks like:
         --
         --  is Node : in Valid_Node_Index)
         --
         --  error on "in"; missing 'procedure IDENTIFIER (' before 'Node'
         declare
            New_Config : Configuration := Config;
         begin
            New_Config.Strategy_Counts (Language_Fix) := New_Config.Strategy_Counts (Language_Fix) + 1;

            Push_Back_Check
              (Super, Shared_Parser, New_Config, (+COLON_ID, +defining_identifier_list_ID),
               Push_Back_Undo_Reduce => True);

            --  We could search ahead for 'return', but that's not simple; let
            --  recover handle it.
            Insert (Super, Shared_Parser, New_Config, (+PROCEDURE_ID, +IDENTIFIER_ID, +LEFT_PAREN_ID));

            Local_Config_Heap.Add (New_Config);
            if Trace_McKenzie > Detail then
               Put ("Language_Fixes exposed argument list", New_Config);
            end if;
         exception
         when Invalid_Case =>
            null;
         end;

      end if;
   exception
   when Bad_Config =>
      if Debug_Mode then
         raise;
      elsif Trace_McKenzie > Outline then
         Tree.Lexer.Trace.Put_Line ("Language_Fixes Handle_Parse_Error Bad_Config");
      end if;
   end Handle_Parse_Error;

   ----------
   --  Public subprograms

   procedure Language_Fixes
     (Super             : in out WisiToken.Parse.LR.McKenzie_Recover.Base.Supervisor;
      Shared_Parser     : in out Parser.Parser;
      Parser_Index      : in     SAL.Peek_Type;
      Local_Config_Heap : in out Config_Heaps.Heap_Type;
      Config            : in     Configuration)
   is begin
      if Trace_McKenzie > Extra then
         Put ("Language_Fixes", Shared_Parser.Tree, Super.Stream (Parser_Index), Config);
         Put_Line (Shared_Parser.Tree, Super.Stream (Parser_Index),
                   "config stack: " & Image (Config.Stack, Shared_Parser.Tree));
      end if;

      case Config.In_Parse_Action_Status.Label is
      when Ok =>
         Handle_Parse_Error (Super, Shared_Parser, Parser_Index, Local_Config_Heap, Config);

      when others =>
         Handle_In_Parse_Action_Fail (Super, Shared_Parser, Parser_Index, Local_Config_Heap, Config);
      end case;
   end Language_Fixes;

   procedure Matching_Begin_Tokens
     (Super                   :         in out WisiToken.Parse.LR.McKenzie_Recover.Base.Supervisor;
      Shared_Parser           :         in out Parser.Parser;
      Tokens                  :         in     Token_ID_Array_1_3;
      Config                  : aliased in     Configuration;
      Matching_Tokens         :         in out Token_ID_Arrays.Vector;
      Forbid_Minimal_Complete :         in out Boolean)
   is
      use Token_ID_Arrays;

      Tree : Syntax_Trees.Tree renames Shared_Parser.Tree;

      function Matching_Begin_For_End return Token_ID_Arrays.Vector
      is
         Next_Index : constant Positive := 2;
      begin
         return Result : Token_ID_Arrays.Vector do
            if Tokens (Next_Index) = Invalid_Token_ID then
               --  Better to delete 'end'
               Result := Empty_Vector;
            else
               case To_Token_Enum (Tokens (Next_Index)) is
               when CASE_ID | IF_ID | LOOP_ID | RETURN_ID | SELECT_ID =>
                  Result := To_Vector (Tokens (Next_Index));

               when IDENTIFIER_ID =>
                  --  Check for existing 'begin' with matching name. ada_mode-recover_03.adb
                  declare
                     function Get_End_Name return String
                     is
                        use Standard.Ada.Strings.Unbounded;
                        use Syntax_Trees;
                        Result : Unbounded_String;

                        Peek_State : Peek_Sequential_State := Peek_Sequential_Start (Super, Shared_Parser, Config);
                     begin
                        loop
                           Peek_Next_Sequential_Terminal (Tree, Peek_State);
                           exit when Peek_Sequential_Terminal (Peek_State) = Invalid_Node_Access;
                           exit when -Tree.ID (Peek_Sequential_Terminal (Peek_State)) not in
                             IDENTIFIER_ID | DOT_ID;
                           Result := Result & Tree.Lexer.Buffer_Text
                             (Tree.Byte_Region (Peek_Sequential_Terminal (Peek_State), Trailing_Non_Grammar => False));
                        end loop;
                        return -Result;
                     end Get_End_Name;

                     End_Name            : constant String := Get_End_Name;
                     Matching_Name_Index : SAL.Peek_Type   := 1;
                  begin
                     Find_Matching_Name
                       (Config, Tree, End_Name, Matching_Name_Index, Case_Insensitive => True);

                     if Matching_Name_Index < Config.Stack.Depth then
                        --  Matching name found; let minimal_complete handle it.
                        null;

                     elsif Tokens (Next_Index + 1) /= Invalid_Token_ID and then
                       To_Token_Enum (Tokens (Next_Index + 1)) = DOT_ID
                     then
                        Result := To_Vector ((+PACKAGE_ID, +BODY_ID, +IDENTIFIER_ID, +IS_ID)); --  package body
                     else
                        Result := To_Vector ((+IDENTIFIER_ID, +COLON_ID, +BEGIN_ID)); -- named block begin
                     end if;
                  end;

               when SEMICOLON_ID =>
                  Result := To_Vector (+BEGIN_ID);

               when others =>
                  null;
               end case;
            end if;
         end return;
      end Matching_Begin_For_End;

   begin
      Forbid_Minimal_Complete := False;

      case To_Token_Enum (Tokens (1)) is
      --  Token_Enum_ID alphabetical order
      when COMMA_ID =>
         --  Commas always occur in parens; if no left paren on stack, insert
         --  one. Also start an expression before the comma.
         --  ada_mode-recover_39.adb
         Forbid_Minimal_Complete := True;

         if Stack_Has (Tree, Config.Stack, +LEFT_PAREN_ID) then
            Matching_Tokens := To_Vector (+IDENTIFIER_ID);
         else
            Matching_Tokens := To_Vector ((+IDENTIFIER_ID, +LEFT_PAREN_ID, +IDENTIFIER_ID));
         end if;

      when END_ID =>
         if Config.Stack.Depth = 1 then
            --  ada_mode-partial_parse.adb
            return;
         end if;

         case To_Token_Enum (Tree.Element_ID (Config.Stack.Peek.Token)) is
         when
           ABORT_ID | -- asynchronous_select
           BEGIN_ID | -- ada_mode-recover_indent_3.adb
           DO_ID | -- return_statement, accept_statement
           ELSE_ID | -- if_statement, select_statement, conditional_entry_call
           THEN_ID =>
            --  Empty sequence_of_statements. This can be handled by
            --  minimal_complete, but we want to prevent Matching_Begin_For_End,
            --  and we know what to insert.
            Matching_Tokens := To_Vector ((+NULL_ID, +SEMICOLON_ID));
            Forbid_Minimal_Complete := True;

         when LOOP_ID =>
            if To_Token_Enum (Tree.Element_ID (Config.Stack.Peek (2).Token)) = END_ID then
               --  Let minimal_complete insert the semicolon.
               return;
            else
               --  empty sequence of statements.
               Matching_Tokens := To_Vector ((+NULL_ID, +SEMICOLON_ID));
               Forbid_Minimal_Complete := True;
            end if;

         when
           AND_ID | -- parallel_block_statement or expression
           IS_ID | -- variant_part,package_spec, *_body, case_statement ...
           OR_ID | -- timed_entry_call, expression
           PRIVATE_ID | --  package_specification, protected_definition, task_item_list
           RECORD_ID -- record_representation_clause or record_defition
           =>
            --  We don't know what to insert; let minimal_complete handle it.
            return;

         when others =>
            Matching_Tokens := Matching_Begin_For_End;
         end case;

      when ELSE_ID | ELSIF_ID =>
         if Tree.Element_ID (Config.Stack.Peek.Token) = +THEN_ID then
            --  Empty sequence_of_statements in 'if then else'; ada_mode-recover_27.adb
            Matching_Tokens := To_Vector ((+NULL_ID, +SEMICOLON_ID));
            Forbid_Minimal_Complete := True;
         else
            --  ada_mode-recover_40.adb
            Matching_Tokens := To_Vector ((+IF_ID, +IDENTIFIER_ID, +THEN_ID, +NULL_ID, +SEMICOLON_ID));
         end if;

      when THEN_ID =>
         if Tree.Element_ID (Config.Stack.Peek.Token) = +IF_ID then
            --  Empty expression in 'if then'
            Matching_Tokens := To_Vector (+IDENTIFIER_ID);
            Forbid_Minimal_Complete := True;
         else
            Matching_Tokens := To_Vector ((+IF_ID, +IDENTIFIER_ID));
         end if;

      when EXCEPTION_ID =>
         if Tree.Element_ID (Config.Stack.Peek.Token) = +BEGIN_ID then
            --  Empty sequence_of_statements
            Matching_Tokens := To_Vector ((+NULL_ID, +SEMICOLON_ID));
            Forbid_Minimal_Complete := True;
         else
            Matching_Tokens := To_Vector (+BEGIN_ID);
         end if;
         --  We don't return LEFT_PAREN for RIGHT_PAREN; better to delete it.

      when WHEN_ID =>
         if Tree.Element_ID (Config.Stack.Peek.Token) = +EQUAL_GREATER_ID then
            --  Empty sequence_of_statements
            Matching_Tokens := To_Vector ((+NULL_ID, +SEMICOLON_ID));
            Forbid_Minimal_Complete := True;
         else
            Matching_Tokens := To_Vector ((+CASE_ID, +IDENTIFIER_ID, +IS_ID));
         end if;

      when others =>
         null;
      end case;

      if not Forbid_Minimal_Complete then
         if Tree.Element_ID (Config.Stack.Peek.Token) = +END_ID and
           ((Tokens (1) = +IDENTIFIER_ID and
               (Tokens (2) /= Invalid_Token_ID and then
                  -Tokens (2) in DOT_ID | SEMICOLON_ID)) or
              End_Keyword_IDs (Tokens (1)))
         then
            Forbid_Minimal_Complete := True;

         else
            Forbid_Minimal_Complete := False;
         end if;
      end if;
   end Matching_Begin_Tokens;

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
         Result (+simple_expression_ID) := True;
         Result (+relation_ID)          := True;
         Result (+expression_ID)        := True;
      end return;
   end String_ID_Set;

end WisiToken.Parse.LR.McKenzie_Recover.Ada;
--  Local Variables:
--  ada-case-strict: nil
--  End:
