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
      FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    fi
fi
autoload -Uz compinit
compinit

## Case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


# Directory Navigation  {{{1

setopt autocd autopushd correct correctall
CDPATH=.:~:~/Development:~/Documents
# CDPATH+=:~/Development/Courses/Introduction\ to\ Programming\ in\ C
export CDPATH

# Add `z` (https://github.com/rupa/z)
. /opt/homebrew/etc/profile.d/z.sh


# Language Support  {{{1

# Use Homebrew's LLVM
PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# To use LLVM's bundled libc++, add the following LDFLAGS
# LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"

# For compilers to find LLVM you may need to set the following
LDFLAGS+="-L/opt/homebrew/opt/llvm/lib"
CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Use GHCup
PATH+=":$HOME/.ghcup/bin"

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
export STARSHIP_CONFIG=~/.config/starship/powerline.toml

# Enable syntax highlighting (zsh-users/zsh-syntax-highlighting)
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


# vim: et sw=4 ts=4 sts=4 fdm=marker
