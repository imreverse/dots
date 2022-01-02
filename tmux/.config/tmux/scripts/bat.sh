#!/bin/bash
upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ {printf " %s", $2}'
