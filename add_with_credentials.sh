#!/usr/bin/zsh

echo -n "Enter username: "
read OPENVPN_USERNAME
echo -n "Enter password: "
read -s OPENVPN_PASSWORD

echo "\nPassword length: ${#OPENVPN_PASSWORD}"

for file in *.ovpn; do
	nmcli connection import type openvpn file "${file}"
	nmcli connection modify "${file%.*}" +vpn.data "username=${OPENVPN_USERNAME}"
	nmcli connection modify "${file%.*}" vpn.secrets "password=${OPENVPN_PASSWORD}"
done
