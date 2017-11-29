#!/bin/bash
clear

date
uname -a
echo
echo '----------------------------------'
echo ' Firmware Version'
echo '----------------------------------'
/opt/vc/bin/vcgencmd version
echo
echo '----------------------------------'
echo ' Up-time'
echo '----------------------------------'
uptime
echo
echo '----------------------------------'
echo ' Temperature'
echo '----------------------------------'
temp=`/opt/vc/bin/vcgencmd measure_temp | cut -d"=" -f 2 | cut -d"'" -f 1` ;
printf "%10s %5s\n"  "cpu :" "$temp 'C"
echo
echo '----------------------------------'
echo ' Voltage'
echo '----------------------------------'
for id in core sdram_c sdram_i sdram_p ; do
  volts=`/opt/vc/bin/vcgencmd measure_volts $id | cut -d"=" -f 2` ;
  printf "%10s %5s\n" "$id :" $volts ;
done
echo
echo '----------------------------------'
echo ' Frequency'
echo '----------------------------------'
for src in arm core h264 isp v3d uart pwm emmc pixel vec hdmi dpi ; do
  freqs=`/opt/vc/bin/vcgencmd measure_clock $src | cut -d"=" -f 2` ;
  freqs=`printf "%.2f" $(($freqs/1000000))` ;
  printf "%10s %11s\n" "$src :" "$freqs MHz" ;
done
echo
echo '----------------------------------'
echo ' Memory'
echo '----------------------------------'
for src in arm gpu ; do
arm=`/opt/vc/bin/vcgencmd get_mem $src | cut -d"=" -f 2` ;
printf "%10s %5s\n" "$src :" $arm ;
done
echo
echo '----------------------------------'
echo ' Codecs'
echo '----------------------------------'
for src in H264 MPG2 WVC1 MPG4 MJPG WMV9 ; do
  codec=`/opt/vc/bin/vcgencmd codec_enabled $src  | cut -d"=" -f 2` ;
  printf "%10s %1s\n" "$src :" $codec ;
done
echo
