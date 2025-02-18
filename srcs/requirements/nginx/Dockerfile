FROM alpine:3.21

RUN apk update && apk upgrade && apk add --no-cache nginx openrc && rm /var/cache/apk/*

EXPOSE 80

ENTRYPOINT ["nginx"]

CMD ["-g", " daemon off;"]
