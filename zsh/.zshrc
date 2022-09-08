# ~/.zshrc
# Author: Dan Murphy

# Identify OS for environment-specific settings
system_type=$(uname -s)

# Language and localization settings
export  LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Make Homebrew completions available on macOS.
#   This must be done before `compinit` is called;
#   see <https://docs.brew.sh/Shell-Completion>
if [ "$system_type" = "Darwin" ]; then
    if type brew &>/dev/null; then
      FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
    fi
fi

# Command completion
autoload -Uz compinit
compinit

## Case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


# Directory navigation
setopt autocd autopushd correct correctall
CDPATH=.:~:~/Development:~/Documents
# CDPATH+=:~/Development/Courses/Introduction\ to\ Programming\ in\ C
export CDPATH


# Add Doom Emacs to PATH
PATH+=:~/.emacs.doom/bin
export PATH


# Enable colored output from ls, tree, etc.
#   For LSCOLORS (BSD, macOS) and LS_COLORS (Linux) values, see
#   <https://geoff.greer.fm/lscolors/> or <https://gist.github.com/thomd/7667642>
export CLICOLOR=1
if [ "$system_type" = "Darwin" ]; then
    export LSCOLORS=ExgxhxDxcxhxhxhxhxcxcx
    alias lsl='ls -ahl'
else;
    alias lsl='ls -ahl --color=auto'
    alias ls='ls --color=auto'
fi

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'


# Use Neovim
export EDITOR="nvim"
alias vi="nvim"
#alias vim="nvim"
alias vimdiff="nvim -d"

# On macOS,use Homebrew's gcc instead of Apple's clang
if [ "$system_type" = "Darwin" ]; then
    #alias -g gcc='gcc-11'
    #alias -g g++='g++-11'
fi

# Custom GNU Stow command for dotfiles repository
alias dstow='stow --dir=$HOME/Development/dotfiles --target=$HOME --no-folding'

# Skip the .git directory in repositories
alias tree='tree -I .git'

# Download videos in 720p
#alias ydl-720="youtube-dl -f '[height=720]'"


# Vi mode configuration
bindkey -v

# Escape from Insert to Normal mode with 'jj' or 'jk'
bindkey -M viins 'jj' vi-cmd-mode
#bindkey -M viins 'jk' vi-cmd-mode

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


# A simple PS1 prompt
#PS1=$'\n'"%B%F{blue}%1~%f%b \$ "

# Use Starship prompt
eval "$(starship init zsh)"


# Enable syntax highlighting <zsh-users/zsh-syntax-highlighting>
if [ "$system_type" = "Darwin" ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else;
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'


# Source fzf settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Shell-side configuration for Emacs vterm
vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

# Required for directory and prompt tracking in Emacs vterm
vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)";
}
setopt PROMPT_SUBST
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
