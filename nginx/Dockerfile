FROM debian:bullseye-slim

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl/certs && \
    mkdir -p /etc/nginx/ssl/private && \
    mkdir -p /var/run/nginx

RUN openssl req -newkey rsa:4096 -days 42 -nodes -x509 -out /etc/nginx/ssl/certs/anlima.crt -keyout /etc/nginx/ssl/private/anlima.key -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42/OU=42Lisboa/CN=anlima.42.fr/UID=anlima"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]