--  generated parser support file.
--  command line: wisitoken-bnf-generate.exe  --generate LALR Ada_Emacs re2c PROCESS ada.wy
--

--  Copyright (C) 2013 - 2018 Free Software Foundation, Inc.

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
--  along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

with WisiToken.Syntax_Trees;
with WisiToken.Parse.LR.Parser;
package Ada_Process_LALR_Main is

   procedure Create_Parser
     (Parser                       :    out WisiToken.Parse.LR.Parser.Parser;
      Language_Fixes               : in     WisiToken.Parse.LR.Parser.Language_Fixes_Access;
      Language_Use_Minimal_Complete_Actions : in
     WisiToken.Parse.LR.Parser.Language_Use_Minimal_Complete_Actions_Access;
      Language_String_ID_Set       : in     WisiToken.Parse.LR.Parser.Language_String_ID_Set_Access;
      Trace                        : not null access WisiToken.Trace'Class;
      User_Data                    : in     WisiToken.Syntax_Trees.User_Data_Access);

end Ada_Process_LALR_Main;
