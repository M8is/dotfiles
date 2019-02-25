#! /bin/bash                                                                                                                                 
 
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$DOTFILES" > /dev/null

BACKUP=${DOTFILES}_backup

git ls-files --exclude-standard | while read i ; do
  if [[ "$i" == "README.md" ]] || [[ "$i" == "LICENSE" ]] || [[ "$i" == "install.sh" ]]; then
    continue
  fi

  if [ -f "$HOME/$i" ]; then
    mkdir --parents "$(dirname "$BACKUP/$i")"; mv "$HOME/$i" $_
  fi
  
  mkdir --parents "$(dirname "$HOME/$i")"; ln -s "$DOTFILES/$i" "$HOME/$i"
done

# set global gitignore
git config --global core.excludesfile "$HOME/.config/git/gitignore_global"

popd > /dev/null
