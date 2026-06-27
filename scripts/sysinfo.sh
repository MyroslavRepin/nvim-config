#!/usr/bin/env bash
# Minimal system info for the nvim dashboard (macOS). Best-effort, never fails hard.

os=$(sw_vers -productName 2>/dev/null || echo macOS)
ver=$(sw_vers -productVersion 2>/dev/null)
host=$(scutil --get LocalHostName 2>/dev/null || hostname -s 2>/dev/null)
up=$(uptime 2>/dev/null | sed -E 's/.*up +//; s/, *[0-9]+ user.*//; s/, *load.*//')
load=$(uptime 2>/dev/null | sed -E 's/.*load averages?: *//')
disk=$(df -h / 2>/dev/null | awk 'NR==2{print $3" / "$2}')

# single top call (skip process list = fast)
t=$(top -l 1 -n 0 2>/dev/null)
mem=$(printf '%s\n' "$t" | awk '/PhysMem/{print $2" used"}')
cpu=$(printf '%s\n' "$t" | awk '/CPU usage/{print $3" usr  "$7" idle"}')

printf "   %s %s\n"   "$os" "$ver"
printf "   host  : %s\n" "$host"
printf "   up    : %s\n" "$up"
printf "   cpu   : %s\n" "${cpu:-n/a}"
printf "   load  :%s\n"  "${load:- n/a}"
printf "   mem   : %s\n" "${mem:-n/a}"
printf "   disk  : %s used\n" "${disk:-n/a}"
