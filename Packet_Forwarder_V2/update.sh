#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Updating packet forwarder"
cd /home/pi/hnt/paket/paket/packet_forwarder/
mv lora_pkt_fwd lora_pkt_fwd.bak
wget https://raw.githubusercontent.com/inigoflores/pisces-p100-tools/main/Packet_Forwarder_V2/lora_pkt_fwd.v2 -O lora_pkt_fwd
chmod a+x lora_pkt_fwd
echo "Restarting packet forwarder"
pkill lora_pkt_+
nohup ./lora_pkt_fwd >/dev/null 2>&1 &

