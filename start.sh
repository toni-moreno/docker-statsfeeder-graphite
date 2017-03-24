#!/bin/sh

VCENTER=
USER=
PASSWD=
CONFIG=

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

