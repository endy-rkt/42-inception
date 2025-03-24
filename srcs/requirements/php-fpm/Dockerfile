FROM alpine:3.21

RUN apk update && apk upgrade \
&& apk add --no-cache php php82 php82-fpm php82-opcache php82-gd php82-mysqli php82-zlib php82-curl \
&& rm /var/cache/apk/*

# RUN chmod +x /usr/bin/php

COPY conf/www.conf /etc/php82/php-fpm.d

EXPOSE 9000

ENTRYPOINT ["php-fpm82"]

CMD ["-F", "-R"]