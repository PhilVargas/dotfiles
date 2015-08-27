# bash_profile
# load shell config files in ~/dotfiles/shell
SHELL_CONFIG=$HOME/dotfiles/shell

# Contains PS1 colorized prompt
source $SHELL_CONFIG/bash-prompt.sh

# contains environment variables
source $SHELL_CONFIG/env.sh

# contains common aliases
source $SHELL_CONFIG/alias.sh

# Load git completions
source $SHELL_CONFIG/git-completion.sh

# LFFS Aliases
# TODO: move to .secret file
export LFFS=~/Desktop/Oversee/Farespotter
export LDAPUSERNAME=pvargas
alias load-lffs-images="rsync -r $LDAPUSERNAME@www01.lffs.prod:/home/travel/apps/FarespotterNet/shared/images/ $LFFS/public/images/r/"
alias deploy="ssh $LDAPUSERNAME@deploy01.tools.ops"
alias dssolr='bundle exec sunspot-solr start -- -d solr/data/development/ -p solr/'
alias brails='bundle exec rails'
alias brspec='bundle exec rspec'


# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# set nvm source
source $(brew --prefix nvm)/nvm.sh
