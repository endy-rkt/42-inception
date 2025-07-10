FROM alpine:3.21

RUN apk update && apk upgrade \
    && apk add --no-cache nginx \
    && rm /var/cache/apk/*

RUN mkdir /etc/nginx/cert \
    && mkdir -p /var/www/trazanad.42.fr && chmod -R 755 /var/www/trazanad.42.fr \
    && adduser -S www-data -G www-data \
    && chown -R www-data:www-data /var/www/trazanad.42.fr

COPY conf/secret.key /etc/nginx/cert/secret.key

COPY conf/secret.crt /etc/nginx/cert/secret.crt

COPY conf/trazanad.42.fr.conf /etc/nginx/http.d

COPY conf/nginx.conf /etc/nginx

EXPOSE 443

ENTRYPOINT ["nginx"]

CMD ["-g", " daemon off;"]