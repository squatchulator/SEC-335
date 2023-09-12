#!/bin/bash

pref=$1
dnsserver=$2
end=254

if [ "$#" -ne 2 ]; then
  echo "Incorrect parameters! Usage: $0 <ip prefix> <dns server ip>"
  exit 1
fi
echo "DNS Resolution for $pref"
for ((i=1;i<=end;i++)); do
  ip="$pref.$i"
  nslookup $ip $dnsserver | grep name
done
