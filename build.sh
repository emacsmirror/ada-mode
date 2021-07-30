#!/bin/sh
# Build executables for Ada mode.
#    build.sh <other gprbuild options>
#    e.g. 'build.sh -j0' : use all available processors to compile
#         'build.sh -wn' : treat warnings as warnings.
#         'build.sh -vh' : Verbose output (high verbosity)
#
# See install.sh for install

# As of gnat pro 21, gnat_util is no longer provided or required
echo 'with "gnat_util"; abstract project check is end check;' > check.gpr
gprbuild -P check.gpr > /dev/null 2>&1
if test $? -eq 0 ; then
    HAVE_GNAT_UTIL=yes
else
    HAVE_GNAT_UTIL=no
fi

# support for libadalang is still experimental
gnatprep  -DHAVE_LIBADALANG="no" -DELPA="yes" -DHAVE_GNAT_UTIL=$HAVE_GNAT_UTIL ada_mode_wisi_parse.gpr.gp ada_mode_wisi_parse.gpr

WISI_DIR=`ls -d ../wisi*`

gnatprep -DELPA="yes" $WISI_DIR/wisi.gpr.gp $WISI_DIR/wisi.gpr

# We don't add WISI_DIR to GPR_PROJECT_PATH because the user may have
# already set GPR_PROJECT_PATH.

# Allow running build.sh again, since it often fails the first time.
#  - Run gprclean, to allow changing compilers and other drastic things
#  - Don't delete ada_lr1_parse_table.txt

gprclean -q -r -P ada_mode_wisi_parse.gpr -aP$WISI_DIR

gprbuild -p -j8 -P ada_mode_wisi_parse.gpr -aP $WISI_DIR "$@"

gzip -c -d -q ada_lr1_parse_table.txt.gz > ada_lr1_parse_table.txt

# end of file
