# For information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_SHADOW) += shadow

#
# Paths and names
#
SHADOW_VERSION      := 4.5
SHADOW_MD5          := 7cccabb98fe2d3eb96fb05ae1701c464
SHADOW              := shadow-$(SHADOW_VERSION)
SHADOW_SUFFIX       := tar.gz
SHADOW_URL          := https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)/$(SHADOW).$(SHADOW_SUFFIX)
SHADOW_SOURCE       := $(SRCDIR)/$(SHADOW).$(SHADOW_SUFFIX)
SHADOW_DIR          := $(BUILDDIR)/$(SHADOW)
SHADOW_LICENSE      := GPL, BSD

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

SHADOW_INST- =
SHADOW_INST-y =
SHADOW_INST-$(PTXCONF_SHADOW_PASSWD) += passwd
SHADOW_INST-$(PTXCONF_SHADOW_LOGIN)  += login

#
# autoconf
#
SHADOW_CONF_TOOL    := autoconf
SHADOW_CONF_OPT := \
	$(CROSS_AUTOCONF_USR) \
	--bindir=/usr/bin \
	--sbindir=/usr/sbin \
    --sysconfdir=/etc \
    --with-group-name-max-length=32

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/shadow.targetinstall:
	@$(call targetinfo)

	@$(call install_init, shadow)
	@$(call install_fixup, shadow,PRIORITY,optional)
	@$(call install_fixup, shadow,SECTION,base)
	@$(call install_fixup, shadow,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, shadow,DESCRIPTION,missing)

	@for i in $(SHADOW_INST-y); do \
		$(call install_copy, shadow, 0, 0, 0755, -, /usr/bin/$$i) \
	done

ifdef PTXCONF_SHADOW_PASSWD
	@$(call install_alternative, shadow, 0, 0, 0644, /etc/pam.d/passwd)
endif

ifdef PTXCONF_SHADOW_LOGIN
	@$(call install_alternative, shadow, 0, 0, 0644, /etc/pam.d/login)
endif

	@$(call install_finish, shadow)
	
	@$(call touch)

# vim: syntax=make

