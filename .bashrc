PATH=$PATH:$HOME/bin
PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\w \\$ \[$(tput sgr0)\]"

export HISTCONTROL=ignoredups
export CLICOLOR=1

alias ls='ls --color'
alias l='ls -laF'
