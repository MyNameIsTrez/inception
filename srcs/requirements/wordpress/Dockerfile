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

# Remove wordpress tar
RUN rm -rf /var/www/wordpress.tar.gz

# Recursively change owner:group from nobody:nogroup to root:root of wordpress
RUN chown -R root:root /var/www/wordpress

# Download wp-cli PHP Archive to /usr/local/bin/
ADD https://raw.githubusercontent.com/wp-cli/builds/3e345df698faea02d64baebcb2fa6fc523231494/phar/wp-cli-release.phar /usr/local/bin/wp-cli-release.phar

# Allow executing wp-cli
RUN chmod +x /usr/local/bin/wp-cli-release.phar

# TODO: Can this be removed? I don't see it used explicitly anywhere
# -p creates parent directories if necessary
RUN mkdir -p /run/php

# COPY conf/wp-config.php /var/www/wordpress/wp-config.php

EXPOSE 9000
