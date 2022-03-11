# Change Log

All notable changes to this project will be documented in this file.


## [0.40] - 2022-03-11

Based on the [0.38 official image provided by Pisces](https://drive.google.com/drive/folders/18AP0SJmIPlgYyl1HHyxLqsD-d1mBpboh).

### Added

- Pisces firmware: 0.40 (miner-arm64_2022.03.07.0_GA)
- Region and LoRa version select in dashboard
- Packet Forwarder V2 binary (since 0.38)

### Removed

- ZeroTier (since 0.38)

## [0.37] - 2022-03-01

Based on the [0.18 official image](https://drive.google.com/drive/folders/1uSwoJKY0-rrSZBLaOBE9tIUYmBdqy5KW).

### Added

- Pisces firmware: 0.37 (miner-arm64_2022.02.28.0_GA )
- QoL Dashboard: 0.28
- 1 Gbps LAN port issue patch
- API v2
- Service that updates dashboard status data and the public key at boot (avoids the `invalid onboarding address` error).
