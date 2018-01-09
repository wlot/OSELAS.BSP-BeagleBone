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

SHADOW_INST_BIN- =
SHADOW_INST_BIN-y =
SHADOW_INST_BIN_SETUID- =
SHADOW_INST_BIN_SETUID-y =
SHADOW_INST_SBIN- =
SHADOW_INST_SBIN-y =

SHADOW_INST_BIN_SETUID-$(PTXCONF_SHADOW_CHAGE) 		+= chage
SHADOW_INST_BIN_SETUID-$(PTXCONF_SHADOW_CHFN)		+= chfn
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_CHGPASSWD)		+= chgpasswd
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_CHPASSWD)			+= chpasswd
SHADOW_INST_BIN_SETUID-$(PTXCONF_SHADOW_CHSH)		+= chsh
SHADOW_INST_BIN_SETUID-$(PTXCONF_SHADOW_EXPIRY)		+= expiry
SHADOW_INST_BIN-$(PTXCONF_SHADOW_FAILLOG)			+= faillog
SHADOW_INST_BIN_SETUID-$(PTXCONF_SHADOW_GPASSWD)	+= gpasswd
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_GROUPADD)			+= groupadd
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_GROUPDEL)			+= groupdel
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_GROUPMEMS)		+= groupmems
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_GROUPMOD)			+= groupmod
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_GRPCK)			+= grpck
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_GRPCONV)			+= grpconv
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_GRPUNCONV)		+= grpunconv
SHADOW_INST_BIN-$(PTXCONF_SHADOW_LASTLOG)			+= lastlog
SHADOW_INST_BIN-$(PTXCONF_SHADOW_LOGIN)				+= login
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_LOGOUTD)			+= logoutd
SHADOW_INST_BIN_SETUID-$(PTXCONF_SHADOW_NEWGRP)		+= newgrp
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_NEWUSERS)			+= newusers
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_NOLOGIN)			+= nologin
SHADOW_INST_BIN_SETUID-$(PTXCONF_SHADOW_PASSWD)		+= passwd
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_PWCK)				+= pwck
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_PWCONV)			+= pwconv
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_PWUNCONV)			+= pwunconv
SHADOW_INST_BIN_SETUID-$(PTXCONF_SHADOW_SU)			+= su
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_USERADD)			+= useradd
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_USERDEL)			+= userdel
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_USERMOD)			+= usermod
SHADOW_INST_SBIN-$(PTXCONF_SHADOW_VIPW)				+= vipw

SHADOW_INST_ETC_PAMD- =
SHADOW_INST_ETC_PAMD-y =

SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_CHAGE)		+= chage
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_CHFN)			+= chfn
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_CHGPASSWD)	+= chgpasswd
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_CHPASSWD)		+= chpasswd
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_CHSH)			+= chsh
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_GROUPADD)		+= groupadd
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_GROUPDEL)		+= groupdel
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_GROUPMEMS)	+= groupmems
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_GROUPMOD)		+= groupmod
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_LOGIN)		+= login
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_NEWUSERS)		+= newusers
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_PASSWD)		+= passwd
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_SU)			+= su
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_USERADD)		+= useradd
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_USERDEL)		+= userdel
SHADOW_INST_ETC_PAMD-$(PTXCONF_SHADOW_USERMOD)		+= usermod

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

	@for i in $(SHADOW_INST_BIN-y); do \
		$(call install_copy, shadow, 0, 0, 0755, -, /usr/bin/$$i) \
	done

	@for i in $(SHADOW_INST_BIN_SETUID-y); do \
		$(call install_copy, shadow, 0, 0, 4755, -, /usr/bin/$$i) \
	done

	@for i in $(SHADOW_INST_SBIN-y); do \
		$(call install_copy, shadow, 0, 0, 0755, -, /usr/sbin/$$i) \
	done

	@for i in $(SHADOW_INST_ETC_PAMD-y); do \
		$(call install_alternative, shadow, 0, 0, 0644, /etc/pam.d/$$i); \
	done

ifdef PTXCONF_SHADOW_USERADD
	@$(call install_alternative, shadow, 0, 0, 0644, /etc/default/useradd)
endif

ifdef PTXCONF_SHADOW_SG
	@$(call install_link, shadow, newgr, /usr/bin/sg)
endif

ifdef PTXCONF_SHADOW_VIGR
	@$(call install_link, shadow, vipw, /usr/sbin/vigr)
endif

	@$(call install_finish, shadow)
	
	@$(call touch)

# vim: syntax=make
