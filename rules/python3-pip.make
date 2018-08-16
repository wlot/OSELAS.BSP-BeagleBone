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
PACKAGES-$(PTXCONF_PYTHON3_PIP) += python3-pip

#
# Paths and names
#
PYTHON3_PIP_VERSION	:= 18.0
PYTHON3_PIP_MD5		:= 52f75ceb21e96c258f289859a2996b60
PYTHON3_PIP		:= pip-$(PYTHON3_PIP_VERSION)
PYTHON3_PIP_SUFFIX	:= tar.gz
PYTHON3_PIP_URL		:= https://files.pythonhosted.org/packages/69/81/52b68d0a4de760a2f1979b0931ba7889202f302072cc7a0d614211bc7579/$(PYTHON3_PIP).$(PYTHON3_PIP_SUFFIX)
PYTHON3_PIP_SOURCE	:= $(SRCDIR)/$(PYTHON3_PIP).$(PYTHON3_PIP_SUFFIX)
PYTHON3_PIP_DIR		:= $(BUILDDIR)/$(PYTHON3_PIP)
PYTHON3_PIP_LICENSE	:= MIT License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PIP_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pip.install.post:
	@$(call targetinfo)
	@sed -i "s|/home/andreas/project/platform-beaglebone/sysroot-host|/usr|" $(PTXDIST_PLATFORMDIR)/packages/$(PYTHON3_PIP)/usr/bin/pip
	@sed -i "s|/home/andreas/project/platform-beaglebone/sysroot-host|/usr|" $(PTXDIST_PLATFORMDIR)/packages/$(PYTHON3_PIP)/usr/bin/pip3
	@sed -i "s|/home/andreas/project/platform-beaglebone/sysroot-host|/usr|" $(PTXDIST_PLATFORMDIR)/packages/$(PYTHON3_PIP)/usr/bin/pip3.5
	@$(call touch)

$(STATEDIR)/python3-pip.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pip)
	@$(call install_fixup, python3-pip,PRIORITY,optional)
	@$(call install_fixup, python3-pip,SECTION,base)
	@$(call install_fixup, python3-pip,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-pip,DESCRIPTION,missing)

	@$(call install_glob, python3-pip, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_copy, python3-pip, 0, 0, 755, -, /usr/bin/pip)
	@$(call install_copy, python3-pip, 0, 0, 755, -, /usr/bin/pip3)
	@$(call install_copy, python3-pip, 0, 0, 755, -, /usr/bin/pip3.5)

	@$(call install_finish, python3-pip)

	@$(call touch)

# vim: syntax=make
