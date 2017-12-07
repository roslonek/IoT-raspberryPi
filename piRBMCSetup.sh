#!/sbin/bash

#invoke as ROOT

#If you power up your Raspberry before your TV or AV Receiver is switched on your
# Raspberry Pi doesn’t detect an HDMI output device. As a result it falls back to composite 
#output and you’ll just see a black screen once you turn on your TV.

echo "remove x11 on raspbian"
sudo apt-get remove --dry-run --auto-remove --purge libx11-.*


echo "install apache "
sudo apt-get install apache2

echo "creating a new user"
#add user robert ( prompt )
adduser robert
#echo "add sudo"

#sed -i 's/old-word/new-word/g' *.txt

echo "update artifacts" 
apt-get update

echo "add path for ldconfig (sbin)"
PATH=$PATH:/sbin

echo "installing full ssh server"
apt-get install ssh

echo "Allowing to login only Local and Robert in etc/ssh/ssh_config"
echo "PermitRootLogin no" >> /etc/ssh/ssh_config
echo "AllowUsers *@192.168.*.* robert">> /etc/ssh/ssh_config

echo "firewall enable ssh /etc/network/if-up.d/secure-rmc"
# iptables -A INPUT -i $IFACE -j DROP
sed -i 's/iptables -A INPUT -i $IFACE -j DROP/iptables -A INPUT -i $IFACE -p tcp --dport 22 -j ACCEPT\niptables -A INPUT -i $IFACE -j DROP/g' /etc/network/if-up.d/secure-rmc

echo "adding transmission deamon"
apt-get install transmission-daemon 

#The raspberry pi uses dphys-swapfile to control swapping. It dynamically creates a swap partition based on the available RAM. This tool needs to be used to turn off swap, and then needs to be removed from startup.
#Raspbmc uses /etc/init/swap.conf to configure swap via /swap file. It first checks for presence of "/home/pi/.enable_swap"

# disable swapping forever on your system:
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove
#call "free -m" in order to see your memory usage:

#add to fstab
#none        /var/run        tmpfs   size=1M,noatime         00
#none        /var/log        tmpfs   size=1M,noatime         00


#/usr/bin/dpkg returned an error code (2)
#sudo apt-get upgrade -V
#apt-get upgrade -y
#apt-get update -y

echo "installing alsa sound utils - eg. arecord"
sudo apt-get install alsa-utils pulseaudio

# to enable monitoring on raspbian 3
#add /boot/config.txt 
#enable w1_gpio
#enable w1_mv260

#download rrd_tool
#apt-get install rrd_tool
#create rrd databse 
#download apache?
#add cron jobs 
