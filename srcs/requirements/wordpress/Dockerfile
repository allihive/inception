FROM alpine:3.20.0

EXPOSE 9000

RUN apk update && apk add --no-cache mariadb-client curl \
		php83 \
		php83-fpm \
		# for wordpress to interact with spl
		php83-mysqli \
		# needed for rest api functionality
		php83-json \
		# for https and secure communications
		php83-openssl \
		# login session and authentication
		php83-session \
		# php applications and libraries into a single file phar archives (can bundle into a single ffile)
		php83-phar
		#enables api calls
		php83-curl \
		#required for xml parsing
		php83-dom \
		#for php performance optimizations
		php83-opcache \
		#mutibyte encoding
		php83-mbstring \
		#handling data in xml format, web services
		php83-xml \
		#handling zip files
		php83-zip \
		#converting between char encodings
		php83-iconv
		#for downloading wordpress
		wget
COPY ./conf/www.conf /etc/php83/php-fpm.d/www.conf

mkdir -p /var/www/
