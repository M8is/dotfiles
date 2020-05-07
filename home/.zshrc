# add user defined functions
fpath=( "$HOME/.zfunctions" $fpath )

# add local scripts
export PATH="$PATH:$HOME/.local/bin"

# add sbin
export PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin"

# add cargo
[ -d "$HOME/.cargo/bin" ] && export PATH="$PATH:$HOME/.cargo/bin"

# set vim as default editor
export EDITOR=vim

# try to fix misbehaving Java applications
export _JAVA_AWT_WM_NONREPARENTING=1

# enable vi mode
bindkey -v
export KEYTIMEOUT=1

# enable autocompletion
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

# setup prompt
autoload -U promptinit; promptinit
prompt pure

# setup history
export HISTSIZE=2000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space

# setup aliases
source ~/.zsh_aliases

# setup zplug
export ZPLUG_HOME="$HOME/.zplug"

# Clone zplug
if [ ! -d "$ZPLUG_HOME" ]; then
  printf "Clone zplug? [y/N]: "
  if read -q; then
    echo; git clone https://github.com/zplug/zplug $ZPLUG_HOME
  fi
fi

source $ZPLUG_HOME/init.zsh

# Install plugins
if ! zplug check --verbose; then
    printf "Install missing plugins? [y/N]: "
        if read -q; then
    echo; zplug install
  fi
fi

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

zplug load
