if [ ! -f "../cloudhost" ]; then
    mkdir "../cloudhost"
fi
DATE=`date '+%Y%m%d%H%M%S'`
if [ ! -f "../cloudhost/save" ]; then
    mkdir "../cloudhost/save"
fi
mv ../cloudhost/mrt-cloudhost-1.0.jar ../cloudhost/save/mrt-cloudhost-1.0.jar.$DATE
curl  "http://builds.cdlib.org/view/Merritt/job/mrt-cloudhost-pub/ws/cloudhost-jetty/target/mrt-cloudhostjetty-1.0-SNAPSHOT.jar" >  ../cloudhost/mrt-cloudhost-1.0.jar
