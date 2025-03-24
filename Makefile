NAME = Inception
DOCKERFILES = $(addprefix srcs/requirements/, mariadb/Dockerfile nginx/Dockerfile wordpress/Dockerfile) #  

DOCKER_COMPOSE = srcs/docker-compose.yml

.PHONY: all up down clean fclean re

up: $(DOCKER_COMPOSE)
	sudo mkdir -p /home/alli/data/mariadb
	sudo mkdir -p /home/alli/data/wordpress
	cd srcs && docker compose up --build -d

down:
	cd srcs && docker compose down

clean: 
	docker compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	sudo rm -rf /home/alli/data
	docker system prune -f --volumes
	
all:
	up

re: fclean all