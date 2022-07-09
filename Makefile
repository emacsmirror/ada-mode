# For compiling ada-mode Ada code in elpa worktree

export Standard_Common_Build := Debug

.PHONY : all force

all : build_executables

Makefile.conf : create_makefile_conf.sh
	$(SHELL) -c ./create_makefile_conf.sh

include Makefile.conf

build_executables : ada_mode_wisi_parse.gpr gpr_re2c.c ada_annex_p_re2c.c force
	gprbuild -p -j8 ada_mode_wisi_parse.gpr

../wisi/wisi.gpr : ../wisi/wisi.gpr.gp
	gnatprep -DELPA="yes" ../wisi/wisi.gpr.gp ../wisi/wisi.gpr

ada_mode_wisi_parse.gpr : ada_mode_wisi_parse.gpr.gp ../wisi/wisi.gpr
	gnatprep -DELPA="yes" -DHAVE_GNAT_UTIL=$(HAVE_GNAT_UTIL) -DHAVE_LIBADALANG=$(HAVE_LIBADALANG) $< $@

%.re2c : %.wy ../wisi/wisitoken-bnf-generate
	../wisi/wisitoken-bnf-generate --time $(<F)
	dos2unix -q $(*F)-process.el $(*F)_process* $(*F).re2c $(*F)_re2c_c.ads

%_re2c.c : %.re2c
	re2c --no-generation-date --debug-output --input custom -W -Werror --utf-8 -o $@ $<
	dos2unix -q $(*F)_re2c.c

../wisi/wisitoken-bnf-generate : ../wisi/wisi.gpr force
	cd ../wisi; gprbuild -p -j8 -P wisi.gpr wisitoken-bnf-generate

recursive-clean : force
	gprclean -r -P ada_mode_wisi_parse.gpr

# Local Variables:
# eval: (load-file "prj.el")
# End:
# end of file
