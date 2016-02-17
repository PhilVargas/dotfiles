#-------------------------------------------------------------
# Path
#-------------------------------------------------------------
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

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

