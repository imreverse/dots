#!/bin/bash
free -tm | awk '/Mem/ {printf "%.1fG", $3/1024}'
# free -tm | awk '/Mem/ {printf "RAM %.1f/%.1fGB (%d%)", $3/1024,$2/1024,$3*100/$2}'
