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
PACKAGES-$(PTXCONF_PYTHON3_UA_PARSER) += python3-ua-parser

#
# Paths and names
#
PYTHON3_UA_PARSER_VERSION	:= 0.8.0
PYTHON3_UA_PARSER_MD5		:= b73c5a86783e444afa2788075dddf48a
PYTHON3_UA_PARSER		:= ua-parser-$(PYTHON3_UA_PARSER_VERSION)
PYTHON3_UA_PARSER_SUFFIX	:= tar.gz
PYTHON3_UA_PARSER_URL		:= https://files.pythonhosted.org/packages/b0/02/94ea43fc432fb112fbb62a89855317c41c210fb5239a2ed9b94ecb63024f/$(PYTHON3_UA_PARSER).$(PYTHON3_UA_PARSER_SUFFIX)
PYTHON3_UA_PARSER_SOURCE	:= $(SRCDIR)/$(PYTHON3_UA_PARSER).$(PYTHON3_UA_PARSER_SUFFIX)
PYTHON3_UA_PARSER_DIR		:= $(BUILDDIR)/$(PYTHON3_UA_PARSER)
PYTHON3_UA_PARSER_LICENSE	:= Apache Software License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_UA_PARSER_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-ua-parser.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-ua-parser)
	@$(call install_fixup, python3-ua-parser,PRIORITY,optional)
	@$(call install_fixup, python3-ua-parser,SECTION,base)
	@$(call install_fixup, python3-ua-parser,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-ua-parser,DESCRIPTION,missing)

	@$(call install_glob, python3-ua-parser, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-ua-parser)

	@$(call touch)

# vim: syntax=make
