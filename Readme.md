# Hackbox - A small-ish pentesting Docker Image

This Docker Image sets up a small-ish container built on the Kali base image, with:
 - The `kali-linux-top10` metapackage
   - Inlcudes metasploit and nmap
 - PowerShell empire
 - Up-to date python 2 and 3
   - And up-to-date pip for boths
 - GoBuster
 - Wordlists, including the dirb and dirbuster wordlists
   - Also created a `/wordlists/` symlimk
 - ProxyChains
 - Npm (for any node.js stuff)
 - net-tools (for `ifconfig`, etc.)
 - mitmproxy
 - Adds alias `ll='ls --color=auto -l'` into `~/.bashrc`
 - Set `/bin/bash` as the entrypoint


# To Build:
```
docker build -t hackbox .
```

# To Run:
```
docker run --rm -ti hackbox
```
# Notes
According to the base Kali image, due to --squash being passed to the docker daemon, if experimental features aren't turned on in your daemon, the building the base Kali image will fail.
