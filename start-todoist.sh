#!/bin/bash
# Launch Todoist snap as a background process.
# 
# Author: Abdallah Abdelazim
# License: GNU General Public License v3.0
#

/var/lib/snapd/desktop/applications/todoist_todoist.desktop&
# Loop, waiting for the window to initialise
i=0
while [ $i -lt 20 ]
do
        sleep 1
        # check if the window can be found
        window=`wmctrl -l|grep "Todoist"`
        if [ "$window" != "" ]
        then
                # Found the window
                for w in $window
                do
                        # Minimise the window
                        xdotool windowminimize $w
                done
                break
        fi
done
