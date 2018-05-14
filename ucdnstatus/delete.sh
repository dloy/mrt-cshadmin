#!/bin/bash
KEY="ark%3A%2F88888%2F170606%7C1%7Cproducer%2F$3.pdf"
CMD="curl -ks -X DELETE $1/cloudhost/delete/$2/$KEY?t=xml"
$CMD
