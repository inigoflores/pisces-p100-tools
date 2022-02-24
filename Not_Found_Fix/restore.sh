#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Restoring backup of sys.config"
curl -sLf https://raw.githubusercontent.com/inigoflores/pisces-p100-tools/main/Not_Found_Fix/sys.config -o /home/pi/hnt/miner/configs/sys.config
echo -n "Restarting miner... "
docker restart miner
echo "Done!"
