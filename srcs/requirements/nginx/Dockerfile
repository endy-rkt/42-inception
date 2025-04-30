FROM alpine:3.21

RUN apk update && apk upgrade \
&& apk add --no-cache nginx openssl proftpd \
&& rm /var/cache/apk/*

RUN mkdir /etc/nginx/cert \
&& openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/cert/secret.key -x509 -days 365 \
-out /etc/nginx/cert/secret.crt -subj "/C=MG/ST=Madagascar/L=Antananarivo/O=42/OU=42Antananarivo/CN=trazanad.42.fr"

RUN mkdir -p /run/proftpd && touch /run/proftpd/proftpd.delay && exec proftpd

COPY conf/trazanad.42.fr.conf /etc/nginx/http.d

COPY conf/nginx.conf /etc/nginx

EXPOSE 443

ENTRYPOINT ["nginx"]

CMD ["-g", " daemon off;"]