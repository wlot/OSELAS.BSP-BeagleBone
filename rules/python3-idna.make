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
PACKAGES-$(PTXCONF_PYTHON3_IDNA) += python3-idna

#
# Paths and names
#
PYTHON3_IDNA_VERSION	:= 2.7
PYTHON3_IDNA_MD5	:= 0e5bb69018ddef1b9d95f681182be82c
PYTHON3_IDNA		:= idna-$(PYTHON3_IDNA_VERSION)
PYTHON3_IDNA_SUFFIX	:= tar.gz
PYTHON3_IDNA_URL	:= https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/$(PYTHON3_IDNA).$(PYTHON3_IDNA_SUFFIX)
PYTHON3_IDNA_SOURCE	:= $(SRCDIR)/$(PYTHON3_IDNA).$(PYTHON3_IDNA_SUFFIX)
PYTHON3_IDNA_DIR	:= $(BUILDDIR)/$(PYTHON3_IDNA)
PYTHON3_IDNA_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_IDNA_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-idna.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-idna)
	@$(call install_fixup, python3-idna,PRIORITY,optional)
	@$(call install_fixup, python3-idna,SECTION,base)
	@$(call install_fixup, python3-idna,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-idna,DESCRIPTION,missing)

	@$(call install_glob, python3-idna, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-idna)

	@$(call touch)

# vim: syntax=make
