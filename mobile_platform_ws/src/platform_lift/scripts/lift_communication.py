#!/usr/bin/env python

""" ===================== lift_communication.py ====================
This program allows the communication between ROS and the lift

Action server:
    /moveLift (MoveLift): move the lift to the desired position
    

==============================================================="""



from serial_interface import *
import rospy
import roslib
from platform_lift.msg import MoveLiftAction, MoveLiftResult
import actionlib

roslib.load_manifest('platform_lift')



#ActionServer to move the lift to the desired position
class MoveLiftServer:
  _result = MoveLiftResult()

  def __init__(self):
    self.server = actionlib.SimpleActionServer('moveLift', MoveLiftAction, self.execute, False)
    self.server.start()

  def execute(self, goal):
      
    global ser
    rate = rospy.Rate(4)
    
    reach_final_a1, reach_final_a2 = False, False
    move_pos(ser,goal.goal_position)
    success = True
    
    #while didn't reach its final position
    while(not (reach_final_a1 and reach_final_a2)):
        
        #check if received cancelled goal request
        if self.server.is_preempt_requested():
            reset_move_A1(ser)
            reset_move_A2(ser)
            self.server.set_preempted()
            success = False
            break
        
        #check if A1 reach final position and stop function
        if(not reach_final_a1):
            reach_final_a1 = reach_pos_A1(ser)
            if(reach_final_a1):
                reset_move_A1(ser)
    
        #check if A2 reach final position and stop function
        if(not reach_final_a2):
            reach_final_a2 = reach_pos_A2(ser)
            if(reach_final_a2):
                reset_move_A2(ser)
                
        rate.sleep()
        
        
    if(success):
        self._result.success = True
        self.server.set_succeeded(self._result)


def main():
    rospy.init_node('lift_communication', anonymous=True)
    global ser
    ser = init_serial()
    rate = rospy.Rate(4) 
    
    server = MoveLiftServer()
    

    
    while not rospy.is_shutdown():
        

        send_cyclic(ser)
        rate.sleep()
        





if __name__ == '__main__':
    main()

