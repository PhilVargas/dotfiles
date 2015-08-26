# shell bash-prompt.sh
#
# https://coderwall.com/p/pn8f0g/show-your-git-status-and-branch-in-color-at-the-command-prompt

BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
VIOLET="\033[0;35m"
DEFAULT="\033[0;00m"

function git_color() {
  local git_status="$(git status 2> /dev/null)"
  if [[ $git_status =~ "working directory clean" ]]; then
    if [[ $git_status =~ "Your branch is ahead of" ]]; then
      echo -ne $YELLOW
    else
      echo -ne $GREEN
    fi
  elif [[ $git_status =~ "Unmerged" ]]; then
    echo -ne $VIOLET
  else
    echo -ne $RED
  fi
}

function parse_git_branch {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || return
 echo "("${ref#refs/heads/}")"
}

function git_branch() {
  local git_status="$(\git status 2> /dev/null)"
  local is_on_branch='^On branch ([^[:space:]]+)'
  local is_on_commit='HEAD detached at ([^[:space:]]+)'
  local is_rebasing="rebasing branch '([^[:space:]]+)' on '([^[:space:]]+)'"

  if [[ $git_status =~ $is_on_branch ]]; then
    local branch=${BASH_REMATCH[1]:-$match[1]}
    git_color && echo -n "($branch) "
  elif [[ $git_status =~ $is_on_commit ]]; then
    local commit=${BASH_REMATCH[1]:-$match[1]}
    git_color && echo -n "($commit) "
  elif [[ $git_status =~ $is_rebasing ]]; then
    local branch=${BASH_REMATCH[1]:-$match[1]}
    local commit=${BASH_REMATCH[2]:-$match[2]}
    git_color && echo -n "rebasing $branch on $commit "
  fi
}

PS1="$YELLOW\u "      # username of current user
PS1+="$BLUE\W "       # basename of the CWD
PS1+="\$(git_branch)" # colored git branch
PS1+="$DEFAULT\$ "    # restore default text color
export PS1
