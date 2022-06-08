#!/usr/bin/env python
from serial_interface import *
import rospy


def main():
    rospy.init_node('lift_communication', anonymous=True)
    ser = init_serial()
    rate = rospy.Rate(4) 
    
    print(move_pos(ser,0))
    
    reach_final_a1, reach_final_a2 = False, False
    
    
    
  
    
    while not rospy.is_shutdown():
        

        
        if(not reach_final_a1):
            reach_final_a1 = reach_pos_A1(ser)
            if(reach_final_a1):
                reset_move_A1(ser)
    
        if(not reach_final_a2):
            reach_final_a2 = reach_pos_A2(ser)
            if(reach_final_a2):
                reset_move_A2(ser)
        
        print("pos: " + str(get_pos(ser)))        

        send_cyclic(ser)
        rate.sleep()
        

    


 


if __name__ == '__main__':
    main()

