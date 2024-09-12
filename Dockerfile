# Use Tomcat with OpenJDK
FROM tomcat:9.0-jre11-openjdk

# Set GeoServer version
ENV GEOSERVER_VERSION=2.21.2

# Download GeoServer WAR file
RUN wget -O /usr/local/tomcat/webapps/geoserver.war \
    https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war.zip/download && \
    unzip /usr/local/tomcat/webapps/geoserver.war -d /usr/local/tomcat/webapps/geoserver && \
    rm /usr/local/tomcat/webapps/geoserver.war

# Expose Tomcat port
EXPOSE 8080

# Default Tomcat command
CMD ["catalina.sh", "run"]
