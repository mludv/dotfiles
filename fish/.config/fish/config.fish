if not functions -q fisher
	set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Google SDK
# bass source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
# bass source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc

# Variables
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_CTRL_T_COMMAND 'fd --type f --type d'
set -x FZF_CTRL_T_OPTS "--preview 'begin; bat --decorations never --color always {} 2> /dev/null; or exa --git-ignore --color always -T {}; end | head -200'"

set -g EDITOR nvim
set -g fish_user_paths "/Users/max/.local/bin" $fish_user_paths
set -g fish_user_paths "/Users/max/.netlify/helper/bin" $fish_user_paths

set -x LC_ALL 'en_US.utf-8'
set -x LANG 'en_US.utf-8'

# Aliases
alias gl "git log --oneline"

# Rust
source $HOME/.cargo/env

# Pyenv
status --is-interactive; and pyenv init --no-rehash - | source
