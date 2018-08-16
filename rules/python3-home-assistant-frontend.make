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
PACKAGES-$(PTXCONF_PYTHON3_HOME_ASSISTANT_FRONTEND) += python3-home-assistant-frontend

#
# Paths and names
#
PYTHON3_HOME_ASSISTANT_FRONTEND_VERSION	:= 20180804.0
PYTHON3_HOME_ASSISTANT_FRONTEND_MD5	:= a9caa14a7216d95ea05709c8e2fa6311
PYTHON3_HOME_ASSISTANT_FRONTEND		:= home-assistant-frontend-$(PYTHON3_HOME_ASSISTANT_FRONTEND_VERSION)
PYTHON3_HOME_ASSISTANT_FRONTEND_SUFFIX	:= tar.gz
PYTHON3_HOME_ASSISTANT_FRONTEND_URL	:= https://files.pythonhosted.org/packages/11/d4/c0221e87175a0a62accd21ac02c4ffee58123b7932f3731cf6a6682fefeb/$(PYTHON3_HOME_ASSISTANT_FRONTEND).$(PYTHON3_HOME_ASSISTANT_FRONTEND_SUFFIX)
PYTHON3_HOME_ASSISTANT_FRONTEND_SOURCE	:= $(SRCDIR)/$(PYTHON3_HOME_ASSISTANT_FRONTEND).$(PYTHON3_HOME_ASSISTANT_FRONTEND_SUFFIX)
PYTHON3_HOME_ASSISTANT_FRONTEND_DIR	:= $(BUILDDIR)/$(PYTHON3_HOME_ASSISTANT_FRONTEND)
PYTHON3_HOME_ASSISTANT_FRONTEND_LICENSE	:= Apache Software License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_HOME_ASSISTANT_FRONTEND_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-home-assistant-frontend.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-home-assistant-frontend)
	@$(call install_fixup, python3-home-assistant-frontend,PRIORITY,optional)
	@$(call install_fixup, python3-home-assistant-frontend,SECTION,base)
	@$(call install_fixup, python3-home-assistant-frontend,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-home-assistant-frontend,DESCRIPTION,missing)

	@$(call install_glob, python3-home-assistant-frontend, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-home-assistant-frontend)

	@$(call touch)

# vim: syntax=make
