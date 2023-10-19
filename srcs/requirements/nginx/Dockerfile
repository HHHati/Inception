FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl apache2

RUN rc-update add apache2

RUN mkdir -p /etc/nginx
COPY ./conf/nginx.conf /etc/nginx/
COPY ./tools/setup.sh  /

RUN chmod +x /setup.sh
ENTRYPOINT ["/setup.sh"]