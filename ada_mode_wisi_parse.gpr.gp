--  Abstract :
--
--  build ada_mode_wisi_parse and other executables
--
--  Copyright (C) 2014, 2018 Free Software Foundation, Inc.
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

#if ELPA="yes"
with "wisi";
#else
with "wisitoken";
#end if;
with "standard_common";
#if HAVE_LIBADALANG="yes"
with "libadalang";
#end if;
project Ada_Mode_Wisi_Parse is

   for Main use
     ("ada_mode_wisi_lalr_parse.ads",
      "ada_mode_wisi_lr1_parse.ads",
      "run_ada_lalr_parse.ads",
      "run_ada_lr1_parse.ads",
#if HAVE_LIBADALANG="yes"
      "run_ada_libadalang_parse.ads",
#end if;
      "gpr_mode_wisi_parse.ads",
      "run_gpr_parse.ads"
     );

   for Source_Dirs use (".");

   case Standard_Common.Profile is
   when "On" =>
      for Object_Dir use "obj_pro";
      for Exec_Dir use "exec_pro";

   when "Off" =>
      for Object_Dir use "obj";
      for Exec_Dir use ".";
   end case;

   for Languages use ("Ada", "C");

   package Compiler is

      case Standard_Common.Build is
      when "Debug" =>
         for Default_Switches ("Ada") use
           Standard_Common.Compiler.Common_Switches &
           Standard_Common.Compiler.Style_Checks &
           Standard_Common.Compiler.Debug_Switches;

         --  Generated files; lines too long, don't need debug
         for Switches ("ada_process_actions.adb") use
           Standard_Common.Compiler.Common_Switches &
           Standard_Common.Compiler.Base_Style_Checks &
           Standard_Common.Compiler.Base_Release_Switches & ("-O1");

         for Switches ("ada_process_main.adb") use
           Standard_Common.Compiler.Common_Switches &
           Standard_Common.Compiler.Base_Style_Checks &
           Standard_Common.Compiler.Base_Release_Switches & ("-O1");

         for Switches ("gpr_process_actions.adb") use
           Standard_Common.Compiler.Common_Switches &
           Standard_Common.Compiler.Base_Style_Checks &
           Standard_Common.Compiler.Base_Release_Switches & ("-O1");

         for Switches ("gpr_process_main.adb") use
           Standard_Common.Compiler.Common_Switches &
           Standard_Common.Compiler.Base_Style_Checks &
           Standard_Common.Compiler.Base_Release_Switches & ("-O1");

         for Default_Switches ("C") use Standard_Common.Compiler.Debug_Switches_C;

      when "Normal" =>
         for Default_Switches ("Ada") use
           Standard_Common.Compiler.Common_Switches &
           Standard_Common.Compiler.Style_Checks &
           Standard_Common.Compiler.Release_Switches;

         for Switches ("ada_process_actions.adb") use
           Standard_Common.Compiler.Common_Switches &
           Standard_Common.Compiler.Base_Style_Checks &
           Standard_Common.Compiler.Base_Release_Switches & ("-O1");

         for Switches ("ada_process_main.adb") use
           Standard_Common.Compiler.Common_Switches &
           Standard_Common.Compiler.Base_Style_Checks &
           Standard_Common.Compiler.Base_Release_Switches & ("-O1");

         for Switches ("gpr_process.adb") use
           Standard_Common.Compiler.Common_Switches &
           Standard_Common.Compiler.Base_Style_Checks &
           Standard_Common.Compiler.Base_Release_Switches & ("-O1");

         for Default_Switches ("C") use Standard_Common.Compiler.Release_Switches_C;
      end case;

   end Compiler;

   package Builder is
      --  Specifying some configuration pragmas can reduce parse times
      --  by 10% or so, on some systems. But doing so only here causes
      --  recompiling of wisitoken. If we add Global_ or Local_
      --  Configuration_Pragmas in wisitoken.gpr, we get compilation
      --  errors there. So we leave it up to users to patch this if
      --  they want it.
      --  for Global_Configuration_Pragmas use "config.pragmas";

      for Global_Compilation_Switches ("Ada") use Standard_Common.Builder'Global_Compilation_Switches ("Ada");

      --  We use ".exe" extension even on non-Windows, to simplify the makefiles.
      for Executable_Suffix use ".exe";
   end Builder;

   package Binder is
      for default_switches ("Ada") use ("-E"); -- symbolic traceback
   end Binder;

   package Install is
      for Required_Artifacts ("bin") use
        ("ada_lr1_parse_table.txt");
   end Install;

end Ada_Mode_Wisi_Parse;
