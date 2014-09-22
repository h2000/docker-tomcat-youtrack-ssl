FROM h2000/docker-tomcat-youtrack

VOLUME /var/lib/youtrack
EXPOSE 8080

# ADD scheme="https" and proxyPort="443" to tomcat connector config
RUN sed -i.org 's,Connector port="8080" protocol="HTTP/1.1",\0 scheme="https" proxyPort="443" ,g' /tomcat/conf/server.xml

CMD ["/bin/bash", "-e", "/tomcat/run.sh"]
