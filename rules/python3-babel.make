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
PACKAGES-$(PTXCONF_PYTHON3_BABEL) += python3-babel

#
# Paths and names
#
PYTHON3_BABEL_VERSION	:= 2.6.0
PYTHON3_BABEL_MD5	:= c384ac03026e8fe6f9b90f55201f1bff
PYTHON3_BABEL		:= Babel-$(PYTHON3_BABEL_VERSION)
PYTHON3_BABEL_SUFFIX	:= tar.gz
PYTHON3_BABEL_URL	:= https://files.pythonhosted.org/packages/be/cc/9c981b249a455fa0c76338966325fc70b7265521bad641bf2932f77712f4/$(PYTHON3_BABEL).$(PYTHON3_BABEL_SUFFIX)
PYTHON3_BABEL_SOURCE	:= $(SRCDIR)/$(PYTHON3_BABEL).$(PYTHON3_BABEL_SUFFIX)
PYTHON3_BABEL_DIR	:= $(BUILDDIR)/$(PYTHON3_BABEL)
PYTHON3_BABEL_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_BABEL_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-babel.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-babel)
	@$(call install_fixup, python3-babel,PRIORITY,optional)
	@$(call install_fixup, python3-babel,SECTION,base)
	@$(call install_fixup, python3-babel,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-babel,DESCRIPTION,missing)

	@$(call install_glob, python3-babel, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-babel)

	@$(call touch)

# vim: syntax=make
