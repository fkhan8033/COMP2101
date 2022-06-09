#!/bin/bash
# This script displays the System Report (Improved Version for LAB2)

# Adding empty line
echo " "

# Title for script
echo Report for $(hostname -f)

# Empty line
echo " "

# Seperator line
echo "======================"

# Empty line
echo " "

# Fully Qualified Domain Name
echo FQDN: $(hostname --fqdn)

# OS Name, version & Distro info
echo OS name and version:  $(uname -o) $(uname -r)

# For viewing IP address with filtered output 
echo IP address: $(ip a s ens33 | grep -w 192.168.0.99 |awk '{print $2}')

# Amount of space available, filtered by the root file and displayed as a human-friendly mumber
echo Root Filesystem free space: \ $(df -h | sed '2d;3d;4d;5d;7d;$d' | awk '{print $4}')

# Empty line
echo " "

# Seperator line
echo "======================"

# Empty line
echo " "

echo 'LAB done :)'
echo " "
