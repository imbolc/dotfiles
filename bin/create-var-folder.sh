#!/usr/bin/env sh

set -eux

mkdir -p ./var
printf '%s\n' '*' >./var/.gitignore

# Make the folder searchable from ripgrep etc
printf '%s\n' '!*' >./var/.ignore
