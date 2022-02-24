#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Downloading tweaked version of sys.config"
curl -sLf https://raw.githubusercontent.com/inigoflores/pisces-p100-tools/main/Not_Found_Fix/sys.config.turbo -o /home/pi/hnt/miner/configs/sys.config
echo "Restarting miner"
docker restart miner
echo "Done!"
echo -e "In order to verify that the changes are working, run every few minutes \n"
echo -e "sudo docker exec miner miner peer book -c \n"
echo "You should see a slow increase in the number of peers until it reaches around 200,000 in several hours"