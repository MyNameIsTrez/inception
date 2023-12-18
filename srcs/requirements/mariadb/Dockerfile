FROM debian:bullseye

RUN apt update -y && apt upgrade -y

# gettext-base has envsubst
RUN apt install -y\
	mariadb-server\
	gettext-base

EXPOSE 3306

COPY tools/start.sh /home/start.sh
COPY tools/start.sql /home/start.sql

EXPOSE 3306

CMD [ "/home/start.sh" ]
