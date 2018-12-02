--  Abstract :
--
--  External process parser for gpr mode
--
--  Copyright (C) 2017, 2018 Stephen Leake All Rights Reserved.
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

with Gen_Emacs_Wisi_LR_Parse;
with Gpr_Process_Actions;
with Gpr_Process_LR1_Main;
with Wisi.Gpr;
procedure Gpr_Mode_Wisi_Parse is new Gen_Emacs_Wisi_LR_Parse
  (Parse_Data_Type                       => Wisi.Gpr.Parse_Data_Type,
   Name                                  => "gpr_mode_wisi_parse",
   Descriptor                            => Gpr_Process_Actions.Descriptor,
   Language_Fixes                        => null,
   Language_Use_Minimal_Complete_Actions => null,
   Language_String_ID_Set                => null,
   Create_Parser                         => Gpr_Process_LR1_Main.Create_Parser);
