# mariadb dockerfile for testing
FROM debian:bullseye-slim

# -p create the parent directories (/var/lib) if they don't exist
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    mkdir -p /var/lib/mysql && \
    mysql_install_db --user=mysql --ldata=/var/lib/mysql --force

COPY ./tools/init-db.sh /

CMD ["/init-db.sh"]
