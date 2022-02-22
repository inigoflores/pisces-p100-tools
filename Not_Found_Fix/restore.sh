#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Restoring backup of sys.config"
cp /home/pi/hnt/miner/configs/sys.config /home/pi/hnt/miner/configs/sys.config.bak
echo -n "Restarting miner... "
docker restart miner
echo "Done!"
