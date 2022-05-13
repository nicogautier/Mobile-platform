# Mobile-platform

## Presentation

The mobile platform robot was developed at the Robotics Laboratory of the University of Ljubljana.

The mobile platform is a robot that uses its sensors to identify and move through its environment. The final goal of the platform will be to be used in an indoor environment such as a warehouse or a retail store. It will also be combined with a collaborative manipulator robot for precise handling.

| Product | Description |
| ------ | ------ |
|[SICK nanoScan3](https://www.sick.com/hk/en/safety-laser-scanners/safety-laser-scanners/nanoscan3/nans3-caaz30an1/p/p653980?ff_data=JmZmX2lkPXA2NTM5ODAmZmZfbWFzdGVySWQ9cDY1Mzk4MCZmZl90aXRsZT1OQU5TMy1DQUFaMzBBTjEmZmZfcXVlcnk9JmZmX3Bvcz0xJmZmX29yaWdQb3M9MSZmZl9wYWdlPTEmZmZfcGFnZVNpemU9MjQmZmZfb3JpZ1BhZ2VTaXplPTI0JmZmX3NpbWk9OTcuMA==)| Laser scanners for platform protection and localization|
|[ Beckhoff CX5140 ](https://www.beckhoff.com/en-us/products/ipc/embedded-pcs/cx5100-intel-atom/cx5140.html)|Embedded PC for low-level control of sensors and actuators|


## Features

| Program | Description |
| ------ | ------ | 
|TwinCAT| supervises low level control of the platform (motors, joystick, laser field security, ... ) |  
|ROS| supervises high level algorithms (path-finding, SLAM algorithm, ... ) |

## Installation

This section will explain you how to use this project.
**Note:** You will not be able to use these programs as they are if you use another robot (this one is a custom robot created in the lab), but you can of course modify or reuse part of the programs to suit them to your application.   

```sh
git clone https://github.com/nicogautier/Mobile-platform && cd Mobile-platform
```

To use the ROS workspace

```sh
cd mobile_platform_ws/
catkin_make
source devel/setup.bash
```

If you get an error, you will probably have to delete the devel/ and build/ folders.

```sh
rm -rf build/ devel/
catkin_make
source devel/setup.bash
```

