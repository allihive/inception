#!/bin/sh
cd /var/www/html

#connecting to mariadb, use database user and pass
until mysqladmin ping -h mariadb-cont -u root -p$MYSQL_ROOT_PASSWORD --silent; do
	echo "waiting for database to start" 
	sleep 5
done

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Downloading WP-CLI..."
	wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
	chmod +x /usr/local/bin/wp
	chown www-data:www-data /usr/local/bin/wp

	echo "download the wordpress files"
	wp core download --allow-root

	echo "Creating essential wordpress config file"
	wp config create \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb-cont

	echo "Installing WordPress"
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USERNAME \
		--admin_password=$WP_ADMIN_PASS \
		--admin_email=$WP_ADMIN_EMAIL \
		--allow-root \
		--skip-email \

	echo "checking for normal user"
	if wp user get "$WP_NORMAL_USERNAME" --allow-root; then
		echo "User is in use"
	else
		wp user create \
			"$WP_NORMAL_USERNAME" "$WP_NORMAL_EMAIL" \
			--user_pass=$WP_NORMAL_PASS \
			--allow-root
	fi
else
	echo "Wordpress has already been set up"
fi

echo "Changing ownership for default user and group"
chown -R nginx:nginx /var/www/html

echo "Running php server in the foreground"
php-fpm83 -F