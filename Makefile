all:	build	up

build:
	docker-compose build

# to run the services, we use docker-compose up
# the flag -d stands for `detached` mode, ie,
# don't attach this terminal to the running services

up:
		docker-compose up -d

down:
		docker-compose down

clean:
		docker-compose down -v

.PHONY: build up down clean