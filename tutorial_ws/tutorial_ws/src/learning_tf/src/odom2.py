#!/usr/bin/env python
from math import sin, cos, pi 
import rospy
import tf2_ros 
import tf_conversions
import tf2_geometry_msgs as tf2_msgs
from nav_msgs.msg import Odometry , Path
from sensor_msgs.msg import Imu 
from std_msgs.msg import Float32 , String
from geometry_msgs.msg import Point, Pose, Quaternion, Twist, Vector3 , PoseStamped

def encl_callback(data):
    global encL
    encL = data.data
    
def encr_callback(data):    
    global encR
    encR = data.data

def odom_cb(data):
    global path
    path.header = data.header
    pose = PoseStamped()
    pose.header = data.header
    pose.pose = data.pose.pose
    path.poses.append(pose)
    path_pub.publish(path)

odom_q = 0
path = Path()
rospy.init_node('odometry_publisher')
odom_pub = rospy.Publisher("odom", Odometry, queue_size=50)
enc_L = rospy.Subscriber("Enc_L" , Float32 , encl_callback)
enc_R = rospy.Subscriber("Enc_R" , Float32 , encr_callback)
odom_sub = rospy.Subscriber('/odom', Odometry, odom_cb)
path_pub = rospy.Publisher('/path', Path, queue_size=10)
odom_broadcaster = tf2_ros.TransformBroadcaster()

x = 0.0
y = 0.0
th = 0.0
encL = 0
encR = 0
encL_old = 0
encR_old = 0
tL = 0
tR = 0
current_time = rospy.Time.now()
last_time = rospy.Time.now()
DistancePerCount = (3.14159265 * 0.15) / 1440

r = rospy.Rate(50.0)
while not rospy.is_shutdown():
    current_time = rospy.Time.now() #กำหนดให้ current_time คือการเก็บเวลาที่โปรแกรมเริ่มทำงาน
    dist_L = (encL - encL_old)*DistancePerCount #กำหนดให้ dist_L คือระยะทางที่ encoder ล้อซ้ายทำการเคลื่อนที่
    dist_R = (encR - encR_old)*DistancePerCount #กำหนดให้ dist_R คือระยะทางที่ encoder ล้อขวาทำการเคลื่อนที่
    dist = (dist_L + dist_R) * 0.5 #กำหนดให้ dist คือระยะทางเฉลี่ยที่หุ่นยนต์เคลื่อนที่ได้
    rota = (dist_L - dist_R) / 0.4 #กำหนดให้ rota คือมุมที่หุ่นยนต์กำลังเคลื่ิอนที่
    encR_old = encR #กำหนดให้ encR_old คือระยะทางที่ encoder ล้อขวาเคลื่อนที่
    encL_old = encL #กำหนดให้ encL_old คือระยะทางที่ encoder ล้อซ้ายเคลื่อนที่
    dt = (current_time - last_time).to_sec() #กำหนดให้ dt คือผลต่างเวลาต่อ 1 รอบโปรแกรม
    delta_x = dist * cos(th + (rota/2)) #กำหนดให้ delta_x คือผลต่างระยะทางในแกน x ต่อ 1 รอบโปรแกรม
    delta_y = dist * sin(th + (rota/2)) #กำหนดให้ delta_y คือผลต่างระยะทางในแกน y ต่อ 1 รอบโปรแกรม
    delta_th = rota #กำหนดให้ delta_th คือผลต่างมุมการเคลื่อนที่ของหุ่นยนต์ต่อ 1 รอบโปรแกรม
    x += delta_x #กำหนดให้ x คือระยะทางที่หุ่นยนต์เคลื่อนที่ในแกน x
    y += delta_y #กำหนดให้ y คือระยะทางที่หุ่นยนต์เคลื่อนที่ในแกน y
    th += delta_th #กำหนดให้ th คือมมที่หุ่นยนต์เคลื่อนที่รอบแกน z
    vx = delta_x / dt #กำหนดให้ vx คือความเร็วเชิงเส้นที่หุ่นยนต์เคลื่อนที่ในแกน x
    vy = delta_y / dt #กำหนดให้ vy คือความเร็วเชิงเส้นที่หุ่นยนต์เคลื่อนที่ในแกน y 
    odom_quat = tf_conversions.transformations.quaternion_from_euler(0, 0, th)
    #กำหนดให้ odom_quat คือมุมในรูปแบบ Quaternion ที่หุ่นยนต์เคลื่อนที่
    odom_trans = tf2_ros.TransformStamped() #เปิดใช้งาน TransformStamped (การเคลื่อนที่สะสม) โดยเก็บไว้ในตัวแปร odom_trans
    odom_trans.header.stamp = current_time #สร้าง header ให้กับ wheel_odometry
    odom_trans.header.frame_id = "odom" #กำหนด frame_id ให้กับ wheel_odometry
    odom_trans.child_frame_id = "base_link" #กำหนด child_id ให้กับ Wheel_odometry
    odom_trans.transform.translation.x = x  #ทำการส่งออกการเคลื่อนที่เชิงเส้นในแกน x ให้กับ wheel_odometry
    odom_trans.transform.translation.y = y  #ทำการส่งออกการเคลื่อนที่เชิงเส้นในแกน y ให้กับ wheel_odometry
    odom_trans.transform.translation.z = 0 #ทำการส่งออกการเคลื่อนที่เชิงเส้นในแกน z ให้กับ wheel_odometry
    odom_trans.transform.rotation.x = odom_quat[0] #ทำการส่งออกการเคลื่อนที่เชิงมุมในแกน x ให้กับ wheel_odometry
    odom_trans.transform.rotation.y = odom_quat[1] #ทำการส่งออกการเคลื่อนที่เชิงมุมในแกน y ให้กับ wheel_odometry
    odom_trans.transform.rotation.z = odom_quat[2] #ทำการส่งออกการเคลื่อนที่เชิงมุมในแกน z ให้กับ wheel_odometry
    odom_trans.transform.rotation.w = odom_quat[3] #ทำการส่งออกการเคลื่อนที่เชิงมุมในแกน w ให้กับ wheel_odometry
    odom_broadcaster.sendTransform(odom_trans) #ทำการส่งออกการเคลื่อนที่
    odom = Odometry() #เปิดใช้งาน odometry ผ่านตัวแปร odom
    odom.header.stamp = current_time #สร้าง header ให้กับ wheel_odometry
    odom.header.frame_id = "odom" #กำหนด frame_id ให้กับ wheel_odometry
    odom.pose.pose = Pose(Point(x, y, 0), Quaternion(*odom_quat)) #ทำการส่งออกท่าทางและมุม
    odom.child_frame_id = "base_link" #กำหนด child_id ให้กับ Wheel_odometry
    odom.twist.twist = Twist(Vector3(delta_x/dt, delta_y/dt, 0), Vector3(0, 0, delta_th/dt)) 
    #ทำการส่งออกค่าความเร็วเชิงเส้นและความเร็วเชิงมุม
    odom_pub.publish(odom) #ทำการส่งออก wheel_odometry
    last_time = current_time #กำหนดให้ last_time เท่ากับ current_time
    r.sleep() #จบการทำงาน 1 รอบโปรแกรม
    

