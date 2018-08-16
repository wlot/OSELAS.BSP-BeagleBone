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
PACKAGES-$(PTXCONF_PYTHON3_SQLALCHEMY) += python3-sqlalchemy

#
# Paths and names
#
PYTHON3_SQLALCHEMY_VERSION	:= 1.2.10
PYTHON3_SQLALCHEMY_MD5		:= 7f41dd1952133ad921b477a204345fc0
PYTHON3_SQLALCHEMY		:= SQLAlchemy-$(PYTHON3_SQLALCHEMY_VERSION)
PYTHON3_SQLALCHEMY_SUFFIX	:= tar.gz
PYTHON3_SQLALCHEMY_URL		:= https://files.pythonhosted.org/packages/8a/c2/29491103fd971f3988e90ee3a77bb58bad2ae2acd6e8ea30a6d1432c33a3/$(PYTHON3_SQLALCHEMY).$(PYTHON3_SQLALCHEMY_SUFFIX)
PYTHON3_SQLALCHEMY_SOURCE	:= $(SRCDIR)/$(PYTHON3_SQLALCHEMY).$(PYTHON3_SQLALCHEMY_SUFFIX)
PYTHON3_SQLALCHEMY_DIR		:= $(BUILDDIR)/$(PYTHON3_SQLALCHEMY)
PYTHON3_SQLALCHEMY_LICENSE	:= MIT License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_SQLALCHEMY_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-sqlalchemy.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-sqlalchemy)
	@$(call install_fixup, python3-sqlalchemy,PRIORITY,optional)
	@$(call install_fixup, python3-sqlalchemy,SECTION,base)
	@$(call install_fixup, python3-sqlalchemy,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-sqlalchemy,DESCRIPTION,missing)

	@$(call install_glob, python3-sqlalchemy, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-sqlalchemy)

	@$(call touch)

# vim: syntax=make
