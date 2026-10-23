#!/usr/bin/env sh

set -eu

if [ -d "./var" ]; then
    echo "./var folder already exists"
    exit 1
fi

mkdir -p ./var
printf '%s\n' '*' >./var/.gitignore

# Make the folder searchable from ripgrep etc
printf '%s\n' '!*' >./var/.ignore
