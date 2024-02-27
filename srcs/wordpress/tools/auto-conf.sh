#!/bin/bash

sleep 5

if [ ! -d /run/php ]; then
    mkdir /run/php
fi

if [ ! -e /var/www/html/wp-config.php ]; then
    wp cli update --yes --allow-root

    wp core download --allow-root

    wp config create --dbhost=$DB_HOST \
                    --dbname=$DB_NAME \
                    --dbuser=$DB_USER \
                    --dbpass=$DB_PASSWORD \
                    --path='/var/www/html' \
                    --allow-root

    wp core install --title=$WORDPRESS_TITLE \
                    --admin_user=$WORDPRESS_ADMIN \
                    --admin_password=$DB_PASSWORD \
                    --admin_email=$WORDPRESS_ADMIN_EMAIL \
                    --url=$WORDPRESS_URL \
                    --allow-root

    wp user create $DB_USER $USER_EMAIL \
                    --role=author --user_pass=$DB_PASSWORD \
                    --allow-root

    wp theme install https://downloads.wordpress.org/theme/blogus.1.0.0.80.zip --activate --allow-root
	wp theme status blogus --allow-root

fi

/usr/sbin/php-fpm7.4 -F