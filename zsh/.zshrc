# ~/.zshrc
# Author: Dan Murphy

# Command completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Command history
HISTFILE=~/.zsh_history
HISTSIZE=100
SAVEHIST=1000

# Directory navigation
setopt autocd autopushd correct correctall
CDPATH=.:~:~/Development:~/Documents
#CDPATH+=:~/Development/Courses/Introduction\ to\ Programming\ in\ C
export CDPATH

# A simple PS1 prompt
#PS1=$'\n'"%B%F{blue}%1~%f%b \$ "

# Vi mode configuration
bindkey -v

# Escape from Insert to Normal mode with 'jj', 'jk' and/or 'kj'
# bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode

# Keep some useful Emacs bindings
bindkey -M viins '\C-a' beginning-of-line
bindkey -M viins '\C-e' end-of-line
bindkey -M viins '\C-n' down-history
bindkey -M viins '\C-p' up-history

# Change cursor shape depending on mode
_set_block_cursor() { echo -ne '\e[2 q' }
_set_bar_cursor() { echo -ne '\e[6 q' }
_set_underscore_cursor() { echo -ne '\e[4 q' }

zle-keymap-select() {
    if [[ $KEYMAP == vicmd ]]; then
        _set_block_cursor

    elif [[ $ZLE_STATE == *overwrite* ]]; then
        _set_underscore_cursor

    else; 
        _set_bar_cursor
    fi
}
zle -N zle-keymap-select

# Start with bar cursor
zle-line-init() { _set_bar_cursor }
zle -N zle-line-init

# Enable colored output from ls, tree, etc.
export CLICOLOR=1
alias lsl='ls -ahl --color=auto'
alias ls='ls --color=auto'

# Use Neovim
export EDITOR="nvim"
alias vi="nvim"
#alias vim="nvim"
alias vimdiff="nvim -d"

# Custom GNU Stow command for dotfiles repository
alias dstow='stow --dir=$HOME/Development/dotfiles --target=$HOME --no-folding'

# Skip the .git directory in repositories
alias tree='tree -I .git'

# Download videos in 720p
#alias ydl-720="youtube-dl -f '[height=720]'"


# Use Starship prompt
eval "$(starship init zsh)"

# Enable syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
