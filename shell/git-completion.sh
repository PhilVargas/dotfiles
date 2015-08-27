#-------------------------------------------------------------
# Git Completion
#-------------------------------------------------------------
source $SHELL_CONFIG/completions/git-completion.bash

# completes aliased git checkout commands.
# e.g. g co foo- #=> foo-branch
# http://stackoverflow.com/a/15009611/3213605
__git_complete g _git_checkout

