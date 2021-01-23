# File: ~/.config/fish/config.fish
# Author: Dan Murphy

# Language and localization settings
set -x LC_ALL en_CA.UTF-8
set -x LANG en_CA.UTF-8

# Remove greeting message
set fish_greeting

# Set terminal window title
# function fish_title
#     echo (status current-command) ' • '
#     string replace ~ " ~" $PWD
#     $PWD
# end

# Use Starship prompt
set -x STARSHIP_CONFIG ~/.config/starship-double-line.toml
starship init fish | source

# Use Neovim
set EDITOR nvim
alias vim 'nvim'
alias vi 'nvim'

# Vi Mode Settings
# Exit Insert and Replace modes with 'jk' or 'kj'
bind -s -M insert jk "set fish_bind_mode default; commandline -f backward-char repaint-mode"
bind -s -M insert kj "set fish_bind_mode default; commandline -f backward-char repaint-mode"
bind -s -M replace jk "set fish_bind_mode default; commandline -f backward-char repaint-mode"
bind -s -M replace kj "set fish_bind_mode default; commandline -f backward-char repaint-mode"

# As in Vim, change cursor shape depending on mode
set fish_vi_force_cursor
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_default block

# macOS-specific settings
if test (uname -s) = Darwin
    # Use Homebrew's gcc
    abbr -a gcc gcc-10
    abbr -a g++ g++-10

    # Force vi-mode-dependent cursor-shape changes in iTerm2
    fish_vi_cursor --force-iterm
end

# Directory navigation
set -x CDPATH ~:~/Documents:~/Documents/Development
set -x CDPATH "$CDPATH:~/Documents/Development/Courses/Introduction\ to\ Programming\ in\ C"

# Abbreviations and Aliases
abbr -a -- - 'cd -'
alias ... 'cd ../..'
alias .... 'cd ../../..'

