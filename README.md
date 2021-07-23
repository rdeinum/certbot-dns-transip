# certbot-dns-transip
Certbot with [TransIP DNS plugin](https://certbot-dns-transip.readthedocs.io/en/0.3.3/) for obtaining an SSL certificate via DNS challenge.

## Install
Make sure Docker is installed and run:
```bash
$ sudo install certbot-dns-transip /usr/local/bin
```

## Obtain TransIP API key
See [this article](https://www.transip.nl/knowledgebase/artikel/77-ik-wil-transip-api-gebruiken/) and download the key.

## Initialize Certbot DNS plugin configuration
Create or `cd` into a directory where configuration should be initialized for the obtained TransIP API key and do:
```bash
$ certbot-dns-transip init <TRANSIP_USERNAME> <TRANSIP_API_KEY_PATH>
```

## Get a new certificate
All certificates and config must be persisted, so a volume named e.g. `letsencrypt` is mounted. This volume can also be monted as readonly on your webserver container e.g. nginx or apache for certificate access. Following an example for getting a new wildcard domain certifcate:
```bash
$ certbot-dns-transip run certonly -d <DOMAIN_NAME> -d *.<DOMAIN_NAME>
```

## Renew certificates
Use for example cron to schedule certificate renewal by running certbot.
```bash
$ certbot-dns-transip run renew
```

Note, after renewal you probably need to reload your webserver to accomodate for the certificate updates. A running nginx container for example should be notified like so:
```bash
$ docker exec nginx -s reload
```

## Links
- Docker Hub: https://hub.docker.com/r/rdeinum/certbot-dns-transip
- Source: https://github.com/rdeinum/certbot-dns-transip
