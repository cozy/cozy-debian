#!/bin/bash
DOMAIN="$1"

echo $DOMAIN
echo 'cozy cozy/certificate text ' | debconf-set-selections
echo "cozy cozy/fqdn string $DOMAIN" | debconf-set-selections

for file in /etc/cozy/server.*; do
	mv ${file} ${file}.backup
done

/var/lib/dpkg/info/cozy.postinst reconfigure

service nginx restart
