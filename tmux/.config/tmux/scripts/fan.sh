#!/bin/bash
sensors | awk '/cpu_fan/ {printf "%d RPM", $2}'
