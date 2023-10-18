FROM debian:bullseye

RUN apt-get update && apt-get install -y wget \
	iputils-ping \
	less \
	wget \
	php7.3-fpm \
	php7.3 \
	php7.3-mysql \
	php7.3-fpm \
	php7.3-curl \
	php7.3-gd \
	php7.3-intl \
	php7.3-mbstring \
	php7.3-soap \
	php7.3-xml \
	php7.3-xmlrpc \
	php7.3-zip \
	mariadb-server \
	mariadb-client \
	sendmail \
	&& rm -rf /var/lib/apt/lists/*

# Create Workdir linked to volume
RUN mkdir /app
WORKDIR /app

# Create autorization
RUN 		groupadd wordpress \
	&&		useradd -g wordpress wordpress \
	&&		chown -R wordpress:wordpress /app \
	&&		chmod -R 755 /app

# Download Wordpress cli
RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&&		chmod +x wp-cli.phar \
	&&		mv wp-cli.phar /bin/wp

# Download Wordpress
RUN			wget https://wordpress.org/wordpress-6.2.2.tar.gz \
	&&		tar -zxvf wordpress-6.2.2.tar.gz \
	&&		mv wordpress/* . \
	&&		rm -rf wordpress wordpress-6.2.2.tar.gz

COPY tools/start.sh /start.sh
COPY tools/php-fpm.conf /etc/php/7.3/fpm/

RUN			mkdir -p /run/php/ \
  	&&		mkdir -p /usr/logs/php-fpm \
	&&		chown -R wordpress:wordpress /run/php/ \
	&&		chown -R wordpress:wordpress /usr/logs/php-fpm \
	&&		chmod -R 755 /usr/logs/php-fpm \
	&&		chmod +x /start.sh

USER wordpress:wordpress
CMD ["/start.sh"]