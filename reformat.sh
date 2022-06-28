#!/bin/bash

#Get device and vendor id
echo "Please enter the vendor and device ID (VVVV:DDDD):"
read device_vendor_id

echo "Config space grouped by dword:"
sudo lspci -d $device_vendor_id -xxxx  > config_space.txt

filename="config_space.txt"
i="1"

while read -r line; do
#Hinders first line of being printed
if [ $i != 1 ]; then
dword="$line"
echo $dword | cut -f2 -d":" | tr -d ' ' | sed -e "s/.\{8\}/&,/g"
fi
((i=i+1))
done < "$filename"
