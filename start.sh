#!/bin/sh

VCENTER=
USER=
PASSWD=
CONFIG=

start() {
	#./config/vcenter.conf should define all previous variables

	if [ -f ./config/vcenter.conf ] 
	then

  	. ./config/vcenter.conf

  	STATSFEEDER_DIR=`dirname $0`
  	LIB_DIR=${STATSFEEDER_DIR}/lib
  	CLASSPATH=$(find "." -name '*.jar' | xargs echo | tr ' ' ':')

  	java -Dlog4j.configuration=file:./config/log4j.properties -cp "$CLASSPATH:." com.vmware.ee.statsfeeder.Main ${VCENTER} ${USER} ${PASSWD} ${CONFIG} 

	else
  		echo "error no vcenter.conf file found"
  		exit 1
	fi
}
start | tee -a /statsfeeder/logs/start.log 2>&1 &
while true
do
	D=`date`
	sleep 60
	echo -n "[$D] check for pid running process :" | tee -a /statsfeeder/logs/start.log
	np=`ps  | grep  com.vmware.ee.statsfeeder.Main  | grep -v grep | wc -l`
	case $np in
	"0")
	echo " Error statsfeeder is not working. Starting again...." | tee -a /statsfeeder/logs/start.log
	start | tee -a /statsfeeder/logs/start.log 2>&1 &
	;;
	*)
	 echo " Statsfeeder is RUNNING OK [$np processes]. Relax."  | tee -a /statsfeeder/logs/start.log
	;;
	esac
done
	







