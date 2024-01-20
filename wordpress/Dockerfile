FROM debian:bullseye-slim

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysql && \
    apt-get install curl -y

COPY ./tools/auto-conf.sh /
RUN chmod +x auto-conf.sh
COPY ./conf/wp-config.php /

RUN mkdir -p /run/php

CMD ["/auto-conf.sh"]
