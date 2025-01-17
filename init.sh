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



