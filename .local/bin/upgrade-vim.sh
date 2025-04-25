#!/usr/bin/env sh

set -eu

dst=/usr/local/bin/vim
tmp=/tmp/vim.up

if lsof "$dst" >/dev/null 2>&1; then
    echo "The vim file is busy, close all the editor instances first"
    exit 1
fi
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage -o $tmp
sudo mv $tmp $dst
chmod +x $dst

echo ok
