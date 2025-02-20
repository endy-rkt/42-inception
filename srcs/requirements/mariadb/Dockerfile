FROM alpine:3.21

RUN apk update && apk upgrade \
&& apk add --no-cache mariadb mariadb-client \
&& rm /var/cache/apk/*

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld \
&& mkdir -p /var/lib/mysql && chown mysql:mysql /var/lib/mysql

COPY conf/my.cnf /etc

RUN /usr/bin/mariadb-install-db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["mariadbd-safe"]

CMD ["--user=mysql"]