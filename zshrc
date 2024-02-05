# bash_profile
# load shell config files in ~/dotfiles/shell
SHELL_CONFIG=$HOME/dotfiles/shell

# Contains PS1 colorized prompt
source $SHELL_CONFIG/zsh-prompt.sh

# contains environment variables
source $SHELL_CONFIG/env.sh

# contains common aliases
source $SHELL_CONFIG/alias.sh

# Load git completions
source $SHELL_CONFIG/git-completion.sh

# Load machine specific settings
[[ -s "$HOME/dotfiles/zshrc.secret" ]] && source $HOME/dotfiles/zshrc.secret

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
