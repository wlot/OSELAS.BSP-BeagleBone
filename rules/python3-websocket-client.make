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
PACKAGES-$(PTXCONF_PYTHON3_WEBSOCKET_CLIENT) += python3-websocket-client

#
# Paths and names
#
PYTHON3_WEBSOCKET_CLIENT_VERSION	:= 0.47.0
PYTHON3_WEBSOCKET_CLIENT_MD5		:= 790b3ecb5364293ad70c59a1b92debb1
PYTHON3_WEBSOCKET_CLIENT		:= websocket_client-$(PYTHON3_WEBSOCKET_CLIENT_VERSION)
PYTHON3_WEBSOCKET_CLIENT_SUFFIX		:= tar.gz
PYTHON3_WEBSOCKET_CLIENT_URL		:= https://files.pythonhosted.org/packages/c9/bb/8d3dd9063cfe0cd5d03fe6a1f74ddd948f384e9c1eff0eb978f3976a7d27/$(PYTHON3_WEBSOCKET_CLIENT).$(PYTHON3_WEBSOCKET_CLIENT_SUFFIX)
PYTHON3_WEBSOCKET_CLIENT_SOURCE		:= $(SRCDIR)/$(PYTHON3_WEBSOCKET_CLIENT).$(PYTHON3_WEBSOCKET_CLIENT_SUFFIX)
PYTHON3_WEBSOCKET_CLIENT_DIR		:= $(BUILDDIR)/$(PYTHON3_WEBSOCKET_CLIENT)
PYTHON3_WEBSOCKET_CLIENT_LICENSE	:= LGPL

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_WEBSOCKET_CLIENT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-websocket-client.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-websocket-client)
	@$(call install_fixup, python3-websocket-client,PRIORITY,optional)
	@$(call install_fixup, python3-websocket-client,SECTION,base)
	@$(call install_fixup, python3-websocket-client,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-websocket-client,DESCRIPTION,missing)

	@$(call install_glob, python3-websocket-client, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-websocket-client)

	@$(call touch)

# vim: syntax=make
