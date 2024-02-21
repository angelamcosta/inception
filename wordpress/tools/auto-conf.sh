#!/bin/bash

sleep 5

if [ ! -e /var/www/html/wp-config.php ]; then
   wp config create --dbhost=$DB_HOST \
                    --dbname=$DB_NAME \
                    --dbuser=$DB_USER \
                    --dbpass=$DB_PASSWORD \
                    --path='/var/www/html' \
                    --allow-root

    wp core install --title=$WORDPRESS_TITLE \
                    --admin_user=$DB_USER \
                    --admin_password=$DB_PASSWORD \
                    --admin_email=$WORDPRESS_ADMIN_EMAIL \
                    --url=$WORDPRESS_URL \
                    --allow-root

    wp user create $DB_USER $WORDPRESS_ADMIN_EMAIL \
                    --role=author --user_pass=$DB_PASSWORD \
                    --path='/var/www/html' >> /log.txt \
                    --allow-root
    
    wp user create $WORDPRESS_ADMIN $WORDPRESS_ADMIN_EMAIL \
                    --role=administrator --user_pass=$DB_PASSWORD \
                    --path='/var/www/html' >> /log.txt \
                    --allow-root

    wp plugin install https://downloads.wordpress.org/plugin/gutenberg.17.7.0.zip --activate --allow-root

    wp theme activate twentytwentythree --allow-root
fi

if [ ! -d /run/php ]; then
    mkdir /run/php
fi

/usr/sbin/php-fpm7.4 -F