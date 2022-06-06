#!/usr/bin/env python
import rospy
import serial
import crc16

from std_msgs.msg import Int16

def rcv_data_serial():
    data_rcv = []
    while(True):
        data = ser.read()
        print(data, data.encode('hex'))
    return


def rcv_serial(cmd):
    
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


def send_serial(cmd, data):
    
    #command + request parameter
    send = cmd
    for i in data:
        send += chr(i)
        
    #checksum
    crc = crc16.crc16xmodem(send)
    send += chr(crc%256) + chr(crc/256)
    
    #send serial
    #print("data send str: " +send + "  hex: "+ send.encode('hex'))
    ser.write(send)
    
  
  
def exch_serial(cmd, option = ''):
    if(cmd=="RO"):
        param = [0]
    elif(cmd=="RC"):
        param=[1, 0, 255]
    elif(cmd=="RG"):
        if(option== "position"):
            param=[17,0]
        elif(option== "status"):
            param=[113,1]
        else:
            return False
    elif(cmd=="RE"):
        param=[0,9,255]
    else:
        return
    
    send_serial(cmd, param)  
    success, rcv = rcv_serial(cmd)
    print("command " + cmd + " sucess: " + str(success) + " informations: " + rcv)
    
    data = ''
    
    if(cmd=="RG"):
        if(option== "position"):
            data_rcv = ser.read(2)
            if(data_rcv.encode('hex')!= '0400'):
                print("Wrong reply parameter")
                return False

            data_rcv = ser.read(4)
            data = int(data_rcv[::-1].encode('hex'), 16)*900/1500
            print("position lift " + str(data) )    
        elif(option== "status"):
            data_rcv = ser.read(2)
            if(data_rcv.encode('hex')!= '0100'):
                print("Wrong reply parameter")
                return False
            data_rcv = ser.read()
            print("status: " + data_rcv.encode('hex'))
    
    checksum = ser.read(2)
    
    return success, data


def callback(data):
    print(data)
    

def main():
    rospy.init_node('lift_communication', anonymous=True)
    pub_pos = rospy.Publisher('lift_pos', Int16, queue_size=10)
   
    
    rate = rospy.Rate(4) 
    
    
    
    
    
    exch_serial("RO")
    exch_serial("RC")
    #exch_serial("RE")
    
    exch_serial("RG", "status")
    

    
    while not rospy.is_shutdown():
        if(not exch_serial("RC")):
            break
        sucess, data = exch_serial("RG", "position")
        if(sucess):
            pub_pos.publish(data)
            
        
        rate.sleep()
        

    send_serial("RA", [])
    ser.close()

if __name__ == '__main__':
    #initialize serial communication
    ser = serial.Serial(port='/dev/ttyUSB0',baudrate=38400,parity=serial.PARITY_NONE,stopbits=serial.STOPBITS_ONE,bytesize=serial.EIGHTBITS)
    print("Connected to serial: " + str(ser.is_open) )
    main()