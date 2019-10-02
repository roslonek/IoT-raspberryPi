
#import androidhelper as android
#try:
#//    import androidhelper as android
#//except ImportError:
#//    import android
#import androidhelper, 
import urllib.request, json,re, socket
#droid = androidhelper.Android()
l=""
url=""



#droid.makeToast("124")


def getLTESignalDta(ipModem):
	#LTE modem
	urlModemSignal="http://"+ipModem+"/api/device/signal"
	#rsrq>-7dB</rsrq>\r\n<rsrp>-105dBm</rsrp>\r\n<rssi>-79dBm</rssi>\r\n<sinr>13dB</sinr
	with urllib.request.urlopen(urlModemSignal) as url:
		text=(url.read().decode())
		lines=[]
		lines=text.split('\\n')
		data=""
		for line in lines:
       		#print("--"+line)
       		#f=re.match("<div id=\"(.-)\">.->(.-)<.-</div>",line,re.M|re.I)
			f=re.findall(r'<([\w|\d]+)>(.+)<',line)#,re.M|re.I)
       		#print( f.group())
			if f:
          	#print(*f)
				data=str(f)+"\n"
	#print("\n-> "+str(data))
	return data
 
def getHeaterDta(ipPiec):
	#piec
	with urllib.request.urlopen(ipPiec) as url:
		text=(url.read().decode())
		lines=[]
		lines=text.split('\\n')
		for line in lines:
       		#print("--"+line)
       		#f=re.match("<div id=\"(.-)\">.->(.-)<.-</div>",line,re.M|re.I)
			f=re.findall(r'\s+<div id="([\w|\d]+)">.+>(\d+)<',line)#,re.M|re.I)
       		#print( f.group())
			if f:
          	#print(*f)
				data=str(f)[1:-1]+"\n"
    	#print(text)
		data2=data.split('), (')
		return data2
	
#for k,v in string.gmatch(str, "<div id=\"(.-)\">.->(.-)<.-</div>") do
#print (" piec\n"+ "\n".join(data2) )
#get Solar PV information from system
def getSolarData(ipSolar):
   with urllib.request.urlopen(ipSolar) as url:
    dataS = json.loads(url.read().decode())
    #data2=json.loads('"\\"foo\\bar"')
    l= dataS["Body"]["Data"]["Inverters"]["1"]
    #["E_Day"]
    # Body Data Inverters 1 E_Day
    #print(json.dumps(l))
   return str(l)
#====================================================
modemIP="192.168.8.1"   
solarip="192.168.0.94"
solarurl="http://"+solarip+"/solar_api/v1/GetPowerFlowRealtimeData.fcgi"
ipPiec="http://192.168.0.96"

#mozna obiektowo
class deviceFetch:
  def __init__(self, name, ip):
    self.name = name
    self.ip = ip
  def fetchURL(urlstring):
        with urllib.request.urlopen(urlModemSignal) as url:
                text=(url.read().decode())
  def request(self):
    print("Hello my name is " + self.name)


try: 
   socket.create_connection((solarip,"80")) 
   k=getSolarData(solarurl)
   print("\n".join(k.split(',')))
   
except socket.error: print ("Host niedostepny:"+solarip)

try:
   socket.create_connection((ipPiec,"80"))
   k=getHeaterDta(ipPiec)
   #socket.close()
except socket.error as exc: print ("Host niedostepny:"+ipPiec +", %s" % exc)


try: 
   socket.create_connection((modemIP,"80")) 
   l=getLTESignalDta(modemIP)
   print("\n".join(l.split('),')))
except socket.error: print ("Host niedostepny:"+modemIP)


#piec
#droid.makeToast('Piec:'+ data+'\nPrad'+"\n".join(k.split(',')))
#url.close()
    
