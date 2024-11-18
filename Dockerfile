FROM ubuntu

# Install required packages and Java
RUN apt-get update -y && \
    apt install openjdk-17-jdk wget tar vim -y && \
    rm -rf /var/lib/apt/lists/*

# Create tomcat user and directory
RUN mkdir -p /home/tomcat && \
    useradd -d /home/tomcat -s /bin/bash tomcat

# Set working directory and download Tomcat
WORKDIR /home/tomcat

# Corrected Tomcat URL for downloading
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.tar.gz /home/tomcat/

# Extract Tomcat, rename it, and set permissions
RUN tar -xvf apache-tomcat-9.0.97.tar.gz && \
    rm -rf apache-tomcat-9.0.97.tar.gz && \
    mv apache-tomcat-9.0.97 tomcat && \
    chown -R tomcat:tomcat /home/tomcat/tomcat

# Create webapps directory if it doesn't exist
RUN mkdir -p /home/tomcat/tomcat/webapps

# Add the .war file to Tomcat's webapps directory
ADD target/simplewebapp.war /home/tomcat/tomcat/webapps/

# Switch to tomcat user
USER tomcat

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["/home/tomcat/tomcat/bin/catalina.sh", "run"]
