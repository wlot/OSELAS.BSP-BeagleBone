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
PACKAGES-$(PTXCONF_PYTHON3_XMLTODICT) += python3-xmltodict

#
# Paths and names
#
PYTHON3_XMLTODICT_VERSION	:= 0.11.0
PYTHON3_XMLTODICT_MD5		:= 9f955947db085485873ac68154e88069
PYTHON3_XMLTODICT		:= xmltodict-$(PYTHON3_XMLTODICT_VERSION)
PYTHON3_XMLTODICT_SUFFIX	:= tar.gz
PYTHON3_XMLTODICT_URL		:= https://files.pythonhosted.org/packages/57/17/a6acddc5f5993ea6eaf792b2e6c3be55e3e11f3b85206c818572585f61e1/$(PYTHON3_XMLTODICT).$(PYTHON3_XMLTODICT_SUFFIX)
PYTHON3_XMLTODICT_SOURCE	:= $(SRCDIR)/$(PYTHON3_XMLTODICT).$(PYTHON3_XMLTODICT_SUFFIX)
PYTHON3_XMLTODICT_DIR		:= $(BUILDDIR)/$(PYTHON3_XMLTODICT)
PYTHON3_XMLTODICT_LICENSE	:= MIT License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_XMLTODICT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-xmltodict.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-xmltodict)
	@$(call install_fixup, python3-xmltodict,PRIORITY,optional)
	@$(call install_fixup, python3-xmltodict,SECTION,base)
	@$(call install_fixup, python3-xmltodict,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-xmltodict,DESCRIPTION,missing)

	@$(call install_glob, python3-xmltodict, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-xmltodict)

	@$(call touch)

# vim: syntax=make
