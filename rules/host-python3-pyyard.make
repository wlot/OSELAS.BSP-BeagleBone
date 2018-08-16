# -*-makefile-*-
#
# Copyright (C) 2014 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
HOST_PACKAGES-$(PTXCONF_HOST_PYTHON3_PYYAML) += host-python3-pyyaml

#
# Paths and names
#
HOST_PYTHON3_PYYAML_VERSION	:= 3.13
HOST_PYTHON3_PYYAML_MD5		:= b78b96636d68ac581c0e2f38158c224f
HOST_PYTHON3_PYYAML		:= PyYAML-$(HOST_PYTHON3_PYYAML_VERSION)
HOST_PYTHON3_PYYAML_SUFFIX	:= tar.gz
HOST_PYTHON3_PYYAML_URL		:= https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/$(HOST_PYTHON3_PYYAML).$(HOST_PYTHON3_PYYAML_SUFFIX)
HOST_PYTHON3_PYYAML_SOURCE	:= $(SRCDIR)/$(HOST_PYTHON3_PYYAML).$(HOST_PYTHON3_PYYAML_SUFFIX)
HOST_PYTHON3_PYYAML_DIR		:= $(HOST_BUILDDIR)/$(HOST_PYTHON3_PYYAML)
HOST_PYTHON3_PYYAML_LICENSE	:= MIT License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_PYTHON3_PYYAML_CONF_TOOL	:= python3

# vim: syntax=make
