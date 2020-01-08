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
set -g fish_user_paths "/Library/Developer/Toolchains/swift-latest/usr/bin" $fish_user_paths

set -g fish_user_paths "$HOME/.cabal/bin" "$HOME/.ghcup/bin" $fish_user_paths
set -g fish_user_paths "/miniconda3/bin" $fish_user_paths
set -g fish_user_paths "/Users/max/.netlify/helper/bin" $fish_user_paths

set -x LC_ALL 'en_US.utf-8'
set -x LANG 'en_US.utf-8'

# Aliases
alias dc "docker-compose"
alias dj "docker exec -it django"

alias textualbeta "kubectl -n django-beta exec -it (kubectl -n django-beta get po -o=custom-columns=:metadata.name --no-headers --selector=app=django-gunicorn | tail -1) bash"
alias textualapp "kubectl -n django-app exec -it (kubectl -n django-app get po -o=custom-columns=:metadata.name --no-headers --selector=app=django-gunicorn | tail -1) bash"
alias textualstaging "kubectl -n django exec -it (kubectl -n django get po -o=custom-columns=:metadata.name --no-headers --selector=app=django-gunicorn | tail -1) bash"
alias textualdev "kubectl -n django-dev exec -it (kubectl -n django-dev get po -o=custom-columns=:metadata.name --no-headers --selector=app=django-gunicorn | tail -1) bash"

alias gb "git checkout (git branch | fzf-tmux -d 15 | string trim | cut -d' ' -f2)"
alias gl "git log --oneline"

# Rust
source $HOME/.cargo/env

# Conda
source /miniconda3/etc/fish/conf.d/conda.fish
