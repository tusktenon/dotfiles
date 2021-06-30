# ~/.bashrc
# Author: Dan Murphy

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Arch Linux standard PS1 prompt
#PS1='[\u@\h \W]\$ '

# A colourized PS1 prompt
BOLD="\[$(tput bold)\]"
BLUE="\[$(tput setaf 4)\]"
RESET="\[$(tput sgr0)\]"
#PS1="\n[\u@\h ${BOLD}${BLUE}\W${RESET}]\$ "
PS1="\n${BOLD}${BLUE}\W${RESET} \$ "

# Use vi mode
set -o vi
bind -m vi-insert '"jk":vi-movement-mode'
bind -m vi-insert '"kj":vi-movement-mode'
bind -m vi-insert "\C-l":clear-screen
bind -m vi-insert "\C-a":beginning-of-line
bind -m vi-insert "\C-e":end-of-line
bind -m vi-insert "\C-n":next-history
bind -m vi-insert "\C-p":previous-history
bind -m vi-insert "\C-w":backward-kill-word

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

# Starship prompt
#eval "$(starship init bash)"

