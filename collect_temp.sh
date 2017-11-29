#!/bin/bash

#sudo rrdtool updatev temperature.rrd N:24.0:12:0:0:0

sudo rrdtool graph /var/www/day_temp.png --start -1d DEF:inoctets=temperature.rrd:dom:AVERAGE DEF:outoctets=temperature.rrd:out:AVERAGE AREA:inoctets#00FF00:"Dom" LINE1:outoctets#0000FF:"Out"

sudo rrdtool graph /var/www/week_temp.png --start -1w DEF:inoctets=temperature.rrd:dom:AVERAGE DEF:outoctets=temperature.rrd:out:AVERAGE AREA:inoctets#00FF00:"Dom" LINE1:outoctets#0000FF:"Out"
rrdtool fetch temperature.rrd AVERAGE --start -1h
