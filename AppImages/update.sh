#!/usr/bin/env bash
set -euo pipefail

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
