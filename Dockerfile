FROM ubuntu:focal-20200729
RUN apt-get upgrade
RUN apt-get update && apt-get -y install curl wget gnupg

RUN curl https://pkgs.tailscale.com/stable/ubuntu/focal.gpg |  apt-key add -
# Add the tailscale repository
RUN curl https://pkgs.tailscale.com/stable/ubuntu/focal.list |  tee /etc/apt/sources.list.d/tailscale.list
# Install Tailscale
RUN  apt-get update && apt-get -y install tailscale

# Tailscaled depends on iptables (for now)
RUN apt-get -y install iptables
#
#
COPY entrypoint.sh /entrypoint.sh
#
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
