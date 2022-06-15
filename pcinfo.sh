#!/bin/bash

echo "Today is $(date)"
echo

echo "These users are currently conected:"
w | cut -d " " -f 1 - | grep -v USER | sort -u
echo

echo "More info about the users: "
w
echo

echo "The current user ID is: $USER "
echo

echo "This is `uname -s` running on a `uname -m` processor."
echo

echo "This is uptime information: $(uptime)"
echo

echo "Linux distribution information: 
$(sudo lsb_release -a)"
echo

mem=$(free -m)
echo "Memory usage:
$mem "
echo

echo "Machiene hardware name: $(uname -a) "
echo

#echo "Hardware info: $(hwinfo)"  #sudo apt-get install hwinfo is needed
echo

echo "Running process: $(top -n 1)"
echo

echo "Information about cpu: $(lscpu)"
echo

echo "Partition information: $(sudo fdisk -l)"
echo

echo "Information about bios: $(sudo dmidecode -t bios)"
echo
