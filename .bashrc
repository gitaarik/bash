# Set the correct locale
LANG=en_US.UTF-8

# Add the ~/bin/ dir to $PATH
PATH=$PATH:$HOME/bin

# Make the prompt blue, bold and display the current path
PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\w \\$ \[$(tput sgr0)\]"

# Use a big command history
HISTSIZE=1000
HISTFILESIZE=2000

# Don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoredups

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Linux specific aliases
if [ `uname` == 'Linux' ]
then
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# OS X specific aliases
if [ `uname` == 'Darwin' ]
then
    export CLICOLOR=1
fi

# Global aliases
alias l='ls -laF'
alias v='vi .'
alias j='jobs'
alias rm='rm -i'
alias gg='git grep -i --'
alias actenv='. ../env/bin/activate'
alias gitprompt='. ~/bin/git-prompt'

# Set default modifiers for less.
# -R will display color controll characters
# -i will enable case insensitive search
export LESS=-Ri

# Load possible bash plugins from the ~/.bash_plugins/ dir
if [ -d ~/.bash_plugins ]
then

    for f in ~/.bash_plugins/*
    do
        source $f
    done

fi
