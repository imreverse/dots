#!/bin/bash
top -bn 1 | awk '/%Cpu/ { { printf " " } if( $2<10 ) { printf "0" } printf "%d%", $2 }'
