FROM    debian:stable-slim

RUN     apt-get update
RUN     apt-get install -y mariadb-server

EXPOSE  3306

LABEL   version="1.0"
LABEL   description="MariaDB Server"

HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 202

CMD ["mariadbd"]



# FROM    debian:stable-slim

# RUN     apt-get update -y && apt-get upgrade -y

# RUN     apt-get install -y mariadb-server

# COPY    conf/mysql	/var/lib/mysql

# COPY	tools/*		/


# ENTRYPOINT [ "sh", "docker-entrypoint-initdb.sh" ]

# # CMD     [ "yes" ]
