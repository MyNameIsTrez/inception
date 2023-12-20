#!/bin/bash

# envsubst fills it with the environment variables
# --bootstrap tells mariadbd to use its stdin
# --bootstrap has a very different description here: https://mariadb.com/kb/en/mariadbd-options/#-bootstrap
# TODO: Marius and Victor have --bind-address="mariadb" here!
< /home/start.sql | envsubst | mariadbd --bind-address="mariadb" --bootstrap
# < /home/start.sql | envsubst | mariadbd --bootstrap

echo 'start.sh bootstrapped mariadbd and will now run mariadbd in the background'

# TODO: ADD THIS BACK!!!
# TODO: Marius and Victor have --bind-address="mariadb" here!
mariadbd --bind-address="mariadb"
# mariadbd
