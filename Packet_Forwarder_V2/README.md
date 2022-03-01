# Packet Forwarder V2

## Run the Script

    sudo wget https://raw.githubusercontent.com/inigoflores/pisces-p100-tools/main/Packet_Forwarder_V2/update.sh -O - | sudo bash

## Explanation

The V2 version of the LoRa card needs some values in global_conf.json that are not compatible with version 1 of the packer forwarder.

```
   "tx_gain_lut":[
		{"rf_power": 10, "pa_gain": 1, "pwr_idx": 251},
		{"rf_power": 11, "pa_gain": 1, "pwr_idx": 252},
		{"rf_power": 12, "pa_gain": 1, "pwr_idx": 253},
		{"rf_power": 13, "pa_gain": 1, "pwr_idx": 254},
		{"rf_power": 14, "pa_gain": 1, "pwr_idx": 255},
		{"rf_power": 15, "pa_gain": 1, "pwr_idx": 0},
		{"rf_power": 16, "pa_gain": 1, "pwr_idx": 1},
		{"rf_power": 17, "pa_gain": 1, "pwr_idx": 2},
		{"rf_power": 18, "pa_gain": 1, "pwr_idx": 3},
		{"rf_power": 19, "pa_gain": 1, "pwr_idx": 4},
		{"rf_power": 20, "pa_gain": 1, "pwr_idx": 5},
		{"rf_power": 21, "pa_gain": 1, "pwr_idx": 6},
		{"rf_power": 23, "pa_gain": 1, "pwr_idx": 8},
		{"rf_power": 25, "pa_gain": 1, "pwr_idx": 10},
		{"rf_power": 26, "pa_gain": 1, "pwr_idx": 13},
		{"rf_power": 27, "pa_gain": 1, "pwr_idx": 16}
   ]
````
For this reason, Pisces made some changes in the source files and compiled a new version.





