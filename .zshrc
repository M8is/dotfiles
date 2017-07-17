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

# setup aliases
. ~/.zsh_aliases
