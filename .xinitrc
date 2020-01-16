#!/bin/bash

# setup keyboard map (toggle layouts with left_shift + right_shift)
setxkbmap -layout us,de -option grp:shifts_toggle -option grp_led:caps -option caps:escape

# bind keys using Xbindkeys
xbindkeys

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# start window manager
exec openbox-session
