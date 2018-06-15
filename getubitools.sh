#!/bin/sh
# Installs some additional useful mips binaries on Ubiquiti APs.
# Tested on AP AC Pro, Firmware BZ.v3.9.3

if [ ! -d tools ]; then
    mkdir tools
fi
    
cd tools
    
curl -L https://github.com/flakpaket/ubitools/blob/master/nc?raw=true -o nc
curl -L https://github.com/flakpaket/ubitools/blob/master/lua?raw=true -o lua
curl -L https://github.com/flakpaket/ubitools/blob/master/tcpdump?raw=true -o tcpdump
curl -L https://github.com/flakpaket/ubitools/blob/master/synflood?raw=true -o synflood
curl -L https://github.com/flakpaket/ubitools/blob/master/bash?raw=true -o bash
   
chmod +x * 
    
for tool in $( ls ); do
    if [ ! -f /bin/$tool ]; then
        mv $tool /bin/$tool
        echo "[+] /bin/$tool installed."
    elif [ -f /bin/$tool ]; then
        mv /bin/$tool /bin/$tool.old
        echo "[+] Renamed $tool to $tool.old"
        mv $tool /bin/$tool
        echo "[+] /bin/$tool installed."
    fi
done
