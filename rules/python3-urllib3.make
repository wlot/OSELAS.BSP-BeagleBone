# -*-makefile-*-
#
# Copyright (C) 2015 by Andreas Schmidt <mail@schmidt-andreas.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_URLLIB3) += python3-urllib3

#
# Paths and names
#
PYTHON3_URLLIB3_VERSION	:= 1.23
PYTHON3_URLLIB3_MD5	:= 1ad43e4b5ab7a0794c89dc057e1d7179
PYTHON3_URLLIB3		:= urllib3-$(PYTHON3_URLLIB3_VERSION)
PYTHON3_URLLIB3_SUFFIX	:= tar.gz
PYTHON3_URLLIB3_URL	:= https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15/$(PYTHON3_URLLIB3).$(PYTHON3_URLLIB3_SUFFIX)
PYTHON3_URLLIB3_SOURCE	:= $(SRCDIR)/$(PYTHON3_URLLIB3).$(PYTHON3_URLLIB3_SUFFIX)
PYTHON3_URLLIB3_DIR	:= $(BUILDDIR)/$(PYTHON3_URLLIB3)
PYTHON3_URLLIB3_LICENSE	:= MIT License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_URLLIB3_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-urllib3.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-urllib3)
	@$(call install_fixup, python3-urllib3,PRIORITY,optional)
	@$(call install_fixup, python3-urllib3,SECTION,base)
	@$(call install_fixup, python3-urllib3,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-urllib3,DESCRIPTION,missing)

	@$(call install_glob, python3-urllib3, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-urllib3)

	@$(call touch)

# vim: syntax=make
