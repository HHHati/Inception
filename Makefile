# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bade-lee <bade-lee@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/07 16:18:15 by bade-lee          #+#    #+#              #
#    Updated: 2023/10/19 15:37:24 by bade-lee         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: up

up:
	docker compose -f ./srcs/docker-compose.yml build
	mkdir -p /home/bade-lee/data/mariadb
	mkdir -p /home/bade-lee/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --detach

down:
	docker compose -f ./srcs/docker-compose.yml down

rm: down
	docker volume rm srcs_mariadb_volume
	docker volume rm srcs_wordpress_volume
	docker image rm srcs_mariadb
	docker image rm srcs_wordpress
	docker image rm srcs_nginx
	docker image rm debian:bullseye
	sudo rm -rf /home/bade-lee/data

.PHONY: all up down clean fclean