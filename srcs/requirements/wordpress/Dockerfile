FROM alpine:3.20.0

EXPOSE 9000

RUN apk update && apk add mariadb-client \
		php83 \
		php83-fpm \
# 		# for wordpress to interact with spl
		php83-mysqli \
# 		# needed for rest api functionality
		php83-json \
# 		# for https and secure communications
# 		php83-openssl \
# 		# login session and authentication
# 		php83-session \
# 		# php applications and libraries into a single file phar archives (can bundle into a single ffile)
		php83-phar \
# 		#enables api calls
		php83-curl \
# 		#required for xml parsing
# 		php83-dom \
# 		#for php performance optimizations
# 		php83-opcache \
# 		#mutibyte encoding
# 		php83-mbstring \
# 		#handling data in xml format, web services
# 		php83-xml \
# 		#handling zip files
# 		php83-zip \
		#converting between char encodings
		php83-iconv \
# 		#for downloading wordpress
		wget

COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf
COPY ./tools/wordpress-script.sh /tmp/wordpress-script.sh
RUN chmod +x /tmp/wordpress-script.sh

RUN mkdir -p /var/www/wp /var/www/html

# FROM alpine:3.20.5

# RUN apk update && apk add mariadb-client \
# 	php83 \
# 	php83-fpm \
# 	php83-phar \
# 	php83-curl \
# 	php83-mysqli \
# 	php83-iconv \
# 	php83-json \
# 	wget 

# COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf

# RUN mkdir -p /var/www/wp /var/www/html

# COPY ./tools/wordpress-script.sh /tmp/wordpress-script.sh
# RUN chmod +x /tmp/wordpress-script.sh 

# # EXPOSE 9000

# RUN adduser -D -H -s /sbin/nologin -g www-data -G www-data www-data

# # CMD ["/tmp/wordpress-script.sh"]
