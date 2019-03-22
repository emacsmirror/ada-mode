--  Abstract :
--
--  Ada implementation of:
--
--  [1] gpr-wisi.el
--  [2] gpr-indent-user-options.el
--
--  Copyright (C) 2017 - 2019 Free Software Foundation, Inc.
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

package Wisi.Gpr is

   --  Indent parameters from [2]
   Gpr_Indent        : Integer := 3;
   Gpr_Indent_Broken : Integer := 2;
   Gpr_Indent_When   : Integer := 3;

   --  Other parameters
   End_Names_Optional : Boolean := False;

   type Parse_Data_Type is new Wisi.Parse_Data_Type with null record;

   overriding
   procedure Initialize
     (Data              : in out Parse_Data_Type;
      Descriptor        : access constant WisiToken.Descriptor;
      Source_File_Name  : in     String;
      Post_Parse_Action : in     Post_Parse_Action_Type;
      Begin_Line        : in     WisiToken.Line_Number_Type;
      End_Line          : in     WisiToken.Line_Number_Type;
      Begin_Indent      : in     Integer;
      Params            : in     String);
   --  Call Wisi_Runtime.Initialize, then:
   --
   --  If Params /= "", set all indent parameters from Params, in
   --  declaration order; otherwise keep default values. Boolean is
   --  represented by 0 | 1. Parameter values are space delimited.
   --
   --  Also do any other initialization that Gpr_Data needs.

end Wisi.Gpr;
