#!/bin/bash
echo copy our keymap to raspberry
#cp /opt/xbmc-bcm/xbmc-bin/share/xbmc/system/keymaps/remote.xml /home/pi/.xbmc/userdata/keymaps/remote.xml
cp vierakeymap.xml /home/pi/.xbmc/userdata/keymaps/remote.xml

echo "to test remote use cec-client"
echo "all cables in tv needs to be powered on and Tv turned off,on"