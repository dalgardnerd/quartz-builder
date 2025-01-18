#!/bin/sh
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
RED='\033[1;31m'
NOCOLOR='\033[0m'



if [ ! -f "/config/quartz/quartz.config.ts" ]; then
    mv /tmp/README.md /content/index.md
    printf "${MAGENTA}Initializing Quartz...${NOCOLOR}\n" 
    git clone https://github.com/jackyzha0/quartz.git
    cd quartz
    npm i
    npx quartz create -X symlink -l shortest -s /content
    printf "${CYAN}Quartz initialization complete.\n${NOCOLOR}\n"
    printf "${MAGENTA}Peforming initial quartz build...${NOCOLOR}\n"
    npx quartz build
    printf "${MAGENTA}Quartz initial build complete!${NOCOLOR}\n"
    
    
else
    printf "${MAGENTA}Quartz is already initialized. Checking for updates...${NOCOLOR}\n"
    cd quartz
    npx quartz update
    printf "${MAGENTA}Performing quartz build...${NOCOLOR}\n"
    npx quartz build
fi

printf "${CYAN}You can view the webpage at the following address: ${NOCOLOR} http://localhost\n"

caddy run --config /config/caddy/Caddyfile --adapter caddyfile