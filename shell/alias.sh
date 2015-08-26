#-------------------------------------------------------------
# rails aliases
#-------------------------------------------------------------
alias sandbox='rails console --sandbox'
alias r='rails'
alias be="bundle exec $1"

#-------------------------------------------------------------
# command line aliases
#-------------------------------------------------------------
alias reload='exec $SHELL -l'   # resource current shell tab
alias sproc="ps aux | grep $1"  # grep for processes
alias ls='ls -Gh'               # display in color with humanized file sizes
alias lsa='ls -Gah'             # display all in color with humanized file sizes
alias g='git'

#-------------------------------------------------------------
# navigation aliases
#-------------------------------------------------------------
alias bash_profile='vim ~/.bash_profile'
alias gitignore_global='vim ~/.gitignore_global'
alias gitconfig='vim ~/.gitconfig'
alias vimrc='vim ~/.vimrc'
alias vundles='vim ~/.vimrc.bundles'
alias dotfiles='cd ~/dotfiles'

#-------------------------------------------------------------
# editor aliases
#-------------------------------------------------------------
alias vim='rvm system do /usr/local/bin/vim $@'       # open vim with correct version of ruby
alias vundle="vim +PluginInstall +PluginClean +qall!" # run vundle install

