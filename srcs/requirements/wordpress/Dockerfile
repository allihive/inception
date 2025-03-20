FROM alpine:3.20.0

EXPOSE 9000

RUN apk update && apk add --no-cache mariadb-client \
		php83 \
		php83-fpm \
		php83-mysqli \
		php83-json \
		php83-phar \
		php83-curl \
		php83-dom \
		php83-iconv \
		wget \
		addgroup -S www-data && adduser -S www-data -G www-data

COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf

#copy script and make it executable
COPY ./tools/wordpress-script.sh /usr/local/bin/wordpress-script.sh
RUN chmod +x /usr/local/bin/wordpress-script.sh 

RUN mkdir -p /var/www/wp /var/www/html
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

ENTRYPOINT ["/usr/local/bin/wordpress-script.sh"]
