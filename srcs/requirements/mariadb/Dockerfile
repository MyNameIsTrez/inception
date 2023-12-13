FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y\
	mariadb-server

EXPOSE 3306

COPY tools/start.sh /home/start.sh
COPY tools/start.sql /home/start.sql

CMD [ "/home/start.sh" ]
