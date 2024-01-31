FROM debian:bullseye-slim

WORKDIR /var/www/wordpress

RUN apt-get update && apt upgrade -y
RUN apt-get update && apt-get install -y wget php7.3 php-fpm php-mysql mariadb-client

RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www/
RUN cd /var/www/ && tar -xvf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /conf
COPY tools/auto-conf.sh /conf/auto-conf.sh
COPY conf/index.php /conf/index.php

COPY conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chown -R root:root /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["/bin/bash", "/conf/auto-conf.sh", "php-fpm7.3"]