#!/usr/bin/env bash
# A shell script to resize icon images and generate the alternative drawables with the proper screen pixel densities (dip) for Android.
# The passed icon image would be the xxxhdpi drawable & the other drawables (xxhdpi, xhdpi, hdpi & mdpi) would be scaled down from that.
# How to use:
#   ./drawablegen.sh <icon image path>
# Example:
#   ./drawablegen.sh my_image.png
# This will create all the drawable folders, if not have already, in a res folder inside the current directory (as returned by pwd).
# Use only with PNG images.
# Requires ImageMagick, install with: sudo apt install imagemagick
# 
# Author: Abdallah Abdelazim
# Author: Kishan Vaghela
# License: GNU General Public License v3.0
#
if [ $# -eq 0 ]; then
    echo "No arguments supplied"
else if [ -f "$1" ]; then
    echo " Creating different dimensions (dips) of "$1" ..."

    if [ $1 = "ic_launcher.png" ]; then
        echo "  App icon detected"
        
        mkdir -p res/mipmap-xxxhdpi
        mkdir -p res/mipmap-xxhdpi
        mkdir -p res/mipmap-xhdpi
        mkdir -p res/mipmap-hdpi
        mkdir -p res/mipmap-mdpi
        
        convert ic_launcher.png -resize 192x192 res/mipmap-xxxhdpi/ic_launcher.png
        convert ic_launcher.png -resize 144x144 res/mipmap-xxhdpi/ic_launcher.png
        convert ic_launcher.png -resize 96x96 res/mipmap-xhdpi/ic_launcher.png
        convert ic_launcher.png -resize 72x72 res/mipmap-hdpi/ic_launcher.png
        convert ic_launcher.png -resize 48x48 res/mipmap-mdpi/ic_launcher.png
    else
        mkdir -p res/drawable-xxxhdpi
        mkdir -p res/drawable-xxhdpi
        mkdir -p res/drawable-xhdpi
        mkdir -p res/drawable-hdpi
        mkdir -p res/drawable-mdpi
        
        convert $1 -resize 100% res/drawable-xxxhdpi/$1
        convert $1 -resize 75% res/drawable-xxhdpi/$1
        convert $1 -resize 50% res/drawable-xhdpi/$1
        convert $1 -resize 38% res/drawable-hdpi/$1
        convert $1 -resize 25% res/drawable-mdpi/$1
    fi
        echo " Done"
else
    echo "Error: $1 not found."
fi
fi
