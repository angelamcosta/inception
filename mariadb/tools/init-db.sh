#!/bin/bash

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES ;" >> db1.sql

mysql -u root --password=$ROOT_PASSWORD < db1.sql

# process needs to be killed (see the glossary in readme)
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld_safe