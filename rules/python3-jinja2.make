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
PACKAGES-$(PTXCONF_PYTHON3_JINJA2) += python3-jinja2

#
# Paths and names
#
PYTHON3_JINJA2_VERSION	:= 2.10
PYTHON3_JINJA2_MD5	:= 61ef1117f945486472850819b8d1eb3d
PYTHON3_JINJA2		:= Jinja2-$(PYTHON3_JINJA2_VERSION)
PYTHON3_JINJA2_SUFFIX	:= tar.gz
PYTHON3_JINJA2_URL	:= https://files.pythonhosted.org/packages/56/e6/332789f295cf22308386cf5bbd1f4e00ed11484299c5d7383378cf48ba47/$(PYTHON3_JINJA2).$(PYTHON3_JINJA2_SUFFIX)
PYTHON3_JINJA2_SOURCE	:= $(SRCDIR)/$(PYTHON3_JINJA2).$(PYTHON3_JINJA2_SUFFIX)
PYTHON3_JINJA2_DIR	:= $(BUILDDIR)/$(PYTHON3_JINJA2)
PYTHON3_JINJA2_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-jinja2.prepare:
	@rm -rf $(PYTHON3_JINJA2_DIR)/jinja2/async*.py
	@$(call touch)

PYTHON3_JINJA2_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-jinja2.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-jinja2)
	@$(call install_fixup, python3-jinja2,PRIORITY,optional)
	@$(call install_fixup, python3-jinja2,SECTION,base)
	@$(call install_fixup, python3-jinja2,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-jinja2,DESCRIPTION,missing)

	@$(call install_glob, python3-jinja2, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-jinja2)

	@$(call touch)

# vim: syntax=make
