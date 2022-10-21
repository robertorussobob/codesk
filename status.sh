#!/bin/bash

echo "Memory available"
grep MemTotal /proc/meminfo | awk '{print $2}' | xargs -I {} echo "scale=4; {}/1024^2" | bc
echo "CPUs available"
lscpu | grep -E '^Thread|^Core|^Socket|^CPU\('

