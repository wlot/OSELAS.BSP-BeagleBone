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
PACKAGES-$(PTXCONF_PYTHON3_PAHO_MQTT) += python3-paho-mqtt

#
# Paths and names
#
PYTHON3_PAHO_MQTT_VERSION	:= 1.3.1
PYTHON3_PAHO_MQTT_MD5		:= 2cc27d8b369700b1fc99325add0dadd2
PYTHON3_PAHO_MQTT		:= paho-mqtt-$(PYTHON3_PAHO_MQTT_VERSION)
PYTHON3_PAHO_MQTT_SUFFIX	:= tar.gz
PYTHON3_PAHO_MQTT_URL		:= https://files.pythonhosted.org/packages/2a/5f/cf14b8f9f8ed1891cda893a2a7d1d6fa23de2a9fb4832f05cef02b79d01f/$(PYTHON3_PAHO_MQTT).$(PYTHON3_PAHO_MQTT_SUFFIX)
PYTHON3_PAHO_MQTT_SOURCE	:= $(SRCDIR)/$(PYTHON3_PAHO_MQTT).$(PYTHON3_PAHO_MQTT_SUFFIX)
PYTHON3_PAHO_MQTT_DIR		:= $(BUILDDIR)/$(PYTHON3_PAHO_MQTT)
PYTHON3_PAHO_MQTT_LICENSE	:= OSI Approved

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PAHO_MQTT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-paho-mqtt.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-paho-mqtt)
	@$(call install_fixup, python3-paho-mqtt,PRIORITY,optional)
	@$(call install_fixup, python3-paho-mqtt,SECTION,base)
	@$(call install_fixup, python3-paho-mqtt,AUTHOR,"Andreas Schmidt <mail@schmidt-andreas.de>")
	@$(call install_fixup, python3-paho-mqtt,DESCRIPTION,missing)

	@$(call install_glob, python3-paho-mqtt, 0, 0, -, \
		/usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages,, *.py)

	@$(call install_finish, python3-paho-mqtt)

	@$(call touch)

# vim: syntax=make
