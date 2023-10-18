;;; ada-eglot.el --- Ada definitions for eglot -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022, 2023  Free Software Foundation, Inc.
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
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

(require 'ada-core)
(require 'ada-indent-user-options)
(require 'eieio)
(require 'eglot)
(require 'gnat-compiler)
(require 'wisi)

(defface ada-package-name-face
  '((((class grayscale) (background light)) :inherit font-lock-function-name-face)
    (((class grayscale) (background dark))  :inherit font-lock-function-name-face)
    (((class color) (min-colors 88) (background light)) :foreground "RoyalBlue")
    (((class color) (min-colors 88) (background dark))  :foreground "DeepSkyBlue1")
    (((class color) (min-colors 16) (background light)) :inherit font-lock-function-name-face)
    (((class color) (min-colors 16) (background dark))  :inherit font-lock-function-name-face)
    (((class color) (min-colors 8)) :inherit font-lock-function-name-face)
    (t :inherit font-lock-function-name-face))
  "Face used to highlight Ada package names"
  :group 'ada-mode)

(defcustom ada-eglot-token-faces
  '(("comment"       . font-lock-comment-face)
    ("keyword"       . font-lock-keyword-face)
    ("string"        . font-lock-string-face)
    ("number"        . font-lock-constant-face)
    ("regexp"        . font-lock-string-face)
    ("operator"      . font-lock-function-name-face)
    ("namespace"     . ada-package-name-face)
    ("type"          . font-lock-type-face)
    ("struct"        . font-lock-type-face)
    ("class"         . font-lock-type-face)
    ("interface"     . font-lock-type-face)
    ("enum"          . font-lock-type-face)
    ("typeParameter" . font-lock-type-face)
    ("function"      . font-lock-function-name-face)
    ("method"        . font-lock-function-name-face)
    ("member"        . font-lock-variable-name-face)
    ("field"         . font-lock-variable-name-face)
    ("property"      . font-lock-variable-name-face)
    ("event"         . font-lock-variable-name-face)
    ("macro"         . font-lock-preprocessor-face)
    ("variable"      . font-lock-variable-name-face)
    ("parameter"     . font-lock-variable-name-face)
    ("label"         . font-lock-comment-face)
    ("enumConstant"  . font-lock-constant-face)
    ("enumMember"    . font-lock-constant-face)
    ("dependent"     . font-lock-type-face)
    ("concept"       . font-lock-type-face))
  "Ada-mode setting for `eglot-semantic-token-faces'."
  :type '(alist :key-type (string :tag "Token name")
                :value-type (face :tag "Face"))
  :group 'ada-mode)

(defcustom ada-eglot-modifier-faces
  ;; See ada_language_server/source/ada/lsp-ada_highlighters.adb for
  ;; how these map to Ada syntax. Initialize has the list of which are
  ;; actually used; unused are set to nil here (an als bug requires that
  ;; they not be deleted).
  ;;
  ;; On my system (Debian testing running in a VMWare virtual machine,
  ;; X windows with default fonts), oblique is the same as italic, and
  ;; reverse-italic is not supported; this depends on the specific
  ;; font begin used.
  '(("declaration" . nil) ;; spec; supported, but not helpful to display
    ("definition" . nil)  ;; body; supported, but not helpful to display
    ("implementation" . nil)
    ("readonly" . nil) ;; anything with "constant" keyword; supported, but not helpful to display
    ("static" . nil)           ;; a static type declaration; supported, but not helpful to display
    ("abstract" :overline "green")
    ("async" . nil)
    ("modification" :overline "orange") ;; write reference
    ("deprecated" :strike-through t)
    ("documentation" . nil)
    ("defaultLibrary" . nil)) ;; Anything in Ada... packages; supported, not helpful to display
  "Ada-mode setting for `eglot-semantic-token-modifier-faces'."
    :type `(alist :key-type (string :tag "Token name")
                :value-type (list (plist :tag "Face Attributes"
                                         :key-type
                                         (choice
                                          ,@(mapcar
                                             (lambda (cell)
                                               `(const :tag ,(capitalize
                                                              (cdr cell))
                                                       ,(car cell)))
                                             face-attribute-name-alist)))))
    :group 'ada-mode)

(defclass eglot-ada (eglot-lsp-server)
  ((indexing-done
    :accessor eglot-ada-indexing-done
    :initform nil))
  :documentation "AdaCore's ada_language_server.")

(cl-defmethod eglot-handle-notification :after ((server eglot-ada) (_method (eql $/progress))
						&key token value &allow-other-keys)
  "Record when indexing is done."
  (when (string-match token "indexing")
    (when (string= (plist-get value :kind) "end")
      (setf (eglot-ada-indexing-done server) t))))

(defun ada-eglot-wait-indexing-done ()
  "For use in tests."
  (let ((server (eglot-current-server)))
    (message "ada_language_server indexing ...")
    (while (not (eglot-ada-indexing-done server))
      ;; Update display for indexing progress; displayed by eglot's
      ;; handle-notification
      (sit-for 0.1)
      (accept-process-output))
    (message "ada_language_server indexing ... done")
    ))

(defun ada-eglot-indent-line ()
  "For `indent-line-function'."
  (let ((savep (copy-marker (point)))
	(to-indent nil)
	(tab-width ada-indent)
	;; https://github.com/AdaCore/ada_language_server/issues/1075
	;; eglot sets FormattingOptions tabSize to tab-width
	)
    (back-to-indentation)
    (when (>= (point) savep)
      (setq to-indent t))

    ;; (1+ line-end-pos) is needed to compute indent for a line. It
    ;; can exceed (point-max); the parser must be able to handle that.
    ;;
    (eglot-format (line-beginning-position) (1+ (line-end-position)))

    (goto-char savep)
    (when to-indent (back-to-indentation))
    ))

(defun ada-eglot-indent-region (begin end)
  "For `indent-region-function'."
  (let ((tab-width ada-indent)
	;; https://github.com/AdaCore/ada_language_server/issues/1075
	;; eglot sets FormattingOptions tabSize to tab-width
	)
    (eglot-format begin end)
    ))

;;; startup
(defvar ada-eglot-require-gpr nil
  ;; Unit tests set t to avoid starting eglot until a gpr file is
  ;; specified.
  )

(defcustom ada-eglot-gpr-file nil
  "Specify a gpr file to use, when not using a wisi project.
If the file requires setting GPR_PROJECT_PATH, use a wisi project
or set it globally."
  :type 'string
  :safe (lambda (val) (or (null val) (stringp val)))
  :group 'ada-mode)

(defun ada-eglot-require-eglot ()
  "Ensure eglot is started for the current project."
  (unless (eglot-current-server)
    (let* ((prj (eglot--current-project)) ;; provides a default if (current-project) is nil.
 	   (process-environment (copy-sequence process-environment))
	   (gpr-file
	    (cond
	     ((and (wisi-prj-p prj)
		  (gnat-compiler-p (wisi-prj-compiler prj)))
	      (gnat-compiler-gpr-file (wisi-prj-compiler prj)))

	    (ada-eglot-gpr-file ada-eglot-gpr-file)))

	   ;; als 23 does not accept initializationOptions in the
	   ;; initialize method. https://github.com/AdaCore/ada_language_server/issues/1079
	   (eglot-workspace-configuration nil))

      (when (wisi-prj-p prj)
	(setq process-environment
	      (append (wisi-prj-file-env prj) ;; for GPR_PROJECT_PATH
		      process-environment)))

      (when gpr-file
	(setq eglot-workspace-configuration
	      ;; This is sent in a workspace/didChangeConfiguration message.
	      (list (list :ada (cons 'projectFile gpr-file)))))

      (unless (and ada-eglot-require-gpr
		   (null gpr-file))

	(eglot 'ada-mode 	 ;; managed-major-mode
	       prj 		 ;; project; project-root is server process directory
	       'eglot-ada        ;; class
	       (list (gnat-find-als))   ;; contact IMPROVME: allow other servers?
	       "Ada" 		 ;; language-id
	       )

	(when (eglot-current-server)
	  (when (eq ada-face-backend 'eglot)
	    (unless (eglot--server-capable :semanticTokensProvider :range)
	      (display-warning 'ada "LSP server does not support faces; change ada-face-backend"))
	    (unless (boundp 'eglot-semantic-token-faces)
	      (display-warning 'ada "current version of eglot does not support faces")))

	  (when (eq ada-indent-backend 'eglot)
	    ;; :documentFormattingProvider does the whole file at once; not
	    ;; useful for indent-region. IMPROVEME: in als devel version? fix it!
	    (unless (plist-get (oref (eglot-current-server) capabilities) :documentRangeFormattingProvider)
	      (display-warning 'ada "LSP server does not support line or range indent; change ada-indent-backend"))

	    (setq-local indent-line-function #'ada-eglot-indent-line)
	    (setq-local indent-region-function #'ada-eglot-indent-region)))
	;; We just assume the language server supports xref, completion
	))))

;;;###autoload
(defun ada-eglot-setup ()
  "Configure elgot settings for Ada."
  ;; Called from ada-mode when any ada-*-backend is eglot.

  (when (or (null ada-eglot-require-gpr)
	    ada-eglot-gpr-file)
    (ada-eglot-require-eglot))

  (cl-ecase ada-diagnostics-backend
    ((none eglot other)
     (setq wisi-disable-diagnostics t))

    (wisi
     (setq wisi-disable-diagnostics nil))
    )

  (cl-ecase ada-face-backend
    (none
     (setq-local wisi-disable-face t))

    (eglot
     (setq-local wisi-disable-face t)

     ;; It's tempting to delete defaultLibrary from the supported token
     ;; modifiers; there's no need to distinguish "Ada" from other
     ;; packages. But that's actually a user preference.
     ;;
     ;; In addition, als 23 raises CONSTRAINT_ERROR if we do that;
     ;; https://github.com/AdaCore/ada_language_server/issues/1070. So
     ;; we encourage the user to modify
     ;; ada-eglot-token-faces and ada-eglot-modifier-faces instead.
     (setq-local eglot-semantic-token-faces ada-eglot-token-faces)
     (setq-local eglot-semantic-token-modifier-faces ada-eglot-modifier-faces))

    (wisi
     ;; wisi-setup does the work
     (setq-local wisi-disable-face nil))

    (other
     (setq-local wisi-disable-face t))
    )

  (cl-ecase ada-indent-backend
    (none
     (setq-local wisi-disable-indent t))

    (eglot
     (setq-local wisi-disable-indent t)

     (setq-local indent-line-function #'ada-eglot-indent-line)
     (setq-local indent-region-function #'eglot-format))

    (wisi
     ;; wisi-setup does the work
     (setq-local wisi-disable-indent nil))

    (other
     (setq-local wisi-disable-indent t))
    )

  (cl-ecase ada-statement-backend
    ((none other)
     (setq wisi-disable-statement t))

    (wisi
     (setq wisi-disable-statement nil))
    )

  (cl-ecase ada-xref-backend
    ((gpr_query gnat)
     (setq-local eglot-stay-out-of (default-value 'eglot-stay-out-of))
     (add-to-list 'eglot-stay-out-of 'xref)
     (unless (memq #'wisi-prj-xref-backend xref-backend-functions)
       (add-hook 'xref-backend-functions #'wisi-prj-xref-backend 10 t)))

    (eglot
     ;; IMPROVEME: implement lsp backend for wisi-xref, take
     ;; advantage of ada_language_server extensions. waiting for
     ;; test cases.
     (add-hook 'xref-backend-functions #'eglot-xref-backend -10 t)

     ;; IMPROVEME: don't bind C-c C-d? move to gpr-query minor mode
     ;; or implement via als extensions
     )

    (other
     (setq-local wisi-disable-face t))
    )

  ;; eglot is always better at completion, so no separate user
  ;; config for this.
  (setq wisi-disable-completion t)

  (when (and wisi-disable-diagnostics
	     wisi-disable-face
	     wisi-disable-indent
	     wisi-disable-statement)
    (setq wisi-disable-parser t)))

(cl-defmethod wisi-prj-select :after ((_project wisi-prj))
  ;; Connect to or create an eglot instance, providing a gpr file if
  ;; declared.
  (when (or (eq ada-xref-backend   'eglot)
	    (eq ada-indent-backend 'eglot)
	    (eq ada-face-backend   'eglot))
    (ada-eglot-require-eglot)))

(cl-defmethod wisi-prj-deselect :after ((_project wisi-prj))
  ;; Shutdown a corresponding eglot instance (defined in
  ;; eglot-current-server by combination of major-mode and
  ;; current-project), to allow gpr file and other settings to change.
  (when (eglot-current-server)
    (eglot-shutdown (eglot-current-server))))

;;;###autoload
(cl-defun create-eglot-xref ()
  'eglot)

;;; debugging
(defun ada-eglot-log-to-als-test (&optional prompt)
  "Convert EGLOT log in current buffer to an ada_language_server test.
Command file name defaults to \"new-test.json\"; with user arg,
prompt for it."
  (interactive "P")
  (let* ((test-buffer-name
	 (if prompt
	     (read-string "command file name: " "new-test.json")
	   "new-test.json"))
	(log-buffer (current-buffer))
	(test-buffer (get-buffer-create test-buffer-name)))
    (set-buffer test-buffer)
    (erase-buffer)

    (set-buffer test-buffer)
    (insert "[\n    {\"comment\": [\"\"]},\n")
    (insert "    {\"start\": {\"cmd\": [\"${ALS}\"]}},\n")

    (set-buffer log-buffer)
    (goto-char (point-min))

    (while (search-forward-regexp
	    (concat
	     "^\\(?:\\[client-request\\] (id:\\([0-9]+\\))\\)"
	     "\\|\\(?:\\[client-notification\\]\\)")
	    nil t)
      (let ((request-id (match-string 1))
	    begin msg)
	(forward-line 1)
	(setq begin (point))
	(forward-sexp)
	(setq msg (car (read-from-string (buffer-substring-no-properties begin (point)))))

	(set-buffer test-buffer)
	(insert "    {\"send\": {\n        \"request\": \n            ")
	(insert (json-encode msg))

	(set-buffer log-buffer)
	(forward-line 1)
	(if (and request-id
		 (looking-at (format "\\[server-reply\\] (id:%s)" request-id)))
	  (progn
	    (forward-line 1)
	    (setq begin (point))
	    (forward-sexp)
	    (setq msg (car (read-from-string (buffer-substring-no-properties begin (point)))))

	    (set-buffer test-buffer)
	    (insert ",\n        \"wait\" : [\n")
	    ;; IMPROVEME: initialize response in test includes log_filename, which eglot response does not.
	    ;; It also uses {} instead of null
	    ;; And even after fixing those, wait times out. So we simplify by hand until it works
	    ;; Also need to edit gpr file in didChangeConfiguration
	    ;; Also have to wait for indexing to complete.
	    (insert (json-encode msg))
	    (insert "]\n"))

	  ;; no wait
	  (set-buffer test-buffer)
	  (insert ",\n        \"wait\" : []"))

	(insert "}},\n")
	(set-buffer log-buffer)
	))

    (set-buffer test-buffer)
    (insert "   {\"stop\": {\"exit_code\": 0}}\n]\n")
    (if (buffer-file-name)
	(save-buffer)
      (write-file test-buffer-name))))

(provide 'ada-eglot)
;;; ada-eglot.el ends here.
