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

# Disable Alt-C / Esc-C or cd into dir
[[ $- =~ i ]] && bind '"\ec": nop'
