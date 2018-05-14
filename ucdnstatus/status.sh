#!/bin/bash
CMD="curl -s -X GET $1/cloudhost/status/$2?t=xml"
#printf "\n\n***CMD: $CMD\n"
$CMD
