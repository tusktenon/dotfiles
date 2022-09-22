# ~/.bash_profile or ~/.zprofile
# Author: Dan Murphy

# Autostart X at login
if [ "$(tty)" = "/dev/tty1" ]; then
    exec startx
fi

