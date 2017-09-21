#!/bin/bash

Pom=${1}
NewVersion=${2}
# echo ""
# echo "Change Version"
# echo "POM:" "$Pom"
# echo "New Version:" "$NewVersion"
# echo ""

Version=`cat $Pom | grep "<version>"| head -n 3  `
Tag=`echo $Version | awk -F " " '{print $3}'`
Old=`echo $Tag |tr -d '<version> </version>'|tr -cd [:print:]`
echo "Old Version: "$Old
echo "New Version: "$NewVersion

sed -i "s|$Old|$NewVersion|" $Pom
