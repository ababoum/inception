NAME = inception

all: $(NAME)

linux:
	echo "127.0.0.1 mababou.42.fr" >> /etc/hosts
	

clean:
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml stop
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml down

fclean: clean
	rm -rf /home/mababou/data/wp/
	rm -rf /home/mababou/data/db/
	docker system prune -f --all --volumes
	docker volume rm -f inception_website
	docker volume rm -f inception_database
	# docker system prune -f
	docker image prune -f -a 

$(NAME):
	mkdir -p "/home/mababou/data/wp"
	mkdir -p "/home/mababou/data/db"
	# docker-compose --env-file srcs/.env -f srcs/docker-compose.yml build
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d

re: fclean all

.PHONY: linux all clean fclean re
