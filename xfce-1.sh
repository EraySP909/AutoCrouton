#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "Run as root please!"
   exit 1
fi
echo "Travelling to a safe location (~/Downloads/)"
cd ~/Downloads/
echo "Making a temporary directory."
mkdir AutoCrouton/
cd AutoCrouton/
echo "Getting crouton script."
curl -O https://raw.githubusercontent.com/dnschneid/crouton/master/installer/crouton
echo "Got the script! It's located in */AutoCrouton/"
    read -p "Do you wish to have default apps installed? (ca. 900mb) [y/N]" yn
    case $yn in
        [Yy]* ) echo "Extras selected. Cancel within 5 seconds if you change your mind. [CTRL+C]";sleep 5; sh crouton -t xfce,xfce-desktop -r xenial;;
        [Nn]* ) echo "No extras selected. Cancel within 5 seconds if you change your mind. [CTRL+C]"; sleep 5; sh crouton -t xfce -r xenial;;
        * ) echo "No extras selected. Cancel within 5 seconds if you change your mind. [CTRL+C]"; sleep 5; sh crouton -t xfce -r xenial;
    esac
echo "Removing temporary directory."
rm -rf ../AutoCrouton
exit