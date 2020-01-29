#!/bin/bash
# Non-blocking autostart

# start compton for compositing effects
if which compton >/dev/null 2>&1; then
  compton -b
fi

# restore wallpaper
if which feh >/dev/null 2>&1; then
  [ -f ${HOME}/.fehbg ] && ${HOME}/.fehbg &
fi
