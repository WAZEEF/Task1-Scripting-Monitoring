#!/bin/bash

# Create timestamp
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
log_file="reports/report_${timestamp}.log"

# CPU and Memory Usage
echo "===== CPU and Memory Usage =====" > "$log_file"
top -b -n1 | head -10 >> "$log_file"

# Top 5 CPU-consuming processes
echo -e "\n===== Top 5 CPU-consuming Processes =====" >> "$log_file"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6 >> "$log_file"

# Disk Usage of /, /var, /home
echo -e "\n===== Disk Usage (/ /var /home) =====" >> "$log_file"
df -h / /var /home 2>/dev/null >> "$log_file"

# Network Interfaces and IPs
echo -e "\n===== Network Interfaces and IPs =====" >> "$log_file"
ip -brief addr show | awk '{print $1, $3}' >> "$log_file"

# Delete logs older than 14 days
find reports/ -name "report_*.log" -type f -mtime +14 -exec rm -f {} \;

echo "System report saved to $log_file"

