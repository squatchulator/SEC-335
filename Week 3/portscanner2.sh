#!/bin/bash

ip=$1
port=$2
end=254
if [ "$#" -ne 2 ]; then
  echo "Incorrect parameters! Usage: $0 <ip address> <port>"
  exit 1
fi

for ((i=1;i<=end;i++)); do
  address="$ip.$i"
  timeout .1 bash -c "echo >/dev/tcp/$address/$port" 2>/dev/null &&
    echo "$address:$port"
done
