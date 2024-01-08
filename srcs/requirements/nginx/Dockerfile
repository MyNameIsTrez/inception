FROM debian:oldstable

RUN apt update -y && apt upgrade -y

RUN apt install -y\
	nginx\
	openssl

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN mkdir -p /var/www

# Removes everything in sites-enabled/
# Forces symlink of sites-available/nginx.conf under the name sites-enabled/nginx.conf
RUN rm -rf /etc/nginx/sites-enabled/* &&\
	ln -sf /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

# Generate the certificate and key for a secure connection
RUN mkdir -p /etc/nginx/ssl &&\
	openssl req\
	-x509\
	-nodes\
	-out\
	/etc/nginx/ssl/inception.crt\
	-keyout /etc/nginx/ssl/inception.key\
	-subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/OU=Me/CN=sbos"

EXPOSE 443

# Run nginx in the foreground so the container doesn't stop
CMD [ "nginx", "-g", "daemon off;" ]
