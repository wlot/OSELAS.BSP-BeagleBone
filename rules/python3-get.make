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
PACKAGES-$(PTXCONF_PYTHON3_GET) += python3-get

#
# Paths and names
#
PYTHON3_GET_VERSION	:= 1.0.3
PYTHON3_GET_MD5		:= 2a906865e961158e78fba51b19fcce5a
PYTHON3_GET		:= get-$(PYTHON3_GET_VERSION)
PYTHON3_GET_SUFFIX	:= tar.gz
PYTHON3_GET_URL		:= https://files.pythonhosted.org/packages/dc/bd/264e65844b66e2b5fa829f3f6c526056ee14a0508fb6b454e0af4105a21c/$(PYTHON3_GET).$(PYTHON3_GET_SUFFIX)
PYTHON3_GET_SOURCE	:= $(SRCDIR)/$(PYTHON3_GET).$(PYTHON3_GET_SUFFIX)
PYTHON3_GET_DIR		:= $(BUILDDIR)/$(PYTHON3_GET)
PYTHON3_GET_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_GET_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-get.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-get)
	@$(call install_fixup, python3-get,PRIORITY,optional)
	@$(call install_fixup, python3-get,SECTION,base)
	@$(call install_fixup, python3-get,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-get,DESCRIPTION,missing)

	@$(call install_glob, python3-get, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-get)

	@$(call touch)

# vim: syntax=make
