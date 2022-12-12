;; user options shared by Ada mode indentation engines  -*- lexical-binding:t -*-
;;
;; Copyright (C) 2012, 2013, 2015, 2017 - 2022  Free Software Foundation, Inc.
;;
;; Author: Stephen Leake <stephen_leake@member.fsf.org>
;; Contributors: Simon Wright <simon.j.wright@mac.com>
;;
;; This file is part of GNU Emacs.
;;
;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; History: see ada_mode.el

;;;; code

(defgroup ada-indentation nil
  "Indentation options for Ada source."
  :group 'ada)

(defcustom ada-indent 3
  "Size of Ada default indentation, when no other indentation is used.

Example :
procedure Foo is
begin
>>>null;"
  :type 'integer
  :safe #'integerp)
(make-variable-buffer-local 'ada-indent)

(defcustom ada-indent-broken 2
  "Indentation for the continuation of a broken line.

Example :
   My_Var : My_Type :=
   >>(Field1 => Value);"
  :type 'integer
  :safe #'integerp)
(make-variable-buffer-local 'ada-indent-broken)

(defcustom ada-indent-comment-col-0 nil
  "If non-nil, comments currently starting in column 0 are left in column 0.
Otherwise, they are indented with previous comments or code."
  :type 'boolean
  :safe #'booleanp)
(make-variable-buffer-local 'ada-indent-comment-col-0)

(defcustom ada-indent-comment-gnat nil
  "If non-nil, comments are indented to meet the GNAT comment style check.
That is, one of:

- multiple of ada-indent
- next non-blank line
- previous non-blank line

Otherwise, they are indented as previous comments or code."
  :type  'boolean
  :safe  #'booleanp)
(make-variable-buffer-local 'ada-indent-comment-gnat)

(defcustom ada-indent-label -3
  "Indentation for a loop, block, or statement label,
relative to the item it labels.

Example :
   Label_1 :
   <<<<declare

   <<Label_2>>
   <<<<Foo := 0;"
  :type  'integer
  :safe  #'integerp)
(make-variable-buffer-local 'ada-indent-label)

(defcustom ada-indent-record-rel-type 3
  "Indentation for line containing `record' relative to `type' or `for'.

An example is:
   type A is
   >>>record"
  :type 'integer
  :safe #'integerp)
(make-variable-buffer-local 'ada-indent-record-rel-type)

(defcustom ada-indent-renames 2
  "Indentation for \"renames\" relative to the subprogram keyword.

For \"renames\" of non-subprograms the indentation is
\"ada-indent-broken\" relative to the start of the statement.

If the subprogram has parameters then if \"ada-indent-renames\" is
zero or less the indentation is abs \"ada-indent-renames\" relative
to the open parenthesis; if \"ada-indent-renames\" is one or more
the indentation is relative to the line containing the subprogram
keyword (\"function\" or \"procedure\").

If the subprogram has no parameters then the indentation is
\"ada-indent-broken\" relative to the line containing the keyword.

Examples:
   ada-indent-renames = 2
   generic function A (B : Integer) return C
   >>renames Foo;

   ada-indent-renames = -1
   function A (B : Integer)
               return C
   >>>>>>>>>>>renames Foo;"
  :type 'integer
  :safe #'integerp)
(make-variable-buffer-local 'ada-indent-renames)

(defcustom ada-indent-return 0
  "Indentation for \"return\" relative to the matching \"function\" keyword.

If the function has parameters, then if \"ada-indent-return\" is
zero or less, the indentation is abs \"ada-indent-return\" relative
to the open parenthesis; if \"ada-indent-return\" is one or more,
indentation is relative to line containing \"function'.

If the function has no parameters, \"ada-indent-broken\" is used
relative to line containing \"function'.

An example is:
   function A (B : Integer)
   >>>>>>>>>>>return C;"
  :type 'integer
  :safe #'integerp)
(make-variable-buffer-local 'ada-indent-return)

(defcustom ada-indent-use ada-indent-broken
  "Indentation for the lines in a \"use\" statement.

An example is:
   use Ada.Text_IO,
   >>Ada.Numerics;"
  :type 'integer
  :safe #'integerp)
(make-variable-buffer-local 'ada-indent-use)

(defcustom ada-indent-when 3
  "Indentation for \"when\" relative to \"exception', \"case', \"or\" in select.

An example is:
   case A is
   >>>when B =>"
  :type  'integer
  :safe  #'integerp)
(make-variable-buffer-local 'ada-indent-when)

(defcustom ada-indent-with ada-indent-broken
  "Indentation for the lines in a \"with\" context clause.

An example is:
   with Ada.Text_IO,
   >>Ada.Numerics;"
  :type 'integer
  :safe #'integerp)
(make-variable-buffer-local 'ada-indent-with)

(defcustom ada-indent-hanging-rel-exp nil
  "If nil, indent hanging lines in an expression relative to the first line.
Otherwise, indent by \"ada-indent-broken\" relative to the start of
the expression."
  :type 'boolean
  :safe #'booleanp)
(make-obsolete-variable 'ada-indent-hanging-rel-exp "" "ada-mode 4.0.0")

(defcustom ada-indent-after-trailing-comment t
 "If t, align comment lines immediately following a comment on the
 same line as code with the preceding comment. Otherwise, ignore
 the preceding comment."
  :type 'boolean
  :safe #'booleanp)
(make-variable-buffer-local 'ada-indent-after-trailing-comment)

(defcustom ada-indent-subprogram-is ada-indent-broken
  "Indentation for \"is\" relative to \"function\" or \"procedure\" when
the subprogram body is a short form; \"is null\", expression
function, etc.

An example is:
   function A return Integer
   >>is (B);"
  :type  'integer
  :safe  #'integerp)
(make-variable-buffer-local 'ada-indent-subprogram-is)

(defcustom ada-end-name-optional t
  "If t, names at ends of blocks/subprograms are optional (as in
standard Ada). If nil, they are required; this helps in error
recovery, and matches the gnat style option -gnatye.
Default is t for new Ada users."
  :type 'boolean
  :safe #'booleanp)
(make-variable-buffer-local 'ada-end-name-optional)

(provide 'ada-indent-user-options)

;; end file
