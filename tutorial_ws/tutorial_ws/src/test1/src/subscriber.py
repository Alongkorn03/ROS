#!/usr/bin/env python3
import rospy
from std_msgs.msg import Float32 , String

class get_val(object):
    def __init__(self):
        rospy.init_node('get_localize', anonymous=True)
        enc_L = rospy.Subscriber("Enc_L" , Float32 , self.encl_callback)
        enc_R = rospy.Subscriber("Enc_R" , Float32 , self.encr_callback)

    def encl_callback(data):
        global encL
        encL = data.data
    
    def encr_callback(data):   
        global encR 
        encR = data.data
    print(encL)
if __name__ == '__main__':
    get_val()
    rospy.spin()

