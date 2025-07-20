#!/usr/bin/env python3
import rospy 
from learning_tf.msg import Num
from std_msgs.msg import Float32



def vel_cb(data):
    vrb = data.data
    print("RPM Robot: " , vrb)

def angle_cb(data):
    arb = data.data
    print("Angle Robot" , arb)

def encl_cb(data):
    enc = data.data
    print("Left Encoder: " , enc)

def encr_cb(data):
    enc = data.data
    print("Right Encoder: " , enc)
    print('---------------------------------------')




def listen():
    rospy.init_node('SUB' , anonymous=True)
    rospy.Subscriber('Rpm_RB' , Float32, queue_size=10,callback=vel_cb)
    rospy.Subscriber('Angle_RB' , Float32, queue_size=10,callback=angle_cb)
    rospy.Subscriber('Enc_L' , Float32, queue_size=10,callback=encl_cb)
    rospy.Subscriber('Enc_R' , Float32, queue_size=10,callback=encr_cb)
    
    rospy.spin()

if __name__ == '__main__':
    listen()
    

