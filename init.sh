#!/bin/sh
# Check if Quartz is already initialized
if [ ! -f "/config/quartz/quartz.config.ts" ]; then
    echo "Initializing Quartz..."
    git clone https://github.com/jackyzha0/quartz.git
    cd quartz
    npm i
    npx quartz create -X new -l shortest
    echo "Quartz initialization complete."
    cp /config/quartz/README.md /config/quartz/content
    npx quartz build
    echo "Visit the Readme at http://localhost:80"
else
    echo "Quartz is already initialized. Skipping..."
fi


caddy run --config /config/caddy/Caddyfile --adapter caddyfile

CYAN='\033[1;36m'
NC='\033[0m' # No Color
link='\e]8;;http://localhost.com:80\e\\This is a link\e]8;;\e\\'

printf "${CYAN}You can now view the webpage at the following address: ${NC} http://localhost \n"

