FROM alpine:3.21

RUN apk update && apk upgrade \
&& apk add --no-cache proftpd \
&& rm /var/cache/apk/*

RUN addgroup -S appgroup && adduser -S appuser -G appgroup \
&& echo "appuser:pass" | chpasswd \
&& mkdir -p /run/proftpd && touch /run/proftpd/proftpd.delay \
&& mkdir -p /var/www/trazanad.42.fr \
chown appuser:appuser /var/www

# USER appuser

COPY /conf/proftpd.conf /etc/proftpd/proftpd.conf

WORKDIR /var/www/trazanad.42.fr

EXPOSE 21


ENTRYPOINT ["proftpd", "--nodaemon"]
