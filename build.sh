#!/bin/sh
# Build executables for Ada mode.
#
# See install.sh for install

# In December 2016, GNATCOLL changed its Xref interface. First, the
# GPR was split out; and second, one of the subprogram
# interfaces.changed.
#
# Determine whether the split-out gnatcoll_xref.gpr is available.
echo 'with "gnatcoll_xref"; abstract project check_xref is end check_xref;' > check_xref.gpr;
gprbuild -P check_xref.gpr > /dev/null 2>&1;
if test $? -eq 0 ; then HAVE_GNATCOLL_XREF="yes"; else HAVE_GNATCOLL_XREF="no"; fi

echo "HAVE_GNATCOLL_XREF=$HAVE_GNATCOLL_XREF"

gnatprep -DHAVE_GNATCOLL_XREF=$HAVE_GNATCOLL_XREF gpr_query-process_refresh.adb.gp gpr_query-process_refresh.adb

# support for libadalang is still experimental
gnatprep -DHAVE_GNATCOLL_XREF=$HAVE_GNATCOLL_XREF -DHAVE_LIBADALANG="no" -DELPA="yes" ada_mode_wisi_parse.gpr.gp ada_mode_wisi_parse.gpr

export GPR_PROJECT_PATH="../wisi-3.0.1"

gnatprep -DELPA="yes" $GPR_PROJECT_PATH/wisi.gpr.gp $GPR_PROJECT_PATH/wisi.gpr

gprbuild -p -j8 -P ada_mode_wisi_parse.gpr
gzip -d -q ada_lr1_parse_table.txt.gz

# end of file
