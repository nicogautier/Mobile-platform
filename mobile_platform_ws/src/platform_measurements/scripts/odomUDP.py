#!/usr/bin/env python

"""===================== odomUDP.py ====================
This program allows to send the odometry position and ROS navigation transformation by UDP at 100Hz with euler angles :
(used to send to a simulink program to compare odometry and ROS navigation transform with Optotrak cameras)

subscriber topic:
	/odom (Odometry) : receive odometry of the platform 
    /tf (TFMessage) : receive transforms of ROS navigation


==============================================================="""

import rospy
from nav_msgs.msg import Odometry
from tf2_msgs.msg import TFMessage

import math
import socket
import struct

odom = [0,0,0,0]
tf_map_odom = [0,0,0,0]
tf_odom_baseLink = [0,0,0,0]

#transform quaternion to euler angle (only rotation on the z axis)
def quaternion2euler(z,w):
    t3 = +2.0 * w * z 
    t4 = +1.0 - 2.0 * z * z
    Z = math.atan2(t3, t4)
    return  Z


#receive odometry from topic
def callback_odom(odom_rcv):
    x = odom_rcv.pose.pose.position.x
    y = odom_rcv.pose.pose.position.y
    z = odom_rcv.pose.pose.orientation.z
    w = odom_rcv.pose.pose.orientation.w
    global odom
    odom  = [x,y,z,w]
    

#receive tf from topic
def callback_tf(tf_rcv):
    x = tf_rcv.transforms[0].transform.translation.x
    y = tf_rcv.transforms[0].transform.translation.y
    z = tf_rcv.transforms[0].transform.rotation.z
    w = tf_rcv.transforms[0].transform.rotation.w

    #only get tf map to odom and odom to base_link
    if((tf_rcv.transforms[0].header.frame_id == "map") and (tf_rcv.transforms[0].child_frame_id == "odom")):
        global tf_map_odom
        tf_map_odom = [x,y,z,w]
        
    elif((tf_rcv.transforms[0].header.frame_id == "odom") and (tf_rcv.transforms[0].child_frame_id == "base_link")):
        global tf_odom_baseLink
        tf_odom_baseLink = [x,y,z,w]


#send data through UDP at 100Hz
def send2UDP():
    #odometry
    x_odom = odom[0]
    y_odom = odom[1]
    z_odom = quaternion2euler(odom[2], odom[3])
    

    #tf
    th = quaternion2euler(tf_map_odom[2], tf_map_odom[3])
    x_tf = tf_map_odom[0]  + math.cos(th)*tf_odom_baseLink[0] - math.sin(th)*tf_odom_baseLink[1]  
    y_tf=  tf_map_odom[1] + math.sin(th)*tf_odom_baseLink[0] + math.cos(th)*tf_odom_baseLink[1]
    z_tf = -quaternion2euler(tf_map_odom[2], tf_map_odom[3]) - quaternion2euler(tf_odom_baseLink[2], tf_odom_baseLink[3])
    if(z_tf>math.pi):
        z_tf -= math.pi*2
    elif(z_tf<-math.pi):
        z_tf += math.pi*2

    #send datas
    data = [float(x_odom),float(y_odom),float(z_odom), float(x_tf), float(y_tf), float(z_tf)]
    client_ip = "192.168.3.2"
    port = 5000
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    bin_data = struct.pack('<6f', *data)
    sock.sendto(bin_data, (client_ip, port))
    
    
    
def main():
    rospy.init_node('odomUDP', anonymous=True)
    rospy.Subscriber("odom", Odometry, callback_odom)
    rospy.Subscriber("tf", TFMessage, callback_tf)
    rate = rospy.Rate(100) 

    #send data at 100Hz through UDP
    while not rospy.is_shutdown():
        send2UDP()
        rate.sleep()


if __name__ == '__main__':
    main()

