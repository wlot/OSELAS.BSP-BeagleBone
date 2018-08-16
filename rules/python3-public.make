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
PACKAGES-$(PTXCONF_PYTHON3_PUBLIC) += python3-public

#
# Paths and names
#
PYTHON3_PUBLIC_VERSION	:= 1.0.3
PYTHON3_PUBLIC_MD5	:= bcc7d775a7f795aea63dbc1cc6036fed
PYTHON3_PUBLIC		:= public-$(PYTHON3_PUBLIC_VERSION)
PYTHON3_PUBLIC_SUFFIX	:= tar.gz
PYTHON3_PUBLIC_URL	:= https://files.pythonhosted.org/packages/e8/d6/297dc43e6f84fea8f92ba3fdba0c0028a4ffd122fc05ce96ee6ab0cc59f8/$(PYTHON3_PUBLIC).$(PYTHON3_PUBLIC_SUFFIX)
PYTHON3_PUBLIC_SOURCE	:= $(SRCDIR)/$(PYTHON3_PUBLIC).$(PYTHON3_PUBLIC_SUFFIX)
PYTHON3_PUBLIC_DIR	:= $(BUILDDIR)/$(PYTHON3_PUBLIC)
PYTHON3_PUBLIC_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PUBLIC_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-public.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-public)
	@$(call install_fixup, python3-public,PRIORITY,optional)
	@$(call install_fixup, python3-public,SECTION,base)
	@$(call install_fixup, python3-public,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-public,DESCRIPTION,missing)

	@$(call install_glob, python3-public, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-public)

	@$(call touch)

# vim: syntax=make
