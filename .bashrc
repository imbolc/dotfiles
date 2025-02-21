# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
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

PS1='\w\$ '

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

# vim-like command line
set -o vi

# vim as default editor
export VISUAL=vim
export EDITOR=vim

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# snap
if [ -d "/snap/bin" ]; then
	PATH="/snap/bin:$PATH"
fi

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
	export PATH="${PYENV_ROOT}/bin:${PATH}"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

# cargo
. "$HOME/.cargo/env"

# django completion
_django_completion() {
	COMPREPLY=($(COMP_WORDS="${COMP_WORDS[*]}" \
		COMP_CWORD=$COMP_CWORD \
		DJANGO_AUTO_COMPLETE=1 $1))
}
complete -F _django_completion -o default django-admin.py manage.py django-admin

_python_django_completion() {
	if [[ ${COMP_CWORD} -ge 2 ]]; then
		local PYTHON_EXE=${COMP_WORDS[0]##*/}
		echo $PYTHON_EXE | egrep "python([2-9]\.[0-9])?" >/dev/null 2>&1
		if [[ $? == 0 ]]; then
			local PYTHON_SCRIPT=${COMP_WORDS[1]##*/}
			echo $PYTHON_SCRIPT | egrep "manage\.py|django-admin(\.py)?" >/dev/null 2>&1
			if [[ $? == 0 ]]; then
				COMPREPLY=($(COMP_WORDS="${COMP_WORDS[*]:1}" \
					COMP_CWORD=$((COMP_CWORD - 1)) \
					DJANGO_AUTO_COMPLETE=1 ${COMP_WORDS[*]}))
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

# === Aliases

# System updates
alias df='df -H'
alias du='du -chs .[!.]* * | sort -h'
alias rsync='rsync -rPh --info=progress2'

# More ls
alias ll='ls -hlF'
alias la='ls -ahlF'
alias l='ls -CF'

# Other aliases
alias untar='tar -xvf'

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# # git branch [moved into tmux statusbar]
# git_branch() {
#      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/|\1/'
# }
# export PS1="\u@\h:\[\e[32m\]\w\[\e[33m\]\$(git_branch)\[\e[00m\]$ "

export EDITOR="$VISUAL"

_activate_virtualenv() {
	_VENV_FOLDERS=(
		.venv
		var/env
	)
	if [[ -n $_VENV_ROOT ]]; then
		# deactivate virtualenv if the current folder isn't belong the activated one
		if [[ $(realpath $PWD)/ != $_VENV_ROOT/* ]]; then
			deactivate
			echo "Virtualenv deactivated: $_VENV_NAME"
			unset _VENV_ROOT
			unset _VENV_NAME
		fi
	fi
	if [[ -z $VIRTUAL_ENV ]]; then
		for _VENV_FOLDER in "${_VENV_FOLDERS[@]}"; do
			if [[ -f "$_VENV_FOLDER/bin/activate" ]]; then
				_VENV_ROOT=$(realpath $PWD)
				_VENV_NAME=$(basename $(pwd))
				VIRTUAL_ENV_DISABLE_PROMPT=1
				source $_VENV_FOLDER/bin/activate
				_OLD_VIRTUAL_PS1=$PS1
				PS1="($_VENV_NAME) $PS1"
				export PS1
				echo -e "Virtualenv activated: $_VENV_NAME"
				break
			fi
		done
	fi
}
export PROMPT_COMMAND="_activate_virtualenv;$PROMPT_COMMAND"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

_use_nvm() {
	if [[ $PWD == $PREV_PWD ]]; then
		return
	fi

	PREV_PWD=$PWD
	[[ -f ".nvmrc" ]] && nvm use
}
if [ -d "${NVM_DIR}" ]; then
	export PROMPT_COMMAND="_use_nvm;$PROMPT_COMMAND"
fi

# android
JAVA_HOME=$(update-alternatives --query javac 2>/dev/null | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')
export JAVA_HOME

export ANDROID_HOME="$HOME/Android/Sdk"
if [ -d "${ANDROID_HOME}" ]; then
	export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
	export PATH=$PATH:$ANDROID_HOME/platform-tools
	export PATH=$PATH:$ANDROID_HOME/emulator
fi

ANDROID_NDK_HOME="$(/bin/ls -d "$ANDROID_HOME"/ndk/* | sort -V | tail -1)"
export ANDROID_NDK_HOME
