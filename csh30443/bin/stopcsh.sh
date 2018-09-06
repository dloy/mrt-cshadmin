#!/bin/bash
# @(#) Kill Cloudhost using saved pid

pth="$(/usr/bin/dirname -- "$0")"
#echo path $pth
# If the $pth directory doesn't exist, exit with error.
cd "$pth" || exit 1

value="$(/bin/cat ../cloudhost/cshpid.txt 2>/dev/null)"
if [ ! -z "$value" ] && [ "$value" != " " ]; then
        echo "Found pid:$value"
	/bin/kill -9 "$value"
	/bin/rm ../cloudhost/cshpid.txt
	echo csh stopped
else
	echo Cloudhost appears to be stopped: cshpid.txt not found
fi
