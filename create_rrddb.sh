 #DS:variable_name:DST:heartbeat:min:max
 #archive storage RRA:CF:xff:step:rows
rrdtool create temperature.rrd \
    --start now --step 60 \
    DS:dom:GAUGE:120:-50:50 \
    DS:out:GAUGE:120:-50:50 \
    DS:garaz:GAUGE:120:-50:50 \
    DS:d:GAUGE:120:-50:50 \
    DS:e:GAUGE:120:-50:50 \
    RRA:AVERAGE:0.5:1:12 \
    RRA:AVERAGE:0.5:1:288 \
    RRA:AVERAGE:0.5:12:168 \
    RRA:AVERAGE:0.5:12:720 \
    RRA:AVERAGE:0.5:288:365
