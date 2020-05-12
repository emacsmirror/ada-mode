;;; gpr-process.el --- Generated parser support file  -*- lexical-binding:t -*-
;;  command line: wisitoken-bnf-generate.exe  --generate LR1 Ada_Emacs re2c PROCESS gpr.wy

;;  Copyright (C) 2013 - 2020 Free Software Foundation, Inc.

;;  This program is free software; you can redistribute it and/or
;;  modify it under the terms of the GNU General Public License as
;;  published by the Free Software Foundation; either version 3, or (at
;;  your option) any later version.
;;
;;  This software is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;  General Public License for more details.
;;
;;  You should have received a copy of the GNU General Public License
;;  along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

(require 'wisi-process-parse)

(defconst gpr-process-token-table
  [WHITESPACE
   NEW_LINE
   COMMENT
   ABSTRACT
   AT
   AGGREGATE
   CASE
   CONFIGURATION
   END
   EXTENDS
   EXTERNAL
   EXTERNAL_AS_LIST
   FOR
   IS
   LEFT_PAREN
   LIBRARY
   NULL
   OTHERS
   PACKAGE
   PROJECT
   RENAMES
   RIGHT_PAREN
   STANDARD
   TYPE
   USE
   WHEN
   WITH
   AMPERSAND
   COLON
   COLON_EQUALS
   COMMA
   DOT
   EQUAL_GREATER
   QUOTE
   SEMICOLON
   VERTICAL_BAR
   NUMERIC_LITERAL
   IDENTIFIER
   STRING_LITERAL
   Wisi_EOI
   wisitoken_accept
   aggregate_g
   attribute_declaration
   attribute_prefix
   attribute_reference
   case_statement
   case_item
   case_items
   compilation_unit
   context_clause
   context_clause_opt
   declarative_item
   declarative_items
   declarative_items_opt
   discrete_choice
   discrete_choice_list
   expression
   external_value
   identifier_opt
   name
   package_declaration
   package_spec
   package_extension
   package_renaming
   project_declaration_opt
   project_extension
   project_qualifier_opt
   simple_declarative_item
   simple_project_declaration
   string_primary
   string_list
   term
   typed_string_declaration
   with_clause
   ])

(defconst gpr-process-face-table
  [
   font-lock-function-name-face
   font-lock-keyword-face
   nil
   ])

(defconst gpr-process-repair-image
  '(
   (ABSTRACT . "abstract")
   (AT . "at")
   (AGGREGATE . "aggregate")
   (CASE . "case")
   (CONFIGURATION . "configuration")
   (END . "end")
   (EXTENDS . "extends")
   (EXTERNAL . "external")
   (EXTERNAL_AS_LIST . "external_as_list")
   (FOR . "for")
   (IS . "is")
   (LEFT_PAREN . "(")
   (LIBRARY . "library")
   (NULL . "null")
   (OTHERS . "others")
   (PACKAGE . "package")
   (PROJECT . "project")
   (RENAMES . "renames")
   (RIGHT_PAREN . ")")
   (STANDARD . "standard")
   (TYPE . "type")
   (USE . "use")
   (WHEN . "when")
   (WITH . "with")
   (AMPERSAND . "&")
   (COLON . ":")
   (COLON_EQUALS . ":=")
   (COMMA . ",")
   (DOT . ".")
   (EQUAL_GREATER . "=>")
   (QUOTE . "'")
   (SEMICOLON . ";")
   (VERTICAL_BAR . "|")
   (NUMERIC_LITERAL . "1234567890")
   (IDENTIFIER . "A_Bogus_Identifier")
   (STRING_LITERAL . "\"\"")
   ))

(provide 'gpr-process)
