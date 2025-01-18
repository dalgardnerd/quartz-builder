FROM caddy:latest

RUN apk update
RUN apk add --no-cache git nodejs npm
WORKDIR /content
WORKDIR /config

COPY README.md /tmp
COPY Caddyfile /config/caddy/Caddyfile
COPY init.sh /usr/local/bin/init.sh

RUN chmod +x /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/content_polling

EXPOSE 80

CMD ["/bin/sh", "-c", "/usr/local/bin/init.sh && crond -f"]
