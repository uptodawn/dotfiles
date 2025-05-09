alias ls='ls --color=auto --group-directories-first'
alias la='ls --color=auto --group-directories-first -valh'
alias ll='ls --color=auto --group-directories-first -vAlh'

if [ ! -z "$(which nvim)" ]; then
	export MANPAGER='nvim +Man!'
	export VISUAL='nvim'
	export EDITOR='nvim'
fi
