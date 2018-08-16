# -*-makefile-*-
#
# Copyright (C) 2015 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_AIOHTTP) += python3-aiohttp

#
# Paths and names
#
PYTHON3_AIOHTTP_VERSION	:= 3.3.2
PYTHON3_AIOHTTP_MD5	:= dfaadf259d1f677a286d203e9470d2a0
PYTHON3_AIOHTTP		:= aiohttp-$(PYTHON3_AIOHTTP_VERSION)
PYTHON3_AIOHTTP_SUFFIX	:= tar.gz
PYTHON3_AIOHTTP_URL	:= https://files.pythonhosted.org/packages/72/6a/5bbf3544fe8de525f4521506b372dc9c3b13070fe34e911c976aa95631d7/$(PYTHON3_AIOHTTP).$(PYTHON3_AIOHTTP_SUFFIX)
PYTHON3_AIOHTTP_SOURCE	:= $(SRCDIR)/$(PYTHON3_AIOHTTP).$(PYTHON3_AIOHTTP_SUFFIX)
PYTHON3_AIOHTTP_DIR	:= $(BUILDDIR)/$(PYTHON3_AIOHTTP)
PYTHON3_AIOHTTP_LICENSE	:= Apache-2.0

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_AIOHTTP_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-aiohttp.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-aiohttp)
	@$(call install_fixup, python3-aiohttp,PRIORITY,optional)
	@$(call install_fixup, python3-aiohttp,SECTION,base)
	@$(call install_fixup, python3-aiohttp,AUTHOR,"Michael Olbrich <m.olbrich@pengutronix.de>")
	@$(call install_fixup, python3-aiohttp,DESCRIPTION,missing)

	@$(call install_glob, python3-aiohttp, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-aiohttp)

	@$(call touch)

# vim: syntax=make
