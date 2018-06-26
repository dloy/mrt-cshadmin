#!/bin/bash
#Clean cloudhost Environment

pth="$(dirname -- "$0")"
#echo path $pth
cd $pth


#Remove cloudhost directories
rm -r ../cloudhost
rm -r ../logs
