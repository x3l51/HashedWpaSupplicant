#!/bin/sh

NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[1;32m'

if [ "$EUID" -ne 0 ]
  then echo -e "\n${RED}***Please run this script as root (sudo bash wpa_hash.sh)***\n"
  exit
fi

echo -e "\n${GREEN}***Generate new wpa_supplicant.conf with hashed password***\n"

echo -e "${NC}Type the SSID of the network you want to connect to and press [ENTER]:\n"

read SSID

echo -e "\n${NC}Type the PASSWORD of the network you want to connect to and press [ENTER]:\n"

read PASSWORD

HASHEDSSIDPASSWORD=$(wpa_passphrase SSID PASSWORD)

echo "${HASHEDSSIDPASSWORD}" | grep -v "#" | sudo dd of=/etc/wpa_supplicant/wpa_supplicant.conf >& /dev/null

echo -e "\n${GREEN}Wpa_supplicant.conf successfully generated\n"

sudo chmod 600 /etc/wpa_supplicant/wpa_supplicant.conf
sudo chown root:root /etc/wpa_supplicant/wpa_supplicant.conf
