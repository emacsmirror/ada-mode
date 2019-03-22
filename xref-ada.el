;; xref-ada.el --- ada-mode backend for xref.el -*-lexical-binding:t-*-
;;
;; Copyright (C) 2018 - 2019  Free Software Foundation, Inc.

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

;;; Code:

(require 'xref)

(defun xref-ada-find-backend ()
  'xref-ada)

(cl-defmethod xref-backend-definitions ((_backend (eql xref-ada)) identifier)
  (let* ((t-prop (get-text-property 0 'xref-identifier identifier))
	 ;; If t-prop is non-nil: identifier is from
	 ;; identifier-at-point, the desired location is the ’other’
	 ;; (spec/body).
	 ;;
	 ;; If t-prop is nil: identifier is from prompt/completion,
	 ;; the line number may be included in the identifier
	 ;; wrapped in <>, and the desired file is the current file.
	 (ident
	  (if t-prop
	      (substring-no-properties identifier 0 nil)
	    (string-match "\\([^<]*\\)\\(?:<\\([0-9]+\\)>\\)?" identifier)
	    (match-string 1 identifier)
	    ))
	 (file
	  (if t-prop
	      (plist-get t-prop ':file)
	    (buffer-file-name)))
	 (line
	  (if t-prop
	      (plist-get t-prop ':line)
	    (when (match-string 2 identifier)
	      (string-to-number (match-string 2 identifier)))))
	 (column
	  (if t-prop
	      (plist-get t-prop ':column)
	    0))
	 )

    (if t-prop
	(progn
	  (ada-check-current-project file)

	  (when (null ada-xref-other-function)
	    (error "no cross reference information available"))

	  (let ((target
		 (funcall
		  ada-xref-other-function
		  ident file line column)))
	    ;; IMPROVEME: when drop support for emacs 24, change
	    ;; ada-xref-other-function to return xref-file-location
	    (list
	     (xref-make
	      ident
	      (xref-make-file-location
	       (nth 0 target) ;; file
	       (nth 1 target) ;; line
	       (nth 2 target)) ;; column
	      ))))

      (list (xref-make ident (xref-make-file-location file line column)))
      )))

(cl-defmethod xref-backend-identifier-at-point ((_backend (eql xref-ada)))
  (save-excursion
    (condition-case nil
	(let ((ident (ada-identifier-at-point))) ;; moves point to start of ident
	  (put-text-property
	   0 1
	   'xref-identifier
	   (list ':file (buffer-file-name)
		 ':line (line-number-at-pos)
		 ':column (current-column))
	   ident)
	  ident)
	(error
	 ;; from ada-identifier-at-point; no identifier
	 nil))))

(cl-defmethod xref-backend-identifier-completion-table ((_backend (eql xref-ada)))
  (wisi-validate-cache (point-min) (point-max) t 'navigate)
  (save-excursion
    (let ((table nil)
	  cache)
      (goto-char (point-min))
      (while (not (eobp))
	(setq cache (wisi-forward-find-cache-token '(IDENTIFIER name )(point-max)))
	(cond
	 ((null cache)
	  ;; eob
	  )

	 ((memq (wisi-cache-nonterm cache)
		'(abstract_subprogram_declaration
		  entry_body
		  entry_declaration
		  exception_declaration
		  function_specification
		  full_type_declaration
		  generic_declaration
		  generic_instantiation
		  null_procedure_declaration
		  object_declaration
		  object_renaming_declaration
		  private_extension_declaration
		  private_type_declaration
		  procedure_specification
		  protected_declaration
		  protected_type_declaration
		  package_specification
		  subtype_declaration
		  task_declaration
		  task_type_declaration
		  type_declaration))
	  ;; We can’t store location data in a string text property -
	  ;; it does not survive completion. So we include the line
	  ;; number in the identifier string. This also serves to
	  ;; disambiguate overloaded identifiers.
	  (push
	   (format "%s<%d>"
	    (wisi-cache-text cache)
	    (line-number-at-pos))
	   table))
	 ))
      table)))

(define-minor-mode xref-ada-mode ()
  "Use xref-ada functions."
  :init-value t
  ;; The macro code sets the mode variable to the new value before we get here.
  (if xref-ada-mode
      (add-hook 'xref-backend-functions #'xref-ada-find-backend nil t)
    (remove-hook 'xref-backend-functions #'xref-ada-find-backend t)))

(add-hook 'ada-mode-hook #'xref-ada-mode)

(provide 'xref-ada)
