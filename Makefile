NAME = inception

all: $(NAME)

$(NAME):
	mkdir -p "/home/mababou/data/website"
	mkdir -p "/home/mababou/data/database"
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml build
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d
	bash ./srcs/requirements/wordpress/tools/check_install.sh

linux:
	echo "127.0.0.1 mababou.42.fr" >> /etc/hosts

clean:
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml stop
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml down

fclean: clean
	rm -rf /home/mababou/data/website/
	rm -rf /home/mababou/data/database/
	docker system prune -f --all --volumes
	docker volume rm -f inception_website
	docker volume rm -f inception_database
	docker system prune -f
	docker image prune -f -a


re: fclean all

.PHONY: linux all clean fclean re
