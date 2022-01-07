#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ {printf " %s", $2}'
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#     top -l  2 | grep -E "^CPU" | tail -1 | awk '{ { printf " " } if( ($3+$5)<10 ) { printf "0" } printf "%d%%", ($3+$5) }'
fi
