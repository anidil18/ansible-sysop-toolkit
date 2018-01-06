# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -r /etc/bashrc ]; then
	. /etc/bashrc
fi
PS1="\[\e[1;33m\]\H:\[\e[0;33m\]\w\[\e[0;33m\]>"
alias ll='ls $LS_OPTIONS -l'
