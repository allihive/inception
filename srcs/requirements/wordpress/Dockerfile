FROM alpine:3.20.0

EXPOSE 9000

RUN apk update && apk add --no-cache mariadb-client \
		php83 \
		php83-fpm \
		php83-mysqli \
		php83-json \
		php83-phar \
		php83-curl \
		php83-iconv \
		wget

RUN adduser -u 82 -S nginx -G nginx

COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf
COPY ./tools/wordpress-script.sh /usr/local/bin/wordpress-script.sh

RUN chmod +x /usr/local/bin/wordpress-script.sh 

RUN mkdir -p /var/www/wp /var/www/html
RUN chown -R nginx:nginx /var/www/html 
RUN chmod -R 755 /var/www/html

RUN echo "memory_limit = 512M" >> /etc/php83/php.ini 

ENTRYPOINT ["/usr/local/bin/wordpress-script.sh"]
