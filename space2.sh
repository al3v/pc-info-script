#!/bin/bash

#!/bin/bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' 
BPurple='\033[1;35m'
BRed='\033[1;31m'
BGREEN='\033[1;32m'

echo -e "${BGREEN}HARDWARE INFORMATION${NC}"
echo
echo -e "${GREEN}CPU${NC}"

Arch=$(lscpu | grep "Architecture")
Model=$(lscpu | grep "Model name")
CPUop=$(lscpu | grep "CPU op-mode")
CPUs=$(lscpu | grep "CPU(s)")
CPU_list=$(lscpu | grep "On-line CPU(s)")
CPU_family=$(lscpu | grep "CPU family")
CPU_MHz=$(lscpu | grep "CPU MHz")
CPU_max_MHz=$(lscpu | grep "CPU max MHz")
CPU_min_MHz=$(lscpu | grep "CPU min MHz")
Byte_Order=$(lscpu | grep "Byte Order")
Core=$(lscpu | grep Core)

echo
echo "${Arch:0:12}.............:${Arch:33:6}"
echo "${CPUop:0:14}...........:${CPUop:33:14}"
echo "${Core:0:18}.......:${Core:33:1}"
echo "${CPUs:0:7}..................:${CPUs:33:1}"
echo "${CPU_family:0:10}...............:${CPU_family:33:8}"
echo "${CPU_list:0:19}......:${CPU_list:33:3}"
echo "${CPU_MHz:0:7}..................:${CPU_MHz:33:8}"
echo "${CPU_max_MHz:0:11}..............:${CPU_max_MHz:33:8}"
echo "${CPU_min_MHz:0:11}..............:${CPU_min_MHz:33:8}"
echo "${Model:0:10}...............:${Model:33:39}"
echo "${Byte_Order:0:10}...............:${Byte_Order:33:15}"
echo


echo -e "${CYAN}MEMORY${NC}"     

MEMTOTAL=$( free -g | awk 'NR==2, NR==2 { print $2}' )
MEMUSED=$( free -g | awk 'NR==2, NR==2 { print $3}' )

SWAPTOTAL=$( free -g | awk 'NR==3, NR==3 { print $2}' )
SWAPUSED=$( free -g | awk 'NR==3, NR==3 { print $3}' )


graph () {

used=$1
total=$2
name=$3
char=$(echo -n "$name" | wc -c)

quotient=`echo "scale=2; $used/$total" | bc` 
percent=`echo "scale=2; $quotient*100" | bc | cut -d "." -f 1`
percent2=$((percent/5))



if [ "$char" < 25 ]; then
	for (( i =0; i < 25 - $char; i++));
	do
	name="$name⠀"
	done		
elif [ "$char" == 25 ]; then
	name="$name"	
elif [ "$char" > 25 ]; then
	name="${name:0:25}"
fi


myString="$name ["
for (( i = 0; i < $percent2; i++));
do
    myString="$myString${BRed}|${NC}"
done
    
for (( i = $percent2 + 1; i <= 20; i++));
do
	myString="$myString*"
done
    
myString="$myString], $percent% "
echo -e $myString

}


graph $MEMUSED $MEMTOTAL   MEM
graph $SWAPUSED $SWAPTOTAL SWAP
echo


echo -e "${CYAN}STORAGE${NC}"

#DISK 1
DISK_1_name=$(df -m --output=source,used,avail | awk ''NR==2' {print $1}' )
DISK_1_used=$(df -m --output=source,used,avail | awk ''NR==2' {print $2}' )
DISK_1_avail=$(df -m --output=source,used,avail | awk ''NR==2' {print $3}' )
DISK1_total=$(($DISK_1_used + $DISK_1_avail))

#DISK 2
DISK_2_name=$(df -m --output=source,used,avail | awk ''NR==3' {print $1}' )
DISK_2_used=$(df -m --output=source,used,avail | awk ''NR==3' {print $2}' )
DISK_2_avail=$(df -m --output=source,used,avail | awk ''NR==3' {print $3}' )
DISK2_total=$(($DISK_2_used + $DISK_2_avail))

#DISK 3
DISK_3_name=$(df -m --output=source,used,avail | awk ''NR==4' {print $1}' )
DISK_3_used=$(df -m --output=source,used,avail | awk ''NR==4' {print $2}' )
DISK_3_avail=$(df -m --output=source,used,avail | awk ''NR==4' {print $3}' )
DISK3_total=$(($DISK_3_used + $DISK_3_avail))

graph $DISK_1_used $DISK1_total $DISK_1_name
graph $DISK_2_used $DISK2_total $DISK_2_name
graph $DISK_3_used $DISK3_total $DISK_3_name
echo
echo

echo -e "${BGREEN}SOFTWARE INFORMATION${NC}"
echo

kernel_name=$(uname -s)
kernel_release=$(uname -r)
hostname=$(uname -n)
OS=$(uname -o)
dist_id=$(lsb_release -i)
description=$(lsb_release -d)
release=$(lsb_release -r)
codename=$(lsb_release -c)

echo "User Id:.................:$USER"
echo "Kernel release...........:${kernel_release:0:30}"
echo "Network hostname.........:${hostname:0:30}"
echo "Operating System.........:${OS:0:30}"
echo "Description..............:${description:13:40}"



	
