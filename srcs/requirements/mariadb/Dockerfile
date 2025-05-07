FROM alpine:3.21

RUN apk update && apk upgrade \
  && apk add --no-cache mariadb mariadb-client \
  && rm /var/cache/apk/*

COPY conf/my.cnf /etc
COPY conf/init-db.sh /init-db.sh
COPY conf/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh  /init-db.sh \
  && mkdir -p /var/lib/mysql && mkdir -p /run/mysqld \
  && chown -R mysql:mysql /run/mysqld &&  chown -R mysql:mysql /var/lib/mysql

ENTRYPOINT ["/entrypoint.sh"]