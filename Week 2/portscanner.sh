#!/bin/bash

# Original script sourced from SEC-335 at Champlain College.
# Knowledge on passing parameters: https://stackoverflow.com/questions/18568706/check-number-of-arguments-passed-to-a-bash-script 
# Knowledge on validating parameters: https://linuxize.com/post/bash-check-if-file-exists/ 

hostfile=$1
portfile=$2
# Checks to see if the two parameters are included when running.
if [ "$#" -ne 2 ]; then
  echo "Incorrect parameters! Usage: $0 <hostfile> <portfile>"
  exit 1
fi

# Checks to see if the hostfile included as a parameter exists
if [ ! -f "$hostfile" ]; then
  echo "The hostfile $hostfile does not exist."
  exit 1
fi
# Checks to see if the portfile included as a parameter exists
if [ ! -f "$portfile" ]; then
  echo "The portfile $portfile does not exist."
  exit 1
fi
echo "host:port"
# Host:port scanner. Performs a port scan for every port on every host.
for host in $(cat $hostfile); do
  for port in $(cat $portfile); do
    timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
      echo "$host:$port"
  done
done
