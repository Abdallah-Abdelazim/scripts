#!/usr/bin/env bash
# A shell script to update all packages (Pacman, AUR, Flatpak & Snap) on Arch-based systems.
# 
# Author: Abdallah Abdelazim
# License: GNU General Public License v3.0
#

# constants
LIGHT_BLUE='\033[1;34m'
GREEN='\033[0;32m'
DARK_GREY='\033[1;30m'
NC='\033[0m' # No color

# request root permission if not root
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

# [1] Pacman & AUR
echo -e "${LIGHT_BLUE}Updating Pacman & AUR packages:${NC}"
sudo -u $(logname) yay
echo -e "${GREEN} -> Done${NC}\n"
echo -e "${LIGHT_BLUE}Removing orphans.. Executing 'pacman -Qtdq | pacman -Rns -':${NC}"
sudo pacman -Qtdq | sudo pacman -Rns -
echo -e "${GREEN} -> Done${NC}\n"
echo -e "${LIGHT_BLUE}Cleaning.. Executing 'pacman -Sc && yay -c':${NC}"
sudo pacman -Sc --noconfirm && sudo -u $(logname) yay -c
echo -e "${GREEN} -> Done${NC}\n"

# [2] flatpak
echo -e "${LIGHT_BLUE}Updating Flatpaks:${NC}"
flatpak update
echo -e "${GREEN} -> Done${NC}\n"

# [3] snap
echo -e "${LIGHT_BLUE}Updating Snaps:${NC}"
sudo snap refresh
echo -e "${GREEN} -> Done${NC}\n"


echo -e "\a${DARK_GREY}UPALL update script finished.${NC}"
