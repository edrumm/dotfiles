#!/bin/bash

log() {
    echo "[$(date -Is)] INFO:" "$@"
}

log_err() {
    echo "[$(date -Is)] ERROR:" "$@"
}

log_warn() {
    echo "[$(date -Is)] WARN:" "$@"
}

timestamp() {
    echo "$(date +%Y-%m-%d_%H-%M-%S)"
}

str_join() {
    local IFS=$1; echo "${*:2}"
}

create_zip() {
    # $1 out dir, $2 root dir, $3 exclude list
    if [ -z "$3" ]; then
        zip -rp "$1" "$2"
    else
        zip -rp "$1" "$2" -x "${$3[@]}"
    fi
}

create_zip_files_only() {
    # $1 out dir, $2 root dir, $3 file list to include
    zip -jp "$1" "{$3[@]/#/$2/}"
}

batch_copy() {
    cp -fr "${$1[@]}" "$2"
}