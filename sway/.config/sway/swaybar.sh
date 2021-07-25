# ~/.config/sway/swaybar.sh
# Author: Dan Murphy

day_date=$(date +'%a %b %d')
current_time=$(date +'%l:%M %p')
battery_charge=$(cat /sys/class/power_supply/CMB0/capacity)
battery_status=$(cat /sys/class/power_supply/CMB0/status)

echo "$battery_charge% ($battery_status)    $day_date    $current_time"

