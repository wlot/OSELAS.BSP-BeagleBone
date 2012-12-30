# -*-makefile-*-
#
# Copyright (C) 2012 by Bernhard Walle <bernhard@bwalle.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
HOST_PACKAGES-$(PTXCONF_HOST_QEMU) += host-qemu

#
# Paths and names
#
HOST_QEMU_VERSION	:= 1.3.0
HOST_QEMU_MD5		:= a4030ddd2ba324152a97d65d3c0b247d
HOST_QEMU		:= qemu-$(HOST_QEMU_VERSION)
HOST_QEMU_SUFFIX	:= tar.bz2
HOST_QEMU_URL		:= http://wiki.qemu.org/download/$(HOST_QEMU).$(HOST_QEMU_SUFFIX)
HOST_QEMU_SOURCE	:= $(SRCDIR)/$(HOST_QEMU).$(HOST_QEMU_SUFFIX)
HOST_QEMU_DIR		:= $(HOST_BUILDDIR)/$(HOST_QEMU)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# autoconf
#
HOST_QEMU_CONF_TOOL	:= autoconf
HOST_QEMU_CONF_OPT	:= $(HOST_AUTOCONF) \
	--extra-cflags="$(HOST_CPPFLAGS)" \
	--target-list=arm-softmmu,x86_64-softmmu

# vim: syntax=make