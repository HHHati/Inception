all:
	@mkdir -p /home/bade-lee/data/mysql
	@mkdir -p /home/bade-lee/data/html
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./scrs/docker-compose.yml down

re:
	@docker compose -f ./scrs/docker-compose.yml up -d --build

fclean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);
	@sudo rm -rf /home/bade-lee/data/mysql
	@sudo rm -rf home/bade-lee/data/html

.PHONY: all re down clean