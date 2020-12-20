# File: ~/.config/fish/config.fish
# Author: Dan Murphy

# Use Starship prompt
starship init fish | source

# macOS-specific settings
if test (uname -s) = Darwin
    # Use Homebrew's gcc
    abbr -a gcc gcc-10
    abbr -a g++ g++-10
end

