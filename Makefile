all:	build	up

build:
		docker compose build

# to run the services, we use docker compose up
# the flag -d stands for `detached` mode, ie,
# don't attach this terminal to the running services

up:
		docker compose up -d --build

down:
		docker compose down -v

clean:	down
		docker system prune -af;
		docker rmi -f $(docker images -qa);
		docker volume rm $(docker volume ls -q);
		docker network rm $(docker network ls -q) 2>/dev/null

.PHONY: build up down clean