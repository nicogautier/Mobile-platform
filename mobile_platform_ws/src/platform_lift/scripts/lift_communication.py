#!/usr/bin/env python
from serial_interface import *
import rospy


def main():
    rospy.init_node('lift_communication', anonymous=True)
    ser = init_serial()
    
    rate = rospy.Rate(4) 
  
    
    while not rospy.is_shutdown():
        
        

        send_cyclic(ser)
        rate.sleep()
        

    


 


if __name__ == '__main__':
    main()

