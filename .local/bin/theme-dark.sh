#!/usr/bin/env sh
set -efu

xfconf-query -c xsettings -p /Net/ThemeName -s Adwaita-dark

cd "$HOME/.config/alacritty"
ln -sf themes/github_dark.toml current_theme.toml
touch alacritty.toml

cd "$HOME/.config/bat"
ln -sf config-dark config
