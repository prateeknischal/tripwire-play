#!/bin/bash

cd /etc/tripwire

SITE_PASS=sitePass@1
LOCAL_PASS=localPass@2

# Generate site key
twadmin --generate-keys --site-keyfile site.key -Q $SITE_PASS

# Generate local key
twadmin --generate-keys --local-keyfile ${HOSTNAME}-local.key -P $LOCAL_PASS

# Signing the configuration file
twadmin --create-cfgfile --cfgfile tw.cfg --site-keyfile site.key -Q $SITE_PASS twcfg.txt

# Signing the Policy file
twadmin --create-polfile --cfgfile tw.cfg --site-keyfile site.key -Q $SITE_PASS twpol.txt

# Add access permissions and ownerships (by root group user using chmod 640)
chown root:root site.key ${HOSTNAME}-local.key tw.cfg tw.pol
chmod 640 site.key ${HOSTNAME}-local.key tw.cfg tw.pol

#Generate the inital tripwire db
tripwire --init -P $LOCAL_PASS

# Stupid hack to keep to container alive to play around with
sleep infinity