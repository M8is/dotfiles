#!/bin/bash
# Non-blocking autostart

# start compton for compositing effects
if which compton >/dev/null 2>&1; then
  compton -b
fi

# restore wallpaper
if which nitrogen >/dev/null 2>&1; then
  nitrogen --restore &
fi
