# Mobile-platform

## Presentation

The mobile platform robot have been developped at the laboratory of robotics of University of Ljubljana.

The mobile platform is a robot that uses its sensors to identify and move around its environment. The final objective of the platform will be to be used in an indoor environment such as a warehouse. It will also be combined with a collaborative manipulator robot.


## Features

| Program | Description | README |
| ------ | ------ | ------ |
|TwinCAT| supervises low level control of the platform (motors, joystick, laser field security) |  | 
|ROS| supervises high level algorithms (path-finding, SLAM algorithm, ...) ||

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
