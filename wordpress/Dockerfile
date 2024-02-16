FROM debian:bullseye

WORKDIR /var/www/html

RUN apt-get update -y && \
    apt-get upgrade -y

RUN apt-get install -y wget php-fpm php-mysql mariadb-client dos2unix

COPY tools/auto-conf.sh /
RUN dos2unix /auto-conf.sh && \
    chmod +x /auto-conf.sh
COPY tools/index.php /var/www/html/index.php
COPY tools/php.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://wordpress.org/latest.tar.gz -P /var/www/ && \
    tar -xvf /var/www/latest.tar.gz -C /var/www/html --strip-components=1 && \
    rm /var/www/latest.tar.gz

RUN chown -R www-data:www-data /var/www/html && \
    find /var/www/html -type d -exec chmod 755 {} \; && \
    find /var/www/html -type f -exec chmod 644 {} \;

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

ENTRYPOINT ["/bin/bash", "/auto-conf.sh"]
