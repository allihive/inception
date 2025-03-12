FROM alpine3.20.0

EXPOSE 443

RUN apk update && apk add nginx openssl

RUN mkdir -p /etc/nginx/ssl

COPY ./nginx.conf etc/nginx/nginx.conf
COPY ./html /ust/shar/nginx/html

# expose ports for http and https
