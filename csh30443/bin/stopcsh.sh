#!/bin/bash
#Kill Cloudhost using saved pid

pth="$(dirname -- "$0")"
#echo path $pth
cd $pth

value=`cat ../cloudhost/cshpid.txt 2>/dev/null`
if [ ! -z "$value" -a "$value" != " " ]; then
        echo "Found pid:$value"
	kill -9 $value
	rm ../cloudhost/cshpid.txt
	echo csh stopped
else
	echo Cloudhost appears to be stopped: cshpid.txt not found
fi
