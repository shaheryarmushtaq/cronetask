bash
#!/bin/bash

# Log file location
LOG_FILE="/var/log/system_monitor.log"

# Get the current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Get CPU usage
CPU_USAGE=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Get RAM usage
RAM_TOTAL=$(free | grep Mem | awk '{print $2}')
RAM_USED=$(free | grep Mem | awk '{print $3}')
RAM_USAGE=$(echo "scale=2; $RAM_USED / $RAM_TOTAL * 100" | bc)

# Get root filesystem usage
ROOT_USAGE=$(df -h / | grep / | awk '{print $5}')

# Write the output to the log file
echo "$TIMESTAMP - CPU Usage: $CPU_USAGE%, RAM Usage: $RAM_USAGE%, Root Usage: $ROOT_USAGE" >> $LOG_FILE

