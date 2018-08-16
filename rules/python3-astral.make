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
PACKAGES-$(PTXCONF_PYTHON3_ASTRAL) += python3-astral

#
# Paths and names
#
PYTHON3_ASTRAL_VERSION	:= 1.6.1
PYTHON3_ASTRAL_MD5	:= aba71f67f71c0ff1a3e1cab8cf628740
PYTHON3_ASTRAL		:= astral-$(PYTHON3_ASTRAL_VERSION)
PYTHON3_ASTRAL_SUFFIX	:= tar.gz
PYTHON3_ASTRAL_URL	:= https://files.pythonhosted.org/packages/cc/cc/65ca157e967756a8f08b1cf1c0a1a30c83ed32c50dbe83c557874ce101ca/$(PYTHON3_ASTRAL).$(PYTHON3_ASTRAL_SUFFIX)
PYTHON3_ASTRAL_SOURCE	:= $(SRCDIR)/$(PYTHON3_ASTRAL).$(PYTHON3_ASTRAL_SUFFIX)
PYTHON3_ASTRAL_DIR	:= $(BUILDDIR)/$(PYTHON3_ASTRAL)
PYTHON3_ASTRAL_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_ASTRAL_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-astral.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-astral)
	@$(call install_fixup, python3-astral,PRIORITY,optional)
	@$(call install_fixup, python3-astral,SECTION,base)
	@$(call install_fixup, python3-astral,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-astral,DESCRIPTION,missing)

	@$(call install_glob, python3-astral, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-astral)

	@$(call touch)

# vim: syntax=make
