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
PACKAGES-$(PTXCONF_PYTHON3_HOMEASSISTANT) += python3-homeassistant

#
# Paths and names
#
PYTHON3_HOMEASSISTANT_VERSION	:= 0.75.3
PYTHON3_HOMEASSISTANT_MD5	:= 371a390a065d85e363b8480ac67939c4
PYTHON3_HOMEASSISTANT		:= homeassistant-$(PYTHON3_HOMEASSISTANT_VERSION)
PYTHON3_HOMEASSISTANT_SUFFIX	:= tar.gz
PYTHON3_HOMEASSISTANT_URL	:= https://files.pythonhosted.org/packages/8c/6d/b163818d3c14b849323ee4d41e4324de5113770d4d9c23f42a6c42763374/$(PYTHON3_HOMEASSISTANT).$(PYTHON3_HOMEASSISTANT_SUFFIX)
PYTHON3_HOMEASSISTANT_SOURCE	:= $(SRCDIR)/$(PYTHON3_HOMEASSISTANT).$(PYTHON3_HOMEASSISTANT_SUFFIX)
PYTHON3_HOMEASSISTANT_DIR	:= $(BUILDDIR)/$(PYTHON3_HOMEASSISTANT)
PYTHON3_HOMEASSISTANT_LICENSE	:= Apache Software License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_HOMEASSISTANT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------
$(STATEDIR)/python3-homeassistant.install.post:
	@$(call targetinfo)
	@sed -i "s|^#!/.*sysroot-host|#!/usr|" $(PTXDIST_PLATFORMDIR)/packages/$(PYTHON3_HOMEASSISTANT)/usr/bin/hass
	@$(call touch)

$(STATEDIR)/python3-homeassistant.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-homeassistant)
	@$(call install_fixup, python3-homeassistant,PRIORITY,optional)
	@$(call install_fixup, python3-homeassistant,SECTION,base)
	@$(call install_fixup, python3-homeassistant,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-homeassistant,DESCRIPTION,missing)

	@$(call install_glob, python3-homeassistant, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_copy, python3-homeassistant, 0, 0, 755, -, /usr/bin/hass)
	@$(call install_finish, python3-homeassistant)

	@$(call touch)

# vim: syntax=make
