;; gnat-core.el --- Support for running GNAT tools, which support multiple programming  -*- lexical-binding:t -*-
;; languages.
;;
;; GNAT is provided by AdaCore; see http://libre.adacore.com/
;;
;;; Copyright (C) 2012 - 2019  Free Software Foundation, Inc.
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

(require 'cl-lib)
(require 'wisi-prj)

;;;;; code

(defcustom ada-gnat-debug-run nil
  ;; Name implies Ada, which is wrong. Kept for backward compatibility.
  "If t, compilation buffers containing a GNAT command will show
the command.  Otherwise, they will show only the output of the
command.  This applies e.g. to *gnatfind* buffers."
  :type 'boolean
  :safe  #'booleanp
  :group 'ada)

;;;; project file handling

(cl-defstruct gnat-compiler
  "Used with wisi-compiler-* generic functions."

  gpr-file 	  ;; absolute file name of GNAT project file.
  run-buffer-name ;; string; some compiler objects have no gpr file
  project-path    ;; list of directories from GPR_PROJECT_PATH
  target 	  ;; gnat --target argument.
  runtime 	  ;; gnat --RTS argument.
  gnat-stub-opts  ;; options for gnat stub
  gnat-stub-cargs ;; cargs options for gnat stub
  )

;;;###autoload
(cl-defun create-gnat-compiler
    (&key
     gpr-file
     run-buffer-name
     project-path
     target
     runtime
     gnat-stub-opts
     gnat-stub-cargs)
  ;; See note on `create-ada-prj' for why this is not a defalias.
  (make-gnat-compiler
   :gpr-file gpr-file
   :run-buffer-name run-buffer-name
   :project-path project-path
   :target target
   :runtime runtime
   :gnat-stub-opts gnat-stub-opts
   :gnat-stub-cargs gnat-stub-cargs
   ))

(defun gnat-compiler-require-prj ()
  "Return current `gnat-compiler' object from current project compiler.
Throw an error if current project does not have a gnat-compiler."
  (let* ((wisi-prj (wisi-prj-require-prj))
	 (compiler (wisi-prj-compiler wisi-prj)))
    (if (gnat-compiler-p compiler)
	compiler
      (error "no gnat-compiler in current project"))))

(defun gnat-prj-add-prj-dir (project dir)
  "Add DIR to compiler.project_path, and to GPR_PROJECT_PATH in project.environment."
  ;; We maintain two project values for this;
  ;; project-path - a list of directories, for elisp find file
  ;; GPR_PROJECT_PATH in environment, for gnat-run
  (let ((process-environment (copy-sequence (wisi-prj-file-env project)))
	(compiler (wisi-prj-compiler project)))
    (cl-pushnew dir (gnat-compiler-project-path compiler) :test #'string-equal)

    (setenv "GPR_PROJECT_PATH"
	    (mapconcat 'identity
		       (gnat-compiler-project-path compiler) path-separator))
    (setf (wisi-prj-file-env project) (copy-sequence process-environment))
    ))

(defun gnat-get-paths (project)
  "Add project and/or compiler source, project paths to PROJECT source-path and project-path."
  (let* ((compiler (wisi-prj-compiler project))
	 (src-dirs (wisi-prj-source-path project))
	 (prj-dirs (cl-copy-list (gnat-compiler-project-path compiler))))

    ;; Don't need project plist obj_dirs if using a project file, so
    ;; not setting obj-dirs.
    ;;
    ;; We only need to update prj-dirs if the gpr-file is an aggregate
    ;; project that sets the project path.

    (condition-case-unless-debug nil
	(with-current-buffer (gnat-run-buffer project (gnat-compiler-run-buffer-name (wisi-prj-compiler project)))
	  ;; gnat list -v -P can return status 0 or 4; always lists compiler dirs
	  (gnat-run-gnat project "list" (list "-v") '(0 4))

	  (goto-char (point-min))

	  ;; Source path
	  (search-forward "Source Search Path:")
	  (forward-line 1)
	  (while (not (looking-at "^$")) ; terminate on blank line
	    (back-to-indentation) ; skip whitespace forward
            (cl-pushnew
	     (if (looking-at "<Current_Directory>")
		 (directory-file-name default-directory)
	       (expand-file-name ; Canonicalize path part.
		(directory-file-name
		 (buffer-substring-no-properties (point) (point-at-eol)))))
	     src-dirs
	     :test #'string-equal)
	    (forward-line 1))

          ;; Project path
	  ;;
	  ;; These are also added to src_dir, so compilation errors
	  ;; reported in project files are found.
	  (search-forward "Project Search Path:")
	  (forward-line 1)
	  (while (not (looking-at "^$"))
	    (back-to-indentation)
	    (if (looking-at "<Current_Directory>")
                (cl-pushnew (directory-file-name default-directory) prj-dirs :test #'string-equal)
	      (let ((f (expand-file-name
                        (buffer-substring-no-properties (point) (point-at-eol)))))
                (cl-pushnew f prj-dirs :test #'string-equal)
                (cl-pushnew f src-dirs :test #'string-equal)))
	    (forward-line 1))

	  )
      (error
       ;; search-forward failed. Possible causes:
       ;;
       ;; missing dirs in GPR_PROJECT_PATH => user error
       ;; missing Object_Dir => gprbuild not run yet; it will be run soon
       ;; some files are missing string quotes => user error
       ;;
       ;; We used to call gpr_query to get src-dirs, prj-dirs here; it
       ;; is tolerant of the above errors. But ignoring the errors, to
       ;; let gprbuild run with GPR_PROJECT_PATH set, is simpler.
       (pop-to-buffer (gnat-run-buffer project (gnat-compiler-run-buffer-name (wisi-prj-compiler project))))
       (message "project search path: %s" prj-dirs)
       (message "parse gpr failed")
       ))

    ;; reverse prj-dirs so project file dirs precede gnat library dirs
    (setf (wisi-prj-source-path project) (nreverse (delete-dups src-dirs)))
    (setf (gnat-compiler-project-path compiler) nil)
    (mapc (lambda (dir) (gnat-prj-add-prj-dir project dir))
	  prj-dirs)
    ))

(defun gnat-parse-gpr (gpr-file project)
  "Append to source-path and project-path in PROJECT (a `wisi-prj' object) by parsing GPR-FILE.
GPR-FILE must be absolute file name.
source-path will include compiler runtime."
  ;; this can take a long time; let the user know what's up
  (let ((compiler (wisi-prj-compiler project)))
    (if (gnat-compiler-gpr-file compiler)
	;; gpr-file previously set; new one must match
	(when (not (string-equal gpr-file (gnat-compiler-gpr-file compiler)))
	  (error "project file %s defines a different GNAT project file than %s"
		 (gnat-compiler-gpr-file compiler)
		 gpr-file))

      (setf (gnat-compiler-gpr-file compiler) gpr-file)
      ))

  (gnat-get-paths project))

(defun gnat-parse-gpr-1 (gpr-file project)
  "For `wisi-prj-parser-alist'."
  (setf (gnat-compiler-run-buffer-name (wisi-prj-compiler project)) gpr-file)
  (gnat-parse-gpr gpr-file project))

;;;; command line tool interface

(defun gnat-run-buffer-name (prj-file-name &optional prefix)
  ;; We don't use (gnat-compiler-gpr-file compiler), because multiple
  ;; wisi-prj files can use one gpr-file.
  (concat (or prefix " *gnat-run-")
	  prj-file-name
	  "*"))

(defun gnat-run-buffer (project name)
  "Return a buffer suitable for running gnat command line tools for PROJECT"
  (let* ((buffer (get-buffer name)))

    (unless (buffer-live-p buffer)
      (setq buffer (get-buffer-create name))
      (when (gnat-compiler-gpr-file (wisi-prj-compiler project))
	;; Otherwise assume `default-directory' is already correct (or
	;; doesn't matter).
	(with-current-buffer buffer
	  (setq default-directory
		(file-name-directory
		 (gnat-compiler-gpr-file (wisi-prj-compiler project)))))
	))
    buffer))

(defun gnat-run (project exec command &optional err-msg expected-status)
  "Run a gnat command line tool, as \"EXEC COMMAND\".
PROJECT  is a `wisi-prj' object.
EXEC must be an executable found on `exec-path'.
COMMAND must be a list of strings.
ERR-MSG must be nil or a string.
EXPECTED-STATUS must be nil or a list of integers; throws an error if
process status is not a member.

Return process status.
Assumes current buffer is (gnat-run-buffer)"
  (set 'buffer-read-only nil)
  (erase-buffer)

  (setq command (cl-delete-if 'null command))

  (let ((process-environment
	 (append
	   (wisi-prj-compile-env project)
	   (wisi-prj-file-env project)
	   (copy-sequence process-environment)))
	status)

    (when ada-gnat-debug-run
      (insert (format "GPR_PROJECT_PATH=%s\n%s " (getenv "GPR_PROJECT_PATH") exec))
      (mapc (lambda (str) (insert (concat str " "))) command)
      (newline))

    (setq status (apply 'call-process exec nil t nil command))
    (cond
     ((memq status (or expected-status '(0))); success
      nil)

     (t ; failure
      (pop-to-buffer (current-buffer))
      (if err-msg
	  (error "%s %s failed; %s" exec (car command) err-msg)
	(error "%s %s failed" exec (car command))
	))
     )))

(defun gnat-run-gnat (project command &optional switches-args expected-status)
  "Run the \"gnat\" command line tool, as \"gnat COMMAND -P<prj> SWITCHES-ARGS\".
COMMAND must be a string, SWITCHES-ARGS a list of strings.
EXPECTED-STATUS must be nil or a list of integers.
Return process status.
Assumes current buffer is (gnat-run-buffer)"
  (let* ((compiler (wisi-prj-compiler project))
	 (gpr-file (gnat-compiler-gpr-file compiler))
	 (project-file-switch
	  (when gpr-file
	    (concat "-P" (file-name-nondirectory gpr-file))))
         (target-gnat (concat (gnat-compiler-target compiler) "gnat"))
         ;; gnat list understands --RTS without a fully qualified
         ;; path, gnat find (in particular) doesn't (but it doesn't
         ;; need to, it uses the ALI files found via the GPR)
         (runtime
          (when (and (gnat-compiler-runtime compiler) (string= command "list"))
            (list (concat "--RTS=" (gnat-compiler-runtime compiler)))))
	 (cmd (append (list command) (list project-file-switch) runtime switches-args)))

    (gnat-run project target-gnat cmd nil expected-status)
    ))

(defun gnat-run-no-prj (command &optional dir)
  "Run the gnat command line tool, as \"gnat COMMAND\", with DIR as current directory.
Return process status.  Process output goes to current buffer,
which is displayed on error."
  (set 'buffer-read-only nil)
  (erase-buffer)

  (when ada-gnat-debug-run
    (setq command (cl-delete-if 'null command))
    (mapc (lambda (str) (insert (concat str " "))) command)
    (newline))

  (let ((default-directory (or dir default-directory))
	status)

    (setq status (apply 'call-process "gnat" nil t nil command))
    (cond
     ((= status 0); success
      nil)

     (t ; failure
      (pop-to-buffer (current-buffer))
      (error "gnat %s failed" (car command)))
     )))

(cl-defmethod wisi-compiler-parse-one ((compiler gnat-compiler) project name value)
  (cond
   ((or
     (string= name "ada_project_path") ;; backward compatibility
     (string= name "gpr_project_path"))
    (let ((process-environment
	   (append
	    (wisi-prj-compile-env project)
	    (wisi-prj-file-env project))));; reference, for substitute-in-file-name
      (gnat-prj-add-prj-dir project (expand-file-name (substitute-in-file-name value)))))

   ((string= name "gnat-stub-cargs")
    (setf (gnat-compiler-gnat-stub-cargs compiler) value))

   ((string= name "gnat-stub-opts")
    (setf (gnat-compiler-gnat-stub-opts compiler) value))

   ((string= name "gpr_file")
    ;; The gpr file is parsed in `wisi-compiler-parse-final', so it
    ;; sees all file environment vars. We store the absolute gpr
    ;; file name, so we can get the correct default-directory from
    ;; it. Note that gprbuild requires the base name be found on
    ;; GPR_PROJECT_PATH.
    (let ((process-environment
	   (append
	    (wisi-prj-compile-env project)
	    (wisi-prj-file-env project))));; reference, for substitute-in-file-name
      (setf (gnat-compiler-gpr-file compiler)
	    (or
	     (locate-file (substitute-in-file-name value)
			  (gnat-compiler-project-path compiler))
	     (expand-file-name (substitute-in-file-name value)))))
    t)

   ((string= name "runtime")
    (setf (gnat-compiler-runtime compiler) value))

   ((string= name "target")
    (setf (gnat-compiler-target compiler) value))

   ))

(cl-defmethod wisi-compiler-parse-final ((compiler gnat-compiler) project prj-file-name)
  (setf (gnat-compiler-run-buffer-name compiler) (gnat-run-buffer-name prj-file-name))

  (if (gnat-compiler-gpr-file compiler)
      (gnat-parse-gpr (gnat-compiler-gpr-file compiler) project)

    ;; add the compiler libraries to project.source-path
    (gnat-get-paths project)
    ))

(cl-defmethod wisi-compiler-select-prj ((_compiler gnat-compiler) _project)
  (add-to-list 'completion-ignored-extensions ".ali") ;; gnat library files
  (setq compilation-error-regexp-alist '(gnat))
  )

(cl-defmethod wisi-compiler-deselect-prj ((_compiler gnat-compiler) _project)
  (setq completion-ignored-extensions (delete ".ali" completion-ignored-extensions))
  (setq compilation-error-regexp-alist (mapcar #'car compilation-error-regexp-alist-alist))
  )

(cl-defmethod wisi-compiler-show-prj-path ((compiler gnat-compiler))
    (if (gnat-compiler-project-path compiler)
      (progn
	(pop-to-buffer (get-buffer-create "*project file search path*"))
	(erase-buffer)
	(dolist (file (gnat-compiler-project-path compiler))
	  (insert (format "%s\n" file))))
    (message "no project file search path set")
    ))

;;;; gnatprep utils

(defun gnatprep-indent ()
  "If point is on a gnatprep keyword, return indentation column
for it. Otherwise return nil.  Intended to be added to
`wisi-indent-calculate-functions' or other indentation function
list."
  ;; gnatprep keywords are:
  ;;
  ;; #if identifier [then]
  ;; #elsif identifier [then]
  ;; #else
  ;; #end if;
  ;;
  ;; they are all indented at column 0.
  (when (equal (char-after) ?\#) 0))

(defun gnatprep-syntax-propertize (start end)
  (goto-char start)
  (save-match-data
    (while (re-search-forward
	    "^[ \t]*\\(#\\(?:if\\|else\\|elsif\\|end\\)\\)"; gnatprep keywords.
	    end t)
      (cond
       ((match-beginning 1)
	(put-text-property
	 (match-beginning 1) (match-end 1) 'syntax-table '(11 . ?\n)))
       )
      )))

(defconst gnatprep-preprocessor-keywords
   (list (list "^[ \t]*\\(#.*\n\\)"  '(1 font-lock-preprocessor-face t))))

;; We assume that if this file is loaded, any ada-mode buffer may have
;; gnatprep syntax; even with different host/target compilers, both
;; must run gnatprep first. If support for another preprocessor is
;; added, we'll need wisi-prj-preprocessor, along with -compiler and
;; -xref.
(defun gnatprep-setup ()
  (add-to-list 'wisi-indent-calculate-functions 'gnatprep-indent)
  (add-hook 'ada-syntax-propertize-hook #'gnatprep-syntax-propertize)
  (font-lock-add-keywords 'ada-mode gnatprep-preprocessor-keywords)
  ;; ada-mode calls font-lock-refresh-defaults after ada-mode-hook
  )

(add-hook 'ada-mode-hook #'gnatprep-setup)

;;;; Initialization

;; These are shared between ada-compiler-gnat and gpr-query.
(add-to-list 'wisi-prj-file-extensions  "gpr")
(add-to-list 'wisi-prj-parser-alist  '("gpr" . gnat-parse-gpr-1))

(add-to-list
 'compilation-error-regexp-alist-alist
 '(gnat
   ;; typical:
   ;;   cards_package.adb:45:32: expected private type "System.Address"
   ;;
   ;; with full path Source_Reference pragma :
   ;;   d:/maphds/version_x/1773/sbs-abi-dll_lib.ads.gp:39:06: file "interfaces_c.ads" not found
   ;;
   ;; gnu cc1: (gnatmake can invoke the C compiler)
   ;;   foo.c:2: `TRUE' undeclared here (not in a function)
   ;;   foo.c:2 : `TRUE' undeclared here (not in a function)
   ;;
   ;; we can't handle secondary errors here, because a regexp can't distinquish "message" from "filename"
   "^\\(\\(.:\\)?[^ :\n]+\\):\\([0-9]+\\)\\s-?:?\\([0-9]+\\)?" 1 3 4))

(provide 'gnat-core)
;; end of file
