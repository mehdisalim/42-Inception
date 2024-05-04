#!/bin/bash

if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
    cd /var/www/html/wordpress
    rm -rf /var/www/html/wordpress/*

    wp core download --allow-root

    wp config create --allow-root \
        --dbname=${MYSQL_DATABASE} \
        --dbuser=${MYSQL_USER_NAME} \
        --dbpass=${MYSQL_USER_PASSWORD} \
        --dbhost=mariadb

    wp core install --allow-root \
        --url=${WORDPRESS_URL} \
        --title=${WORDPRESS_TITLE} \
        --admin_user=${WORDPRESS_ADMIN_NAME} \
        --admin_password=${WORDPRESS_ADMIN_PASSWD} \
        --admin_email=${WORDPRESS_ADMIN_EMAIL}

    wp user create "$MYSQL_USER_NAME" "$WORDPRESS_USER_EMAIL" \
        --role=editor \
        --user_pass=${MYSQL_USER_PASSWORD} \
        --path=/var/www/html/wordpress --allow-root

    chown -R www-data:www-data /var/www/html/
    chmod -R 777 /var/www/html/

fi

exec "$@"