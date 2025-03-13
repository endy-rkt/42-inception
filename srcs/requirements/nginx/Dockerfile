FROM alpine:3.21

RUN apk update && apk upgrade \
&& apk add --no-cache nginx \
&& rm /var/cache/apk/*

COPY cert/secret.key /etc/nginx

COPY cert/secret.crt /etc/nginx

COPY conf/default.conf /etc/nginx/http.d

COPY conf/trazanad.42.fr.conf /etc/nginx/http.d

COPY conf/nginx.conf /etc/nginx

EXPOSE 443

ENTRYPOINT ["nginx"]

CMD ["-g", " daemon off;"]