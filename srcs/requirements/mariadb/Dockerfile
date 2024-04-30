FROM debian:stable-slim

RUN apt-get update && apt-get upgrade
RUN apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysqld

COPY    conf/my.cnf /etc

RUN chmod 777 /var/run/mysqld /run/mysqld /var/lib/mysql


ENV MYSQL_ADMIN_PASSWORD=wordpress
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER_NAME=wordpress
ENV MYSQL_USER_PASSWORD=wordpress


COPY ./tools/docker-entrypoint-initdb.sh /

RUN mysql_install_db --skip-test-db

RUN chmod +x /docker-entrypoint-initdb.sh

EXPOSE 3306

ENTRYPOINT  ["sh", "/docker-entrypoint-initdb.sh"]

CMD     ["mariadbd"]