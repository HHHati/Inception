# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bade-lee <bade-lee@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/07 16:18:15 by bade-lee          #+#    #+#              #
#    Updated: 2023/07/07 16:47:18 by bade-lee         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PATH_COMPOSE = ./srcs/docker-compose.yml

all:
	@sudo docker compose -f $(PATH_COMPOSE) up -d --build

down:
	@sudo docker compose -f $(PATH_COMPOSE) down

re:
	@sudo docker compose -f $(PATH_COMPOSE) up -d --build

clean:
	@sudo docker stop $$(docker ps -qa);\
	sudo docker rm $$(docker ps -qa);\
	sudo docker rmi -f $$(docker images -qa);\
	sudo docker volume rm $$(docker volume ls -q);\
	sudo docker network rm $$(docker network ls -q);\

.PHONY: all re down clean