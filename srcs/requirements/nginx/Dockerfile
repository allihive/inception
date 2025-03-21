FROM alpine:3.20.0

EXPOSE 443

RUN apk update && apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl

COPY ./conf/self-signed.conf /etc/nginx/snippets/self-signed.conf

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 644 /etc/nginx/nginx.conf

COPY ./tools/nginx_script.sh /usr/local/bin/nginx_script.sh
RUN chmod +x /usr/local/bin/nginx_script.sh

# RUN adduser -D -H -s /sbin/nologin -g www-data -G www-data www-data

ENTRYPOINT ["/usr/local/bin/nginx_script.sh"]
