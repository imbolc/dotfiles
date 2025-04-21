#!/usr/bin/env sh

# Sets up a systemd timer to play a bell sound hourly between 8am and 6pm
set -eu

sudo apt install -y sox

mkdir -p ~/.config/systemd/user/
cat >~/.config/systemd/user/hourly-bell.service <<EOF
[Unit]
Description=Play hourly bell sound

[Service]
Type=oneshot
ExecStart=/usr/bin/play -n synth 3 sine 180 sine 270 sine 360 tremolo 3 30 fade t 0 3 2.5
EOF

cat >~/.config/systemd/user/hourly-bell.timer <<EOF
[Unit]
Description=Timer to play bell sound hourly between 8am and 6pm

[Timer]
OnCalendar=hourly
OnCalendar=*-*-* 04..18:00:00

[Install]
WantedBy=timers.target
EOF

systemctl --user daemon-reload
systemctl --user enable hourly-bell.timer
systemctl --user start hourly-bell.timer
