#!/bin/bash
CMD="curl -sk -X GET $1/cloudhost/state/$2?t=xml"
$CMD
