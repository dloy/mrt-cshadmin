#!/bin/bash
# @(#) Start Cloudhost with parameters

# This script assumes $PWD is /dpr2/apps/csh30443/bin

#Set parameters
PW=cdluc3
SSL=$1
PORT=$2
NODE=$3

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
# If the $pth directory doesn't exist, exit with error.
cd ../cloudhost || exit 1

#Set logname
DATE=$(/bin/date '+%Y-%m-%d')
logname="cloudhost-$DATE.log"

#Start cloudhost
#works: java -jar ./mrt-cloudhost-1.0.jar $PW $SSL $PORT&
#works: exec &> ./log ; java -jar ./mrt-cloudhost-1.0.jar $PW $SSL $PORT&
cmd="/usr/bin/java -jar ./mrt-cloudhost-1.0.jar $PW $SSL $PORT $NODE"
logfile="../logs/$logname"
/bin/touch "$logfile"
echo "Starting cloudhost at $(/bin/date)" >>"$logfile"
$cmd >> "$logfile" 2>&1 &

#Save running pid
echo "$!" > ./cshpid.txt
