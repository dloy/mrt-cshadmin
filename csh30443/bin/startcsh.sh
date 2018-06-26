#!/bin/bash
#Start Cloudhost with default values

pth="$(dirname -- "$0")"
#echo path $pth
cd $pth

value=`cat ../cloudhost/cshpid.txt 2>/dev/null`
if [ ! -z "$value" -a "$value" != " " ]; then
        echo "Cloudhost appears to be running - pid:$value"
	exit
fi

match='jar ./mrt-cloudhost-1.0.jar cdluc3 30443 38080'
runpid=`ps -ef | fgrep 'mrt-cloudhost'`
if [[ $runpid = *"$match"* ]]; then
	echo "Running Cloudhost found:$runpid"
	exit
fi
./runcsh.sh 30443 38080
echo Cloudhost started
