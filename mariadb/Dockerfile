FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server

RUN mkdir -p /conf && chmod 755 /conf
COPY /tools/init-db.sh /conf
COPY /tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT ["/bin/bash", "/conf/init-db.sh"]
