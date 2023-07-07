FROM debian:buster

# Installer mettre a jour apt et installer wordpress
RUN apt update
RUN apt upgrade
RUN apt install wget -y
RUN apt install -y php7.3\
				php-fpm\
				php-mysql\
				mariadb-client\
				curl
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

# De-tar le fichier
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# Donner les droits a root
RUN	chown -R root:root /var/www/wordpress

# Modifier le fichier de config de PHP
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# 
RUN	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp
RUN	chmod +x ./usr/bin/wp
