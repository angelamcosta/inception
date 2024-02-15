#!bin/bash

if [ ! -d /run/mysqld ]
then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
	chown -R mysql:mysql /var/lib/mysql

	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql 

cat << EOF > init.sql
	USE mysql;
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
	CREATE DATABASE IF NOT EXISTS $DB_NAME;
	CREATE USER IF NOT EXISTS '$DB_USER'@'%';
	SET PASSWORD FOR '$DB_USER'@'%' = PASSWORD('$DB_PASSWORD');
	GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USER'@'%';
	GRANT ALL ON wordpress.* to '$DB_USER'@'%';
	FLUSH PRIVILEGES;
EOF

mysqld --user=mysql --bootstrap < init.sql

fi

echo "⋆｡ﾟ☁︎｡⋆｡ ﾟ☾ ﾟ｡⋆ MariaDB started ⋆｡ﾟ☁︎｡⋆｡ ﾟ☾ ﾟ｡⋆ପ(๑•ᴗ•๑)ଓ ♡"
echo "ପ૮๑ᵔ ᵕ ᵔ๑ აଓ"

exec mysqld --user=mysql --console
