;; Emacs wisi project definitions for compiling ada-mode in ELPA workspace -*- no-byte-compile: t; -*-
;;
;; Copyright (C) 2021, 2022  Free Software Foundation, Inc.
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

(wisi-prj-select-cache
 "ada_mode.prj"
 (create-ada-prj
  :name "ada_mode elpa"
  :compile-env
  (list
   (concat "WISI=" (expand-file-name "../wisi"))))
 "ELPA.make"
 )

(ada-parse-require-process) ;; slow start due to lr1 parse table
;; end of file
