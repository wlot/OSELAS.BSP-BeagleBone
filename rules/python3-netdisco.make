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
PACKAGES-$(PTXCONF_PYTHON3_NETDISCO) += python3-netdisco

#
# Paths and names
#
PYTHON3_NETDISCO_VERSION	:= 1.5.0
PYTHON3_NETDISCO_MD5		:= 128877a483729f0698f6ca054fbecbb2
PYTHON3_NETDISCO		:= netdisco-$(PYTHON3_NETDISCO_VERSION)
PYTHON3_NETDISCO_SUFFIX		:= tar.gz
PYTHON3_NETDISCO_URL		:= https://files.pythonhosted.org/packages/e9/13/07f0c4b101eb46cb681bd931dccf0a759a34f6be1287af068f4ee24d4d26/$(PYTHON3_NETDISCO).$(PYTHON3_NETDISCO_SUFFIX)
PYTHON3_NETDISCO_SOURCE		:= $(SRCDIR)/$(PYTHON3_NETDISCO).$(PYTHON3_NETDISCO_SUFFIX)
PYTHON3_NETDISCO_DIR		:= $(BUILDDIR)/$(PYTHON3_NETDISCO)
PYTHON3_NETDISCO_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_NETDISCO_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-netdisco.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-netdisco)
	@$(call install_fixup, python3-netdisco,PRIORITY,optional)
	@$(call install_fixup, python3-netdisco,SECTION,base)
	@$(call install_fixup, python3-netdisco,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-netdisco,DESCRIPTION,missing)

	@$(call install_glob, python3-netdisco, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-netdisco)

	@$(call touch)

# vim: syntax=make
