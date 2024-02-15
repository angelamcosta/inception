FROM debian:bullseye

WORKDIR /var/www/wordpress

RUN apt-get update -y && \
    apt-get upgrade -y

RUN apt-get install -y wget php-fpm php-mysql mariadb-client

COPY tools/auto-conf.sh /
COPY tools/index.php /var/www/wordpress/index.php
COPY tools/php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www/
RUN cd /var/www/ && tar -xvf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["/bin/bash", "/auto-conf.sh"]
