# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# sudo autocomplete
complete -cf sudo

# vim-like comand line
set -o vi

# vim as default editor
export VISUAL=vim
export EDITOR=vim

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi

# golang
export GOROOT="/usr/local/go"
if [ -d "${GOROOT}" ]; then
  export PATH="${GOROOT}/bin:${PATH}"
fi

# rust
export CARGO_ROOT="${HOME}/.cargo/bin"
if [ -d "${CARGO_ROOT}" ]; then
  export PATH="${CARGO_ROOT}/bin:${PATH}"
fi

# nim
export NIM_ROOT="${HOME}/.nimble"
if [ -d "${NIM_ROOT}" ]; then
  export PATH="${NIM_ROOT}/bin:${PATH}"
fi

# java
export JAVA_HOME=$(update-alternatives --query javac | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')

# android
export ANDROID_HOME="${HOME}/bin/android/sdk"
# export ANDROID_HOME="/usr/lib/android-sdk"
if [ -d "${ANDROID_HOME}" ]; then
    export PATH="${PATH}:${ANDROID_HOME}tools/:${ANDROID_HOME}platform-tools/"
fi


# django completion
_django_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   DJANGO_AUTO_COMPLETE=1 $1 ) )
}
complete -F _django_completion -o default django-admin.py manage.py django-admin

_python_django_completion()
{
    if [[ ${COMP_CWORD} -ge 2 ]]; then
        local PYTHON_EXE=${COMP_WORDS[0]##*/}
        echo $PYTHON_EXE | egrep "python([2-9]\.[0-9])?" >/dev/null 2>&1
        if [[ $? == 0 ]]; then
            local PYTHON_SCRIPT=${COMP_WORDS[1]##*/}
            echo $PYTHON_SCRIPT | egrep "manage\.py|django-admin(\.py)?" >/dev/null 2>&1
            if [[ $? == 0 ]]; then
                COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]:1}" \
                               COMP_CWORD=$(( COMP_CWORD-1 )) \
                               DJANGO_AUTO_COMPLETE=1 ${COMP_WORDS[*]} ) )
            fi
        fi
    fi
}

# Support for multiple interpreters.
unset pythons
if command -v whereis &>/dev/null; then
    python_interpreters=$(whereis python | cut -d " " -f 2-)
    for python in $python_interpreters; do
        [[ $python != *-config ]] && pythons="${pythons} ${python##*/}"
    done
    unset python_interpreters
    pythons=$(echo $pythons | tr " " "\n" | sort -u | tr "\n" " ")
else
    pythons=python
fi

complete -F _python_django_completion -o default $pythons
unset pythons


# === fabric autocomplete
_fab()
{
    local cur
    COMPREPLY=()
    # Variable to hold the current word
    cur="${COMP_WORDS[COMP_CWORD]}"

    # Build a list of the available tasks using the command 'fab -l'
    local tags=$(fab -l 2>/dev/null | grep "^    " | awk '{print $1;}')

    # Generate possible matches and store them in the
    # array variable COMPREPLY
    COMPREPLY=($(compgen -W "${tags}" $cur))
}
complete -F _fab fab


# === Aliases

# System updates
alias df='df -H'
alias du='du -chs .[!.]* * | sort -h'
alias rsync='rsync -rPh --info=progress2'
alias youtube-dl-mp3="youtube-dl -x --audio-format mp3"
alias youtube-dl-date="youtube-dl -i -o '%(upload_date)s %(title)s.%(ext)s'"
alias youtube-dl-date-mp3="youtube-dl-date -x --audio-format mp3"
alias wrk="wrk -d5"

# More ls
alias ll='ls -hlF'
alias la='ls -ahlF'
alias l='ls -CF'

# Other aliases
alias untar='tar -zxvf'
alias untar-bz='tar -jxvf'

alias restart-nginx="sudo nginx -t && sudo /etc/init.d/nginx restart"
alias restart-network="sudo /etc/init.d/network-manager restart"
alias restart-bluetooth="sudo /etc/init.d/bluetooth restart"

alias upgrade="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias chmod-common="find ./ -type d | xargs chmod -v 755 ; find ./ -type f | xargs chmod -v 644"
alias add-key="sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "
alias notebook="jupyter notebook"
alias simple-server="python3 -m http.server"
alias git-clear-branches='git branch | grep -v "master" | xargs git branch -D'

alias autostart="vim ~/.config/lxsession/LXDE/autostart"
alias timezone="sudo dpkg-reconfigure tzdata"
alias clitor="sudo sh -c 'echo -n 255 > /sys/devices/platform/i8042/serio1/serio2/speed'; sudo sh -c 'echo -n 255 > /sys/devices/platform/i8042/serio1/serio2/sensitivity'"


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/share/bash-completion/completions/pass ] && source /usr/share/bash-completion/completions/pass

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
