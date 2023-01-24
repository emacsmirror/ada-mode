# For compiling ada-mode Ada with Alire

STEPHES_ADA_LIBRARY_ALIRE_PREFIX ?= $(CURDIR)/../org.stephe_leake.sal
WISITOKEN_ALIRE_PREFIX ?= $(CURDIR)/../org.wisitoken

include $(STEPHES_ADA_LIBRARY_ALIRE_PREFIX)/build/alire_rules.make
include $(WISITOKEN_ALIRE_PREFIX)/build/wisitoken_alire_rules.make

# Local Variables:
# eval: (load-file "prj.el")
# End:
