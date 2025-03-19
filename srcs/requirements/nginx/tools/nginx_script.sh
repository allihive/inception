#!/bin/sh

echo "Is ssl certificate present?"

if test -f $CERTS_KEY; then
	echo "Yes, ssl certificate here!"

else
	echo "No, generating now..."
	openssl req -x509 -nodes -days 365 -newkey \
		-keyout "$CERTS_KEY" -out "$CERTS_CRT" \
		-subj "/C=FI/ST=Uusimaa/L=Helsinki/O=42/OU=Hive/CN=${DOMAIN_NAME}"
	echo "SSL certificate generated"

fi
	#appends to a selfsigned conf
echo "Adding SSL configuration"
echo "ssl_certificate $CERTS_CRT;" >> /etc/nginx/snippets/self-signed.conf
echo "ssl_certificate_key $CERTS_KEY;" >> /etc/nginx/snippets/self-signed.conf

#creating user and adding them to a group 
adduser -D -H -s /sbin/nologin -g www-data www-data

echo "Starting NGINX"
exec nginx -g 'daemon off;'