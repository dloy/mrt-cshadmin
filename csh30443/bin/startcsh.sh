#!/bin/bash
# @(#) Start Cloudhost with default values

pth="$(/usr/bin/dirname -- "$0")"
#echo path $pth
# If the $pth directory doesn't exist, exit with error.
cd "$pth" || exit 1

value="$(/bin/cat ../cloudhost/cshpid.txt 2>/dev/null)"
if [ ! -z "$value" ] && [ "$value" != " " ]; then
        echo "Cloudhost appears to be running - pid:$value"
	exit
fi

match='jar ./mrt-cloudhost-1.0.jar cdluc3 30443 38080'
runpid="$(/bin/ps -ef | /bin/fgrep 'mrt-cloudhost')"
if [[ $runpid = *"$match"* ]]; then
	echo "Running Cloudhost found:$runpid"
	exit
fi
./runcsh.sh 30443 38080 8100
echo Cloudhost started
