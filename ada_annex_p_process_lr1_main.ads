--  generated parser support file. -*- buffer-read-only:t  -*-
--  command line: wisitoken-bnf-generate.exe  --generate LR1 Ada_Emacs re2c PROCESS text_rep ada_annex_p.wy
--

--  Copyright (C) 2013 - 2023 Free Software Foundation, Inc.

--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License as
--  published by the Free Software Foundation; either version 3, or (at
--  your option) any later version.
--
--  This software is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

with WisiToken.Syntax_Trees;
with WisiToken.Parse.LR.Parser;
package Ada_Annex_P_Process_LR1_Main is

   function Create_Parser
     (Trace      : in WisiToken.Trace_Access;
      User_Data  : in WisiToken.Syntax_Trees.User_Data_Access;
      Language_Fixes                 : in WisiToken.Parse.LR.Parser.Language_Fixes_Access;
      Language_Matching_Begin_Tokens : in WisiToken.Parse.LR.Parser.Language_Matching_Begin_Tokens_Access;
      Language_String_ID_Set         : in WisiToken.Parse.LR.Parser.Language_String_ID_Set_Access;
      Text_Rep_File_Name : in String)
     return WisiToken.Parse.LR.Parser.Parser;

end Ada_Annex_P_Process_LR1_Main;
