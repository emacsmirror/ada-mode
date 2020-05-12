--  Abstract :
--
--  Support Emacs Ada mode and gpr-query minor mode queries about
--  GNAT projects and cross reference data
--
--  Copyright (C) 2014 - 2020 Free Software Foundation All Rights Reserved.
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

with Ada.Characters.Handling;
with Ada.Command_Line;
with Ada.Directories;
with Ada.Environment_Variables;
with Ada.Exceptions.Traceback;
with Ada.IO_Exceptions;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;
with Ada.Text_IO;
with GNAT.Command_Line;
with GNAT.Directory_Operations;
with GNAT.OS_Lib;
with GNAT.Strings;
with GNAT.Traceback.Symbolic;
with GNATCOLL.Arg_Lists;
with GNATCOLL.Paragraph_Filling;
with GNATCOLL.Projects;
with GNATCOLL.SQL.Sqlite;
with GNATCOLL.Traces;
with GNATCOLL.Utils;
with GNATCOLL.VFS;
with GNATCOLL.VFS_Utils;
with GNATCOLL.Xref;
procedure Gpr_Query is
   use all type GNATCOLL.VFS.File_Array;
   use GNATCOLL;

   Version : constant String := "3";
   --  Changes once per release when the API (commands and responses)
   --  changes; must match gpr-query.el gpr-query-protocol-version

   Me : constant GNATCOLL.Traces.Trace_Handle := GNATCOLL.Traces.Create ("gpr_query");

   Db_Error        : exception;
   Invalid_Command : exception;

   function "+" (Item : in Ada.Strings.Unbounded.Unbounded_String) return String
     renames Ada.Strings.Unbounded.To_String;

   function "+" (Item : in String) return Ada.Strings.Unbounded.Unbounded_String
     renames Ada.Strings.Unbounded.To_Unbounded_String;

   function "+" (Item : in GNATCOLL.VFS.Filesystem_String) return String
   is begin
      return String (Item);
   end "+";

   procedure Process_Line (Line : String);
   --  Process a full line of commands.
   --  Raise Invalid_Command when the command is invalid.

   function Get_Entity (Arg : String) return GNATCOLL.Xref.Entity_Information;
   --  Return the entity matching the "name:file:line[:column]" argument

   type My_Xref_Database is new GNATCOLL.Xref.Xref_Database with null record;
   --  Derived so we can override Image to output full paths

   Short_File_Names : Boolean; -- set by each command that calls Image
   --  Full_File_Names_Arg : constant String := "full_file_names";
   Short_File_Names_Arg : constant String := "short_file_names";

   overriding function Image (Self : My_Xref_Database; File : GNATCOLL.VFS.Virtual_File) return String;
   function Image (Self : GNATCOLL.Xref.Entity_Information) return String;
   --  Return a display version of the argument

   Xref               : aliased My_Xref_Database;
   Env                : GNATCOLL.Projects.Project_Environment_Access;
   Tree               : aliased GNATCOLL.Projects.Project_Tree;
   Source_Search_Path : GNATCOLL.VFS.File_Array_Access;

   Previous_Progress : Natural := 0;
   Progress_Reporter : access procedure (Current, Total : Integer) := null;

   --  Subprogram specs for subprograms used before bodies
   procedure Check_Arg_Count (Args : in GNATCOLL.Arg_Lists.Arg_List; Expected : in Integer);
   procedure Dump (Curs : in out GNATCOLL.Xref.Entities_Cursor'Class);
   procedure Dump (Refs : in out GNATCOLL.Xref.References_Cursor'Class; Controlling_Type_Name : in String := "");
   procedure Dump_Local (Refs : in out GNATCOLL.Xref.References_Cursor'Class; Local_File_Name : in String);
   --  Display the results of a query

   procedure Put (Item : GNATCOLL.VFS.File_Array);

   generic
      with function Compute
        (Self   : in GNATCOLL.Xref.Xref_Database'Class;
         Entity : in GNATCOLL.Xref.Entity_Information)
        return GNATCOLL.Xref.Entity_Information;
   procedure Process_Command_Single (Args : GNATCOLL.Arg_Lists.Arg_List);
   --  Get the entity identified by Args, which must contain a single
   --  argument. Then call Compute, and output the result.
   --
   --  Appropriate for queries that return a single entity result.

   procedure Process_Command_Single (Args : GNATCOLL.Arg_Lists.Arg_List)
   is
      use GNATCOLL.Arg_Lists;
      use GNATCOLL.Xref;

      Entity : Entity_Information;
      Comp   : Entity_Information;
   begin
      Check_Arg_Count (Args, 2);

      Short_File_Names := Nth_Arg (Args, 2) = Short_File_Names_Arg;

      Entity := Get_Entity (Nth_Arg (Args, 1));
      Comp := Compute (Xref, Entity);
      if Comp /= No_Entity then
         Ada.Text_IO.Put_Line (Image (Comp));
      end if;
   end Process_Command_Single;

   generic
      with procedure Compute
        (Self   : in     GNATCOLL.Xref.Xref_Database'Class;
         Entity : in     GNATCOLL.Xref.Entity_Information;
         Cursor :    out GNATCOLL.Xref.Entities_Cursor'Class);
   procedure Process_Command_Multiple (Args : GNATCOLL.Arg_Lists.Arg_List);

   procedure Process_Command_Multiple (Args : GNATCOLL.Arg_Lists.Arg_List)
   is
      use GNATCOLL.Arg_Lists;
      use GNATCOLL.Xref;

      Entity      : Entity_Information;
      Descendants : Recursive_Entities_Cursor;

      --  Apparently a generic formal parameter cannot match a subprogram access type, so we need this:
      procedure Do_Compute
        (Self   : in     GNATCOLL.Xref.Xref_Database'Class;
         Entity : in     GNATCOLL.Xref.Entity_Information;
         Cursor :    out GNATCOLL.Xref.Entities_Cursor'Class)
      is begin
         Compute (Self, Entity, Cursor);
      end Do_Compute;
   begin
      Check_Arg_Count (Args, 2);

      Short_File_Names := Nth_Arg (Args, 2) = Short_File_Names_Arg;

      Entity := Get_Entity (Nth_Arg (Args, 1));

      Recursive
        (Self    => Xref'Unchecked_Access,
         Entity  => Entity,
         Compute => Do_Compute'Unrestricted_Access,
         Cursor  => Descendants);

      Dump (Descendants);

   end Process_Command_Multiple;

   --  Command procedures; Args is the command line.
   --
   --  Infrastructure commands
   procedure Process_Help (Args : GNATCOLL.Arg_Lists.Arg_List);
   procedure Process_Refresh (Args : GNATCOLL.Arg_Lists.Arg_List);
   procedure Process_DB_Name (Args : GNATCOLL.Arg_Lists.Arg_List);

   --  Queries; alphabetical
   procedure Process_Complete (Args : GNATCOLL.Arg_Lists.Arg_List);
   procedure Process_Overridden is new Process_Command_Single (GNATCOLL.Xref.Overrides);
   procedure Process_Overriding is new Process_Command_Multiple (GNATCOLL.Xref.Overridden_By);
   procedure Process_Parent_Types is new Process_Command_Multiple (GNATCOLL.Xref.Parent_Types);
   procedure Process_Project_Path (Args : GNATCOLL.Arg_Lists.Arg_List);
   procedure Process_Refs (Args : GNATCOLL.Arg_Lists.Arg_List);
   procedure Process_Tree_Defs (Args : GNATCOLL.Arg_Lists.Arg_List);
   procedure Process_Tree_Refs (Args : GNATCOLL.Arg_Lists.Arg_List);
   procedure Process_Source_Dirs (Args : GNATCOLL.Arg_Lists.Arg_List);

   type Command_Descr is record
      Name    : GNAT.Strings.String_Access;
      Args    : GNAT.Strings.String_Access;
      Help    : GNAT.Strings.String_Access;
      Handler : not null access procedure (Args : GNATCOLL.Arg_Lists.Arg_List);
   end record;

   Commands : constant array (Natural range <>) of Command_Descr :=
     ((new String'("help"),
       new String'("[command or variable name]"),
       new String'("Display the list of commands and their syntax."),
       Process_Help'Access),

      (new String'("refresh"),
       null,
       new String'("Refresh the contents of the xref database."),
       Process_Refresh'Access),

      (new String'("db_name"),
       null,
       new String'("Report the root name of the database files."),
       Process_DB_Name'Access),

      --  queries

      (new String'("complete"),
       new String'("pattern"),
       new String'("Names that complete the pattern."),
       Process_Complete'Access),

      (new String'("overridden"),
       new String'("name:file:line[:column] {full_file_names | short_file_names}"),
       new String'("The entity that is overridden by the parameter"),
       Process_Overridden'Access),

      (new String'("overriding"),
       new String'("name:file:line[:column] {full_file_names | short_file_names}"),
       new String'("The entities that override the parameter"),
       Process_Overriding'Access),

      (new String'("parent_types"),
       new String'("name:file:line[:column] {full_file_names | short_file_names}"),
       new String'("The parent types of the entity."),
       Process_Parent_Types'Access),

      (new String'("project_path"),
       null,
       new String'("The project search path."),
       Process_Project_Path'Access),

      (new String'("refs"),
       new String'("name:file:line[:column] {global | local_only} {full_file_names | short_file_names}"),
       new String'("All known references to the entity."),
       Process_Refs'Access),

      (new String'("tree_defs"),
       new String'("name:file[:line[:column]] {full_file_names | short_file_names}"),
       new String'
         ("All known references to the entity, and to child types or overridden/overriding operations."),
       Process_Tree_Defs'Access),

      (new String'("tree_refs"),
       new String'("name:file:line[:column] {full_file_names | short_file_names}"),
       new String'
         ("All known references to the entity, and to parent/child types or overridden/overriding operations."),
       Process_Tree_Refs'Access),

      (new String'("source_dirs"),
       null,
       new String'("The project source directories, recursively."),
       Process_Source_Dirs'Access));

   --  Parsed command line info
   Cmdline              : GNAT.Command_Line.Command_Line_Configuration;

   ALI_Encoding         : aliased GNAT.Strings.String_Access := new String'("");
   Commands_From_Switch : aliased GNAT.Strings.String_Access;
   DB_Name              : aliased GNAT.Strings.String_Access := new String'("gpr_query.db");
   Force_Refresh        : aliased Boolean;
   Gpr_Config_File      : aliased GNAT.Strings.String_Access;
   Nightly_DB_Name      : aliased GNAT.Strings.String_Access;
   Project_File_Name    : aliased GNAT.Strings.String_Access;
   Show_Progress        : aliased Boolean;
   Traces_Config_File   : aliased GNAT.Strings.String_Access;

   ----------
   --  Procedure bodies, alphabetical

   procedure Check_Arg_Count (Args : in GNATCOLL.Arg_Lists.Arg_List; Expected : in Integer)
   is
      Count : constant Integer := GNATCOLL.Arg_Lists.Args_Length (Args);
   begin
      if Count /= Expected then
         raise Invalid_Command with "Invalid number of arguments" & Integer'Image (Count) &
           "; expecting" & Integer'Image (Expected);
      end if;
   end Check_Arg_Count;

   procedure Display_Progress (Current, Total : Integer) is
      Now : constant Integer := Integer (Float'Floor (Float (Current) / Float (Total) * 100.0));
   begin
      if Now /= Previous_Progress then
         Ada.Text_IO.Put_Line
           ("completed" & Current'Img
              & " out of" & Total'Img
              & " (" & GNATCOLL.Utils.Image (Now, Min_Width => 0) & "%)...");
         Previous_Progress := Now;
      end if;
   end Display_Progress;

   procedure Dump (Curs : in out GNATCOLL.Xref.Entities_Cursor'Class)
   is
      use GNATCOLL.Xref;
   begin
      while Curs.Has_Element loop
         Ada.Text_IO.Put_Line (Image (Curs.Element));
         Curs.Next;
      end loop;
   end Dump;

   procedure Dump (Refs : in out GNATCOLL.Xref.References_Cursor'Class; Controlling_Type_Name : in String := "")
   is
      use GNATCOLL.Xref;
   begin
      while Has_Element (Refs) loop
         declare
            Ref : constant Entity_Reference := Refs.Element;
         begin
            Ada.Text_IO.Put_Line
              (Xref.Image (Ref) & " (" &
                 (if Controlling_Type_Name'Length = 0
                  then ""
                  else Controlling_Type_Name & "; ") &
                 (+Ref.Kind) & ")");
         end;
         Next (Refs);
      end loop;
   end Dump;

   procedure Dump_Local (Refs : in out GNATCOLL.Xref.References_Cursor'Class; Local_File_Name : in String)
   is
      use GNATCOLL.Xref;
   begin
      while Has_Element (Refs) loop
         declare
            Ref : constant Entity_Reference := Refs.Element;
         begin
            if Local_File_Name = "" or else Local_File_Name = Ref.File.Display_Base_Name then
               Ada.Text_IO.Put_Line (Xref.Image (Ref) & " (" & (+Ref.Kind) & ")");
            end if;
         end;
         Next (Refs);
      end loop;
   end Dump_Local;

   function Get_Entity (Arg : String) return GNATCOLL.Xref.Entity_Information
   is
      use GNAT.Directory_Operations;
      use GNATCOLL.Xref;

      Words : GNAT.Strings.String_List_Access := GNATCOLL.Utils.Split (Arg, On => ':');
      Ref   : GNATCOLL.Xref.Entity_Reference;
   begin
      case Words'Length is
      when 4         =>
         Ref := Xref.Get_Entity
           (Name     => Words (Words'First).all,
            File     => Format_Pathname
              (Style => UNIX,
               Path  => Words (Words'First + 1).all),
            Project  => GNATCOLL.Projects.No_Project,
            Line     => Integer'Value (Words (Words'First + 2).all),
            Column   => Visible_Column
              (Integer'Value (Words (Words'First + 3).all)));

      when 3 =>
         --  No column; assume good enough for a precise match
         Ref := Xref.Get_Entity
           (Name     => Words (Words'First).all,
            File     => Format_Pathname
              (Style => UNIX,
               Path  => Words (Words'First + 1).all),
            Project  => GNATCOLL.Projects.No_Project,
            Line     => Integer'Value (Words (Words'First + 2).all));

      when 2 =>
         --  No line or column; error.
         GNAT.Strings.Free (Words);
         raise Invalid_Command with "Invalid parameter '" & Arg & "', expecting name:file:line[:column]]";

      when others =>
         --  No file, or bad args.
         --
         --  Xref.Get_Entity treats 'File => ""' as searching for pre-defined entities such as "Integer".
         --
         --  To search for a name in all files, use "complete" command.
         GNAT.Strings.Free (Words);

         raise Invalid_Command with "Invalid parameter '" & Arg & "', expecting name:file:line[:column]]";
      end case;

      GNAT.Strings.Free (Words);

      if Ref.Entity = GNATCOLL.Xref.No_Entity then
         Ada.Text_IO.Put_Line ("Error: entity not found '" & Arg & "'");

      elsif GNATCOLL.Xref.Is_Fuzzy_Match (Ref.Entity) then
         Ada.Text_IO.Put_Line ("warning: fuzzy match for the entity");
      end if;

      return Ref.Entity;
   end Get_Entity;

   overriding function Image (Self : My_Xref_Database; File : GNATCOLL.VFS.Virtual_File) return String
   is
      pragma Unreferenced (Self);
   begin
      if Short_File_Names then
         return File.Display_Base_Name;
      else
         return File.Display_Full_Name;
      end if;
   end Image;

   function Image (Self : GNATCOLL.Xref.Entity_Information) return String
   is
      use GNATCOLL.Xref;
   begin
      if Self = No_Entity then
         return "Unknown entity";
      else
         declare
            Decl : constant Entity_Declaration := Xref.Declaration (Self);
         begin
            if Is_Predefined_Entity (Decl) then
               return "predefined entity: " & (+Decl.Name);
            else
               return Xref.Image (Decl.Location);
            end if;
         end;
      end if;
   end Image;

   procedure Process_DB_Name (Args : GNATCOLL.Arg_Lists.Arg_List)
   is
      pragma Unreferenced (Args);
   begin
      Ada.Text_IO.Put_Line (DB_Name.all);
   end Process_DB_Name;

   procedure Process_Help (Args : GNATCOLL.Arg_Lists.Arg_List)
   is
      use Ada.Text_IO;
      use GNATCOLL.Arg_Lists;
      use type GNAT.Strings.String_Access;
   begin
      for C in Commands'Range loop
         if Args_Length (Args) <= 0 -- Empty_Command_Line returns -1
           or else Nth_Arg (Args, 1) = Commands (C).Name.all
         then
            Put ("  " & Commands (C).Name.all);
            if Commands (C).Args = null then
               New_Line;
            else
               Put_Line (" " & Commands (C).Args.all);
            end if;

            Put
              (Ada.Strings.Unbounded.To_String
                 (GNATCOLL.Paragraph_Filling.Knuth_Fill
                    (Commands (C).Help.all,
                     Max_Line_Length => 70,
                     Line_Prefix     => "      ")));
         end if;
      end loop;
      New_Line;
      Put_Line ("'exit' to quit");
   end Process_Help;

   procedure Process_Line (Line : String)
   is
      Expr : GNAT.Strings.String_List_Access;
   begin
      if Ada.Strings.Fixed.Trim (Line, Ada.Strings.Both) = "" then
         return;
      end if;

      Expr := GNATCOLL.Utils.Split (Line, On => ';');

      for C in Expr'Range loop
         if Ada.Strings.Fixed.Trim (Expr (C).all, Ada.Strings.Both) = "" then
            null;

         else
            declare
               use GNATCOLL.Arg_Lists;
               List  : constant Arg_List := Parse_String (Expr (C).all, Mode => Separate_Args);
               Cmd   : constant String   := Ada.Characters.Handling.To_Lower (Get_Command (List));
               Found : Boolean           := False;
            begin
               for Co in Commands'Range loop
                  if Commands (Co).Name.all = Cmd then
                     Commands (Co).Handler (List);
                     Found := True;
                     exit;
                  end if;
               end loop;

               if not Found then
                  raise Invalid_Command with "Invalid command: '" & Cmd & "'";
               end if;
            end;

         end if;
      end loop;

      GNAT.Strings.Free (Expr);
   end Process_Line;

   function Get_Parameters (Entity : GNATCOLL.Xref.Entity_Information) return String
   is
      use Ada.Strings.Unbounded;
      use GNATCOLL.Xref;
      Params     : Parameters_Cursor := GNATCOLL.Xref.Parameters (Xref, Entity);
      Result     : Unbounded_String;
      Need_Paren : Boolean           := True;
   begin
      loop
         exit when not Has_Element (Params);
         Result := Result &
           ((if Need_Paren
             then (if Length (Result) > 0 then " (" else "(")
             else ", ") &
              Xref.Declaration (Element (Params).Parameter).Name);
         Need_Paren := False;
         Next (Params);
      end loop;
      if not Need_Paren then
         Result := Result & ")";
      end if;
      return +Result;
   end Get_Parameters;

   procedure Process_Complete (Args : GNATCOLL.Arg_Lists.Arg_List)
   is
      use Ada.Text_IO;
      use GNATCOLL.Arg_Lists;
      use GNATCOLL.Xref;
      Prefix  : constant String := Nth_Arg (Args, 1);
      Matches : Entities_Cursor;
      Count   : Integer         := 0;
   begin
      Short_File_Names := False;

      --  First count all matches, so Emacs can show progress
      Xref.From_Prefix
        (Prefix,
         Is_Partial => True,
         Cursor     => Matches);
      loop
         exit when not Has_Element (Matches);
         Count := @ + 1;
         Next (Matches);
      end loop;

      Ada.Text_IO.Put_Line ("element count" & Count'Image);

      Xref.From_Prefix
        (Prefix,
         Is_Partial => True,
         Cursor     => Matches);
      loop
         exit when not Has_Element (Matches);
         declare
            Decl : constant Entity_Declaration := Xref.Declaration (Element (Matches));
         begin
            Put (Xref.Qualified_Name (Element (Matches)));
            if Decl.Flags.Is_Subprogram then
               Ada.Text_IO.Put (Get_Parameters (Decl.Location.Entity));
            end if;
         end;
         Ada.Text_IO.Put_Line (" " & Image (Element (Matches)));
         Next (Matches);
      end loop;
   end Process_Complete;

   procedure Process_Project_Path (Args : GNATCOLL.Arg_Lists.Arg_List)
   is
      pragma Unreferenced (Args);
      Dirs : constant GNATCOLL.VFS.File_Array := GNATCOLL.Projects.Predefined_Project_Path (Env.all);
   begin
      Short_File_Names := False;
      Put (Dirs);
   end Process_Project_Path;

   procedure Process_Refresh (Args : GNATCOLL.Arg_Lists.Arg_List)
   is
      pragma Unreferenced (Args);
   begin
      Parse_All_LI_Files
        (Self                => Xref,
         Project             => Tree.Root_Project,
         Parse_Runtime_Files => False,
         Show_Progress       => Progress_Reporter,
         ALI_Encoding        => ALI_Encoding.all,
         From_DB_Name        => Nightly_DB_Name.all,
         To_DB_Name          => DB_Name.all,
         Force_Refresh       => Force_Refresh);
   end Process_Refresh;

   procedure Process_Refs (Args : GNATCOLL.Arg_Lists.Arg_List)
   is
      use GNATCOLL.Arg_Lists;
   begin
      Check_Arg_Count (Args, 3); --  entity, local/global, full/short

      Short_File_Names := Nth_Arg (Args, 3) = Short_File_Names_Arg;

      declare
         use GNATCOLL.Xref;
         Entity : constant Entity_Information := Get_Entity (Nth_Arg (Args, 1));
         Refs   : References_Cursor;
      begin
         Xref.References (Entity, Refs);
         if Nth_Arg (Args, 2) = "local_only" then
            --  Xref doesn't let us get the full file name of Entity (sigh)
            declare
               use Ada.Strings.Fixed;
               First           : constant Integer := 1 + Index (Nth_Arg (Args, 1), ":");
               Last            : constant Integer := -1 + Index (Nth_Arg (Args, 1), ":", First);
               Local_File_Name : constant String  := Nth_Arg (Args, 1) (First .. Last);
            begin
               Dump_Local (Refs, Local_File_Name);
            end;
         else
            Dump (Refs);
         end if;
      end;
   end Process_Refs;

   function Has_Op
     (Entity            : in GNATCOLL.Xref.Entity_Information;
      Primitive_Op_Name : in String := "")
     return Boolean
   is
      use GNATCOLL.Xref;
      Ops : Entities_Cursor;
   begin
      Xref.Methods (Entity, Ops);
      loop
         exit when not Has_Element (Ops);
         if Primitive_Op_Name = +Xref.Declaration (Element (Ops)).Name then
            return True;
         end if;
         Next (Ops);
      end loop;
      return False;
   end Has_Op;

   function Root_Parent_Type
     (Entity            : in GNATCOLL.Xref.Entity_Information;
      Primitive_Op_Name : in String  := "")
     return GNATCOLL.Xref.Entity_Information
   is
      use GNATCOLL.Xref;
      Result  : Entity_Information := Entity;
      Parents : Entities_Cursor;
   begin
      loop
         Xref.Parent_Types (Result, Parents);
         --  There is more than one parent when the type inherits interfaces.
         --  We assume the first parent is a non-interface (if there is one),
         --  and ignore the rest.
         exit when (not Parents.Has_Element) or else
           (Primitive_Op_Name'Length > 0 and then not Has_Op (Parents.Element, Primitive_Op_Name));
         Result := Parents.Element;
      end loop;
      return Result;
   end Root_Parent_Type;

   procedure All_Child_Types
     (Entity : in GNATCOLL.Xref.Entity_Information;
      Cursor : in out GNATCOLL.Xref.Recursive_Entities_Cursor)
   is begin
      GNATCOLL.Xref.Recursive
        (Self    => Xref'Unchecked_Access,
         Entity  => Entity,
         Compute => GNATCOLL.Xref.Child_Types'Access,
         Cursor  => Cursor);
   end All_Child_Types;

   function Controlling_Type (Entity : in GNATCOLL.Xref.Entity_Information) return GNATCOLL.Xref.Entity_Information
   is
      use GNATCOLL.Xref;
      --  Method_Of returns a derived type if the subprogram is not
      --  overridden for the child; the type we want is the non-child; the
      --  last item in Controlling_Types.
      Types  : Entities_Cursor;
      Result : Entity_Information := No_Entity;
   begin
      Xref.Method_Of (Entity, Types);
      loop
         exit when not Has_Element (Types);
         Result := Types.Element;
         Next (Types);
      end loop;
      return Result;
   end Controlling_Type;

   procedure Dump_Decl (Decl : in GNATCOLL.Xref.Entity_Declaration; Annotation : in String := "")
   is begin
      Ada.Text_IO.Put_Line
        (Xref.Image (Decl.Location) & " (" &
           (+Decl.Name) & " " &
           (if Annotation'Length = 0
            then ""
            else Annotation & " ") &
           (+Decl.Kind) & ")");
   end Dump_Decl;

   procedure Dump_Ref (Ref : in GNATCOLL.Xref.Entity_Reference; Annotation : in String := "")
   is begin
      Ada.Text_IO.Put_Line
        (Xref.Image (Ref) & " (" &
           (+Xref.Declaration (Ref.Entity).Name) & " " &
           (if Annotation'Length = 0
            then ""
            else Annotation & " ") &
           (+Ref.Kind) & ")");
   end Dump_Ref;

   procedure Dump_Entity (Entity : in GNATCOLL.Xref.Entity_Information; Controlling_Type_Name : in String := "")
   is
      use Ada.Strings.Unbounded;
      use GNATCOLL.Xref;
      Spec_Decl : constant Entity_Declaration := Xref.Declaration (Entity);
      Body_Decls : References_Cursor;
      Parameters : Unbounded_String;
   begin
      if Controlling_Type_Name'Length > 0 then
         Parameters := +Controlling_Type_Name & ";";
      end if;

      if Spec_Decl.Flags.Is_Subprogram then
         Parameters := Parameters & Get_Parameters (Spec_Decl.Location.Entity);
      end if;

      Xref.Bodies (Entity, Body_Decls);
      if not Has_Element (Body_Decls) then
         Dump_Decl (Spec_Decl, +Parameters);
      else
         declare
            use all type GNATCOLL.VFS.Virtual_File;
            First_Body_Ref : constant Entity_Reference := Body_Decls.Element;
         begin
            if First_Body_Ref.File = Spec_Decl.Location.File and
              First_Body_Ref.Line = Spec_Decl.Location.Line and
              First_Body_Ref.Column = Spec_Decl.Location.Column
            then
               Ada.Text_IO.Put_Line
                 (Xref.Image (First_Body_Ref) & " (" & (+Spec_Decl.Name) & " " &
                    (if Length (Parameters) = 0
                     then ""
                     else +Parameters & " ") &
                    (+Spec_Decl.Kind) & "/" & (+First_Body_Ref.Kind) & ")");
            else
               Dump_Decl (Spec_Decl, +Parameters);
               Dump_Ref (First_Body_Ref, +Parameters);
            end if;
         end;

         Next (Body_Decls);

         loop
            exit when not Has_Element (Body_Decls);
            Dump_Ref (Body_Decls.Element, +Parameters);
            Next (Body_Decls);
         end loop;
      end if;
   end Dump_Entity;

   procedure Process_Tree_Defs (Args : GNATCOLL.Arg_Lists.Arg_List)
   is
      --  "tree_defs" <name:loc> {short_file_names | full_file_names}

      use GNATCOLL.Arg_Lists;
      use GNATCOLL.Xref;

      Words       : GNAT.Strings.String_List_Access := GNATCOLL.Utils.Split (Nth_Arg (Args, 1), On => ':');
      Root_Parent : Entity_Information;

      procedure One_Entity (Orig_Entity : in Entity_Information; No_Children : in Boolean := False)
      is
         Orig_Decl       : constant Entity_Declaration := Xref.Declaration (Orig_Entity);
         Orig_Short_Name : constant String             := +Orig_Decl.Name;

         procedure Dump_Method
           (Type_Entity       : in GNATCOLL.Xref.Entity_Information;
            Primitive_Op_Name : in String)
         is
            Type_Name : constant String := Xref.Qualified_Name (Type_Entity);
            Ops       : Entities_Cursor;
         begin
            Xref.Methods (Type_Entity, Ops);
            loop
               exit when not Has_Element (Ops);
               declare
                  Method_Name : constant String := +Xref.Declaration (Element (Ops)).Name;
               begin
                  if Primitive_Op_Name = Method_Name then
                     --  IMPROVEME: if the method is inherited but not overridden, use the
                     --  type location.
                     Dump_Entity (Element (Ops), Type_Name);
                  end if;
               end;
               Next (Ops);
            end loop;
         end Dump_Method;

         procedure Dump_Entities (Entities : in out Recursive_Entities_Cursor)
         is begin
            loop
               exit when not Has_Element (Entities);
               if Orig_Decl.Flags.Is_Subprogram then
                  Dump_Method (Entities.Element, Primitive_Op_Name => Orig_Short_Name);
               else
                  Dump_Entity (Entities.Element);
               end if;
               Next (Entities);
            end loop;
         end Dump_Entities;
      begin

         if Orig_Decl.Flags.Is_Type then
            --  It is tempting to find the highest ancestor type here, then show
            --  all types derived from that. But in Ada, that root ancestor is
            --  often Ada.Finalization.[Limited_]Controlled (or some similar root
            --  type), so the tree is much larger than we really want. So we just
            --  show all children of the given type; the user can then climb the
            --  tree if they want to enlarge it. This also allows the user to
            --  choose which anscestor to examine when there is more than one,
            --  with interfaces.
            Root_Parent := Orig_Entity;

         elsif Orig_Decl.Flags.Is_Subprogram then
            declare
               Controlling : constant Entity_Information := Controlling_Type (Orig_Entity);
            begin
               if Controlling = No_Entity then
                  --  Not a primitive subprogram
                  Dump_Entity (Orig_Entity);
                  return;
               else
                  if No_Children then
                     Root_Parent := Controlling; -- for type name
                  else
                     --  Here we find the highest ancestor type that has this method.
                     --  gnatcoll.xref does not let us get the type of each parameter, so
                     --  we can't match profiles, just names.
                     Root_Parent := Root_Parent_Type (Controlling, Primitive_Op_Name => Orig_Short_Name);
                  end if;
               end if;
            end;
         else
            --  Something else (variable, package, ...)
            Dump_Decl (Orig_Decl);
            return;
         end if;

         if No_Children then
            if Orig_Decl.Flags.Is_Type then
               Dump_Entity (Orig_Entity);
            else
               Dump_Entity (Orig_Entity, Controlling_Type_Name => Xref.Qualified_Name (Root_Parent));
            end if;
         else
            declare
               Child_Types : Recursive_Entities_Cursor;
            begin
               --  "Child_Types" includes generic formal parameters (ie
               --  gen_run_wisi_lr_parse.ads Parse_Data_Type) in addition to the
               --  actual parameters.
               All_Child_Types (Root_Parent, Child_Types);
               if Orig_Decl.Flags.Is_Type then
                  Dump_Entity (Root_Parent);
               else
                  Dump_Method (Root_Parent, +Orig_Decl.Name);
               end if;
               Dump_Entities (Child_Types);
            end;
         end if;
      end One_Entity;

      use GNAT.Directory_Operations;
   begin
      Short_File_Names := Nth_Arg (Args, 2) = Short_File_Names_Arg;

      case Words'Length is
      when 3 | 4         =>
         One_Entity
           (Xref.Get_Entity
              (Name     => Words (Words'First).all,
               File     => Format_Pathname
                 (Style => UNIX,
                  Path  => Words (Words'First + 1).all),
               Project  => GNATCOLL.Projects.No_Project,
               Line     => Integer'Value (Words (Words'First + 2).all),
               Column   =>
                 (if Words'Length = 4
                  then Visible_Column (Integer'Value (Words (Words'First + 3).all))
                  else -1)) --  No column; assume good enough for a precise match
              .Entity);

      when 2 =>
         --  No line or column; find all matching names in file
         declare
            use GNATCOLL.VFS;

            Multiple       : Entities_Cursor;
            Orig_File      : constant Virtual_File      := Locate_Regular_File
              (File_Name => +Words (Words'First + 1).all,
               Path      => Source_Search_Path.all);
            Orig_File_Name : constant Filesystem_String := Full_Name (Orig_File);
         begin
            From_Prefix (Xref, Words (Words'First).all, Is_Partial => False, Cursor => Multiple);

            loop
               exit when not Has_Element (Multiple);
               declare
                  Decl : constant Entity_Declaration := Xref.Declaration (Element (Multiple));

                  function Check_Body_File return Boolean
                  is
                     Bodies : References_Cursor;
                  begin
                     Xref.Bodies (Decl.Location.Entity, Bodies);
                     loop
                        exit when not Has_Element (Bodies);
                        declare
                           Ref : Entity_Reference renames Element (Bodies);
                        begin
                           if Orig_File_Name = Full_Name (Ref.File) then
                              return True;
                           end if;
                        end;
                        Next (Bodies);
                     end loop;
                     return False;
                  end Check_Body_File;

               begin
                  if Orig_File_Name = Full_Name (Decl.Location.File) or else
                    Check_Body_File
                  then
                     One_Entity (Element (Multiple), No_Children => True);
                  end if;
               end;
               Next (Multiple);
            end loop;
         end;

      when others =>
         --  No file or bad arg.
         GNAT.Strings.Free (Words);
         raise Invalid_Command with "Invalid parameter '" & Nth_Arg (Args, 1) &
           "', expecting name:file:[line[:column]]";
      end case;

   end Process_Tree_Defs;

   procedure Process_Tree_Refs (Args : GNATCOLL.Arg_Lists.Arg_List)
   is
      --  "tree_refs" <name:loc> {short_file_names | full_file_names}

      use GNATCOLL.Arg_Lists;
      use GNATCOLL.Xref;

      Orig_Entity : constant Entity_Information := Get_Entity (Nth_Arg (Args, 1));
      Orig_Decl   : constant Entity_Declaration := Xref.Declaration (Orig_Entity);
      Root_Parent : Entity_Information;

      procedure Dump_Type (Type_Entity : in Entity_Information)
      is
         Methods : Entities_Cursor;
      begin
         if Orig_Decl.Flags.Is_Subprogram then
            Xref.Methods (Type_Entity, Methods);
            loop
               exit when not Has_Element (Methods);
               declare
                  Method_Name : constant String := +Xref.Declaration (Methods.Element).Name;
                  Refs : References_Cursor;
               begin
                  if Method_Name = +Orig_Decl.Name then
                     Xref.References (Methods.Element, Refs);
                     Dump (Refs, +Xref.Declaration (Type_Entity).Name);
                  end if;
               end;
               Next (Methods);
            end loop;
         else
            Dump_Entity (Type_Entity);
         end if;
      end Dump_Type;

      procedure Dump_Types (Types : in out Recursive_Entities_Cursor)
      is begin
         loop
            exit when not Has_Element (Types);
            Dump_Type (Types.Element);
            Next (Types);
         end loop;
      end Dump_Types;
   begin
      Short_File_Names := Nth_Arg (Args, 2) = Short_File_Names_Arg;

      if Orig_Decl.Flags.Is_Type then
         --  See comment in Process_Tree_Defs
         Root_Parent := Orig_Entity;

      elsif Orig_Decl.Flags.Is_Subprogram then
         declare
            Controlling : constant Entity_Information := Controlling_Type (Orig_Entity);
         begin
            if Controlling = No_Entity then
               --  Not a primitive subprogram
               declare
                  Refs : References_Cursor;
               begin
                  Xref.References (Orig_Entity, Refs);
                  Dump (Refs);
                  return;
               end;
            else
               Root_Parent := Root_Parent_Type (Controlling, Primitive_Op_Name => +Orig_Decl.Name);
            end if;
         end;
      else
         --  A variable
         declare
            Refs : References_Cursor;
         begin
            Xref.References (Orig_Entity, Refs);
            Dump (Refs);
            return;
         end;
      end if;

      declare
         Child_Types : Recursive_Entities_Cursor;
      begin
         All_Child_Types (Root_Parent, Child_Types);

         Dump_Type (Root_Parent);
         Dump_Types (Child_Types);
      end;
   end Process_Tree_Refs;

   procedure Process_Source_Dirs (Args : GNATCOLL.Arg_Lists.Arg_List)
   is
      pragma Unreferenced (Args);
   begin
      Put (Source_Search_Path.all);
   end Process_Source_Dirs;

   procedure Put (Item : GNATCOLL.VFS.File_Array)
   is
      use GNATCOLL.VFS;
   begin
      for I in Item'Range loop
         Ada.Text_IO.Put_Line (+Full_Name (Item (I)));
      end loop;
   end Put;

begin
   Ada.Text_IO.Put_Line ("version: " & Version);

   declare
      use GNAT.Command_Line;
   begin
      Set_Usage
        (Cmdline,
         Help => "Query project info and cross-references on source code. See ada-mode docs for more help.");

      --  Switch variable alphabetic order
      Define_Switch
        (Cmdline,
         Output      => ALI_Encoding'Access,
         Long_Switch => "--encoding=",
         Switch      => "-e=",
         Help        => "The character encoding used for source and ALI files");
      Define_Switch
        (Cmdline,
         Output      => Commands_From_Switch'Access,
         Switch      => "-c:",
         Long_Switch => "--command=",
         Help        => "Execute the commands from ARG, and exit");
      Define_Switch
        (Cmdline,
         Output      => DB_Name'Access,
         Long_Switch => "--db=",
         Help        => "Specifies the name of the database (or ':memory:')");
      Define_Switch
        (Cmdline,
         Output      => Force_Refresh'Access,
         Long_Switch => "--force_refresh",
         Help        => "Force rebuilding the database.");
      Define_Switch
        (Cmdline,
         Output      => Gpr_Config_File'Access,
         Long_Switch => "--autoconf=",
         Help        => "Specify the gpr configuration file (.cgpr)");
      Define_Switch
        (Cmdline,
         Output      => Nightly_DB_Name'Access,
         Long_Switch => "--nightlydb=",
         Help        => "Specifies the name of a prebuilt database");
      Define_Switch
        (Cmdline,
         Output      => Project_File_Name'Access,
         Switch      => "-P:",
         Long_Switch => "--project=",
         Help        => "Load the given project (mandatory)");
      Define_Switch
        (Cmdline,
         Output      => Show_Progress'Access,
         Long_Switch => "--display_progress",
         Switch      => "-d",
         Help        => "Show progress as LI files are parsed");
      Define_Switch
        (Cmdline,
         Output      => Traces_Config_File'Access,
         Long_Switch => "--tracefile=",
         Help        =>
           "Specify a traces configuration file, set projects lib verbose. File should contain ""gpr_query=yes""");

      Getopt (Cmdline, Callback => null);
   end;

   if Project_File_Name.all = "" then
      Ada.Text_IO.Put_Line ("No project file specified");
      GNAT.Command_Line.Display_Help (Cmdline);
      return;
   end if;

   --  Only trace if user specifies --tracefile
   if Traces_Config_File.all /= "" and then GNAT.OS_Lib.Is_Regular_File (Traces_Config_File.all) then
      GNATCOLL.Traces.Parse_Config_File
        (Filename         => Traces_Config_File.all,
         Force_Activation => False);
      GNATCOLL.Traces.Trace (Me, "trace enabled");
   end if;

   GNATCOLL.Projects.Initialize (Env); -- for register_default_language

   if Gpr_Config_File.all /= "" and then GNAT.OS_Lib.Is_Regular_File (Gpr_Config_File.all) then
      Env.Set_Config_File
        (GNATCOLL.VFS.Create_From_UTF8
           (GNAT.OS_Lib.Normalize_Pathname
              (Name      => Gpr_Config_File.all,
               Directory => GNAT.Directory_Operations.Get_Current_Dir)));
   else
      --  Apparently Ada language extensions are already registered (sigh)

      Env.Register_Default_Language_Extension
        (Language_Name       => "C",
         Default_Spec_Suffix => ".h",
         Default_Body_Suffix => ".c");

      Env.Register_Default_Language_Extension
        (Language_Name       => "C++",
         Default_Spec_Suffix => ".hh",
         Default_Body_Suffix => ".cpp");

   end if;

   declare
      use Ada.Environment_Variables;
      use Ada.Text_IO;
      use GNATCOLL.VFS;
      use GNATCOLL.VFS_Utils;

      Gpr_Project_Path : constant String :=
        (if Exists ("GPR_PROJECT_PATH") then Ada.Directories.Current_Directory &
            GNAT.OS_Lib.Path_Separator &
            Value ("GPR_PROJECT_PATH")
         else Ada.Directories.Current_Directory);

      Path : constant Virtual_File := -- must be an absolute file name
        (if Is_Absolute_Path (+Project_File_Name.all) then
            Create_From_UTF8 (Project_File_Name.all, Normalize => True)
         else
            Locate_Regular_File (+Project_File_Name.all, From_Path (+Gpr_Project_Path)));
   begin
      GNATCOLL.Traces.Trace (Me, "GPR_PROJECT_PATH " & Gpr_Project_Path);

      if not Path.Is_Regular_File then
         declare
            Path : constant File_Array := From_Path (+Gpr_Project_Path);
         begin
            Put_Line (Project_File_Name.all & ": not found on path:");
            for P of Path loop
               Put_Line (+Full_Name (P));
            end loop;
         end;
         Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
         return;
      end if;

      GNATCOLL.Traces.Trace (Me, "project file " & (+Path.Full_Name));

      if Show_Progress then
         Progress_Reporter := Display_Progress'Unrestricted_Access;
      end if;

      begin
         --  Recompute_View => True registers all the source files
         --  (among other things), so we will know that a .[ag]li
         --  belongs to this project
         Tree.Load
           (Path, Env,
            Errors         => Ada.Text_IO.Put_Line'Access,
            Recompute_View => True);
      exception
      when GNATCOLL.Projects.Invalid_Project =>
         Ada.Text_IO.Put_Line ("project search path:");
         Put (GNATCOLL.Projects.Predefined_Project_Path (Env.all));
         raise GNATCOLL.Projects.Invalid_Project with +Path.Full_Name & ": invalid project";
      end;
   end;

   if DB_Name.all /= ":memory:" then
      declare
         use GNATCOLL.VFS;

         N    : constant String := DB_Name.all;
         Temp : Virtual_File    := Tree.Root_Project.Object_Dir;
         Dir2 : Virtual_File;
      begin
         GNAT.Strings.Free (DB_Name);

         --  If the project does not have an object directory, create
         --  the database in the directory containing the project file.
         if Temp = No_File then
            Temp := Tree.Root_Project.Project_Path.Dir;
         end if;

         Temp := Create_From_Base (Base_Dir => Temp.Full_Name.all, Base_Name => +N);
         Dir2 := Create (Temp.Dir_Name);

         if not Dir2.Is_Directory then
            Dir2.Make_Dir (Recursive => True);
         end if;

         DB_Name := new String'(Temp.Display_Full_Name);
      end;
   end if;

   declare
      use type GNAT.Strings.String_Access;
      Error : GNAT.Strings.String_Access;
   begin
      GNATCOLL.Traces.Trace (Me, "using database " & DB_Name.all);

      Setup_DB
        (Self  => Xref,
         Tree  => Tree'Unchecked_Access,
         DB    => GNATCOLL.SQL.Sqlite.Setup (Database => DB_Name.all),
         Error => Error);

      if Error /= null then
         --  old db schema
         raise Db_Error with Error.all;
      end if;
   end;

   Process_Refresh (GNATCOLL.Arg_Lists.Empty_Command_Line);

   Source_Search_Path := new GNATCOLL.VFS.File_Array'
     (GNATCOLL.Projects.Source_Dirs
        (Project   => Tree.Root_Project,
         Recursive => True) &
        GNATCOLL.Projects.Predefined_Source_Path (Env.all));

   if Commands_From_Switch.all /= "" then
      Process_Line (Commands_From_Switch.all);
      return;
   end if;

   loop
      Ada.Text_IO.Put (">>> ");
      declare
         Input : constant String := Ada.Text_IO.Get_Line;
      begin
         exit when Input = "exit";
         Process_Line (Input);
      exception
      when E : Invalid_Command =>
         Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Message (E));
         Process_Help (GNATCOLL.Arg_Lists.Empty_Command_Line);
      end;
   end loop;

exception
when Ada.IO_Exceptions.End_Error =>
   null;
when E : GNATCOLL.Projects.Invalid_Project =>
   Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Message (E));
   Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
when E : Db_Error =>
   Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Message (E));
   Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
when E : Invalid_Command =>
   Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Message (E));
   Process_Help (GNATCOLL.Arg_Lists.Empty_Command_Line);
   Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
when GNAT.Command_Line.Invalid_Switch =>
   GNAT.Command_Line.Display_Help (Cmdline);
   Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
when E : others =>
   Ada.Text_IO.Put_Line ("Unexpected exception");
   Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
   Ada.Text_IO.Put_Line (GNAT.Traceback.Symbolic.Symbolic_Traceback (Ada.Exceptions.Traceback.Tracebacks (E)));
   Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
end Gpr_Query;
