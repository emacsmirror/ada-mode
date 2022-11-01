;;; ada-eglot.el --- Ada definitions for eglot -*- lexical-binding: t; -*-
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

(require 'ada-core)
(require 'eieio)
(require 'eglot)
(require 'gnat-compiler)
(require 'wisi)

(defclass eglot-ada (eglot-lsp-server)
  ((indexing-done
    :accessor eglot-ada-indexing-done
    :initform nil))
  :documentation "AdaCore's ada_language_server.")

(cl-defmethod eglot-handle-notification ((server eglot-ada) (_method (eql $/progress))
   &key _token value &allow-other-keys)
  "Handle notification $/progress."
  (when (string= (plist-get value :kind) "end")
    (setf (eglot-ada-indexing-done server) t)))

(defun ada-eglot-wait-indexing-done ()
  (let ((server (eglot-current-server)))
    (message "waiting for ada_language_server indexing ...")
    (while (not (eglot-ada-indexing-done server))
      (accept-process-output))
    (message "waiting for ada_language_server indexing ... done")
    ))

(defun ada-eglot-indent-line ()
  "For `indent-line-function'."
  (let ((savep (copy-marker (point)))
	(to-indent nil))
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

;;; startup
(defvar ada-eglot-require-gpr nil
  ;; Default nil to allow newbies and small projects to run without a
  ;; gpr file; als uses a default.  unit tests can set t if the gpr
  ;; file is set after the file under test is opened.
)

(defun ada-eglot-require-eglot ()
  "Ensure eglot is started for the current project."
  (unless (eglot-current-server)
    (let* ((prj (eglot--current-project)) ;; provides a default if (current-project) is nil.
 	   (process-environment (copy-sequence process-environment))
	   (gpr-file
	    (when (and (wisi-prj-p prj)
		       (gnat-compiler-p (wisi-prj-compiler prj)))
	      (gnat-compiler-gpr-file (wisi-prj-compiler prj))))
	   ;; IMPROVEME: we should be able to specify the gpr file via
	   ;; initializationOptions in the initialize method at server
	   ;; startup. But that caused a CONSTRAINT_ERROR in GNAT GPL
	   ;; 2021 and GNAT 22 als.
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
	       ;; IMPROVEME: see above
	       ;; (if gpr-file
	       ;; 	   (list (gnat-find-als)
	       ;; 		 :initializationOptions (list (list :ada (cons 'projectFile gpr-file))))
	       (list (gnat-find-als))   ;; contact
	       "Ada" 		 ;; language-id
	       )

	(when (eglot-current-server)
	  (when (eq ada-face-backend 'eglot)
	    (unless (eglot--server-capable :semanticTokensProvider :range)
	      (display-warning 'ada "LSP server does not support faces; change ada-face-backend"))
	    (unless (boundp 'eglot-enable-semantic-tokens)
	      (display-warning 'ada "current version of eglot does not support faces"))
	    ))

	(when (eq ada-indent-backend 'eglot)
	  ;; :documentFormattingProvider does the whole file at once; not
	  ;; useful for indent-region. IMPROVEME: in als devel version? fix it!
	  (unless (plist-get (oref (eglot-current-server) capabilities) :documentRangeFormattingProvider)
	    (display-warning 'ada "LSP server does not support line or range indent; change ada-indent-backend"))

	  (setq-local indent-line-function #'ada-eglot-indent-line)
	  (setq-local indent-region-function #'eglot-format))
	;; We just assume the language server supports xref, completion
	))))

;;;###autoload
(defun ada-eglot-setup ()
  "Configure elgot settings for Ada."
  ;; Called from ada-mode when any ada-*-backend is eglot.

  (when (null ada-eglot-require-gpr)
    ;; The user is not using a project, so wisi-select-prj is not
    ;; called; start eglot now. See comment in ada-mode on startup
    ;; cases.
    (ada-eglot-require-eglot))

  (cl-ecase ada-face-backend
    (none
     (setq-local wisi-disable-face t))

    (eglot
     (setq-local wisi-disable-face t)
     (when (and (boundp 'eglot-enable-semantic-tokens)
		(boundp 'eglot-semantic-token-modifier-faces))
       (setq eglot-enable-semantic-tokens t)
       (when-let ((item (assoc "defaultLibrary" eglot-semantic-token-modifier-faces)))
	 ;; No need to distinguish "Ada" from other packages.
	 (setq eglot-semantic-token-modifier-faces
	       (cl-delete item eglot-semantic-token-modifier-faces))))

     ;; LSP defines Semantic Tokens for syntactic
     ;; highlighting/font-lock. Not supported in eglot.el 1.8,
     ;; ada_language_server 22.0. Supported in devel versions;
     ;; https://github.com/joaotavora/eglot/issues/615
     ;; https://github.com/AkibAzmain/eglot/tree/semantic-tokens
     ;; https://github.com/AdaCore/ada_language_server/issues/879
     ;;
     ;; (setq wisi-disable-face t)
     ;; (setq eglot-enable-semantic-tokens t)
     ;; see the default settings in eglot-semantic-token-faces
     )

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

  (when (and wisi-disable-face
	     wisi-disable-indent
	     (not (eq ada-xref-backend 'wisi)))
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

;; create-ada-prj runs create-%s-xref, where %s is ada-xref-backend. So
;; we need create-eglot-xref. It returns nil, since we don't use any
;; wisi xref functions; just the ones provided by eglot.
;;;###autoload
(defun create-eglot-xref () nil)

(provide 'ada-eglot)
;;; ada-eglot.el ends here.
