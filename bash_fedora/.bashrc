# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias ll="ls -alh"

export PS1="\[\033[01;34m\]\w\[\033[00m\] \$ "
export EDITOR="vim"

export PATH=$HOME/.local/bin:$PATH

# activate FZF plugin
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# verify history commands before executing
shopt -s histverify
