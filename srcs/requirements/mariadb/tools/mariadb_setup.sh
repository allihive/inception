#!/bin/sh

echo "starting to run mariadb script"
echo "mysql database: ${MYSQL_DATABASE}"
echo "mysql USER: ${MYSQL_USER}"
echo "mysql PASSWORD: ${MYSQL_PASSWORD}"

mysqld --user=mysql --bootstrap <<EOF
USE mysql;
FLUSH PRIVILEGES;
CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

echo "Starting MariaDB..."
exec mysqld_safe --user=mysql
# exec mysqld --defaults-file=/etc/my.cnf.d/mariadb-server.cnf --user=mysql
