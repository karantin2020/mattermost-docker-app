# Copyright (c) 2016 Mattermost, Inc. All Rights Reserved.
# See License.txt for license information.
FROM debian:stable-slim

# Install ca-certificates to support TLS of Mattermost v3.5
RUN apt-get update && apt-get install -y ca-certificates

#
# Configure Mattermost
#
WORKDIR /mm

# Copy over files
ADD https://releases.mattermost.com/3.5.1/mattermost-team-3.5.1-linux-amd64.tar.gz .
RUN tar -zxvf ./mattermost-team-3.5.1-linux-amd64.tar.gz
ADD config_docker.json /mm/mattermost/config/config_docker.json
ADD docker-entry.sh . 

RUN chmod +x ./docker-entry.sh
ENTRYPOINT ./docker-entry.sh

# Create default storage directory
RUN mkdir -p /mm/mattermost/mattermost-data

# Ports
EXPOSE 8065
