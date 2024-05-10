FROM    debian:stable-slim

RUN     apt-get update -y && apt-get upgrade -y
RUN     apt-get install -y curl php8.2 php8.2-cli php8.2-fpm php8.2-mysql php8.2-mbstring php8.2-xml php8.2-json

RUN     curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN     mkdir -p /run/php
RUN     mkdir -p /var/www/html/wordpress
RUN     sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE  9000

COPY    tools/docker-entrypoint-initdb.sh /

RUN     chmod +x /docker-entrypoint-initdb.sh

ENTRYPOINT [ "/docker-entrypoint-initdb.sh" ]

CMD     ["php-fpm8.2", "-F"]