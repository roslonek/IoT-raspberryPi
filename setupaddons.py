#Add the following to /home/pi/.xbmc-current/xbmc-bin/share/xbmc/system/advancedsettings.xml after the top <advancedsettings> tag

#<cputempcommand>/opt/vc/bin/vcgencmd measure_temp | sed -e 's/temp=\([0-9]*\).*/\1 C/'</cputempcommand>
#<gputempcommand>/opt/vc/bin/vcgencmd measure_temp | sed -e 's/temp=\([0-9]*\).*/\1 C/'</gputempcommand>