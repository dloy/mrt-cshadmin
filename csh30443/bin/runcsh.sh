#!/bin/bash
#Start Cloudhost with parameters

#Set parameters
PW=cdluc3
SSL=$1
PORT=$2

#Use system properties if parameter not set
if [ ! -z "$PORT" ] 
then
   export CLOUDHOST_PORT=$PORT
fi
echo set port $CLOUDHOST_PORT

if [ ! -z "$SSL" ] 
then
   export CLOUDHOST_SSL=$SSL
fi
echo set ssl $CLOUDHOST_SSL
cd ../cloudhost

#Set logname
DATE=`date '+%Y-%m-%d'`
logname="cloudhost-$DATE.log"

#Start cloudhost
#works: java -jar ./mrt-cloudhost-1.0.jar $PW $SSL $PORT&
#works: exec &> ./log ; java -jar ./mrt-cloudhost-1.0.jar $PW $SSL $PORT&
cmd="java -jar ./mrt-cloudhost-1.0.jar $PW $SSL $PORT"
$cmd > ../logs/$logname 2>&1 &

#Save running pid
echo "$!" > ./cshpid.txt
