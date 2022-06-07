#!/usr/bin/env python
import rospy
import serial
import crc16
import signal


from std_msgs.msg import Int16



def get_param(cmd, option, data = 0): 
    if(cmd=="RO"): #open remote mode
        param = [0] 
    elif(cmd=="RC"): #remote cyclic
        param=[1, 0, 255] 
    elif(cmd=="RG"): #remote get
        if(option== "position"): #get position
            param=[17,0]
        elif(option== "status"): #get status
            param=[113,1]
        else:
            return False, []
    elif(cmd=="RE"): #remote execute
        if(option == "up"): #move up
            param=[0,2,255]
        elif(option == "down"): #move down
            param=[0,1,255]
        elif(option == "position"): #go to position stored
            param=[0,9,255]
        else:
            return False, []
    elif(cmd=="RA"): #remote abord
        param=[]
    elif(cmd=="RT"): #rempote transmit
        if(option=="speed"): #speed
            if(data <0):
                data = 0
            elif(data>100):
                data = 100
            param = [4, 0, 26, 48, data, 0]
        elif(option=="position"): #position 
            if(data<0):
                data=0
            elif(data>900):
                data = 900
            param = [6, 0, 33, 48, data%256, (data/256)%256, data/(256*256), 0 ]
    elif(cmd=="RS"):
        param = [0, 255]
    else:
        return False
    
    return True, param





def send_serial(cmd, data):
    
    #command + request parameter
    send = cmd
    for i in data:
        send += chr(i)
        
    #checksum
    crc = crc16.crc16xmodem(send)
    send += chr(crc%256) + chr(crc/256)
    
    #send serial
    ser.write(send)
    
    
    
    
    

def rcv_codes(cmd):
    
    #receive command
    cmd_rcv=ser.read(2)
    
    #assert received the same command
    if(cmd_rcv != cmd):
        return False, "Did not received same command"
    
    #receive reply parameter
    reply=ser.read()
    
    if(reply=='\x06'): #ACK
        return True, "ACK"
    elif(reply=='\x80'): #CSE
        return False, "Checksum error"
    elif(reply=='\x81'): #PDE
        return False, "Parameter data error"
    elif(reply=='\x82'): #PCE
        return False, "Parameter count error"
    elif(reply=='\x83'): #ICE
        return False, "Invalid command error"
    elif(reply=='\x84'): #PE
        return False, "Permission error"
    
    return False, "Did not receive correct communication error or acknowledge codes"






def rcv_data(option):
    
    if(option== "position"):
        data_rcv = ser.read(2)
        if(data_rcv.encode('hex')!= '0400'): #assert we will receive 4 bytes
            print("Wrong reply parameter")
            return False
        data_rcv = ser.read(4)
        data = int(data_rcv[::-1].encode('hex'), 16)*3/5
         
          
    elif(option== "status"):
        data_rcv = ser.read(2)
        if(data_rcv.encode('hex')!= '0100'): #assert we will receive 1 byte
            print("Wrong reply parameter")
            return False
        data_rcv = ser.read()
        data = int(data_rcv.encode('hex'), 16)
    
    else:
        return False, "Wrong option"
            
    
    return True, data  




  
def exch_serial(cmd, option = '', arg= 0):
    
    sucess, param = get_param(cmd, option, arg)
    if(not sucess):
        return False, "Wrong command send"
    
    send_serial(cmd, param)  
    
    success, rcv = rcv_codes(cmd)
    if(not success):
        return False, rcv 
    
    data = ""
    if(cmd=="RG"):
        success, data = rcv_data(option)
    
    
    #get the checksum          
    checksum = ser.read(2)
    
    return success, data



def callback_cmd_lift(data):
    
    pos = data.data
    if(pos>900):
        pos = 900
    elif(pos<0):
        pos = 0

    print("new position goal: " + str(pos))
    global new_goal, pos_goal
    new_goal = True
    pos_goal = pos*5/3
       
    
    
    
def init_serial():
    if(exch_serial("RO")):
        print("Remote Mode open")
    else:
        print("failed to open remote mode")
        exit(1)
        
    if(exch_serial("RC")):
        print("Remote cyclic activated")
    else:
        print("failed to activate remote cyclic")
        exit(1)
    
    sucess, status = exch_serial("RG", "status")
    if(sucess):
        print("status: " + str(status))
    else:
        print("Error communication")
        exit(1)
        
    if(not exch_serial("RT", "speed", 100)):
        print("Error set speed")
        exit(1)
  

def main():
    rospy.init_node('lift_communication', anonymous=True)
    pub_pos = rospy.Publisher('pos_lift', Int16, queue_size=10)
    rospy.Subscriber("cmd_lift", Int16, callback_cmd_lift)

   
    
    rate = rospy.Rate(4) 
    
    init_serial()
    exch_serial("RS")
    

    reach_goal = True
    
    while not rospy.is_shutdown():
        

        if(not exch_serial("RC")): #cyclic 
            break
        
        """
        sucess, data = exch_serial("RG", "position") 
        if(sucess):
            pub_pos.publish(data)
            print("position lift: " + str(data) + " mm")
            sucess
        else:
            break    
        """
        
        #reset movement function if reach final position
        if(not reach_goal):
            sucess, status = exch_serial("RG", "status")
            if(sucess):
                if(not (status&16)): #stop motion -> reach final position
                    exch_serial("RS") #reset function
                    reach_goal=True
            else:
                break
            
            
        #apply new position goal
        global new_goal, pos_goal
        if(new_goal): 
            new_goal = False
            
            if(not reach_goal): #if already in movement reset 
                exch_serial("RS") 
                rate.sleep()
  
                
            reach_goal = False
            
            #set desired position and start function
            exch_serial("RT", "position", pos_goal)  
            rate.sleep()
            exch_serial("RE", "position")    

            
        
        rate.sleep()
        

    #close communication
    exch_serial("RA") 
    ser.close()
    
    
#Enable to quit program with ctrl+c and close all communication
def handler(signum, frame):
    print("Close communication and exit")
    exch_serial("RA")
    ser.close()
    exit(1)
 


if __name__ == '__main__':
    #initialize serial communication
    ser = serial.Serial(port='/dev/ttyUSB0',baudrate=38400,parity=serial.PARITY_NONE,stopbits=serial.STOPBITS_ONE,bytesize=serial.EIGHTBITS)
    print("Connected to serial: " + str(ser.is_open) )
    signal.signal(signal.SIGINT, handler)
    
    new_goal = False
    
    pos_goal = 0
    
    main()