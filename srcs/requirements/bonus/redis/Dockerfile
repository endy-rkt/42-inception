FROM alpine:3.21

RUN apk update && apk upgrade \
&& apk add --no-cache redis \
&& rm /var/cache/apk/*

COPY /conf/redis.conf /etc/redis.conf

ENTRYPOINT ["redis-server", "--bind", "0.0.0.0", "--protected-mode", "no"]
