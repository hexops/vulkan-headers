#!/usr/bin/env bash
set -euo pipefail

git diff $(git merge-base main upstream/main)..main \
    --diff-filter=d \
    ':(exclude)README.md' \
    ':(exclude)build.zig' \
    ':(exclude)update.sh' \
    ':(exclude)verify.sh' \
    ':(exclude).github' \
    ':(exclude).gitignore' \
    ':(exclude)stub.c'
