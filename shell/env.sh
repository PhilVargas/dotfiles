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
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
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

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#-------------------------------------------------------------
# Zsh configuration
#-------------------------------------------------------------
setopt NO_CASE_GLOB
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
