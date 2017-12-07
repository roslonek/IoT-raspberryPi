#!/bin/bash
sed -i 's/<setting id="username" value=""/<setting id="username" value="MsMyrf"/g' /home/pi/.xbmc/userdata/addon_data/plugin.video.youtube/settings.xml
sed -i 's/<setting id="username" value=""/<setting id="user_password" value="116744"/g' /home/pi/.xbmc/userdata/addon_data/plugin.video.youtube/settings.xml
cat /home/pi/.xbmc/userdata/addon_data/plugin.video.youtube/settings.xml |grep user


#Add the following to /home/pi/.xbmc-current/xbmc-bin/share/xbmc/system/advancedsettings.xml after the top <advancedsettings> tag

#<cputempcommand>/opt/vc/bin/vcgencmd measure_temp | sed -e 's/temp=\([0-9]*\).*/\1 #C/'</cputempcommand>
<gputempcommand>/opt/vc/bin/vcgencmd measure_temp | sed -e 's/temp=\([0-9]*\).*/\1 C/'</gputempcommand>