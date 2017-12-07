#!/bin/bash
#rrdtool dump temperature.rrd rrd.xml

rrdtool restore rrd.xml temperature.rrd -f
