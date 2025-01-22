docker buildx build ./quartz-builder --% -t dalgardnerd:quartz-builder:latest
docker buildx build ./quartz-caddy --% -t dalgardnerd:quartz-caddy:latestdocker buildx build ./quartz-builder --% -t dalgardnerd/quartz-builder:latest
docker buildx build ./quartz-builder --% -t dalgardnerd/quartz-builder:latest
docker buildx build ./quartz-caddy --% -t dalgardnerd/quartz-caddy:latest