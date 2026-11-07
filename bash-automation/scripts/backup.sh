#!/usr/bin/env bash

#Backup configuration

SOURCE_DIR="$HOME/devops-projects/bash-automation/test-data"
BACKUP_DIR="$HOME/devops-projects/bash-automation/backups"
LOG_FILE="$HOME/devops-projects/bash-automation/logs/backup_history.log"

BACKUP_DATE=$(date '+%Y%m%d_%H%M%S')

BACKUP_FILE="$BACKUP_DIR/backup_$BACKUP_DATE.tar.gz"

#Validate Source Directory
if [ ! -d "$SOURCE_DIR" ]; then
	echo "ERROR: Source directory does not exist: $SOURCE_DIR"
	exit 1
fi

#Validate backup directory
if [ ! -d "$BACKUP_DIR" ]; then
	echo "ERROR: Backup directory does not exist: $BACKUP_DIR"
	exit 1
fi


echo "==== Backup Automation ===="

echo "Source directory: $SOURCE_DIR"
echo "Backup directory: $BACKUP_DIR"
echo "Backup filename: $BACKUP_FILE"

echo "Starting backup..."
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup started" >> "$LOG_FILE"


if tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"; then
	echo "SUCCESS: Backup created successfully!"
	echo "Backup location: $BACKUP_FILE"

	echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup completed successfully" >> "$LOG_FILE"
	echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup file: $(basename "$BACKUP_FILE")" >> "$LOG_FILE"
else
	echo "ERROR: Backup creation failed!"
	echo "[$(date %Y-%m-%d %H:%M:%S)] Backup failed" >> "$LOG_FILE"
	exit 1
fi


