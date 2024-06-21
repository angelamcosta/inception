FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl curl

RUN mkdir -p /etc/nginx/ssl/certs && \
    mkdir -p /etc/nginx/ssl/private &&

RUN openssl req -newkey rsa:4096 -days 42 -nodes -sha256 -x509 -out /etc/nginx/ssl/certs/anlima.crt -keyout /etc/nginx/ssl/private/anlima.key -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42/OU=42Lisboa/CN=anlima.42.fr/UID=anlima"

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
