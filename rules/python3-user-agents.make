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
PACKAGES-$(PTXCONF_PYTHON3_USER_AGENTS) += python3-user-agents

#
# Paths and names
#
PYTHON3_USER_AGENTS_VERSION	:= 1.1.0
PYTHON3_USER_AGENTS_MD5		:= 0f18f7edf132605d1d43cc56d4850c31
PYTHON3_USER_AGENTS		:= user-agents-$(PYTHON3_USER_AGENTS_VERSION)
PYTHON3_USER_AGENTS_SUFFIX	:= tar.gz
PYTHON3_USER_AGENTS_URL		:= https://files.pythonhosted.org/packages/be/ff/886a1e2570784ee63b1c4b0fd77037b84087ffe7b7b45f9751285418be34/$(PYTHON3_USER_AGENTS).$(PYTHON3_USER_AGENTS_SUFFIX)
PYTHON3_USER_AGENTS_SOURCE	:= $(SRCDIR)/$(PYTHON3_USER_AGENTS).$(PYTHON3_USER_AGENTS_SUFFIX)
PYTHON3_USER_AGENTS_DIR		:= $(BUILDDIR)/$(PYTHON3_USER_AGENTS)
PYTHON3_USER_AGENTS_LICENSE	:= MIT License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_USER_AGENTS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-user-agents.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-user-agents)
	@$(call install_fixup, python3-user-agents,PRIORITY,optional)
	@$(call install_fixup, python3-user-agents,SECTION,base)
	@$(call install_fixup, python3-user-agents,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-user-agents,DESCRIPTION,missing)

	@$(call install_glob, python3-user-agents, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-user-agents)

	@$(call touch)

# vim: syntax=make
