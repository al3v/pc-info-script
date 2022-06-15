#!/bin/bash

echo "The current user ID is: $USER "
echo

echo "Today is $(date)"
echo

echo "Linux distribution information: 
$(sudo lsb_release -a)"
echo

echo "More info about the users: "
w
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

