# Brewfile — declarative package list for `brew bundle`.
# Install / update everything with:  brew bundle --file=~/dotfiles/Brewfile

# Core tooling
brew "git"
brew "mise"                  # Ruby & Node version management
brew "tmux"

# Build dependencies / libraries
brew "cmake"
brew "libyaml"
brew "openssl"

# Editor & search
brew "vim"
brew "universal-ctags"
brew "the_silver_searcher"   # `ag`, used by vimrc / CtrlP

# Media
brew "imagemagick"

# Databases
brew "postgresql@16", restart_service: :changed
brew "redis", restart_service: :changed

# Shell completions
brew "bash-completion@2"

# GUI apps — edit to taste
cask "iterm2"
cask "visual-studio-code"
