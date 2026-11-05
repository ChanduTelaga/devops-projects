#!/usr/bin/env bash

#Backup configuration

SOURCE_DIR="$HOME/devops-projects/bash-automation/test-data"
BACKUP_DIR="$HOME/devops-projects/bash-automation/backups"

BACKUP_DATE=$(date '+%Y%m%d_%H%M%S')

BACKUP_FILE="$BACKUP_DIR/backup_$BACKUP_DATE.tar.gz"


echo "==== Backup Automation ===="

echo "Source directory: $SOURCE_DIR"
echo "Backup directory: $BACKUP_DIR"
echo "Backup filename: $BACKUP_FILE"

echo "Starting backup..."

tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

if [ $? -eq 0 ]; then
	echo "SUCCESS: Backup created successfully!"
	echo "Backup location: $BACKUP_FILE"
else
	echo "ERROR: Backup creation failed!"
	exit 1
fi


