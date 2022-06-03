#!/usr/bin/env python
import rospy
import serial
import crc16


def rcv_serial(ser):
    n_read = 0
    data_rcv = []
    
    while(n_read < 100):
        data_rcv.append(ser.read())
        n_read+=1
        print(data_rcv)
        if(n_read>3):
            rcv_last = data_rcv[-3:]
            if(rcv_last=="ACK"):
                return True, data_rcv
            elif((rcv_last=="CSE") or (rcv_last=="PDE") or (rcv_last=="PCE") or (rcv_last=="ICE") or (rcv_last=="ICE") or rcv_last[-2:]=="PE" ):
                return False, "Communication error: " + rcv_last
        
    return False, "Did not receive communication error or acknowledge codes"

def main():
    rospy.init_node('lift_communication', anonymous=True)
    
   
    
    rate = rospy.Rate(1) 
    
    ser = serial.Serial(port='/dev/ttyUSB0',baudrate=38400,parity=serial.PARITY_NONE,stopbits=serial.STOPBITS_ONE,bytesize=serial.EIGHTBITS)
    print("Connected to serial: " + str(ser.is_open) )
    
    data = "RO00"
    
    crc = crc16.crc16xmodem(data)
    print(crc)
    
    #data = data + str(crc&0xFF) + str((crc<<8)&0xFF)
    data += str(crc)
    
    print(data)
    
    ser.write(data)
    
    success, rcv = rcv_serial(ser)
    print(success, rcv)
    

    while not rospy.is_shutdown():
        
        
        rate.sleep()
        

    ser.close()

if __name__ == '__main__':
    main()