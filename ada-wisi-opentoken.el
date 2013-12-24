;;; An indentation function for ada-wisi that indents OpenToken
;;; grammar statements nicely.
;;;
;;; This is an example of a user-added indentation rule.
;;
;; In ~/.emacs (or project-specific config):
;; (require 'ada-wisi-opentoken)
;;
;; In each file that declares OpenToken grammars:
;;
;; Local Variables:
;; ada-indent-opentoken: t
;; End:

(require 'ada-mode)
(require 'wisi)

(defcustom ada-indent-opentoken nil
  "If non-nil, apply `ada-wisi-opentoken' indentation rule."
  :type  'boolean
  :group 'ada-indentation
  :safe  'booleanp)
(make-variable-buffer-local 'ada-indent-opentoken)

(defun ada-wisi-opentoken ()
  "Return appropriate indentation (an integer column) for continuation lines in an OpenToken grammar statement."
  ;; We don't do any checking to see if we actually are in an
  ;; OpenToken grammar statement, since this rule should only be
  ;; included in package specs that exist solely to define OpenToken
  ;; grammar fragments.
  (when ada-indent-opentoken
    (save-excursion
      (let ((token-text (nth 1 (wisi-backward-token))))
	(cond
	 ((equal token-text "<=")
	  (back-to-indentation)
	  (+ (current-column) ada-indent-broken))

	 ((member token-text '("+" "&"))
	  (while (not (equal "<=" (nth 1 (wisi-backward-token)))))
	  (back-to-indentation)
	  (+ (current-column) ada-indent-broken))
	 )))))

(defun ada-wisi-opentoken-setup ()
  (add-to-list 'wisi-indent-calculate-functions 'ada-wisi-opentoken))

;; This must be after ada-wisi-setup on ada-mode-hook, because
;; ada-wisi-setup resets wisi-indent-calculate-functions
(add-hook 'ada-mode-hook 'ada-wisi-opentoken-setup t)

(add-to-list 'ada-align-rules
	     '(ada-opentoken
	       (regexp  . "[^=]\\(\\s-*\\)<=")
	       (valid   . (lambda() (not (ada-in-comment-p))))
	       (modes   . '(ada-mode))))

(provide 'ada-wisi-opentoken)
;; end of file
