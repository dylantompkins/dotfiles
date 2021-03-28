#!/bin/bash

# NOT USING ANYMORE. SEE PYTHON VERSION

batt=$(headsetcontrol -b -c)

if [ $batt -eq "-1" ];
then
echo "Charging"
else
echo $batt%
fi