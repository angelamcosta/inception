#!/bin/bash

if [ ! -d /run/mysqld ]
then

	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql
fi

if [ ! -d init.sql ]
then
echo 'Creating the init.sql file.'
cat << EOF > init.sql
	USE mysql;
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
	CREATE DATABASE IF NOT EXISTS $DB_NAME;
	CREATE USER IF NOT EXISTS '$DB_USER'@'%';
	SET PASSWORD FOR '$DB_USER'@'%' = PASSWORD('$DB_PASSWORD');
	CREATE USER IF NOT EXISTS '$WORDPRESS_ADMIN'@'%';
	SET PASSWORD FOR '$WORDPRESS_ADMIN'@'%' = PASSWORD('$DB_PASSWORD');
	GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USER'@'%';
	GRANT ALL PRIVILEGES ON wordpress.* TO '$WORDPRESS_ADMIN'@'%';
	FLUSH PRIVILEGES;
EOF

sed -i 's/^[ \t]*//' init.sql

mysqld --user=mysql --bootstrap < init.sql

fi

exec mysqld --user=mysql --console
