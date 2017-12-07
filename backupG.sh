#!/bin/bash


echo "backup settings"
sudo initctl stop xmbc
sudo tar –cpf  /home/pi/xbmc_backup.tar /home/pi/.xbmc
sudo initctl start xbmc


#tar -crvf backup_$(date +%y.%m.%d).tar /home/pi --exclude="/home/pi/google_drive"
#gzip backup_$(date +%y.%m.%d).tar
#mv backup_$(date +%y.%m.%d).tar.gz ./google_drive
#cd ./google_drive 
#./grive
#cd ..

#or just make an image
#sudo dd bs=1024 of=20130414-raspi-dump.img if=/dev/mmcblk0p2

#find out which disk to backup
#distutil list