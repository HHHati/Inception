FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -m 775 /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/bade-lee.key \
	-out /etc/nginx/ssl/bade-lee.crt \
	-subj "/C=BE/ST=Belgium/L=Brussels/O=42/OU=19/CN=bade-lee.42.fr/UID=bade-lee"

COPY tools/default /etc/nginx/sites-available/default
COPY conf/nginx.conf /etc/nginx/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
