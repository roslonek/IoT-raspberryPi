#!/usr/bin/python2
import subprocess as sub
from bs4 import BeautifulSoup

printText="Script for fetching local temp statistics from CWU system"
print printText+"\n"


cmd = "curl"
url= "http://192.168.0.107/index.shtml"
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
