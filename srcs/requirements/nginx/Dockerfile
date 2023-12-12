FROM debian:bullseye

# Install nginx
RUN apt update
RUN apt install -y\
	nginx\
	openssl

# This will store the certificate and key for a secure connection
RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/OU=Me/CN=sbos"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
# TODO: Try to remove this:
RUN chown -R www-data:www-data /var/www/html

# Run nginx in the foreground so the container does not stop
CMD [ "nginx", "-g", "daemon off;" ]
