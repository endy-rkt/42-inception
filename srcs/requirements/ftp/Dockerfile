FROM alpine:3.21

RUN apk update && apk upgrade \
&& apk add --no-cache proftpd \
&& rm /var/cache/apk/*

RUN mkdir -p /run/proftpd && touch /run/proftpd/proftpd.delay

EXPOSE 21

ENTRYPOINT ["proftpd", "--nodaemon"]