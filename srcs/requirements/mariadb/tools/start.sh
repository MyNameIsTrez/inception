#!/bin/bash

if [ -f "$HEALTHCHECK_FILE" ]; then
	echo "Healthchech file already exists, removing it"
	rm "$HEALTHCHECK_FILE"
fi

# envsubst fills the environment variables from start.sql
# --bootstrap tells mariadbd to use its stdin
# --bootstrap has a very different description here?: https://mariadb.com/kb/en/mariadbd-options/#-bootstrap
echo "Bootstrapping mariadbd"
< /home/start.sql | envsubst | mariadbd --bind-address="mariadb" --bootstrap

# We're creating this file after bootstrapping is done
# to signal that the wordpress container can now start and use mariadb
# The reason we don't need a healthcheck for wordpress is because nginx
# will only access wordpress once a user requests a page
touch "$HEALTHCHECK_FILE"

echo "Running mariadbd"
mariadbd --bind-address="mariadb"
