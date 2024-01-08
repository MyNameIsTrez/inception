FROM debian:oldstable

RUN apt update -y && apt upgrade -y

# openssh-server is needed for wp-cli's config create
RUN apt install -y\
	php7.4\
	php7.4-fpm\
	php7.4-mysql\
	mariadb-client\
	openssh-server

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

# TODO: Can this be removed? I don't see it used explicitly anywhere
# -p creates parent directories if necessary
RUN mkdir -p /run/php

# TODO: Do I need this?
# Changes the address on which to accept FastCGI requests from the default value of "/run/php/php7.4-fpm.sock"
RUN sed 's/listen = .*/listen = wordpress:9000/' -i /etc/php/7.4/fpm/pool.d/www.conf

# TODO: Do I need this?
# Prevents arbitrary environment variables from reaching FPM worker processes
# This sed command is turning this comment into an executed line
RUN sed 's/;clear_env = no/clear_env = no/' -i /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

COPY tools/start.sh /home/start.sh
CMD [ "/home/start.sh" ]
