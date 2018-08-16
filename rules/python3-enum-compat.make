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
PACKAGES-$(PTXCONF_PYTHON3_ENUM_COMPAT) += python3-enum-compat

#
# Paths and names
#
PYTHON3_ENUM_COMPAT_VERSION	:= 0.0.2
PYTHON3_ENUM_COMPAT_MD5		:= 3002940b6620837d0fbc86ec72509be3
PYTHON3_ENUM_COMPAT		:= enum-compat-$(PYTHON3_ENUM_COMPAT_VERSION)
PYTHON3_ENUM_COMPAT_SUFFIX	:= tar.gz
PYTHON3_ENUM_COMPAT_URL		:= https://files.pythonhosted.org/packages/95/6e/26bdcba28b66126f66cf3e4cd03bcd63f7ae330d29ee68b1f6b623550bfa/$(PYTHON3_ENUM_COMPAT).$(PYTHON3_ENUM_COMPAT_SUFFIX)
PYTHON3_ENUM_COMPAT_SOURCE	:= $(SRCDIR)/$(PYTHON3_ENUM_COMPAT).$(PYTHON3_ENUM_COMPAT_SUFFIX)
PYTHON3_ENUM_COMPAT_DIR		:= $(BUILDDIR)/$(PYTHON3_ENUM_COMPAT)
PYTHON3_ENUM_COMPAT_LICENSE	:= MIT License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_ENUM_COMPAT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-enum-compat.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-enum-compat)
	@$(call install_fixup, python3-enum-compat,PRIORITY,optional)
	@$(call install_fixup, python3-enum-compat,SECTION,base)
	@$(call install_fixup, python3-enum-compat,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-enum-compat,DESCRIPTION,missing)

	@$(call install_glob, python3-enum-compat, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-enum-compat)

	@$(call touch)

# vim: syntax=make
