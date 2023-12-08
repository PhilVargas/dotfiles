autoload -U colors && colors
setopt PROMPT_SUBST

BLACK="%{$fg[black]%}"
RED="%{$fg[red]%}"
GREEN="%{$fg[green]%}"
YELLOW="%{$fg[yellow]%}"
BLUE="%{$fg[blue]%}"
VIOLET="%{$fg[magenta]%}"
DEFAULT="%{$reset_color%}"

function git_color() {
  local git_status="$(git status 2> /dev/null)"
  if [[ $git_status =~ "working directory clean" || $git_status =~ "working tree clean" ]]; then
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
 echo "(${ref#refs/heads/})"
}

function git_branch() {
  local git_status="$(git status 2> /dev/null)"
  local is_on_branch='^On branch ([^[:space:]]+)'
  local is_on_commit='HEAD detached at ([^[:space:]]+)'
  local is_rebasing="rebasing branch '([^[:space:]]+)' on '([^[:space:]]+)'"

  if [[ $git_status =~ $is_on_branch ]]; then
    local branch=${match[1]}
    git_color && echo -n "($branch) "
  elif [[ $git_status =~ $is_on_commit ]]; then
    local commit=${match[1]}
    git_color && echo -n "($commit) "
  elif [[ $git_status =~ $is_rebasing ]]; then
    local branch=${match[1]}
    local commit=${match[2]}
    git_color && echo -n "rebasing $branch on $commit "
  fi
}

PS1="%{$YELLOW%}%n "      # username of current user
PS1+="%{$BLUE%}%~ "       # basename of the CWD
PS1+="\$(git_branch)"     # colored git branch
PS1+="%{$DEFAULT%}%# "    # restore default text color and add prompt symbol
export PS1
