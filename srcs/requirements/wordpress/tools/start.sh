#!/bin/bash

# TODO: Add config create command here

# TODO: Move this to the Dockerfile
wp-cli-release.phar --allow-root --path="/var/www/wordpress" core install --title="Test title" --admin_name="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --url="https://mynameistrez.github.io/"

# TODO: Move this to the Dockerfile
wp-cli-release.phar --allow-root --path="/var/www/wordpress" user create "$WP_USER_NAME" "$WP_USER_EMAIL" --role=contributor --user_pass="$WP_USER_PASSWORD"

# --nodaemonize forces staying in the foreground
php-fpm7.4 --nodaemonize
