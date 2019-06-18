#Download base image ubuntu 16.04
FROM ubuntu:16.04

# Update Ubuntu Software repository
RUN apt-get update

# Create directory for initial scripts
RUN mkdir /tmp/install_dhis

# Copy installation script to the directory
COPY /install.sh /tmp/install_dhis/install.sh

# Copy dhis war file
COPY /hmis.war /tmp/install_dhis/

# Copy database backup file
COPY /db-backup.sql.gz /tmp/install_dhis/

# Make the install script executable
RUN chmod +x /tmp/install_dhis/install.sh
RUN apt-get install dos2unix
RUN /tmp/install_dhis/install.sh
