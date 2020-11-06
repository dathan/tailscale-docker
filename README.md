# tailscale-docker

Run tailscale as a relay into kubernetes backnet and or services. Since TCP direction is a figment of convention and not reality; we do not need an ingress. NAT allows for the server in a private net to advertise a public address and port on the public interface. The Firewall allows that traffic since the firewall allows any traffic "conceptually" outbound.

## Main Files
* Dockerfile - using an ubuntu environment use the latest stable version of tailscale
* helm - the helm chart to install tailscale into kubernetes with the purpose of advertisement of routes to backnet resources


## Verified

Able to reach databases behind the container


## How to run

```
modify ./helm/values.tmpl and set the values correctly

make helmrun # assumes you set up the secrets for the registry
```

## REQUIREMENTS

[https://www.kernel.org/doc/Documentation/networking/tuntap.txt](/dev/net/tun)
is required by VPN software to intercept packets. The container needs an
escalated privilege  called [https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities](NET_ADMIN) which gives "admin" to the
network core of node.


## TODO

* verify the container is up


## Special Thanks to 
@hamishforbes  - he had a thread that gave me a roadmap to get this done


