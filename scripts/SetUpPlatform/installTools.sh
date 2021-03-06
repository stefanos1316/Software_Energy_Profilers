#!/bin/bash

#This script will install all the contained tools in this directory.

if [ "$UID" -ne "0" ]; then
	echo "Error: Please run as root since msr modules requires it"
	exit
fi


echo
echo "====================="
echo "|Installing jRAPL...|"
echo "====================="
echo
cd ../../jRAPL
make all
cd ../scripts/SetUpPlatform/

echo
echo "====================="
echo "|Installing Jalen...|"
echo "====================="
echo 
cd ../../jalen/2.0/
mvn clean install
sh build.sh
cd ../../scripts/SetUpPlatform

echo
echo "======================="
echo "|Installing Jolinar...|"
echo "======================="
echo
cd ../../jolinar/2.5/jolinar/
mvn clean install 
sh build.sh
sh release.sh
cd ../../../scripts/SetUpPlatform

echo
echo "======================="
echo "|Installing PowerAPI...|"
echo "======================="
echo

echo
echo "======================"
echo "|Installing Likwid...|"
echo "======================"
echo
cd ../../likwid/
make
cd ../script/SetUpPlatform

echo
echo "======================="
echo "|Installing WattsUp...|"
echo "======================="
echo
cd ../../watts-up
make
cd ../scripts/SetUpPlatform

echo "Done with all installations."

echo "Enabling msr modules for jRAPL..."


modprobe msr

"Applications console can be initallized as ..."
exit
