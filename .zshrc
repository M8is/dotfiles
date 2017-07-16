# enable vi mode
bindkey -v
export KEYTIMEOUT=1

# enable autocompletion
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

# setup prompt
vim_ins_mode="%{$fg[white]%}%{$fg_bold[blue]$bg[white]%} INSERT %{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}%{$fg_bold[black]$bg[green]%} NORMAL %{$reset_color%}"
vim_mode=$vim_ins_mode
function zle-line-init zle-keymap-select {
    PS1=" %F{yellow}%1~%f > "
    RPS1="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
setopt transientrprompt

# setup aliases
. ~/.zsh_aliases
