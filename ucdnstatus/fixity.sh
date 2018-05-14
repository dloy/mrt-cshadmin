#!/bin/bash
KEY="ark%3A%2F88888%2F170606%7C1%7Cproducer%2F$3.pdf"
CMD="curl -ks -X GET $1/cloudhost/fixity/$2/$KEY?digestType=md5&digest=9c061f645331c43cb42bf58f7f6e7e2a&length=32&t=xml"
$CMD
