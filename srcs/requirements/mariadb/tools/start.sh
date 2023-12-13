# envsubst fills it with the environment variables
< start.sql | envsubst | mariadbd --bind-address="mariadb" --bootstrap

# TODO: Does removing --bind-address break this program?
mariadbd --bind-address="mariadb"
