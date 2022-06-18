#!/bin/bash

BRed='\033[1;31m'
NC='\033[0m' 


MEMTOTAL=$( free -g | awk 'NR==2, NR==2 { print $2}' )
MEMUSED=$( free -g | awk 'NR==2, NR==2 { print $3}' )
#echo "$MEMUSED"


quotient=`echo "scale=2; $MEMUSED/$MEMTOTAL" | bc` 
percent=`echo "scale=2; $quotient*100" | bc`
#echo "$percent"

if awk "BEGIN {exit !($percent <= 0)}"; then
    echo -e "MEM  [********************], $num1 Gb/$num2 Gb "  " $percent% full"
    
elif awk "BEGIN {exit !($percent > 0 && $percent <= 25)}"; then
    echo -e "MEM  [${BRed}|||||${NC}***************], $MEMUSED Gb/$MEMTOTAL Gb "   " $percent% full"
    
elif awk "BEGIN {exit !($percent > 25 && $percent <= 45)}"; then
    echo -e "MEM  [${BRed}||||||||${NC}************], $MEMUSED Gb/$MEMTOTAL Gb "   " $percent% full"
    
elif awk "BEGIN {exit !($percent > 45 && $percent <= 50)}"; then
    echo -e "MEM  [${BRed}||||||||||${NC}**********], $MEMUSED Gb/$MEMTOTAL Gb "   " $percent% full"
    
elif awk "BEGIN {exit !($percent > 50 && $percent <= 85)}"; then
    echo -e "MEM  [${BRed}|||||||||||||||${NC}*****], $MEMUSED Gb/$MEMTOTAL Gb "   " $percent% full"

elif awk "BEGIN {exit !($percent > 85 && $percent <= 90)}"; then
    echo -e "MEM  [${BRed}||||||||||||||||||${NC}**], $MEMUSED Gb/$MEMTOTAL Gb "   " $percent% full"
    
elif awk "BEGIN {exit !($percent > 90 && $percent <= 95)}"; then
    echo -e "MEM  [${BRed}|||||||||||||||||||${NC}*], $MEMUSED Gb/$MEMTOTAL Gb "   " $percent% full"
    
elif awk "BEGIN {exit !($percent > 95 && $percent <= 100)}"; then
    echo -e "MEM  [${BRed}||||||||||||||||||||${NC}], $MEMUSED Gb/$MEMTOTAL Gb "   " $percent% full"
fi


SWAPTOTAL=$( free -g | awk 'NR==3, NR==3 { print $2}' )
SWAPUSED=$( free -g | awk 'NR==3, NR==3 { print $3}' )

quotient=`echo "scale=2; $SWAPUSED/$SWAPTOTAL" | bc` 
percent=`echo "scale=2; $quotient*100" | bc`
#echo "$percent"

if awk "BEGIN {exit !($percent <= 0)}"; then
    echo -e "SWAP [********************], $num1 Gb/$num2 Gb "  " $percent% full"
    
elif awk "BEGIN {exit !($percent > 0 && $percent <= 25)}"; then
    echo -e "SWAP [${BRed}|||||${NC}***************], $SWAPUSED Gb/$SWAPTOTAL Gb "   " $percent% full"
    
elif awk "BEGIN {exit !($percent > 25 && $percent <= 45)}"; then
    echo -e "SWAP [${BRed}||||||||${NC}************], $SWAPUSED Gb/$SWAPTOTAL Gb "   " $percent% full"
    
elif awk "BEGIN {exit !($percent > 45 && $percent <= 50)}"; then
    echo -e "SWAP [${BRed}||||||||||${NC}**********], $SWAPUSED Gb/$SWAPTOTAL Gb "   " $percent% full"
    
elif awk "BEGIN {exit !($percent > 50 && $percent <= 85)}"; then
    echo -e "SWAP [${BRed}|||||||||||||||${NC}*****], $SWAPUSED Gb/$SWAPTOTAL Gb "   " $percent% full"

elif awk "BEGIN {exit !($percent > 85 && $percent <= 90)}"; then
    echo -e "SWAP [${BRed}||||||||||||||||||${NC}**], $SWAPUSED Gb/$SWAPTOTAL Gb "   " $percent% full"
    
elif awk "BEGIN {exit !($percent > 90 && $percent <= 95)}"; then
    echo -e "MEM [${BRed}|||||||||||||||||||${NC}*], $SWAPUSED Gb/$SWAPTOTAL Gb "   " $percent% full"
    
elif awk "BEGIN {exit !($percent > 95 && $percent <= 100)}"; then
    echo -e "SWAP [${BRed}|||||||||||||||||||${NC}], $SWAPUSED Gb/$SWAPTOTAL Gb "   " $percent% full"
fi

