FROM caddy:latest

RUN apk update
RUN apk add --no-cache git nodejs npm

WORKDIR /config

COPY Caddyfile /config/caddy/Caddyfile
COPY init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

EXPOSE 80

CMD ["/bin/sh", "-c", "/usr/local/bin/init.sh"]
