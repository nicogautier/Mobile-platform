# Mobile-platform

## Presentation

The mobile platform robot was developed at the [Robotics Laboratory](https://robolab.si/) of the University of Ljubljana.

The mobile platform is a robot that uses its sensors to identify and move through its environment. The final goal of the platform will be to be used in an indoor environment such as a warehouse or a retail store. It will also be combined with a collaborative manipulator robot for precise handling.

[![Alt text](https://img.youtube.com/vi/F0u8bdqzKDY/0.jpg)](https://www.youtube.com/watch?v=F0u8bdqzKDY)


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
The **ADScommunication** node of the platform\_communication package allows to communicate with the TwinCAT program. It receives commands from the **/cmd\_vel** topic and sends them to the PLC. It also publishes the odometry on the **/odom** topic according to the values of the wheel encoders. This will allow you for example to use the ROS [navigation](https://wiki.ros.org/navigation) stack which required communication on these two subjects.

To use it in your program, you can add and compile the platform_communication package in your ROS project. Then add this line to your launch file.  

```sh
<node pkg="platform_communication" type="ADSCommunication" name="ADSCommunication"/>
```

If you want to modify this node, I recommend that you consult the [**ADS Beckhoff**](ADS&#32;Beckhoff/) folder which will explain how to use the ADS library. The two main arrays used to exchange data with the PLC are **"ControlGVL.robot\_odom "** received by ADS notification for odometry and **"ControlGVL.vel\_robot "** to send speed goals.

#### platform_main
The platform\_main package contains the main launch file and the configuration files used to implement ROS [navigation](https://wiki.ros.org/navigation) stack. It uses the [**sick\_safetyscanners**](https://wiki.ros.org/sick_safetyscanners) node to get the laserscan of the two sensors. It also uses [**TEB local planner**](https://wiki.ros.org/teb_local_planner) for the local trajectories and [**rtabmap**](http://wiki.ros.org/rtabmap_ros) for the SLAM algorithm.

#### platform_lift

The **lift_communication.py** node of the package allows to communicate with the SCU control unit through the RS232 serial [**interface**](https://medialibrary.ewellix.com/asset/16222) that manage the lift actuators . It implements a **/moveLift** action server that moves the lift to the desired position and sends a success message when reaching the final position. It also implements a **/posLift** service that returns the position of the lift.


You can add this line to your launch file to use the node. 
```sh
<node pkg="platform_lift" type="lift_communication.py" name="lift_communication"/>
```
You may have to change the port for serial communication which is currently "*/dev/ttyUSB0*" in the init_serial() function of serial_interface.py. 


#### platform_joystick

This package allows the use of a [**Logitech Extreme 3D**](https://www.logitechg.com/fr-fr/products/space/extreme-3d-pro-joystick.942-000031.html) joystick to control the mobile platform. It implements additional features compared to the joystick connected to the Beckhoff controller. You can use the **joystick.launch** file alone:

```sh
roslaunch platform_joystick joystick.launch joystickOnly:="true"
```

or in addition to the **platform_main** launchfile. Note: to enable the use of the joystick you must put the third axis down (up: ros navigation, middle: stop).


#### platform_measurements

This package was used to perform several tests: use of an external setpoint generator in TwinCAT, accuracy of the platform movements, and accuracy of the ROS navigation implementation.  

### TwinCAT program

#### Motors

The **FB_RUN_MOTOR** controls all 4 wheels for holonomic movements. It also implements the TwinCAT external setpoint generator. It can be used by both the joystick and the ROS program. The program retrieves the values from the wheel encoders to calculate the odometry and send it to ROS.


#### Sensors
The **SensorsMain** program manages the communication with the two sensors. It calculates the fields to be applied according to the current direction. It also limits the maximum speed allowed according to the fields of the sensors that are triggered. There are 8 different orientations (see next section).

#### Variables you might want to adjust

For future people who will work on the platform, here are some variables that you will probably have to adapt to your new constraints.

| Name| Type | Description |
|------|------|------|
|ControlGVL.vel_robot| LReal[3]| Velocity command sent by the ROS program.|
|ControlGVL.robot_odom|LReal[6]|Odometry send to the ROS program.|
|FB_RUN_MOTOR.ACC_MAX| LReal| Maximum acceleration allowed for the motors.|
|FB_RUN_MOTOR.VEL_WHEEL_MAX|LReal|Maximum speed allowed for the motors.|
|SensorsMain.VMAX|LReal|Maximum speed allowed for the platform when no safety field is triggered (other maximum speeds are also based on this value.)|
|SensorsMain.VTHMAX|LReal|Maximum permissible rotation speed of the platform when the first safety field is not triggered.|


### SICK sensors security
The objective was to have a safety field around the platform to stop it (cut the power safely) if there is an obstacle very close and representing a danger. 

There are also several sets of directional fields that will stop the platform (software) or reduce the maximum speed of the platform depending on the field triggered. Each set has three warning fields (18 cm, 1 m and 2.5 m). The set of fields used will be adapted according to the direction in which the platform is moving.

![plot](safety&#32;designer/fields.png)


Each sensor is connected to the TwinCAT PLC to inform about the triggering of a field and also to the safety module of the platform which will cut the power if necessary.

You will find in the [**safety designer**](safety&#32;designer/) folder the fields used and the sensor configurations. In the [**kicad**](kicad/) folder you will find the PCB diagram used to connect the sensors to the PLC.
