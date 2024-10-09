#!/usr/bin/env sh
set -efu

xfconf-query -c xsettings -p /Net/ThemeName -s Adwaita

cd "$HOME/.config/alacritty"
ln -sf themes/solarized_light.toml current_theme.toml
touch alacritty.toml

cd "$HOME/.config/bat"
ln -sf config-light config
