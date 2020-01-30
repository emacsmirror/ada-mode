;; user options shared by gpr mode indentation engines  -*- lexical-binding:t -*-
;;
;; Copyright (C) 2017, 2019  Free Software Foundation, Inc.
;;
;; Author: Stephen Leake <stephen_leake@member.fsf.org>
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

;;;; code

(defgroup gpr-indentation nil
  "Indentation options for gpr source."
  :group 'gpr)

(defcustom gpr-indent 3
  "Size of default indentation, when no other indentation is used."
  :type 'integer
  :safe #'integerp)
(make-variable-buffer-local 'gpr-indent)

(defcustom gpr-indent-broken 2
  "Indentation for the continuation of a broken line."
  :type 'integer
  :safe #'integerp)
(make-variable-buffer-local 'gpr-indent-broken)

(defcustom gpr-indent-when 3
  "Indentation for `when' relative to `case'."
  :type  'integer
  :safe  #'integerp)
(make-variable-buffer-local 'gpr-indent-when)

(provide 'gpr-indent-user-options)

;; end file
