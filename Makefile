NAME = inception

all: prune reload

linux:
	@echo "127.0.0.1 mababou.42.fr" >> /etc/hosts
	
stop:
	docker-compose -f srcs/docker-compose.yml stop

clean: stop
	docker-compose -f srcs/docker-compose.yml down

prune: clean
	docker system prune -f
	docker image prune -f -a 

reload:
	mkdir -p "/home/mababou/data/wp"
	mkdir -p "/home/mababou/data/db"
	@docker-compose -f srcs/docker-compose.yml up -d --build

fclean:
	rm -rf /home/mababou/data/wp/

.PHONY: linux stop clean prune reload all fclean
