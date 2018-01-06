# For information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_LINUX_PAM) += linux-pam

#
# Paths and names
#
LINUX_PAM_VERSION      := 1.3.0
LINUX_PAM_MD5          := da4b2289b7cfb19583d54e9eaaef1c3a
LINUX_PAM              := Linux-PAM-$(LINUX_PAM_VERSION)
LINUX_PAM_SUFFIX       := tar.bz2
LINUX_PAM_URL          := http://www.linux-pam.org/library/$(LINUX_PAM).$(LINUX_PAM_SUFFIX)
LINUX_PAM_SOURCE       := $(SRCDIR)/$(LINUX_PAM).$(LINUX_PAM_SUFFIX)
LINUX_PAM_DIR          := $(BUILDDIR)/$(LINUX_PAM)
LINUX_PAM_LICENSE      := GPL, BSD

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# autoconf
#
LINUX_PAM_CONF_TOOL    := autoconf
LINUX_PAM_CONF_OPT := \
	$(CROSS_AUTOCONF_USR) \
	--bindir=/usr/bin \
	--sbindir=/usr/sbin \
	--disable-regenerate-docu \
	--enable-securedir=/usr/lib/secure \
	--docdir=/usr/share/doc/$(LINUX_PAM)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/linux-pam.targetinstall:
	@$(call targetinfo)

	@$(call install_init, linux-pam)
	@$(call install_fixup, linux-pam,PRIORITY,optional)
	@$(call install_fixup, linux-pam,SECTION,base)
	@$(call install_fixup, linux-pam,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, linux-pam,DESCRIPTION,missing)

	@$(call install_lib, linux-pam, 0, 0, 0644, libpam)
	@$(call install_lib, linux-pam, 0, 0, 0644, libpam_misc)
	@$(call install_lib, linux-pam, 0, 0, 0644, libpamc)

	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_access.so)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/security/access.conf)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_debug.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_deny.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_echo.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_env.so)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/security/pam_env.conf)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/environment)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_exec.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_faildelay.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_filter.so)
	@$(call install_copy, linux-pam, 0, 0, 0755, -, /usr/lib/secure/pam_filter/upperLOWER)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_ftp.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_group.so)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/security/group.conf)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_issue.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_keyinit.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_lastlog.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_limits.so)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/security/limits.conf)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_listfile.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_localuser.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_loginuid.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_mail.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_mkhomedir.so)
	@$(call install_copy, linux-pam, 0, 0, 0755, -, /usr/sbin/mkhomedir_helper)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_motd.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_namespace.so)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/security/namespace.conf)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/security/namespace.init)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_nologin.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_permit.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_pwhistory.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_rhosts.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_rootok.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_securetty.so)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/securetty)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_shells.so)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/shells)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_stress.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_succeed_if.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_tally2.so)
	@$(call install_copy, linux-pam, 0, 0, 0755, -, /usr/sbin/pam_tally2)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_tally.so)
	@$(call install_copy, linux-pam, 0, 0, 0755, -, /usr/sbin/pam_tally)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_time.so)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/security/time.conf)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_timestamp.so)
	@$(call install_copy, linux-pam, 0, 0, 0755, -, /usr/sbin/pam_timestamp_check)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_umask.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_unix.so)
	@$(call install_copy, linux-pam, 0, 0, 0755, -, /usr/sbin/unix_update)
	@$(call install_copy, linux-pam, 0, 0, 0755, -, /usr/sbin/unix_chkpwd)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_warn.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_wheel.so)
	@$(call install_copy, linux-pam, 0, 0, 0644, -, /usr/lib/secure/pam_xauth.so)
	
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/pam.conf)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/pam.d/other)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/pam.d/common-account)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/pam.d/common-auth)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/pam.d/common-password)
	@$(call install_alternative, linux-pam, 0, 0, 0644, /etc/pam.d/common-session)



	@$(call install_finish, linux-pam)
	
	@$(call touch)

# vim: syntax=make

