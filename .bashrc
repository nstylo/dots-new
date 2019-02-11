#
# ~/.bashrc
#

[[ $- != *i* ]] && return

# set vim as standard editor
VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR 

# unlimited bash history
HISTSIZE= 
HISTFILESIZE=

# custom alias
alias la='ls -a'
alias shutdown='shutdown now'
alias suspend='systemctl suspend'
# git dots
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

source ~/bin/extract
source ~/bin/vman
source ~/bin/fuzzy

# ptpb
export PATH=$PATH:~/bin

# fzf with fd for super fast fuzzuy searching
export FZF_DEFAULT_COMMAND='fd --hidden --exclude ".git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --hidden --type d'

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# PS1
export PS1="\[$(tput bold)\]\[\033[38;5;203m\]\u@\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \W \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;203m\]\\$>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
