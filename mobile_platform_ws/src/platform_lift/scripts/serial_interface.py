#!/usr/bin/env python


""" ===================== serial_interface.py ====================
This program implements an interface to use serial communication functions developped in serial_communication.py

==================================================================="""
from serial_communication import *
import signal
import os




    


def close_serial(ser):
    exch_serial(ser,"RA") 
    ser.close()
    

def get_pos_A1(ser):
    sucess, pos = exch_serial(ser,"RG", "position",0) 
    if(sucess):
        return pos
    else:
        close_serial(ser)
        return -1



def get_pos_A2(ser):
    sucess, pos = exch_serial(ser, "RG", "position",1) 
    if(sucess):
        return pos
    else:
        close_serial(ser)
        return -1
    


def get_pos(ser):
    pos1 = get_pos_A1(ser)
    pos2 = get_pos_A2(ser)
    if((pos1==-1) or (pos2==-1)):
        return -1
    return pos1 + pos2



def set_pos_A1(ser, pos):
    if(not exch_serial(ser,"RT", "position_A1", pos)):
        close_serial(ser)
        return False
    return True



def set_pos_A2(ser, pos):
    if(not exch_serial(ser,"RT", "position_A2", pos)):
        close_serial(ser)
        return False
    return True



def set_pos(ser,pos):
    if(not set_pos_A1(ser,pos/2)):
        return False
    if(not set_pos_A2(ser,pos/2)):
        return False
    return True



def start_move_A1(ser):
    if(not exch_serial(ser,"RE", "position_A1") ):
        close_serial(ser)
        return False
    return True
    
    
    
def start_move_A2(ser):
    if(not exch_serial(ser,"RE", "position_A2") ):
        close_serial(ser)
        return False
    return True   



def start_move(ser):
    if(not start_move_A1(ser)):
        return False
    if(not start_move_A2(ser)):
        return False
    return True



def reset_move_A1(ser):
    if(not exch_serial(ser,"RS", "A1") ):
        close_serial(ser)
        return False
    return True



def reset_move_A2(ser):
    if(not exch_serial(ser,"RS", "A2") ):
        close_serial(ser)
        return False
    return True



def reset_move(ser):
    if(not reset_move_A1(ser)):
        return False
    if(not reset_move_A2(ser)):
        return False
    return True



def move_pos_A1(ser, pos):
    if(not set_pos_A1(ser, pos)):
        return False
    if(not start_move_A1(ser)):
        return False
    return True



def move_pos_A2(ser, pos):
    if(not set_pos_A2(ser, pos)):
        return False
    if(not start_move_A2(ser)):
        return False
    return True



def move_pos(ser, pos):
    if(not set_pos(ser, pos)):
        return False
    if(not start_move(ser)):
        return False
    return True


def reach_pos_A1(ser):
    sucess, status = exch_serial(ser,"RG", "status", 0)
    if(sucess):
        if(not (status&16)): #stop motion -> reach final position
            return True
        
    return False


def reach_pos_A2(ser):
    sucess, status = exch_serial(ser,"RG", "status", 1)
    if(sucess):
        if(not (status&16)): #stop motion -> reach final position
            return True
        
    return False



def send_cyclic(ser):
    if(not exch_serial(ser,"RC") ):
        close_serial(ser)
        return False
    return True
    
    

def init_serial():
    #create serial communication
    ser = serial.Serial(port='/dev/ttyUSB0',baudrate=38400,parity=serial.PARITY_NONE,stopbits=serial.STOPBITS_ONE,bytesize=serial.EIGHTBITS)
    print("Connected to serial: " + str(ser.is_open) )
    
    #enable to use ctrl-C to leave program and close communication
    def handler(signum, frame):
        print("Close communication and exit")
        send_serial(ser, "RA", [])
        ser.close()
        os._exit(1)
        
        
    signal.signal(signal.SIGINT, handler)

    
    init_serial_communication(ser)
    reset_move(ser)
    
    return ser