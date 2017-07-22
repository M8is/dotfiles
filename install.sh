#! /bin/bash

CHECKOUT=$HOME/dotfiles
BACKUP=${CHECKOUT}_backup

git clone https://github.com/M8is/dotfiles $CHECKOUT

# setup symlinks
for i in $(pushd "$CHECKOUT" && git ls-files && popd); do
	# create backup
	mkdir --parents "$BACKUP/$i"; mv "$i" $_
	# create symlink
	ls -s "$CHECKOUT/$i" "$HOME/$i"
done
