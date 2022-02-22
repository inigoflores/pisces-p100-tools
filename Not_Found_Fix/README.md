# Challenger Not Found Peerbook Size Increase Fix 

This tool downloads a modified version of sys.config that dramatically reduces the "not found" issue that is affecting almost every Helium miner.

It sets the following values:

```
   {peerbook_update_interval, 180000},
   {max_inbound_connections, 200},
   {outbound_gossip_connections, 50},
```

These values have shown to increase the peer books size to around 200,000. In order to check to the current peer book size, you can run:

    sudo docker exec miner miner peer book -c



## Run the script

### Apply changes 

    sudo wget https://raw.githubusercontent.com/inigoflores/pisces-p100-tools/main/Not_Found_Fix/apply.sh -O - | sudo bash

### Restore backup of sys.config 

    sudo wget https://raw.githubusercontent.com/inigoflores/pisces-p100-tools/main/Not_Found_Fix/restore.sh -O - | sudo bash