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
PACKAGES-$(PTXCONF_PYTHON3_REQUESTS) += python3-requests

#
# Paths and names
#
PYTHON3_REQUESTS_VERSION	:= 2.19.1
PYTHON3_REQUESTS_MD5		:= 6c1a31afec9d614e2e71a91ee6ca2878
PYTHON3_REQUESTS		:= requests-$(PYTHON3_REQUESTS_VERSION)
PYTHON3_REQUESTS_SUFFIX		:= tar.gz
PYTHON3_REQUESTS_URL		:= https://files.pythonhosted.org/packages/54/1f/782a5734931ddf2e1494e4cd615a51ff98e1879cbe9eecbdfeaf09aa75e9/$(PYTHON3_REQUESTS).$(PYTHON3_REQUESTS_SUFFIX)
PYTHON3_REQUESTS_SOURCE		:= $(SRCDIR)/$(PYTHON3_REQUESTS).$(PYTHON3_REQUESTS_SUFFIX)
PYTHON3_REQUESTS_DIR		:= $(BUILDDIR)/$(PYTHON3_REQUESTS)
PYTHON3_REQUESTS_LICENSE	:= Apache 2.0

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_REQUESTS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-requests.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-requests)
	@$(call install_fixup, python3-requests,PRIORITY,optional)
	@$(call install_fixup, python3-requests,SECTION,base)
	@$(call install_fixup, python3-requests,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-requests,DESCRIPTION,missing)

	@$(call install_glob, python3-requests, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-requests)

	@$(call touch)

# vim: syntax=make
