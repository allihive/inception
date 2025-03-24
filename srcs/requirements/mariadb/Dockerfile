FROM alpine:3.20.0

#default port for mariadb
EXPOSE 3306

#install mariadb
RUN apk update && apk add --no-cache mariadb mariadb-client mariadb-common

# fixing permissions for MariaDB directories
RUN mkdir -p /var/lib/mysql /var/log/mysql /run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/log/mysql /run/mysqld \
	&& mariadb-install-db --user=mysql --datadir=/var/lib/mysql

# copying the mariadb setup script and config file
COPY ./tools/mariadb_setup.sh /usr/local/bin/mariadb_setup.sh
COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# give the correct permissions
RUN chmod +x /usr/local/bin/mariadb_setup.sh
RUN chmod -R 755 /var/lib/mysql \
	&& chmod 644 /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT ["/usr/local/bin/mariadb_setup.sh"]