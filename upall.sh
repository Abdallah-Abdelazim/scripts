#!/usr/bin/sudo bash
# A shell script to update all packages (APT, Flatpak & Snap) on Debian-based systems.
# 
# Author: Abdallah Abdelazim
# License: GNU General Public License v3.0
#

LIGHT_BLUE='\033[1;34m'
GREEN='\033[0;32m'
DARK_GREY='\033[1;30m'
NC='\033[0m' # No color

# [1] apt
echo -e "${LIGHT_BLUE}Updating APT packages:${NC}"
sudo apt update && sudo apt upgrade
echo -e "${GREEN}Done.${NC}\n"
echo -e "${LIGHT_BLUE}Executing 'apt clean':${NC}"
sudo apt clean
echo -e "${GREEN}Done.${NC}\n"
echo -e "${LIGHT_BLUE}Executing 'apt autoremove':${NC}"
sudo apt autoremove
echo -e "${GREEN}Done.${NC}\n"

# [2] flatpak
echo -e "${LIGHT_BLUE}Updating Flatpaks:${NC}"
flatpak update
echo -e "${GREEN}Done.${NC}\n"

# [3] snap
echo -e "${LIGHT_BLUE}Updating Snaps:${NC}"
sudo snap refresh
echo -e "${GREEN}Done.${NC}\n"


echo -e "\a${DARK_GREY}UPALL update script finished.${NC}"
