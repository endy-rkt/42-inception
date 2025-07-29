FROM alpine:3.21

RUN apk update && apk upgrade \
    && apk add --no-cache python3 pipx \
    && rm -rf /var/cache/apk/*

RUN mkdir /app

COPY conf/app/ /app/

RUN pipx install gunicorn \
    && pipx inject gunicorn flask

WORKDIR /app

ENV PATH="$PATH:/root/.local/bin"

ENTRYPOINT ["gunicorn"]

CMD ["-b", "0.0.0.0:5000", "wsgi:app"]
