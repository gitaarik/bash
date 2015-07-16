# If we're in linux, set a 256-color terminal
if [[ $OSTYPE == linux* ]]; then
    export TERM=xterm-256color
fi

# Set the correct locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add the ~/bin/ dir to $PATH
export PATH=$PATH:$HOME/bin

# Make the prompt blue, bold and display the current path
export PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\w \\$ \[$(tput sgr0)\]"

# Use a big command history
export HISTSIZE=1000
export HISTFILESIZE=2000

# Set the default editor to vim
export EDITOR=vim
export VISUAL=vim

# Don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoredups

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Disable the bell
set bell-style none

# Linux specific aliases
if [[ $OSTYPE == linux* ]]; then
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# OS X specific aliases
if [[ $OSTYPE == darwin* ]]; then
    export CLICOLOR=1
fi

# Simulate OSX's pbcopy and pbpaste on other platforms
if [[ ! $OSTYPE == darwin* ]]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

# Global aliases
alias l='ls -lAFh'
alias l1='ls -1'
alias c='cd'
alias v='vim .'
alias vi='vim'
alias vip='vim -p'
alias vs='vi -S Session.vim'
alias j='jobs'
alias f='fg'
alias t='tmux'
alias tmc='tmux loadb -'
alias tmp='tmux saveb -'
alias s='screen'
alias rm='rm -i'
alias ip='ipython'
alias gg='git grep -i'
alias actenv='. ../env/bin/activate'
alias nodebin='echo -e "Setting up nodebin with path:\n$(npm bin)"; export PATH=$(npm bin):$PATH'
alias gitprompt=". $HOME/bin/git-prompt"
alias ptp='ptipython --vi'
alias clrswp='find . -name "*.swp" -delete'

# Default modifiers for less.
#
# -R display color controll characters
# -i case insensitive search
# -F disable paging if the result fits on the screen
# -X disable termcap init/deinit, keeps the less output on the screen
#    after exit.
# -S crop lines longer than the screen instead of wrapping them
export LESS=-RiFXS

# Add RVM to PATH
if [ -d $HOME/.rvm/bin ]; then
    export PATH="$PATH:$HOME/.rvm/bin"
fi

# Init bash completion
if [[ $OSTYPE == darwin* ]]; then
    if type brew > /dev/null 2>&1; then
        if [ -f $(brew --prefix)/etc/bash_completion ]; then
            . $(brew --prefix)/etc/bash_completion
        fi
    fi
else
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Load possible bash plugins from the ~/.bash_plugins/ dir
if [ -d $HOME/.bash_plugins ]; then

    for f in $HOME/.bash_plugins/*
    do
        source $f
    done

fi
