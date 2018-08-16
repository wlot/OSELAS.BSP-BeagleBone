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
PACKAGES-$(PTXCONF_PYTHON3_NETIFACES) += python3-netifaces

#
# Paths and names
#
PYTHON3_NETIFACES_VERSION	:= 0.10.6
PYTHON3_NETIFACES_MD5		:= 1d424cb5ef52907c5ab913011122a98b
PYTHON3_NETIFACES		:= netifaces-$(PYTHON3_NETIFACES_VERSION)
PYTHON3_NETIFACES_SUFFIX	:= tar.gz
PYTHON3_NETIFACES_URL		:= https://files.pythonhosted.org/packages/72/01/ba076082628901bca750bf53b322a8ff10c1d757dc29196a8e6082711c9d/$(PYTHON3_NETIFACES).$(PYTHON3_NETIFACES_SUFFIX)
PYTHON3_NETIFACES_SOURCE	:= $(SRCDIR)/$(PYTHON3_NETIFACES).$(PYTHON3_NETIFACES_SUFFIX)
PYTHON3_NETIFACES_DIR		:= $(BUILDDIR)/$(PYTHON3_NETIFACES)
PYTHON3_NETIFACES_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_NETIFACES_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-netifaces.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-netifaces)
	@$(call install_fixup, python3-netifaces,PRIORITY,optional)
	@$(call install_fixup, python3-netifaces,SECTION,base)
	@$(call install_fixup, python3-netifaces,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-netifaces,DESCRIPTION,missing)

	@$(call install_glob, python3-netifaces, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-netifaces)

	@$(call touch)

# vim: syntax=make
