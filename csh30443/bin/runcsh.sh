#!/bin/bash
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
cd ../cloudhost
#./j.sh $SSL $PORT &
java -jar ./mrt-cloudhost-1.0.jar $PW $SSL $PORT &
#java -jar mrt-cloudhost-1.0.jar $PWD $SSL $PORT &>/dev/null
echo "$!" > ./cshpid.txt
