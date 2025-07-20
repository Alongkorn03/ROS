import serial
from sensor_msgs.msg import Imu
import rospy
import tf.transformations

z = 0
def imu_cb(data):
    global z
    z = data.orientation.x
            
data_list = []
ratio = 0.0045
ser = serial.Serial('/dev/ttyACM0', 57600) 
rospy.Subscriber("rtabmap/imu" , Imu , callback=imu_cb)
rospy.init_node('SUB' , anonymous=True)
r = rospy.Rate(.8)
while not rospy.is_shutdown():
    z = float("%.5f" %z)
    data_list.append(z)
    if len(data_list) >= 2:
        delta = data_list[0] - data_list[1]
        print(data_list , round(delta,5))
        data_list.pop(1)
        ser.write(str(round(delta*10000)).encode())
    # try:
    #     if delta >= 5*ratio or delta <= -5*ratio:
    #         ser.write(delta.encode())
    # except:
    #     pass        
        
    
    r.sleep()


