#!/usr/bin/env bash
# Handle arguments for ROS_MASTER_IP
if [ $# -gt 0 ]
  then
    ROS_MASTER_IP="$1"
  else
    # Default ROS_MASTER_IP. Change this value for the master's IP.
    ROS_MASTER_IP="192.168.1.1"
fi

# Set the ROS_MASTER_URI
export ROS_MASTER_URI="http://${ROS_MASTER_IP}:11311"

# Set this machine as slave (by IP)
export ROS_IP=""

# Get list of IPs on this machine
hostnames=($(hostname -I))

oc1=${ROS_MASTER_IP%%.*}
temp=${ROS_MASTER_IP#*.*}
oc2=${temp%%.*}
oc3=${temp#*.*}
oc3=${oc3%%.*}
# echo $oc1 $oc2 $oc3 # Debugging

correct_ip=False
for ip in "${hostnames[@]}"
do
  temp=ip
  for i in 1 2 3
  do
    oc=${ip%%.*}
    if [ "$oc" != "$oc1" ]; then
       correct_ip=False
       break
    else
       temp=${ip#*.*}
       correct_ip=True
    fi
  done

  if [ $correct_ip = True ];then
    export ROS_IP=${ip}
  fi
done

echo "Set ROS_MASTER_URI=${ROS_MASTER_URI}"
echo "Set ROS_IP=${ROS_IP}"

# Clear
unset oc1 oc2 oc3 temp ROS_MASTER_IP
