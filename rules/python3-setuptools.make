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
PACKAGES-$(PTXCONF_PYTHON3_SETUPTOOLS) += python3-setuptools

#
# Paths and names
#
PYTHON3_SETUPTOOLS_VERSION	:= 40.0.0
PYTHON3_SETUPTOOLS_MD5		:= 260630ae1a64bafa39dcc53404d63829
PYTHON3_SETUPTOOLS		:= setuptools-$(PYTHON3_SETUPTOOLS_VERSION)
PYTHON3_SETUPTOOLS_SUFFIX	:= zip
PYTHON3_SETUPTOOLS_URL		:= https://files.pythonhosted.org/packages/d3/3e/1d74cdcb393b68ab9ee18d78c11ae6df8447099f55fe86ee842f9c5b166c/$(PYTHON3_SETUPTOOLS).$(PYTHON3_SETUPTOOLS_SUFFIX)
PYTHON3_SETUPTOOLS_SOURCE	:= $(SRCDIR)/$(PYTHON3_SETUPTOOLS).$(PYTHON3_SETUPTOOLS_SUFFIX)
PYTHON3_SETUPTOOLS_DIR		:= $(BUILDDIR)/$(PYTHON3_SETUPTOOLS)
PYTHON3_SETUPTOOLS_LICENSE	:= MIT License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_SETUPTOOLS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-setuptools.install.post:
	@$(call targetinfo)
	@sed -i "s|^#!/.*sysroot-host|#!/usr|" $(PTXDIST_PLATFORMDIR)/packages/$(PYTHON3_SETUPTOOLS)/usr/bin/easy_install
	@sed -i "s|^#!/.*sysroot-host|#!/usr|" $(PTXDIST_PLATFORMDIR)/packages/$(PYTHON3_SETUPTOOLS)/usr/bin/easy_install-3.5
	@$(call touch)


$(STATEDIR)/python3-setuptools.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-setuptools)
	@$(call install_fixup, python3-setuptools,PRIORITY,optional)
	@$(call install_fixup, python3-setuptools,SECTION,base)
	@$(call install_fixup, python3-setuptools,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-setuptools,DESCRIPTION,missing)

	@$(call install_glob, python3-setuptools, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_copy, python3-setuptools, 0, 0, 0775, -, /usr/bin/easy_install)
	@$(call install_copy, python3-setuptools, 0, 0, 0775, -, /usr/bin/easy_install-3.5)

	@$(call install_finish, python3-setuptools)

	@$(call touch)

# vim: syntax=make
