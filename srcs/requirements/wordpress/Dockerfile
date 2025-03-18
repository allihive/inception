FROM alpine:3.20.0

EXPOSE 9000

RUN apk update && apk add --no-cache mariadb-client \
		php83 \
		php83-fpm \
# 		# for wordpress to interact with spl
		php83-mysqli \
# 		# needed for rest api functionality
		php83-json \
# 		# for https and secure communications
		php83-openssl \
# 		# login session and authentication
# 		php83-session \
# 		# php applications and libraries into a single file phar archives (can bundle into a single ffile)
		php83-phar \
# 		#enables api calls
		php83-curl \
# 		#required for xml parsing
		php83-dom \
# 		#for php performance optimizations
# 		php83-opcache \
# 		#mutibyte encoding
# 		php83-mbstring \
# 		#handling data in xml format, web services
# 		php83-xml \
		#converting between char encodings
		php83-iconv \
# 		#for downloading wordpress
		wget

COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf

#copy script and make it executable
COPY ./tools/wordpress-script.sh /tmp/wordpress-script.sh
RUN chmod +x /tmp/wordpress-script.sh 

RUN mkdir -p /var/www/wp /var/www/html
RUN chown -R 755 /var/www/html

ENTRYPOINT ["./tmp/wordpress-script.sh"]
