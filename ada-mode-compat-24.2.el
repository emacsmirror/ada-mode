;; ada-mode-compat-24.2.el --- Implement current Emacs features not present in Emacs 24.2  -*- lexical-binding:t -*-
;; FIXME: rename to ada-mode-compat.el, rely on functionp etc. doc emacs version for each item

;; Copyright (C) 2014-2015 Free Software Foundation, Inc.

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

;; using cl-lib 0.4 from Gnu ELPA

(when (not (functionp 'file-name-base))
  (defun file-name-base (&optional filename)
    "Return the base name of the FILENAME: no directory, no extension.
FILENAME defaults to `buffer-file-name'."
    (file-name-sans-extension
     (file-name-nondirectory (or filename (buffer-file-name))))))

(when (not (functionp 'font-lock-ensure))
  (defun font-lock-ensure (&optional beg end)
    (font-lock-fontify-region (or beg (point-min)) (or end (point-max)))))

;; FIXME: need cl-flet, but there is no macrop
(provide 'ada-mode-compat-24.2)

;; end of file
