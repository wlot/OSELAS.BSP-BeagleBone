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
PACKAGES-$(PTXCONF_PYTHON3_VOLUPTUOUS) += python3-voluptuous

#
# Paths and names
#
PYTHON3_VOLUPTUOUS_VERSION	:= 0.11.5
PYTHON3_VOLUPTUOUS_MD5		:= 052b52db417a4670c5f0f7387e45ae90
PYTHON3_VOLUPTUOUS		:= voluptuous-$(PYTHON3_VOLUPTUOUS_VERSION)
PYTHON3_VOLUPTUOUS_SUFFIX	:= tar.gz
PYTHON3_VOLUPTUOUS_URL		:= https://files.pythonhosted.org/packages/6e/5e/4e721e30cf175f9e11a5acccf4cd74898c32cae93580308ecd4cf7d2a454/$(PYTHON3_VOLUPTUOUS).$(PYTHON3_VOLUPTUOUS_SUFFIX)
PYTHON3_VOLUPTUOUS_SOURCE	:= $(SRCDIR)/$(PYTHON3_VOLUPTUOUS).$(PYTHON3_VOLUPTUOUS_SUFFIX)
PYTHON3_VOLUPTUOUS_DIR		:= $(BUILDDIR)/$(PYTHON3_VOLUPTUOUS)
PYTHON3_VOLUPTUOUS_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_VOLUPTUOUS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-voluptuous.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-voluptuous)
	@$(call install_fixup, python3-voluptuous,PRIORITY,optional)
	@$(call install_fixup, python3-voluptuous,SECTION,base)
	@$(call install_fixup, python3-voluptuous,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-voluptuous,DESCRIPTION,missing)

	@$(call install_glob, python3-voluptuous, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-voluptuous)

	@$(call touch)

# vim: syntax=make
