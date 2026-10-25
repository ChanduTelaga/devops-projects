#!/usr/bin/env bash

PROJECT="bash-automation"
CURRENT_USER=$(whoami)
CURRENT_DIR=$(pwd)
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
HOST_NAME=$(hostname)
BACKUP_DIR="$HOME/devops-projects/bash-automation/backups"


echo "===== System Information ====="
echo "Project: $PROJECT"
echo "User: $CURRENT_USER"
echo "Working_directory: $CURRENT_DIR"
echo "Execution time: $TIMESTAMP"
echo "Host_Name: $HOST_NAME"
echo "Backup_Dir: $BACKUP_DIR"
echo "============================="


