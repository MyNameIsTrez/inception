#!/bin/bash

# This lets the script exit if any command fails
set -e

if [ ! -f "/var/www/wp-config.php" ]; then
echo "Creating config"
wp-cli config create\
	--allow-root\
	--path=/var/www\
	--dbhost="$DB_HOST"\
	--dbname="$DB_NAME"\
	--dbuser="$DB_USER"\
	--dbpass="$DB_PASSWORD"

echo "Running wp core install"
wp-cli core install\
	--allow-root\
	--path=/var/www\
	--skip-email\
	--title="$WP_ADMIN_TITLE"\
	--admin_name="$WP_ADMIN_NAME"\
	--admin_password="$WP_ADMIN_PASSWORD"\
	--admin_email="$WP_ADMIN_EMAIL"\
	--url="$WP_ADMIN_URL"

echo "Running wp user create"
wp-cli user create\
	"$WP_USER_NAME"\
	"$WP_USER_EMAIL"\
	--allow-root\
	--path=/var/www\
	--role="$WP_USER_ROLE"\
	--user_pass="$WP_USER_PASSWORD"
fi

echo "Running php-fpm"
# --nodaemonize forces staying in the foreground
php-fpm7.4 --nodaemonize
