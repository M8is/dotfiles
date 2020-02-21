#!/bin/bash

# bind keys using Xbindkeys
xbindkeys

# restore wallpaper
${HOME}/.fehbg &

# set statusbar
slstatus &

# start window manager
exec dwm
