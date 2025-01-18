FROM alpine:latest

RUN apk add --no-cache git nodejs npm

ENTRYPOINT ["/bin/sh", "-c", "echo 'Hello from the container!'"]