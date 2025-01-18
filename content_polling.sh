#!/bin/sh

MONITOR_DIR="/content"
PREV_STATE="./prev_state"
CURRENT_STATE="./current_state"

calculate_md5() {
    find "${MONITOR_DIR}" -type f -exec md5sum {} \;
}

calculate_md5 > "$CURRENT_STATE"

if [ ! -f "prev_state" ]; then
    touch prev_state
fi

if ! diff "$CURRENT_STATE" "$PREV_STATE" >/dev/null; then
    echo "Change detected at $(date). Rebuilding..." > polling.log
    mv "$CURRENT_STATE" "$PREV_STATE"
    cd /config/quartz
    npx quartz build
fi