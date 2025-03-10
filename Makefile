NAME = Inception
DOCKERFILES = $(addprefix srcs/requirements/, mariadb/Dockerfile \
					nginx/Dockerfile \
					wordpress/Dockerfile)

DOCKER_COMPOSE = srcs/docker-compose.yaml

$(NAME): $(DOCKERFILES) $(DOCKER_COMPOSE)
	cd srcs && docker compose up -d

down:
	cs srcs && docker compose down

clean: 
	make down

fclean:
	make clean
	
all:
	make $(NAME)

re:
	make fclean
	make all