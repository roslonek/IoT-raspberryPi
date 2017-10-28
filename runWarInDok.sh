#!/sbin/bash
docker run -d --name tomcatweb -p 8081:8080 -v /myData/webapp:/usr/local/tomcat/webapps tomcat
