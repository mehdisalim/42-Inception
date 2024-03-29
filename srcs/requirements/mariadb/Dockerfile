# FROM debian:stable-slim

# RUN apt-get update && \
#     apt-get install -y mariadb-server

# RUN mkdir -p /var/run/mysqld
# RUN chmod 777 /var /var/run /var/run/mysqld /run/mysqld /var/lib/mysql

# COPY ./tools/* /

# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db

# # RUN chmod +x /s.sh

# EXPOSE 3306

# CMD ["mariadbd"]

# FROM    debian:stable-slim

# RUN     apt-get update -y && apt-get upgrade -y

# RUN     apt-get install -y mariadb-server

# RUN     service mariadb start

# COPY    conf/mysql	/var/lib/mysql

# COPY	tools/*		/

# RUN     chmod +x /docker-entrypoint-initdb.sh

# EXPOSE  3036

# ENTRYPOINT [ "sh", "/docker-entrypoint-initdb.sh" ]

# CMD ["mariadbd", "--user=wp_user", "--bind-address=0.0.0.0"]
# # CMD    ["yes"]

# Use the official Debian image as the base image
FROM debian:stable-slim

# Maintainer information
# LABEL maintainer="Your Name <your.email@example.com>"

# Install MariaDB Server and client
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for MariaDB configuration
ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=myuserpassword

# Initialize MariaDB database
RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Start MariaDB service
CMD ["mysqld_safe"]

# Expose the MySQL port
EXPOSE 3306