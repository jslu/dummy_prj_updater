# === 1 ===
FROM ubuntu
MAINTAINER Joe Lu "joe.lu@aylanetworks.com"

# Set correct environment variables.
ENV HOME /root

# Add ayla's own init
ADD checkout_latest_source.sh /sbin/ayla_init
RUN chmod +x /sbin/ayla_init
RUN mkdir -p /ayla/dummy_prj

# Use baseimage-docker's init system
#CMD ["/sbin/my_init"]
CMD ["/sbin/ayla_init"]


RUN apt-get update; exit 0
RUN apt-get install -y git curl ecryptfs-utils

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  
