[[ "$-" == *i* ]] || return

PS1='[\[\033[34;1m\]\w\[\033[0m\]]$ '

HISTSIZE=1000
HISTFILESIZE=3000
HISTCONTROL=ignoreboth
shopt -s histappend

alias la='ls -valh --g'
alias ll='ls -vAlh --g'

which nvim 2>/dev/null 1>/dev/null
if [ $? -eq 0 ]; then
	alias vim='nvim'
	export MANPAGER='nvim +Man!'
	export VISUAL='nvim'
	export EDITOR='nvim'
fi
