#!/bin/bash

source ./utils.sh

ROOT_DIR=/home/userid
OUT_DIR="$ROOT_DIR/backup" # /mnt/c/ ?

FILES=(
    '.gradle/gradle.properties'
    '.bashrc'
    '.bash_logout'
    '.gitconfig'
    '.profile'
)

BACKUP_FILE="$OUT_DIR/$(timestamp)/_wsl_bu.zip"

create_zip_files_only "$BACKUP_FILE" "$ROOT_DIR" "$FILES"

log "done"
