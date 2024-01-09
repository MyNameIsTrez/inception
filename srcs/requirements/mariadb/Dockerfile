FROM debian:oldstable

RUN apt update -y && apt upgrade -y

# gettext-base provides the envsubst command
RUN apt install -y\
	mariadb-server\
	gettext-base

# Not sure what this does, but removing it breaks mariadb
RUN mkdir -p /var/run/mysqld;\
	chmod 777 /var/run/mysqld /var/lib/mysql;

# Allows wordpress to connect using the name mariadb
RUN sed 's/bind-address .*/bind-address = mariadb/' -i /etc/mysql/mariadb.conf.d/50-server.cnf

# Connect mariadb with the database_volume /var/lib/mysql
# we set up in docker-compose.yml
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# It's an environment variable since start.sh also uses it
ENV HEALTHCHECK_FILE=/usr/health

# Check 20 times, once per second, whether the file exists
# `test -e <path>` exits with 0 if the file exists
HEALTHCHECK --interval=1s --retries=20\
	CMD test -e "$HEALTHCHECK_FILE"

COPY tools/start.sh /home/start.sh
COPY tools/start.sql /home/start.sql
CMD [ "/home/start.sh" ]
