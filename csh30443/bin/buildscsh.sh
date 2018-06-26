#Start Cloudhost with default values

#set local directory
pth="$(dirname -- "$0")"
#echo path $pth
cd $pth

#set working directories
mkdir -p "../cloudhost"
mkdir -p "../logs"

#get cloudhost jar
./installcsh.sh
