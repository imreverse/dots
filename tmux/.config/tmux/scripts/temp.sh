#!/bin/bash
sensors | awk '/Package\ id\ 0/ {printf "%d°C", $4}'
