#!/usr/bin/env bash

set -eu

dst=/usr/bin/vim
tmp=/tmp/vim.up

if [[ -n "$(lsof "$dst")" ]]; then
    echo "The vim file is busy, close all the editor instances first"
    exit 1
fi

curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o $tmp
chmod +x $tmp
sudo mv $tmp $dst

echo ok

