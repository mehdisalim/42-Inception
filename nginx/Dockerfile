FROM debian:stable-slim

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx openssl curl vim

RUN rm -rf /etc/nginx/conf.d/* /etc/nginx/nginx.conf

WORKDIR /etc/nginx

COPY conf.d/* conf.d

COPY nginx.conf .

COPY gamestore /usr/share/nginx/html

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
