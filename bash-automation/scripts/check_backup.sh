BACKUP_DIR="$HOME/devops-projects/bash-automation/backups"

if [ -d "$BACKUP_DIR" ]; then
	echo "SUCCESS: backup directory exists."
else
	echo "ERROR: Backup directory is missing."
fi

