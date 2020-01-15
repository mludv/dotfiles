if not functions -q fisher
	set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Google SDK
# bass source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
# bass source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc

# Variables
export FZF_DEFAULT_COMMAND='fd --type f'
set -g EDITOR nvim
set -g fish_user_paths "/Users/max/.local/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/python/libexec/bin" $fish_user_paths

set -g fish_user_paths "/miniconda3/bin" $fish_user_paths
set -g fish_user_paths "/Users/max/.netlify/helper/bin" $fish_user_paths

set -x LC_ALL 'en_US.utf-8'
set -x LANG 'en_US.utf-8'

# Aliases
alias gl "git log --oneline"

# Rust
# source $HOME/.cargo/env

# Conda
source /miniconda3/etc/fish/conf.d/conda.fish
source /Users/max/.cargo/env
