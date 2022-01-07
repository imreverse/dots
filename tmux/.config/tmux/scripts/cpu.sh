#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    top -bn 1 | awk '/%Cpu/ { { printf " " } if( $2<10 ) { printf "0" } printf "%d%", $2 }'
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#     top -l  2 | grep -E "^CPU" | tail -1 | awk '{ { printf " " } if( ($3+$5)<10 ) { printf "0" } printf "%d%%", ($3+$5) }'
fi
