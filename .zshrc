# add user defined functions
fpath=( "$HOME/.zfunctions" $fpath )

# add local scripts
export PATH="$PATH:$HOME/.local/bin"

# add sbin
export PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin"

# set vim as default editor
export EDITOR=vim

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
. ~/.zsh_aliases
