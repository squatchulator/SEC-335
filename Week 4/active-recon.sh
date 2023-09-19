#!/bin/bash

ip=$1
dnsserver=$2
if [ "$#" -ne 2 ]; then
  echo "Incorrect parameter usage. Usage: $0 <ip> <dnsserver>"
  exit 1
  else
  echo "Working..."
fi
echo "DNS Resolution for $ip" >> recon.txt
nslookup $ip $dnsserver | grep name >> recon.txt
sudo nmap -A 10.0.5.23 >> recon.txt 
curl http://$ip >> recon.txt
