#!/usr/bin/env python

import math
from math import sin, cos, pi

import rospy
import tf2_ros 
import tf_conversions
import tf2_geometry_msgs as tf2_msgs
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Imu 
from std_msgs.msg import Float32 , String
from geometry_msgs.msg import Point, Pose, Quaternion, Twist, Vector3 , TransformStamped
import numpy as np
from scipy.signal import filtfilt, butter

def imu_callback(msg):
    linear_acc = msg.linear_acceleration
    angular_vel = msg.angular_velocity
    return linear_acc , angular_vel

def encl_callback(data):
    global encL
    encL = data.data
    
def encr_callback(data):    
    global encR
    encR = data.data

rospy.init_node('odometry_publisher')
odom_pub = rospy.Publisher("odom", Odometry, queue_size=50)
imu_sub = rospy.Subscriber("/imu/data_raw", Imu , imu_callback)
enc_L = rospy.Subscriber("Enc_L" , Float32 , encl_callback)
enc_R = rospy.Subscriber("Enc_R" , Float32 , encr_callback)
odom_broadcaster = tf2_ros.TransformBroadcaster()

x = 0.0
y = 0.0
th = 0.0
linear_acc = 0
angular_vel = 0
encL = 0
encR = 0
encL_old = 0
encR_old = 0
    
current_time = rospy.Time.now()
last_time = rospy.Time.now()
DistancePerCount = (3.14159265 * 0.06 * 2.54) / 1440

r = rospy.Rate(1.0)
while not rospy.is_shutdown():
    current_time = rospy.Time.now()
    dist_L = (encL - encL_old)*DistancePerCount
    dist_R = (encR - encR_old)*DistancePerCount
    dist = (dist_L + dist_R) * 0.5
    rota = (dist_L - dist_R) / 0.4 # 0.4 is distance between any whells
        
    encL_old = encL
    encR_old = encR

        # compute odometry in a typical way given the velocities of the robot
    dt = (current_time - last_time).to_sec()
    delta_x = dist * cos(th + (rota/2))
    delta_y = dist * sin(th + (rota/2))
    delta_th = rota

    x += delta_x
    y += delta_y
    th += delta_th
    
    # print("X-axis :" , end='') 
    # print(rota)
    # print("Theta : " , end='')
    # print()

        # since all odometry is 6DOF we'll need a quaternion created from yaw
    odom_quat = tf_conversions.transformations.quaternion_from_euler(0, 0, th)
    odom_trans = tf2_ros.TransformStamped()
    
    odom_trans.header.stamp = current_time
    odom_trans.header.frame_id = "odom"
    odom_trans.child_frame_id = "base_link"
    odom_trans.transform.translation.x = x
    odom_trans.transform.translation.y = y
    odom_trans.transform.translation.z = 0
    odom_trans.transform.rotation.x = odom_quat[0]
    odom_trans.transform.rotation.y = odom_quat[1]
    odom_trans.transform.rotation.z = odom_quat[2]
    odom_trans.transform.rotation.w = odom_quat[3]

        # first, we'll publish the transform over tf
    odom_broadcaster.sendTransform(odom_trans)
        # next, we'll publish the odometry message over ROS
    odom = Odometry()
    odom.header.stamp = current_time
    odom.header.frame_id = "odom"

        # set the position
    odom.pose.pose = Pose(Point(x, y, 0.), Quaternion(*odom_quat))
        # set the velocity
    odom.child_frame_id = "base_link"
    odom.twist.twist = Twist(Vector3(delta_x/dt, delta_y/dt, 0), Vector3(0, 0, delta_th/dt))
    
        # set the orientation 
    # odom.pose.pose.orientation = (odom_quat[0],odom_quat[1],odom_quat[2],odom_quat,odom_quat[3])

        # publish the message
    odom_pub.publish(odom)
    last_time = current_time
    r.sleep()

