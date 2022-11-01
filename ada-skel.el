;;; ada-skel.el --- Extension to Ada mode for inserting statement skeletons  -*- lexical-binding:t -*-

;; Copyright (C) 1987, 1993, 1994, 1996-2022  Free Software Foundation, Inc.

;; Authors: Stephen Leake <stephen_leake@stephe-leake.org>

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Design:
;;
;; The primary user command is `wisi-skel-expand', which inserts the
;; skeleton associated with the previous word (possibly skipping a
;; name).
;;
;; We don't define skeletons that prompt for most of the content; it
;; is easier just to type in the buffer.
;;
;; These skeletons are not intended to teach a novice the language,
;; just to make it easier to write code that the wisi parser
;; handles without error, and handle repeated names nicely.

;;; History:

;; Created May 1987.
;; Original version from V. Bowman as in ada.el of Emacs-18
;; (borrowed heavily from Mick Jordan's Modula-2 package for GNU,
;; as modified by Peter Robinson, Michael Schmidt, and Tom Perrine.)
;;
;; Sep 1993. Daniel Pfeiffer <pfeiffer@cict.fr> (DP)
;; Introduced statement.el for smaller code and user configurability.
;;
;; Nov 1993. Rolf Ebert <ebert@enpc.fr> (RE) Moved the
;; skeleton generation into this separate file. The code still is
;; essentially written by DP
;;
;; Adapted Jun 1994. Markus Heritsch
;; <Markus.Heritsch@studbox.uni-stuttgart.de> (MH)
;; added menu bar support for templates
;;
;; 1994/12/02  Christian Egli <cegli@hcsd.hac.com>
;; General cleanup and bug fixes.
;;
;; 1995/12/20  John Hutchison <hutchiso@epi.syr.ge.com>
;; made it work with skeleton.el from Emacs-19.30. Several
;; enhancements and bug fixes.
;;
;; Sep 2013 Stephen Leake renamed to ada-skel (to match skeleton.el),
;; complete re-write: added ada-skel-alist (to get some of the
;; functionality of the sadly missed Else package). Simplified
;; skeletons; just make it easier to work with the ada-wisi parser,
;; don't try to teach syntax.

(require 'skeleton)
(require 'wisi-skel)

;;;;; user variables, example skeletons intended to be overwritten

(defcustom ada-skel-initial-string
  "{header}
--  Emacs note: Type C-c C-e with point after the above placeholder
--
--  This text was inserted by ada-skel-initial-string;
--  M-x customize-variable <RET> ada-skel-initial-string <RET>
--  (info \"(ada-mode)Statement skeletons\")"
  "String to insert in empty buffer.
This could end in a token recognized by `ada-skel-expand'."
  :type 'string
  :group 'ada
  :safe #'stringp)

(define-skeleton ada-skel-user-restricted
  "Example copyright/license skeleton, with automatic year and owner."
  ()
  "--  Copyright (C) " (format-time-string "%Y ") user-full-name " All Rights Reserved.\n"
  "\n"
  "pragma License (Restricted);\n"
)

(define-skeleton ada-skel-gpl
  "Example copyright/license skeleton, with automatic year and owner, GPLv3."
  ()
  "--  Copyright (C) " (format-time-string "%Y ") user-full-name " All Rights Reserved.\n"
  "--\n"
  "--  This library is free software;  you can redistribute it and/or modify it\n"
  "--  under terms of the  GNU General Public License  as published by the Free\n"
  "--  Software  Foundation;  either version 3,  or (at your  option) any later\n"
  "--  version. This library is distributed in the hope that it will be useful,\n"
  "--  but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN-\n"
  "--  TABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n"
  "\n"
  "pragma License (GPL);\n"
  )

(define-skeleton ada-skel-modified-gpl
  "Modified GPLv3 copyright/license skeleton, with automatic year and owner."
  ()
  "--  Copyright (C) " (format-time-string "%Y ") user-full-name " All Rights Reserved.\n"
  "--\n"
  "--  This library is free software;  you can redistribute it and/or modify it\n"
  "--  under terms of the  GNU General Public License  as published by the Free\n"
  "--  Software  Foundation;  either version 3,  or (at your  option) any later\n"
  "--  version. This library is distributed in the hope that it will be useful,\n"
  "--  but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN-\n"
  "--  TABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n"
  "\n"
  "--  As a special exception under Section 7 of GPL version 3, you are granted\n"
  "--  additional permissions described in the GCC Runtime Library Exception,\n"
  "--  version 3.1, as published by the Free Software Foundation.\n"
  "\n"
  "pragma License (Modified_GPL);\n"
)

;;;;; Ada skeletons (alphabetical)

(define-skeleton ada-skel-accept
  "Insert accept statement with name from `str'."
  ()
  "accept " str " do\n"
  "null;\n"
  "end " str ";\n")

(define-skeleton ada-skel-case
  "Insert case statement."
  ()
  "case " str " is\n"
  "when A" _ " =>\n"
  "null;\n"
  "end case;\n")

(define-skeleton ada-skel-declare
  "Insert a block statement with an optional name (from `str')."
  ()
  str & ":\n"
  "declare\n"
  _
  "begin\n"
  "null;\n"
  "exception\n"
  "when others =>\n"
  "null;\n"
  "end " str | -1 ";\n")

(define-skeleton ada-skel-entry
  "Insert entry statement with name from `str'."
  ()
  "entry " str " when A" _ "\n"
  "is\n"
  "begin\n"
  "null;\n"
  "end " str ";\n")

(define-skeleton ada-skel-for
  "Insert a for loop statement with an optional name (from `str')."
  ()
  str & " :\n"
  "for A in A" _ " loop\n"
  "null;\n"
  "end loop " str | -1 ";\n")

(define-skeleton ada-skel-function-body
  "Insert a function body with name from `str'."
  ()
  "function " str " return A\n"
  "is\n"
  "begin\n"
  "null;\n" _
  "end " str ";\n")

(define-skeleton ada-skel-function-spec
  "Insert a function type specification with name from `str'."
  ()
  "function " str " return A;\n")

(define-skeleton ada-skel-header
  "Insert a file header comment, prompt for copyright owner/license.
Each user will probably want to override this."
  ()
  "--  Abstract :\n"
  "--\n"
  "--  " _ "\n"
  "--\n"
  "{copyright_license}\n"
  )

(define-skeleton ada-skel-if
  "Insert an if statement."
  ()
  "if A" _ " then\n"
  "null;\n"
  "elsif A then\n"
  "null;\n"
  "else\n"
  "null;\n"
  "end if;\n")

(define-skeleton ada-skel-loop
  "Insert a loop statement with an optional name (from `str')."
  ()
  str & " :\n"
  "loop\n"
  "exit " str | -1 " when A" _ ";\n"
  "end loop " str | -1 ";\n")

(define-skeleton ada-skel-package-body
  "Insert a package body with name from `str'."
  ()
  "package body " str " is\n"
  _
  "begin\n"
  "null;\n"
  "end " str ";\n")

(define-skeleton ada-skel-package-spec
  "Insert a package specification with name from `str'.
See `ada-find-other-file' to create library level package body from spec."
  ()
  "package " str " is\n"
  _
  "private\n"
  "end " str ";\n")

(define-skeleton ada-skel-procedure-body
  "Insert a procedure body with name from `str'."
  ()
  "procedure " str "\n"
  "is\n"
  "begin\n"
  "null;\n" _
  "end " str ";\n")

(define-skeleton ada-skel-procedure-spec
  "Insert a procedure type specification with name from `str'."
  ()
  "procedure " str ";\n")

(define-skeleton ada-skel-protected-body
  "Insert a protected body with name from `str'."
  ()
  "protected body " str " is\n"
  _
  "end " str ";\n")

(define-skeleton ada-skel-protected-spec
  "Insert a protected type specification with name from `str'."
  ()
  "protected type " str " is\n"
  _
  "private\n"
  "end " str ";\n")

(define-skeleton ada-skel-record
  "Insert a record type declaration with a type name from `str'."
  ()
  "type " str " is record\n"
  "null;\n"_
  "end record;\n")

(define-skeleton ada-skel-return
  "Insert an extended return statement."
  ()
  "return A : A" _ " do\n"
  "null;\n"
  "end return;\n")

(define-skeleton ada-skel-select
  "Insert a select statement."
  ()
  "select\n"
  "accept A;\n"_
  "else\n"
  "null;\n"
  "end select;\n")

(define-skeleton ada-skel-separate
  "Insert a subunit body."
  ()
  "separate (" _ ")\n"
  "{proper_body}\n")

(define-skeleton ada-skel-task-body
  "Insert a task body with name from `str'."
  ()
  "task body " str "\n"
  "is\n" _
  "begin\n"
  "null;\n"
  "end " str ";\n")

(define-skeleton ada-skel-task-spec
  "Insert a task specification with name from `str'."
  ()
  "task type " str " is\n"
  "entry A;\n" _
  "end " str ";\n")

(define-skeleton ada-skel-while
  "Insert a while loop statement with an optional name (from `str')."
  ()
  str & ":\n"
  "while A" _ " loop\n"
  "null;\n"
  "end loop " str | -1 ";\n")

(define-skeleton ada-skel-with-use
  "Insert with and use context clauses with name from `str'."
  ()
  "with " str "; use " str ";\n")

;;;;; token alist

(defconst ada-skel-token-alist
  '(("accept" . ada-skel-accept)
    ("begin" . ada-skel-declare) ;; easy enough to delete the declare
    ("case" . ada-skel-case)
    ("copyright_license"
     ("GPL" . ada-skel-gpl)
     ("Modified GPL" . ada-skel-modified-gpl)
     ("restricted" . ada-skel-user-restricted))
    ("declare" . ada-skel-declare)
    ("entry" . ada-skel-entry)
    ("for" . ada-skel-for)
    ("function"
     ("body" . ada-skel-function-body)
     ("spec" . ada-skel-function-spec))
    ("header" . ada-skel-header)
    ("if" . ada-skel-if)
    ("loop" . ada-skel-loop)
    ("package"
     ("body" . ada-skel-package-body)
     ("spec" . ada-skel-package-spec))
    ("procedure"
     ("body" . ada-skel-procedure-body)
     ("spec" . ada-skel-procedure-spec))
    ("proper_body"
     ("function" . ada-skel-function-body)
     ("procedure" . ada-skel-procedure-body)
     ("task" . ada-skel-task-body)
     ("protected" . ada-skel-protected-body))
    ("protected"
     ("body" . ada-skel-protected-body)
     ("spec" . ada-skel-protected-spec))
    ("record" . ada-skel-record)
    ("return" . ada-skel-return)
    ("select" . ada-skel-select)
    ("separate" . ada-skel-separate)
    ("task"
     ("body" . ada-skel-task-body)
     ("spec" . ada-skel-task-spec))
    ("while" . ada-skel-while)
    ("with" . ada-skel-with-use))
  "Ada tokens for `wisi-skel-token-alist', used by `wisi-skel-expand'.")

(defun ada-skel-setup ()
  "Setup a buffer for ada-skel."
  (setq wisi-skel-token-alist ada-skel-token-alist)
  (add-hook 'skeleton-end-hook #'wisi-indent-statement -90 t)
  ;; Enable auto-insert-mode to insert ada-skel-initial-string in new files.
  )

(add-hook 'ada-mode-hook #'ada-skel-setup)

(provide 'ada-skel)
;;; ada-skel.el ends here
