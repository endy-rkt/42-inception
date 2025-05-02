FROM alpine:3.21

RUN apk update && apk upgrade \
&& apk add --no-cache php php82 php82-fpm php82-opcache php82-gd php82-mysqli php82-zlib php82-curl php82-common php82-session\
&& rm /var/cache/apk/*

COPY conf/www.conf /etc/php82/php-fpm.d

COPY conf/php.ini /etc/php82/php.ini

ENTRYPOINT ["php-fpm82"]

CMD ["-F", "-R"]