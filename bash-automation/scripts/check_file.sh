#!/usr/bin/env bash

FILE_PATH="$HOME/devops-projects/bash-automation/scripts/hello.sh"

if [ -f "$FILE_PATH" ]; then
	echo "SUCCESS: File exists."
	exit 0
else
	echo "ERROR: File is missing."
	exit 1
fi

