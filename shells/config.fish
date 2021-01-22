# File: ~/.config/fish/config.fish
# Author: Dan Murphy

# Remove greeting message
set fish_greeting

# Set terminal window title
function fish_title
    echo (status current-command) ' • '
    string replace ~ " ~" $PWD
    $PWD
end

# Use Starship prompt
set -x STARSHIP_CONFIG ~/.config/starship-double-line.toml
starship init fish | source

# Use Neovim
set EDITOR nvim
alias vim 'nvim'
alias vi 'nvim'

# Vi Mode Settings
# Exit Insert and Replace modes with 'jj'
bind -s -M insert jj "set fish_bind_mode default; commandline -f backward-char repaint-mode"
bind -s -M replace jj "set fish_bind_mode default; commandline -f backward-char repaint-mode"

# As in Vim, change cursor shape depending on mode
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_default block


# macOS-specific settings
if test (uname -s) = Darwin
    # Use Homebrew's gcc
    abbr -a gcc gcc-10
    abbr -a g++ g++-10

    # Use a single-line Starship prompt
    # set -x STARSHIP_CONFIG ~/.config/starship-single-line.toml

    # Force mode-dependent cursor shape changes in Vi mode
    # Not recommended when using a multi-line prompt
    fish_vi_cursor --force-iterm
end


# Abbreviations and Aliases
abbr -a -- - 'cd -'
alias ... 'cd ../..'
alias .... 'cd ../../..'

