#-------------------------------------------------------------
# Homebrew
#-------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

#-------------------------------------------------------------
# Path
#-------------------------------------------------------------
export PATH="$HOME/.bin:$PATH"

#-------------------------------------------------------------
# mise — Ruby & Node version management
#-------------------------------------------------------------
eval "$(mise activate zsh)"

#-------------------------------------------------------------
# React Native
#-------------------------------------------------------------
export ANDROID_HOME="$HOME/Library/Android/sdk"

#-------------------------------------------------------------
# LSColors
#-------------------------------------------------------------
# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=exGxFxdxCxDxDxaccxaeex

#-------------------------------------------------------------
# Zsh configuration
#-------------------------------------------------------------
setopt NO_CASE_GLOB

# Initialize the completion system (required for the matcher-list below to work)
autoload -Uz compinit && compinit

# Case-insensitive tab completion (cd, etc.)
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
