# Miner Peerbook Settings Tweak 

This tool downloads a modified version of sys.config that dramatically reduces the "not found" issue that is affecting almost every Helium miner.

It sets the following values:

```
   {peerbook_update_interval, 90000},
   {max_inbound_connections, 200},
   {outbound_gossip_connections, 50},
```

These values have shown to increase the peer books size to around 200,000. In order to check to the current peer book size, you can run:

    sudo docker exec miner miner peer book -c



## Run the script

### Apply changes 

    wget https://raw.githubusercontent.com/inigoflores/pisces-p100-tools/main/setting_tweaks/apply.sh -O - | sudo bash

### Restore backup of sys.config 

    wget https://raw.githubusercontent.com/inigoflores/pisces-p100-tools/main/setting_tweaks/restore.sh -O - | sudo bash