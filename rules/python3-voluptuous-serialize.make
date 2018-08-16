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
PACKAGES-$(PTXCONF_PYTHON3_VOLUPTUOUS_SERIALIZE) += python3-voluptuous-serialize

#
# Paths and names
#
PYTHON3_VOLUPTUOUS_SERIALIZE_VERSION	:= 1.0.0
PYTHON3_VOLUPTUOUS_SERIALIZE_MD5	:= c5f2122b382093f564217d6f91f22f05
PYTHON3_VOLUPTUOUS_SERIALIZE		:= voluptuous-serialize-$(PYTHON3_VOLUPTUOUS_SERIALIZE_VERSION)
PYTHON3_VOLUPTUOUS_SERIALIZE_SUFFIX	:= tar.gz
PYTHON3_VOLUPTUOUS_SERIALIZE_URL	:= https://files.pythonhosted.org/packages/de/b1/05ecafb24e6f1220c90418ddbeffbc217b0c61052648ebb9aa6fc5bfd559/$(PYTHON3_VOLUPTUOUS_SERIALIZE).$(PYTHON3_VOLUPTUOUS_SERIALIZE_SUFFIX)
PYTHON3_VOLUPTUOUS_SERIALIZE_SOURCE	:= $(SRCDIR)/$(PYTHON3_VOLUPTUOUS_SERIALIZE).$(PYTHON3_VOLUPTUOUS_SERIALIZE_SUFFIX)
PYTHON3_VOLUPTUOUS_SERIALIZE_DIR		:= $(BUILDDIR)/$(PYTHON3_VOLUPTUOUS_SERIALIZE)
PYTHON3_VOLUPTUOUS_SERIALIZE_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_VOLUPTUOUS_SERIALIZE_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-voluptuous-serialize.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-voluptuous-serialize)
	@$(call install_fixup, python3-voluptuous-serialize,PRIORITY,optional)
	@$(call install_fixup, python3-voluptuous-serialize,SECTION,base)
	@$(call install_fixup, python3-voluptuous-serialize,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-voluptuous-serialize,DESCRIPTION,missing)

	@$(call install_glob, python3-voluptuous-serialize, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-voluptuous-serialize)

	@$(call touch)

# vim: syntax=make
