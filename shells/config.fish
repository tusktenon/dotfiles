# ~/.config/fish/config.fish
# Author: Dan Murphy

# macOS-specific settings
if test (uname -s) = Darwin
    # Use Homebrew's gcc
    abbr -a gcc gcc-10
    abbr -a g++ g++-10
end

