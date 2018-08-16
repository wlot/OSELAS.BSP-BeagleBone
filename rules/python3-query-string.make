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
PACKAGES-$(PTXCONF_PYTHON3_QUERY_STRING) += python3-query_string

#
# Paths and names
#
PYTHON3_QUERY_STRING_VERSION	:= 1.0.2
PYTHON3_QUERY_STRING_MD5	:= b119d93bef81ec0eba37d6749ddd14fa
PYTHON3_QUERY_STRING		:= query_string-$(PYTHON3_QUERY_STRING_VERSION)
PYTHON3_QUERY_STRING_SUFFIX	:= tar.gz
PYTHON3_QUERY_STRING_URL	:= https://files.pythonhosted.org/packages/be/2d/719132c49c715743afff3781e04489cd21189914a563b56837f891fd02ac/$(PYTHON3_QUERY_STRING).$(PYTHON3_QUERY_STRING_SUFFIX)
PYTHON3_QUERY_STRING_SOURCE	:= $(SRCDIR)/$(PYTHON3_QUERY_STRING).$(PYTHON3_QUERY_STRING_SUFFIX)
PYTHON3_QUERY_STRING_DIR	:= $(BUILDDIR)/$(PYTHON3_QUERY_STRING)
PYTHON3_QUERY_STRING_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_QUERY_STRING_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-query_string.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-query_string)
	@$(call install_fixup, python3-query_string,PRIORITY,optional)
	@$(call install_fixup, python3-query_string,SECTION,base)
	@$(call install_fixup, python3-query_string,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-query_string,DESCRIPTION,missing)

	@$(call install_glob, python3-query_string, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-query_string)

	@$(call touch)

# vim: syntax=make
