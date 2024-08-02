#!/bin/bash

git gc --prune=now
git prune
git gc

# git fsck
# rm .git/gc.log
