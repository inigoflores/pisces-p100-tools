#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Installing latest Pisces firmware (only if necessary)"
wget -q --show-progress http://pisces-firmware.sidcloud.cn/latest/EU/update.sh -O - | bash

echo "Making backup of sys.config"
cp /home/pi/hnt/miner/configs/sys.config /home/pi/hnt/miner/configs/sys.config.bak
echo "Downloading tweaked version of sys.config"
curl -sLf https://raw.githubusercontent.com/inigoflores/pisces-p100-tools/main/setting_tweaks/sys.config.turbo -o /home/pi/hnt/miner/configs/sys.config
echo "Restarting miner"
docker restart miner
echo "Done!"
echo -e "In order to verify that the changes are working, run every few minutes \n"
echo -e "sudo docker exec miner miner peer book -c \n"
echo "You should see a slow increase in the number of peers until it reaches around 200,000 in several hours"