#!/usr/bin/env bash
set -euo pipefail

srcs="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
apps=/usr/share/applications
bins=/usr/local/bin

sudo ln -sf $srcs/obsidian.desktop $apps
sudo ln -sf $srcs/nvim.appimage $bins/vim
