FROM alpine:3.14.0

RUN apk add --update --no-cache py3-pip \
  && apk add --no-cache --virtual .build-deps \
    gcc \
    python3-dev \
    musl-dev \
    linux-headers \
    libffi-dev \
    openssl-dev \
    rust \
    cargo \
  && pip install --no-cache-dir certbot-dns-transip==0.3.3 \
  && apk del .build-deps

VOLUME ["/etc/letsencrypt"]

ENTRYPOINT ["certbot"]
