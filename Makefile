# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bade-lee <bade-lee@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/23 08:48:43 by bade-lee          #+#    #+#              #
#    Updated: 2023/10/23 09:24:25 by bade-lee         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


all:
	@mkdir -p /home/bade-lee/data/mysql
	@mkdir -p /home/bade-lee/data/html
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean: down
	@docker compose -f ./srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@sudo rm -rf /home/bade-lee/data/mysql
	@sudo rm -rf home/bade-lee/data/html

re: fclean all

.PHONY: all re down clean