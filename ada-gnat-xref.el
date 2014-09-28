;; Ada mode cross-reference functionality provided by the 'gnat xref'
;; tool. Includes related functions, such as gnatprep support.
;;
;; These tools are all Ada-specific; see gpr-query or gnat-inspect for
;; multi-language GNAT cross-reference tools.
;;
;; GNAT is provided by AdaCore; see http://libre.adacore.com/
;;
;;; Copyright (C) 2012 - 2014  Free Software Foundation, Inc.
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

(require 'ada-fix-error)
(require 'compile)
(require 'gnat-core)

;;;;; code

;;;; uses of gnat tools

(defconst ada-gnat-file-line-col-regexp "\\(.*\\):\\([0-9]+\\):\\([0-9]+\\)")

(defun ada-gnat-xref-other (identifier file line col)
  "For `ada-xref-other-function', using 'gnat find', which is Ada-specific."

  (when (eq ?\" (aref identifier 0))
    ;; gnat find wants the quotes on operators, but the column is after the first quote.
    (setq col (+ 1 col))
    )

  (let* ((file-non-dir (file-name-nondirectory file))
	 (arg (format "%s:%s:%d:%d" identifier file-non-dir line col))
	 (switches (concat
                    "-a"
                    (when (ada-prj-get 'gpr_ext) (concat "--ext=" (ada-prj-get 'gpr_ext)))))
	 status
	 (result nil))
    (with-current-buffer (gnat-run-buffer)
      (gnat-run-gnat "find" (list switches arg))

      (goto-char (point-min))
      (forward-line 2); skip ADA_PROJECT_PATH, 'gnat find'

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
	    (if (not
		 (and
		  (equal file-non-dir found-file)
		  (= line found-line)
		  (= col found-col)))
		;; found other item
		(setq result (list found-file found-line (1- found-col)))
	      (forward-line 1))
	    ))

	(when (eobp)
	  (error "gnat find did not return other item"))
	))
    result))

(defun ada-gnat-xref-parents (identifier file line col)
  "For `ada-xref-parents-function', using 'gnat find', which is Ada-specific."

  (let* ((arg (format "%s:%s:%d:%d" identifier file line col))
	 (switches (list
                    "-a"
		    "-d"
		    (when (ada-prj-get 'gpr_ext) (concat "--ext=" (ada-prj-get 'gpr_ext)))
		    ))
	 (result nil))
    (with-current-buffer (gnat-run-buffer)
      (gnat-run-gnat "find" (append switches (list arg)))

      (goto-char (point-min))
      (forward-line 2); skip GPR_PROJECT_PATH, 'gnat find'

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

	    (skip-syntax-forward "^ ")
	    (skip-syntax-forward " ")
	    (if (looking-at (concat "derived from .* (" ada-gnat-file-line-col-regexp ")"))
		;; found other item
		(setq result (list (match-string 1)
				   (string-to-number (match-string 2))
				   (1- (string-to-number (match-string 3)))))
	      (forward-line 1)))
	  )
	(when (eobp)
	  (error "gnat find did not return parent types"))
	))

    (ada-goto-source (nth 0 result)
		     (nth 1 result)
		     (nth 2 result)
		     nil ;; other-window
		     )
    ))

(defun ada-gnat-xref-all (identifier file line col)
  "For `ada-xref-all-function'."
  ;; we use `compilation-start' to run gnat, not `gnat-run', so it
  ;; is asynchronous, and automatically runs the compilation error
  ;; filter.

  (let* ((cmd (format "gnat find -a -r %s:%s:%d:%d" identifier file line col)))

    (with-current-buffer (gnat-run-buffer); for default-directory
      (let ((compilation-environment (ada-prj-get 'proc_env))
	    (compilation-error "reference")
	    ;; gnat find uses standard gnu format for output, so don't
	    ;; need to set compilation-error-regexp-alist
	    )
	(when (ada-prj-get 'gpr_file)
	  (setq cmd (concat cmd " -P" (file-name-nondirectory (ada-prj-get 'gpr_file)))))

	(compilation-start cmd
			   'compilation-mode
			   (lambda (mode-name) (concat mode-name "-gnatfind")))
    ))))

;;;;; setup

(defun ada-gnat-xref-select-prj ()
  (setq ada-file-name-from-ada-name 'ada-gnat-file-name-from-ada-name)
  (setq ada-ada-name-from-file-name 'ada-gnat-ada-name-from-file-name)
  (setq ada-make-package-body       'ada-gnat-make-package-body)

  (add-hook 'ada-syntax-propertize-hook 'gnatprep-syntax-propertize)

  ;; must be after indentation engine setup, because that resets the
  ;; indent function list.
  (add-hook 'ada-mode-hook 'ada-gnat-xref-setup t)

  (setq ada-xref-other-function  'ada-gnat-xref-other)
  (setq ada-xref-parent-function 'ada-gnat-xref-parents)
  (setq ada-xref-all-function    'ada-gnat-xref-all)
  (setq ada-show-xref-tool-buffer 'ada-gnat-show-run-buffer)

  ;; gnatmake -gnatD generates files with .dg extensions. But we don't
  ;; need to navigate between them.
  ;;
  ;; There is no common convention for a file extension for gnatprep files.

  (add-to-list 'completion-ignored-extensions ".ali") ;; gnat library files, used for cross reference
  (add-to-list 'compilation-error-regexp-alist 'gnat)
  )

(defun ada-gnat-xref-deselect-prj ()
  (setq ada-file-name-from-ada-name nil)
  (setq ada-ada-name-from-file-name nil)
  (setq ada-make-package-body       nil)

  (setq ada-syntax-propertize-hook (delq 'gnatprep-syntax-propertize ada-syntax-propertize-hook))
  (setq ada-mode-hook (delq 'ada-gnat-xref-setup ada-mode-hook))

  (setq ada-xref-other-function  nil)
  (setq ada-xref-parent-function nil)
  (setq ada-xref-all-function    nil)
  (setq ada-show-xref-tool-buffer nil)

  (setq completion-ignored-extensions (delete ".ali" completion-ignored-extensions))
  (setq compilation-error-regexp-alist (delete 'gnat compilation-error-regexp-alist))
  )

(defun ada-gnat-xref-setup ()
  (when (boundp 'wisi-indent-calculate-functions)
    (add-to-list 'wisi-indent-calculate-functions 'gnatprep-indent))
  )

(defun ada-gnat-xref ()
  "Set Ada mode global vars to use 'gnat xref'"
  (add-to-list 'ada-prj-file-ext-extra     "gpr")
  (add-to-list 'ada-prj-parser-alist       '("gpr" . gnat-parse-gpr))
  (add-to-list 'ada-select-prj-xref-tool   '(gnat  . ada-gnat-xref-select-prj))
  (add-to-list 'ada-deselect-prj-xref-tool '(gnat  . ada-gnat-xref-deselect-prj))

  ;; no parse-*-xref yet

  (font-lock-add-keywords 'ada-mode
   ;; gnatprep preprocessor line
   (list (list "^[ \t]*\\(#.*\n\\)"  '(1 font-lock-type-face t))))

  (add-hook 'ada-gnat-fix-error-hook 'ada-gnat-fix-error))

(ada-gnat-xref)

(provide 'ada-gnat-xref)
(provide 'ada-xref-tool)

(unless (default-value 'ada-xref-tool)
  (set-default 'ada-xref-tool 'gnat))

;; end of file
