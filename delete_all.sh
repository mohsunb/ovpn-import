#!/usr/bin/zsh
for file in *.ovpn; do
	nmcli connection delete "${file%.*}"
done
