#!/bin/bash

# envsubst fills it with the environment variables
# --bootstrap tells mariadbd to use its stdin
< start.sql | envsubst | mariadbd --bind-address="mariadb" --bootstrap

# TODO: Does removing --bind-address break this program?
mariadbd --bind-address="mariadb"
