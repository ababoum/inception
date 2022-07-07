NAME = inception

SRCS = srcs/requirements/nginx/Dockerfile \
		srcs/requirements/nginx/conf/nginx.conf \
		srcs/requirements/mariadb/Dockerfile \
		srcs/requirements/wordpress/Dockerfile \
		srcs/requirements/wordpress/tools/wp-config.php \
		srcs/requirements/wordpress/tools/wp_config.sh \
		srcs/requirements/redis/Dockerfile \
		srcs/requirements/redis/tools/redis.conf \
		srcs/requirements/adminer/Dockerfile \
		srcs/requirements/adminer/tools/adminer-4.8.1.php \
		srcs/requirements/duplicator/Dockerfile \
		srcs/requirements/duplicator/tools/backup_creator.sh \
		srcs/requirements/ftp/Dockerfile \
		srcs/requirements/ftp/tools/vsftpd.sh \
		srcs/requirements/static-website/Dockerfile \
		srcs/requirements/static-website/conf/httpd.conf \
		srcs/requirements/static-website/page/benichou.jpg \
		srcs/requirements/static-website/page/index.html \
		srcs/requirements/static-website/page/style.css


all: $(NAME)

$(NAME): $(SRCS)
	mkdir -p "/home/mababou/data/website"
	mkdir -p "/home/mababou/data/database"
	mkdir -p "/home/mababou/data/backup"
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml build
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d
	bash ./srcs/requirements/wordpress/tools/check_install.sh

linux:
	echo "127.0.0.1 mababou.42.fr" >> /etc/hosts
	echo "127.0.0.1 www.mababou.42.fr" >> /etc/hosts

clean:
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml stop
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml down

fclean: clean
	rm -rf /home/mababou/data/website/
	rm -rf /home/mababou/data/database/
	rm -rf /home/mababou/data/backup/
	docker system prune -f --all --volumes
	docker volume rm -f inception_website
	docker volume rm -f inception_database
	docker volume rm -f inception_backup
	docker system prune -f
	docker image prune -f --filter 'label=inception'


re: fclean all

.PHONY: linux all clean fclean re
