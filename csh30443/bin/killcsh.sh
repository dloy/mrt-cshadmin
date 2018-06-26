#!/bin/bash
#Kill these Cloudhosts

pth="$(dirname -- "$0")"
echo path $pth
cd $pth

arr=($(pgrep -f 'jar ./mrt-cloudhost-1.0.jar cdluc3 30443 38080'))
for i in "${arr[@]}"
do
	echo KILL:$i
        kill -9 $i
done

rm ../cloudhost/cshpid.txt 
