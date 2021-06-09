# ~/.zshrc
# Author: Dan Murphy

# Language and localization settings
export  LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# OS-specifc settings
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
    # macOS settings
    # Enable colored output from ls, etc. on FreeBSD-based systems
    export CLICOLOR=1
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

    # Tell grep to highlight matches
    export GREP_OPTIONS='--color=auto'

    # Make Homebrew completions available.
    # This must be done before `compinit` is called.
    # See <https://docs.brew.sh/Shell-Completion>
    if type brew &>/dev/null; then
      FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
      #autoload -Uz compinit
      #compinit
    fi

    # Use Homebrew's gcc
    alias -g gcc='gcc-10'
    alias -g g++='g++-10'
fi

# Command completion
autoload -Uz compinit
compinit

# Directory navigation
setopt autocd autopushd correct correctall
CDPATH=.:~:~/Development:~/Documents
CDPATH+=:~/Development/Courses/Introduction\ to\ Programming\ in\ C
export CDPATH

# Use Neovim
export EDITOR="nvim"
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

# Custom GNU Stow command for dotfiles repository
alias dstow='stow --dir=$HOME/Development/dotfiles --target=$HOME'

# Skip the .git directory in repositories
alias tree='tree -I .git'

# Download videos in 720p
alias ydl-720="youtube-dl -f '[height=720]'"


# Vi mode configuration
bindkey -v

# Escape from Insert to Normal mode with 'jj', 'jk' and/or 'kj'
# bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

# Change cursor shape depending on mode
_set_block_cursor() { echo -ne '\e[2 q' }
_set_bar_cursor() { echo -ne '\e[6 q' }
_set_underscore_cursor() { echo -ne '\e[4 q' }

# zle-keymap-select() {
#     if [[ $ZLE_STATE == *overwrite* ]]; then
#         _set_underscore_cursor
# 
#     elif [[ $KEYMAP == vicmd ]]; then
#         _set_block_cursor
# 
#     elif [[ $KEYMAP == main ]] ||
#          [[ $KEYMAP == viins ]] ||
#          [[ $KEYMAP = '' ]]; then
#         _set_bar_cursor
#     fi
# }
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
# precmd_functions+=(_set_bar_cursor)


# Use <Alt-e> to edit the current command line in an external editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^[e" edit-command-line

# Set terminal window title
# set-window-title() { print -Pn "\e]0;%~\a" }
# precmd_functions+=(set-window-title)

# Add Homebrew's installation directories to the front of the PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Use Starship prompt
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# Enable syntax highlighting <zsh-users/zsh-syntax-highlighting>
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
