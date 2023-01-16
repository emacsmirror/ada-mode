# For compiling ada-mode in elpa worktree

#export Standard_Common_Build := Debug

.PHONY : all force

all : build_executables byte-compile

build_executables : ada_annex_p_re2c.c force
	gprbuild -p -j8 ada_mode_wisi_parse.gpr

../wisi/wisi.gpr : ../wisi/wisi.gpr.gp
	gnatprep -DELPA="yes" ../wisi/wisi.gpr.gp ../wisi/wisi.gpr

%.re2c : %.wy ../wisi/wisitoken-bnf-generate
	../wisi/wisitoken-bnf-generate $(<F)
	dos2unix -q $(*F)-process.el $(*F)_process* $(*F).re2c $(*F)_re2c_c.ads

%_re2c.c : %.re2c
	re2c --no-generation-date --debug-output --input custom -W -Werror --utf-8 -o $@ $<
	dos2unix -q $(*F)_re2c.c

../wisi/wisitoken-bnf-generate : ../wisi/wisi.gpr force
	cd ../wisi; gprbuild -p -j8 -P wisi.gpr wisitoken-bnf-generate

BYTE_COMPILE := "(progn (setq package-load-list '((wisi) (ada-mode) (gnat-compiler) all)) (package-initialize)(setq byte-compile-error-on-warn t)(batch-byte-compile))"
byte-compile : byte-compile-clean
	cd ../wisi; emacs -Q -batch -L . --eval $(BYTE_COMPILE) *.el
	cd ../gnat-compiler; emacs -Q -batch -L . -L ../wisi --eval $(BYTE_COMPILE) *.el
	emacs -Q -batch -L . -L ../wisi -L ../gnat-compiler --eval $(BYTE_COMPILE) *.el

byte-compile-clean :
	cd ..; rm -f *.elc

clean : force
	rm -rf obj *parse_table*

recursive-clean : force
	gprclean -r -P ada_mode_wisi_parse.gpr

# Local Variables:
# eval: (load-file "prj.el")
# End:
# end of file
