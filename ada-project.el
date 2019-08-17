;; ada-project.el - project.el backend for ada-mode projects -*- lexical-binding: t -*-
;;
;; Copyright (C) 2017 - 2019  Free Software Foundation, Inc.
;;
;; Author: Stephen Leake <stephen_leake@stephe-leake.org>
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

(require 'ada-mode)
(require 'cl-lib)
(require 'cl-generic)
(require 'project)
(require 'uniquify-files)

(cl-defgeneric project-refresh (prj full)
  "Refresh all cached data in PRJ.
If FULL is non-nil, very slow refresh operations may be skipped.")

(defun refresh-project (full)
  "Refresh all cached data in the current project.
With prefix arg, very slow refresh operations may be skipped."
  (interactive "P")
  (project-refresh (project-current) full))

(cl-defgeneric project-select (prj)
  "User has selected PRJ as the active project; take actions to make that so."
  (setq compilation-search-path
	(append (project-roots prj)
		(project-external-roots prj)))
  )

(cl-defgeneric project-deselect (_prj)
  "PRJ is the current project; user has selected another project.
Undo actions done in `project-select'."
  (setq compilation-search-path nil)
  )

(cl-defstruct (ada-project
	       (:constructor nil) ;; no default
	       (:constructor make-ada-project
			     (&key
			      env-vars
			      ada-prj-file
			      file-pred
			      &aux
			      (ada-prj (expand-file-name ada-prj-file))))
	       )
  env-vars ;; a list of (NAME . VALUE)
  ada-prj ;; The ada-mode project file name (absolute).

  file-pred ;; Function taking an absolute file name, returns non-nil
	    ;; if the file should be included in `project-files'.
  )

(defvar ada-project-current nil
  "The current Ada project; an `ada-project' object.")

;;;###autoload
(defun ada-project-current (_dir)
  "Return the project the user has set in `ada-project-current'.
For `project-find-functions'."
   ada-project-current)

(cl-defmethod project-id ((prj ada-project))
  ;; project-id is experimental
  (ada-project-ada-prj prj))

(cl-defmethod project-roots ((_prj ada-project))
  ;; Not meaningful
  nil)

(cl-defmethod project-files ((prj ada-project) &optional dirs)
  (let (result)
    (dolist (dir (or dirs (ada-prj-get 'src_dir)))
      (mapc
       (lambda (absfile)
	 (when (and (not (string-equal "." (substring absfile -1)))
		    (not (string-equal ".." (substring absfile -2)))
		    (not (file-directory-p absfile))
                    (or (null (ada-project-file-pred prj))
			(funcall (ada-project-file-pred prj) absfile)))
	   (push absfile result)))
       (directory-files dir t)))
    result))

(when (not (fboundp 'project--read-file-cpd-relative)) ;; emacs < 27
  (cl-defmethod project-file-completion-table ((prj ada-project) &optional dirs)
    (apply-partially #'uniq-file-completion-table (uniq-file-uniquify (project-files prj dirs)))))

(cl-defmethod project-select ((prj ada-project))
  (dolist (pair (ada-project-env-vars prj))
    (setenv (car pair) (cdr pair)))
  (ada-select-prj-file (ada-project-ada-prj prj)))

(cl-defmethod project-deselect :before ((prj ada-project))
  (ada-deselect-prj (ada-project-ada-prj prj))
  (dolist (pair (ada-project-env-vars prj))
    (setenv (car pair) nil)))

(cl-defmethod project-refresh ((_prj ada-project) full)
  ;; assume prj is current
  (ada-refresh-prj-file)
  (ada-xref-refresh full))

(provide 'ada-project)

;; end of file
