# -*-makefile-*-
#
# Copyright (C) 2017 by Pim Klanke <pim@protonic.nl>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_MULTIDICT) += python3-multidict

#
# Paths and names
#
PYTHON3_MULTIDICT_VERSION	:= 4.3.1
PYTHON3_MULTIDICT_MD5		:= 20580d5a39570c6ef81664999514ce65
PYTHON3_MULTIDICT		:= multidict-$(PYTHON3_MULTIDICT_VERSION)
PYTHON3_MULTIDICT_SUFFIX	:= tar.gz
PYTHON3_MULTIDICT_URL		:= https://files.pythonhosted.org/packages/9d/b9/3cf1b908d7af6530209a7a16d71ab2734a736c3cdf0657e3a06d0209811e/$(PYTHON3_MULTIDICT).$(PYTHON3_MULTIDICT_SUFFIX)
PYTHON3_MULTIDICT_SOURCE	:= $(SRCDIR)/$(PYTHON3_MULTIDICT).$(PYTHON3_MULTIDICT_SUFFIX)
PYTHON3_MULTIDICT_DIR		:= $(BUILDDIR)/$(PYTHON3_MULTIDICT)
PYTHON3_MULTIDICT_LICENSE	:= Apache-2.0

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_MULTIDICT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-multidict.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-multidict)
	@$(call install_fixup, python3-multidict, PRIORITY, optional)
	@$(call install_fixup, python3-multidict, SECTION, base)
	@$(call install_fixup, python3-multidict, AUTHOR, "Pim Klanke <pim@protonic.nl>")
	@$(call install_fixup, python3-multidict, DESCRIPTION, missing)

	@$(call install_glob, python3-multidict, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-multidict)

	@$(call touch)

# vim: syntax=make
