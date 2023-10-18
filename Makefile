# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bade-lee <bade-lee@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/07 16:18:15 by bade-lee          #+#    #+#              #
#    Updated: 2023/10/18 15:00:05 by bade-lee         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PATH_COMPOSE = ./srcs/docker-compose.yml

all:
	@sudo docker-compose -f $(PATH_COMPOSE) up -d

build:
	@sudo docker-compose -f $(PATH_COMPOSE) up -d --build

down:
	@sudo docker-compose -f $(PATH_COMPOSE) down

re:
	@sudo docker-compose -f $(PATH_COMPOSE) up -d --build

clean: down
	@sudo docker system prune -a

fclean:
	@sudo docker stop $$(docker ps -qa)
	@sudo docker system prune --all --force --volumes
	@sudo docker network prune --force
	@sudo docker volume prune --force

.PHONY: all build down re clean fclean