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
PACKAGES-$(PTXCONF_PYTHON3_COLORLOG) += python3-colorlog

#
# Paths and names
#
PYTHON3_COLORLOG_VERSION	:= 3.0.1
PYTHON3_COLORLOG_MD5		:= 7d4c8a59c5df03f31fe939faccc970d1
PYTHON3_COLORLOG		:= colorlog-$(PYTHON3_COLORLOG_VERSION)
PYTHON3_COLORLOG_SUFFIX		:= tar.gz
PYTHON3_COLORLOG_URL		:= https://files.pythonhosted.org/packages/50/3e/7ffa562b7931344bf851e57a1e8c349e07e48433bf006de4559b857fa3a1/$(PYTHON3_COLORLOG).$(PYTHON3_COLORLOG_SUFFIX)
PYTHON3_COLORLOG_SOURCE		:= $(SRCDIR)/$(PYTHON3_COLORLOG).$(PYTHON3_COLORLOG_SUFFIX)
PYTHON3_COLORLOG_DIR		:= $(BUILDDIR)/$(PYTHON3_COLORLOG)
PYTHON3_COLORLOG_LICENSE	:= BSD License

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_COLORLOG_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-colorlog.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-colorlog)
	@$(call install_fixup, python3-colorlog,PRIORITY,optional)
	@$(call install_fixup, python3-colorlog,SECTION,base)
	@$(call install_fixup, python3-colorlog,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-colorlog,DESCRIPTION,missing)

	@$(call install_glob, python3-colorlog, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-colorlog)

	@$(call touch)

# vim: syntax=make
