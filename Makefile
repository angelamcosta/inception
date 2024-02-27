all:	build	up

build:
	docker compose build

# to run the services, we use docker compose up
# the flag -d stands for `detached` mode, ie,
# don't attach this terminal to the running services

up:
		docker compose up -d --build

down:
		docker compose down

clean:
		docker compose down -v
		docker rmi -f $(docker images -qa);
		docker network rm $(docker network ls -q) 2>/dev/null
		docker volume rm $(docker volume ls -q);

.PHONY: build up down clean