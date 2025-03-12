# NAME = Inception
# DOCKERFILES = $(addprefix srcs/requirements/, mariadb/Dockerfile ) # nginx/Dockerfile wordpress/Dockerfile

# DOCKER_COMPOSE = srcs/docker-compose.yaml

# .PHONY: $(NAME)

# $(NAME): $(DOCKERFILES) $(DOCKER_COMPOSE)
# 	cd srcs && docker compose up -d
all: mariadb_data 
	make images
	make up

images:
	docker-compose -f srcs/docker-compose.yaml build

up:
	docker compose -f srcs/docker-compose.yaml up -d

down:
	cd srcs && docker compose down

clean: 
	docker compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	sudo rm -rf /home/alli/data/mariadb
	sudo rm -rf /home/alli/data/wordpress
	sudo rm -rf /home/alli/data
	docker system prune -f --volumes
	
all:
	$(NAME)

re: fclean all