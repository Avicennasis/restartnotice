#!/bin/bash

echo "What did you break now? Server" "$(hostname)" " restarted as of $(date '+%Y %b %d %H:%M:%S')" | mail -s "System Restart" USERNAME@gmail.com
