DEST='../cloudhost'
pth="$(dirname -- "$0")"
echo path $pth
cd $pth
rm -r $DEST 
mkdir $DEST
cp ./cshrun.sh $DEST/.
cp ./testrun.sh $DEST/.
cp ./state.sh $DEST/.
cp ./sslstate.sh $DEST/.
cp ./README.txt $DEST/.
curl  "http://builds.cdlib.org/view/Merritt/job/mrt-cloudhost-pub/ws/cloudhost-jetty/target/mrt-cloudhostjetty-1.0-SNAPSHOT.jar" >  $DEST/mrt-cloudhost-1.0.jar
zip ../cloudhost.zip $DEST/*
rm -r $DEST 
