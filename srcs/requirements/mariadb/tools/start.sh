#!/bin/bash

# This lets the script exit if any command fails
set -e

if [ -f "$HEALTHCHECK_FILE" ]; then
	echo "Healthchech file already exists, removing it"
	rm "$HEALTHCHECK_FILE"
fi

# Since /var/lib/mysql is the persistent volume,
# we don't need to do this every time the container boots,
# but this should really just be moved to the Dockerfile
if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
	echo "Initializing mariadb database"

	# envsubst fills the environment variables from start.sql
	# --bootstrap tells mariadbd to use its stdin
	# --bootstrap has a very different description here?: https://mariadb.com/kb/en/mariadbd-options/#-bootstrap
	echo "Bootstrapping mariadbd"
	< /home/start.sql envsubst | mariadbd --bootstrap

	echo "Initialized mariadb database"
else
	echo "mariadb database was already initialized"
fi

# We're creating this file after bootstrapping is done
# to signal that the wordpress container can now start and use mariadb
# The reason we don't need a healthcheck for wordpress is because nginx
# will only access wordpress once a user requests a page
touch "$HEALTHCHECK_FILE"

echo "Running mariadbd"
mariadbd
