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

# Load machine specific settings
[[ -s "$HOME/dotfiles/bash_profile.secret" ]] && source $HOME/dotfiles/bash_profile.secret

