;; gpr-skel.el --- Extension to gpr-mode for inserting statement skeletons  -*- lexical-binding:t -*-

;; Copyright (C) 2013-2015, 2018 - 2021 Free Software Foundation, Inc.

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
;; just to make it easier to write code that the gpr-wisi parser
;; likes, and handle repeated names nicely.

;;; History:

;; Created Dec 2013

(require 'skeleton)
(require 'wisi-skel)

;;;;; user variables, example skeletons intended to be overwritten

(defgroup gpr nil
  "Major mode for editing GNAT project files in Emacs."
  :group 'languages)

(defcustom gpr-skel-initial-string "{header}\n{project}"
  "String to insert in empty buffer.
This could end in a token recognized by `gpr-skel-expand'."
  :type 'string
  :safe #'stringp)

(define-skeleton gpr-skel-user-restricted
  "Example copyright/license skeleton, with automatic year and owner."
  ()
  "--  Copyright (C) " (format-time-string "%Y ") user-full-name " All Rights Reserved.\n"
)

(define-skeleton gpr-skel-gpl
  "Example copyright/license skeleton, with automatic year and owner, GPLv3."
  ()
  "--  Copyright (C) " (format-time-string "%Y ") user-full-name " All Rights Reserved.\n"
  "--\n"
  "--  This program is free software; you can redistribute it and/or\n"
  "--  modify it under terms of the GNU General Public License as\n"
  "--  published by the Free Software Foundation; either version 3, or (at\n"
  "--  your option) any later version. This program is distributed in the\n"
  "--  hope that it will be useful, but WITHOUT ANY WARRANTY; without even\n"
  "--  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR\n"
  "--  PURPOSE. See the GNU General Public License for more details. You\n"
  "--  should have received a copy of the GNU General Public License\n"
  "--  distributed with this program; see file COPYING. If not, write to\n"
  "--  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston,\n"
  "--  MA 02110-1335, USA.\n"
)

;;;;; Gpr skeletons (alphabetical)

(define-skeleton gpr-skel-case
  "Insert case statement."
  ()
  "case " str " is\n"
  "when " _ "=>\n"
  "end case;")

(define-skeleton gpr-skel-header
  "Insert a file header comment, prompt for copyright owner/license.
Each user will probably want to override this."
  ()
  "--  Abstract :\n"
  "--\n"
  "--  " _ "\n"
  "--\n"
  "{copyright_license}\n"
  )

(define-skeleton gpr-skel-package
  "Insert a package with name from `str'."
  "Package name: "
  "package " str " is\n"
  _
  "end " str ";")

(define-skeleton gpr-skel-project
  "Insert a project with name from `str'."
  "Project name: "
  "project " str " is\n"
  _
  "end " str ";")

;;;;; token alist, setup

(defconst gpr-skel-token-alist
  '(("case" . gpr-skel-case)
    ("copyright_license"
     ("GPL" . gpr-skel-gpl)
     ("restricted" . gpr-skel-user-restricted))
    ("header" . gpr-skel-header)
    ("package" . gpr-skel-package)
    ("project" . gpr-skel-project))
"For `wisi-skel-token-alist', used by `wisi-skel-expand'.")

(defun gpr-skel-setup ()
  "Setup a buffer for gpr-skel."
  (setq wisi-skel-token-alist gpr-skel-token-alist)
  (add-hook 'skeleton-end-hook #'wisi-skel-enable-parse t)
  (add-hook 'skeleton-end-hook #'wisi-indent-statement t)
  (when (and gpr-skel-initial-string
	     (= (buffer-size) 0))
    (insert gpr-skel-initial-string))
  )

(add-hook 'gpr-mode-hook #'gpr-skel-setup)

(provide 'gpr-skel)
;;; end of file
