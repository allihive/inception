#!/bin/bash

#check if the directory exists

if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo "Initializing MariaDB..."
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql

	echo "Starting MariaDB..."
	mysqld_safe --data=var/lib/mysql & #start mariadb in the background
	sleep 5

	echo "Creating WordPress database and user..."
	
	echo "Stopping temporary MariaDB server..."
	mysqladmin shutdown
fi

exec mysqld_safe --datadir=/var/lib/mysql
	