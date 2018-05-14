#!/bin/bash
CMD="curl -ks -X POST -F key=ark:/88888/170606|1|producer/$3.pdf -F data=@./test.txt $1/cloudhost/content/$2?t=xml"
$CMD
