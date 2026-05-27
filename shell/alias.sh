#-------------------------------------------------------------
# rails aliases
#-------------------------------------------------------------
alias sandbox='rails console --sandbox'
alias r='rails'
alias be="bundle exec $1"

#-------------------------------------------------------------
# command line aliases
#-------------------------------------------------------------
alias reload='exec $SHELL -l'       # resource current shell tab
alias sproc="ps aux | grep $1"      # grep for processes
alias ls='ls -Gh'                   # display in color with humanized file sizes
alias lsf='ls -Ghl'                 # display long in color with humanized file sizes
alias lsa='ls -Gah'                 # display all in color with humanized file sizes
alias lsfa='ls -Gahl'               # display all long in color with humanized file sizes
alias g='git'
alias dc='docker-compose'

#-------------------------------------------------------------
# navigation aliases
#-------------------------------------------------------------
alias zshrc='vim ~/.zshrc'
alias gitignore_global='vim ~/.gitignore_global'
alias gitconfig='vim ~/.gitconfig'
alias vimrc='vim ~/.vimrc'
alias plugins='vim ~/.vimrc.bundles'
alias dotfiles='cd ~/dotfiles'

#-------------------------------------------------------------
# editor aliases
#-------------------------------------------------------------
alias pluginstall="vim +PlugInstall +PlugClean! +qall" # install/clean vim-plug plugins
