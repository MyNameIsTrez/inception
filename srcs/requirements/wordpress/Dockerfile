FROM debian:oldstable

RUN apt update -y && apt upgrade -y

RUN apt install -y\
	php7.4\
	php7.4-fpm\
	php7.4-mysql\
	mariadb-client

# Download wordpress
ADD https://wordpress.org/wordpress-6.4.2.tar.gz /var/www/wordpress.tar.gz

# Untar wordpress to /var/www/
RUN tar -xzf /var/www/wordpress.tar.gz -C /var/www/

RUN mv /var/www/wordpress/* /var/www/

RUN rmdir /var/www/wordpress

# Remove wordpress tar
RUN rm /var/www/wordpress.tar.gz

# Recursively change owner:group from nobody:nogroup to root:root of wordpress
RUN chown -R root:root /var/www/

# Download wp-cli PHP Archive to /usr/local/bin/
ADD https://raw.githubusercontent.com/wp-cli/builds/3e345df698faea02d64baebcb2fa6fc523231494/phar/wp-cli-release.phar /usr/local/bin/wp-cli.phar

# Allow executing wp-cli
RUN chmod +x /usr/local/bin/wp-cli.phar

# Prevents this error:
# "ERROR: Unable to create the PID file (/run/php/php7.4-fpm.pid).: No such file or directory"
RUN mkdir -p /run/php

# Changes the address on which to accept FastCGI requests from the default value of "/run/php/php7.4-fpm.sock"
RUN sed 's/listen = .*/listen = wordpress:9000/' -i /etc/php/7.4/fpm/pool.d/www.conf

# Prevents arbitrary environment variables from reaching FPM worker processes
# This sed command is turning this comment into an executed line
RUN sed 's/;clear_env = no/clear_env = no/' -i /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

COPY tools/start.sh /home/start.sh
CMD [ "/home/start.sh" ]
