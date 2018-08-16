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
PACKAGES-$(PTXCONF_PYTHON3_CERTIFI) += python3-certifi

#
# Paths and names
#
PYTHON3_CERTIFI_VERSION	:= 2018.8.13
PYTHON3_CERTIFI_MD5	:= a84571995a209dcd00a1702a74302b88
PYTHON3_CERTIFI		:= certifi-$(PYTHON3_CERTIFI_VERSION)
PYTHON3_CERTIFI_SUFFIX	:= tar.gz
PYTHON3_CERTIFI_URL	:= https://files.pythonhosted.org/packages/53/0d/d1d13a63563cc50a27b310f5612645bef06d29a5022a7e79ac659dd0fc50/$(PYTHON3_CERTIFI).$(PYTHON3_CERTIFI_SUFFIX)
PYTHON3_CERTIFI_SOURCE	:= $(SRCDIR)/$(PYTHON3_CERTIFI).$(PYTHON3_CERTIFI_SUFFIX)
PYTHON3_CERTIFI_DIR	:= $(BUILDDIR)/$(PYTHON3_CERTIFI)
PYTHON3_CERTIFI_LICENSE	:= MPL 2.0

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_CERTIFI_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-certifi.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-certifi)
	@$(call install_fixup, python3-certifi,PRIORITY,optional)
	@$(call install_fixup, python3-certifi,SECTION,base)
	@$(call install_fixup, python3-certifi,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-certifi,DESCRIPTION,missing)

	@$(call install_glob, python3-certifi, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-certifi)

	@$(call touch)

# vim: syntax=make
