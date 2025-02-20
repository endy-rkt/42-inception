FROM alpine:3.21

RUN apk update && apk upgrade && apk add mariadb mariadb-client && rm /var/cache/apk/*

EXPOSE 3306

RUN mariadbd

ENTRYPOINT ["mariadb"]


