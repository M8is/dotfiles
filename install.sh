#! /bin/bash                                                                                                                                 
 
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP=${DOTFILES}_backup

for i in $(pushd "$DOTFILES" && git ls-files && popd); do
  if [ -f "$HOME/$i" ]; then
    mkdir --parents "$(dirname "$BACKUP/$i")"; mv "$HOME/$i" $_
  fi
  
  ln -s "$DOTFILES/$i" "$HOME/$i"
done
