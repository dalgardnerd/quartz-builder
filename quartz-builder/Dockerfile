FROM alpine:latest

RUN apk add --no-cache git nodejs npm inotify-tools

COPY init.sh /usr/bin/local/init.sh
COPY README.md /tmp/index.md

WORKDIR /opt/quartz

ENTRYPOINT ["/bin/sh", "-c", "/usr/bin/local/init.sh"]