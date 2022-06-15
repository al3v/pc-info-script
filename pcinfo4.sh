#!/bin/bash

echo "HARDWARE INFORMATION"
echo
echo "CPU"

echo "$(lscpu | grep "Architecture")"
echo "$(lscpu | grep "CPU")"
echo "$(lscpu | grep Core)"
echo "$(lscpu | grep "CPU MHz")"
echo "$(lscpu | grep "Model")"
echo

echo "MEMORY"
echo "$( free -h )"
echo

echo "STORAGE"
echo "$( df -h  | head -4)"
echo

echo "SOFTWARE INFORMATION"
echo "User Id:            $USER"
echo "Kernel name:        $(uname -s)"
echo "Kernel release:     $(uname -r)"
echo "Network Hostname    $(uname -n)"
echo "Operating Sysyem    $(uname -o)"
echo
echo "$(lsb_release -i)"
echo "$(lsb_release -d)"
echo "$(lsb_release -r)"
echo "$(lsb_release -c)"
echo 


