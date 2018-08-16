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
HOST_PACKAGES-$(PTXCONF_HOST_PYTHON3_SETUPTOOLS) += host-python3-setuptools

#
# Paths and names
#
HOST_PYTHON3_SETUPTOOLS_VERSION	:= 40.0.0
HOST_PYTHON3_SETUPTOOLS_MD5	:= 260630ae1a64bafa39dcc53404d63829
HOST_PYTHON3_SETUPTOOLS		:= setuptools-$(HOST_PYTHON3_SETUPTOOLS_VERSION)
HOST_PYTHON3_SETUPTOOLS_SUFFIX	:= zip
HOST_PYTHON3_SETUPTOOLS_URL	:= https://files.pythonhosted.org/packages/d3/3e/1d74cdcb393b68ab9ee18d78c11ae6df8447099f55fe86ee842f9c5b166c/$(HOST_PYTHON3_SETUPTOOLS).$(HOST_PYTHON3_SETUPTOOLS_SUFFIX)
HOST_PYTHON3_SETUPTOOLS_SOURCE	:= $(SRCDIR)/$(HOST_PYTHON3_SETUPTOOLS).$(HOST_PYTHON3_SETUPTOOLS_SUFFIX)
HOST_PYTHON3_SETUPTOOLS_DIR	:= $(HOST_BUILDDIR)/$(HOST_PYTHON3_SETUPTOOLS)
HOST_PYTHON3_SETUPTOOLS_LICENSE	:= PSF AND ZPL

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_PYTHON3_SETUPTOOLS_CONF_TOOL	:= python3

# vim: syntax=make
