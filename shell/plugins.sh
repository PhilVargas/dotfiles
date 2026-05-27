#-------------------------------------------------------------
# fzf — fuzzy finder keybindings (Ctrl-R history, Ctrl-T files) & completion
#-------------------------------------------------------------
# Back fzf with fd: faster, respects .gitignore, skips .git
if command -v fd >/dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
fi
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
