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
PACKAGES-$(PTXCONF_PYTHON3_MARKUPSAFE) += python3-markupsafe

#
# Paths and names
#
PYTHON3_MARKUPSAFE_VERSION	:= 1.0
PYTHON3_MARKUPSAFE_MD5		:= 2fcedc9284d50e577b5192e8e3578355
PYTHON3_MARKUPSAFE		:= MarkupSafe-$(PYTHON3_MARKUPSAFE_VERSION)
PYTHON3_MARKUPSAFE_SUFFIX	:= tar.gz
PYTHON3_MARKUPSAFE_URL		:= https://files.pythonhosted.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/$(PYTHON3_MARKUPSAFE).$(PYTHON3_MARKUPSAFE_SUFFIX)
PYTHON3_MARKUPSAFE_SOURCE	:= $(SRCDIR)/$(PYTHON3_MARKUPSAFE).$(PYTHON3_MARKUPSAFE_SUFFIX)
PYTHON3_MARKUPSAFE_DIR		:= $(BUILDDIR)/$(PYTHON3_MARKUPSAFE)
PYTHON3_MARKUPSAFE_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_MARKUPSAFE_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-markupsafe.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-markupsafe)
	@$(call install_fixup, python3-markupsafe,PRIORITY,optional)
	@$(call install_fixup, python3-markupsafe,SECTION,base)
	@$(call install_fixup, python3-markupsafe,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-markupsafe,DESCRIPTION,missing)

	@$(call install_glob, python3-markupsafe, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-markupsafe)

	@$(call touch)

# vim: syntax=make
