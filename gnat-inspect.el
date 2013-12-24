;;; gnat-inspect.el --- minor-mode for navigating sources using the
;;; AdaCore cross reference tool gnatinspect.
;;;
;;; gnatinspect supports Ada and any gcc language that supports the
;;; -fdump-xref switch (which includes C, C++).
;;
;;; Copyright (C) 2013  Free Software Foundation, Inc.

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
;; M-x gnat-inspect

(require 'compile)
(require 'ada-mode) ;; for ada-prj-*, some other things
(eval-when-compile (require 'cl-macs))

;;;;; sessions

;; gnatinspect reads the project files and the database at startup,
;; which is noticeably slow for a reasonably sized project. But
;; running queries after startup is fast. So we leave gnatinspect
;; running, and send it new queries via stdin, getting responses via
;; stdout.
;;
;; We maintain a cache of active sessions, one per gnat project.

(cl-defstruct (gnat-inspect--session)
  (process nil) ;; running gnatinspect
  (buffer nil)  ;; receives output of gnatinspect
  (sent-kill-p nil)
  (closed-p nil))

(defconst gnat-inspect-buffer-name-prefix " *gnatinspect-")

(defun gnat-inspect--start-process (session)
  "Start the session process running gnatinspect."
  (unless (buffer-live-p (gnat-inspect--session-buffer session))
    ;; user may have killed buffer
    (setf (gnat-inspect--session-buffer session) (gnat-run-buffer gnat-inspect-buffer-name-prefix)))

  (with-current-buffer (gnat-inspect--session-buffer session)
    (let ((process-environment (ada-prj-get 'proc_env)) ;; for GPR_PROJECT_PATH

	  ;; WORKAROUND: gnatinspect from gnatcoll-1.6w-20130902 can't handle aggregate projects; M910-032
	  (project-file (file-name-nondirectory
			 (or (ada-prj-get 'gnat_inspect_gpr_file)
			     (ada-prj-get 'gpr_file)))))
      (erase-buffer); delete any previous messages, prompt
      (setf (gnat-inspect--session-process session)
	    ;; FIXME: need good error message on bad project file:
	    ;; 		"can't handle aggregate projects? - set gnat_inspect_gpr_file")
	    (start-process (concat "gnatinspect " (buffer-name))
			   (gnat-inspect--session-buffer session)
			   "gnatinspect"
			   (concat "--project=" project-file)))
      (set-process-query-on-exit-flag (gnat-inspect--session-process session) nil)
      (gnat-inspect-session-wait session)
      )))

(defun gnat-inspect--make-session ()
  "Create and return a session for the current project file."
  (let ((session
	 (make-gnat-inspect--session
	  :buffer (gnat-run-buffer gnat-inspect-buffer-name-prefix))))
    (gnat-inspect--start-process session)
    session))

(defvar gnat-inspect--sessions '()
  "Assoc list of sessions, indexed by absolute GNAT project file name.")

(defun gnat-inspect-cached-session ()
  "Return a session for the current project file, creating it if necessary."
  (let* ((session (cdr (assoc ada-prj-current-file gnat-inspect--sessions))))
    (if session
	(progn
	  (unless (process-live-p (gnat-inspect--session-process session))
	    (gnat-inspect--start-process session))
	  session)
      ;; else
      (prog1
          (setq session (gnat-inspect--make-session))
	(setq gnat-inspect--sessions
	      (cl-acons ada-prj-current-file session gnat-inspect--sessions))))
    ))

(defconst gnat-inspect-prompt "^>>> $"
  ;; gnatinspect output ends with this
  "Regexp matching gnatinspect prompt; indicates previous command is complete.")

(defun gnat-inspect-session-wait (session)
  "Wait for the current command to complete."
  (with-current-buffer (gnat-inspect--session-buffer session)
    (let ((process (gnat-inspect--session-process session))
	  (search-start (point-min))
	  (wait-count 0))
      (while (progn
	       ;; process output is inserted before point, so move back over it to search it
	       (goto-char search-start)
	       (not (re-search-forward gnat-inspect-prompt (point-max) 1)));; don't search same text again
	(setq search-start (point))
	(message (concat "running gnatinspect ..." (make-string wait-count ?.)))
	(accept-process-output process 1.0)
	(setq wait-count (1+ wait-count)))
      (message (concat "running gnatinspect ... done"))
      )))

(defun gnat-inspect-session-send (cmd wait)
  "Send CMD to gnatinspect session for current project.
If WAIT is non-nil, wait for command to complete.
Return buffer that holds output."
  (let ((session (gnat-inspect-cached-session)))
    (with-current-buffer (gnat-inspect--session-buffer session)
      (erase-buffer)
      (process-send-string (gnat-inspect--session-process session)
			   (concat cmd "\n"))
      (when wait
	(gnat-inspect-session-wait session))
      (current-buffer)
      )))

(defun gnat-inspect-session-kill (session)
  (when (process-live-p (gnat-inspect--session-process session))
    (process-send-string (gnat-inspect--session-process session) "exit\n")))

(defun gnat-inspect-kill-all-sessions ()
  (interactive)
  (mapc (lambda (assoc) (gnat-inspect-session-kill (cdr assoc))) gnat-inspect--sessions))

;;;;; utils

(defconst gnat-inspect-ident-file-regexp
  ;; Write_Message:C:\Projects\GDS\work_dscovr_release\common\1553\gds-mil_std_1553-utf.ads:252:25
  ;; Write_Message:/Projects/GDS/work_dscovr_release/common/1553/gds-mil_std_1553-utf.ads:252:25
  "\\([^:]*\\):\\(\\(?:.:\\\|/\\)[^:]*\\):\\([0123456789]+\\):\\([0123456789]+\\)"
  "Regexp matching <identifier>:<file>:<line>:<column>")

(defconst gnat-inspect-ident-file-regexp-alist
  (list (concat "^" gnat-inspect-ident-file-regexp) 2 3 4)
  "For compilation-error-regexp-alist, matching `gnatinspect overriding_recursive' output")

(defconst gnat-inspect-ident-file-type-regexp
  (concat gnat-inspect-ident-file-regexp " (\\(.*\\))")
  "Regexp matching <identifier>:<file>:<line>:<column> (<type>)")

(defconst gnat-inspect-ident-file-scope-regexp-alist
  ;; RX_Enable:C:\common\1553\gds-hardware-bus_1553-raw_read_write.adb:163:13 (write reference) scope=New_Packet_TX:C:\common\1553\gds-hardware-bus_1553-raw_read_write.adb:97:14

  (list (concat
	 gnat-inspect-ident-file-regexp
	 " (.*) "
	 "scope="
	 gnat-inspect-ident-file-regexp
	 )
	2 3 4;; file line column
	;; 2 ;; type = error
	;; nil ;; hyperlink
	;; (list 4 'gnat-inspect-scope-secondary-error)
	)
  "For compilation-error-regexp-alist, matching `gnatinspect refs' output")

;; debugging:
;; in *compilation-gnatinspect-refs*, run
;;  (progn (set-text-properties (point-min)(point-max) nil)(compilation-parse-errors (point-min)(point-max) gnat-inspect-ident-file-scope-regexp-alist))

(defun gnat-inspect-compilation (identifier file line col cmd comp-err)
  "Run gnatinspect IDENTIFIER:FILE:LINE:COL CMD,
set compilation-mode with compilation-error-regexp-alist set to COMP-ERR."
  (let ((cmd-1 (format "%s %s:%s:%d:%d" cmd identifier file line col))
	(result-count 0)
	file line column)
    (with-current-buffer (gnat-inspect--session-buffer (gnat-inspect-cached-session))
      (compilation-mode)
      (setq buffer-read-only nil)
      (set (make-local-variable 'compilation-error-regexp-alist) (list comp-err))
      (gnat-inspect-session-send cmd-1 t)
      ;; at EOB. gnatinspect returns one line per result
      (setq result-count (- (line-number-at-pos) 1))
      (font-lock-fontify-buffer)
      ;; font-lock-fontify-buffer applies compilation-message text properties
      ;; IMPROVEME: for some reason, next-error works, but the font
      ;; colors are not right (no koolaid!)
      (goto-char (point-min))

      (cl-case result-count
	(0
	 (error "gnatinspect returned no results"))
	(1
	 ;; just go there, don't display session-buffer. We have to
	 ;; fetch the compilation-message while in the session-buffer.
	 (let* ((msg (compilation-next-error 0 nil (point-min)))
		(loc (compilation--message->loc msg)))
	   (setq file (caar (compilation--loc->file-struct loc))
		 line (caar (cddr (compilation--loc->file-struct loc)))
		 column (1- (compilation--loc->col loc)))
	   ))

	));; case, with-currrent-buffer

    ;; compilation-next-error-function assumes there is not at error
    ;; at point-min; work around that by moving forward 0 errors for
    ;; the first one.
    (if (> result-count 1)
	;; more than one result; display session buffer
	(next-error 0 t)
      ;; else don't display
      (ada-goto-source file line column nil))
    ))

(defun gnat-inspect-dist (found-line line found-col col)
  "Return non-nil if found-line, -col is closer to line, col than min-distance."
  (+ (abs (- found-line line))
     (* (abs (- found-col col)) 250)))

;;;;; user interface functions

(defun gnat-inspect-refresh ()
  "For `ada-xref-refresh-function', using gnatinspect."
  (with-current-buffer (gnat-inspect-session-send "refresh" t)))

(defun gnat-inspect-other (identifier file line col)
  "For `ada-xref-other-function', using gnatinspect."
  (unless (ada-prj-get 'gpr_file)
    (error "no gnat project file defined."))

  (when (eq ?\" (aref identifier 0))
    ;; gnatinspect wants the quotes stripped
    (setq col (+ 1 col))
    (setq identifier (substring identifier 1 (1- (length identifier))))
    )

  (let ((cmd (format "refs %s:%s:%d:%d" identifier (file-name-nondirectory file) line col))
	(decl-loc nil)
	(body-loc nil)
	(search-type nil)
	(min-distance (1- (expt 2 29)))
	(result nil))

    (with-current-buffer (gnat-inspect-session-send cmd t)
      ;; 'gnatinspect refs' returns a list containing the declaration,
      ;; the body, and all the references, in no particular order.
      ;;
      ;; We search the list, looking for the input location,
      ;; declaration and body, then return the declaration or body as
      ;; appropriate.
      ;;
      ;; the format of each line is name:file:line:column (type) scope=name:file:line:column
      ;;                            1    2    3    4       5
      ;;
      ;; 'type' can be:
      ;;   body
      ;;   declaration
      ;;   full declaration  (for a private type)
      ;;   implicit reference
      ;;   reference
      ;;   static call
      ;;
      ;; Module_Type:/home/Projects/GDS/work_stephe_2/common/1553/gds-hardware-bus_1553-wrapper.ads:171:9 (full declaration) scope=Wrapper:/home/Projects/GDS/work_stephe_2/common/1553/gds-hardware-bus_1553-wrapper.ads:49:31
      ;;
      ;; itc_assert:/home/Projects/GDS/work_stephe_2/common/itc/opsim/itc_dscovr_gdsi/Gds1553/src/Gds1553.cpp:830:9 (reference) scope=Gds1553WriteSubaddress:/home/Projects/GDS/work_stephe_2/common/itc/opsim/itc_dscovr_gdsi/Gds1553/inc/Gds1553.hpp:173:24

      (message "parsing result ...")

      (goto-char (point-min))

      (while (not (eobp))
	(cond
	 ((looking-at gnat-inspect-ident-file-type-regexp)
	  ;; process line
	  (let* ((found-file (file-name-nondirectory (match-string 2)))
		 (found-line (string-to-number (match-string 3)))
		 (found-col  (string-to-number (match-string 4)))
		 (found-type (match-string 5))
		 (dist       (gnat-inspect-dist found-line line found-col col))
		 )

	    (when (string-equal found-type "declaration")
	      (setq decl-loc (list found-file found-line (1- found-col))))

	    (when (or
		   (string-equal found-type "body")
		   (string-equal found-type "full declaration"))
	      (setq body-loc (list found-file found-line (1- found-col))))

	    (when
		;; In general, we don't know where in the gnatinspect
		;; output the search item occurs, so we search for it.
		;;
		;; We use the same distance algorithm as gnatinspect
		;; to allow a fuzzy match on edited code.
		(and (equal found-file file)
		     (< dist min-distance))
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
       ((null search-type)
	(pop-to-buffer (current-buffer))
	(error "gnatinspect did not return other item"))

       ((and
	 (string-equal search-type "declaration")
	 body-loc)
	(setq result body-loc))

       (decl-loc
	(setq result decl-loc))
       )

      (when (null result)
	(pop-to-buffer (current-buffer))
	(error "gnatinspect did not return other item"))

      (message "parsing result ... done")
      result)))

(defun gnat-inspect-all (identifier file line col)
  "For `ada-xref-all-function', using gnatinspect."
  ;; This will in general return a list of references, so we use
  ;; `compilation-start' to run gnatinspect, so the user can navigate
  ;; to each result in turn via `next-error'.
  (gnat-inspect-compilation identifier file line col "refs" 'gnat-inspect-ident-file))

(defun gnat-inspect-parents (identifier file line col)
  "For `ada-xref-parent-function', using gnatinspect."
  (gnat-inspect-compilation identifier file line col "parent_types" 'gnat-inspect-ident-file))

(defun gnat-inspect-overriding (identifier file line col)
  "For `ada-xref-overriding-function', using gnatinspect."
  (gnat-inspect-compilation identifier file line col "overridden_recursive" 'gnat-inspect-ident-file))

(defun gnat-inspect-overridden-1 (identifier file line col)
  "For `ada-xref-overridden-function', using gnatinspect."
  (unless (or (ada-prj-get 'gnat_inspect_gpr_file)
			     (ada-prj-get 'gpr_file))
    (error "no gnat project file defined."))

  (when (eq ?\" (aref identifier 0))
    ;; gnatinspect wants the quotes stripped
    (setq col (+ 1 col))
    (setq identifier (substring identifier 1 (1- (length identifier))))
    )

  (let ((cmd (format "overrides %s:%s:%d:%d" identifier (file-name-nondirectory file) line col))
	result)
    (with-current-buffer (gnat-inspect-session-send cmd t)

      (goto-char (point-min))
      (when (looking-at gnat-inspect-ident-file-regexp)
	(setq result
	      (list
	       (match-string 2)
	       (string-to-number (match-string 3))
	       (string-to-number (match-string 4)))))

      (when (null result)
	(pop-to-buffer (current-buffer))
	(error "gnatinspect did not return other item"))

      (message "parsing result ... done")
      result)))

(defun gnat-inspect-overridden (other-window)
  "Move to the overridden declaration of the identifier around point.
If OTHER-WINDOW (set by interactive prefix) is non-nil, show the
buffer in another window."
  (interactive "P")

  (let ((target
	 (gnat-inspect-overridden-1
	  (thing-at-point 'symbol)
	  (buffer-file-name)
	  (line-number-at-pos)
	  (save-excursion
	    (goto-char (car (bounds-of-thing-at-point 'symbol)))
	    (1+ (current-column)))
	  )))

    (ada-goto-source (nth 0 target)
		     (nth 1 target)
		     (nth 2 target)
		     other-window)
    ))

(defun gnat-inspect-goto-declaration (other-window)
  "Move to the declaration or body of the identifier around point.
If at the declaration, go to the body, and vice versa. If at a
reference, goto the declaration.

If OTHER-WINDOW (set by interactive prefix) is non-nil, show the
buffer in another window."
  (interactive "P")

  (let ((target
	 (gnat-inspect-other
	  (thing-at-point 'symbol)
	  (buffer-file-name)
	  (line-number-at-pos)
	  (save-excursion
	    (goto-char (car (bounds-of-thing-at-point 'symbol)))
	    (1+ (current-column)))
	  )))

    (ada-goto-source (nth 0 target)
		     (nth 1 target)
		     (nth 2 target)
		     other-window)
    ))

(defvar gnat-inspect-map
  (let ((map (make-sparse-keymap)))
    ;; C-c <letter> are reserved for users

    (define-key map "\C-c\C-d" 'gnat-inspect-goto-declaration)
    ;; FIXME: (define-key map "\C-c\M-d" 'gnat-inspect-parents)
    ;; FIXME: overriding
    (define-key map "\C-c\C-r" 'gnat-inspect-all)
    map
  )  "Local keymap used for GNAT inspect minor mode.")

;; FIXME: define menu

(define-minor-mode gnat-inspect
  "Minor mode for navigating sources using GNAT cross reference tool.
Enable mode if ARG is positive"
  :initial-value t
  :lighter       " gnat-inspect"   ;; mode line

  ;; just enable the menu and keymap
  )

;;;;; support for Ada mode

(defun ada-gnat-inspect-select-prj ()
  (setq ada-file-name-from-ada-name 'ada-gnat-file-name-from-ada-name)
  (setq ada-ada-name-from-file-name 'ada-gnat-ada-name-from-file-name)
  (setq ada-make-package-body       'ada-gnat-make-package-body)

  (add-hook 'ada-syntax-propertize-hook 'gnatprep-syntax-propertize)

  ;; must be after indentation engine setup, because that resets the
  ;; indent function list.
  (add-hook 'ada-mode-hook 'ada-gnat-inspect-setup t)

  (setq ada-xref-refresh-function    'gnat-inspect-refresh)
  (setq ada-xref-all-function        'gnat-inspect-all)
  (setq ada-xref-other-function      'gnat-inspect-other)
  (setq ada-xref-parent-function     'gnat-inspect-parents)
  (setq ada-xref-all-function        'gnat-inspect-all)
  (setq ada-xref-overriding-function 'gnat-inspect-overriding)
  (setq ada-xref-overridden-function 'gnat-inspect-overridden-1)

  (add-to-list 'completion-ignored-extensions ".ali") ;; gnat library files, used for cross reference
  )

(defun ada-gnat-inspect-deselect-prj ()
  (setq ada-file-name-from-ada-name nil)
  (setq ada-ada-name-from-file-name nil)
  (setq ada-make-package-body       nil)

  (setq ada-syntax-propertize-hook (delq 'gnatprep-syntax-propertize ada-syntax-propertize-hook))
  (setq ada-mode-hook (delq 'ada-gnat-inspect-setup ada-mode-hook))

  (setq ada-xref-other-function      nil)
  (setq ada-xref-parent-function     nil)
  (setq ada-xref-all-function        nil)
  (setq ada-xref-overriding-function nil)
  (setq ada-xref-overridden-function nil)

  (setq completion-ignored-extensions (delete ".ali" completion-ignored-extensions))
  )

(defun ada-gnat-inspect-setup ()
  (when (boundp 'wisi-indent-calculate-functions)
    (add-to-list 'wisi-indent-calculate-functions 'gnatprep-indent))
  )

(defun ada-gnat-inspect ()
  "Set Ada mode global vars to use gnatinspect."
  (add-to-list 'ada-prj-parser-alist       '("gpr" . gnat-parse-gpr))
  (add-to-list 'ada-select-prj-xref-tool   '(gnat_inspect  . ada-gnat-inspect-select-prj))
  (add-to-list 'ada-deselect-prj-xref-tool '(gnat_inspect  . ada-gnat-inspect-deselect-prj))

  ;; no parse-*-xref

  (font-lock-add-keywords 'ada-mode
   ;; gnatprep preprocessor line
   (list (list "^[ \t]*\\(#.*\n\\)"  '(1 font-lock-type-face t))))

  (add-hook 'ada-gnat-fix-error-hook 'ada-gnat-fix-error)
  )

(provide 'gnat-inspect)

(add-to-list 'compilation-error-regexp-alist-alist
	     (cons 'gnat-inspect-ident-file       gnat-inspect-ident-file-regexp-alist))
(add-to-list 'compilation-error-regexp-alist-alist
	     (cons 'gnat-inspect-ident-file-scope gnat-inspect-ident-file-scope-regexp-alist))

(unless (and (boundp 'ada-xref-tool)
	     (default-value 'ada-xref-tool))
  (setq ada-xref-tool 'gnat_inspect))

(ada-gnat-inspect)

;;; end of file
