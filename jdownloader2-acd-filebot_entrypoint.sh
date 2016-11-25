#!/bin/bash
set -e

export RCLONE_CONFIG_FILE=$(echo ~)/.rclone.conf

if [ ! -f "$RCLONE_CONFIG_FILE" ]; then
	if [ -n "$RCLONE_CONFIG" ]; then
		echo "$RCLONE_CONFIG" > "$RCLONE_CONFIG_FILE"
	else
		echo "rclone config file does not exist and is not present in the environment variables."
	fi
fi

source /jdownloader2_entrypoint.sh