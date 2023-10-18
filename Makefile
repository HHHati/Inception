# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bade-lee <bade-lee@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/07 16:18:15 by bade-lee          #+#    #+#              #
#    Updated: 2023/10/18 17:14:15 by bade-lee         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PATH_COMPOSE = srcs/docker-compose.yml

all:
	@docker-compose -f $(PATH_COMPOSE) up -d

build:
	@docker-compose -f $(PATH_COMPOSE) up -d --build

down:
	@docker-compose -f $(PATH_COMPOSE) down

re:
	@docker-compose -f $(PATH_COMPOSE) up -d --build

clean: down
	@docker system prune -a

fclean:
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY: all build down re clean fclean