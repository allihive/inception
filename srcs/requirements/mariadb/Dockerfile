FROM alpine:3.20.0

#default port for mariadb
EXPOSE 3306 

#install mariadb
RUN apk update && apk add mariadb mariadb-client

#copy setup script
COPY ./tools/mariadb_setup.sh /usr/local/bin
RUN chmod +x /usr/local/bin/mariadb_setup.sh

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT ["/tmp/mariadb_setup.sh"]