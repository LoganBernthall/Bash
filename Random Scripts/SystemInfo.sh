#!/bin/bash

echo "==== System Information ===="
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo "Memory Usage:"
free -h 
echo "Disk Usage:"
df -h | grep '^/dev/'
echo "CPU Load:"
top -bn1 | grep "CPU(s)"
