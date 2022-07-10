;;; ada-compiler-gnat.el --- Ada mode compiling functionality provided by GNAT  -*- lexical-binding:t -*-
;;;
;; GNAT is provided by AdaCore; see http://libre.adacore.com/
;;
;;; Copyright (C) 2012 - 2022  Free Software Foundation, Inc.
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
;; special needs to be done to use it.

(require 'ada-core)
(require 'cl-lib)
(require 'compile)
(require 'gnat-core)
(require 'wisi)

;;;; compiler message handling

(defconst ada-gnat-predefined-package-alist
  '(
    ("a-calend" . "Ada.Calendar")
    ("a-chahan" . "Ada.Characters.Handling")
    ("a-comlin" . "Ada.Command_Line")
    ("a-contai" . "Ada.Containers")
    ("a-direct" . "Ada.Directories")
    ("a-except" . "Ada.Exceptions")
    ("a-ioexce" . "Ada.IO_Exceptions")
    ("a-finali" . "Ada.Finalization")
    ("a-numeri" . "Ada.Numerics")
    ("a-nuflra" . "Ada.Numerics.Float_Random")
    ("a-stream" . "Ada.Streams")
    ("a-ststio" . "Ada.Streams.Stream_IO")
    ("a-string" . "Ada.Strings")
    ("a-strfix" . "Ada.Strings.Fixed")
    ("a-strmap" . "Ada.Strings.Maps")
    ("a-strunb" . "Ada.Strings.Unbounded")
    ("a-stwiun" . "Ada.Strings.Wide_Unbounded")
    ("a-textio" . "Ada.Text_IO")
    ("g-comlin" . "GNAT.Command_Line")
    ("g-dirope" . "GNAT.Directory_Operations")
    ("g-socket" . "GNAT.Sockets")
    ("i-c"      . "Interfaces.C")
    ("i-cstrin" . "Interfaces.C.Strings")
    ("interfac" . "Interfaces")
    ("s-stoele" . "System.Storage_Elements")
    )
  "Alist (filename . package name) of GNAT file names for predefined Ada packages.")

(defun ada-gnat-compilation-filter ()
  "Filter to add text properties to secondary file references.
For `compilation-filter-hook'."
  (save-excursion
    (goto-char compilation-filter-start)

    ;; primary references are handled by font-lock functions; see
    ;; `compilation-mode-font-lock-keywords'.
    ;;
    ;; compilation-filter might insert partial lines, or it might insert multiple lines
    (goto-char (line-beginning-position))
    (while (not (eobp))
      ;; We don't want 'next-error' to always go to secondary
      ;; references, so we _don't_ set 'compilation-message text
      ;; property. Instead, we set 'ada-secondary-error, so
      ;; `ada-show-secondary-error' will handle it. We also set
      ;; fonts, so the user can see the reference.

      ;; typical secondary references look like:
      ;;
      ;; trivial_productions_test.adb:57:77:   ==> in call to "Get" at \
      ;;    opentoken-token-enumerated-analyzer.ads:88, instance at line 41
      ;;
      ;; c:/foo/bar/lookahead_test.adb:379:14: found type access to "Standard.String" defined at line 379
      ;;
      ;; lookahead_test.ads:23:09: "Name" has been inherited from subprogram at aunit-simple_test_cases.ads:47
      ;;
      ;; lalr.adb:668:37: non-visible declaration at analyzer.ads:60, instance at parser.ads:38
      ;;
      ;; save the file from the primary reference, look for "*.ad?:nn", "at line nnn"

      (let (file)
	(when (looking-at "^\\(\\(.:\\)?[^ :\n]+\\):")
	  (setq file (match-string-no-properties 1)))

	(skip-syntax-forward "^-"); space following primary reference

	(while (search-forward-regexp "\\s-\\(\\([^[:blank:]]+\\.[[:alpha:]]+\\):\\([0-9]+\\):?\\([0-9]+\\)?\\)"
				      (line-end-position) t)

	  (goto-char (match-end 0))
	  (with-silent-modifications
	    (compilation--put-prop 2 'font-lock-face compilation-info-face); file
	    (compilation--put-prop 3 'font-lock-face compilation-line-face); line
	    (compilation--put-prop 4 'font-lock-face compilation-line-face); col
	    (put-text-property
	     (match-beginning 0) (match-end 0)
	     'ada-secondary-error
	     (list
	      (match-string-no-properties 2); file
	      (string-to-number (match-string-no-properties 3)); line
	      (if (match-string 4)
		  (1- (string-to-number (match-string-no-properties 4)))
		0); column
	      ))
	    ))

	(when (search-forward-regexp "\\(at line \\)\\([0-9]+\\)" (line-end-position) t)
	  (with-silent-modifications
	    (compilation--put-prop 1 'font-lock-face compilation-info-face); "at line" instead of file
	    (compilation--put-prop 2 'font-lock-face compilation-line-face); line
	    (put-text-property
	     (match-beginning 1) (match-end 1)
	     'ada-secondary-error
	     (list
	      file
	      (string-to-number (match-string-no-properties 2)); line
	      1)); column
	    ))
	(forward-line 1))
      )
    ))

(defun ada-gnat-debug-filter ()
  ;; call ada-gnat-compilation-filter with `compilation-filter-start' bound
  (interactive)
  (beginning-of-line)
  (let ((compilation-filter-start (point)))
    (ada-gnat-compilation-filter)))

;;;;; auto fix compilation errors

(defconst ada-gnat-file-name-regexp
  "\\([a-z-_.]+\\)"
  "regexp to extract a file name")

(defconst ada-gnat-quoted-name-regexp
  "\"\\([[:alnum:]_.']+\\)\""
  "regexp to extract the quoted names in error messages")

(defconst ada-gnat-quoted-punctuation-regexp
  "\"\\([,:;=()|]+\\)\""
  "regexp to extract quoted punctuation in error messages")

(defun ada-gnat-misspelling ()
  "Return correct spelling from current compiler error.
Prompt user if more than one."
  ;; wisi-output.adb:115:41: no selector "Productions" for type "RHS_Type" defined at wisi.ads:77
  ;; wisi-output.adb:115:41: invalid expression in loop iterator
  ;; wisi-output.adb:115:42: possible misspelling of "Production"
  ;; wisi-output.adb:115:42: possible misspelling of "Production"
  ;;
  ;; GNAT Community 2021 adds "error: " to the above (a misspelling is never a warning):
  ;; wisi-output.adb:115:41: error: invalid expression in loop iterator
  ;; wisi-output.adb:115:42: error: possible misspelling of "Production"
  ;; wisi-output.adb:115:42: error: possible misspelling of "Production"
  ;;
  ;; column number can vary, so only check the line number
  (save-excursion
    (let* ((start-msg (get-text-property (line-beginning-position) 'compilation-message))
	   (start-line (nth 1 (compilation--message->loc start-msg)))
	   done choices)
      (while (not done)
	(forward-line 1)
	(let ((msg (get-text-property (line-beginning-position) 'compilation-message)))
	  (setq done (or (not msg)
			 (not (equal start-line (nth 1 (compilation--message->loc msg)))))))
	(when (and (not done)
		   (progn
		     (skip-syntax-forward "^-")
		     (forward-char 1)
		     (when (looking-at "error: ")
		       (goto-char (match-end 0)))
		     (looking-at (concat "possible misspelling of " ada-gnat-quoted-name-regexp))))
	  (push (match-string 1) choices)))

      ;; return correct spelling
      (cond
       ((= 0 (length choices))
	nil)

       ((= 1 (length choices))
	(car choices))

       (t ;; multiple choices
	(completing-read "correct spelling: " choices))
       ))))

(defun ada-gnat-qualified ()
  "Return qualified name from current compiler error, if there is one offered."
  (save-excursion
    (forward-line 1)
    (skip-syntax-forward "^ ")
    (when (looking-at " use fully qualified name starting with \\([[:alnum:]_]+\\) to make")
      (match-string 1))
    ))

(cl-defmethod wisi-compiler-fix-error ((_compiler gnat-compiler) source-buffer)
  (let ((start-pos (point))
	message-column
	result)
    ;; Move to start of error message text. GNAT Community 2021 puts
    ;; warning: | error: after the file:line:column; earlier compilers
    ;; only put "warning: ".
    ;;
    ;; test_incremental.adb:657:20: error: "Checks" not declared in "WisiToken"
    (skip-syntax-forward "^-") ;; file:line:column
    (forward-char 1)
    (when (looking-at "warning: \\|error: ")
      (goto-char (match-end 0)))
    (setq message-column (current-column))

    ;; recognize it, handle it
    (setq
     result
     (unwind-protect
	 (cond
	  ;; It is tempting to define an alist of (MATCH . ACTION), but
	  ;; that is too hard to debug
	  ;;
	  ;; This list will get long, so let's impose some order.
	  ;;
	  ;; First expressions that start with a named regexp,
	  ;; alphabetical by variable name and following string.
	  ;;
	  ;; Then expressions that start with a string, alphabetical by string.
	  ;;
	  ;; Then style errors.

	  ((looking-at (concat ada-gnat-quoted-name-regexp " is not a component of "))
	 	   (save-excursion
	     (let ((child-name (match-string 1))
		   (correct-spelling (ada-gnat-misspelling)))
	       (setq correct-spelling (match-string 1))
	       (pop-to-buffer source-buffer)
	       (search-forward child-name)
	       (replace-match correct-spelling))
	     t))

	  ((looking-at (concat ada-gnat-quoted-name-regexp " is not visible"))
	   (let* ((done nil)
		  (err-msg (get-text-property (line-beginning-position) 'compilation-message))
		  (file-line-struct err-msg)
		  pos choices unit-name)
	     ;; next line may contain a reference to where ident is
	     ;; defined; if present, it will have been marked by
	     ;; ada-gnat-compilation-filter:
	     ;;
    ;; gnatquery.adb:255:13: error: "Has_Element" is not visible
    ;; gnatquery.adb:255:13: error: non-visible declaration at a-convec.ads:68, instance at gnatcoll-arg_lists.ads:157
    ;; gnatquery.adb:255:13: error: non-visible declaration at a-coorse.ads:62, instance at gnatcoll-xref.ads:912
    ;; gnatquery.adb:255:13: error: non-visible declaration at a-coorse.ads:62, instance at gnatcoll-xref.ads:799
    ;; gnatquery.adb:255:13: error: non-visible declaration at gnatcoll-xref.ads:314
	     ;;
	     ;; or the next line may contain "multiple use clauses cause hiding"
	     ;;
	     ;; the lines after that may contain alternate matches;
	     ;; collect all, let user choose.
	     ;;
	     ;; However, a line that contains 'ada-secondary-error may be from the next error message:
	     ;; parser_no_recover.adb:297:60: no selector "Tree" for type "Parser_State" defined at lists.ads:96
	     (forward-line 1)
	     (when (looking-at ".* multiple use clauses cause hiding")
	       (forward-line 1))
	     (while (not done)
	       (let ((limit (1- (line-end-position))))
		 ;; 1- because next compilation error is at next line beginning
		 (setq done (not
			     (and
			      (equal file-line-struct err-msg) ;; same error message?
			      (setq pos (next-single-property-change (point) 'ada-secondary-error nil limit))
			      (<= pos limit))))
		 (when (not done)
		   (let* ((item (get-text-property pos 'ada-secondary-error))
			  (unit-file (nth 0 item))
			  (prj (project-current))
			  (choice (ada-compiler-ada-name-from-file-name (wisi-prj-compiler prj) prj unit-file)))
		     (unless (member choice choices) (push choice choices))
		     (goto-char (1+ pos))
		     (goto-char (1+ (next-single-property-change (point) 'ada-secondary-error nil limit)))
		     (when (eolp)
		       (forward-line 1)
		       (setq file-line-struct (get-text-property (point) 'compilation-message)))
		     ))
		 ))

	     (setq unit-name
		   (cond
		    ((= 0 (length choices)) nil)
		    ((= 1 (length choices)) (car choices))
		    (t ;; multiple choices
		     (completing-read "package name: " choices))))

	     (when unit-name
	       (pop-to-buffer source-buffer)
	       ;; We either need to add a with_clause for a package, or
	       ;; prepend the package name here (or add a use clause, but I
	       ;; don't want to do that automatically).
	       ;;
	       ;; If we need to add a with_clause, unit-name may be only
	       ;; the prefix of the real package name, but in that case
	       ;; we'll be back after the next compile; no way to get the
	       ;; full package name (without the function/type name) now.
	       ;; Note that we can't use gnat find, because the code
	       ;; doesn't compile.
	       (cond
		((looking-at (concat unit-name "\\."))
		 (ada-fix-add-with-clause unit-name))
		(t
		 (ada-fix-insert-unit-name unit-name)
		 (insert ".")))
	       t) ;; success, else nil => fail
	     ))

	  ((or (looking-at (concat ada-gnat-quoted-name-regexp " is undefined"))
	       (looking-at (concat ada-gnat-quoted-name-regexp " is not a predefined library unit")))
	   ;; We either need to add a with_clause for a package, or
	   ;; something is spelled wrong.
	   (save-excursion
	     (let ((unit-name (match-string 1))
		   (correct-spelling (ada-gnat-misspelling)))
	       (if correct-spelling
		   (progn
		     (pop-to-buffer source-buffer)
		     (search-forward unit-name)
		     (replace-match correct-spelling))

		 ;; else assume missing with
		 (pop-to-buffer source-buffer)
		 (ada-fix-add-with-clause unit-name))))
	   t)

	  ((looking-at (concat ada-gnat-quoted-name-regexp " not declared in " ada-gnat-quoted-name-regexp))
	   (save-excursion
	     (let ((child-name (match-string 1))
		   (partial-parent-name (match-string 2))
		   (correct-spelling (ada-gnat-misspelling))
		   (qualified (ada-gnat-qualified)))
	       (cond
		(correct-spelling
		 (pop-to-buffer source-buffer)
		 (search-forward child-name)
		 (replace-match correct-spelling))

		(qualified
		 (pop-to-buffer source-buffer)
		 (search-forward child-name)
		 (skip-syntax-backward "w_.")
		 (insert qualified "."))

		(t
		 ;; else guess that "child" is a child package, and extend the with_clause
		 (pop-to-buffer source-buffer)
		 (ada-fix-extend-with-clause partial-parent-name child-name))))
	   t))

	  ((looking-at (concat ada-gnat-quoted-punctuation-regexp
			       " should be "
			       ada-gnat-quoted-punctuation-regexp))
	   (let ((bad (match-string-no-properties 1))
		 (good (match-string-no-properties 2)))
	     (pop-to-buffer source-buffer)
	     (looking-at bad)
	     (delete-region (match-beginning 0) (match-end 0))
	     (insert good))
	   t)

;;;; strings
	  ((looking-at (concat "aspect \"" ada-name-regexp "\" requires 'Class"))
	   (pop-to-buffer source-buffer)
	   (forward-word 1)
	   (insert "'Class")
	   t)

	  ((looking-at (concat "\"end " ada-name-regexp ";\" expected"))
	   (let ((expected-name (match-string 1)))
	     (pop-to-buffer source-buffer)
	     (if (looking-at (concat "end " ada-name-regexp ";"))
		 (progn
		   (goto-char (match-end 1))   ; just before ';'
		   (delete-region (match-beginning 1) (match-end 1)))
	       ;; else we have just 'end;'
	       (forward-word 1)
	       (insert " "))
	     (insert expected-name))
	   t)

	  ((looking-at (concat "\"end loop " ada-name-regexp ";\" expected"))
	   (let ((expected-name (match-string 1)))
	     (pop-to-buffer source-buffer)
	     (if (looking-at (concat "end loop " ada-name-regexp ";"))
		 (progn
		   (goto-char (match-end 1))   ; just before ';'
		   (delete-region (match-beginning 1) (match-end 1)))
	       ;; else we have just 'end loop;'
	       (forward-word 2)
	       (insert " "))
	     (insert expected-name))
	   t)

	  ((looking-at "expected an access type")
	   (progn
	     (set-buffer source-buffer)
	     (backward-char 1)
	     (when (looking-at "\\.all")
	       (delete-char 4)
	       t)))

	  ((looking-at (concat "expected \\(private \\)?type " ada-gnat-quoted-name-regexp))
	   (forward-line 1)
	   (move-to-column message-column)
	   (cond
	    ((looking-at "found procedure name")
	     (pop-to-buffer source-buffer)
	     (forward-word 1)
	     (insert "'Access")
	     t)
	    ((looking-at "found type access")
	     (pop-to-buffer source-buffer)
	     (if (looking-at "'Access")
		 (kill-word 1)
	       (forward-symbol 1)
	       (insert ".all"))
	     t)
	    ((looking-at "found type .*_Access_Type")
	     ;; assume just need '.all'
	     (pop-to-buffer source-buffer)
	     (forward-word 1)
	     (insert ".all")
	     t)
	    ))

	  ((looking-at "extra \".\" ignored")
	   (set-buffer source-buffer)
	   (delete-char 1)
	   t)

	  ((looking-at (concat "keyword " ada-gnat-quoted-name-regexp " expected here"))
	   (let ((expected-keyword (match-string 1)))
	     (pop-to-buffer source-buffer)
	     (insert " " expected-keyword))
	   t)

	  ((looking-at "\\(?:possible \\)?missing \"with \\([[:alnum:]_.]+\\);")
	   ;; also 'possible missing "with Ada.Text_IO; use Ada.Text_IO"' - ignoring the 'use'
	   (let ((package-name (match-string-no-properties 1)))
	     (pop-to-buffer source-buffer)
	     ;; Could check if prefix is already with'd, extend
	     ;; it. But that's not easy. This message only occurs for
	     ;; compiler-provided Ada and GNAT packages.
	     (ada-fix-add-with-clause package-name))
	   t)

	  ;; must be after above
	  ;;
	  ;; missing "end;" for "begin" at line 234
	  ((looking-at "missing \"\\([^ ]+\\)\"")
	   (let ((stuff (match-string-no-properties 1)))
	     (set-buffer source-buffer)
	     (insert (concat stuff)));; if missing ")", don't need space; otherwise do?
	   t)

	  ((looking-at (concat "\\(?:possible \\)?misspelling of " ada-gnat-quoted-name-regexp))
	   (let ((expected-name (match-string 1)))
	     (pop-to-buffer source-buffer)
	     (looking-at ada-name-regexp)
	     (delete-region (match-beginning 1) (match-end 1))
	     (insert expected-name))
	   t)

	  ((looking-at "No legal interpretation for operator")
	   (forward-line 1)
	   (move-to-column message-column)
	   (looking-at (concat "use clause on " ada-gnat-quoted-name-regexp))
	   (let ((package (match-string 1)))
	     (pop-to-buffer source-buffer)
	     (ada-fix-add-use package))
	   t)

	  ((looking-at (concat "no selector " ada-gnat-quoted-name-regexp))
	   ;; Check next line for spelling error.
	   (save-excursion
	     (let ((unit-name (match-string 1))
		   (correct-spelling (ada-gnat-misspelling)))
	       (when correct-spelling
		 (pop-to-buffer source-buffer)
		 (search-forward unit-name)
		 (replace-match correct-spelling)
		 t))))

	  ((looking-at (concat "operator for \\(?:private \\)?type " ada-gnat-quoted-name-regexp
			       "\\(?: defined at " ada-gnat-file-name-regexp "\\)?"))
	   (let ((type (match-string 1))
		 (package-file (match-string 2))
		 ;; IMPROVEME: we'd like to handle ", instance at
		 ;; <file:line:column>", but gnatcoll.xref does not
		 ;; support looking up an entity by location alone; it
		 ;; requires the name, and this error message does not
		 ;; give the name of the instance. When we implement
		 ;; adalang xref, or if the error message improves,
		 ;; try again.
		 (prj (project-current)))
	     (when package-file
	       (setq type (concat
			   (ada-compiler-ada-name-from-file-name (wisi-prj-compiler prj) prj package-file)
			   "." type)))
	     (pop-to-buffer source-buffer)
	     (ada-fix-add-use-type type)
	   t))

	  ((looking-at "package \"Ada\" is hidden")
	   (pop-to-buffer source-buffer)
	   (forward-word -1)
	   (insert "Standard.")
	   t)

	  ((looking-at "parentheses required for unary minus")
	   (set-buffer source-buffer)
	   (insert "(")
	   (forward-word 1)
	   (insert ")")
	   t)

	  ((looking-at "prefix of dereference must be an access type")
	   (pop-to-buffer source-buffer)
	   ;; point is after '.' in '.all'
	   (delete-region (- (point) 1) (+ (point) 3))
	   t)

;;;; warnings
	  ((looking-at (concat ada-gnat-quoted-name-regexp " is already use-visible"))
	   ;; just delete the 'use'; assume it's on a line by itself.
	   (pop-to-buffer source-buffer)
	   (beginning-of-line)
	   (delete-region (point) (progn (forward-line 1) (point)))
	   t)

	  ((looking-at (concat ada-gnat-quoted-name-regexp " is not modified, could be declared constant"))
	   (pop-to-buffer source-buffer)
	   (search-forward ":")
	   (forward-comment (- (point-max) (point)))
	   ;; "aliased" must be before "constant", so check for it
	   (when (looking-at "aliased")
	     (forward-word 1)
	     (forward-char 1))
	   (insert "constant ")
	   t)

	  ((looking-at (concat "constant " ada-gnat-quoted-name-regexp " is not referenced"))
	   (let ((constant (match-string 1)))
	     (pop-to-buffer source-buffer)
	     (end-of-line)
	     (newline-and-indent)
	     (insert "pragma Unreferenced (" constant ");"))
	   t)

	  ((looking-at (concat "formal parameter " ada-gnat-quoted-name-regexp " is not referenced"))
	   (let ((param (match-string 1))
		 cache)
	     (pop-to-buffer source-buffer)
	     ;; Point is in a subprogram parameter list;
	     ;; ada-goto-declarative-region-start goes to the package,
	     ;; not the subprogram declarative_part (this is a change
	     ;; from previous wisi versions).
	     (setq cache (wisi-goto-statement-start))
	     (while (not (eq 'IS (wisi-cache-token cache)))
	       (forward-sexp)
	       (setq cache (wisi-get-cache (point))))
	     (forward-word)
	     (newline-and-indent)
	     (insert "pragma Unreferenced (" param ");"))
	   t)

	  ((looking-at (concat "formal parameter " ada-gnat-quoted-name-regexp " is not modified"))
	   (let ((mode-regexp "\"\\([in out]+\\)\"")
		 new-mode
		 old-mode)
	     (forward-line 1)
	     (search-forward-regexp
	      (concat "mode could be " mode-regexp " instead of " mode-regexp))
	     (setq new-mode (match-string 1))
	     (setq old-mode (match-string 2))
	     (pop-to-buffer source-buffer)
	     (search-forward old-mode)
	     (replace-match new-mode)
	     (ada-align)
	     )
	   t)

	  ((looking-at (concat "variable " ada-gnat-quoted-name-regexp " is not referenced"))
	   (let ((param (match-string 1)))
	     (pop-to-buffer source-buffer)
	     (forward-sexp);; end of declaration
	     (forward-char);; skip semicolon
	     (newline-and-indent)
	     (insert "pragma Unreferenced (" param ");"))
	   t)

	  ((or
	    (looking-at (concat "no entities of " ada-gnat-quoted-name-regexp " are referenced"))
	    (looking-at (concat "unit " ada-gnat-quoted-name-regexp " is never instantiated"))
	    (looking-at (concat "renamed constant " ada-gnat-quoted-name-regexp " is not referenced"))
	    (looking-at "redundant with clause"))
	   ;; just delete the declaration; assume it's on a line by itself.
	   (pop-to-buffer source-buffer)
	   (beginning-of-line)
	   (delete-region (point) (progn (forward-line 1) (point)))
	   t)

	  ((looking-at (concat "variable " ada-gnat-quoted-name-regexp " is assigned but never read"))
	   (let ((param (match-string 1)))
	     (pop-to-buffer source-buffer)
	     (wisi-goto-statement-end) ;; leaves point before semicolon
	     (forward-char 1)
	     (newline-and-indent)
	     (insert "pragma Unreferenced (" param ");"))
	   t)

	  ((looking-at (concat "unit " ada-gnat-quoted-name-regexp " is not referenced"))
	   ;; just delete the 'with'; assume it's on a line by itself.
	   (pop-to-buffer source-buffer)
	   (beginning-of-line)
	   (delete-region (point) (progn (forward-line 1) (point)))
	   t)

	  ((looking-at (concat "use clause for \\(package\\|type\\|private type\\) " ada-gnat-quoted-name-regexp " \\(defined at\\|from instance at\\|has no effect\\)"))
	   ;; delete the 'use'; assume it's on a line by itself.
	   (pop-to-buffer source-buffer)
	   (beginning-of-line)
	   (delete-region (point) (progn (forward-line 1) (point)))
	   t)

;;;; style errors
	  ((or (looking-at "(style) \".*\" in wrong column")
	       (looking-at "(style) this token should be in column"))
	   (set-buffer source-buffer)
	   (funcall indent-line-function)
	   t)

	  ((looking-at "(style) bad capitalization, mixed case required")
	   (set-buffer source-buffer)
	   (forward-word)
	   (wisi-case-adjust-identifier)
	   t)

	  ((looking-at (concat "(style) bad casing of " ada-gnat-quoted-name-regexp))
	   (let ((correct (match-string-no-properties 1))
		 end)
	     ;; gnat leaves point on first bad character, but we need to replace the whole word
	     (set-buffer source-buffer)
	     (skip-syntax-backward "w_")
	     (setq end (point))
	     (skip-syntax-forward "w_")
	     (delete-region (point) end)
	     (insert correct))
	   t)

	  ((or
	    (looking-at "(style) bad column")
	    (looking-at "(style) bad indentation")
	    (looking-at "(style) incorrect layout"))
	   (set-buffer source-buffer)
	   (funcall indent-line-function)
	   t)

	  ((looking-at "(style) \"exit \\(.*\\)\" required")
	   (let ((name (match-string-no-properties 1)))
	     (set-buffer source-buffer)
	     (forward-word 1)
	     (insert (concat " " name))
	   t))

	  ((looking-at "(style) misplaced \"then\"")
	   (set-buffer source-buffer)
	   (delete-indentation)
	   t)

         ((looking-at "(style) missing \"overriding\" indicator")
          (set-buffer source-buffer)
          (cond
           ((looking-at "\\(procedure\\)\\|\\(function\\)")
            (insert "overriding ")
	    t)
           (t
            nil)))

	  ((looking-at "(style) reserved words must be all lower case")
	   (set-buffer source-buffer)
	   (downcase-word 1)
	   t)

	  ((looking-at "(style) space not allowed")
	   (set-buffer source-buffer)
	   ;; Error places point on space. More than one trailing space
	   ;; should be fixed by delete-trailing-whitespace in
	   ;; before-save-hook, once the file is modified.
	   (delete-char 1)
	   t)

	  ((looking-at "(style) space required")
	   (set-buffer source-buffer)
	   (insert " ")
	   t)
	  )));; end of setq unwind-protect cond
    (if result
	t
      (goto-char start-pos)
      nil)
    ))

;;;; generic methods

(cl-defmethod ada-prj-select-compiler ((_compiler gnat-compiler) _project)
  ;; These can't be in wisi-compiler-select-prj (gnat-compiler),
  ;; because that is shared with gpr-mode (and maybe others).
  (add-hook 'compilation-filter-hook 'ada-gnat-compilation-filter)
  (add-hook 'ada-syntax-propertize-hook #'ada-gnat-syntax-propertize)

  ;; We should call `syntax-ppss-flush-cache' here, to force ppss with
  ;; the new hook function. But that must be done in all ada-mode
  ;; buffers, which is tedious. So we're ignoring it until it becomes
  ;; a problem; normally, the compiler is selected before any Ada
  ;; files are visited, so it's not an issue.
  )

(cl-defmethod ada-prj-deselect-compiler ((_compiler gnat-compiler) _project)
  (remove-hook 'ada-syntax-propertize-hook #'ada-gnat-syntax-propertize)
  (remove-hook 'compilation-filter-hook #'ada-gnat-compilation-filter)
  )

(cl-defmethod ada-compiler-file-name-from-ada-name ((compiler gnat-compiler) project ada-name)
  (let ((result nil))

    (while (string-match "\\." ada-name)
      (setq ada-name (replace-match "-" t t ada-name)))

    (setq ada-name (downcase ada-name))

    (with-current-buffer (gnat-run-buffer project (gnat-compiler-run-buffer-name compiler))
      (gnat-run-no-prj
       (list
	"krunch"
	ada-name
	;; "0" means only krunch GNAT library names
	"0"))

      (goto-char (point-min))
      (when ada-gnat-debug-run (forward-line 1)); skip  cmd
      (setq result (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
      )
    result))

(cl-defmethod ada-compiler-ada-name-from-file-name ((_compiler gnat-compiler) _project file-name)
  (let* ((ada-name (file-name-sans-extension (file-name-nondirectory file-name)))
	 (predefined (cdr (assoc ada-name ada-gnat-predefined-package-alist))))

    (if predefined
        predefined
      (while (string-match "-" ada-name)
	(setq ada-name (replace-match "." t t ada-name)))
      ada-name)))

(cl-defmethod ada-compiler-make-package-body ((compiler gnat-compiler) project body-file-name)
  ;; gnatstub always creates the body in the current directory (in the
  ;; process where gnatstub is running); the -o parameter may not
  ;; contain path info. So we bind default-directory here.
  (let ((start-file (buffer-file-name))
	(opts (when (gnat-compiler-gnat-stub-opts compiler)
		(split-string (gnat-compiler-gnat-stub-opts compiler))))
	(cargs (when (gnat-compiler-gnat-stub-cargs compiler)
		(append (list "-cargs") (split-string (gnat-compiler-gnat-stub-cargs compiler)))))
	(process-environment
	 (append
	   (wisi-prj-compile-env project)
	   (wisi-prj-file-env project)
	   (copy-sequence process-environment)))
	)

    ;; Make sure all relevant files are saved to disk.
    (save-some-buffers t)

    (with-current-buffer (gnat-run-buffer compiler (gnat-compiler-run-buffer-name compiler))
      (let ((default-directory (file-name-directory body-file-name)))
	(gnat-run-gnat
	 project
	 "stub"
	 (append opts (list start-file) cargs))

	(find-file body-file-name)
	(indent-region (point-min) (point-max))
	(save-buffer)))
    nil))

(defun ada-gnat-syntax-propertize (start end)
  (goto-char start)
  (save-match-data
    (while (re-search-forward
	    (concat
	     "[^[:alnum:])]\\('\\)\\[[\"a-fA-F0-9]+\"\\]\\('\\)"; 1, 2: non-ascii character literal, not attributes
	     "\\|\\(\\[\"[a-fA-F0-9]+\"\\]\\)"; 3: non-ascii character in identifier
	     )
	    end t)
      (cond
       ((match-beginning 1)
	(put-text-property
	 (match-beginning 1) (match-end 1) 'syntax-table '(7 . ?'))
	(put-text-property
	 (match-beginning 2) (match-end 2) 'syntax-table '(7 . ?')))

       ((match-beginning 3)
	(put-text-property
	 (match-beginning 3) (match-end 3) 'syntax-table '(2 . nil)))
       )
      )))

(provide 'ada-compiler-gnat)
;; ada-compiler-gnat.el ends here
