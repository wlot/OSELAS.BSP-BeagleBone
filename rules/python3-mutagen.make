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
PACKAGES-$(PTXCONF_PYTHON3_MUTAGEN) += python3-mutagen

#
# Paths and names
#
PYTHON3_MUTAGEN_VERSION	:= 1.41.0
PYTHON3_MUTAGEN_MD5	:= c0ac6594e31fa75597c640b7d3456f2d
PYTHON3_MUTAGEN		:= mutagen-$(PYTHON3_MUTAGEN_VERSION)
PYTHON3_MUTAGEN_SUFFIX	:= tar.gz
PYTHON3_MUTAGEN_URL	:= https://files.pythonhosted.org/packages/83/15/a21c25d71ab6907cf6463592adfe3b081f94877d2e43227df1d5b8e309a7/$(PYTHON3_MUTAGEN).$(PYTHON3_MUTAGEN_SUFFIX)
PYTHON3_MUTAGEN_SOURCE	:= $(SRCDIR)/$(PYTHON3_MUTAGEN).$(PYTHON3_MUTAGEN_SUFFIX)
PYTHON3_MUTAGEN_DIR	:= $(BUILDDIR)/$(PYTHON3_MUTAGEN)
PYTHON3_MUTAGEN_LICENSE	:= GPLv2

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_MUTAGEN_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-mutagen.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-mutagen)
	@$(call install_fixup, python3-mutagen,PRIORITY,optional)
	@$(call install_fixup, python3-mutagen,SECTION,base)
	@$(call install_fixup, python3-mutagen,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-mutagen,DESCRIPTION,missing)

	@$(call install_glob, python3-mutagen, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-mutagen)

	@$(call touch)

# vim: syntax=make
