from sensor_msgs.msg import Imu
from std_msgs.msg import Float32
import rospy


imuz = 0
def imu_cb(data):
    global imuz 
    imuz = data.orientation.z


# pub= rospy.Publisher("rtabmap/imu",Float32,queue_size=10)
pub = rospy.Publisher("test",Float32,queue_size=10)
rospy.Subscriber("rtabmap/imu",Imu , callback=imu_cb)
rospy.init_node('SUB' , anonymous=True)
r = rospy.Rate(1)
while not rospy.is_shutdown():
    pub.publish(imuz)
    print(imuz)
    r.sleep()
