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
PACKAGES-$(PTXCONF_PYTHON3_ZEROCONF) += python3-zeroconf

#
# Paths and names
#
PYTHON3_ZEROCONF_VERSION	:= 0.20.0
PYTHON3_ZEROCONF_MD5		:= 23124285dbdfcf3cb9cca11b98216cf7
PYTHON3_ZEROCONF		:= zeroconf-$(PYTHON3_ZEROCONF_VERSION)
PYTHON3_ZEROCONF_SUFFIX		:= tar.gz
PYTHON3_ZEROCONF_URL		:= https://files.pythonhosted.org/packages/20/d7/418ff6c684ace0f5855ec56c66cfa99ec50443c41693b91e9abcccfa096c/$(PYTHON3_ZEROCONF).$(PYTHON3_ZEROCONF_SUFFIX)
PYTHON3_ZEROCONF_SOURCE		:= $(SRCDIR)/$(PYTHON3_ZEROCONF).$(PYTHON3_ZEROCONF_SUFFIX)
PYTHON3_ZEROCONF_DIR		:= $(BUILDDIR)/$(PYTHON3_ZEROCONF)
PYTHON3_ZEROCONF_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_ZEROCONF_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-zeroconf.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-zeroconf)
	@$(call install_fixup, python3-zeroconf,PRIORITY,optional)
	@$(call install_fixup, python3-zeroconf,SECTION,base)
	@$(call install_fixup, python3-zeroconf,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-zeroconf,DESCRIPTION,missing)

	@$(call install_glob, python3-zeroconf, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-zeroconf)

	@$(call touch)

# vim: syntax=make
