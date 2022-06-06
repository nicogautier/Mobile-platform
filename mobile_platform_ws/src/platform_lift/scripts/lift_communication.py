#!/usr/bin/env python
import rospy
import serial
import crc16

def rcv_data_serial(ser):
    data_rcv = []
    return


def rcv_serial(ser, cmd):
    
    #receive command
    cmd_rcv = ''
    cmd_rcv+=ser.read()
    cmd_rcv+=ser.read()
    print("received command: " + cmd_rcv)
    
    #assert received the same command
    if(cmd_rcv != cmd):
        return False, "Did not received same command"
    
    #receive reply parameter
    reply=ser.read()
    print("reply: " + reply +" "+ reply.encode('hex'))
    
    if(reply=='\x06'): #ACK
        data = rcv_data_serial(ser)
        return True, data
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


def send_serial(ser, cmd, data):
    
    #little endian data
    data = data[::-1]
    
    #command + request parameter
    send = cmd
    for i in data:
        send += chr(i)
        
    #checksum
    crc = crc16.crc16xmodem(send)
    print("checksum: " + str(crc))
    send += chr(crc%256) + chr(crc/256)
    
    #send serial
    print("data send str: " +send + "  hex: "+ send.encode('hex'))
    ser.write(send)
    
    

def main():
    rospy.init_node('lift_communication', anonymous=True)
    
   
    
    rate = rospy.Rate(1) 
    
    #initialize serial communication
    ser = serial.Serial(port='/dev/ttyUSB0',baudrate=38400,parity=serial.PARITY_NONE,stopbits=serial.STOPBITS_ONE,bytesize=serial.EIGHTBITS)
    print("Connected to serial: " + str(ser.is_open) )
    
    
    
    cmd ="RO"
    send_serial(ser, "RO", [0])


    success, rcv = rcv_serial(ser, cmd)
    print(success, rcv)
    

    #while not rospy.is_shutdown():
    #    rate.sleep()
        

    ser.close()

if __name__ == '__main__':
    main()