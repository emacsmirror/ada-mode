;; xref backend agnostic benchmark for xref operations

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
starting from point-min. If TARGET is "", start the next test
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
