#!/bin/bash
# This script displays the System info

# Hostname
echo hostname: $(hostname -f)

# Displaying DNS server
echo $(resolvectl | grep -w ns1.20046731567315.mytld)

# OS Name, version & Distro info
echo OS name: $(uname -o)
echo OS version: $(uname -r)
echo $(hostnamectl | grep -w Operating)

# For viewing IP addresses that are not on the 127 network and filtering them
echo IP addresses: $(ip a s ens33 | grep -w inet |awk '{print $2}')

# Amount of space available, filtered by the root file and displayed as a human-friendly mumber
echo Root Filesystem disk space: \ $(df -h | sed '2d;3d;4d;5d;7d;$d')
