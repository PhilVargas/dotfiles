# Brewfile — declarative package list for `brew bundle`.
# Install / update everything with:  brew bundle --file=~/dotfiles/Brewfile

# Core tooling
brew "git"
brew "mise"                  # Ruby & Node version management
brew "tmux"
brew "gh"                    # GitHub CLI
brew "jq"                    # JSON processor

# Modern CLI workflow
brew "fzf"                   # fuzzy finder (history, files, vim)
brew "ripgrep"               # fast grep (rg)
brew "fd"                    # fast find
brew "bat"                   # cat with syntax highlighting
brew "git-delta"             # nicer git diffs (configured in home/gitconfig)

# Build dependencies / libraries
brew "cmake"
brew "libyaml"
brew "openssl"

# Editor & search
brew "vim"
brew "universal-ctags"
brew "the_silver_searcher"   # `ag`, used by vimrc

# Media
brew "imagemagick"

# Databases
brew "postgresql@16", restart_service: :changed
brew "redis", restart_service: :changed

# Shell
brew "bash-completion@2"
brew "zsh-autosuggestions"
brew "zsh-syntax-highlighting"

# GUI apps — edit to taste
cask "iterm2"
cask "visual-studio-code"
