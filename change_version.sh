#!/bin/bash
# while [ $# -gt 0 ]; do
#         case $1 in
# 		"-p")
#                         shift
#                         Pom=${1}
#                         newVersion=${2}
#                 ;;
#                 *)
#                         echo "Use $0 -p [Pom]"
#                         exit 3
#                 ;;
#         esac
#         shift
# done

Pom=${1}
NewVersion=${2}
# echo ""
# echo "Change Version"
# echo "POM:" "$Pom"
# echo "New Version:" "$NewVersion"
# echo ""

Version=`cat $Pom | grep "<version>"| head -n 3  `
Tag=`echo $Version | awk -F " " '{print $3}'`
Old=`echo $Tag |tr -d '<version> </version>'`
echo "Old Version: "$Old
echo "New Version: "$NewVersion

sed -i "s|$Old|$NewVersion|" $Pom
~
