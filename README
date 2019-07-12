Emacs Ada mode version 6.1.1

Ada mode provides auto-casing, fontification, navigation, and
indentation for Ada source code files.

Cross-reference information output by the compiler is used to provide
powerful code navigation (jump to definition, find all uses, etc). By
default, only the AdaCore GNAT compiler is supported; other compilers
can be supported. Ada mode uses gpr_query to query compiler-generated
cross reference information. gpr_query is provided as Ada source code
that must be compiled and installed; see ada-mode.info section
Installation for instructions.

Ada mode will be automatically loaded when you open a file
with a matching extension (default *.ads, *.adb).

Ada mode uses project files to define large (multi-directory)
projects, and to define casing exceptions.

Ada mode uses a parser to provide fontification, navigation, and
indentation. There are two parsers provided:

- elisp, which can be slow on large files, and does not recover from
  syntax errors.

- process, which is implemented in Ada, is fast enough for reasonably
  large files, supports partial parse for very large files (see
  wisi-partial-parse-threshold), and recovers from almost all syntax
  errors. The 'process' parser must be compiled; see ada-mode.info
  section "process parser".

See ada-mode.info for help on using and customizing Ada mode, and
notes for Ada mode developers.

