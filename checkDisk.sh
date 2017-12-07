#!/sbin/bash
#get to know on which partition we are on
sudo fdisk -l


#shut down your Pi using the following which will make the Pi check it.s own file system on reboot:
#sudo shutdown -F -r now
#results are in /var/log/fsck/


#push info for reboot check
sudo touch /forcefsck
reboot


#or
#sudo sed -i 's/#FSCKFIX=no/FSCKFIX=yes/g' /etc/default/rcS && grep "FSCKFIX=yes" /etc/default/rcS | wc -l
