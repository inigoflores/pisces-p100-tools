# Packet Forwarder V2

This script fixes the error that prevents the packet forwarder from running due to incompatbile configuration parametres in: 

    /home/pi/hnt/paket/paket/packet_forwarder/global_conf.json

If you run the packer forwarder from SSH, you get the following error:

    ERROR: Failed to configure concentrator TX Gain LUT for rf_chain 0

This error may happen if an update downloads a V2 style global_conf.json file, but you are still running V1 of the packet_forwarder.

All new miners are shipped with this version. Old miners running the V1 LoRa card shouldn't need to updrade. But it causes no harm to do so. 

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
For this reason, Pisces made some changes in the source files and compiled a new version. The changes are the following:


```
git diff ../libloragw/src/loragw_hal.c
diff --git a/libloragw/src/loragw_hal.c b/libloragw/src/loragw_hal.c
index a287aa3..d8ca923 100644
--- a/libloragw/src/loragw_hal.c
+++ b/libloragw/src/loragw_hal.c
@@ -501,7 +501,7 @@ int lgw_txgain_setconf(uint8_t rf_chain, struct lgw_tx_gain_lut_s * conf) {
             DEBUG_MSG("ERROR: TX gain LUT: External PA gain must not exceed 3\n");
             return LGW_HAL_ERROR;
         }
-        if (conf->lut[i].pwr_idx > 22) {
+        if ((conf->lut[i].pwr_idx > 22 )&&(conf->lut[i].pwr_idx < 247 )){
             DEBUG_MSG("ERROR: TX gain LUT: SX1250 power iundex must not exceed 22\n");
             return LGW_HAL_ERROR;
         }

```

