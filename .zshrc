# enable vi mode
bindkey -v
export KEYTIMEOUT=1

# enable autocompletion
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

# setup prompt
vim_ins_mode="%F{white}%B%F{blue}%K{white} INSERT %k%f%b"
vim_cmd_mode="%F{green}%B%F{black}%K{green} NORMAL %k%f%b"
vim_mode=$vim_ins_mode
function zle-line-init zle-keymap-select {
    PS1=" %~ > "
    RPS1="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
setopt transientrprompt

# setup aliases
. ~/.zsh_aliases
