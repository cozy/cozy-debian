#!/bin/bash
DOMAIN="$1"

echo $DOMAIN
echo 'cozy cozy/certificate text ' | debconf-set-selections
echo "cozy cozy/fqdn string $DOMAIN" | debconf-set-selections

cozy_management generate_certificate ${DOMAIN}

service nginx restart
