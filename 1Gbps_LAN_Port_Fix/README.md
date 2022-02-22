# Fix for the Pisces P100 LAN Port 1Gbps Issue 

## Description

**Problem:** The P100 cannot establish a link with many switches/routers that support 1000BaseT. The reason seems to be linked to the PoE subsystem on the P100 which cannot handle 1000BaseT. When the switch and the RPi auto negotiate 1000BaseT, the link fails. Therefore, a workaround is to use a switch limited to 100BaseT or manually reducing the port speed at the switch. However not all switches/routers support this feature, which leaves the user no other option than to buy new equipment.

**Solution:** Limiting the advertised link modes on the RPi should fix this.

This is done with:

    sudo ethtool -s eth0 advertise 0x0f 

As per these values:

        advertise N
            Sets the speed and duplex advertised by autonegotiation.  The 
            argument is a hexadecimal value using one or a combination of
            the following values:
              0x001       10baseT Half
              0x002       10baseT Full
              0x004       100baseT Half
              0x008       100baseT Full
              0x010       1000baseT Half       (not supported by IEEE standards)
              0x020       1000baseT Full


To make the changes persistent, edit  `/etc/rc.local` and add :

     # Fix Pisces 1Gb Ethernet problem
     /sbin/ethtool -s eth0 advertise 0x0f &

After the line

      # By default this script does nothing.

There is probably a better place to implement this change, but I couldn't make it work in `/etc/network/if-pre-up.d/ethtool` .


**Links:**

* [Remove SOME advertised link modes with ethtool](https://unix.stackexchange.com/questions/408224/remove-some-advertised-link-modes-with-ethtool)

## How to Apply the Fix

Below you can find instructions on how to fix the port in the P100 so that any 10/100/1000 Mpbs switch can be used:

### Ethernet Method

1. Open your miner.
2. Locate a small yellow Ethernet cable that connects the Raspberry Pi to the PoE board. Unplug it at the RPi.
3. Plug the miner to a PoE switch/injector. This should power on the device.
4. Plug an additional Ethernet cable from your switch/router to your Raspberry Pi. This should provide a LAN link.
5. Run the patch script below.


**Instructions for Stock Dashboard**

Run in the browser:

      http://YOURIP/action.php?action=shell&cmd=wget https://raw.githubusercontent.com/inigoflores/pisces-p100-tools/main/1Gbps_LAN_Port_Fix/pisces_fix_lan.sh -O - | bash


**Instructions for PiscesQoLDashboard**

Login in via SSH and run:

      sudo wget https://raw.githubusercontent.com/inigoflores/pisces-p100-tools/main/1Gbps_LAN_Port_Fix/pisces_fix_lan.sh -O - | sudo bash


6. Put back the cables as they where and close the miner.
7. Restart the miner


## WiFi Method

Alternatively you can add the P100 to your WiFi network by means of the Helium App paired through bluetooth, so that you can run the script above without the need of opening the miner. 

This method should be more straightforward. However, the Ethernet method is preferred as some users have reported problems setting up WiFi on the miner.