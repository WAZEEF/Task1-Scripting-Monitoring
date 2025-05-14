#!/bin/bash

timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
log_file="reports/report_${timestamp}.log"

echo "===== CPU and Memory Usage =====" > "$log_file"
top -b -n1 | head -10 >> "$log_file"

echo -e "\n===== Top 5 CPU-consuming Processes =====" >> "$log_file"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6 >> "$log_file"

echo -e "\n===== Disk Usage (/ /var /home) =====" >> "$log_file"
df -h / /var /home 2>/dev/null >> "$log_file"

echo -e "\n===== Network Interfaces and IPs =====" >> "$log_file"
ip -brief addr show | awk '{print $1, $3}' >> "$log_file"

find reports/ -name "report_*.log" -type f -mtime +14 -exec rm -f {} \;

echo "System report saved to $log_file"

