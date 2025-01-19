# quartz-builder

Builds a static site using an obsidian vault and Quartz v4. Can be hosted on any modern web server (Apache, NGINX, Caddy, etc.) . Comes configured for usage with a self-hosted Caddy webserver using the included docker-compose example. 

For information on other hosting methods, please visit the official documentation at https://quartz.jzhao.xyz/hosting

---

# Usage

## pull the Image
```bash
docker pull dalgardnerd/quartz-builder:latest
```
## docker run
```bash
docker run -d \
  --name quartz-builder \
  --restart unless-stopped \
  -v $(pwd)/quartz:/opt/quartz/ \
  -v q$(pwd)/output$:/opt/public \
  quartz-builder:latest
```

At runtime, the container will create the Quartz config and output foldersin the current directory
## place notes in content folder

**/quartz/content** -  Quartz will build all the notes in this folder and output the generated site to **/output** every time the container starts.
## map your webserver to Quartz output

**/output** - This is the folder that your webserver should watch for the website files to be hosted
## configuring quartz

**quartz.config.ts** and **quartz.layout.ts** are both located in /quartz/content 
refer to the documentation for help with customizing Quartz - https://quartz.jzhao.xyz/configuration
## docker-compose.yaml

This example will automatically configure and host an empty site using Caddy Webserver. 

**NOTE** - This docker compose uses a docker volume for the quartz output, you will not be able to see the output site files unless you change the quartz-output volume to a bind-mount

```docker
services:
  web:
    image: caddy:latest
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
    ports:
      - "80:80"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - web-data:/data
      - web-config:/config
      - quartz-output:/srv/public


  quartz-builder:
    image: dalgardnerd/quartz-builder:latest
    restart: unless-stopped
    volumes:
      - ./quartz:/opt/quartz/
      - quartz-output:/opt/public

volumes:
  web-data:
  web-config:
  quartz-output:

```

