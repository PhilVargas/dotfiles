# bash_profile
# load shell config files in ~/dotfiles/shell

SHELL_CONFIG=$HOME/dotfiles/shell

# Contains PS1 colorized prompt
source $SHELL_CONFIG/bash-prompt.sh

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script
__git_complete g _git_checkout

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
export NVM_DIR=~/.nvm
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.nvm/v0.10.38/bin:$PATH" # Use nvm node over system node
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias g='git'
alias dotfiles='cd ~/dotfiles'
alias vim='rvm system do /usr/local/bin/vim $@'
alias sandbox='rails console --sandbox'
alias brails='bundle exec rails'
alias brspec='bundle exec rspec'
alias reload='exec $SHELL -l'
alias sproc="ps aux | grep $1"
alias bash_profile='vim ~/.bash_profile'
alias gitignore_global='vim ~/.gitignore_global'
alias gitconfig='vim ~/.gitconfig'
alias vimrc='vim ~/.vimrc'
alias vundles='vim ~/.vimrc.bundles'

# LFFS Aliases
export LFFS=~/Desktop/Oversee/Farespotter
export LDAPUSERNAME=pvargas
alias load-lffs-images="rsync -r $LDAPUSERNAME@www01.lffs.prod:/home/travel/apps/FarespotterNet/shared/images/ $LFFS/public/images/r/"
alias deploy="ssh $LDAPUSERNAME@deploy01.tools.ops"
alias dssolr='bundle exec sunspot-solr start -- -d solr/data/development/ -p solr/'

# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'
alias lsa='ls -Gah'
alias vundle="vim +PluginInstall +PluginClean +qall!"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# set nvm source
source $(brew --prefix nvm)/nvm.sh
