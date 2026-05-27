#-------------------------------------------------------------
# fzf — fuzzy finder keybindings (Ctrl-R history, Ctrl-T files) & completion
#-------------------------------------------------------------
command -v fzf >/dev/null && source <(fzf --zsh)

#-------------------------------------------------------------
# zsh-autosuggestions
#-------------------------------------------------------------
[[ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#-------------------------------------------------------------
# zsh-syntax-highlighting (must be sourced last)
#-------------------------------------------------------------
[[ -r /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
