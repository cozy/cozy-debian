#!/bin/bash
DOMAIN="$1"

echo $DOMAIN
echo 'cozy cozy/certificate text ' | debconf-set-selections
echo "cozy cozy/fqdn string $DOMAIN" | debconf-set-selections

coffee /usr/local/cozy/apps/home/commands.coffee setdomain $DOMAIN

cozy_management generate_certificate ${DOMAIN}

service nginx restart
