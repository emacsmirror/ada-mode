;; ada-build.el --- Extensions to ada-mode for compiling and running  -*- lexical-binding:t -*-
;; Ada projects without 'make' or similar tool
;;
;; Copyright (C) 1994, 1995, 1997 - 2017, 2019  Free Software Foundation, Inc.
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

;;; Design:
;;
;; Separate from ada-mode.el because sophisticated users don't need
;; this (they use 'make' or similar tool), so it would just get in the
;; way, particularly for fixing bugs in the core capabilities of
;; ada-mode.

;;; History:
;;
;; see ada-mode.el; the current code is a complete rewrite of the
;; compiling and running capabilities in Ada mode 4.01, done in 2013 by
;; Stephen Leake <stephen_leake@stephe-leake.org>.

(require 'ada-core)
(require 'gnat-core)
(require 'cl-lib)

;;;; User customization

(defgroup ada-build nil
  "Major mode for compiling and running Ada projects in Emacs."
  :group 'ada)

(defcustom ada-build-prompt-prj 'default
  "Policy for finding a project file when none is currently selected.
See `ada-build-require-project-file'."
  :type '(choice (const default)
		 (const search-prompt)
		 (const prompt)
		 (const error))
  :safe  #'symbolp)

(defcustom ada-build-confirm-command nil
  "If non-nil, prompt for confirmation/edit of each command before it is run."
  :type  'boolean
  :safe  #'booleanp)

(defcustom ada-build-check-cmd
  "${cross_prefix}gprbuild -P${gpr_file} -u -c -gnatc ${gprbuild_opt} ${full_current}"
  "Default command to syntax check a single file.
Overridden by project variable `check_cmd'."
  :type 'string)

(defcustom ada-build-make-cmd
  "${cross_prefix}gprbuild -P${gpr_file} ${main} ${gprbuild_opt} "
  "Default command and link to compile the application.
Overridden by project variable `make_cmd'."
  :type 'string)

(defcustom ada-build-run-cmd "${main}"
  "Default command to run the application, in a spawned shell.
Overridden by project variable `run_cmd'."
  :type 'string)

;;;; code

(defun ada-build-replace-vars (project cmd-string)
  "Recursively expand variable references in CMD-STRING.
${var} is a project variable or environment variable, $var an
environment variable.

A prefix may be specified with the format `-<prefix>${var}'; then
the value is expanded with the prefix prepended. If the value is
a list, the prefix is prepended to each list element. For
example, if src_dir contains `dir_1 dir_2', `-I${src_dir}'
expands to `-Idir_1 -Idir_2'.

As a special case, ${full_current} is replaced by the current
buffer file name including the directory and extension."

  (while (string-match "\\(-[^-$ ]+\\)?\\${\\([^}]+\\)}" cmd-string)
    (let ((prefix (match-string 1 cmd-string))
	  (name (match-string 2 cmd-string))
	  value)

      (cond
       ((string= name "full_current")
	(setq value (buffer-file-name)))

       ;; Handle names that are likely to occur in commands.
       ((string= name "src_dir")
	(setq value (ada-prj-source-path project)))

       ((or (string= name "gpr_project_path")
	   (string= name "ada_project_path"))
	(setq value (gnat-compiler-project-path (ada-prj-compiler project))))

       ((string= name "gpr_file")
	(when (gnat-compiler-gpr-file (ada-prj-compiler project))
	  (setq value (file-name-nondirectory (gnat-compiler-gpr-file (ada-prj-compiler project))))))

       )

      (when (null value)
	(setq value (plist-get (ada-prj-plist project) (intern name))))

      (when (null value)
	(setq value (getenv name)))

      (cond
       ((null value)
	(setq cmd-string (replace-match "" t t cmd-string)))

       ((stringp value)
	(setq cmd-string (replace-match (concat prefix value) t t cmd-string)))

       ((listp value)
	(setq cmd-string (replace-match
			  (mapconcat (lambda (x) (concat prefix x)) value " ")
			    t t cmd-string)))
       )))

  (substitute-in-file-name cmd-string))

(defun ada-build-default-prj (project)
  "Add to PROJECT the default project variables used by ada-build."
  (setf (ada-prj-plist project)
	(append
	 (ada-prj-plist project)
	 (list
	  'check_cmd       ada-build-check-cmd
	  'main            (when (buffer-file-name)
			     (file-name-nondirectory
			      (file-name-sans-extension (buffer-file-name))))
	  'make_cmd        ada-build-make-cmd
	  'run_cmd         ada-build-run-cmd
	  ))))

(defun ada-build-find-select-prj-file (prj)
  "Search for a project file in the current directory, parse and select it.
The file must have the same basename as the project variable
`main' in PRJ or the current buffer if `main' is nil, and extension from
`wisi-prj-file-extensions'.  Returns the project if a file is
selected, nil otherwise."
  (let* ((base-file-name (file-name-base
			  (or (and (ada-prj-p prj)
				   (plist-get (ada-prj-plist prj) 'main))
			      (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))))
	 (filename
	  (file-name-completion base-file-name
				""
				(lambda (name) (member (file-name-extension name) wisi-prj-file-extensions))))
	 )
    (when filename
      (let ((default-prj (ada-prj-default (file-name-nondirectory (file-name-sans-extension filename)))))
	(wisi-prj-dtrt-parse-file filename default-prj filename default-directory)
	default-prj))
    ))

;;;###autoload
(defun ada-build-prompt-select-prj-file ()
  "Prompt for a project file, parse and select it.
The file must have an extension from `wisi-prj-file-extensions'.
Returns the project if a file is selected, nil otherwise."
  (interactive)
  (let (filename)
    (condition-case-unless-debug nil
	(setq filename
	      (read-file-name
	       "Project file: " ; prompt
	       nil ; dir
	       "" ; default-filename
	       t   ; mustmatch
	       nil; initial
	       (lambda (name)
		 ;; this allows directories, which enables navigating
		 ;; to the desired file. We just assume the user won't
		 ;; return a directory.
		 (or (file-accessible-directory-p name)
		     (member (file-name-extension name) wisi-prj-file-extensions)))))
      (error
       (setq filename nil))
      )

    (when (and filename
	       (not (equal "" filename)))

      (unless (wisi-prj-find-function-set-p)
	;; See comment in ada-build-require-project-file. We also do
	;; this here because it may be the first project-related
	;; function the user runs.
	(add-hook 'project-find-functions #'wisi-prj-find-dominating-cached)
	(add-hook 'xref-backend-functions #'wisi-prj-xref-backend))

      (let ((default-prj (ada-prj-default (file-name-nondirectory (file-name-sans-extension filename)))))
	(wisi-prj-dtrt-parse-file filename default-prj filename (file-name-directory filename)))
      )))

(defun ada-build-create-select-default-prj ()
  "Create a default project with source-path set current directory, select it."
  (let* ((prj-file (expand-file-name "default_.adp" default-directory)) ;; we assume this does not exist
 	 (ada-xref-tool 'gnat) ;; since we are not specifying a gpr file.
	 (project (ada-prj-default default-directory)))

    ;; We use buffer-file-name as the dominating file (nominally the
    ;; main program), since we assume it exists but the dummy project
    ;; file does not.
    (wisi-prj-dtrt-parse-file prj-file project (file-name-nondirectory (buffer-file-name)) default-directory)))

(defun ada-build-require-project-file ()
  "Ensure that a project file is selected, return the project.
Action when no project file is currently selected is determined
by `ada-build-prompt-prj':

default - Search for a project file in the current directory with
the same name as the main file. If not found, use a default
project; no gpr file, current directory only, current file as
main.

search-prompt - Search for a project file in the current
directory with the same name as the main file. If not found,
prompt for a project file; thow error if user aborts

prompt - Prompt for a project file; thow error if user aborts.

error - Throw an error (no prompt, no default project).

'search' means look for a file with an extension in
`wisi-prj-file-extensions'.

An error result does not change the current project."
  (let ((prj (project-current)))

    (unless (wisi-prj-find-function-set-p)
      ;; We set project-find-functions, xref-backend-functions here so
      ;; the user doesn't have to for simple projects. We use
      ;; 'dominating' to avoid the user actions required by select
      ;; when switching directories/projects (especially in the
      ;; ada-mode tutorial), and 'cached' to preserve the value of
      ;; "main" in the project. An experienced user can change to
      ;; select/cached as they need to.
      (add-hook 'project-find-functions #'wisi-prj-find-dominating-cached)
      (add-hook 'xref-backend-functions #'wisi-prj-xref-backend))

    (unless (ada-prj-p prj)
      (cl-ecase ada-build-prompt-prj
	(default
	  (or (setq prj (ada-build-find-select-prj-file prj))
	      (setq prj (ada-build-create-select-default-prj))
	      ))

	(search-prompt
	  (or (setq prj (ada-build-find-select-prj-file prj))
	      (setq prj (ada-build-prompt-select-prj-file))))

	(prompt
	 (setq prj (ada-build-prompt-select-prj-file)))

	(error
	 (user-error "no project file selected"))
	))
    prj))

;;;; user functions

(defun ada-build-run-cmd (prj-field confirm prompt)
  "Run the command in the PRJ-FIELD project variable.
If CONFIRM or `ada-build-confirm-command' are non-nil, ask for
user confirmation of the command, using PROMPT."
  (let* ((project (ada-build-require-project-file))
	 (cmd (plist-get (ada-prj-plist project) prj-field))
	 (compilation-environment
	  (append
	   (wisi-prj-compile-env project)
	   (wisi-prj-file-env project))))

    (unless cmd
      (setq cmd '("")
	    confirm t))

    (when (or ada-build-confirm-command confirm)
      (setq cmd (read-from-minibuffer (concat prompt ": ") cmd)))

    (compile (ada-build-replace-vars project cmd))))

;;;###autoload
(defun ada-build-check (&optional confirm)
  "Run the check_cmd project variable.
By default, this checks the current file for syntax errors.
If CONFIRM is non-nil, prompt for user confirmation of the command."
  (interactive "P")
  (ada-build-run-cmd 'check_cmd confirm "check command"))

;;;###autoload
(defun ada-build-make (&optional confirm)
  "Run the make_cmd project variable.
By default, this compiles and links the main program.
If CONFIRM is non-nil, prompt for user confirmation of the command."
  (interactive "P")
  (ada-build-run-cmd 'make_cmd confirm "make command"))

;;;###autoload
(defun ada-build-set-make (&optional confirm)
  "Set the main project variable to the current file, then run the make_cmd project variable.
By default, this compiles and links the new main program.
If CONFIRM is non-nil, prompt for user confirmation of the command."
  (interactive "P")
  (let ((prj (ada-build-require-project-file)))
    (setf (ada-prj-plist prj)
	  (plist-put (ada-prj-plist prj)
		     'main (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))))
  (ada-build-run-cmd 'make_cmd confirm "make command"))

;;;###autoload
(defun ada-build-run (&optional confirm)
  "Run the run_cmd project variable.
By default, this runs the main program.
If CONFIRM is non-nil, prompt for user confirmation of the command."
  (interactive "P")
  (ada-build-run-cmd 'run_cmd confirm "run command"))

(defun ada-build-show-main ()
  "Show current project main program filename."
  (interactive)
  (message "Ada mode main: %s" (plist-get (ada-prj-plist (ada-prj-require-prj)) 'main)))

;;; setup
(add-to-list 'ada-prj-default-list 'ada-build-default-prj)

(provide 'ada-build)
;; end of file
