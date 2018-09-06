#!/bin/bash
#Install Jenkins executable jar

#Set directory
pth="$(dirname -- "$0")"
#echo path $pth
cd $pth

#Archive existing jar
mkdir -p "../cloudhost/save"
DATE=`date '+%Y%m%d%H%M%S'`
out="../cloudhost/save/mrt-cloudhost-1.0.jar.$DATE"
mv ../cloudhost/mrt-cloudhost-1.0.jar $out

#Get deploy jar Jenkins
echo Save:$out
curl -s "http://builds.cdlib.org/view/Merritt/job/mrt-jetty-cloudhost/ws/cloudhost-jetty/master/mrt-cloudhost-1.0.jar"  > ../cloudhost/mrt-cloudhost-1.0.jar
ls -latd  ../cloudhost/mrt-cloudhost-1.0.jar

