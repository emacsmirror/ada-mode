;;; benchmark-xref.el --- xref backend agnostic benchmark for xref operations
;;
;; Copyright (C) 2022  Free Software Foundation, Inc.
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

(defun bench-xref-one-test (test xref-function)
  (find-file (car test))
  (goto-char (point-min))
  (dolist (op (cdr test))
    (let ((search-start (point-min)))
      (dolist (target op)
	(if (string-equal target "")
	    (setq search-start (point))
	  (goto-char search-start)
	  (search-forward-regexp target)
	  (setq search-start (match-beginning 0))))
      (call-interactively xref-function))))

(defun benchmark-xref (test-list xref-function)
  "TEST-LIST is a list of TEST, where TEST is a list (FILENAME (TARGET ...) ...).
For each TEST, open the file, and search for each TARGET,
starting from point-min. If TARGET is \"\", start the next test
from current point instead. Then invoke xref-function. Repeat for
each list of TARGET, using the current file. Show the time for
each TEST, and the total time.

For the wisi xref backend, xref-function should be wisi-goto-spec/body.
For eglot xref backend, xref-function should be xref-find-definitions."
(let ((total-start-time (current-time)))
  (dolist (test test-list)
    (let ((test-start-time (current-time)))
      (bench-xref-one-test test xref-function)
      (message "%s %f" (car test) (float-time (time-since test-start-time)))))
  (message "total time: %f" (float-time (time-since total-start-time)))))

(defconst ada-mode-test
  '(("/Projects/org.emacs.ada-mode/wisi-ada.adb"
     ("Indent_Token_1" "Tree.Line_Region" "Line_Region") ;; to -syntax_trees.ads
     ("") ;; to -syntax_trees.adb
     ))
  "Example test-list for Emacs ada-mode development project.")

(provide 'benchmark-xref.el)
;; end of file
