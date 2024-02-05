FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN chmod -R 755 /var/lib/mysql

COPY /tools/50-server.cnf /etc/mysql/my.cnf
COPY /tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["mariadbd"]
