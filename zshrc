# ~/.zshrc
# Author: Dan Murphy

# Identify OS for environment-specific settings
system_type=$(uname -s)

# Language and localization settings
export  LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Use Neovim for editing
export EDITOR="nvim"


# Command Completion  {{{1

# Make Homebrew completions available on macOS.
# This must be done before `compinit` is called;
# see https://docs.brew.sh/Shell-Completion
if [ "$system_type" = "Darwin" ]; then
    if type brew &>/dev/null; then
      FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"
    fi
fi
autoload -Uz compinit
compinit

## Case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# The Fuck (nvbn/thefuck)
eval $(thefuck --alias)
eval $(thefuck --alias fk)


# Directory Navigation  {{{1

setopt autocd autopushd correct correctall
CDPATH=.:~:~/Development:~/Documents
# CDPATH+=:~/Development/Courses/Introduction\ to\ Programming\ in\ C
export CDPATH

# z (rupa/z)
. $HOMEBREW_PREFIX/etc/profile.d/z.sh

# Avoid annoying correction suggestion when running `cargo test`
alias cargo='nocorrect cargo'

# Language Support  {{{1

# Use Homebrew's LLVM
# (Disable when using Haskell Stack; see
#   https://docs.haskellstack.org/en/stable/faq/#how-do-i-resolve-linker-errors-when-running-stack-setup-or-stack-build-on-macos)
# PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# To use LLVM's bundled libc++, add the following LDFLAGS
# LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"

# For compilers to find LLVM you may need to set the following
# LDFLAGS+="-L/opt/homebrew/opt/llvm/lib"
# CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Use Homebrew's GHC 9.6
PATH="/opt/homebrew/opt/ghc@9.6/bin:$PATH"
LDFLAGS="-L/opt/homebrew/opt/ghc@9.6/lib"

# Use GHCup
# PATH+=":$HOME/.ghcup/bin"

# Standard ML of New Jersey
PATH+=":/usr/local/smlnj/bin"

# Add Ruby Version Manager (RVM) to PATH for scripting.
# Make sure this is the last PATH variable change.
PATH+=":$HOME/.rvm/bin"

export PATH
export LDFLAGS
export CPPFLAGS


# Colors  {{{1

# Enable colored output from ls, tree, etc.
# For LSCOLORS (BSD, macOS) and LS_COLORS (Linux) values, see
# https://geoff.greer.fm/lscolors/ or https://gist.github.com/thomd/7667642
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


# Keybindings and Aliases  {{{1

# Use Vi mode
bindkey -v

# Make useful Emacs-mode bindings available in Vi mode
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" forward-char
bindkey "^b" backward-char
bindkey "^d" delete-char
bindkey "^k" kill-line
bindkey "^w" backward-kill-word
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Make the behaviour of `C-u` consistent with Vim Insert/Command mode
bindkey '^u' backward-kill-line

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


# Edit the current command in $EDITOR with `M-e`
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line

# Prefer Neovim to Vim
alias vi="nvim"
#alias vim="nvim"
alias vimdiff="nvim -d"

# On macOS,use Homebrew options over Apple built-ins
if [ "$system_type" = "Darwin" ]; then
    # alias -g gcc='gcc-11'
    # alias -g g++='g++-11'
    # The following will take precedence even in Python virtual environments:
    # alias -g python='/opt/homebrew/bin/python3'
fi

# Skip the .git directory in repositories
alias tree='tree -I .git'

# Update dotfile symlinks with Dotbot
dotfiles_dir="~/Development/dotfiles"
alias dfsync="dotbot -d $dotfiles_dir -c $dotfiles_dir/install.conf.yaml"


# End-of-File Settings  {{{1
# The following should be sourced at the end of the `.zshrc` file.

# Use Starship prompt
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/modern-alt.toml

# Enable syntax highlighting (zsh-users/zsh-syntax-highlighting)
if [ "$system_type" = "Darwin" ]; then
    source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else;
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'


# FZF  {{{1

# Source fzf settings and shell integration
source <(fzf --zsh)

# Use fd instead of find
export FZF_DEFAULT_COMMAND="fd --hidden --follow --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --strip-cwd-prefix --exclude .git"

# Use fd for listing path candidates
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details
_fzf_compgen_path() {
    fd --hidden --follow --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude .git . "$1"
}

# Preview candidates
dir_preview='tree -C {} | head -200'
file_or_dir_preview="if [ -d {} ]; then $dir_preview; else bat -n --color=always --line-range :500 {}; fi"
export FZF_CTRL_T_OPTS="--preview '$file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview '$dir_preview'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command
# - You should make sure to pass the rest of the arguments to fzf
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)           fzf --preview "$dir_preview"         "$@" ;;
        export|unset) fzf --preview "eval 'echo \$'{}"     "$@" ;;
        ssh)          fzf --preview 'dig {}'               "$@" ;;
        *)            fzf --preview "$file_or_dir_preview" "$@" ;;
    esac
}

# vim: et sw=4 ts=4 sts=4 fdm=marker
