# Set the correct locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add the ~/bin/ dir to $PATH
export PATH=$PATH:$HOME/bin

# Make the prompt blue, bold and display the current path
__color_bold_blue='\[$(tput bold)\]\[$(tput setaf 4)\]'
__color_white='\[$(tput sgr0)\]'
export PS1="$__color_bold_blue\w \\$ $__color_white"

# Use a big command history
export HISTSIZE=1000
export HISTFILESIZE=2000

# Set the default editor to vim
export EDITOR=vim
export VISUAL=vim

# Don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoredups

# Enable globstar behavior, makes **/* match subdirs
shopt -s globstar

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Disable the bell
set bell-style none

# Global aliases
alias l='/opt/exa -lF'
alias c='cd'
alias c.='cd ..'
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
alias gg='git grep -i'
alias ggs='git grep'
alias nodebin='echo -e "Setting up nodebin with path:\n$(npm bin)"; export PATH=$(npm bin):$PATH'
alias clrswp='find . -name "*.swp" -delete'
alias d='docker'
alias dc='docker-compose'
alias prjson='python -m json.tool'
alias igrep='grep -i'
alias si='sudo -i'
alias tree='tree -F'
alias ptp='ptipython --vi'
alias ip='ipython --pprint'
alias psh='pipenv shell'

# Handy Django aliases
alias ds='./manage.py shell'
alias msh='./manage.py shell'
alias mrs='./manage.py runserver'

# Django test command where you can give the path to the test file. It will
# convert it to the dotted format.
mtf() {
    ./manage.py test $(echo "$*" | sed 's/\//./g' | sed 's/\.py//g')
}

# Linux specific settings
if [[ $OSTYPE == linux* ]]; then

    # Disable the Ctrl+S freeze binding
    stty stop ''
    stty start ''

    export TERM=xterm-256color

    # This sets the LS_COLORS env var, this will make commands like `tree`
    # display colors.
    eval $(dircolors)

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias igrep='grep -i --color=auto'

    # Simulate OSX's pbcopy and pbpaste on linux using xsel
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'

fi

# OS X specific settings
if [[ $OSTYPE == darwin* ]]; then
    export CLICOLOR=1
fi

actenv() {

    cur_wording_dir=$(pwd)
    activate_path=env/bin/activate

    while [ ! -f "$activate_path" ]; do

        if [ "$(pwd)" == '/' ]; then
            echo No virtualenv found
            cd "$cur_wording_dir"
            return
        fi

        cd ..

    done

    source "$activate_path"
    cd "$cur_wording_dir"

}

addpath() {
    export PATH=$PATH:$*
}


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
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# A nice shell prompt for inside git repostories
# Shows a short status of the repository in the prompt
# Adds an alias `g=git` and makes autocomplete work
gitprompt() {

    export GIT_PS1_SHOWDIRTYSTATE=true;
    export GIT_PS1_SHOWSTASHSTATE=true;
    export GIT_PS1_SHOWUNTRACKEDFILES=true;
    export GIT_PS1_SHOWUPSTREAM="auto";
    export GIT_PS1_SHOWCOLORHINTS=true;
    . /usr/lib/git-core/git-sh-prompt;

    local ps1_start="$__color_bold_blue\w"
    local ps1_end="$__color_bold_blue \\$ $__color_white"
    local git_string=" (%s$__color_bold_blue)"

    export PROMPT_COMMAND="__git_ps1 \"$ps1_start\" \"$ps1_end\" \"$git_string\""

    # Short alias for git stuff
    alias g=git

    # Make autocomplete also work fo the `g` alias
    # Old way:
    #   eval $(complete -p git | sed 's/git$/g/g')
    # Old way doesn't seem to work anymore, new way:
    __git_complete g __git_main
    # More info:
    # https://stackoverflow.com/questions/342969/how-do-i-get-bash-completion-to-work-with-aliases

}

# Load possible bash plugins from the ~/.bash_plugins/ dir
if [ -d $HOME/.bash_plugins ]; then

    for f in $HOME/.bash_plugins/*
    do
        source $f
    done

fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
