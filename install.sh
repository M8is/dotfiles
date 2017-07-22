#! /bin/bash

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP=${DOTFILES}_backup

# setup symlinks
for i in $(pushd "$DOTFILES" && git ls-files && popd); do
	# create backup
	mkdir --parents "$BACKUP/$i"; mv "$i" $_
	# create symlink
	ls -s "$DOTFILES/$i" "$HOME/$i"
done
