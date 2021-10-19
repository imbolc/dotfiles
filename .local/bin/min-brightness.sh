#!/usr/bin/env bash

set -o nounset  # error when referencing undefined variable
set -o errexit  # exit when command fails

sudo bash -c 'echo 8 > /sys/class/backlight/intel_backlight/brightness'

