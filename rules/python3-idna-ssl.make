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
PACKAGES-$(PTXCONF_PYTHON3_IDNA_SSL) += python3-idna-ssl

#
# Paths and names
#
PYTHON3_IDNA_SSL_VERSION	:= 1.1.0
PYTHON3_IDNA_SSL_MD5		:= dd44ec53bac36e68446766fd8d3835bd
PYTHON3_IDNA_SSL		:= idna-ssl-$(PYTHON3_IDNA_SSL_VERSION)
PYTHON3_IDNA_SSL_SUFFIX		:= tar.gz
PYTHON3_IDNA_SSL_URL		:= https://files.pythonhosted.org/packages/46/03/07c4894aae38b0de52b52586b24bf189bb83e4ddabfe2e2c8f2419eec6f4/$(PYTHON3_IDNA_SSL).$(PYTHON3_IDNA_SSL_SUFFIX)
PYTHON3_IDNA_SSL_SOURCE		:= $(SRCDIR)/$(PYTHON3_IDNA_SSL).$(PYTHON3_IDNA_SSL_SUFFIX)
PYTHON3_IDNA_SSL_DIR		:= $(BUILDDIR)/$(PYTHON3_IDNA_SSL)
PYTHON3_IDNA_SSL_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_IDNA_SSL_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-idna-ssl.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-idna-ssl)
	@$(call install_fixup, python3-idna-ssl,PRIORITY,optional)
	@$(call install_fixup, python3-idna-ssl,SECTION,base)
	@$(call install_fixup, python3-idna-ssl,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-idna-ssl,DESCRIPTION,missing)

	@$(call install_glob, python3-idna-ssl, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-idna-ssl)

	@$(call touch)

# vim: syntax=make
