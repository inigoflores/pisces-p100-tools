# Pisces P100 Image

This is an unofficial image for the Pisces P100.

It's based on the [0.18 version provided by Pisces](https://docs.piscesminer.com/pisces-document/resources/p100-firmware-image).

## Changes to the Original Image

The following has been added/modified:

- Pisces firmware: 0.37
- QoL Dashboard: 0.28
- Miner: miner-arm64_2022.01.29.0_GA
- 1 Gbps LAN port issue patched
- Upgraded API to v2
- Added a service that updates dashboard status data and the public key at boot (avoids the invalid onboarding address error).
- Cleared blockchain
- Compressed to a 2.8 Gb zip file

## Packet Forwarder Version

The packet forward config files are for the Euroepan V1 card.

In case you have the **European V2 card,** SSH in and run:

    sudo wget https://raw.githubusercontent.com/piscesminer/Firmware-script-p100/master/PacketForward/Config/V2/EU868.sh -O - |sudo bash

If it's the **US V2 card version,** run:

    sudo wget https://raw.githubusercontent.com/piscesminer/Firmware-script-p100/master/PacketForward/Config/V2/US915.sh -O - | sudo bash

Currently Pisces has not released config files for the **V3 card** ([see repo](https://github.com/piscesminer/Firmware-script-p100/tree/master/PacketForward/Config)). It's probably safe to assume it uses the above V2 config scripts. 


## Download

* [Pisces-P100_0_37_EU_QoL_Dashboard.zip](https://drive.google.com/file/d/19qlftQlbSwSWuK9-EOWjHDIrsVwwprye/view?usp=sharing) (2.8 Gb)

You can burn this image with [Balena Etcher](https://www.balena.io/etcher/), [Rufus](https://rufus.ie/), [Raspberry Pi Imager](https://www.raspberrypi.com/software/) or other disk imaging tool.
