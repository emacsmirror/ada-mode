;;; gpr-grammar-wy.el --- Generated parser support file

;; Copyright (C) 2013  Free Software Foundation, Inc.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or (at
;; your option) any later version.
;;
;; This software is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

(require 'wisi)
(require 'semantic/lex)
(require 'wisi-compile)

(defconst gpr-grammar-wy--keyword-table
  (semantic-lex-make-keyword-table
   '(
    ("abstract" . ABSTRACT)
    ("aggregate" . AGGREGATE)
    ("case" . CASE)
    ("configuration" . CONFIGURATION)
    ("end" . END)
    ("external" . EXTERNAL)
    ("external_as_list" . EXTERNAL_AS_LIST)
    ("for" . FOR)
    ("is" . IS)
    ("(" . LEFT_PAREN)
    ("library" . LIBRARY)
    ("null" . NULL)
    ("others" . OTHERS)
    ("package" . PACKAGE)
    ("project" . PROJECT)
    (")" . RIGHT_PAREN)
    ("standard" . STANDARD)
    ("type" . TYPE)
    ("use" . USE)
    ("when" . WHEN)
    ("with" . WITH)
    )
   nil)
  "Table of language keywords.")

(defconst gpr-grammar-wy--token-table
  (semantic-lex-make-type-table
   '(
     ("punctuation"
      (AMPERSAND . "&")
      (COLON . ":")
      (COLON_EQUALS . ":=")
      (COMMA . ",")
      (DOT . ".")
      (EQUAL_GREATER . "=>")
      (QUOTE . "'")
      (SEMICOLON . ";")
      (VERTICAL_BAR . "|")
     )
     ("symbol"
      (IDENTIFIER)
     )
     ("string-double"
      (STRING_LITERAL)
     )
    )
   nil)
  "Table of language tokens.")

(defconst gpr-grammar-wy--parse-table
   (wisi-compile-grammar
   '((AMPERSAND COLON COLON_EQUALS COMMA DOT EQUAL_GREATER QUOTE SEMICOLON VERTICAL_BAR IDENTIFIER STRING_LITERAL ABSTRACT AGGREGATE CASE CONFIGURATION END EXTERNAL EXTERNAL_AS_LIST FOR IS LEFT_PAREN LIBRARY NULL OTHERS PACKAGE PROJECT RIGHT_PAREN STANDARD TYPE USE WHEN WITH )
     ((attribute_declaration
       ((FOR IDENTIFIER USE expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'statement-other 5 'statement-end)
        (wisi-containing-action 3 4)))
       ((FOR IDENTIFIER LEFT_PAREN STRING_LITERAL RIGHT_PAREN USE expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'open-paren 5 'close-paren 6 'statement-other 8 'statement-end)
        (wisi-containing-action 6 7))))
      (attribute_prefix
       ((PROJECT ))
       ((name )))
      (attribute_reference
       ((attribute_prefix QUOTE IDENTIFIER ))
       ((attribute_prefix QUOTE IDENTIFIER LEFT_PAREN STRING_LITERAL RIGHT_PAREN )
        (wisi-statement-action 4 'open-paren 6 'close-paren)))
      (case_statement
       ((CASE name IS case_items END CASE SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-start 5 'block-end 7 'statement-end)
        (wisi-containing-action 3 4))))
      (case_item
       ((WHEN discrete_choice_list EQUAL_GREATER declarative_items )
        (progn
        (wisi-statement-action 1 'block-middle 3 'block-start)
        (wisi-containing-action 3 4))))
      (case_items
       (())
       ((case_item ))
       ((case_items case_item )))
      (compilation_unit
       ((context_clause_opt project_qualifier_opt project_declaration_opt )))
      (context_clause
       ((with_clause ))
       ((context_clause with_clause )))
      (context_clause_opt
       (())
       ((context_clause )))
      (declarative_item
       ((simple_declarative_item ))
       ((typed_string_declaration ))
       ((package_declaration )))
      (declarative_items
       (())
       ((declarative_item ))
       ((declarative_items declarative_item )))
      (discrete_choice
       (())
       ((STRING_LITERAL ))
       ((OTHERS )))
      (discrete_choice_list
       ((discrete_choice ))
       ((discrete_choice_list VERTICAL_BAR discrete_choice )))
      (expression
       ((term ))
       ((expression AMPERSAND term )))
      (external_value
       ((EXTERNAL LEFT_PAREN string_list RIGHT_PAREN )
        (wisi-statement-action 2 'open-paren 4 'close-paren))
       ((EXTERNAL_AS_LIST LEFT_PAREN string_list RIGHT_PAREN )
        (wisi-statement-action 2 'open-paren 4 'close-paren)))
      (identifier_opt
       (())
       ((IDENTIFIER )))
      (name
       ((identifier_opt ))
       ((name DOT IDENTIFIER )))
      (project_declaration_opt
       (())
       ((simple_project_declaration )))
      (package_declaration
       ((package_spec )))
      (package_spec
       ((PACKAGE identifier_opt IS simple_declarative_items END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-start 5 'block-end 7 'statement-end)
        (wisi-containing-action 3 4))))
      (project_qualifier_opt
       (())
       ((ABSTRACT ))
       ((STANDARD ))
       ((AGGREGATE ))
       ((AGGREGATE LIBRARY ))
       ((LIBRARY ))
       ((CONFIGURATION )))
      (simple_declarative_item
       ((IDENTIFIER COLON_EQUALS expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 4 'statement-end)
        (wisi-containing-action 1 3)))
       ((IDENTIFIER COLON IDENTIFIER COLON_EQUALS expression SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 6 'statement-end)
        (wisi-containing-action 1 5)))
       ((attribute_declaration ))
       ((case_statement ))
       ((NULL SEMICOLON )
        (wisi-statement-action 1 'statement-start 2 'statement-end)))
      (simple_declarative_items
       (())
       ((simple_declarative_item ))
       ((simple_declarative_items simple_declarative_item )))
      (simple_project_declaration
       ((PROJECT identifier_opt IS declarative_items END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action 1 'statement-start 3 'block-start 5 'block-end 7 'statement-end)
        (wisi-containing-action 3 4))))
      (string_expression
       ((string_primary ))
       ((string_expression AMPERSAND string_primary )))
      (string_primary
       ((STRING_LITERAL ))
       ((name ))
       ((external_value ))
       ((attribute_reference )))
      (string_list
       ((string_expression ))
       ((string_list COMMA string_expression )))
      (term
       ((string_expression ))
       ((LEFT_PAREN RIGHT_PAREN ))
       ((LEFT_PAREN string_list RIGHT_PAREN )
        (wisi-statement-action
        1 'open-paren
        3 'close-paren)))
      (typed_string_declaration
       ((TYPE IDENTIFIER IS LEFT_PAREN string_list RIGHT_PAREN SEMICOLON )
        (wisi-statement-action 1 'statement-start 4 'open-paren 6 'close-paren 7 'statement-end)))
      (with_clause
       ((WITH string_list SEMICOLON ))))
     [((default . error) (ABSTRACT . (context_clause_opt . 0)) (AGGREGATE . (context_clause_opt . 0)) (CONFIGURATION . (context_clause_opt . 0)) (LIBRARY . (context_clause_opt . 0)) (STANDARD . (context_clause_opt . 0)) (PROJECT . (context_clause_opt . 0)) ($EOI . (context_clause_opt . 0)) (WITH .  7))
      ((default . error) ($EOI . (project_qualifier_opt . 1)) (PROJECT . (project_qualifier_opt . 1)))
      ((default . error) (LIBRARY .  30) ($EOI . (project_qualifier_opt . 3)) (PROJECT . (project_qualifier_opt . 3)))
      ((default . error) ($EOI . (project_qualifier_opt . 6)) (PROJECT . (project_qualifier_opt . 6)))
      ((default . error) ($EOI . (project_qualifier_opt . 5)) (PROJECT . (project_qualifier_opt . 5)))
      ((default . error) (IS . (identifier_opt . 0)) (IDENTIFIER .  16))
      ((default . error) ($EOI . (project_qualifier_opt . 2)) (PROJECT . (project_qualifier_opt . 2)))
      ((default . error) (STRING_LITERAL .  17) (EXTERNAL .  18) (EXTERNAL_AS_LIST .  19) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (COMMA . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  16) (PROJECT .  20))
      ((default . error) ($EOI .  15))
      ((default . error) (ABSTRACT . (context_clause_opt . 1)) (AGGREGATE . (context_clause_opt . 1)) (CONFIGURATION . (context_clause_opt . 1)) (LIBRARY . (context_clause_opt . 1)) (STANDARD . (context_clause_opt . 1)) (PROJECT . (context_clause_opt . 1)) ($EOI . (context_clause_opt . 1)) (WITH .  7))
      ((default . error) (PROJECT . (project_qualifier_opt . 0)) ($EOI . (project_qualifier_opt . 0)) (ABSTRACT .  1) (STANDARD .  6) (AGGREGATE .  2) (LIBRARY .  4) (CONFIGURATION .  3))
      ((default . error) ($EOI . (project_declaration_opt . 1)))
      ((default . error) ($EOI . (context_clause . 0)) (PROJECT . (context_clause . 0)) (STANDARD . (context_clause . 0)) (LIBRARY . (context_clause . 0)) (CONFIGURATION . (context_clause . 0)) (AGGREGATE . (context_clause . 0)) (ABSTRACT . (context_clause . 0)) (WITH . (context_clause . 0)))
      ((default . error) ($EOI . (project_declaration_opt . 0)) (PROJECT .  5))
      ((default . error) (WITH . (context_clause . 1)) (ABSTRACT . (context_clause . 1)) (AGGREGATE . (context_clause . 1)) (CONFIGURATION . (context_clause . 1)) (LIBRARY . (context_clause . 1)) (STANDARD . (context_clause . 1)) (PROJECT . (context_clause . 1)) ($EOI . (context_clause . 1)))
      ((default . error) ($EOI . accept) (WITH . accept) (WHEN . accept) (USE . accept) (TYPE . accept) (STANDARD . accept) (RIGHT_PAREN . accept) (PROJECT . accept) (PACKAGE . accept) (OTHERS . accept) (NULL . accept) (LIBRARY . accept) (LEFT_PAREN . accept) (IS . accept) (FOR . accept) (EXTERNAL_AS_LIST . accept) (EXTERNAL . accept) (END . accept) (CONFIGURATION . accept) (CASE . accept) (AGGREGATE . accept) (ABSTRACT . accept) (STRING_LITERAL . accept) (IDENTIFIER . accept) (VERTICAL_BAR . accept) (SEMICOLON . accept) (QUOTE . accept) (EQUAL_GREATER . accept) (DOT . accept) (COMMA . accept) (COLON_EQUALS . accept) (COLON . accept) (AMPERSAND . accept))
      ((default . error) (IS . (identifier_opt . 1)) (RIGHT_PAREN . (identifier_opt . 1)) (COMMA . (identifier_opt . 1)) (DOT . (identifier_opt . 1)) (AMPERSAND . (identifier_opt . 1)) (SEMICOLON . (identifier_opt . 1)) (QUOTE . (identifier_opt . 1)))
      ((default . error) (RIGHT_PAREN . (string_primary . 0)) (COMMA . (string_primary . 0)) (AMPERSAND . (string_primary . 0)) (SEMICOLON . (string_primary . 0)))
      ((default . error) (LEFT_PAREN .  38))
      ((default . error) (LEFT_PAREN .  37))
      ((default . error) (QUOTE . (attribute_prefix . 0)))
      ((default . error) (QUOTE .  36))
      ((default . error) (RIGHT_PAREN . (string_primary . 3)) (COMMA . (string_primary . 3)) (AMPERSAND . (string_primary . 3)) (SEMICOLON . (string_primary . 3)))
      ((default . error) (RIGHT_PAREN . (string_primary . 2)) (COMMA . (string_primary . 2)) (AMPERSAND . (string_primary . 2)) (SEMICOLON . (string_primary . 2)))
      ((default . error) (IS . (name . 0)) (COMMA . (name . 0)) (RIGHT_PAREN . (name . 0)) (SEMICOLON . (name . 0)) (AMPERSAND . (name . 0)) (DOT . (name . 0)) (QUOTE . (name . 0)))
      ((default . error) (RIGHT_PAREN . (string_primary . 1)) (COMMA . (string_primary . 1)) (AMPERSAND . (string_primary . 1)) (SEMICOLON . (string_primary . 1)) (DOT .  35) (QUOTE . (attribute_prefix . 1)))
      ((default . error) (SEMICOLON . (string_list . 0)) (RIGHT_PAREN . (string_list . 0)) (COMMA . (string_list . 0)) (AMPERSAND .  34))
      ((default . error) (COMMA . (string_expression . 0)) (RIGHT_PAREN . (string_expression . 0)) (SEMICOLON . (string_expression . 0)) (AMPERSAND . (string_expression . 0)))
      ((default . error) (COMMA .  32) (SEMICOLON .  33))
      ((default . error) (IS .  31))
      ((default . error) ($EOI . (project_qualifier_opt . 4)) (PROJECT . (project_qualifier_opt . 4)))
      ((default . error) (END . (declarative_items . 0)) (TYPE . ((declarative_items . 0)  51)) (IDENTIFIER . ((declarative_items . 0)  46)) (NULL . ((declarative_items . 0)  49)) (CASE . ((declarative_items . 0)  47)) (FOR . ((declarative_items . 0)  48)) (PACKAGE . ((declarative_items . 0)  50)))
      ((default . error) (STRING_LITERAL .  17) (EXTERNAL .  18) (EXTERNAL_AS_LIST .  19) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (RIGHT_PAREN . (identifier_opt . 0)) (COMMA . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  16) (PROJECT .  20))
      ((default . error) (WITH . (with_clause . 0)) (ABSTRACT . (with_clause . 0)) (AGGREGATE . (with_clause . 0)) (CONFIGURATION . (with_clause . 0)) (LIBRARY . (with_clause . 0)) (STANDARD . (with_clause . 0)) (PROJECT . (with_clause . 0)) ($EOI . (with_clause . 0)))
      ((default . error) (STRING_LITERAL .  17) (EXTERNAL .  18) (EXTERNAL_AS_LIST .  19) (DOT . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (COMMA . (identifier_opt . 0)) (RIGHT_PAREN . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  16) (PROJECT .  20))
      ((default . error) (IDENTIFIER .  43))
      ((default . error) (IDENTIFIER .  42))
      ((default . error) (STRING_LITERAL .  17) (EXTERNAL .  18) (EXTERNAL_AS_LIST .  19) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (RIGHT_PAREN . (identifier_opt . 0)) (COMMA . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  16) (PROJECT .  20))
      ((default . error) (STRING_LITERAL .  17) (EXTERNAL .  18) (EXTERNAL_AS_LIST .  19) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (RIGHT_PAREN . (identifier_opt . 0)) (COMMA . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  16) (PROJECT .  20))
      ((default . error) ($EOI . (compilation_unit . 0)))
      ((default . error) (COMMA .  32) (RIGHT_PAREN .  71))
      ((default . error) (COMMA .  32) (RIGHT_PAREN .  70))
      ((default . error) (LEFT_PAREN .  69) (COMMA . (attribute_reference . 0)) (RIGHT_PAREN . (attribute_reference . 0)) (SEMICOLON . (attribute_reference . 0)) (AMPERSAND . (attribute_reference . 0)))
      ((default . error) (IS . (name . 1)) (COMMA . (name . 1)) (RIGHT_PAREN . (name . 1)) (SEMICOLON . (name . 1)) (AMPERSAND . (name . 1)) (DOT . (name . 1)) (QUOTE . (name . 1)))
      ((default . error) (SEMICOLON . (string_expression . 1)) (COMMA . (string_expression . 1)) (RIGHT_PAREN . (string_expression . 1)) (AMPERSAND . (string_expression . 1)))
      ((default . error) (AMPERSAND .  34) (RIGHT_PAREN . (string_list . 1)) (SEMICOLON . (string_list . 1)) (COMMA . (string_list . 1)))
      ((default . error) (COLON .  67) (COLON_EQUALS .  68))
      ((default . error) (DOT . (identifier_opt . 0)) (IS . (identifier_opt . 0)) (IDENTIFIER .  16))
      ((default . error) (IDENTIFIER .  65))
      ((default . error) (SEMICOLON .  64))
      ((default . error) (IS . (identifier_opt . 0)) (IDENTIFIER .  16))
      ((default . error) (IDENTIFIER .  62))
      ((default . error) (WHEN . (simple_declarative_item . 2)) (END . (simple_declarative_item . 2)) (IDENTIFIER . (simple_declarative_item . 2)) (CASE . (simple_declarative_item . 2)) (FOR . (simple_declarative_item . 2)) (NULL . (simple_declarative_item . 2)) (PACKAGE . (simple_declarative_item . 2)) (TYPE . (simple_declarative_item . 2)))
      ((default . error) (WHEN . (simple_declarative_item . 3)) (END . (simple_declarative_item . 3)) (IDENTIFIER . (simple_declarative_item . 3)) (CASE . (simple_declarative_item . 3)) (FOR . (simple_declarative_item . 3)) (NULL . (simple_declarative_item . 3)) (PACKAGE . (simple_declarative_item . 3)) (TYPE . (simple_declarative_item . 3)))
      ((default . error) (WHEN . (declarative_items . 1)) (END . (declarative_items . 1)) (IDENTIFIER . (declarative_items . 1)) (CASE . (declarative_items . 1)) (FOR . (declarative_items . 1)) (NULL . (declarative_items . 1)) (PACKAGE . (declarative_items . 1)) (TYPE . (declarative_items . 1)))
      ((default . error) (END .  60) (TYPE .  51) (IDENTIFIER .  46) (NULL .  49) (CASE .  47) (FOR .  48) (PACKAGE .  50))
      ((default . error) (WHEN . (declarative_item . 2)) (END . (declarative_item . 2)) (TYPE . (declarative_item . 2)) (PACKAGE . (declarative_item . 2)) (NULL . (declarative_item . 2)) (FOR . (declarative_item . 2)) (CASE . (declarative_item . 2)) (IDENTIFIER . (declarative_item . 2)))
      ((default . error) (WHEN . (package_declaration . 0)) (END . (package_declaration . 0)) (IDENTIFIER . (package_declaration . 0)) (CASE . (package_declaration . 0)) (FOR . (package_declaration . 0)) (NULL . (package_declaration . 0)) (PACKAGE . (package_declaration . 0)) (TYPE . (package_declaration . 0)))
      ((default . error) (WHEN . (declarative_item . 0)) (END . (declarative_item . 0)) (TYPE . (declarative_item . 0)) (PACKAGE . (declarative_item . 0)) (NULL . (declarative_item . 0)) (FOR . (declarative_item . 0)) (CASE . (declarative_item . 0)) (IDENTIFIER . (declarative_item . 0)))
      ((default . error) (WHEN . (declarative_item . 1)) (END . (declarative_item . 1)) (TYPE . (declarative_item . 1)) (PACKAGE . (declarative_item . 1)) (NULL . (declarative_item . 1)) (FOR . (declarative_item . 1)) (CASE . (declarative_item . 1)) (IDENTIFIER . (declarative_item . 1)))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  16))
      ((default . error) (WHEN . (declarative_items . 2)) (TYPE . (declarative_items . 2)) (PACKAGE . (declarative_items . 2)) (NULL . (declarative_items . 2)) (FOR . (declarative_items . 2)) (CASE . (declarative_items . 2)) (IDENTIFIER . (declarative_items . 2)) (END . (declarative_items . 2)))
      ((default . error) (IS .  82))
      ((default . error) (IS .  81))
      ((default . error) (WHEN . (simple_declarative_item . 4)) (TYPE . (simple_declarative_item . 4)) (PACKAGE . (simple_declarative_item . 4)) (NULL . (simple_declarative_item . 4)) (FOR . (simple_declarative_item . 4)) (CASE . (simple_declarative_item . 4)) (IDENTIFIER . (simple_declarative_item . 4)) (END . (simple_declarative_item . 4)))
      ((default . error) (USE .  80) (LEFT_PAREN .  79))
      ((default . error) (DOT .  35) (IS .  78))
      ((default . error) (IDENTIFIER .  77))
      ((default . error) (LEFT_PAREN .  73) (STRING_LITERAL .  17) (EXTERNAL .  18) (EXTERNAL_AS_LIST .  19) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  16) (PROJECT .  20))
      ((default . error) (STRING_LITERAL .  72))
      ((default . error) (AMPERSAND . (external_value . 1)) (SEMICOLON . (external_value . 1)) (RIGHT_PAREN . (external_value . 1)) (COMMA . (external_value . 1)))
      ((default . error) (AMPERSAND . (external_value . 0)) (SEMICOLON . (external_value . 0)) (RIGHT_PAREN . (external_value . 0)) (COMMA . (external_value . 0)))
      ((default . error) (RIGHT_PAREN .  98))
      ((default . error) (STRING_LITERAL .  17) (EXTERNAL .  18) (EXTERNAL_AS_LIST .  19) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (RIGHT_PAREN . ( 96 (identifier_opt . 0))) (COMMA . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  16) (PROJECT .  20))
      ((default . error) (AMPERSAND .  94) (SEMICOLON .  95))
      ((default . error) (SEMICOLON . (term . 0)) (AMPERSAND . ((term . 0)  34)))
      ((default . error) (SEMICOLON . (expression . 0)) (AMPERSAND . (expression . 0)))
      ((default . error) (COLON_EQUALS .  93))
      ((default . error) (END . (case_items . 0)) (WHEN . ((case_items . 0)  90)))
      ((default . error) (STRING_LITERAL .  89))
      ((default . error) (LEFT_PAREN .  73) (STRING_LITERAL .  17) (EXTERNAL .  18) (EXTERNAL_AS_LIST .  19) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  16) (PROJECT .  20))
      ((default . error) (END . (simple_declarative_items . 0)) (IDENTIFIER . ((simple_declarative_items . 0)  46)) (NULL . ((simple_declarative_items . 0)  49)) (CASE . ((simple_declarative_items . 0)  47)) (FOR . ((simple_declarative_items . 0)  48)))
      ((default . error) (LEFT_PAREN .  85))
      ((default . error) (SEMICOLON .  84))
      ((default . error) ($EOI . (simple_project_declaration . 0)))
      ((default . error) (STRING_LITERAL .  17) (EXTERNAL .  18) (EXTERNAL_AS_LIST .  19) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (RIGHT_PAREN . (identifier_opt . 0)) (COMMA . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  16) (PROJECT .  20))
      ((default . error) (END . (simple_declarative_items . 1)) (IDENTIFIER . (simple_declarative_items . 1)) (CASE . (simple_declarative_items . 1)) (FOR . (simple_declarative_items . 1)) (NULL . (simple_declarative_items . 1)))
      ((default . error) (END .  110) (IDENTIFIER .  46) (NULL .  49) (CASE .  47) (FOR .  48))
      ((default . error) (AMPERSAND .  94) (SEMICOLON .  109))
      ((default . error) (RIGHT_PAREN .  108))
      ((default . error) (VERTICAL_BAR . (discrete_choice . 0)) (EQUAL_GREATER . (discrete_choice . 0)) (STRING_LITERAL .  104) (OTHERS .  105))
      ((default . error) (END . (case_items . 1)) (WHEN . (case_items . 1)))
      ((default . error) (END .  102) (WHEN .  90))
      ((default . error) (LEFT_PAREN .  73) (STRING_LITERAL .  17) (EXTERNAL .  18) (EXTERNAL_AS_LIST .  19) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  16) (PROJECT .  20))
      ((default . error) (LEFT_PAREN .  73) (STRING_LITERAL .  17) (EXTERNAL .  18) (EXTERNAL_AS_LIST .  19) (DOT . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  16) (PROJECT .  20))
      ((default . error) (WHEN . (simple_declarative_item . 0)) (TYPE . (simple_declarative_item . 0)) (PACKAGE . (simple_declarative_item . 0)) (NULL . (simple_declarative_item . 0)) (FOR . (simple_declarative_item . 0)) (CASE . (simple_declarative_item . 0)) (IDENTIFIER . (simple_declarative_item . 0)) (END . (simple_declarative_item . 0)))
      ((default . error) (SEMICOLON . (term . 1)) (AMPERSAND . (term . 1)))
      ((default . error) (COMMA .  32) (RIGHT_PAREN .  99))
      ((default . error) (AMPERSAND . (attribute_reference . 1)) (SEMICOLON . (attribute_reference . 1)) (RIGHT_PAREN . (attribute_reference . 1)) (COMMA . (attribute_reference . 1)))
      ((default . error) (AMPERSAND . (term . 2)) (SEMICOLON . (term . 2)))
      ((default . error) (SEMICOLON . (expression . 1)) (AMPERSAND . (expression . 1)))
      ((default . error) (AMPERSAND .  94) (SEMICOLON .  119))
      ((default . error) (CASE .  118))
      ((default . error) (WHEN . (case_items . 2)) (END . (case_items . 2)))
      ((default . error) (VERTICAL_BAR . (discrete_choice . 1)) (EQUAL_GREATER . (discrete_choice . 1)))
      ((default . error) (VERTICAL_BAR . (discrete_choice . 2)) (EQUAL_GREATER . (discrete_choice . 2)))
      ((default . error) (EQUAL_GREATER . (discrete_choice_list . 0)) (VERTICAL_BAR . (discrete_choice_list . 0)))
      ((default . error) (VERTICAL_BAR .  117) (EQUAL_GREATER .  116))
      ((default . error) (USE .  115))
      ((default . error) (WHEN . (attribute_declaration . 0)) (END . (attribute_declaration . 0)) (TYPE . (attribute_declaration . 0)) (PACKAGE . (attribute_declaration . 0)) (NULL . (attribute_declaration . 0)) (FOR . (attribute_declaration . 0)) (CASE . (attribute_declaration . 0)) (IDENTIFIER . (attribute_declaration . 0)))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  16))
      ((default . error) (NULL . (simple_declarative_items . 2)) (FOR . (simple_declarative_items . 2)) (CASE . (simple_declarative_items . 2)) (IDENTIFIER . (simple_declarative_items . 2)) (END . (simple_declarative_items . 2)))
      ((default . error) (COMMA .  32) (RIGHT_PAREN .  113))
      ((default . error) (SEMICOLON .  125))
      ((default . error) (SEMICOLON .  124))
      ((default . error) (LEFT_PAREN .  73) (STRING_LITERAL .  17) (EXTERNAL .  18) (EXTERNAL_AS_LIST .  19) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  16) (PROJECT .  20))
      ((default . error) (END . (declarative_items . 0)) (WHEN . (declarative_items . 0)) (TYPE . ((declarative_items . 0)  51)) (IDENTIFIER . ((declarative_items . 0)  46)) (NULL . ((declarative_items . 0)  49)) (CASE . ((declarative_items . 0)  47)) (FOR . ((declarative_items . 0)  48)) (PACKAGE . ((declarative_items . 0)  50)))
      ((default . error) (EQUAL_GREATER . (discrete_choice . 0)) (VERTICAL_BAR . (discrete_choice . 0)) (STRING_LITERAL .  104) (OTHERS .  105))
      ((default . error) (SEMICOLON .  120))
      ((default . error) (WHEN . (simple_declarative_item . 1)) (TYPE . (simple_declarative_item . 1)) (PACKAGE . (simple_declarative_item . 1)) (NULL . (simple_declarative_item . 1)) (FOR . (simple_declarative_item . 1)) (CASE . (simple_declarative_item . 1)) (IDENTIFIER . (simple_declarative_item . 1)) (END . (simple_declarative_item . 1)))
      ((default . error) (WHEN . (case_statement . 0)) (END . (case_statement . 0)) (TYPE . (case_statement . 0)) (PACKAGE . (case_statement . 0)) (NULL . (case_statement . 0)) (FOR . (case_statement . 0)) (CASE . (case_statement . 0)) (IDENTIFIER . (case_statement . 0)))
      ((default . error) (EQUAL_GREATER . (discrete_choice_list . 1)) (VERTICAL_BAR . (discrete_choice_list . 1)))
      ((default . error) (END . (case_item . 0)) (WHEN . (case_item . 0)) (TYPE .  51) (IDENTIFIER .  46) (NULL .  49) (CASE .  47) (FOR .  48) (PACKAGE .  50))
      ((default . error) (AMPERSAND .  94) (SEMICOLON .  126))
      ((default . error) (WHEN . (package_spec . 0)) (END . (package_spec . 0)) (TYPE . (package_spec . 0)) (PACKAGE . (package_spec . 0)) (NULL . (package_spec . 0)) (FOR . (package_spec . 0)) (CASE . (package_spec . 0)) (IDENTIFIER . (package_spec . 0)))
      ((default . error) (WHEN . (typed_string_declaration . 0)) (END . (typed_string_declaration . 0)) (IDENTIFIER . (typed_string_declaration . 0)) (CASE . (typed_string_declaration . 0)) (FOR . (typed_string_declaration . 0)) (NULL . (typed_string_declaration . 0)) (PACKAGE . (typed_string_declaration . 0)) (TYPE . (typed_string_declaration . 0)))
      ((default . error) (WHEN . (attribute_declaration . 1)) (IDENTIFIER . (attribute_declaration . 1)) (CASE . (attribute_declaration . 1)) (FOR . (attribute_declaration . 1)) (NULL . (attribute_declaration . 1)) (PACKAGE . (attribute_declaration . 1)) (TYPE . (attribute_declaration . 1)) (END . (attribute_declaration . 1)))]
     [((compilation_unit . 8)(context_clause . 9)(context_clause_opt . 10)(simple_project_declaration . 11)(with_clause . 12))
      nil
      nil
      nil
      nil
      ((identifier_opt . 29))
      nil
      ((attribute_prefix . 21)(attribute_reference . 22)(external_value . 23)(identifier_opt . 24)(name . 25)(string_expression . 26)(string_primary . 27)(string_list . 28))
      nil
      ((with_clause . 14))
      ((project_qualifier_opt . 13))
      nil
      nil
      ((project_declaration_opt . 39)(simple_project_declaration . 11))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_declaration . 52)(case_statement . 53)(declarative_item . 54)(declarative_items . 55)(package_declaration . 56)(package_spec . 57)(simple_declarative_item . 58)(typed_string_declaration . 59))
      ((attribute_prefix . 21)(attribute_reference . 22)(external_value . 23)(identifier_opt . 24)(name . 25)(string_expression . 45)(string_primary . 27))
      nil
      ((attribute_prefix . 21)(attribute_reference . 22)(external_value . 23)(identifier_opt . 24)(name . 25)(string_primary . 44))
      nil
      nil
      ((attribute_prefix . 21)(attribute_reference . 22)(external_value . 23)(identifier_opt . 24)(name . 25)(string_expression . 26)(string_primary . 27)(string_list . 41))
      ((attribute_prefix . 21)(attribute_reference . 22)(external_value . 23)(identifier_opt . 24)(name . 25)(string_expression . 26)(string_primary . 27)(string_list . 40))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((identifier_opt . 24)(name . 66))
      nil
      nil
      ((identifier_opt . 63))
      nil
      nil
      nil
      nil
      ((attribute_declaration . 52)(case_statement . 53)(declarative_item . 61)(package_declaration . 56)(package_spec . 57)(simple_declarative_item . 58)(typed_string_declaration . 59))
      nil
      nil
      nil
      nil
      ((identifier_opt . 83))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_prefix . 21)(attribute_reference . 22)(expression . 74)(external_value . 23)(identifier_opt . 24)(name . 25)(string_expression . 75)(string_primary . 27)(term . 76))
      nil
      nil
      nil
      nil
      ((attribute_prefix . 21)(attribute_reference . 22)(external_value . 23)(identifier_opt . 24)(name . 25)(string_expression . 26)(string_primary . 27)(string_list . 97))
      nil
      nil
      nil
      nil
      ((case_item . 91)(case_items . 92))
      nil
      ((attribute_prefix . 21)(attribute_reference . 22)(expression . 88)(external_value . 23)(identifier_opt . 24)(name . 25)(string_expression . 75)(string_primary . 27)(term . 76))
      ((attribute_declaration . 52)(case_statement . 53)(simple_declarative_item . 86)(simple_declarative_items . 87))
      nil
      nil
      nil
      ((attribute_prefix . 21)(attribute_reference . 22)(external_value . 23)(identifier_opt . 24)(name . 25)(string_expression . 26)(string_primary . 27)(string_list . 112))
      nil
      ((attribute_declaration . 52)(case_statement . 53)(simple_declarative_item . 111))
      nil
      nil
      ((discrete_choice . 106)(discrete_choice_list . 107))
      nil
      ((case_item . 103))
      ((attribute_prefix . 21)(attribute_reference . 22)(expression . 101)(external_value . 23)(identifier_opt . 24)(name . 25)(string_expression . 75)(string_primary . 27)(term . 76))
      ((attribute_prefix . 21)(attribute_reference . 22)(external_value . 23)(identifier_opt . 24)(name . 25)(string_expression . 75)(string_primary . 27)(term . 100))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((identifier_opt . 114))
      nil
      nil
      nil
      nil
      ((attribute_prefix . 21)(attribute_reference . 22)(expression . 123)(external_value . 23)(identifier_opt . 24)(name . 25)(string_expression . 75)(string_primary . 27)(term . 76))
      ((attribute_declaration . 52)(case_statement . 53)(declarative_item . 54)(declarative_items . 122)(package_declaration . 56)(package_spec . 57)(simple_declarative_item . 58)(typed_string_declaration . 59))
      ((discrete_choice . 121))
      nil
      nil
      nil
      nil
      ((attribute_declaration . 52)(case_statement . 53)(declarative_item . 61)(package_declaration . 56)(package_spec . 57)(simple_declarative_item . 58)(typed_string_declaration . 59))
      nil
      nil
      nil
      nil]))
  "Parser table.")

(provide 'gpr-grammar-wy)

;; end of file
