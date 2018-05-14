#!/bin/bash
CMD="curl -ks -X GET https://localhost:30443/cloudhost/state/8100?t=xml"
#printf "\n\n***CMD: $CMD\n"
state=`$CMD`
if [[ $state != *"<chsvc:ok>true</chsvc:ok>"* ]]; then
  echo "FAIL:$state"
else
  echo 'OK'
fi
#echo "***STATE OK
