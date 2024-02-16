FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y

COPY tools/init-db.sh /init-db.sh
COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN sed -i 's/\r//' /init-db.sh

EXPOSE 3306

ENTRYPOINT ["/init-db.sh"]
