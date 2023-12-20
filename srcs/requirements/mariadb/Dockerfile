FROM debian:oldstable

RUN apt update -y && apt upgrade -y

# gettext-base has envsubst
RUN apt install -y\
	mariadb-server\
	gettext-base

# TODO: What is this for?
RUN mkdir -p /var/run/mysqld;
RUN chmod 777 /var/run/mysqld /var/lib/mysql;

# TODO: What is this for?
RUN sed 's/bind-address .*/bind-address = mariadb/' -i /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/start.sh /home/start.sh
COPY tools/start.sql /home/start.sql

EXPOSE 3306

CMD [ "/home/start.sh" ]
