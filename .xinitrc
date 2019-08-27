#!/bin/bash

# map caps lock to escape
setxkbmap -option caps:escape

# bind keys using Xbindkeys
xbindkeys

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# start window manager
exec openbox-session
