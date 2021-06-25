#!/bin/bash
#create a package version. Usage: create_package_version.sh PACKAGENAME POSTINSTALLURL TAG

if [ $# -lt 1 ]
then
    PACKAGENAME="Dreamhouse Extension"
    POSTINSTALLURL="https://google.com"
    TAG=`git log -n 1 origin/master --pretty=format:"%H"`
else
    PACKAGENAME=$1
    POSTINSTALLURL=$2
    TAG=$3
fi

sfdx force:package:version:create --package "$PACKAGENAME" --wait 30 --postinstallurl $POSTINSTALLURL -x -c --tag $TAG
