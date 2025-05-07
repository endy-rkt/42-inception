FROM alpine:3.21

RUN apk update && apk upgrade \
    && apk add --no-cache proftpd \
    && rm /var/cache/apk/*

COPY /conf/proftpd.conf /etc/proftpd/proftpd.conf

COPY conf/entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

WORKDIR /var/www/trazanad.42.fr

EXPOSE 21 60000-60010

ENTRYPOINT ["/entrypoint.sh"]