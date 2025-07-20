#!/usr/bin/env python3
import rospy
from test1.msg import messages # change name of package , message's package
def talker():
    pub = rospy.Publisher('chatter', messages, queue_size=10) # change type of data
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
    	
        name = 'Test'                             # change output and data
        id = 10                                   #
        pub_data = messages(name = name, id = id) #
        rospy.loginfo(pub_data)
        pub.publish(pub_data)
        rate.sleep()
if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
