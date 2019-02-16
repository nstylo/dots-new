#
# ~/.bashrc
#

[[ $- != *i* ]] && return

# set vim as standard editor

export PATH=$PATH:~/bin
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
export BROWSER=firefox
export MANPAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
# unlimited bash history
export HISTSIZE= 
export HISTFILESIZE=

# custom alias
alias la='ls -a'
alias shutdown='shutdown now'
alias suspend='systemctl suspend'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vim='nvim'

source ~/bin/extract
source ~/bin/fuzzy

# fzf with fd for super fast fuzzuy searching
# export FZF_DEFAULT_COMMAND='fd --hidden --type f --exclude ".git"'
export FZF_CTRL_T_COMMAND='fd --hidden --type f --exclude ".git"'
export FZF_ALT_C_COMMAND='fd --hidden --type d'
# export FZF_DEFAULT_OPTS='--ansi'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.mozilla,*cache*,*Cache*,.node*,.electron*,.local,.steam,.cache,.git,Steam,Music,Videos}" 2> /dev/null'

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# PS1
export PS1="\[$(tput bold)\]\[\033[38;5;203m\]\u@\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \W \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;203m\]\\$>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
