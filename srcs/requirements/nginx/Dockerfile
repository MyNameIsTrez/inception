FROM debian:bullseye

# Install nginx
RUN apt update
RUN apt install -y nginx

# This will store the certificate and key for a secure connection
RUN mkdir -p /etc/nginx/ssl
