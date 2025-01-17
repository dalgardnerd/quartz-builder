#!/bin/sh
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
RED='\033[1;31m'
NOCOLOR='\033[0m'

if [ ! -f "/config/quartz/quartz.config.ts" ]; then
    printf "${MAGENTA}Initializing Quartz...${NOCOLOR}\n" 
    git clone https://github.com/jackyzha0/quartz.git
    cd quartz
    npm i
    npx quartz create -X new -l shortest
    printf "${CYAN}Quartz initialization complete.\n${NOCOLOR}\n"
    cp /config/quartz/README.md /config/quartz/content
    printf "${MAGENTA}Peforming initial quartz build...${NOCOLOR}\n"
    npx quartz build
    printf "${MAGENTA}Quartz initial build complete!${NOCOLOR}\n"
    
else
    printf "${MAGENTA}Quartz is already initialized. Checking for updates...${NOCOLOR}\n"
    cd quartz
    npx quartz update
fi

# if [ ! -z "${OBSIDIAN_GIT_LINK+x}" ]; then
#     mkdir ~/.ssh
#     ssh-keygen -t ed25519 -C "quartz-caddy" -f ~/.ssh/id_ed25519 -N ""
#     pub_key=$(cat ~/.ssh/id_ed25519.pub)
#     printf "${RED}YOUR SSH PUBLIC KEY IS:\n${pub_key}\n${RED}Add this key to your github repository and set as an environment variable in this docker container! ${NOCOLOR}\n"
# fi

printf "${CYAN}You can view the webpage at the following address: ${NOCOLOR} http://localhost\n"

caddy run --config /config/caddy/Caddyfile --adapter caddyfile