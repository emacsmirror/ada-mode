;;; gpr-grammar-wy.el --- Generated parser support file  -*- lexical-binding:t -*-

;; Copyright (C) 2013 - 2015 Free Software Foundation, Inc.

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
    ("extends" . EXTENDS)
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
    ("renames" . RENAMES)
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
   '((AMPERSAND COLON COLON_EQUALS COMMA DOT EQUAL_GREATER QUOTE SEMICOLON VERTICAL_BAR IDENTIFIER STRING_LITERAL ABSTRACT AGGREGATE CASE CONFIGURATION END EXTENDS EXTERNAL EXTERNAL_AS_LIST FOR IS LEFT_PAREN LIBRARY NULL OTHERS PACKAGE PROJECT RENAMES RIGHT_PAREN STANDARD TYPE USE WHEN WITH )
     ((aggregate
       ((LEFT_PAREN string_list RIGHT_PAREN )
        (progn
        (wisi-statement-action [1 open-paren 3 close-paren])
        (wisi-containing-action 1 2))))
      (attribute_declaration
       ((FOR IDENTIFIER USE expression SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 3 statement-other 5 statement-end])
        (wisi-containing-action 3 4)))
       ((FOR IDENTIFIER LEFT_PAREN STRING_LITERAL RIGHT_PAREN USE expression SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 3 open-paren 5 close-paren 6 statement-other 8 statement-end])
        (wisi-containing-action 6 7)))
       ((FOR EXTERNAL LEFT_PAREN STRING_LITERAL RIGHT_PAREN USE expression SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 3 open-paren 5 close-paren 6 statement-other 8 statement-end])
        (wisi-containing-action 6 7))))
      (attribute_prefix
       ((PROJECT ))
       ((name )))
      (attribute_reference
       ((attribute_prefix QUOTE IDENTIFIER ))
       ((attribute_prefix QUOTE IDENTIFIER LEFT_PAREN STRING_LITERAL RIGHT_PAREN )
        (wisi-statement-action [4 open-paren 6 close-paren])))
      (case_statement
       ((CASE name IS case_items END CASE SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 3 block-start 5 block-end 7 statement-end])
        (wisi-containing-action 3 4))))
      (case_item
       ((WHEN discrete_choice_list EQUAL_GREATER declarative_items_opt )
        (progn
        (wisi-statement-action [1 block-middle 3 block-start])
        (wisi-containing-action 1 3)
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
       ((declarative_item ))
       ((declarative_items declarative_item )))
      (declarative_items_opt
       (())
       ((declarative_items )))
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
       ((EXTERNAL aggregate ))
       ((EXTERNAL_AS_LIST aggregate )))
      (identifier_opt
       (())
       ((IDENTIFIER )))
      (name
       ((identifier_opt ))
       ((name DOT IDENTIFIER )))
      (project_declaration_opt
       (())
       ((simple_project_declaration ))
       ((project_extension )))
      (package_declaration
       ((package_spec ))
       ((package_extension ))
       ((package_renaming )))
      (package_spec
       ((PACKAGE identifier_opt IS declarative_items_opt END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 3 block-start 5 block-end 7 statement-end])
        (wisi-containing-action 3 4))))
      (package_extension
       ((PACKAGE identifier_opt EXTENDS name IS declarative_items_opt END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 5 block-start 7 block-end 9 statement-end])
        (wisi-containing-action 5 6))))
      (package_renaming
       ((PACKAGE identifier_opt RENAMES name SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 3 statement-other 5 statement-end])
        (wisi-containing-action 3 4))))
      (project_extension
       ((PROJECT identifier_opt EXTENDS STRING_LITERAL IS declarative_items_opt END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 5 block-start 7 block-end 9 statement-end])
        (wisi-containing-action 5 6))))
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
        (wisi-statement-action [1 statement-start 4 statement-end])
        (wisi-containing-action 1 3)))
       ((IDENTIFIER COLON IDENTIFIER COLON_EQUALS expression SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 6 statement-end])
        (wisi-containing-action 1 5)))
       ((attribute_declaration ))
       ((case_statement ))
       ((NULL SEMICOLON )
        (wisi-statement-action [1 statement-start 2 statement-end])))
      (simple_project_declaration
       ((PROJECT identifier_opt IS declarative_items_opt END identifier_opt SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 3 block-start 5 block-end 7 statement-end])
        (wisi-containing-action 3 4))))
      (string_expression
       ((string_primary )))
      (string_primary
       ((STRING_LITERAL ))
       ((name ))
       ((external_value ))
       ((attribute_reference )))
      (string_list
       ((expression ))
       ((string_list COMMA expression )
        (progn
        (wisi-statement-action [2 list-break])
        (wisi-containing-action 2 3))))
      (term
       ((string_expression ))
       ((LEFT_PAREN RIGHT_PAREN ))
       ((aggregate )))
      (typed_string_declaration
       ((TYPE IDENTIFIER IS aggregate SEMICOLON )
        (progn
        (wisi-statement-action [1 statement-start 5 statement-end])
        (wisi-containing-action 1 4))))
      (with_clause
       ((WITH string_list SEMICOLON ))))
     [((default . error) (ABSTRACT . (context_clause_opt . 0)) (AGGREGATE . (context_clause_opt . 0)) (CONFIGURATION . (context_clause_opt . 0)) (LIBRARY . (context_clause_opt . 0)) (STANDARD . (context_clause_opt . 0)) (PROJECT . (context_clause_opt . 0)) ($EOI . (context_clause_opt . 0)) (WITH .  7))
      ((default . error) ($EOI . (project_qualifier_opt . 1)) (PROJECT . (project_qualifier_opt . 1)))
      ((default . error) (LIBRARY .  35) ($EOI . (project_qualifier_opt . 3)) (PROJECT . (project_qualifier_opt . 3)))
      ((default . error) ($EOI . (project_qualifier_opt . 6)) (PROJECT . (project_qualifier_opt . 6)))
      ((default . error) ($EOI . (project_qualifier_opt . 5)) (PROJECT . (project_qualifier_opt . 5)))
      ((default . error) (EXTENDS . (identifier_opt . 0)) (IS . (identifier_opt . 0)) (IDENTIFIER .  21))
      ((default . error) ($EOI . (project_qualifier_opt . 2)) (PROJECT . (project_qualifier_opt . 2)))
      ((default . error) (LEFT_PAREN .  19) (STRING_LITERAL .  22) (EXTERNAL .  17) (EXTERNAL_AS_LIST .  18) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (COMMA . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  21) (PROJECT .  20))
      ((default . error) ($EOI .  16))
      ((default . error) (ABSTRACT . (context_clause_opt . 1)) (AGGREGATE . (context_clause_opt . 1)) (CONFIGURATION . (context_clause_opt . 1)) (LIBRARY . (context_clause_opt . 1)) (STANDARD . (context_clause_opt . 1)) (PROJECT . (context_clause_opt . 1)) ($EOI . (context_clause_opt . 1)) (WITH .  7))
      ((default . error) (PROJECT . (project_qualifier_opt . 0)) ($EOI . (project_qualifier_opt . 0)) (ABSTRACT .  1) (STANDARD .  6) (AGGREGATE .  2) (LIBRARY .  4) (CONFIGURATION .  3))
      ((default . error) ($EOI . (project_declaration_opt . 2)))
      ((default . error) ($EOI . (project_declaration_opt . 1)))
      ((default . error) ($EOI . (context_clause . 0)) (PROJECT . (context_clause . 0)) (STANDARD . (context_clause . 0)) (LIBRARY . (context_clause . 0)) (CONFIGURATION . (context_clause . 0)) (AGGREGATE . (context_clause . 0)) (ABSTRACT . (context_clause . 0)) (WITH . (context_clause . 0)))
      ((default . error) ($EOI . (project_declaration_opt . 0)) (PROJECT .  5))
      ((default . error) (WITH . (context_clause . 1)) (ABSTRACT . (context_clause . 1)) (AGGREGATE . (context_clause . 1)) (CONFIGURATION . (context_clause . 1)) (LIBRARY . (context_clause . 1)) (STANDARD . (context_clause . 1)) (PROJECT . (context_clause . 1)) ($EOI . (context_clause . 1)))
      ((default . error) ($EOI . accept) (STRING_LITERAL . accept) (IDENTIFIER . accept) (VERTICAL_BAR . accept) (SEMICOLON . accept) (QUOTE . accept) (EQUAL_GREATER . accept) (DOT . accept) (COMMA . accept) (COLON_EQUALS . accept) (COLON . accept) (AMPERSAND . accept) (WITH . accept) (WHEN . accept) (USE . accept) (TYPE . accept) (STANDARD . accept) (RIGHT_PAREN . accept) (RENAMES . accept) (PROJECT . accept) (PACKAGE . accept) (OTHERS . accept) (NULL . accept) (LIBRARY . accept) (LEFT_PAREN . accept) (IS . accept) (FOR . accept) (EXTERNAL_AS_LIST . accept) (EXTERNAL . accept) (EXTENDS . accept) (END . accept) (CONFIGURATION . accept) (CASE . accept) (AGGREGATE . accept) (ABSTRACT . accept))
      ((default . error) (LEFT_PAREN .  45))
      ((default . error) (LEFT_PAREN .  45))
      ((default . error) (LEFT_PAREN .  19) (STRING_LITERAL .  22) (EXTERNAL .  17) (EXTERNAL_AS_LIST .  18) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (RIGHT_PAREN . ( 43 (identifier_opt . 0))) (COMMA . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  21) (PROJECT .  20))
      ((default . error) (QUOTE . (attribute_prefix . 0)))
      ((default . error) (RIGHT_PAREN . (identifier_opt . 1)) (COMMA . (identifier_opt . 1)) (EXTENDS . (identifier_opt . 1)) (RENAMES . (identifier_opt . 1)) (IS . (identifier_opt . 1)) (DOT . (identifier_opt . 1)) (AMPERSAND . (identifier_opt . 1)) (QUOTE . (identifier_opt . 1)) (SEMICOLON . (identifier_opt . 1)))
      ((default . error) (RIGHT_PAREN . (string_primary . 0)) (COMMA . (string_primary . 0)) (AMPERSAND . (string_primary . 0)) (SEMICOLON . (string_primary . 0)))
      ((default . error) (RIGHT_PAREN . (term . 2)) (COMMA . (term . 2)) (AMPERSAND . (term . 2)) (SEMICOLON . (term . 2)))
      ((default . error) (QUOTE .  42))
      ((default . error) (RIGHT_PAREN . (string_primary . 3)) (COMMA . (string_primary . 3)) (AMPERSAND . (string_primary . 3)) (SEMICOLON . (string_primary . 3)))
      ((default . error) (SEMICOLON . (string_list . 0)) (RIGHT_PAREN . (string_list . 0)) (COMMA . (string_list . 0)) (AMPERSAND .  41))
      ((default . error) (RIGHT_PAREN . (string_primary . 2)) (COMMA . (string_primary . 2)) (AMPERSAND . (string_primary . 2)) (SEMICOLON . (string_primary . 2)))
      ((default . error) (COMMA . (name . 0)) (RIGHT_PAREN . (name . 0)) (IS . (name . 0)) (SEMICOLON . (name . 0)) (AMPERSAND . (name . 0)) (DOT . (name . 0)) (QUOTE . (name . 0)))
      ((default . error) (RIGHT_PAREN . (string_primary . 1)) (COMMA . (string_primary . 1)) (AMPERSAND . (string_primary . 1)) (SEMICOLON . (string_primary . 1)) (DOT .  40) (QUOTE . (attribute_prefix . 1)))
      ((default . error) (RIGHT_PAREN . (term . 0)) (COMMA . (term . 0)) (AMPERSAND . (term . 0)) (SEMICOLON . (term . 0)))
      ((default . error) (COMMA . (string_expression . 0)) (RIGHT_PAREN . (string_expression . 0)) (SEMICOLON . (string_expression . 0)) (AMPERSAND . (string_expression . 0)))
      ((default . error) (COMMA .  38) (SEMICOLON .  39))
      ((default . error) (COMMA . (expression . 0)) (RIGHT_PAREN . (expression . 0)) (SEMICOLON . (expression . 0)) (AMPERSAND . (expression . 0)))
      ((default . error) (EXTENDS .  36) (IS .  37))
      ((default . error) ($EOI . (project_qualifier_opt . 4)) (PROJECT . (project_qualifier_opt . 4)))
      ((default . error) (STRING_LITERAL .  71))
      ((default . error) (END . (declarative_items_opt . 0)) (TYPE .  58) (IDENTIFIER .  59) (NULL .  56) (CASE .  54) (FOR .  55) (PACKAGE .  57))
      ((default . error) (LEFT_PAREN .  19) (STRING_LITERAL .  22) (EXTERNAL .  17) (EXTERNAL_AS_LIST .  18) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (RIGHT_PAREN . (identifier_opt . 0)) (COMMA . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  21) (PROJECT .  20))
      ((default . error) (WITH . (with_clause . 0)) (ABSTRACT . (with_clause . 0)) (AGGREGATE . (with_clause . 0)) (CONFIGURATION . (with_clause . 0)) (LIBRARY . (with_clause . 0)) (STANDARD . (with_clause . 0)) (PROJECT . (with_clause . 0)) ($EOI . (with_clause . 0)))
      ((default . error) (IDENTIFIER .  52))
      ((default . error) (LEFT_PAREN .  19) (STRING_LITERAL .  22) (EXTERNAL .  17) (EXTERNAL_AS_LIST .  18) (DOT . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (COMMA . (identifier_opt . 0)) (RIGHT_PAREN . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  21) (PROJECT .  20))
      ((default . error) (IDENTIFIER .  50))
      ((default . error) (SEMICOLON . (term . 1)) (AMPERSAND . (term . 1)) (COMMA . (term . 1)) (RIGHT_PAREN . (term . 1)))
      ((default . error) (COMMA .  38) (RIGHT_PAREN .  49))
      ((default . error) (LEFT_PAREN .  19) (STRING_LITERAL .  22) (EXTERNAL .  17) (EXTERNAL_AS_LIST .  18) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (RIGHT_PAREN . (identifier_opt . 0)) (COMMA . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  21) (PROJECT .  20))
      ((default . error) (AMPERSAND . (external_value . 1)) (SEMICOLON . (external_value . 1)) (RIGHT_PAREN . (external_value . 1)) (COMMA . (external_value . 1)))
      ((default . error) (AMPERSAND . (external_value . 0)) (SEMICOLON . (external_value . 0)) (RIGHT_PAREN . (external_value . 0)) (COMMA . (external_value . 0)))
      ((default . error) ($EOI . (compilation_unit . 0)))
      ((default . error) (COMMA . (aggregate . 0)) (RIGHT_PAREN . (aggregate . 0)) (SEMICOLON . (aggregate . 0)) (AMPERSAND . (aggregate . 0)))
      ((default . error) (LEFT_PAREN .  83) (COMMA . (attribute_reference . 0)) (RIGHT_PAREN . (attribute_reference . 0)) (SEMICOLON . (attribute_reference . 0)) (AMPERSAND . (attribute_reference . 0)))
      ((default . error) (SEMICOLON . (expression . 1)) (COMMA . (expression . 1)) (RIGHT_PAREN . (expression . 1)) (AMPERSAND . (expression . 1)))
      ((default . error) (IS . (name . 1)) (COMMA . (name . 1)) (RIGHT_PAREN . (name . 1)) (SEMICOLON . (name . 1)) (AMPERSAND . (name . 1)) (DOT . (name . 1)) (QUOTE . (name . 1)))
      ((default . error) (AMPERSAND .  41) (RIGHT_PAREN . (string_list . 1)) (SEMICOLON . (string_list . 1)) (COMMA . (string_list . 1)))
      ((default . error) (DOT . (identifier_opt . 0)) (IS . (identifier_opt . 0)) (IDENTIFIER .  21))
      ((default . error) (EXTERNAL .  80) (IDENTIFIER .  81))
      ((default . error) (SEMICOLON .  79))
      ((default . error) (IS . (identifier_opt . 0)) (EXTENDS . (identifier_opt . 0)) (RENAMES . (identifier_opt . 0)) (IDENTIFIER .  21))
      ((default . error) (IDENTIFIER .  77))
      ((default . error) (COLON .  75) (COLON_EQUALS .  76))
      ((default . error) (WHEN . (simple_declarative_item . 2)) (END . (simple_declarative_item . 2)) (CASE . (simple_declarative_item . 2)) (FOR . (simple_declarative_item . 2)) (NULL . (simple_declarative_item . 2)) (PACKAGE . (simple_declarative_item . 2)) (TYPE . (simple_declarative_item . 2)) (IDENTIFIER . (simple_declarative_item . 2)))
      ((default . error) (WHEN . (simple_declarative_item . 3)) (END . (simple_declarative_item . 3)) (CASE . (simple_declarative_item . 3)) (FOR . (simple_declarative_item . 3)) (NULL . (simple_declarative_item . 3)) (PACKAGE . (simple_declarative_item . 3)) (TYPE . (simple_declarative_item . 3)) (IDENTIFIER . (simple_declarative_item . 3)))
      ((default . error) (WHEN . (declarative_items . 0)) (END . (declarative_items . 0)) (CASE . (declarative_items . 0)) (FOR . (declarative_items . 0)) (NULL . (declarative_items . 0)) (PACKAGE . (declarative_items . 0)) (TYPE . (declarative_items . 0)) (IDENTIFIER . (declarative_items . 0)))
      ((default . error) (WHEN . (declarative_items_opt . 1)) (END . (declarative_items_opt . 1)) (TYPE .  58) (IDENTIFIER .  59) (NULL .  56) (CASE .  54) (FOR .  55) (PACKAGE .  57))
      ((default . error) (END .  73))
      ((default . error) (WHEN . (declarative_item . 2)) (END . (declarative_item . 2)) (IDENTIFIER . (declarative_item . 2)) (TYPE . (declarative_item . 2)) (PACKAGE . (declarative_item . 2)) (NULL . (declarative_item . 2)) (FOR . (declarative_item . 2)) (CASE . (declarative_item . 2)))
      ((default . error) (WHEN . (package_declaration . 0)) (END . (package_declaration . 0)) (CASE . (package_declaration . 0)) (FOR . (package_declaration . 0)) (NULL . (package_declaration . 0)) (PACKAGE . (package_declaration . 0)) (TYPE . (package_declaration . 0)) (IDENTIFIER . (package_declaration . 0)))
      ((default . error) (WHEN . (package_declaration . 1)) (END . (package_declaration . 1)) (CASE . (package_declaration . 1)) (FOR . (package_declaration . 1)) (NULL . (package_declaration . 1)) (PACKAGE . (package_declaration . 1)) (TYPE . (package_declaration . 1)) (IDENTIFIER . (package_declaration . 1)))
      ((default . error) (WHEN . (package_declaration . 2)) (END . (package_declaration . 2)) (CASE . (package_declaration . 2)) (FOR . (package_declaration . 2)) (NULL . (package_declaration . 2)) (PACKAGE . (package_declaration . 2)) (TYPE . (package_declaration . 2)) (IDENTIFIER . (package_declaration . 2)))
      ((default . error) (WHEN . (declarative_item . 0)) (END . (declarative_item . 0)) (IDENTIFIER . (declarative_item . 0)) (TYPE . (declarative_item . 0)) (PACKAGE . (declarative_item . 0)) (NULL . (declarative_item . 0)) (FOR . (declarative_item . 0)) (CASE . (declarative_item . 0)))
      ((default . error) (WHEN . (declarative_item . 1)) (END . (declarative_item . 1)) (IDENTIFIER . (declarative_item . 1)) (TYPE . (declarative_item . 1)) (PACKAGE . (declarative_item . 1)) (NULL . (declarative_item . 1)) (FOR . (declarative_item . 1)) (CASE . (declarative_item . 1)))
      ((default . error) (IS .  72))
      ((default . error) (END . (declarative_items_opt . 0)) (TYPE .  58) (IDENTIFIER .  59) (NULL .  56) (CASE .  54) (FOR .  55) (PACKAGE .  57))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  21))
      ((default . error) (WHEN . (declarative_items . 1)) (IDENTIFIER . (declarative_items . 1)) (TYPE . (declarative_items . 1)) (PACKAGE . (declarative_items . 1)) (NULL . (declarative_items . 1)) (FOR . (declarative_items . 1)) (CASE . (declarative_items . 1)) (END . (declarative_items . 1)))
      ((default . error) (IDENTIFIER .  94))
      ((default . error) (LEFT_PAREN .  19) (STRING_LITERAL .  22) (EXTERNAL .  17) (EXTERNAL_AS_LIST .  18) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  21) (PROJECT .  20))
      ((default . error) (IS .  92))
      ((default . error) (IS .  90) (EXTENDS .  89) (RENAMES .  91))
      ((default . error) (WHEN . (simple_declarative_item . 4)) (IDENTIFIER . (simple_declarative_item . 4)) (TYPE . (simple_declarative_item . 4)) (PACKAGE . (simple_declarative_item . 4)) (NULL . (simple_declarative_item . 4)) (FOR . (simple_declarative_item . 4)) (CASE . (simple_declarative_item . 4)) (END . (simple_declarative_item . 4)))
      ((default . error) (LEFT_PAREN .  88))
      ((default . error) (USE .  87) (LEFT_PAREN .  86))
      ((default . error) (DOT .  40) (IS .  85))
      ((default . error) (STRING_LITERAL .  84))
      ((default . error) (RIGHT_PAREN .  111))
      ((default . error) (END . (case_items . 0)) (WHEN . ( 108 (case_items . 0))))
      ((default . error) (STRING_LITERAL .  107))
      ((default . error) (LEFT_PAREN .  19) (STRING_LITERAL .  22) (EXTERNAL .  17) (EXTERNAL_AS_LIST .  18) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  21) (PROJECT .  20))
      ((default . error) (STRING_LITERAL .  105))
      ((default . error) (DOT . (identifier_opt . 0)) (IS . (identifier_opt . 0)) (IDENTIFIER .  21))
      ((default . error) (END . (declarative_items_opt . 0)) (TYPE .  58) (IDENTIFIER .  59) (NULL .  56) (CASE .  54) (FOR .  55) (PACKAGE .  57))
      ((default . error) (DOT . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  21))
      ((default . error) (LEFT_PAREN .  45))
      ((default . error) (AMPERSAND .  41) (SEMICOLON .  100))
      ((default . error) (COLON_EQUALS .  99))
      ((default . error) (SEMICOLON .  98))
      ((default . error) (END .  97))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  21))
      ((default . error) ($EOI . (simple_project_declaration . 0)))
      ((default . error) (LEFT_PAREN .  19) (STRING_LITERAL .  22) (EXTERNAL .  17) (EXTERNAL_AS_LIST .  18) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  21) (PROJECT .  20))
      ((default . error) (WHEN . (simple_declarative_item . 0)) (IDENTIFIER . (simple_declarative_item . 0)) (TYPE . (simple_declarative_item . 0)) (PACKAGE . (simple_declarative_item . 0)) (NULL . (simple_declarative_item . 0)) (FOR . (simple_declarative_item . 0)) (CASE . (simple_declarative_item . 0)) (END . (simple_declarative_item . 0)))
      ((default . error) (SEMICOLON .  124))
      ((default . error) (DOT .  40) (SEMICOLON .  123))
      ((default . error) (END .  122))
      ((default . error) (DOT .  40) (IS .  121))
      ((default . error) (RIGHT_PAREN .  120))
      ((default . error) (AMPERSAND .  41) (SEMICOLON .  119))
      ((default . error) (RIGHT_PAREN .  118))
      ((default . error) (VERTICAL_BAR . (discrete_choice . 0)) (EQUAL_GREATER . (discrete_choice . 0)) (STRING_LITERAL .  115) (OTHERS .  114))
      ((default . error) (END . (case_items . 1)) (WHEN . (case_items . 1)))
      ((default . error) (END .  112) (WHEN .  108))
      ((default . error) (AMPERSAND . (attribute_reference . 1)) (SEMICOLON . (attribute_reference . 1)) (RIGHT_PAREN . (attribute_reference . 1)) (COMMA . (attribute_reference . 1)))
      ((default . error) (CASE .  135))
      ((default . error) (WHEN . (case_items . 2)) (END . (case_items . 2)))
      ((default . error) (VERTICAL_BAR . (discrete_choice . 2)) (EQUAL_GREATER . (discrete_choice . 2)))
      ((default . error) (VERTICAL_BAR . (discrete_choice . 1)) (EQUAL_GREATER . (discrete_choice . 1)))
      ((default . error) (EQUAL_GREATER . (discrete_choice_list . 0)) (VERTICAL_BAR . (discrete_choice_list . 0)))
      ((default . error) (VERTICAL_BAR .  134) (EQUAL_GREATER .  133))
      ((default . error) (USE .  132))
      ((default . error) (WHEN . (attribute_declaration . 0)) (END . (attribute_declaration . 0)) (IDENTIFIER . (attribute_declaration . 0)) (TYPE . (attribute_declaration . 0)) (PACKAGE . (attribute_declaration . 0)) (NULL . (attribute_declaration . 0)) (FOR . (attribute_declaration . 0)) (CASE . (attribute_declaration . 0)))
      ((default . error) (USE .  131))
      ((default . error) (END . (declarative_items_opt . 0)) (TYPE .  58) (IDENTIFIER .  59) (NULL .  56) (CASE .  54) (FOR .  55) (PACKAGE .  57))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  21))
      ((default . error) (WHEN . (package_renaming . 0)) (END . (package_renaming . 0)) (IDENTIFIER . (package_renaming . 0)) (TYPE . (package_renaming . 0)) (PACKAGE . (package_renaming . 0)) (NULL . (package_renaming . 0)) (FOR . (package_renaming . 0)) (CASE . (package_renaming . 0)))
      ((default . error) (WHEN . (typed_string_declaration . 0)) (END . (typed_string_declaration . 0)) (CASE . (typed_string_declaration . 0)) (FOR . (typed_string_declaration . 0)) (NULL . (typed_string_declaration . 0)) (PACKAGE . (typed_string_declaration . 0)) (TYPE . (typed_string_declaration . 0)) (IDENTIFIER . (typed_string_declaration . 0)))
      ((default . error) (AMPERSAND .  41) (SEMICOLON .  128))
      ((default . error) (SEMICOLON .  127))
      ((default . error) ($EOI . (project_extension . 0)))
      ((default . error) (WHEN . (simple_declarative_item . 1)) (IDENTIFIER . (simple_declarative_item . 1)) (TYPE . (simple_declarative_item . 1)) (PACKAGE . (simple_declarative_item . 1)) (NULL . (simple_declarative_item . 1)) (FOR . (simple_declarative_item . 1)) (CASE . (simple_declarative_item . 1)) (END . (simple_declarative_item . 1)))
      ((default . error) (SEMICOLON .  142))
      ((default . error) (END .  141))
      ((default . error) (LEFT_PAREN .  19) (STRING_LITERAL .  22) (EXTERNAL .  17) (EXTERNAL_AS_LIST .  18) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  21) (PROJECT .  20))
      ((default . error) (LEFT_PAREN .  19) (STRING_LITERAL .  22) (EXTERNAL .  17) (EXTERNAL_AS_LIST .  18) (DOT . (identifier_opt . 0)) (AMPERSAND . (identifier_opt . 0)) (SEMICOLON . (identifier_opt . 0)) (QUOTE . (identifier_opt . 0)) (IDENTIFIER .  21) (PROJECT .  20))
      ((default . error) (END . (declarative_items_opt . 0)) (WHEN . (declarative_items_opt . 0)) (TYPE .  58) (IDENTIFIER .  59) (NULL .  56) (CASE .  54) (FOR .  55) (PACKAGE .  57))
      ((default . error) (EQUAL_GREATER . (discrete_choice . 0)) (VERTICAL_BAR . (discrete_choice . 0)) (STRING_LITERAL .  115) (OTHERS .  114))
      ((default . error) (SEMICOLON .  136))
      ((default . error) (WHEN . (case_statement . 0)) (END . (case_statement . 0)) (IDENTIFIER . (case_statement . 0)) (TYPE . (case_statement . 0)) (PACKAGE . (case_statement . 0)) (NULL . (case_statement . 0)) (FOR . (case_statement . 0)) (CASE . (case_statement . 0)))
      ((default . error) (EQUAL_GREATER . (discrete_choice_list . 1)) (VERTICAL_BAR . (discrete_choice_list . 1)))
      ((default . error) (END . (case_item . 0)) (WHEN . (case_item . 0)))
      ((default . error) (AMPERSAND .  41) (SEMICOLON .  145))
      ((default . error) (AMPERSAND .  41) (SEMICOLON .  144))
      ((default . error) (SEMICOLON . (identifier_opt . 0)) (IDENTIFIER .  21))
      ((default . error) (WHEN . (package_spec . 0)) (END . (package_spec . 0)) (IDENTIFIER . (package_spec . 0)) (TYPE . (package_spec . 0)) (PACKAGE . (package_spec . 0)) (NULL . (package_spec . 0)) (FOR . (package_spec . 0)) (CASE . (package_spec . 0)))
      ((default . error) (SEMICOLON .  146))
      ((default . error) (WHEN . (attribute_declaration . 2)) (CASE . (attribute_declaration . 2)) (FOR . (attribute_declaration . 2)) (NULL . (attribute_declaration . 2)) (PACKAGE . (attribute_declaration . 2)) (TYPE . (attribute_declaration . 2)) (IDENTIFIER . (attribute_declaration . 2)) (END . (attribute_declaration . 2)))
      ((default . error) (WHEN . (attribute_declaration . 1)) (CASE . (attribute_declaration . 1)) (FOR . (attribute_declaration . 1)) (NULL . (attribute_declaration . 1)) (PACKAGE . (attribute_declaration . 1)) (TYPE . (attribute_declaration . 1)) (IDENTIFIER . (attribute_declaration . 1)) (END . (attribute_declaration . 1)))
      ((default . error) (WHEN . (package_extension . 0)) (END . (package_extension . 0)) (IDENTIFIER . (package_extension . 0)) (TYPE . (package_extension . 0)) (PACKAGE . (package_extension . 0)) (NULL . (package_extension . 0)) (FOR . (package_extension . 0)) (CASE . (package_extension . 0)))]
     [((compilation_unit . 8)(context_clause . 9)(context_clause_opt . 10)(project_extension . 11)(simple_project_declaration . 12)(with_clause . 13))
      nil
      nil
      nil
      nil
      ((identifier_opt . 34))
      nil
      ((aggregate . 23)(attribute_prefix . 24)(attribute_reference . 25)(expression . 26)(external_value . 27)(identifier_opt . 28)(name . 29)(string_expression . 30)(string_primary . 31)(string_list . 32)(term . 33))
      nil
      ((with_clause . 15))
      ((project_qualifier_opt . 14))
      nil
      nil
      nil
      ((project_declaration_opt . 48)(project_extension . 11)(simple_project_declaration . 12))
      nil
      nil
      ((aggregate . 47))
      ((aggregate . 46))
      ((aggregate . 23)(attribute_prefix . 24)(attribute_reference . 25)(expression . 26)(external_value . 27)(identifier_opt . 28)(name . 29)(string_expression . 30)(string_primary . 31)(string_list . 44)(term . 33))
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
      ((attribute_declaration . 60)(case_statement . 61)(declarative_item . 62)(declarative_items . 63)(declarative_items_opt . 64)(package_declaration . 65)(package_spec . 66)(package_extension . 67)(package_renaming . 68)(simple_declarative_item . 69)(typed_string_declaration . 70))
      ((aggregate . 23)(attribute_prefix . 24)(attribute_reference . 25)(expression . 53)(external_value . 27)(identifier_opt . 28)(name . 29)(string_expression . 30)(string_primary . 31)(term . 33))
      nil
      nil
      ((aggregate . 23)(attribute_prefix . 24)(attribute_reference . 25)(external_value . 27)(identifier_opt . 28)(name . 29)(string_expression . 30)(string_primary . 31)(term . 51))
      nil
      nil
      nil
      ((aggregate . 23)(attribute_prefix . 24)(attribute_reference . 25)(expression . 26)(external_value . 27)(identifier_opt . 28)(name . 29)(string_expression . 30)(string_primary . 31)(string_list . 44)(term . 33))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((identifier_opt . 28)(name . 82))
      nil
      nil
      ((identifier_opt . 78))
      nil
      nil
      nil
      nil
      nil
      ((attribute_declaration . 60)(case_statement . 61)(declarative_item . 74)(package_declaration . 65)(package_spec . 66)(package_extension . 67)(package_renaming . 68)(simple_declarative_item . 69)(typed_string_declaration . 70))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((attribute_declaration . 60)(case_statement . 61)(declarative_item . 62)(declarative_items . 63)(declarative_items_opt . 96)(package_declaration . 65)(package_spec . 66)(package_extension . 67)(package_renaming . 68)(simple_declarative_item . 69)(typed_string_declaration . 70))
      ((identifier_opt . 95))
      nil
      nil
      ((aggregate . 23)(attribute_prefix . 24)(attribute_reference . 25)(expression . 93)(external_value . 27)(identifier_opt . 28)(name . 29)(string_expression . 30)(string_primary . 31)(term . 33))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((case_item . 109)(case_items . 110))
      nil
      ((aggregate . 23)(attribute_prefix . 24)(attribute_reference . 25)(expression . 106)(external_value . 27)(identifier_opt . 28)(name . 29)(string_expression . 30)(string_primary . 31)(term . 33))
      nil
      ((identifier_opt . 28)(name . 104))
      ((attribute_declaration . 60)(case_statement . 61)(declarative_item . 62)(declarative_items . 63)(declarative_items_opt . 103)(package_declaration . 65)(package_spec . 66)(package_extension . 67)(package_renaming . 68)(simple_declarative_item . 69)(typed_string_declaration . 70))
      ((identifier_opt . 28)(name . 102))
      ((aggregate . 101))
      nil
      nil
      nil
      nil
      ((identifier_opt . 126))
      nil
      ((aggregate . 23)(attribute_prefix . 24)(attribute_reference . 25)(expression . 125)(external_value . 27)(identifier_opt . 28)(name . 29)(string_expression . 30)(string_primary . 31)(term . 33))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((discrete_choice . 116)(discrete_choice_list . 117))
      nil
      ((case_item . 113))
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
      ((attribute_declaration . 60)(case_statement . 61)(declarative_item . 62)(declarative_items . 63)(declarative_items_opt . 130)(package_declaration . 65)(package_spec . 66)(package_extension . 67)(package_renaming . 68)(simple_declarative_item . 69)(typed_string_declaration . 70))
      ((identifier_opt . 129))
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      nil
      ((aggregate . 23)(attribute_prefix . 24)(attribute_reference . 25)(expression . 140)(external_value . 27)(identifier_opt . 28)(name . 29)(string_expression . 30)(string_primary . 31)(term . 33))
      ((aggregate . 23)(attribute_prefix . 24)(attribute_reference . 25)(expression . 139)(external_value . 27)(identifier_opt . 28)(name . 29)(string_expression . 30)(string_primary . 31)(term . 33))
      ((attribute_declaration . 60)(case_statement . 61)(declarative_item . 62)(declarative_items . 63)(declarative_items_opt . 138)(package_declaration . 65)(package_spec . 66)(package_extension . 67)(package_renaming . 68)(simple_declarative_item . 69)(typed_string_declaration . 70))
      ((discrete_choice . 137))
      nil
      nil
      nil
      nil
      nil
      nil
      ((identifier_opt . 143))
      nil
      nil
      nil
      nil
      nil]))
  "Parser table.")

(provide 'gpr-grammar-wy)

;; end of file
