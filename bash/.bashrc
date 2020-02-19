export CLICOLOR=1
export LANG="en_US.UTF-8"

alias ll="ls -alh"

export PS1="\[\033[01;34m\]\w\[\033[00m\] \$ "
export EDITOR="nvim"

export PATH=$HOME/.local/bin:$PATH

# pipenv completions
eval "$(pipenv --completion)"

# activate FZF plugin
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# verify history commands before executing
shopt -s histverify

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/Users/max/.netlify/helper/path.bash.inc' ]; then source '/Users/max/.netlify/helper/path.bash.inc'; fi

