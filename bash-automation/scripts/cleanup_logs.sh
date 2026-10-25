
#!/usr/bin/env bash

LOG_DIR="$HOME/devops-projects/bash-automation/logs"
HISTORY_LOG="$LOG_DIR/cleanup_history.log"
DAYS=7
DRY_RUN=true

# Check that the log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "ERROR: Log directory does not exist: $LOG_DIR"
    exit 1
fi

#Record the start time
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Cleanup started" >> "$HISTORY_LOG"

echo "===== Log Cleanup ====="
echo "Log directory: $LOG_DIR"
echo "Age threshold: $DAYS days"

if [ "$DRY_RUN" = true ]; then
    echo "Mode: Preview only (no files will be deleted)"
    find "$LOG_DIR" -type f -name "*.log" ! -name "cleanup_history.log"  -mtime +"$DAYS" -print
    status=$?
else
    echo "Mode: Deletion enabled"
    find "$LOG_DIR" -type f -name "*.log" ! -name "cleanup_history.log"  -mtime +"$DAYS" -delete
    status=$?
fi

if [ "$status" -ne 0 ]; then
    echo "ERROR: Log cleanup command failed."
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Cleanup failed (exit code: $status)" >> "$HISTORY_LOG"
    exit 1
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Cleanup completed successfully" >> "$HISTORY_LOG"

echo "===== Cleanup Complete ====="
exit 0

