FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -m 775 /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/bade-lee.key \
	-out /etc/nginx/ssl/bade-lee.crt \
	-subj "/C=FR/ST=Brussels/L=Brussels/O=19rm -f/OU=bade-lee/CN=bade-lee/"

COPY tools/config /etc/nginx/sites-available/default
COPY conf/nginx.conf /etc/nginx/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
