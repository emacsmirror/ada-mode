--  generated parser support file. -*- buffer-read-only:t  -*-
--  command line: wisitoken-bnf-generate.exe  --generate LR1 Ada_Emacs re2c PROCESS gpr.wy
--

--  Copyright (C) 2013 - 2022 Free Software Foundation, Inc.

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
with WisiToken.Lexer;
with WisiToken.Parse.LR;
package Gpr_Process_Main is

   function Create_Parse_Table
     return WisiToken.Parse.LR.Parse_Table_Ptr;

   function Create_Productions return WisiToken.Syntax_Trees.Production_Info_Trees.Vector;

   function Create_Lexer (Trace : in WisiToken.Trace_Access) return WisiToken.Lexer.Handle;
end Gpr_Process_Main;
