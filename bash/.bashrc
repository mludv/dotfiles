export CLICOLOR=1
export LANG="en_US.UTF-8"

alias ll="ls -alh"

export PS1="\[\033[01;34m\]\w\[\033[00m\] \$ "
export EDITOR="vim"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
