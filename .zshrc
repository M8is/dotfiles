# enable autocompletion
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

# enable prompt theme
autoload -Uz promptinit
promptinit
prompt suse

# setup aliases
. ~/.zsh_aliases
