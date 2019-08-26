# dotfiles
Just my config. :)

## Getting Started

### Prerequisites
- Git
- Vim
- Vundle
- Tmux
- Zsh
- Pure ZSH prompt
- Font(s)

For Window Manager:
- Openbox
- rxvt-unicode (urxvt)
- Conky
- Xbindkeys
- Xcompmgr
- Tint2
- nitrogen
- xbacklight
- alsamixer
- rofi

```
  sudo apt install zsh fonts-powerline git vim tmux openbox rxvt-unicode conky xbindkeys xcompmgr xbacklight tint nitrogen alsamixer rofi
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
  
  git clone https://github.com/sindresorhus/pure.git ~/.pure_prompt
  ln -s ~/.pure_prompt/pure.zsh ~/.zfunctions/prompt_pure_setup
  ln -s ~/.pure_prompt/async.zsh ~/.zfunctions/async
```

### Installing

Run `install.sh`, which will create links for all files in this repo. A backup will be created in `~/dotfiles_backup/`.
