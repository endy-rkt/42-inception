FROM alpine:3.21

RUN apk update && apk upgrade \
&& apk add --no-cache mariadb mariadb-client \
&& rm /var/cache/apk/*

COPY conf/my.cnf /etc

RUN /usr/bin/mariadb-install-db --user=mysql --datadir=/var/lib/mysql

COPY  conf/secure_sql.sql /tmp

COPY  conf/setup.sh  /tmp/setup.sh

RUN chown -R mysql:mysql /var/lib/mysql && chmod 755 /tmp/setup.sh \
&& sh /tmp/setup.sh

ENTRYPOINT ["mariadbd"]

CMD ["--user=mysql"]