#!/bin/bash
# Non-blocking autostart

# start compton for compositing effects
if which compton >/dev/null 2>&1; then
  compton -b
fi

# start conky system monitor
if which conky >/dev/null 2>&1; then
  conky -d
fi

# restore wallpaper
if which nitrogen >/dev/null 2>&1; then
  nitrogen --restore &
fi

# start tint2 
if which tint2 >/dev/null 2>&1; then
  tint2 &
fi
