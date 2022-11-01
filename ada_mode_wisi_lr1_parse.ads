--  Abstract :
--
--  External process parser for Ada mode
--
--  Copyright (C) 2017 - 2020, 2022 Free Software Foundation, Inc.
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

with Ada_Annex_P_Process_LR1_Main;
with Gen_Emacs_Wisi_LR_Text_Rep_Parse;
with WisiToken.Parse.LR.McKenzie_Recover.Ada;
with Wisi.Ada;
procedure Ada_Mode_Wisi_LR1_Parse is new Gen_Emacs_Wisi_LR_Text_Rep_Parse
  (Parse_Data_Type                => Wisi.Ada.Parse_Data_Type,
   Name                           => "Ada_mode_wisi_lr1_parse",
   Language_Protocol_Version      => Wisi.Ada.Language_Protocol_Version,
   Language_Fixes                 => WisiToken.Parse.LR.McKenzie_Recover.Ada.Language_Fixes'Access,
   Language_Matching_Begin_Tokens => WisiToken.Parse.LR.McKenzie_Recover.Ada.Matching_Begin_Tokens'Access,
   Language_String_ID_Set         => WisiToken.Parse.LR.McKenzie_Recover.Ada.String_ID_Set'Access,
   Text_Rep_File_Name             => "ada_annex_p_lr1_parse_table.txt",
   Create_Parser                  => Ada_Annex_P_Process_LR1_Main.Create_Parser);
