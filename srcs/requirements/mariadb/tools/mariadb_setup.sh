#!/bin/sh

#check if the directory exists

# if [ ! -d "/var/lib/mysql" ]; then
# 	echo "Initializing MariaDB..."
# 	mariadb-install-db --user=mysql --datadir=/var/lib/mysql

# 	# echo "Starting MariaDB..."
# 	# mysqld_safe --data=var/lib/mysql & #start mariadb in the background
# 	# sleep 5

# 	echo "Creating WordPress database and user..."
	

# EOF
# 	echo "Database " $WP_DATABASE_NAME " has been created successfully"
	
# fi
echo "starting to run mariadb script"
echo "mysql database: ${MYSQL_DATABASE}"
echo "mysql USER: ${MYSQL_USER}"
echo "mysql PASSWORD: ${MYSQL_PASSWORD}"
chmod -R /var/lib/mysql

mysqld --user=mysql --bootstrap <<EOF
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

echo "Starting MariaDB..."
exec mysqld_safe --user=mysql
# exec mysqld --defaults-file=/etc/my.cnf.d/mariadb-server.cnf --user=mysql
