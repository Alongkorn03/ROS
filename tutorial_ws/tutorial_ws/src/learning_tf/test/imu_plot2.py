import numpy as np
import rospy 
import tf2_ros
import geometry_msgs.msg 
from sensor_msgs.msg import Imu 
from nav_msgs.msg import Odometry 
import matplotlib.pyplot as plt
import csv
import pandas as pd

class get_val(object):
    def __init__(self):
        rospy.init_node('get_imu_node' , anonymous= True)
    
    def sub_val():
        rospy.wait_for_message(topic= 'imu/data_raw' , topic_type=Imu)
        
if __name__ == '__main__':
    get_val()
    rospy.spin()