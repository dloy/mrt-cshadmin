#!/bin/sh
pth="$(dirname -- "$0")"
echo path $pth
cd $pth

value=`cat ../cloudhost/cshpid.txt`
if [ ! -z "$value" -a "$value" != " " ]; then
        echo "Found pid:$value"
	kill -9 $value
	rm ../cloudhost/cshpid.txt
	echo csh stopped
else
	echo cshpid.txt not found
fi
