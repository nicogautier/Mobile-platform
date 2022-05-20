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
|[TwinCAT](https://www.beckhoff.com/en-en/products/automation/twincat/?pk_campaign=AdWords-AdWordsSearch-TwinCAT_EN&pk_kwd=twincat&gclid=EAIaIQobChMI4qSCndXt9wIVCZBoCR0AcgaeEAAYASAAEgLjsvD_BwE)| supervises low level control of the platform (motors, joystick, laser field security, ... ) |  
|[ROS](https://www.ros.org/)| supervises high level algorithms (path-finding, SLAM algorithm, ... ) |

## How to use it

This section will explain you how to use this project.
**Note:** You will not be able to use these programs as they are if you use another robot (this one is a custom robot created in the lab), but you can of course modify or reuse part of the programs to suit them to your application.   

First you need to get the files from git:
```sh
git clone https://github.com/nicogautier/Mobile-platform && cd Mobile-platform
```

### ROS program

#### platform_communication
The **ADScommunication** node of the platform\_communication package allows you to communicate with the TwinCAT program. It receives commands from the **/cmd\_vel** topic and sends them to the PLC. It also publishes the odometry on the **/odom** topic according to the values of the wheel encoders. This will allow you for example to use the ROS navigation stack which required communication on these two subjects.

To use it in your program, you can add and compile the platform_communication package in your ROS project. Then add this line to your launch file.  

```sh
<node pkg="platform_communication" type="ADSCommunication" name="ADSCommunication"/>
```

If you want to modify this node, I recommend that you consult the **ADS Beckhoff** folder which will explain how to use the ADS library. The two main arrays used to exchange data with the PLC are **"ControlGVL.robot\_odom "** received by ADS notification for odometry and **"ControlGVL.vel\_robot "** to send speed goals.

#### platform_main
The platform\_main package contains the main launch file and the configuration files used to implement ROS navigation stack. It uses the **sick\_safetyscanners** node to get the laserscan of the two sensors. It also uses **TEB local planner** for the local trajectories and **rtabmap** for the SLAM algorithm.

#### platform_measurements

This package was used to perform several tests: use of an external setpoint generator in TwinCAT, accuracy of the platform movements, and accuracy of the ROS navigation implementation.  

### TwinCAT program



### SICK sensors security
The objective was to have a safety field around the platform to stop it (cut the power safely) if there is an obstacle very close and representing a danger. 

There are also several sets of directional fields that will stop the platform (software) or reduce the maximum speed of the platform depending on the field triggered. Each set has three warning fields (18 cm, 1 m and 2.5 m). The set of fields used will be adapted according to the direction in which the platform is moving.

![plot](./safety\ designer/fields.png)


Each sensor is connected to the TwinCAT PLC to inform about the triggering of a field and also to the safety module of the platform which will cut the power if necessary.

You will find in the **safety designer** folder the fields used and the sensor configurations. In the **kicad** folder you will find the PCB diagram used to connect the sensors to the PLC.
