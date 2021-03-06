# ros-multiple-machines-script
Shell script for easy configuration to run ROS on multiple machines.

How to run ROS on multiple machines is described on: [http://wiki.ros.org/ROS/Tutorials/MultipleMachines](http://wiki.ros.org/ROS/Tutorials/MultipleMachines)

It needs several commands to set the env (`ROS_MASTER_URI` and `ROS_IP`).
The scripts here are written to make it easier to configure the machines.

## Master machine
Since the master machine is usually PC and may be configured with several IP addresses, it is safer to just add the IP manually.
To automatically export the env variable every time a new shell is launched, use the following commands. Change the `<IP>` to the target IP.
```
echo "export ROS_IP=<IP>" >> ~/.bashrc
source ~/.bashrc
```


## Slave machines
The `ros_slave.bash` will configure the env variables.
Just copy `ros_slave.bash` to home directory
  ```
  cp ros_slave.bash ~/
  ```

There are two ways to run the `ros_slave.bash`:
1. Run with argument. Replace `<ROS_MASTER_IP>` below with the target IP
   ```
   source ~/ros_slave.bash <ROS_MASTER_IP>
   ```
2. Run with the default `ROS_MASTER_IP`.

   Before running the script, open `ros_slave.bash` and edit the following line with the target IP
   ```
       ROS_MASTER_IP="192.168.1.1"
   ```
   Then just run the script without any argument
   ```
   source ~/ros_slave.bash
   ```
