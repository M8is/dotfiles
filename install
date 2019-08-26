#!/bin/bash

### Install dependencies
sudo apt install zsh             \
                 fonts-powerline \
                 git             \
                 vim             \
                 tmux            \
                 openbox         \
                 rxvt-unicode    \
                 conky           \
                 xbindkeys       \
                 xcompmgr        \
                 xbacklight      \
                 tint            \
                 nitrogen        \
                 alsamixer       \
                 rofi

# Vim plugin manager (Vundle)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Pure zsh prompt
git clone https://github.com/sindresorhus/pure.git ~/.pure_prompt
ln -s ~/.pure_prompt/pure.zsh ~/.zfunctions/prompt_pure_setup
ln -s ~/.pure_prompt/async.zsh ~/.zfunctions/async

###########################################
### Symlink dotfiles and create backups ###
###########################################

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
git config --global core.excludesfile "$DOTFILES/.config/git/gitignore_global"

popd > /dev/null
