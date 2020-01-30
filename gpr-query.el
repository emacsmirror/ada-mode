;; gpr-query.el --- Minor mode for navigating sources using gpr_query  -*- lexical-binding:t -*-
;;
;; gpr-query supports Ada and any gcc language that supports the
;; AdaCore -fdump-xref switch (which includes C, C++).
;;
;; Copyright (C) 2013 - 2020  Free Software Foundation, Inc.

;; Author: Stephen Leake <stephen_leake@member.fsf.org>
;; Maintainer: Stephen Leake <stephen_leake@member.fsf.org>
;; Version: 1.0

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

;;; Usage:
;;
;; M-x gpr-query

(require 'cl-lib)
(require 'compile)
(require 'gnat-core)
(require 'xref)
(require 'wisi-prj)

(defgroup gpr-query nil
  "gpr_query cross reference tool"
  :group 'tools)

(defcustom gpr-query-exec "gpr_query"
  "Executable for gpr_query."
  :type 'string)

(defcustom gpr-query-env nil
  "Environment variables needed by the gpr_query executable.
Value must be alist where each element is \"<name>=<value>\""
  ;; This could also be provided as a project file setting, But it is
  ;; intended for LD_LIBRARY_PATH (info "(ada-mode)Ada executables"),
  ;; which must be set for all projects on the system.
  :type 'string)

(defconst gpr-query-protocol-version "2"
  "Defines data exchanged between this package and the background process.
Must match gpr_query.adb Version.")

;;;;; sessions

;; gpr_query reads the project files and the database at startup,
;; which is noticeably slow for a reasonably sized project. But
;; running queries after startup is fast. So we leave gpr_query
;; running, and send it new queries via stdin, getting responses via
;; stdout.
;;
;; We maintain a cache of active sessions, one per gnat project.

(cl-defstruct (gpr-query--session)
  (process nil) ;; running gpr_query
  (buffer nil)) ;; receives output of gpr_query; default-directory gives location of db

;; Starting the buffer name with a space hides it from some lists, and
;; also disables font-lock. We sometimes use it to display xref
;; locations in compilation-mode, so we want font-lock enabled.
;;
;; IMPROVEME: copy the xref info to a true user buffer, optionally an
;; *xref* buffer.
(defconst gpr-query-buffer-name-prefix "*gpr_query-")

(defvar gpr-query--debug-start nil)

(defun gpr-query--start-process (project session)
  "Start the session process running gpr_query."
  (unless (buffer-live-p (gpr-query--session-buffer session))
    ;; user may have killed buffer
    (setf (gpr-query--session-buffer session)
	  (gnat-run-buffer project (gnat-compiler-run-buffer-name (wisi-prj-xref project))))
    (with-current-buffer (gpr-query--session-buffer session)
      (compilation-mode)
      (setq buffer-read-only nil)))

  (with-current-buffer (gpr-query--session-buffer session)
    (let ((process-environment
	   (append
	    (wisi-prj-compile-env project)
	    (wisi-prj-file-env project)
	    gpr-query-env
	    (copy-sequence process-environment)))
	  (gpr-file (file-name-nondirectory (gnat-compiler-gpr-file (wisi-prj-xref project)))))

      (erase-buffer); delete any previous messages, prompt
      (setf (gpr-query--session-process session)
	    (apply #'start-process
		   (concat "gpr_query " (buffer-name))
		   (gpr-query--session-buffer session)
		   gpr-query-exec
		   (cl-delete-if
		    'null
		    (list
		     (concat "--project=" gpr-file)
		     (when gpr-query--debug-start
		       (concat "--tracefile=gpr_query.trace")
		       ;; The file gpr_query.trace should contain: gpr_query=yes
		       )))))
      (set-process-query-on-exit-flag (gpr-query--session-process session) nil)
      (gpr-query-session-wait session)

      (if (process-live-p (gpr-query--session-process session))
	  (progn
	    (goto-char (point-min))
	    (if (search-forward-regexp "version: \\([0-9]+\\)$")
		(unless (string-equal (match-string 1) gpr-query-protocol-version)
		  (user-error "gpr-query version mismatch: elisp %s process %s"
			      gpr-query-protocol-version
			      (match-string 1)))
	      (user-error "gpr-query is an old version; expecting %s" gpr-query-protocol-version))

	    ;; Check for warnings about invalid directories etc. But some
	    ;; warnings are tolerable, so only abort if process actually
	    ;; died.
	    (goto-char (point-min))
	    (when (search-forward "warning:" nil t)
	      (if debug-on-error
		  (error "gpr_query warnings")
		(beep)
		(message "gpr_query warnings"))))

	(error "gpr-query process failed to start"))
      )))

(defun gpr-query--make-session (project)
  "Create and return a session for the current project file."
  (let ((session
	 (make-gpr-query--session
	  :buffer nil
	  :process nil)))
    (gpr-query--start-process project session)
    session))

(defvar gpr-query--sessions '()
  "Assoc list of sessions, indexed by absolute GNAT project file name.")

(defun gpr-query-cached-session (project)
  "Return a session for PROJECT, creating it if necessary."
  (let* ((gpr-file (gnat-compiler-gpr-file (wisi-prj-xref project)))
	 (session (cdr (assoc gpr-file gpr-query--sessions))))
    (if session
	(progn
	  (unless (process-live-p (gpr-query--session-process session))
	    (gpr-query--start-process project session))
	  session)
      ;; else
      (prog1
          (setq session (gpr-query--make-session project))
	(push (cons gpr-file session) gpr-query--sessions)))
    ))

(defconst gpr-query-prompt "^>>> $"
  ;; gpr_query output ends with this
  "Regexp matching gpr_query prompt; indicates previous command is complete.")

(defun gpr-query-session-wait (session)
  "Wait for the current command to complete."
  (unless (process-live-p (gpr-query--session-process session))
    (gpr-query-show-buffer session)
    (error "gpr-query process died"))

  (with-current-buffer (gpr-query--session-buffer session)
    (let ((process (gpr-query--session-process session))
	  (search-start (point-min))
	  (wait-count 0))
      (while (and (process-live-p process)
		  (progn
		    ;; process output is inserted before point, so move back over it to search it
		    (goto-char search-start)
		    (not (re-search-forward gpr-query-prompt (point-max) 1))))
	(setq search-start (point));; don't search same text again
	(message (concat "running gpr_query ..." (make-string wait-count ?.)))
	;; IMPROVEME: use --display-progress
	(accept-process-output process 1.0)
	(setq wait-count (1+ wait-count)))
      (if (process-live-p process)
	  (message (concat "running gpr_query ... done"))
	(gpr-query-show-buffer session)
	(error "gpr_query process died"))
      )))

(defun gpr-query-session-send (session cmd wait)
  "Send CMD to gpr_query session for GPR-FILE.
If WAIT is non-nil, wait for command to complete.
Return buffer that holds output."
  ;; always wait for previous command to complete; also checks for
  ;; dead process.
  (gpr-query-session-wait session)
  (with-current-buffer (gpr-query--session-buffer session)
    (erase-buffer)
    (process-send-string (gpr-query--session-process session)
			 (concat cmd "\n"))
    (when wait
      (gpr-query-session-wait session))
    (current-buffer)
    ))

(defun gpr-query-kill-session (session)
  (let ((process (gpr-query--session-process session)))
    (when (process-live-p process)
      (process-send-string (gpr-query--session-process session) "exit\n")
      (while (process-live-p process)
    	(accept-process-output process 1.0)))
    ))

(defun gpr-query-kill-all-sessions ()
  (interactive)
  (let ((count 0))
    (mapc (lambda (assoc)
	    (let ((session (cdr assoc)))
	      (when (process-live-p (gpr-query--session-process session))
		(setq count (1+ count))
		(process-send-string (gpr-query--session-process session) "exit\n")
		)))
	    gpr-query--sessions)
    (message "Killed %d sessions" count)
    ))

(defun gpr-query-show-buffer (session)
  (interactive)
  (pop-to-buffer (gpr-query--session-buffer session)))

;;;;; utils

(defun gpr-query-get-src-dirs (project src-dirs)
  "Append list of source dirs in gpr project PROJECT to SRC-DIRS.
Uses `gpr_query'. Returns new list."

  (let ((session (gpr-query-cached-session project)))
    (with-current-buffer (gpr-query-session-send session "source_dirs" t)
      (goto-char (point-min))
      (while (not (looking-at gpr-query-prompt))
	(cl-pushnew
	 (expand-file-name ; Canonicalize path part.
	  (directory-file-name
	   (buffer-substring-no-properties (point) (point-at-eol))))
	 src-dirs :test #'equal)
	(forward-line 1))
      ))
  src-dirs)

(defun gpr-query-get-prj-dirs (project prj-dirs)
  "Append list of project dirs in gpr project PROJECT to PRJ-DIRS.
Uses `gpr_query'. Returns new list."

  (let ((session (gpr-query-cached-session project)))
    (with-current-buffer (gpr-query-session-send session "project_path" t)
      (goto-char (point-min))
      (while (not (looking-at gpr-query-prompt))
	(cl-pushnew
	 (let ((dir (buffer-substring-no-properties (point) (point-at-eol))))
	   (if (string= dir ".")
	       (directory-file-name default-directory)
	     (expand-file-name dir))) ; Canonicalize path part.
	 prj-dirs
	 :test #'equal)
	(forward-line 1))
      ))
  prj-dirs)

(defconst gpr-query-ident-file-regexp
  ;; C:\Projects\GDS\work_dscovr_release\common\1553\gds-mil_std_1553-utf.ads:252:25
  ;; /Projects/GDS/work_dscovr_release/common/1553/gds-mil_std_1553-utf.ads:252:25
  ;; gds-mil_std_1553-utf.ads:252:25 - when wisi-xref-full-path is nil
  "\\(\\(?:.:\\\\\\|/\\)?[^:]*\\):\\([0-9]+\\):\\([0-9]+\\)"
  ;; 1                              2            3
  "Regexp matching <file>:<line>:<column> where <file> is an absolute file name or basename.")

(defconst gpr-query-ident-file-regexp-alist
  (list (concat "^" gpr-query-ident-file-regexp) 1 2 3)
  "For compilation-error-regexp-alist, matching gpr_query output")

(defconst gpr-query-ident-file-type-regexp
  (concat gpr-query-ident-file-regexp " (\\(.*\\))")
  "Regexp matching <file>:<line>:<column> (<type>)")

(defun gpr-query-compilation (project identifier file line col cmd comp-err &optional local_only append)
  "Run gpr_query CMD IDENTIFIER:FILE:LINE:COL,
with compilation-error-regexp-alist set to COMP-ERR."
  ;; Useful when gpr_query will return a list of references; the user
  ;; can navigate to each result in turn via `next-error'.

  ;; Emacs column is 0-indexed, gpr_query is 1-indexed.
  (let* ((cmd-1 (concat (format "%s %s:%s:%d:%d"
				cmd identifier file line (1+ col))
			(when (member cmd '("refs"))
			      (if local_only " local_only" " global"))
			(when (member cmd '("overriding" "overridden_by" "parent_types" "refs"))
			      (if wisi-xref-full-path " full_file_names" " short_file_names"))))
	 (session (gpr-query-cached-session project))
	 (result-count 0)
	 start-pos prev-content
	 target-file target-line target-col)

    (when append
      (with-current-buffer (gpr-query--session-buffer session)
	;; don't include trailing prompt in `prev-content'
	(goto-char (point-max))
	(forward-line 0)
	(setq prev-content (buffer-substring (point-min) (point)))))

    (with-current-buffer (gpr-query-session-send session cmd-1 t)
      ;; point is at EOB. gpr_query returns one line per result plus prompt, warnings
      (setq result-count (- (line-number-at-pos) 1))
      (setq start-pos (point-min))

      (setq buffer-read-only nil)
      (when append
	(goto-char (point-min))
	(insert prev-content)
	(setq start-pos (point))
	(goto-char (point-max)))

      (set (make-local-variable 'compilation-error-regexp-alist) (list comp-err))

      (compilation--flush-parse (point-min) (point-max))
      (compilation--ensure-parse (point-max))

      (goto-char start-pos)

      (cond
       ((looking-at "^warning: ")
	(setq result-count (1- result-count))
	(forward-line 1))
       ((looking-at "^Error: entity not found")
	(error (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
       )

      (cond
       ((and (not append)
	     (= result-count 1))
	;; just go there, don't display session-buffer. We have to
	;; fetch the compilation-message while in the
	;; session-buffer. and call wisi-goto-source outside the
	;; with-current-buffer above.
	(let* ((msg (compilation-next-error 0))
               ;; IMPROVEME: '--' indicates internal-only. But we can't
               ;; use compile-goto-error, because that displays the
               ;; session-buffer.
	       (loc (compilation--message->loc msg)))
	  (setq target-file (caar (compilation--loc->file-struct loc))
		target-line (caar (cddr (compilation--loc->file-struct loc)))
		target-col  (1- (compilation--loc->col loc))
		)
	  ))

       ((= result-count 0)
	(error "gpr_query returned no results"))

       (t
	;; for next-error, below
	(setq next-error-last-buffer (current-buffer)))

       ));; case, with-currrent-buffer

    (if (and (not append)
	     (= result-count 1))
	(wisi-goto-source target-file target-line target-col)

      ;; more than one result; display session buffer, goto first ref
      ;;
      ;; compilation-next-error-function assumes there is not an error
      ;; at point-min; work around that by moving forward 0 errors for
      ;; the first one. Unless the first line contains "warning: ".
      (pop-to-buffer next-error-last-buffer)
      (goto-char start-pos)
      (unless append
	(if (looking-at "^warning: ")
	    (next-error 1 t)
	  (next-error 0 t)))
      )
    ))

(defun gpr-query-dist (found-line line found-col col)
  "Return distance between FOUND-LINE FOUND-COL and LINE COL."
  (+ (abs (- found-col col))
     (* (abs (- found-line line)) 250)))

(defvar gpr-query-map
  (let ((map (make-sparse-keymap)))
    ;; C-c C-i prefix for gpr-query minor mode

    (define-key map "\C-c\C-i\C-d" 'gpr-query-goto-declaration)
    (define-key map "\C-c\C-i\C-q" 'gpr-query-refresh)
    (define-key map "\C-c\C-i\C-r" 'gpr-query-show-references)
    ;; IMPROVEME: (define-key map "\C-c\M-d" 'gpr-query-parents)
    ;; IMPROVEME: overriding
    map
  )  "Local keymap used for gpr query minor mode.")

(defvar gpr-query-menu (make-sparse-keymap "gpr-query"))
(easy-menu-define gpr-query-menu gpr-query-map "Menu keymap for gpr-query minor mode"
  '("gpr-query"
    ["Show gpr-query buffer"         gpr-query-show-buffer 	   t]
    ["Next xref"                     next-error 		   t]
    ["Goto declaration/body"         xref-find-definitions 	   t]
    ["Show parent declarations"      wisi-show-declaration-parents t]
    ["Show references"               wisi-show-references 	   t]
    ["Show overriding"               wisi-show-overriding 	   t]
    ["Show overridden"               wisi-show-overridden 	   t]
    ["Refresh cross reference cache" wisi-refresh-prj-cache 	   t]
    ))

(define-minor-mode gpr-query
  "Minor mode for navigating sources using GNAT cross reference tool.
Enable mode if ARG is positive."
  :initial-value t
  :lighter       " gpr-query"   ;; mode line

  ;; just enable the menu and keymap
  )

(defun gpr-query--normalize-filename (file)
  "Convert FILE from native format to Emacs standard.
FILE is from gpr-query."
  ;; FILE must be abs
  (cond
   ((eq system-type 'windows-nt)
    ;; 'expand-file-name' converts Windows directory
    ;; separators to normal Emacs.  Since Windows file
    ;; system is case insensitive, GNAT and Emacs can
    ;; disagree on the case, so convert all to lowercase.
    (downcase (expand-file-name file)))

   ((eq system-type 'darwin)
    ;; case-insensitive case-preserving; so just downcase
    (downcase file))

   (t ;; linux
    file))
  )

;;;;; wisi-xref methods

(cl-defstruct (gpr-query-xref (:include gnat-compiler))
  ;; no new slots
  )

;;;###autoload
(cl-defun create-gpr_query-xref
    (&key
     gpr-file
     run-buffer-name
     project-path
     target
     runtime
     gnat-stub-opts
     gnat-stub-cargs)
  ;; See note on `create-ada-prj' for why this is not a defalias.
  (make-gpr-query-xref
   :gpr-file gpr-file
   :run-buffer-name run-buffer-name
   :project-path project-path
   :target target
   :runtime runtime
   :gnat-stub-opts gnat-stub-opts
   :gnat-stub-cargs gnat-stub-cargs
   ))

(cl-defmethod wisi-xref-parse-one ((xref gpr-query-xref) project name value)
  (wisi-compiler-parse-one xref project name value))

(cl-defmethod wisi-xref-parse-final ((xref gpr-query-xref) _project prj-file-name)
  (setf (gnat-compiler-run-buffer-name xref) (gnat-run-buffer-name prj-file-name gpr-query-buffer-name-prefix))
  (unless (gnat-compiler-gpr-file xref)
    (if (string= "gpr" (file-name-extension prj-file-name))
	(setf (gnat-compiler-gpr-file xref) prj-file-name)
      (user-error "using gpr-query xref, but no gpr file provided"))))

(cl-defmethod wisi-xref-refresh-cache ((_xref gpr-query-xref) project no-full)
  ;; Kill the current session and delete the database, to get changed
  ;; env vars etc when it restarts.
  ;;
  ;; We need to delete the database files if the compiler version
  ;; changed, or the database was built with an incorrect environment
  ;; variable, or something else screwed up. However, rebuilding after
  ;; that is a lot slower, so we only do that with permission.
  (let* ((session (gpr-query-cached-session project))
	 (db-filename
	  (with-current-buffer (gpr-query-session-send session "db_name" t)
	    (goto-char (point-min))
	    (buffer-substring-no-properties (line-beginning-position) (line-end-position)))))

    (gpr-query-kill-session session)
    (unless no-full
      (delete-file db-filename))

    ;; We do this here because the user expects to see the "running
    ;; gpr_query ..." message now, not later when a gpr-query command
    ;; is run.
    (gpr-query--start-process project session)
    ))

(defun gpr-query-tree-refs (project item op)
  "Run gpr_query tree command OP on ITEM (an xref-item), return list of xref-items."
  (with-slots (summary location) item
    ;; 'location' may have line, column nil
    (let ((eieio-skip-typecheck t))
      (with-slots (file line column) location
	(when (eq ?\" (aref summary 0))
	  ;; gpr_query wants the quotes stripped
	  (when column (setq column (+ 1 column)))
	  (setq summary (substring summary 1 (1- (length summary)))))

	(let ((cmd (format "%s %s:%s:%s:%s full_file_names"
			   op
			   summary
			   (file-name-nondirectory file)
			   (or line "")
			   (if column (1+ column) "")))
	      (result nil)
	      (session (gpr-query-cached-session project)))

	  (with-current-buffer (gpr-query-session-send session cmd t)
	    ;; 'gpr_query tree_*' returns a list containing the declarations,
	    ;; bodies, and references (classwide), in no particular order.
	    ;;
	    ;; the format of each line is file:line:column (type)
	    ;;                            1    2    3       4
	    ;;
	    ;; 'type' includes the type name

	    (goto-char (point-min))

	    (while (not (eobp))
	      (cond
	       ((looking-at gpr-query-ident-file-type-regexp)
		;; process line
		(let* ((found-file (match-string 1))
		       (found-line (string-to-number (match-string 2)))
		       (found-col  (1- (string-to-number (match-string 3))))
		       (found-type (match-string 4))
		       )

		  (unless found-file
		    ;; Can be nil if actual file is renamed but gpr-query
		    ;; database not updated. We abort, rather than just
		    ;; ignoring this entry, because it means other ref are
		    ;; probably out of date as well.
		    (user-error "file '%s' not found; refresh?" (match-string 1)))

		  (setq found-file (gpr-query--normalize-filename found-file))

		  (push (xref-make
			 (cond
			  ((string= op "tree_refs")
			   (if found-type
			       (if (string-match ";" found-type)
				   ;; ref is to the identifier
				   (concat summary " " found-type)
				 ;; ref is to the controlling type of the identifier
				 found-type)
			     summary))

			  ((string= op "tree_defs")
			   found-type)
			  )
			 (xref-make-file-location found-file found-line found-col))
			result)
		  ))

	       (t ;; ignore line
		;;
		;; This skips GPR_PROJECT_PATH and echoed command at start of buffer.
		;;
		;; It also skips warning lines.
		)
	       )
	      (forward-line 1)
	      )

	    (when (null result)
	      (user-error "gpr_query did not return any references; refresh?"))

	    (nreverse result) ;; root of tree first.
	    ))))))

(cl-defmethod wisi-xref-definitions ((_xref gpr-query-xref) project item)
  (gpr-query-tree-refs project item "tree_defs"))

(cl-defmethod wisi-xref-references ((_xref gpr-query-xref) project item)
  (gpr-query-tree-refs project item "tree_refs"))

(cl-defmethod wisi-xref-other ((_xref gpr-query-xref) project &key identifier filename line column)
  (when (eq ?\" (aref identifier 0))
    ;; gpr_query wants the quotes stripped
    (setq column (+ 1 column))
    (setq identifier (substring identifier 1 (1- (length identifier))))
    )

  (let ((temp filename))

    (unless (file-name-absolute-p temp)
      (setq temp (locate-file filename compilation-search-path)))

    (if temp
	(setq filename temp)
      (user-error "'%s' not found in current project - renamed?" filename)))

  (setq filename (gpr-query--normalize-filename filename))

  (let ((cmd (format "refs %s:%s:%s:%s global full_file_names"
		     identifier
		     (file-name-nondirectory filename)
		     (or line "")
		     (if column (1+ column) "")))
	(decl-loc nil)
	(body-loc nil)
	(search-type nil)
	(min-distance most-positive-fixnum)
	(result nil)
	(session (gpr-query-cached-session project)))

    (with-current-buffer (gpr-query-session-send session cmd t)
      ;; 'gpr_query refs' returns a list containing the declaration,
      ;; the body, and all the references, in no particular order.
      ;;
      ;; We search the list, looking for the input location,
      ;; declaration and body, then return the declaration or body as
      ;; appropriate.
      ;;
      ;; the format of each line is file:line:column (type)
      ;;                            1    2    3       4
      ;;
      ;; 'type' can be:
      ;;   body
      ;;   declaration
      ;;   full declaration  (for a private type)
      ;;   implicit reference
      ;;   reference
      ;;   static call
      ;;
      ;; Module_Type:/home/Projects/GDS/work_stephe_2/common/1553/gds-hardware-bus_1553-wrapper.ads:171:9 (full declaration)
      ;;
      ;; itc_assert:/home/Projects/GDS/work_stephe_2/common/itc/opsim/itc_dscovr_gdsi/Gds1553/src/Gds1553.cpp:830:9 (reference)

      (message "parsing result ...")

      (goto-char (point-min))

      (while (not (eobp))
	(cond
	 ((looking-at gpr-query-ident-file-type-regexp)
	  ;; process line
	  (let* ((found-file (match-string 1))
		 (found-line (string-to-number (match-string 2)))
		 (found-col  (string-to-number (match-string 3)))
		 (found-type (match-string 4))
		 (dist       (if (and line column)
				 (gpr-query-dist found-line line found-col column)
			       most-positive-fixnum))
		 )

	    (unless found-file
	      ;; can be nil if actual file is renamed but gpr-query database not updated
	      (error "file '%s' not found; refresh?" (match-string 1)))

            (setq found-file (gpr-query--normalize-filename found-file))

	    (cond
	     ((string-equal found-type "declaration")
	      (setq decl-loc (list found-file found-line (1- found-col))))

	     ((or
	       (string-equal found-type "body")
	       (string-equal found-type "full declaration"))
	      (setq body-loc (list found-file found-line (1- found-col))))
	     )

	    (when (and (equal found-file filename)
		       (or
			(string-equal found-type "body")
			(string-equal found-type "full declaration")
			(string-equal found-type "declaration"))
		       (<= dist min-distance))
	      ;; The source may have changed since the xref database
	      ;; was computed, so allow for fuzzy matches.
	      (setq min-distance dist)
	      (setq search-type found-type))
	    ))

	 (t ;; ignore line
	  ;;
	  ;; This skips GPR_PROJECT_PATH and echoed command at start of buffer.
	  ;;
	  ;; It also skips warning lines. For example,
	  ;; gnatcoll-1.6w-20130902 can't handle the Auto_Text_IO
	  ;; language, because it doesn't use the gprconfig
	  ;; configuration project. That gives lines like:
	  ;;
	  ;; common_text_io.gpr:15:07: language unknown for "gds-hardware-bus_1553-time_tone.ads"
	  ;;
	  ;; There are probably other warnings that might be reported as well.
	  )
	 )
	(forward-line 1)
	)

      (cond
       ((and
	 line
	 (string-equal search-type "declaration")
	 body-loc)
	;; We started the search on the declaration; find the body
	(setq result body-loc))

       ((and
	 (not line)
	 (string-equal search-type "declaration"))
	;; We started in the spec file; find the declaration
	;;
	;; If the file has both declaration and body, this will go to
	;; declaration. Then a search with line, column can go to body.
	(setq result decl-loc))

       ((and
	 (not line)
	 (or
	  (string-equal search-type "body")
	  (string-equal search-type "full declaration")))
	;; We started n the body file; find the body
	(setq result body-loc))

       (decl-loc
	(setq result decl-loc))
       )

      (when (null result)
	(error "gpr_query did not return other item; refresh?"))

      (message "parsing result ... done")
      result)))

(cl-defmethod wisi-xref-parents ((_xref gpr-query-xref) project &key identifier filename line column)
  (gpr-query-compilation project identifier filename line column "parent_types" 'gpr-query-ident-file))

(cl-defmethod wisi-xref-all ((_xref gpr-query-xref) project &key identifier filename line column local-only append)
  (gpr-query-compilation project identifier filename line column "refs" 'gpr-query-ident-file local-only append))

(cl-defmethod wisi-xref-overriding ((_xref gpr-query-xref) project &key identifier filename line column)
  (gpr-query-compilation project identifier filename line column "overriding" 'gpr-query-ident-file))

(cl-defmethod wisi-xref-overridden ((_xref gpr-query-xref) project &key identifier filename line column)
  (when (eq ?\" (aref identifier 0))
    ;; gpr_query wants the quotes stripped
    (setq column (+ 1 column))
    (setq identifier (substring identifier 1 (1- (length identifier))))
    )

  (let ((cmd (format "overridden %s:%s:%d:%d %s"
		     identifier (file-name-nondirectory filename) line (1+ column)
		     (if wisi-xref-full-path "full_file_names" "short_file_names")))
	(session (gpr-query-cached-session project))
	result)
    (with-current-buffer (gpr-query-session-send session cmd t)

      (goto-char (point-min))
      (when (looking-at gpr-query-ident-file-regexp)
	(setq result
	      (list
	       (match-string 1)
	       (string-to-number (match-string 2))
	       (string-to-number (match-string 3)))))

      (when (null result)
	(error "gpr_query did not return a result; refresh?"))

      (message "parsing result ... done")
      result)))

(add-to-list 'compilation-error-regexp-alist-alist
	     (cons 'gpr-query-ident-file gpr-query-ident-file-regexp-alist))

(provide 'gpr-query)
;;; end of file
