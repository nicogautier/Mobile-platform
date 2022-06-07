#!/usr/bin/env python
import rospy
import serial
import crc16

from std_msgs.msg import Int16




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





def rcv_datas(cmd, option):
    data = ''
    
    #get the datas if there is one
    if(cmd=="RG"):
        if(option== "position"):
            data_rcv = ser.read(2)
            if(data_rcv.encode('hex')!= '0400'): #assert we will receive 4 bytes
                print("Wrong reply parameter")
                return False
            data_rcv = ser.read(4)
            data = int(data_rcv[::-1].encode('hex'), 16)*900/1500
            print("position lift " + str(data) )  
              
        elif(option== "status"):
            data_rcv = ser.read(2)
            if(data_rcv.encode('hex')!= '0100'): #assert we will receive 1 byte
                print("Wrong reply parameter")
                return False
            data_rcv = ser.read()
            data = int(data_rcv.encode('hex'), 16)
            print("status: " + str(data))
            
              
    checksum = ser.read(2)
    return True, data  




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
    
    
    
    
    
def get_param_from_command(cmd, option): 
    if(cmd=="RO"): #open remote mode
        param = [0] 
    elif(cmd=="RC"): #remote cyclic
        param=[1, 0, 255] 
    elif(cmd=="RG"):
        if(option== "position"): #get position
            param=[17,0]
        elif(option== "status"): #get status
            param=[113,1]
        else:
            return False
    elif(cmd=="RE"): #move
        param=[0,9,255]
    else:
        return False
    
    return True, param




  
def exch_serial(cmd, option = ''):
    
    sucess, param = get_param_from_command(cmd, option)
    if(not sucess):
        return False, "Wrong command send"
    
    send_serial(cmd, param)  
    
    success, rcv = rcv_codes(cmd)
    print("command " + cmd + " sucess: " + str(success) + " informations: " + rcv)
    if(not success):
        return False, rcv 
    
    
    success, data = rcv_datas(cmd, option)
    return success, data





    

def main():
    rospy.init_node('lift_communication', anonymous=True)
    pub_pos = rospy.Publisher('lift_pos', Int16, queue_size=10)
   
    
    rate = rospy.Rate(4) 
    
    
    
    
    
    exch_serial("RO")
    exch_serial("RC")
    #exch_serial("RE")
    
    exch_serial("RG", "status")
    
    
    

    
    """while not rospy.is_shutdown():
        if(not exch_serial("RC")):
            break
        sucess, data = exch_serial("RG", "position")
        if(sucess):
            pub_pos.publish(data)
            
        
        rate.sleep()"""
        

    send_serial("RA", [])
    ser.close()

if __name__ == '__main__':
    #initialize serial communication
    ser = serial.Serial(port='/dev/ttyUSB0',baudrate=38400,parity=serial.PARITY_NONE,stopbits=serial.STOPBITS_ONE,bytesize=serial.EIGHTBITS)
    print("Connected to serial: " + str(ser.is_open) )
    main()