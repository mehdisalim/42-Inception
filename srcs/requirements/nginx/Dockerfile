FROM	debian:stable-slim

RUN		apt-get update -y && apt-get upgrade -y
RUN		apt-get install -y nginx openssl

WORKDIR	/etc/nginx

RUN     mkdir ssl

RUN     openssl req -x509 -trustout -sha256 -days 356 -nodes -newkey rsa:2048 -subj "/CN=${SSL_DOMAIN_NAME}/C=${SSL_COUNTRY_NAME}/L=${SSL_CITY_NAME}" -keyout ssl/server.key -out ssl/server.crt

RUN		rm -rf conf.d/* sites-enabled/*

COPY	conf/* conf.d

EXPOSE	443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
