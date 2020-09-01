# tailscale-docker

Run tailscale as a relay into kubernetes backnet and or services. Since TCP direction is a figment of convention and not reality; we do not need an ingress. NAT allows for the server in a private net to advertise a public address and port on the public interface. The Firewall allows that traffic since the firewall allows any traffic "conceptually" outbound.

## Main Files
* Dockerfile - using an ubuntu environment use the latest stable version of tailscale
* helm - the helm chart to install tailscale into kubernetes with the purpose of advertisement of routes to backnet resources


## TODO

* create helm chart
* create helmfile install
* verify the container is up
* verify can route to internal cluster
* verify in a production test cluster


