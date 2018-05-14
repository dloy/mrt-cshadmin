#!/bin/bash
HOST=$1
LOCATION=$2
FILEKEY=$3
DATE=`date +%N`
FILEKEY="$FILEKEY-$DATE"
#echo "###################################"
echo $HOST ";" $LOCATION ";" $FILEKEY
#echo +++FILEKEY=$FILEKEY
#printf `\n\n***Get status\n`
status=`./status.sh $HOST $LOCATION`

#echo $status
#printf `\n\n***Get state\n`
state=`./state.sh $HOST $LOCATION`
#echo ****HERE - $state
if [[ $state != *"<chsvc:ok>true</chsvc:ok>"* ]]; then
  echo "***ERROR STATE FAILS:$state"
  exit 4
fi
#echo "***STATE OK"

#printf `\n\n***Initial add\n`
add=`./add.sh $HOST $LOCATION $FILEKEY`
#echo **add=$add
if [[ $add != *"<chadd:added>true</chadd:added>"* ]]; then
  echo "***ERROR ADD FAILS:$add"
  exit 4
fi
#echo "***ADD OK"

#printf `\n\n***Initial meta\n`
meta1=`./meta.sh $HOST $LOCATION $FILEKEY`
#echo "meta1=$meta1"
if [[ $meta1 != *"<chmeta:digesttype>"* ]]; then
  echo "***ERROR META FAILS:$meta1"
  exit 4
fi
#echo "***META OK"


#printf `\n\n***fixity\n`
fixity=`./fixity.sh $HOST $LOCATION $FILEKEY`
#echo "fixity=$fixity"
if [[ $fixity != *"<chfix:ok>true"* ]]; then
  echo "***ERROR FIXITY FAILS:$fixity"
  exit 4
fi
#echo "*** FIXITY OK"

#printf "\n\n***Get\n"
dataget=`./get.sh $HOST $LOCATION $FILEKEY`
datafile=`cat ./test.txt`
if [[ $dataget != $datafile ]]; then
   echo "***ERROR GET MISMATCH:"
   echo "dataget=
   echo $dataget"
   echo "datafile=
   echo $datafile"
  exit 4
fi
#echo "***DATA MATCH"

#printf `\n\n***Final delete\n`
delete2=`./delete.sh $HOST $LOCATION $FILEKEY`
if [[ $delete2 != *"<chdel:deleted>true</chdel:deleted>"* ]]; then
   echo "***ERROR UNABLE TO DELETE:$delete2"
  exit 4
fi

#echo "***FINAL DELETE OCCURRED"

#printf `\n\n***Final meta - should be empty\n`
meta2=`./meta.sh $HOST $LOCATION $FILEKEY`
#echo "meta2=$meta2"
if [[ $meta2 = *"<chmeta:digesttype>"* ]]; then
  echo "***ERROR META AFTER DELETE OCCURS:$meta2"
  exit 4
fi
#echo "***META OK"
echo "TEST OK"
echo "-------------------------------------------------------------------------"
exit 1

echo status=$status
echo state=$state
echo delete1=$delete1
echo add=$add
echo meta1=$meta1
echo delete2=$delete2
echo meta2=$meta2
