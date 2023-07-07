FROM debian:buster

# Installer mettre a jour apt et installer mariaDB
RUN apt update
RUN apt upgrade
RUN apt install mariadb-server -y

# Donner les droits pour executer le script
COPY ./tools/script.sh /script.sh
RUN chmod +x script.sh

# Modifier le fichier de config de mariaDB
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Executer le script
RUN bash ./script.sh

# Lancer la DB
CMD mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
CMD exec mysqld_safe
