#!/bin/bash
# Execute with >> sudo ./wifi_setup.sh
# Prompt user for ssid and password and 
# add information to  /etc/wpa_supplicant/wpa_supplicant.conf

read -r -p "Please enter your SSID:   " _SSID
read -r -p "Please enter your passphrase:   " _psk
echo
sudo printf "\nnetwork={\n    ssid=\"%s\"\n    psk=\"%s\"\n}" "$_SSID" "$_psk" >> /etc/wpa_supplicant/wpa_supplicant.conf

read -p "Do you want to reboot? (Y/n)   " -t 10 -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	sudo reboot
fi
