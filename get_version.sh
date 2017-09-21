#!/bin/bash
# while [ $# -gt 0 ]; do
#         case $1 in
# 		"-p")
#                         shift
#                         Pom=${1}
#                 ;;
#                 *)
#                         echo "Use $0 -p [Pom]"
#                         exit 3
#                 ;;
#         esac
#         shift
# done
Pom=${1}
PomChanging=${2}
ChangeVersion=${3}

echo ""
echo "GET Version"
echo "POM:" "$Pom"
echo "POM CHANGING:" "$PomChanging"
echo "SCRIPT CHANGE VERSION:" "$ChangeVersion"
echo ""

Versao=`cat $Pom | grep "<version>" | head -n 1 | tr -d '<version> </version>'|tr -cd [:print:]`

Primeira=`echo $Versao | awk -F "." '{print $1}'`
Segunda=`echo $Versao | awk -F "." '{print $2}'`
Terceira=`echo $Versao | awk -F "." '{print $3}'`

Terceira=$(($Terceira - 1))

Concat=$Primeira.$Segunda.$Terceira
echo "SNAPSHOT:" "$Versao"
echo "PRODUÇÃO:" "$Concat"
echo ""



# Chama outro script pra realizar a mudança da versão na dependencia do pom
sh $ChangeVersion $PomChanging $Concat
