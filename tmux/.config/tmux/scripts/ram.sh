#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    free -tm | awk '/Mem/ {printf "%.1fG", $3/1024}'
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#     top -l  2 | grep -E "^CPU" | tail -1 | awk '{ { printf " " } if( ($3+$5)<10 ) { printf "0" } printf "%d%%", ($3+$5) }'
fi
# free -tm | awk '/Mem/ {printf "RAM %.1f/%.1fGB (%d%)", $3/1024,$2/1024,$3*100/$2}'
