#-------------------------------------------------------------
# React Native
#-------------------------------------------------------------
export ANDROID_HOME="$HOME/Library/Android/sdk"

#-------------------------------------------------------------
# Homebrew
#-------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

#-------------------------------------------------------------
# Path
#-------------------------------------------------------------
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$(yarn global bin):$PATH"

#-------------------------------------------------------------
# LSColors
#-------------------------------------------------------------
# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=exGxFxdxCxDxDxaccxaeex

#-------------------------------------------------------------
# Source scripts
#-------------------------------------------------------------

# set nvm source
source ~/.nvm/nvm.sh

# Initialize rbenv
eval "$(rbenv init -)"

#-------------------------------------------------------------
# Zsh configuration
#-------------------------------------------------------------
setopt NO_CASE_GLOB
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
