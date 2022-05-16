""" Send odom position from ROS to simulink (not same network) """

import socket
import struct


def main():

    #Receive socket (from ROS program)
    receive_PORT = 5000
    receiveSock=socket.socket(socket.AF_INET,socket.SOCK_DGRAM,0)
    receiveAddr=('',receive_PORT)
    receiveSock.bind(receiveAddr)

    
    #Send socket (to simulink)
    send_IP = "192.168.65.38"
    send_PORT = 5001
    sendSock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    
    while True:
        data, addr = receiveSock.recvfrom(1024) 
        #print(struct.unpack('<3f', data))
        sendSock.sendto(data, (send_IP, send_PORT))
        
    

if __name__ == '__main__':
    main()