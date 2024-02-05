#-------------------------------------------------------------
# Git Completion
#-------------------------------------------------------------
# source $SHELL_CONFIG/completions/git-completion.bash
# source $SHELL_CONFIG/completions/git-completion.zsh

# completes aliased git checkout commands.
# e.g. g co foo- #=> foo-branch
# http://stackoverflow.com/a/15009611/3213605
# __git_complete g _git_checkout

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
