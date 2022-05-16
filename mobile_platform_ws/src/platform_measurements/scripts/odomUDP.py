#!/usr/bin/env python

"""===================== odomUDP.py ====================
This program allows to send the odometry position by UDP at 100Hz with euler angles :
(used to send to a simulink program to compare odometry with Optotrak cameras)

subscriber topic:
	/odom (Odometry) : receive odometry of the platform 

==============================================================="""



import rospy
from nav_msgs.msg import Odometry

import math
import socket
import struct

odom = [0,0,0,0]

#transform quaternion to euler angle (1 degree of rotation)
def quaternion2euler(z,w):
    t3 = +2.0 * w * z 
    t4 = +1.0 - 2.0 * z * z
    Z = math.atan2(t3, t4)
    return  Z


#receive odometry from topic
def callback(odom_rcv):
    x = odom_rcv.pose.pose.position.x
    y = odom_rcv.pose.pose.position.y
    w = odom_rcv.pose.pose.orientation.w
    z = odom_rcv.pose.pose.orientation.z
    global odom
    odom  = [x,y,z,w]
    


#send data through UDP at 100Hz
def send2UDP():
    x = odom[0]
    y = odom[1]
    z = quaternion2euler(odom[2], odom[3])
    data = [float(x),float(y),float(z)]

    client_ip = "192.168.3.2"
    port = 5000
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    bin_data = struct.pack('<3f', *data)
    sock.sendto(bin_data, (client_ip, port))
    
    
    
def main():
    rospy.init_node('odomUDP', anonymous=True)
    rospy.Subscriber("odom", Odometry, callback)
    rate = rospy.Rate(100) 

    while not rospy.is_shutdown():
        send2UDP()
        rate.sleep()

    

if __name__ == '__main__':
    main()