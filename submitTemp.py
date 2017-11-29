#!/usr/bin/python 
import rrdtool 

databaseFile = "/path/to/database/file.rrd" 
MIN_TEMP = -50 
ERROR_TEMP = -999.99 

rrds_to_filename ={
 "a" : "/sys/bus/w1/devices/28-000005502198/w1_slave", 
 "b" : "/sys/bus/w1/devices/28-00000550283e/w1_slave", 
 "c" : "/sys/bus/w1/devices/28-000005502a61/w1_slave", 
 "d" : "/sys/bus/w1/devices/28-000005501105/w1_slave", 
 "e" : "/sys/bus/w1/devices/28-000005515d97/w1_slave", } 

def read_all(): 
 template = "" 
 update = "N:" 
 for rrd in rrds_to_filename: 
  template += "%s:" % rrd 
  temp = read_temperature(rrds_to_filename[rrd]) 
  update += "%f:" % temp 
 update = update[:-1] 
 template = template[:-1] 
 rrdtool.update(databaseFile, "--template", template, update)