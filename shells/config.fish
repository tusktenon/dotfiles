# File: ~/.config/fish/config.fish
# Author: Dan Murphy

# Remove greeting message
set fish_greeting

# Use Starship prompt
starship init fish | source


# Vi Mode Settings
# Exit Insert mode with 'jj'
bind -s -M insert jj "set fish_bind_mode default; commandline -f backward-char repaint-mode"

# As in Vim, change cursor shape depending on mode
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_default block


# macOS-specific settings
if test (uname -s) = Darwin
    # Use Homebrew's gcc
    abbr -a gcc gcc-10
    abbr -a g++ g++-10

    # Use a single-line Starship prompt
    set -x STARSHIP_CONFIG ~/.config/starship-single-line.toml

    # Force mode-dependent cursor shape changes in Vi mode
    # Not recommended when using a multi-line prompt
    fish_vi_cursor --force-iterm
end


# Abbreviations and Aliases
abbr -a -- - 'cd -'
alias ... "cd ../.."
alias .... "cd ../../.."

