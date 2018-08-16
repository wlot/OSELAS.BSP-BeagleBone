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
PACKAGES-$(PTXCONF_PYTHON3_AIOHTTP_CORS) += python3-aiohttp-cors

#
# Paths and names
#
PYTHON3_AIOHTTP_CORS_VERSION	:= 0.7.0
PYTHON3_AIOHTTP_CORS_MD5	:= de3940a901b269be82c8bd9f28d53ff0
PYTHON3_AIOHTTP_CORS		:= aiohttp-cors-$(PYTHON3_AIOHTTP_CORS_VERSION)
PYTHON3_AIOHTTP_CORS_SUFFIX	:= tar.gz
PYTHON3_AIOHTTP_CORS_URL	:= https://files.pythonhosted.org/packages/44/9e/6cdce7c3f346d8fd487adf68761728ad8cd5fbc296a7b07b92518350d31f/$(PYTHON3_AIOHTTP_CORS).$(PYTHON3_AIOHTTP_CORS_SUFFIX)
PYTHON3_AIOHTTP_CORS_SOURCE	:= $(SRCDIR)/$(PYTHON3_AIOHTTP_CORS).$(PYTHON3_AIOHTTP_CORS_SUFFIX)
PYTHON3_AIOHTTP_CORS_DIR	:= $(BUILDDIR)/$(PYTHON3_AIOHTTP_CORS)
PYTHON3_AIOHTTP_CORS_LICENSE	:= Apache-2.0

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_AIOHTTP_CORS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-aiohttp-cors.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-aiohttp-cors)
	@$(call install_fixup, python3-aiohttp-cors,PRIORITY,optional)
	@$(call install_fixup, python3-aiohttp-cors,SECTION,base)
	@$(call install_fixup, python3-aiohttp-cors,AUTHOR,"Michael Olbrich <m.olbrich@pengutronix.de>")
	@$(call install_fixup, python3-aiohttp-cors,DESCRIPTION,missing)

	@$(call install_glob, python3-aiohttp-cors, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-aiohttp-cors)

	@$(call touch)

# vim: syntax=make
