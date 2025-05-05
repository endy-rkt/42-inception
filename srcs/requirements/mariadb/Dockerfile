FROM alpine:3.21

RUN apk update && apk upgrade \
&& apk add --no-cache mariadb mariadb-client \
&& rm /var/cache/apk/*

COPY conf/my.cnf /etc

RUN /usr/bin/mariadb-install-db --user=mysql --datadir=/var/lib/mysql

COPY  conf/init_user.sql /

COPY  conf/secure_sql.sql /

COPY  conf/setup.sh  /setup.sh

RUN chown -R mysql:mysql /var/lib/mysql && chmod -R 755 /var/lib/mysql \
&& chmod 755 /setup.sh && /bin/sh /setup.sh

ENTRYPOINT ["mariadbd"]

CMD ["--user=mysql"]