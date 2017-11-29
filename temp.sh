#!/bin/bash

temperature=`vcgencmd measure_temp | sed -e 's/.*=\([^.]*\).*/\1/'`
precise=`vcgencmd measure_temp | sed -e "s/.*=\([^\']*\).*/\1/"`
email=youremailaddress@whatever.com
max=70

logger -t "temperature-check" "Temperature: $precise, max: $max"
if [ "$temperature" -ge "$max" ]; then
  (echo "The temperature is currently $temperature. Greater or equal to $max."
   echo ""
   echo "SHUTTING DOWN THE SYSTEM IN 30 SECONDS") | mail $email -s 'Temperature too high - shutting down!' &>/dev/null
  sync
  sleep 30
  halt
fi