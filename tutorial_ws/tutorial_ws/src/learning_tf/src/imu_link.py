#!/usr/bin/env python  
import rospy
import tf2_ros
import geometry_msgs.msg
from sensor_msgs.msg import Imu 
from nav_msgs.msg import Odometry 

def imu_callback(msg):
    global orient
    orient = msg.orientation

imu_sub = rospy.Subscriber("/imu/data",Imu,imu_callback)
if __name__ == '__main__':
    orient = 0
    rospy.init_node('imu_link_node')
    br = tf2_ros.TransformBroadcaster()
    t = geometry_msgs.msg.TransformStamped()
    t.header.frame_id = "base_link"
    t.child_frame_id = "imu_link"
    rate = rospy.Rate(1.0)
    while not rospy.is_shutdown():
        t.header.stamp = rospy.Time.now()
        t.transform.translation.x =  0.5
        t.transform.translation.y =  0.0
        t.transform.translation.z = 0.6
        t.transform.rotation.x = orient.x
        t.transform.rotation.y = orient.y
        t.transform.rotation.z = orient.z
        t.transform.rotation.w = orient.w
        br.sendTransform(t)
        rate.sleep()
