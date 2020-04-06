#!/bin/bash

# bind keys using Xbindkeys
xbindkeys

# set statusbar
slstatus &

# load Xresources
xrdb -merge ~/.Xresources

[ -f ~/.fehbg ] && ~/.fehbg

# start window manager
exec dwm
