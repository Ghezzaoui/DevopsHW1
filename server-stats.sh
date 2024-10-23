#!/bin/bash
echo ""
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100-$1"%"}')
echo  "CPU Usage :$cpu_usage "
echo ""
echo "Memory Used: $(free -m | awk '/Mem:/{print $3 " mb"}')"
echo "Memory Cached: $(free -m | awk '/Mem:/{print $6 " mb"}')"
echo "Memory Available: $(free -m | awk '/Mem:/{print $4 " mb"}')"
echo "Memory Usage: $(free -m | awk '/Mem:/{print $3/$2 *100.0 " %"}')"
echo ""
echo "Disk Used: $(df -h / | awk '/dev/{print $3 }')"
echo "Disk Available: $(df -h / | awk '/dev/{print $4}')"
echo "Disk Usage: $(df -h / |awk '/dev/{print $3/$2 *100 "%"}')"
echo ""
echo "Top 5 Processes by CPU Usage"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo ""
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

