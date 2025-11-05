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
    if [ $# -gt 2 ]; then
        target=$1
        src=$2; shift 2
        exclude=($@)
        zip -rp "$target" "$src" -x "${exclude[@]}"    
    else
        zip -rp "$1" "$2"
    fi
}

create_zip_files_only() {
    target=$1
    src=$2; shift 2
    files=($@)
    zip -jp "$target" "${files[@]/#/$src/}"
}

batch_copy() {
    cp -fr $(find "$2" -name "$3") "$1"
}