FROM alpine:3.21

RUN apk update && apk upgrade \
  && apk add --no-cache mariadb mariadb-client \
  && rm /var/cache/apk/*

COPY conf/my.cnf /etc

COPY conf/init_user.sql /

COPY conf/secure_sql.sql /

COPY conf/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
&& mkdir -p /var/lib/mysql && mkdir -p /run/mysqld \
&& chown -R mysql:mysql /run/mysqld && chmod -R 755 /run/mysqld

ENTRYPOINT ["/entrypoint.sh"]
# CMD ["--user=mysql"]