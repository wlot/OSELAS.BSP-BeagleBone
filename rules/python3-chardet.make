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
PACKAGES-$(PTXCONF_PYTHON3_CHARDET) += python3-chardet

#
# Paths and names
#
PYTHON3_CHARDET_VERSION	:= 3.0.4
PYTHON3_CHARDET_MD5	:= 7dd1ba7f9c77e32351b0a0cfacf4055c
PYTHON3_CHARDET		:= chardet-$(PYTHON3_CHARDET_VERSION)
PYTHON3_CHARDET_SUFFIX	:= tar.gz
PYTHON3_CHARDET_URL	:= https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/$(PYTHON3_CHARDET).$(PYTHON3_CHARDET_SUFFIX)
PYTHON3_CHARDET_SOURCE	:= $(SRCDIR)/$(PYTHON3_CHARDET).$(PYTHON3_CHARDET_SUFFIX)
PYTHON3_CHARDET_DIR	:= $(BUILDDIR)/$(PYTHON3_CHARDET)
PYTHON3_CHARDET_LICENSE	:= LGPL

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_CHARDET_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-chardet.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-chardet)
	@$(call install_fixup, python3-chardet,PRIORITY,optional)
	@$(call install_fixup, python3-chardet,SECTION,base)
	@$(call install_fixup, python3-chardet,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-chardet,DESCRIPTION,missing)

	@$(call install_glob, python3-chardet, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-chardet)

	@$(call touch)

# vim: syntax=make
