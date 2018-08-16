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
PACKAGES-$(PTXCONF_PYTHON3_ATTRS) += python3-attrs

#
# Paths and names
#
PYTHON3_ATTRS_VERSION	:= 18.1.0
PYTHON3_ATTRS_MD5	:= 3f3f3e0750dab74cfa1dc8b0fd7a5f86
PYTHON3_ATTRS		:= attrs-$(PYTHON3_ATTRS_VERSION)
PYTHON3_ATTRS_SUFFIX	:= tar.gz
PYTHON3_ATTRS_URL	:= https://files.pythonhosted.org/packages/e4/ac/a04671e118b57bee87dabca1e0f2d3bda816b7a551036012d0ca24190e71/$(PYTHON3_ATTRS).$(PYTHON3_ATTRS_SUFFIX)
PYTHON3_ATTRS_SOURCE	:= $(SRCDIR)/$(PYTHON3_ATTRS).$(PYTHON3_ATTRS_SUFFIX)
PYTHON3_ATTRS_DIR	:= $(BUILDDIR)/$(PYTHON3_ATTRS)
PYTHON3_ATTRS_LICENSE	:= MIT License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_ATTRS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-attrs.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-attrs)
	@$(call install_fixup, python3-attrs,PRIORITY,optional)
	@$(call install_fixup, python3-attrs,SECTION,base)
	@$(call install_fixup, python3-attrs,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-attrs,DESCRIPTION,missing)

	@$(call install_glob, python3-attrs, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-attrs)

	@$(call touch)

# vim: syntax=make
