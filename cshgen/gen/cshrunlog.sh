#!/bin/bash
#Start script with log
#Form: 
# cshrun <https port for unsigned cert> <http port>
#Example
# cshrun 30443 38080

PW=cdluc3
SSL=$1
PORT=$2

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

#Set logname
mkdir ../logs
DATE=`date '+%Y-%m-%d'`
logname="cloudhost-$DATE.log"

java -jar mrt-cloudhost-1.0.jar $PW $SSL $PORT > ../logs/$logname 2>&1