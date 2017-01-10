#!/bin/bash
set -e
########################################
##
## Change different platform
########################################
if [ -z $ROOT ]; then
	export ROOT=`cd .. && pwd`
fi

if [ -z $1 ]; then
	PLATFORM="OrangePiA64_Win"
else
	PLATFORM=$1
fi

VERSION=$ROOT/output/version
# Create Version state file
if [ ! -f $VERSION ]; then
	echo "$PLATFORM" > $VERSION
fi
OLD_PLATFORM=`cat $VERSION`

if [ $PLATFORM = $OLD_PLATFORM ]; then
	exit 0
fi 

echo "$PLATFORM" > $VERSION

#####
# Exchange File and Dirent
./00_VersionChange.sh "$PLATFORM" "$OLD_PLATFORM"
