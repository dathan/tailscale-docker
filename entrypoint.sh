# Create the tun device path if required
mkdir -p /dev/net
mknod /dev/net/tun c 10 200 # TODO write an explination as to why this is needed

# Wait 5s for the daemon to start and then run tailscale up to configure
echo "Starting Tailscale client"
/bin/sh -c "sleep 10; /usr/bin/tailscale up" &
exec /usr/sbin/tailscaled --state=/tailscale/tailscaled.state