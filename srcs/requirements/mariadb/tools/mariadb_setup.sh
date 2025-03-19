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

mysqld --user=mysql --bootstrap <<EOF
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'locahost' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD:";
CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

echo "Starting MariaDB..."
exec mysqld_safe --user=mysql
# exec mysqld --defaults-file=/etc/my.cnf.d/mariadb-server.cnf --user=mysql
