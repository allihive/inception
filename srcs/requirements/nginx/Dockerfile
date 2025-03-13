FROM alpine3.20.0

EXPOSE 443

RUN apk update && apk add nginx openssl

RUN mkdir -p /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/nginx_script /usr/local/bin
COPY ./html /usr/shar/nginx/html

ENTRYPOINT [/usr/local/bin/nginx_script.sh]

# expose ports for http and https
