# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Set history length
HISTSIZE=1000

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Make prompt to display the current working directory (\w) followed by a dollar sign ($) in inverse color
PS1='\[\e[7m\]\w\$\[\e[0m\] '

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    if test -r ~/.dircolors; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Aliases
alias df='df -H'
alias du='du -chs .[!.]* * | sort -h'

alias ll='ls -hlF'
alias la='ls -ahlF'
alias l='ls -CF'

alias untar='tar -xvf'

# shellcheck source=/dev/null
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features (sudo apt install bash-completion)
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Enable sudo autocomplete
complete -cf sudo

# Vim-like command line
set -o vi

# Open a project in a named Tmux session
project() {
    [ "$#" -eq 1 ] || {
        printf 'usage: project PROJECT\n' >&2
        return 2
    }

    [ -d "$HOME/proj/$1" ] || {
        printf 'No such project: %s\n' "$HOME/proj/$1" >&2
        return 1
    }

    tmux new-session -A -s "$1" -c "$HOME/proj/$1"
}
_project_complete() {
    local cur dir name
    cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=()
    for dir in "$HOME"/proj/*; do
        [ -d "$dir" ] || continue
        name=${dir##*/}
        case $name in
        "$cur"*) COMPREPLY+=("$name") ;;
        esac
    done
}
complete -F _project_complete project

# Pyenv
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Bind Ctrl+R to use skim if it's available (cargo install skim)
if command -v sk >/dev/null 2>&1; then
    # Function to use skim for history search
    skim_history() {
        local selected
        selected=$(history | sed 's/^[ ]*[0-9]*[ ]*//' | tac | awk '!seen[$0]++' | sk --height='40%' --no-sort)
        if [ -n "$selected" ]; then
            READLINE_LINE="$selected"
            READLINE_POINT=${#selected}
        fi
    }
    bind -x '"\C-r": skim_history'
fi

# secret env variables
if [ -r "$HOME/.bash_secrets.sh" ]; then
    . "$HOME/.bash_secrets.sh"
fi
