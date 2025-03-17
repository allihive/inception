NAME = Inception
DOCKERFILES = $(addprefix srcs/requirements/, mariadb/Dockerfile nginx/Dockerfile wordpress/Dockerfile) #  

DOCKER_COMPOSE = srcs/docker-compose.yaml

.PHONY: $(NAME)

$(NAME): $(DOCKER_COMPOSE)
	cd srcs && docker compose up --build -d

down:
	cd srcs && docker compose down

clean: 
	docker compose -f srcs/docker-compose.yaml down --rmi all -v

fclean: clean
	sudo rm -rf /home/alli/data/mariadb
	sudo rm -rf /home/alli/data/wordpress
	sudo rm -rf /home/alli/data
	docker system prune -f --volumes
	
all:
	sudo mkdir -p /home/alli/data/mariadb
	sudo mkdir -p /home/alli/data/wordpress
	$(NAME)


re: fclean all