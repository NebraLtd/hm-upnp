# Python script to configure UPNP

import os
import subprocess  # nosec
import sentry_sdk
from time import sleep


SENTRY_UPNP = os.getenv("SENTRY_UPNP")
sentry_sdk.init(
    SENTRY_UPNP,
)

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

subprocess.run(["/usr/bin/upnpc", "-e", "Nebra Helium", "-r", "44158", "TCP"])  # nosec (B603)
