;;; ada-gnat-xref.el --- Ada mode cross-reference functionality provided by 'gnat xref'  -*- lexical-binding:t -*-
;;
;; These tools are all Ada-specific; see gpr-query for multi-language
;; GNAT cross-reference tools.
;;
;; GNAT is provided by AdaCore; see http://libre.adacore.com/
;;
;;; Copyright (C) 2012 - 2020  Free Software Foundation, Inc.
;;
;; Author: Stephen Leake <stephen_leake@member.fsf.org>
;; Maintainer: Stephen Leake <stephen_leake@member.fsf.org>
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
;;; Usage:
;;
;; Emacs should enter Ada mode automatically when you load an Ada
;; file, based on the file extension.
;;
;; By default, ada-mode is configured to load this file, so nothing
;; special needs to done to use it.

(require 'compile)
(require 'gnat-core)

;;;;; code

;;;; uses of gnat tools

(defconst gnatxref-buffer-name-prefix "*gnatxref-")

(defconst ada-gnat-file-line-col-regexp "\\(.*\\):\\([0-9]+\\):\\([0-9]+\\)")

(defconst ada-gnat-file-line-col-type-regexp
  (concat ada-gnat-file-line-col-regexp ": +\\(?:(\\(.*\\))\\)?")
  "Regexp matching <file>:<line>:<column> (<type>)")

(cl-defstruct (gnatxref-xref (:include gnat-compiler))
  ;; no new slots
  )

;;;###autoload
(cl-defun create-gnat-xref
    (&key
     gpr-file
     run-buffer-name
     project-path
     target
     runtime
     gnat-stub-opts
     gnat-stub-cargs)
  ;; See note on `create-ada-prj' for why this is not a defalias.
  (make-gnatxref-xref
   :gpr-file gpr-file
   :run-buffer-name run-buffer-name
   :project-path project-path
   :target target
   :runtime runtime
   :gnat-stub-opts gnat-stub-opts
   :gnat-stub-cargs gnat-stub-cargs
   ))

(cl-defmethod wisi-xref-parse-one ((xref gnatxref-xref) project name value)
  (wisi-compiler-parse-one xref project name value))

(cl-defmethod wisi-xref-parse-final ((xref gnatxref-xref) _project prj-file-name)
  (setf (gnat-compiler-run-buffer-name xref) (gnat-run-buffer-name prj-file-name gnatxref-buffer-name-prefix)))

(cl-defmethod wisi-xref-completion-table ((_xref gnatxref-xref) _project)
  (wisi-names t t))

(cl-defgeneric wisi-xref-completion-regexp ((_xref gnatxref-xref))
  wisi-names-regexp)

(defun ada-gnat-xref-adj-col (identifier col)
  "Return COL adjusted for 1-index, quoted operators."
  (cond
   ((null col)
    col)
   
   ((eq ?\" (aref identifier 0))
    ;; There are two cases here:
    ;;
    ;; In both cases, gnat find wants the operators quoted, and the
    ;; column on the +. Gnat column is one-indexed; emacs is 0 indexed.
    ;;
    ;; In the first case, the front end passes in a column on the leading ", so we add one.
    ;;
    ;; In the second case, the front end passes in a column on the +
    (cond
     ((= ?\" (char-after (point)))
      ;; test/ada_mode-slices.adb
      ;; function "+" (Left : in Day; Right : in Integer) return Day;
      (+ 2 col))

     (t
      ;; test/ada_mode-slices.adb
      ;; D1, D2 : Day := +Sun;
      (+ 1 col))
     ))

   (t
    ;; Gnat column is one-indexed; emacs is 0 indexed.
    (+ 1 col))
   ))

(defun ada-gnat-xref-common-cmd (project)
  "Returns the gnatfind command to run to find cross-references."
  (format "%sgnatfind" (or (gnat-compiler-target (wisi-prj-xref project)) "")))

(defun ada-gnat-xref-common-args (project identifier file line col)
  "Returns a list of arguments to pass to gnatfind.  Some
elements of the result may be nil."
  (list "-a"
        (when wisi-xref-full-path "-f")
	;; 'gnatfind' does not take a gnat project file argument. We
	;; assue you are not using gnatxref if you are using a gnat
	;; project file; use gpr_query.
        (when (wisi-prj-source-path project)
          (concat "-aI" (mapconcat 'identity (wisi-prj-source-path project) " -aI")))
        (when (plist-get (ada-prj-plist project) 'obj_dir)
          (concat "-aO" (mapconcat 'identity (plist-get (ada-prj-plist project) 'obj_dir) " -aO")))
        (format "%s:%s:%s:%s"
                identifier
                (file-name-nondirectory file)
                (or line "")
                (or (ada-gnat-xref-adj-col identifier col) ""))))

(defun ada-gnat-xref-refs (project item all)
  (with-slots (summary location) item
    (with-slots (file line column) location
      (let* ((wisi-xref-full-path t)
	     (args (cons "-r" (ada-gnat-xref-common-args project summary file line column)))
	     (result nil))
	(with-current-buffer (gnat-run-buffer project (gnat-compiler-run-buffer-name (wisi-prj-xref project)))
	  (gnat-run project (ada-gnat-xref-common-cmd project) args)

	  (goto-char (point-min))
	  (when ada-gnat-debug-run (forward-line 2)); skip ADA_PROJECT_PATH, 'gnat find'

	  (while (not (eobp))
	    (cond
	     ((looking-at ada-gnat-file-line-col-type-regexp)
	      ;; process line
	      (let ((found-file (match-string 1))
		    (found-line (string-to-number (match-string 2)))
		    (found-col  (string-to-number (match-string 3)))
		    (found-type (match-string 4)))
		(when (or all found-type)
		  (push (xref-make (if found-type
				       (concat summary " " found-type)
				     summary)
				   (xref-make-file-location found-file found-line found-col))
			result))
		))
	     (t
	      ;; ignore line
	      ))
	    (forward-line 1)))
	(nreverse result) ;; specs first.
	))))

(cl-defmethod wisi-xref-definitions (_xref project item)
  (ada-gnat-xref-refs project item nil))

(cl-defmethod wisi-xref-references (_xref project item)
  (ada-gnat-xref-refs project item t))

(cl-defmethod wisi-xref-other ((_xref gnatxref-xref) project &key identifier filename line column)
  (let* ((wisi-xref-full-path t)
	 (cmd (ada-gnat-xref-common-cmd project))
	 (args (ada-gnat-xref-common-args project identifier filename line column))
	 (result nil))
    (with-current-buffer (gnat-run-buffer project (gnat-compiler-run-buffer-name (wisi-prj-xref project)))
      (gnat-run project cmd args)

      (goto-char (point-min))
      (when ada-gnat-debug-run (forward-line 2)); skip ADA_PROJECT_PATH, 'gnat find'

      ;; gnat find returns two items; the starting point, and the 'other' point
      (unless (looking-at (concat ada-gnat-file-line-col-regexp ":"))
	;; no results
	(error "'%s' not found in cross-reference files; recompile?" identifier))

      (while (not result)
	(looking-at (concat ada-gnat-file-line-col-regexp "\\(: warning:\\)?"))
	(if (match-string 4)
	    ;; error in *.gpr; ignore here.
	    (forward-line 1)
	  ;; else process line
	  (let ((found-file (match-string 1))
		(found-line (string-to-number (match-string 2)))
		(found-col  (string-to-number (match-string 3))))
	    ;; Sometimes gnatfind does not respect "-f" (test/ada_mode.ads Separate_Procedure full body)
	    (unless (file-name-absolute-p found-file)
	      (setq found-file (locate-file found-file compilation-search-path)))

	    (if (not
		 (and
		  ;; due to symbolic links, only the non-dir filename is comparable.
		  (equal (file-name-nondirectory filename) (file-name-nondirectory found-file))
		  (= line found-line)
		  (= (ada-gnat-xref-adj-col identifier column) found-col)))
		;; Found other item.
		(setq result (list found-file found-line (1- found-col)))
	      ;; else keep searching
	      (forward-line 1))
	    ))

	(when (eobp)
	  (error "gnat find did not return other item"))
	))
    result))

(cl-defmethod wisi-xref-parents ((_xref gnatxref-xref) project &key identifier filename line column)
  (let* ((arg (ada-gnat-xref-common-args project identifier filename line column))
	 (result nil))
    (with-current-buffer (gnat-run-buffer project (gnat-compiler-run-buffer-name (wisi-prj-xref project)))
      (gnat-run project (ada-gnat-xref-common-cmd project) (cons "-d" arg))

      (goto-char (point-min))
      (when ada-gnat-debug-run (forward-line 2)); skip GPR_PROJECT_PATH, 'gnat find'

      ;; gnat find returns two items; the starting point, and the 'other' point
      (unless (looking-at (concat ada-gnat-file-line-col-regexp ":"))
	;; no results
	(error "'%s' not found in cross-reference files; recompile?" identifier))

      (while (not result)
	(looking-at (concat ada-gnat-file-line-col-regexp "\\(: warning:\\)?"))
	(if (match-string 4)
	    ;; error in *.gpr; ignore here.
	    (forward-line 1)
	  ;; else process line
	  (skip-syntax-forward "^ ")
	  (skip-syntax-forward " ")
	  (if (looking-at (concat "derived from .* (" ada-gnat-file-line-col-regexp ")"))
	      ;; found other item
	      (setq result (list (match-string 1)
				 (string-to-number (match-string 2))
				 (1- (string-to-number (match-string 3)))))
	    (forward-line 1))
	  )
	(when (eobp)
	  (error "gnat find did not return parent types"))
	))

    (wisi-goto-source (nth 0 result)
		      (nth 1 result)
		      (nth 2 result))
    ))

(cl-defmethod wisi-xref-all ((_xref gnatxref-xref) project &key identifier filename line column local-only append)
  ;; we use `compilation-start' to run gnat, not `gnat-run', so it
  ;; is asynchronous, and automatically runs the compilation error
  ;; filter.

  (let* ((arg (ada-gnat-xref-common-args project identifier filename line column)))
    (setq arg (cons "-r" arg))
    (when local-only (setq arg (append arg (list filename))))

    (with-current-buffer (gnat-run-buffer project (gnat-compiler-run-buffer-name (wisi-prj-xref project)))
      (let ((compilation-buffer-name "*gnatfind*")
            (compilation-error "reference")
            (command-and-args (mapconcat (lambda (a) (or a ""))
                                         (cons (ada-gnat-xref-common-cmd project) arg)
                                         " "))
	    ;; gnat find uses standard gnu format for output, so don't
	    ;; need to set compilation-error-regexp-alist
	    prev-pos
	    prev-content)

	;; compilation-environment is set in `wisi-prj-select'

	;; WORKAROUND: the 'compilation' API doesn't let us specify "append", so we use this.
	(with-current-buffer (get-buffer-create compilation-buffer-name)
	  (when append
	    (setq prev-pos (point))
	    (setq prev-content (buffer-substring (point-min) (point-max))))

          (unless ada-gnat-debug-run
	    ;; hide the command and arguments using text properties, show only the bare minimum
	    (setq command-and-args
		  (propertize command-and-args
			      'display
			      (format "References to %s at %s:%d:%d" identifier filename line column))))
	  (compilation-start command-and-args
			     'compilation-mode
			     (lambda (_name) compilation-buffer-name))
	  (when append
	    (let ((inhibit-read-only t))
		(goto-char (point-min))
		(insert prev-content)
		(goto-char prev-pos))))
	))))

(cl-defmethod wisi-xref-overriding ((_xref gnatxref-xref) _project &key _identifier _filename _line _column)
  (error "gnatxref does not support 'show overriding' - use gpr_query?"))

(cl-defmethod wisi-xref-overridden ((_xref gnatxref-xref) _project &key _identifier _filename _line _column)
  (error "gnatxref does not support 'show overridden' - use gpr_query?"))

(provide 'ada-gnat-xref)
;; end of file
