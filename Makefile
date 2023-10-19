# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bade-lee <bade-lee@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/07 16:18:15 by bade-lee          #+#    #+#              #
#    Updated: 2023/10/19 16:41:38 by bade-lee         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@if [ ! -d "/home/bade-lee/data/mysql" ]; then \
		mkdir -p /home/bade-lee/data/mysql; \
	fi
	@if [ ! -d "/home/bade-lee/data/html" ]; then \
		mkdir -p /home/bade-lee/data/html; \
	fi
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f  ./srcs/docker-compose.yml down

clean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@if [ -d "/home/bade-lee/data" ]; then \
	rm -rf /home/bade-lee/data/* && \
	echo "successfully removed all contents from /home/bade-lee/data"; \
	fi;

prune:
	docker system prune --all --force --volumes

reset:
	docker stop $$(docker ps -qa) ; docker rm $$(docker ps -qa) ; \
	docker rmi -f $$(docker images -qa) ; docker volume rm $$(docker volume ls -q) ; \
	docker network rm $$(docker network ls -q)

re: fclean all

info:
		@echo "=============================== IMAGES ==============================="
		@docker images
		@echo
		@echo "============================= CONTAINERS ============================="
		@docker ps -a
		@echo
		@echo "=============== NETWORKS ==============="
		@docker network ls
		@echo
		@echo "====== VOLUMES ======"
		@docker volume ls