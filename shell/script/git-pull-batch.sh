#!/bin/bash

source ./utils.sh

ROOT_DIR=/home/userid

PWD=$(pwd)

REPOS=(
    path/to/repo1/from/root_dir
    path/to/repo2/from/root_dir
)

cd "$ROOT_DIR"

for repo in "${REPOS[@]}"
do
    repo_path=$(str_join "/" "$ROOT_DIR" "$repo")
    if [ -d "$repo_path" ]; then
        log "pulling from" "$repo_path"
        cd "$repo_path"

        branch=$(git branch --show-current)
        if [[ "$branch" != "master" ]]; then
            git checkout master
        fi

        if [[ ! $(git pull) ]]; then
            log_err "git pull failed"
            continue
        fi

        submodule=$(git submodule foreach 'echo "$name"')
        if [[ -n $submodule ]]; then
            log "updating submodule(s)"
            git submodule update
        else
            log "no checked-out submodules to update"
        fi

        git checkout "$branch"
        log "$repo" "up to date"
    else
        log_err "$repo_path" "not found"
    fi
done

cd "$PWD"
log "done"
