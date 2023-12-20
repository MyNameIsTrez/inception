#!/bin/bash

if [ -f "$HEALTHCHECK_FILE" ]; then
	echo "Healthchech file already exists, removing it"
	rm "$HEALTHCHECK_FILE"
fi

# envsubst fills it with the environment variables
# --bootstrap tells mariadbd to use its stdin
# --bootstrap has a very different description here: https://mariadb.com/kb/en/mariadbd-options/#-bootstrap
# TODO: Marius and Victor have --bind-address="mariadb" here!
echo "Bootstrapping mariadbd"
< /home/start.sql | envsubst | mariadbd --bind-address="mariadb" --bootstrap
# < /home/start.sql | envsubst | mariadbd --bootstrap

# We're creating this file after bootstrapping is done
# to signal that the wordpress container can now start and use mariadb
touch "$HEALTHCHECK_FILE"

# TODO: ADD THIS BACK!!!
# TODO: Marius and Victor have --bind-address="mariadb" here!
echo "Running mariadbd"
mariadbd --bind-address="mariadb"
# mariadbd
