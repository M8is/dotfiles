#! /bin/bash                                                                                                                                 
 
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$DOTFILES"

BACKUP=${DOTFILES}_backup

git ls-files --exclude-standard | while read i ; do
  if [ -f "$HOME/$i" ]; then
    mkdir --parents "$(dirname "$BACKUP/$i")"; mv "$HOME/$i" $_
  fi
  
  mkdir --parents "$(dirname "$HOME/$i")"; ln -s "$DOTFILES/$i" "$HOME/$i"
done

popd
