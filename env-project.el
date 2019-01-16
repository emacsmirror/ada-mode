;;; env-project.el --- provide a root project type that holds a list of env vars  -*- lexical-binding:t -*-
;;
;; Copyright (C) 2017, 2019  Free Software Foundation, Inc.
;;
;; Author: Stephen Leake <stephen_leake@stephe-leake.org>
;; Maintainer: Stephen Leake <stephen_leake@stephe-leake.org>
;; Keywords: projects
;; Version: 0
;; package-requires: ((emacs "25.0"))
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
(require 'cl-generic)
(require 'project)

(eval-and-compile
  (unless (fboundp 'refresh-project)
  ;; In emacs 27

  (cl-defgeneric project-refresh (prj)
    "Refresh all cached data in PRJ.")

  (defun refresh-project ()
    (interactive)
    (project-refresh (project-current)))

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
  ))

(cl-defstruct env-project
  env-vars ;; a list of (NAME . VALUE)
  )

(cl-defmethod project-select :before ((prj env-project))
  "Set the project env vars in ’process-environment’."
  (dolist (pair (env-project-env-vars prj))
    (setenv (car pair) (cdr pair))))

(cl-defmethod project-deselect :after ((prj env-project))
  "Unset the project env vars in ’process-environment’."
  (dolist (pair (env-project-env-vars prj))
    (setenv (car pair) nil)))

(provide 'env-project)
;; end of file
