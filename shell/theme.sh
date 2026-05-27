#-------------------------------------------------------------
# Terminal theme — single source of truth for vim + tmux
#-------------------------------------------------------------
# The active theme is persisted in ~/.config/theme and exported as $THEME.
# vim reads $THEME on launch; tmux reads ~/.config/theme on load.
# iTerm2 and VSCode switch via their own pickers (see README).
THEME_FILE="$HOME/.config/theme"
export THEME="$(cat "$THEME_FILE" 2>/dev/null || echo catppuccin-mocha)"

# theme [name] — print options, or switch to <name>.
theme() {
  local themes=(catppuccin-mocha catppuccin-macchiato tokyonight-night tokyonight-storm)
  if [[ -z "$1" ]]; then
    print "current: $THEME\n\nusage: theme <name>"
    print "  ${(j:\n  :)themes}"
    return 0
  fi
  if (( ${themes[(Ie)$1]} == 0 )); then
    print -u2 "unknown theme: $1"
    return 1
  fi
  mkdir -p "${THEME_FILE:h}"
  print "$1" > "$THEME_FILE"
  export THEME="$1"
  [[ -n "$TMUX" ]] && tmux source-file "$HOME/.tmux/themes/$1.conf"
  print "theme set to $1 — reload vim / open a new shell for vim; iTerm & VSCode via their pickers"
}
