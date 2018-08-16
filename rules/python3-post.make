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
PACKAGES-$(PTXCONF_PYTHON3_POST) += python3-post

#
# Paths and names
#
PYTHON3_POST_VERSION	:= 1.0.2
PYTHON3_POST_MD5	:= 99ebad09fa48ae69f30e9df67a495967 
PYTHON3_POST		:= post-$(PYTHON3_POST_VERSION)
PYTHON3_POST_SUFFIX	:= tar.gz
PYTHON3_POST_URL	:= https://files.pythonhosted.org/packages/7f/ea/ddf22395dcee7a45b7ab7564a087725cafc778f421268814cd8a5ec9ffdf/$(PYTHON3_POST).$(PYTHON3_POST_SUFFIX)
PYTHON3_POST_SOURCE	:= $(SRCDIR)/$(PYTHON3_POST).$(PYTHON3_POST_SUFFIX)
PYTHON3_POST_DIR	:= $(BUILDDIR)/$(PYTHON3_POST)
PYTHON3_POST_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_POST_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-post.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-post)
	@$(call install_fixup, python3-post,PRIORITY,optional)
	@$(call install_fixup, python3-post,SECTION,base)
	@$(call install_fixup, python3-post,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-post,DESCRIPTION,missing)

	@$(call install_glob, python3-post, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-post)

	@$(call touch)

# vim: syntax=make
