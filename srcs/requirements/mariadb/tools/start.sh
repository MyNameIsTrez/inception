#!/bin/bash

if [ -f "$HEALTHCHECK_FILE" ]; then
	echo "Healthchech file already exists, removing it"
	rm "$HEALTHCHECK_FILE"
fi

# Since /var/lib/mysql is the persistent volume,
# we don't need to do this every time the container boots,
# but TODO: this should really just be moved to the Dockerfile
if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo "Initializing mysql database"
	# TODO: It seems this chown is redundant, so try to remove it
	chown -R mysql:mysql /var/lib/mysql
	# Initializes the MariaDB data directory and creates the system tables in the mysql database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql

	echo "Initialized mysql database"
else
	echo "mysql database was already initialized"
fi

# Since /var/lib/mysql is the persistent volume,
# we don't need to do this every time the container boots,
# but TODO: this should really just be moved to the Dockerfile
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
