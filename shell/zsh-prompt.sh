autoload -U colors && colors
setopt PROMPT_SUBST

BLACK="%{$fg[black]%}"
RED="%{$fg[red]%}"
GREEN="%{$fg[green]%}"
YELLOW="%{$fg[yellow]%}"
BLUE="%{$fg[blue]%}"
VIOLET="%{$fg[magenta]%}"
DEFAULT="%{$reset_color%}"

# Build the colored "(branch) " segment from a single `git status` call.
function git_prompt() {
  local git_status
  git_status="$(git status 2> /dev/null)" || return

  local color=$RED
  if [[ $git_status =~ "working directory clean" || $git_status =~ "working tree clean" ]]; then
    if [[ $git_status =~ "Your branch is ahead of" ]]; then
      color=$YELLOW
    else
      color=$GREEN
    fi
  elif [[ $git_status =~ "Unmerged" ]]; then
    color=$VIOLET
  fi

  local label=""
  if [[ $git_status =~ 'On branch ([^[:space:]]+)' ]]; then
    label="(${match[1]}) "
  elif [[ $git_status =~ 'HEAD detached at ([^[:space:]]+)' ]]; then
    label="(${match[1]}) "
  elif [[ $git_status =~ "rebasing branch '([^']+)' on '([^']+)'" ]]; then
    label="rebasing ${match[1]} on ${match[2]} "
  fi

  echo -ne "${color}${label}"
}

PS1="%{$YELLOW%}%n "      # username of current user
PS1+="%{$BLUE%}%~ "       # basename of the CWD
PS1+="\$(git_prompt)"     # colored git branch
PS1+="%{$DEFAULT%}%# "    # restore default text color and add prompt symbol
export PS1
