#!/usr/bin/env python  
import rospy
import tf2_ros
import geometry_msgs.msg
from sensor_msgs.msg import Imu 
from nav_msgs.msg import Odometry 

if __name__ == '__main__':
    rospy.init_node('camera_link_node')
    br = tf2_ros.TransformBroadcaster()
    t = geometry_msgs.msg.TransformStamped()
    t.header.frame_id = "base_link"
    t.child_frame_id = "camera_link"
    rate = rospy.Rate(1.0)
    while not rospy.is_shutdown():
        t.header.stamp = rospy.Time.now()
        t.transform.translation.x =  0.1
        t.transform.translation.y =  0.0
        t.transform.translation.z = 0.2
        t.transform.rotation.x = 0
        t.transform.rotation.y = 0
        t.transform.rotation.z = 0
        t.transform.rotation.w = 1.0
        br.sendTransform(t)
        rate.sleep()
       
