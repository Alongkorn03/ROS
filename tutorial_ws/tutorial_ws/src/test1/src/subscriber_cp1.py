#!/usr/bin/env python3

import rospy
from test1.msg import messages
def callback(data):
    rospy.loginfo(rospy.get_caller_id() + "Name: %s , ID: %i", data.name , data.id)
def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("chatter", messages, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()
