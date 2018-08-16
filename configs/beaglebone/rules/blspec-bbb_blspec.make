# -*-makefile-*-
#
# Copyright (C) 2018 by Andreas Schmidt <mail@schmidt-andreas.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_BLSPEC_BBB_BLSPEC) += blspec-bbb-blspec

BLSPEC_BBB_BLSPEC_VERSION	:= $(PTXCONF_KERNEL_VERSION)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/blspec-bbb-blspec.targetinstall:
	@$(call targetinfo)

	@$(call install_init, blspec-bbb-blspec)
	@$(call install_fixup,blspec-bbb-blspec,PRIORITY,optional)
	@$(call install_fixup,blspec-bbb-blspec,SECTION,base)
	@$(call install_fixup,blspec-bbb-blspec,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup,blspec-bbb-blspec,DESCRIPTION,missing)

	@$(call install_alternative, blspec-bbb-blspec, 0, 0, 0644, \
		/boot/loader/entries/bbb_blspec.conf)

	@$(call install_replace, blspec-bbb-blspec, \
		/boot/loader/entries/bbb_blspec.conf, \
		@KERNEL_VERSION@, $(BLSPEC_BBB_BLSPEC_VERSION));

	@$(call install_finish,blspec-bbb-blspec)

	@$(call touch)

# vim: syntax=make
