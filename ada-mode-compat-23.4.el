;;; ada-mode-compat-23.4.el --- Implement current Emacs features not present in Emacs 23.4

;; Copyright (C) 2013  Free Software Foundation, Inc.

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

(defvar compilation-filter-start (make-marker)
  "")

(defun compilation-filter-start (proc)
  ""
  (set-marker compilation-filter-start (point-max)))

(defun compilation--put-prop (matchnum prop val)
  (when (and (integerp matchnum) (match-beginning matchnum))
    (put-text-property
     (match-beginning matchnum) (match-end matchnum)
     prop val)))

;; FIXME: emacs 24.x manages compilation-filter-start, emacs 23.4 does not
;;
;; gnat-core.el gnat-prj-parse-emacs-final needs:
;;    (add-hook 'compilation-start-hook 'ada-gnat-compilation-start))
;;
;; ada-gnat.el ada-gnat-compilation-filter needs:
;;    (set-marker compilation-filter-start (point)))

;; end of file
