import rospy
import tf
from geometry_msgs.msg import PointStamped

    class MyNode:
        def __init__(self):

            self.tl = tf.TransformListener()
            rospy.Subscriber("/sometopic", PointStamped, self.some_message_handler)
            

        def some_message_handler(self, point_stamped):

            # want to work on the point in the "world" frame
            point_in_world = self.tl.transformPoint("world", point_stamped)