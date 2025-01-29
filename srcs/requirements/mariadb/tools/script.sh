#!/bin/bash

service mariadb start
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%'"
mysql -e "FLUSH PRIVILEGES"

service mariadb stop
exec mariadbd
