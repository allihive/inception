FROM alpine:3.20.0

EXPOSE 443

RUN apk update && apk add nginx openssl

RUN mkdir -p /etc/nginx/ssl

COPY ./conf/self-signed.conf /etc/nginx/snippets/self-signed.conf

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 644 /etc/nginx/nginx.conf

COPY ./tools/nginx_script.sh /usr/local/bin
RUN chmod +x /usr/local/bin/nginx_script.sh

ENTRYPOINT ["/usr/local/bin/nginx_script.sh"]
