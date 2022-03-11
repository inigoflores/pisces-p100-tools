# Pisces P100 Image

This is an unofficial image for the Pisces P100.

It's based on the [0.38 official image provided by Pisces](https://drive.google.com/drive/folders/18AP0SJmIPlgYyl1HHyxLqsD-d1mBpboh).


## Features

The image includes the following:

- Pisces firmware: 0.40 (miner-arm64_2022.03.07.0_GA)
- QoL Dashboard: 0.28
- Region and LoRa version selection in dashboard
- 1 Gbps LAN port issue patch
- API v2
- Packet Forwarder V2 binary
- Service that updates dashboard status data and the public key at boot (avoids the `invalid onboarding address` error).
- Blockchain cleared
- Compressed to a 3.0 Gb zip file

## Download

* [pisces-p100_0_40_unofficial_eu_us.zip](https://drive.google.com/drive/folders/1C0kbbBFdLXoclFrY9rE3YvO-El9TFv8Z?usp=sharing) (3.0 Gb)

You can burn this image with [Balena Etcher](https://www.balena.io/etcher/), [Rufus](https://rufus.ie/), [Raspberry Pi Imager](https://www.raspberrypi.com/software/) or other disk imaging tool.

## Configuration

This image is preconfigured to be used in Europe with a V2 LoRa module. If you plan to use it in the US and/or have a different LoRa module version, you can change these settings through the dashboard in Tools -> Change Region.

The LoRa module version can be found printed on top of the module. If neither V2 or V3 is present, then the module is V1. US miners are equiped with V2 & V3. There is no V1 version for US P100s.
