# Base image with Java
FROM openjdk:11-jre-slim

# Set GeoServer version
ENV GEOSERVER_VERSION=2.21.2

# Install GeoServer
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget -O geoserver-bin.zip https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-bin.zip/download && \
    unzip geoserver-bin.zip -d /opt && \
    mv /opt/geoserver-${GEOSERVER_VERSION} /opt/geoserver && \
    rm geoserver-bin.zip

# Set working directory to GeoServer
WORKDIR /opt/geoserver/bin

# Expose port 8080
EXPOSE 8080

# Start GeoServer
CMD ["sh", "startup.sh"]
