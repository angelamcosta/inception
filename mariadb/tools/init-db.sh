#!/bin/bash

service mariadb start

echo "Creating database: ${DB_NAME}"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
echo "Creating user: ${DB_USER}"
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
echo "Granting privileges on ${DB_NAME} to ${DB_USER}"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
echo "Altering root user password"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
echo "Flushing privileges"
mysql -e "FLUSH PRIVILEGES;"

exec mysqld_safe
