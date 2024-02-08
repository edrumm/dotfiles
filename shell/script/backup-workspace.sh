#!/bin/bash

source ./utils.sh

WORKSPACE_DIR=/home/userid/workspace
OUT_DIR="/home/userid/backup" # /mnt/c/ ?

EXCLUDE=(
    '*/backup/**'
    '*/.git/**'
    '*.exe'
)

BACKUP_FILE="$OUT_DIR/$(timestamp)/_wsl_bu.zip" 

create_zip "$BACKUP_FILE" "$WORKSPACE_DIR" "${EXCLUDE[@]}"

log "done"
