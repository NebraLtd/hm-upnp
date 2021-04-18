# Python script to configure UPNP

import os
from time import sleep

regionID = None
while(regionID is None):
    # While no region set
    try:
        with open("/var/pktfwd/region", 'r') as regionOut:
            regionFile = regionOut.read()

            if(len(regionFile) > 3):
                print("Frequency: " + str(regionFile))
                regionID = str(regionFile).rstrip('\n')
                break
        print("Invalid Contents")
        sleep(60)
        print("Try loop again")
    except FileNotFoundError:
        print("File Not Detected, Sleeping")
        sleep(60)

print("Configuring Upnp")

os.system('upnpc -e "Nebra Helium" -r 44158 TCP')
