;;; Implement current Emacs features not present in Emacs 23.4

(defvar compilation-filter-start (make-marker)
  "")

(defun compilation-filter-start (proc)
  ""
  (set-marker compilation-filter-start (point-max)))

(defun compilation--put-prop (matchnum prop val)
  (when (and (integerp matchnum) (match-beginning matchnum))
    (put-text-property
     (match-beginning matchnum) (match-end matchnum)
     prop val)))

;; FIXME: emacs 24.x manages compilation-filter-start, emacs 23.4 does not
;;
;; gnat-core.el gnat-prj-parse-emacs-final needs:
;;    (add-hook 'compilation-start-hook 'ada-gnat-compilation-start))
;;
;; ada-gnat.el ada-gnat-compilation-filter needs:
;;    (set-marker compilation-filter-start (point)))

;; end of file
