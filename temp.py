#!/usr/bin/python
import os, glob, time
import rrdtool


os.system('modprobe w1-gpio')
os.system('modprobe w1-therm')

rrdDB="temperature.rrd"
base_dir = '/sys/bus/w1/devices/'
dir1="/sys/bus/w1/devices/28-*/w1_slave"
sensors=dict()
sensors={
	"28-00044d0e53ff":"out",
	"28-000005936cd3":"dom",
	"28-000433480dff":"garaz"}

slaves=glob.glob(base_dir+'28*')
MIN_TEMP = -50
ERROR_TEMP = -999.99



#check if there are any sensors found
if not len(slaves):
#	device_folder = glob.glob(base_dir + '28*')[0]
#	device_file = device_folder + '/w1_slave'
	print len(slaves)
#else:
#	print "No sensors found"

def read_file(filename):
	f = open(filename, 'r')
	lines = f.readlines()
	f.close()
	return lines

def read_temp(temp_file):
	lines = read_file(temp_file)
	#print lines
	while lines[0].strip()[-3:] != 'YES':
		time.sleep(0.2)
		lines = read_file(temp_file)
		#print lines
	equals_pos = lines[1].find('t=')
	if equals_pos != -1:
		temp_string = lines[1][equals_pos+2:]
		temp_c = float(temp_string) / 1000.0
		temp_f = temp_c * 9.0 / 5.0 + 32.0
		return temp_c, temp_f

def update_rrd(databaseFile,sensor_folders):
	template = ""
	update = "N"
	for sensor_folder in sensor_folders:
		sensor_id=os.path.split(sensor_folder)[1]
 		#template = dom:out:garaz
		template += "%s:" % sensors[sensor_id]
		temp = read_temp(sensor_folder+"/w1_slave")
		#print temp[0]
		val=temp[0]
		if val>50.0: #cut off wrong temp values 
			val=0.0
		update +=":"+str(val) 
	update = update[:-1]
	template = template[:-1]
	rrdtool.update(databaseFile, "--template", template, update)
	print update+"\n"+template+"\n"
#------------------------------------------

def print_temps(slaves):
	for slave_folder in slaves:
		device_file = slave_folder + '/w1_slave'
		sensor_id=os.path.split(slave_folder)[1]
		print(sensor_id+" "+sensors[sensor_id]+"\t%f %s" % read_temp(device_file)+"\n")
#time.sleep(1)
print_temps(slaves)
#update_rrd(rrdDB,slaves)
