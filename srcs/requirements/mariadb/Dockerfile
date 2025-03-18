FROM alpine:3.20.0

#default port for mariadb
EXPOSE 3306 

#install mariadb
RUN apk update && apk add --no-cache mariadb mariadb-client mariadb-common

# fixing permissions for MariaDB directories
RUN mkdir -p /var/lib/mysql run/mysqld && chown -R mysql:mysql /var/lib/mysql /run/mysqld

# copying the mariadb setup script and config file
COPY ./tools/mariadb_setup.sh /usr/local/bin
COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# make the script executable
RUN chmod +x /usr/local/bin/mariadb_setup.sh

ENTRYPOINT ["/usr/local/bin/mariadb_setup.sh"]