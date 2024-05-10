#!/bin/sh

echo "
FLUSH PRIVILEGES;
ALTER USER '${MYSQL_ADMIN_NAME}'@'localhost' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER_NAME}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_NAME}'@'%';
FLUSH PRIVILEGES;" | mariadbd -u mysql --bootstrap

exec "$@"