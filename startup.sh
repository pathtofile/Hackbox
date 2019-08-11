
# Setup and start Stubby for DNS over TLS
echo "nameserver 127.0.0.1" > /etc/resolv.conf
/usr/bin/stubby &

# Setup or Start anything else

# Start Bash
/bin/bash
