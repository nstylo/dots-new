# Setup fzf
# ---------
if [[ ! "$PATH" == */home/niklas/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/niklas/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/niklas/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/niklas/.fzf/shell/key-bindings.bash"

# Re-bind it to CTRL-Q
bind "$(bind -s | grep '^"\\ec"' | sed 's/ec/C-q/')"
[[ $- =~ i ]] && bind '"\ec": nop'
