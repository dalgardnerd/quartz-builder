#!/bin/sh
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
RED='\033[1;31m'
NOCOLOR='\033[0m'


if [ ! -d "/opt/quartz/node_modules" ]; then
        mkdir content
        cd /tmp
        mv index.md /opt/quartz/content
        git clone https://github.com/jackyzha0/quartz.git
        cp -r quartz/ /opt
        rm  -rf *
        cd /opt/quartz
        npm i
        npx quartz create -X new -l shortest
        printf "${CYAN}Quartz initialization complete.\n${NOCOLOR}\n"
        printf "${MAGENTA}Peforming initial quartz build...${NOCOLOR}\n"
        npx quartz build -o /opt/public
        printf "${MAGENTA}Quartz initial build complete${NOCOLOR}\n"

else
    printf "${MAGENTA}Quartz is already initialized. Checking for updates...${NOCOLOR}\n"
    npx quartz update
    printf "${MAGENTA}Performing quartz build...${NOCOLOR}\n"
    npx quartz build -o /opt/public
    printf "${MAGENTA}Quartz build complete${NOCOLOR}\n"
fi

printf "${CYAN}You can view your Quartz site at: ${NOCOLOR}http://localhost\n"

while true; do
        # inotifywait -r -e modify,create,delete,move /opt/quartz/content
        # npx quartz build

        sleep 10
done