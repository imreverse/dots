#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sensors | awk '/Package\ id\ 0/ {printf "%d°C", $4}'
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#     top -l  2 | grep -E "^CPU" | tail -1 | awk '{ { printf " " } if( ($3+$5)<10 ) { printf "0" } printf "%d%%", ($3+$5) }'
fi
