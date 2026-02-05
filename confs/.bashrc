#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias hx='helix'
alias z='zellij'
alias ide='zellij --layout ~/.config/zellij/layout.kdl'

PS1='[\u@\h \W]\$ '
