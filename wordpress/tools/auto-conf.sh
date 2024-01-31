#!/bin/bash

sleep 10

mv /conf/index.php /var/www/wordpress/index.php

if [ ! -e /var/www/wordpress/wp-config.php ]; then
   wp config create --dbhost=$DB_HOST \
                    --dbname=$DB_NAME \
                    --dbuser=$DB_USER \
                    --dbpass=$DB_PASSWORD \
                    --path='/var/www/wordpress' \
                    --allow-root

    wp core install --title=$WORDPRESS_TITLE \
                    --admin_user=$WORDPRESS_ADMIN_USER \
                    --admin_password=$ROOT_PASSWORD \
                    --admin_email=$WORDPRESS_ADMIN_EMAIL \
                    --url=$WORDPRESS_URL \
                    --allow-root

    wp user create $WORDPRESS_ADMIN_USER $WORDPRESS_ADMIN_EMAIL \
                    --role=author --user_pass=$ROOT_PASSWORD \
                    --path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d /run/php ]; then
    mkdir /run/php
fi
