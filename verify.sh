#!/usr/bin/env bash
set -euo pipefail

git diff $(git merge-base origin/main upstream/main)..origin/main \
    --diff-filter=d \
    ':(exclude)README.md' \
    ':(exclude)build.zig' \
    ':(exclude).github' \
    ':(exclude).gitignore' \
    ':(exclude)stub.c'
