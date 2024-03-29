all:	build	up

build:
		mkdir -p /home/anlima/data/mariadb
		mkdir -p /home/anlima/data/wordpress
		docker compose build

# to run the services, we use docker compose up
# the flag -d stands for `detached` mode, ie,
# don't attach this terminal to the running services

up:
		docker compose up -d --build

down:
		docker compose down -v

clean:	down
		rm -rf /home/anlima/data/mariadb
		rm -rf /home/anlima/data/wordpress
		@docker images -q > /dev/null 2>&1 && docker rmi -f $(docker images -qa) || true
		@docker network ls -q > /dev/null 2>&1 && docker network rm $(docker network ls -q) || true
		@docker volume ls -q > /dev/null 2>&1 && docker volume rm $(docker volume ls -q) || true
		docker system prune -af


.PHONY: build up down clean