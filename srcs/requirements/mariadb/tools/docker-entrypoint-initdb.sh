#!/bin/sh

echo "
FLUSH PRIVILEGES;
ALTER USER '${MYSQL_ADMIN_NAME}'@'localhost' IDENTIFIED BY '$(< /run/secrets/mysql_root_password)';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER_NAME}'@'%' IDENTIFIED BY '$(< /run/secrets/mysql_user_password)';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_NAME}'@'%';
FLUSH PRIVILEGES;"

echo "
FLUSH PRIVILEGES;
ALTER USER '${MYSQL_ADMIN_NAME}'@'localhost' IDENTIFIED BY '$(< /run/secrets/mysql_root_password)';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER_NAME}'@'%' IDENTIFIED BY '$(< /run/secrets/mysql_user_password)';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_NAME}'@'%';
FLUSH PRIVILEGES;" | mariadbd -u mysql --bootstrap

exec "$@"