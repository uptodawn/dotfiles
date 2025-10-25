[[ "$-" == *i* ]] || return

PS1='[\[\033[34;1m\]\w\[\033[0m\]]$ '

HISTSIZE=1024
HISTFILESIZE=4096
HISTCONTROL=ignoreboth
shopt -s histappend

alias ls='ls --g --color=auto'
alias la='ls --g --color=auto -valh'
alias ll='ls --g --color=auto -vAlh'
alias grep='grep --color=auto'

if [ -n "$(command -v nvim)" ]; then
	alias vim='nvim'
	alias nvr='nvim -R'
	export MANPAGER='nvim +Man!'
	export VISUAL='nvim'
	export EDITOR='nvim'
fi

if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
