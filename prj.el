;; Emacs wisi project definitions for compiling ada-mode in ELPA workspace
;;
;; Copyright (C) 2021  Free Software Foundation, Inc.

(let ((wisi-core (expand-file-name "../wisi")))

  (wisi-prj-select-cache
   "ada_mode.prj"
   (wisi-prj-default ;; for ada-build prj vars
    (create-ada-prj
    :name "ada_mode elpa"
    :compile-env
    (list
     (concat "WISI=" wisi-core))))
   "Makefile"
   ))

(wisi-prj-delete "ada_mode elpa")

;; end of file
