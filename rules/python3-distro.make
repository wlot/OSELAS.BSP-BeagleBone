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
PACKAGES-$(PTXCONF_PYTHON3_DISTRO) += python3-distro

#
# Paths and names
#
PYTHON3_DISTRO_VERSION	:= 1.3.0
PYTHON3_DISTRO_MD5	:= ed993934da5ca740189541a2274781a4
PYTHON3_DISTRO		:= distro-$(PYTHON3_DISTRO_VERSION)
PYTHON3_DISTRO_SUFFIX	:= tar.gz
PYTHON3_DISTRO_URL	:= https://files.pythonhosted.org/packages/d2/42/3b059929a920cd9d4e91e7a5e35f0d2ed75211f8f4e877be9d1bde9fdf46/$(PYTHON3_DISTRO).$(PYTHON3_DISTRO_SUFFIX)
PYTHON3_DISTRO_SOURCE	:= $(SRCDIR)/$(PYTHON3_DISTRO).$(PYTHON3_DISTRO_SUFFIX)
PYTHON3_DISTRO_DIR	:= $(BUILDDIR)/$(PYTHON3_DISTRO)
PYTHON3_DISTRO_LICENSE	:= Apache Software License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_DISTRO_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-distro.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-distro)
	@$(call install_fixup, python3-distro,PRIORITY,optional)
	@$(call install_fixup, python3-distro,SECTION,base)
	@$(call install_fixup, python3-distro,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-distro,DESCRIPTION,missing)

	@$(call install_glob, python3-distro, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-distro)

	@$(call touch)

# vim: syntax=make
