FROM debian:stable-slim

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysql


RUN chmod 777 /var/run/mysqld /run/mysqld /var/lib/mysql


ENV MYSQL_ADMIN_PASSWORD=wordpress
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER_NAME=wordpress
ENV MYSQL_USER_PASSWORD=wordpress


COPY ./tools/docker-entrypoint-initdb.sh /

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db

RUN chmod +x /docker-entrypoint-initdb.sh

EXPOSE 3306

ENTRYPOINT  ["sh", "/docker-entrypoint-initdb.sh"]

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]