#!/bin/bash

# wait for MariaDB to start
sleep 10

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    wp config create --allow-root \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASSWORD \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'

fi

/usr/sbin/php-fpm7.3 -F
