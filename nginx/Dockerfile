FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx && \
    apt-get install -y openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN cat ./conf/nginx.conf >> /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=PT/L=Lisbon/O=42/OU=student/CN=anlima.42.pt/UID=anlima"
RUN mkdir -p /var/run/nginx

COPY ./tools/start.sh /
RUN chmod +x start.sh

CMD ["/start.sh"]
