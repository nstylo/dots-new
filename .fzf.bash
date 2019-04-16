# Setup fzf
# ---------
# if [[ ! "$PATH" == */home/niklas/.fzf/bin* ]]; then
#   export PATH="$PATH:/home/niklas/.fzf/bin"
# fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/fzf/key-bindings.bash"

