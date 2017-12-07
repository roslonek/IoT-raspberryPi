#!/usr/bin/python2
import subprocess as sub
from bs4 import BeautifulSoup

printText="\n *Script for fetching local temp statistics from CWU system"
print printText+"\n"


def getCWUIP():
	cmd="/usr/sbin/arp"
	params=" -vn|grep 00:80:e1:b0:d5:4e|awk '{print $1}'"
	p = sub.Popen([cmd,params],stdout=sub.PIPE,stderr=sub.PIPE)
	ip,errors=p.communicate()
	print ip
	return ip

cmd = "curl"
#ip = getCWUIP()
ip="192.168.0.10"

url= "http://"+ip+"/index.shtml"
p = sub.Popen([cmd,url],stdout=sub.PIPE,stderr=sub.PIPE)
output,errors=p.communicate()


def parseHTML2Map(in_doc):
	parsed = BeautifulSoup(in_doc, 'html.parser')
	out={}
	#out=parsed.body.find('div', attrs={'class':'container'}).text
	from unidecode import unidecode
	#for link in parsed.find_all('div'):
	for divs in parsed.select('#obrazek > div'):
    		id=divs.get('id')
    		value=(divs.contents[0].contents)
		out[str(id)]=unidecode(value[0]) if len(value)>0 else 0
	return out

print parseHTML2Map(output)
