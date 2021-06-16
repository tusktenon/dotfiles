# ~/.bashrc
# Author: Dan Murphy

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# A standard PS1 prompt
PS1='[\u@\h \W]\$ '

# Tell GnuPG pinentry to use the correct TTY
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye > /dev/null

alias ls='ls --color=auto'

# Use Neovim
export EDITOR="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"

export AUR_PAGER=nvim

# Custom GNU Stow command for dotfiles repository
alias dstow='stow --dir=$HOME/Development/dotfiles --target=$HOME --no-folding'

