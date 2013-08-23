PATH=$PATH:$HOME/bin
PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\w \\$ \[$(tput sgr0)\]"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [ `uname` == 'Linux' ]
then
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias rm='rm -i'
fi

if [ `uname` == 'Darwin' ]
then
    export CLICOLOR=1
fi

alias l='ls -laF'

if [ -d ~/.bash_plugins ]
then

    for f in ~/.bash_plugins/*
    do
        source $f
    done

fi
