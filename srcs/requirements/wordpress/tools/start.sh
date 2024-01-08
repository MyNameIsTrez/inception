#!/bin/sh

alias wp="php /usr/local/bin/wp-cli.phar --allow-root --path=/var/www"

if [ ! -f "/var/www/wp-config.php" ]; then
echo "Creating config"
wp config create\
	--dbhost="$DB_HOST"\
	--dbname="$DB_NAME"\
	--dbuser="$DB_USER"\
	--dbpass="$DB_PASSWORD"

if [ ! $? -eq 0 ]; then
return 1
fi

echo "Running wp core install"
wp core install --title="$WP_TITLE" --admin_name="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --url="$WP_URL"

echo "Running wp user create"
wp user create "$WP_USER_NAME" "$WP_USER_EMAIL" --role=contributor --user_pass="$WP_USER_PASSWORD"
fi

# --nodaemonize forces staying in the foreground
echo "Running php-fpm"
php-fpm7.4 --nodaemonize
