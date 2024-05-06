#!/bin/bash

if [ ! -f "/var/www/html/wordpress/wp-config.php" ];
then
    cd /var/www/html/wordpress
    rm -rf /var/www/html/wordpress/*
    wp core download --allow-root

    wp config create --allow-root --dbname=wordpress --dbuser=wordpress --dbpass=wordpress --dbhost=mariadb:3306

    wp core install --allow-root \
        --url=esalim.42.fr \
        --title="esalim-wp" \
        --admin_user=esalim \
        --admin_password=esalim \
        --admin_email=esalim@gmail.com

    wp user create "$MYSQL_USER_NAME" "esalim.42@gmail.com" \
        --role=editor \
        --user_pass=${MYSQL_USER_PASSWORD} \
        --path=/var/www/html/wordpress --allow-root

    chown -R www-data:www-data /var/www/html/
    chmod -R 777 /var/www/html/

fi

exec "$@"