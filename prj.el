;; Emacs wisi project definitions for compiling ada-mode in ELPA workspace
;;
;; Copyright (C) 2021, 2022  Free Software Foundation, Inc.

(let ((wisi-core (expand-file-name "../wisi")))

  (wisi-prj-select-cache
   "ada_mode.prj"
   (create-ada-prj
    :name "ada_mode elpa"
    :compile-env
    (list
     (concat "WISI=" wisi-core)))
   "Makefile"
   ))

(ada-parse-require-process) ;; slow start due to lr1 parse table
;; end of file
