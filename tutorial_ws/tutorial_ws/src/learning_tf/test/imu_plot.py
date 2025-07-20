import rospy
from learning_tf.msg import Num
from std_msgs.msg import Float32
def cb(data):
    rospy.loginfo(data.data)
    
def listen():
    pub = rospy.Publisher( 'Data', Num , queue_size=10)
    encl = rospy.Subscriber('Enc_L' ,Float32 )
    encr = rospy.Subscriber('Enc_R' ,Float32)
    vr = rospy.Subscriber('Rpm_RB' ,Float32)
    rospy.init_node('Test_data' , anonymous=True)
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        msg = Num()
        msg.encl =  encl
        msg.eclr = encr
        msg.vr = vr
        pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    listen()
    