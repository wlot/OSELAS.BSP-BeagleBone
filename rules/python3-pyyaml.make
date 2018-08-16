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
PACKAGES-$(PTXCONF_PYTHON3_PYYAML) += python3-pyyaml

#
# Paths and names
#
PYTHON3_PYYAML_VERSION	:= 3.13
PYTHON3_PYYAML_MD5	:= b78b96636d68ac581c0e2f38158c224f
PYTHON3_PYYAML		:= PyYAML-$(PYTHON3_PYYAML_VERSION)
PYTHON3_PYYAML_SUFFIX	:= tar.gz
PYTHON3_PYYAML_URL	:= https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/$(PYTHON3_PYYAML).$(PYTHON3_PYYAML_SUFFIX)
PYTHON3_PYYAML_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYYAML).$(PYTHON3_PYYAML_SUFFIX)
PYTHON3_PYYAML_DIR	:= $(BUILDDIR)/$(PYTHON3_PYYAML)
PYTHON3_PYYAML_LICENSE	:= MIT License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYYAML_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pyyaml.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pyyaml)
	@$(call install_fixup, python3-pyyaml,PRIORITY,optional)
	@$(call install_fixup, python3-pyyaml,SECTION,base)
	@$(call install_fixup, python3-pyyaml,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-pyyaml,DESCRIPTION,missing)

	@$(call install_glob, python3-pyyaml, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-pyyaml)

	@$(call touch)

# vim: syntax=make
