#!/bin/bash
# @(#) Run state command to validate running Cloudhost

CMD="/usr/bin/curl -ks -X GET https://localhost:30443/cloudhost/state/8100?t=xml"
#printf "\n\n***CMD: $CMD\n"
state="$($CMD)"

#Return shell message and status
final_status=1
if [[ $state != *"<chsvc:ok>true</chsvc:ok>"* ]]; then
  echo "FAIL:$state"
else
  echo 'OK'
  final_status=0
fi
exit $final_status
