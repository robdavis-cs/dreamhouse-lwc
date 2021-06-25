#!/bin/bash
#create a package version. Usage: create_package_version.sh PACKAGENAME POSTINSTALLURL TAG

PACKAGENAME=$1
POSTINSTALLURL="https://google.com"
TAG=`git log -n 1 origin/master --pretty=format:"%H"`

sfdx force:package:version:create --package "$PACKAGENAME" --wait 30 --postinstallurl $POSTINSTALLURL -x -c --tag $TAG
