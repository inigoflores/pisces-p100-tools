#!/bin/bash
sudo sed -i "/# By default this script does nothing./a\\\n# Fix Pisces 1Gb Ethernet problem\n/sbin/ethtool -s eth0 advertise 0x0f &\n\n" /etc/rc.local