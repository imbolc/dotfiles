# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Append to the history file, don't overwrite it
shopt -s histappend

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Set history length
HISTSIZE=100000
HISTFILESIZE=10000000

# Append and reload the history after each command
PROMPT_COMMAND="history -a; history -n"

# Ignore certain commands from the history
HISTIGNORE="ls:ll:cd:pwd:bg:fg:history"

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Make prompt to display the current working directory (\w) followed by a dollar sign ($)
PS1='\w\$ '

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

# Vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Add user's bin folder to PATH
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Cargo
. "$HOME/.cargo/env"

# Snap
if [ -d "/snap/bin" ]; then
    PATH="/snap/bin:$PATH"
fi

# Pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Automatically activate pyenv
_activate_virtualenv() {
    _VENV_FOLDERS=(
        .venv
        var/env
    )
    if [[ -n $_VENV_ROOT ]]; then
        # Deactivate virtualenv if the current folder isn't belong the activated one
        if [[ $(realpath "$PWD")/ != $_VENV_ROOT/* ]]; then
            deactivate
            echo "Virtualenv deactivated: $_VENV_NAME"
            unset _VENV_ROOT
            unset _VENV_NAME
        fi
    fi
    if [[ -z $VIRTUAL_ENV ]]; then
        for _VENV_FOLDER in "${_VENV_FOLDERS[@]}"; do
            if [[ -f "$_VENV_FOLDER/bin/activate" ]]; then
                _VENV_ROOT=$(realpath "$PWD")
                _VENV_NAME=$(basename "$PWD")
                # shellcheck disable=SC2034
                VIRTUAL_ENV_DISABLE_PROMPT=1
                # shellcheck disable=SC1091
                . "$_VENV_FOLDER"/bin/activate
                _OLD_VIRTUAL_PS1=$PS1
                echo -e "Virtualenv activated: $_VENV_NAME"
                break
            fi
        done
    fi
}
export PROMPT_COMMAND="_activate_virtualenv;$PROMPT_COMMAND"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

_use_nvm() {
    if [[ $PWD == "$PREV_PWD" ]]; then
        return
    fi

    PREV_PWD=$PWD
    [[ -f ".nvmrc" ]] && nvm use
}
if [ -d "${NVM_DIR}" ]; then
    export PROMPT_COMMAND="_use_nvm;$PROMPT_COMMAND"
fi

# Android
# JAVA_HOME=$(update-alternatives --query javac 2>/dev/null | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')
JAVA_HOME="/usr/lib/jvm/jdk-21.0.6-oracle-x64"
export JAVA_HOME

export ANDROID_HOME="$HOME/Android/Sdk"
if [ -d "${ANDROID_HOME}" ]; then
    export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools
    export PATH=$PATH:$ANDROID_HOME/emulator
fi

if [ -d "$ANDROID_HOME/ndk" ] && ls "$ANDROID_HOME/ndk"/* >/dev/null 2>&1; then
    # Set to the last NDK directory (assuming version sorting)
    ANDROID_NDK_HOME=$(find "$ANDROID_HOME/ndk" -mindepth 1 -maxdepth 1 -type d | sort -V | tail -1)
    export ANDROID_NDK_HOME
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
