#!/usr/bin/sudo bash

# [1] apt
echo -e "--> Updating APT packages:"
sudo apt update && sudo apt upgrade
echo -e "Done."
echo -e "\n--> Executing 'apt clean':"
sudo apt clean
echo -e "Done."
echo -e "\n--> Executing 'apt autoremove':"
sudo apt autoremove
echo -e "Done.\n"

# [2] flatpak
echo -e "--> Updating Flatpaks:"
flatpak update
echo -e "Done.\n"

# [3] snap
echo -e "--> Updating Snaps:"
sudo snap refresh
echo -e "Done.\n"


echo -e "\aUPALL update script finished."
