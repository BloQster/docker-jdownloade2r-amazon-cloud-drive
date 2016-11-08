#!/bin/bash
set -e

if [ ! -f "$ACD_CLI_CACHE_PATH"/oauth_data ]; then
	if [ -n "$ACD_OAUTH_DATA" ]; then
		echo "$ACD_OAUTH_DATA" > "$ACD_CLI_CACHE_PATH"/oauth_data
	else
		echo "ACD oauth data is not set. Please configure the ACD auth information."
	fi
fi

acdcli sync
acdcli mount -i 90 -ao "$ACD_MOUNT"

source /jdownloader2_entrypoint.sh