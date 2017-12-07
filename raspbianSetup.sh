#!/sbin/bash

#invoke as ROOT

#If you power up your Raspberry before your TV or AV Receiver is switched on your
# Raspberry Pi doesn’t detect an HDMI output device. As a result it falls back to composite 
#output and you’ll just see a black screen once you turn on your TV.

echo "creating a new user"
#add user robert ( prompt )
#adduser robert
#echo "add sudo"

#sed -i 's/old-word/new-word/g' *.txt


#set time zone !
#sudo raspi-config 

echo "add path for ldconfig (sbin)"
PATH=$PATH:/sbin

#echo "installing full ssh server"
#apt-get install ssh
#echo "Allowing to login only Local and Robert in etc/ssh/ssh_config"
#echo "PermitRootLogin no" >> /etc/ssh/ssh_config
#echo "AllowUsers *@192.168.*.* robert">> /etc/ssh/ssh_config
#echo "firewall enable ssh /etc/network/if-up.d/secure-rmc"
# iptables -A INPUT -i $IFACE -j DROP
#sed -i 's/iptables -A INPUT -i $IFACE -j DROP/iptables -A INPUT -i $IFACE -p tcp --dport 22 -j ACCEPT\niptables -A INPUT -i $IFACE -j DROP/g' /etc/network/if-up.d/secure-rmc


#The raspberry pi uses dphys-swapfile to control swapping. It dynamically creates a swap partition based on the available RAM. This tool needs to be used to turn off swap, and then needs to be removed from startup.
#Raspbmc uses /etc/init/swap.conf to configure swap via /swap file. It first checks for presence of "/home/pi/.enable_swap"

# disable swapping forever on your system:
sudo swapoff --all
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove
#call "free -m" in order to see your memory usage:


#add to fstab
#none        /var/run        tmpfs   size=1M,noatime         00
#none        /var/log        tmpfs   size=1M,noatime         00

echo "update artifacts" 
#/usr/bin/dpkg returned an error code (2)
sudo apt-get upgrade -V
apt-get update -y
apt-get upgrade -y

#add /etc/modules
sudo echo "i2c-bcm2708\ni2c-dev\nw1-gpio\nw1-therm" >> /etc/modules

# to enable monitoring on raspbian 3
#add /boot/config.txt 
#dtoverlay=w1-gpio

#instal python
#python_smb, python_gpio? rrdtool

#download rrd_tool and python modules
 sudo apt-get install rrdtool python-rrdtool -y --force-yes


#create rrd databse 
#download apache?
#add cron jobs 

#install apache
sudo apt-get install apache2 apache2-doc apache2-utils


echo "add 1wire modules"
sudo modprobe w1-gpio
sudo modprobe w1-therm


sudo echo "w1-gpio pullup=1" >> /etc/modules
sudo echo "w1-therm" >> /etc/modules

# to enable monitoring on raspbian 3
#add /boot/config.txt 

sudo echo "enable w1_gpio" >> /boot/config.txt 
sudo echo "enable w1_mv260" >> /boot/config.txt 

#add to fstab usb to mount with boot
sudo echo "/dev/sda    /mnt/sda   ext2  nofail,defaults    0   0" >> /etc/fstab

#use this tut: https://hallard.me/raspberry-pi-read-only/

#add to boot
#Enable ssh to store keys to home folders, /etc/ssh/sshd_config
#AuthorizedKeysFile  %h/.ssh/authorized_keys


