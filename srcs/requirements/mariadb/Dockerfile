FROM    debian:stable-slim

RUN     apt-get update -y && apt-get upgrade -y

RUN     apt-get install -y mariadb-server

RUN     service mariadb start

COPY    conf/mysql	/var/lib/mysql

COPY	tools/*		/

ENTRYPOINT [ "sh", "docker-entrypoint-initdb.sh" ]