# map caps lock to escape
setxkbmap -option caps:escape

# bind keys using Xbindkeys
xbindkeys

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# setup ssh-agent
eval $(ssh-agent)

# start window manager
exec openbox-session
